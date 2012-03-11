unit MenuAdminView;
interface
uses Messages, SysUtils, Classes, Forms, Graphics, Buttons, Menus, ExtCtrls,
     ComCtrls, Controls, ImgList, StdCtrls, CustomView;
type
  TFormMenuAdmin = class(TCustomView)
    LabelEnterprises: TLabel;
    LabelUsers: TLabel;
    LabelProfiles: TLabel;
    LabelUserProfiles: TLabel;
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LabelEnterprisesMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
  private
    function  AnyFormEditing:Boolean;
    procedure WMSysCommand(var Message :TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMClose     (var Message :TWMClose     ); message WM_CLOSE;
    procedure ShowErrorMessage(prmErrorMessage :string);
  public
  end;

implementation

uses Dialogs, Windows;
{$R *.dfm}

function TFormMenuAdmin.AnyFormEditing:Boolean;
var i       :Integer;
    j       :Integer;
    locForm :TForm;
begin
   Result := False;
   for i := 0 to MDIChildCount - 1 do begin
       locForm := MDIChildren[i];
       for j := 0 to locForm.ComponentCount - 1 do begin
           //if locForm.Components[j] is TccFormHandler then begin
           //   if TccFormHandler(locForm.Components[j]).Mode = fmEditing then Result := True;
           //end;
           if Result then Break;
       end;
   end;
end;

procedure TFormMenuAdmin.WMSysCommand(var Message: TWMSysCommand);
begin
   if (Message.CmdType and $FFF0 = SC_MINIMIZE) and
      (AnyFormEditing) then Exit
                       else inherited;
end;

procedure TFormMenuAdmin.WMClose(var Message: TWMClose);
begin
   if AnyFormEditing then Exit
                     else Close;
end;

procedure TFormMenuAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //{$IFNDEF _CONSOLE_TESTRUNNER}
   //// este primer if detecta si Delphi o C++Builder está siendo ejecutado.
   //if FindWindow('TAppBuilder', nil) <> 0 then begin
   //   //DM.DropTemporalDirectory;
   //   Application.Terminate;
   //end
   //else begin
   //   if MessageDlg('¿Desea realmente salir de la aplicación?',
   //                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
   //      //ShowMessage(DM.PathTemporal);
   //      //DM.DropTemporalDirectory;
   //      Application.Terminate;
   //   end
   //   else Abort;
   //end;
   //{$ELSE}
   ////Action := caFree;
   //{$ENDIF}
end;

procedure TFormMenuAdmin.ShowErrorMessage(prmErrorMessage :string);
begin
   //StatusBar.Font.Color := clRed;
   //StatusBar.Font.Style := [fsBold];
   //StatusBar.Panels[1].Text := '      '+prmErrorMessage;
   MessageBeep(MB_ICONHAND);
   //Timer.Enabled := True;
end;

procedure TFormMenuAdmin.TimerTimer(Sender: TObject);
begin
   //StatusBar.Panels[1].Text := '';
   //Timer.Enabled := False;
end;

procedure TFormMenuAdmin.LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   LabelEnterprises.Font.Style  := [];
   LabelUsers.Font.Style        := [];
   LabelProfiles.Font.Style     := [];
   LabelUserProfiles.Font.Style := [];
   TLabel(Sender).Font.Style    := [fsUnderline];
end;

procedure TFormMenuAdmin.LabelEnterprisesMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Style := [];
end;

procedure TFormMenuAdmin.FormShow(Sender: TObject);
begin
   Self.Top  := 0;
   Self.Left := 0;
end;

end.
