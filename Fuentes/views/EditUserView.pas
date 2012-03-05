unit EditUserView;

interface

uses Forms, CustomView, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls;

type
   TEditUserView = class(TCustomView)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Timer: TTimer;
    StatusBar: TStatusBar;
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    procedure BtnAcceptClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
   protected
   private
   public
    procedure MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
    class function MuestraModal:Boolean;
   end;

implementation
//uses;
{$R *.DFM}

class function TEditUserView.MuestraModal:Boolean;
var FEditUserView :TEditUserView;
begin
   FEditUserView := Self.Create(nil);
   try Result := FEditUserView.ShowModal = mrOK;
   finally FEditUserView.Free;
   end;
end;

procedure TEditUserView.MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
begin
   //LabelMensaje.Caption  := prmMensaje;
   //LabelMensaje2.Caption := prmMensaje2;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
end;

procedure TEditUserView.BtnAcceptClick(Sender: TObject);
begin
   //if UsuarioCorrecto(UpperCase(Trim(EditUser.Text)), UpperCase(Trim(EditPassword.Text))) then begin
   //   ModalResult := mrOK;
   //end
   //else begin
   //   Inc(Intentos);
   //   if Intentos > 3 then begin
   //      MuestraMensaje('Ha superado el límite de intentos.', 'La aplicación se cerrará inmediatamente');
   //   end
   //   else begin
   //      MuestraMensaje('El usuario o el password no son correctos.', 'Por favor, inténtelo de nuevo.');
   //   end;
   //end;
end;

procedure TEditUserView.TimerTimer(Sender: TObject);
begin
   //LabelMensaje.Caption := '';
   //LabelMensaje2.Caption := '';
   Timer.Enabled := False;
   //if Intentos > 3 then Application.Terminate;
end;

end.
