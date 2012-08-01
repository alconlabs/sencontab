unit MainControllerClass;

interface

uses Classes, StdCtrls, SysUtils, Windows,
     DBController,
     LoginController,
     ConfigurationClass,
     MenuAdminController,
     MenuMainController,
     EnterprisesListController,
     UserClass,
     CurrentConfigClass;

type
  TMainController = class
  private
    FDBMainController   :TDBController;
    FLoginController    :TLoginController;
    FConfiguration      :TConfiguration;
    FMenuMain           :TMenuMainController;
    FEnterprisesList    :TEnterprisesListController;
    FMenuAdmin          :TMenuAdminController;
    procedure ShowMenuMain(prmUser :TUser);
    procedure ShowMenuAdmin(prmUser :TUser);
    function WHCmdToStr(cmd: Integer): String;
  protected

  public
     FPopupXY: TPoint;
     constructor Create();
     destructor  Destroy(); override;
     property Configuration :TConfiguration read FConfiguration;
     property DBMain        :TDBController  read FDBMainController;
     procedure Run;
     function OnHelp_HelpHook(Command : Word; Data : Longint; Var CallHelp : Boolean) : Boolean;
  end;

implementation

uses Controls, Dialogs, ShellAPI, Forms,
     MenuPrincipal, DM, DMConta;

constructor TMainController.Create();
begin
   inherited;
   FConfiguration := TConfiguration.Create();
end;

destructor TMainController.Destroy();
begin
   FConfiguration.Free;
   inherited;
end;

{ All application help calls to help come here }
function TMainController.OnHelp_HelpHook(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
var s: String;
    fn, params: String;
begin
   {Your code here...}
   CallHelp := false;
   case Command of
      Help_KEY: begin  //Keyword
         //if PChar(Data) = 'Test' then ShowMessage('Test');
         fn := 'http://www.sencille.es/wikisencille/index.php?title='+PChar(Data); //ExtractFilePath(ParamStr(0)) + 'readme.txt';
         params := '';
         if ShellAPI.ShellExecute(Screen.ActiveForm.Handle, 'open',
           PChar(fn), PChar(params), nil, SW_SHOWDEFAULT) <= 32 then
           ShowMessage('Fué Imposible abrir el navegador con la ayuda '#13+fn);
      end;
      Help_Context: begin      //help button
          //Call show contex help cmd - data = Context ID
      end;
      HELP_SETPOPUP_POS: begin //call #1 of F1 Popup (Whats This) help
        FPopupXY := SmallPointToPoint(TSmallPoint(Data));           //data = x,y pos for popup
      end;
      Help_ContextPopup:begin //call #2 of F1 Popup (Whats This) help
          //Call popup code - data = Context ID, Popup X-Y pos = FPopupXY.X, FPopupXY.Y
      end;
      HELP_CONTENTS: begin
          //Show Table of contents
      end
      else begin
        CallHelp := TRUE; //Default handling - WinHelp
      end;
   end;
   
   Result := TRUE;


   s := WHCmdToStr(Command); //Dangerous to show debug on an invisible window
   // ccill
   //if not Showing then exit;
   {Debug to Memo}
   case command of
    HELP_COMMAND, HELP_KEY, HELP_PARTIALKEY:;  //data is a string
        //ShowMessage( Format('%s, data = %d, data as string = %s', [s, Data, PChar(Data)]));
        //Memo1.Lines.Add(format('%s, data = %d, data as string = %s',[s, data, PChar(data)]));
    HELP_SETPOPUP_POS: //call #1 of F1 Popup (Whats This) help
      begin
        FPopupXY := SmallPointToPoint(TSmallPoint(Data));           //data = x,y pos for popup
        //ShowMessage(Format('%s, data = %d (%d, %d)', [s, data, FPopupXY.X, FPopupXY.Y]));
        //Memo1.Lines.Add(format('%s, data = %d (%d, %d)',[s, data, FPopupXY.X, FPopupXY.Y]));
      end;
   else
      //ShowMessage(Format('%s, data = %d', [s, data]));
      //Memo1.Lines.Add(format('%s, data = %d',[s, data]));
   end;
end;

procedure TMainController.Run;
begin
   FDBMainController := TDBController.Create(FConfiguration.DBConfig);
   try
     FDBMainController.OpenConnection;
   except
       {This try except unhandled is necessary. Don't remove this comment or this empty structure.}
   end;

   if not FDBMainController.IsConnected then begin
      MessageDlg('Error : No se puede conectar con la base de datos de Control.', mtInformation, [mbOK], 0);
      Exit;
   end;

   FLoginController := TLoginController.Create(DBMain);
   try
      case FLoginController.ShowView of
         msNone  :{If the result is False the program begins down normaly };
         msAdmin :ShowMenuAdmin(FLoginController.UserAuthenticated);
         msMain  :ShowMenuMain(FLoginController.UserAuthenticated);
      end; // case
   finally
      FLoginController.Free;
   end;
end;

procedure TMainController.ShowMenuMain(prmUser :TUser);
var EnterpriseSelected :Boolean;
    CD_ENTERPRISE      :string;
    CD_PROFILE         :string;
begin
   FEnterprisesList := TEnterprisesListController.Create(DBMain, prmUser);
   try
      EnterpriseSelected := FEnterprisesList.ShowView;
      if EnterpriseSelected then begin
         CD_ENTERPRISE := FEnterprisesList.CD_ENTERPRISE;
         CD_PROFILE    := FEnterprisesList.CD_PROFILE   ;
      end;
   finally
      FEnterprisesList.Free;
   end;

   if EnterpriseSelected then begin
      FMenuMain := TMenuMainController.Create(DBMain, prmUser, CD_ENTERPRISE, CD_PROFILE, 'ACCOUNTING');
      Application.CreateForm(TDMRef, DMRef);
      Application.CreateForm(TDMContaRef, DMContaRef);
      //Application.CreateForm(TFormPrincipal, FormPrincipal);
      FMenuMain.ShowView;
      //FormPrincipal.Show;
      Application.Run;
   end
   else Exit;
end;

procedure TMainController.ShowMenuAdmin(prmUser :TUser);
begin
   FMenuAdmin := TMenuAdminController.Create(FDBMainController, prmUser);
   FMenuAdmin.ShowView;
   Application.Run;
end;

function TMainController.WHCmdToStr(cmd: Integer): String;
begin
  Result := '';
  case cmd of
    HELP_CONTEXT:                 Result := 'HELP_CONTEXT';
    HELP_QUIT:                    Result := 'HELP_QUIT';
    HELP_INDEX:                   Result := 'HELP_INDEX or HELP_CONTENTS';
    HELP_HELPONHELP:              Result := 'HELP_HELPONHELP';
    HELP_SETINDEX:                Result := 'HELP_SETINDEX or HELP_SETCONTENTS';
    HELP_CONTEXTPOPUP:            Result := 'HELP_CONTEXTPOPUP';
    HELP_FORCEFILE:               Result := 'HELP_FORCEFILE';
    HELP_KEY:                     Result := 'HELP_KEY';
    HELP_COMMAND:                 Result := 'HELP_COMMAND';
    HELP_PARTIALKEY:              Result := 'HELP_PARTIALKEY';
    HELP_MULTIKEY:                Result := 'HELP_MULTIKEY';
    HELP_SETWINPOS:               Result := 'HELP_SETWINPOS';
    HELP_CONTEXTMENU:             Result := 'HELP_CONTEXTMENU';
    HELP_FINDER:                  Result := 'HELP_FINDER';
    HELP_WM_HELP:                 Result := 'HELP_WM_HELP';
    HELP_SETPOPUP_POS:            Result := 'HELP_SETPOPUP_POS';
    HELP_TCARD:                   Result := 'HELP_TCARD';
    HELP_TCARD_DATA:              Result := 'HELP_TCARD_DATA';
    HELP_TCARD_OTHER_CALLER:      Result := 'HELP_TCARD_OTHER_CALLER';
  else
    Result := IntToStr(cmd);
  end;
  Result := 'Command = ' + Result;
end;


end.


