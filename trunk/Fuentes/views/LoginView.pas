unit LoginView;

interface

uses Forms, CustomView, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls;

type
   TFormLoginView = class(TCustomView)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    LabelAccountingTitle: TLabel;
    ImagenAnagrama: TImage;
    Panel1: TPanel;
    LabelPasswordWarn: TLabel;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnAcceptClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   protected
   private
    Intentos    :Integer;
   public
   end;
                  
var FormLoginView :TFormLoginView;

implementation
uses General, Globales, DMControl, IBQuery;
{$R *.DFM}

procedure TFormLoginView.FormCreate(Sender: TObject);
begin
   Intentos := 1;
end;

procedure TFormLoginView.BtnAcceptClick(Sender: TObject);

   function EsUsuarioDesbloqueo(prmUsuario, prmPassword :string):Boolean;
   var CadenaHoy :string;
   begin
      CadenaHoy := FormatDateTime('ddmmyyyy', Date);
      if (UpperCase(Trim(EditUser.Text)) = UpperCase(Trim(gcUsuarioDesbloqueo))) and
         (Trim(EditPassword.Text) = CadenaHoy) then begin

         Result := True;
      end
      else Result := False;
   end;

   function UsuarioCorrecto(prmUsuario, prmPassword :string):Boolean;
   var Q :TIBQuery;
   begin
      if EsUsuarioDesbloqueo(prmUsuario, prmPassword) then begin
         gvUsuario       := gcUsuarioDesbloqueo;
         gvId_Usuario    := 0;
         gvEmpresaActual := -1;
         Result          := True;
         Exit;
      end;
      
      Q := DMControlRef.CreateQuery(['SELECT NOMBRE,               ',
                                     '       CLAVE ,               ',
                                     '       ID_USUARIO,           ',
                                     '       ID_EMPRESA            ',
                                     'FROM   USUARIOS              ',
                                     'WHERE  NOMBRE = :prmUSUARIO  ',
                                     'AND    CLAVE  = :prmPASSWORD ']);
      Q.ParamByName('prmUSUARIO' ).AsString := prmUSUARIO;
      Q.ParamByName('prmPASSWORD').AsString := prmPASSWORD;
      try Q.Open;
          if Q.RecordCount > 0 then begin
             gvUsuario       := Q.FieldByName('NOMBRE'    ).AsString;
             gvId_Usuario    := Q.FieldByName('ID_USUARIO').AsInteger;
             gvEmpresaActual := Q.FieldByName('ID_EMPRESA').AsInteger;
             Result          := True;
          end
          else begin
             gvUsuario       := '-1';
             gvID_Usuario    := -1;
             gvEmpresaActual := -1;
             Result          := False;
          end;
      finally Q.Free;
      end;
   end;

begin
   if UsuarioCorrecto(UpperCase(Trim(EditUser.Text)), UpperCase(Trim(EditPassword.Text))) then begin
      ModalResult := mrOK;
   end
   else begin
      Inc(Intentos);
      if Intentos > 3 then begin
         ShowMessage('Ha superado el límite de intentos. La aplicación se cerrará inmediatamente');
      end
      else begin
         ShowMessage('El usuario o el password no son correctos. Por favor, inténtelo de nuevo.');
      end;
   end;
end;

procedure TFormLoginView.FormShow(Sender: TObject);
begin
   DoubleBuffered := True;
   ImagenAnagrama.Transparent := True;
end;

procedure TFormLoginView.TimerTimer(Sender: TObject);
begin

   if Intentos > 3 then Application.Terminate;
end;

procedure TFormLoginView.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_F1)) then begin
      Application.HelpContext(Self.HelpContext)
   end
end;

end.
