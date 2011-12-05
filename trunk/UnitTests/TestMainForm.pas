unit TestMainForm;
interface
uses Messages, SysUtils, Classes, Forms, Controls, ComCtrls;
type
  TFormTestMainForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //function  AnyFormEditing:Boolean;
    //procedure WMSysCommand(var Message :TWMSysCommand); message WM_SYSCOMMAND;
    //procedure WMClose     (var Message :TWMClose     ); message WM_CLOSE;
  public
  end;

var
  FormTestMainForm: TFormTestMainForm;

implementation

uses Dialogs;

{$R *.dfm}
//function TFormTestMainForm.AnyFormEditing:Boolean;
//var i       :Integer;
//    j       :Integer;
//    locForm :TForm;
//begin
//   Result := False;
//   for i := 0 to MDIChildCount - 1 do begin
//       locForm := MDIChildren[i];
//       for j := 0 to locForm.ComponentCount - 1 do begin
//           if locForm.Components[j] is TccFormHandler then begin
//              if TccFormHandler(locForm.Components[j]).Mode = fmEditing then Result := True;
//           end;
//           if Result then Break;
//       end;
//   end;
//end;

//procedure TFormTestMainForm.WMSysCommand(var Message: TWMSysCommand);
//begin
//   if (Message.CmdType and $FFF0 = SC_MINIMIZE) and
//      (AnyFormEditing) then Exit
//                       else inherited;
//end;

//procedure TFormTestMainForm.WMClose(var Message: TWMClose);
//begin
//   if AnyFormEditing then Exit
//                     else Close;
//end;

procedure TFormTestMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //if Application.MainForm.MDIChildCount > 0 then begin
   //   ShowMessage('Aún queda alguna ventana abierta. ' +
   //   IntToStr(Application.MainForm.MDIChildCount));
   //end;
   //Action := caFree;
end;

end.



