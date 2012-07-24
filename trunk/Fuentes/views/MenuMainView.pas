unit MenuMainView;
interface
uses Messages, SysUtils, Classes, Forms, Graphics, Buttons, Menus, ExtCtrls,
     ComCtrls, Controls, ImgList, StdCtrls, CustomView;
type
  TFormMenuMain = class(TCustomView)
    LabelEnterprises: TLabel;
    LabelUsers: TLabel;
    LabelUserProfiles: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LabelEnterprisesMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
  private
    function  AnyFormEditing:Boolean;
    procedure WMSysCommand(var Message :TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMClose     (var Message :TWMClose     ); message WM_CLOSE;
  public
  end;

implementation

uses Dialogs, Windows;
{$R *.dfm}

function TFormMenuMain.AnyFormEditing:Boolean;
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

procedure TFormMenuMain.WMSysCommand(var Message: TWMSysCommand);
begin
   if (Message.CmdType and $FFF0 = SC_MINIMIZE) and
      (AnyFormEditing) then Exit
                       else inherited;
end;

procedure TFormMenuMain.WMClose(var Message: TWMClose);
begin
   if AnyFormEditing then Exit
                     else Close;
end;

procedure TFormMenuMain.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFormMenuMain.LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   LabelEnterprises.Font.Style  := [];
   LabelUsers.Font.Style        := [];
   LabelUserProfiles.Font.Style := [];
   TLabel(Sender).Font.Style    := [fsUnderline];
end;

procedure TFormMenuMain.LabelEnterprisesMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Style := [];
end;

procedure TFormMenuMain.FormShow(Sender: TObject);
begin
   Self.Top  := 0;
   Self.Left := 0;
end;

end.
