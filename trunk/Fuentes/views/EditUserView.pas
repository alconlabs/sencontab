unit EditUserView;

interface

uses Forms, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls, CustomDataInputView, CustomView;

type
  TEditUserView = class(TCustomDataInputView)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    procedure BtnAcceptClick(Sender: TObject);
  protected
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation
//uses;
{$R *.DFM}

constructor TEditUserView.Create(AOwner: TComponent);
begin
  inherited;
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

end.
