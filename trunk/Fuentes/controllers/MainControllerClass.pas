unit MainControllerClass;

interface

uses Classes, StdCtrls, SysUtils,
     DBController,
     LoginController,               
     ConfigurationClass,
     MenuAdminController;

type
  TMainController = class
  private
    FDBMainController   :TDBController;
    FLoginController    :TLoginController;
    FConfiguration      :TConfiguration;
    //FMainMenu           :TMainMenuController;
    FMenuAdmin          :TMenuAdminController;
    procedure ShowMainMenu;
    procedure ShowMenuAdmin;
  protected

  public
     constructor Create();
     destructor  Destroy(); override;
     property Configuration :TConfiguration read FConfiguration;
     property DBMain        :TDBController  read FDBMainController;
     procedure Run;
  end;

implementation

uses Controls, Dialogs;

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
         msAdmin :ShowMenuAdmin;
         msMain  :ShowMainMenu;
      end; // case
   finally
   end;
end;

procedure TMainController.ShowMainMenu;
begin
  //FMainMenu := TMainMenuController.Create();
  //FMainMenu.DBController := DBMainController;
  //FMainMenu.ShowView;
end;

procedure TMainController.ShowMenuAdmin;
begin
   FMenuAdmin := TMenuAdminController.Create(FDBMainController);
   FMenuAdmin.ShowView;
end;


end.


