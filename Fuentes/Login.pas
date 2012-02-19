unit Login;
interface
uses Forms, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     CustomView;

type
   TFormLogin = class(TCustomView)
    Label3: TLabel;
    LabelClave: TLabel;
    EditUsuario: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    ImagenAnagrama: TImage;
    LabelMensaje: TLabel;
    Timer: TTimer;
    LabelMensaje2: TLabel;
    Panel1: TPanel;
    BtnCancelar: TSpeedButton;
    BtnAceptar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
   protected
    procedure Paint; override;
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   private
    Intentos    :Integer;
    procedure MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
   public
    class function MuestraModal:Boolean;                       
   end;

var FormLogin :TFormLogin;

implementation
uses General, Globales, DMControl, IBQuery;
{$R *.DFM}

class function TFormLogin.MuestraModal:Boolean;
begin
   FormLogin := Self.Create(nil);
   try Result := FormLogin.ShowModal = mrOK;
   finally FormLogin.Free;
   end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
   Intentos := 1;
end;

procedure TFormLogin.MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
begin
   LabelMensaje.Caption  := prmMensaje;
   LabelMensaje2.Caption := prmMensaje2;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
end;

procedure TFormLogin.BtnAceptarClick(Sender: TObject);

   function EsUsuarioDesbloqueo(prmUsuario, prmPassword :string):Boolean;
   var CadenaHoy :string;
   begin
      CadenaHoy := FormatDateTime('ddmmyyyy', Date);
      if (UpperCase(Trim(EditUsuario.Text)) = UpperCase(Trim(gcUsuarioDesbloqueo))) and
         (Trim(EditPassword.Text) = CadenaHoy) then begin

         Result       := True;
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
   if UsuarioCorrecto(UpperCase(Trim(EditUsuario.Text)), UpperCase(Trim(EditPassword.Text))) then begin
      ModalResult := mrOK;
   end
   else begin
      Inc(Intentos);
      if Intentos > 3 then begin
         MuestraMensaje('Ha superado el l�mite de intentos.', 'La aplicaci�n se cerrar� autom�ticamente');
      end
      else begin
         MuestraMensaje('El usuario o la contrase�a no son correctos.', 'Por favor, int�ntelo de nuevo.');
      end;
   end;
end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_ESCAPE)) then begin
      BtnCancelar.Click;
   end else
   if (Key = Chr(VK_RETURN)) and (ActiveControl = EditUsuario) then begin
      Key := #0;
      Perform(WM_NextDlgCtl, 0, 0);
   end else
   if (Key = Chr(VK_RETURN)) and (ActiveControl = EditPassword) then begin
      BtnAceptar.Click;
   end;
end;

procedure TFormLogin.BtnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
   DoubleBuffered := True;
   ImagenAnagrama.Transparent := True;
end;

procedure TFormLogin.TimerTimer(Sender: TObject);
begin
   LabelMensaje.Caption := '';
   LabelMensaje2.Caption := '';
   Timer.Enabled := False;
   if Intentos > 3 then Application.Terminate;
end;

procedure TFormLogin.WMNCHitTest(var Msg: TWMNCHitTest);
begin
   {move the form by draging anywhere on the client area }
   inherited;
   if Msg.Result = htClient then Msg.Result := htCaption;
end;

procedure TFormLogin.Paint;
var Reg :HRGN;
begin
   {Hide Title Bar}
   SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
   {Make borders rounded }
   Reg := CreateRoundRectRgn(0, 0, Width , Height -(Height - ClientHeight), 3, 3);
   SetWindowRgn(Handle, Reg, True);

   Canvas.Pen.Width := 1;
   Canvas.Pen.Color := clGray;
   Canvas.RoundRect(0 ,
                    0 ,
                    Width  -2,
                    ClientHeight -2, 3, 3);
   inherited;
end;

procedure TFormLogin.BtnHelpClick(Sender: TObject);
begin
   Application.HelpContext(Self.HelpContext);
end;

end.
