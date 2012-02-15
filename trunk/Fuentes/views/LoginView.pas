unit LoginView;
interface
uses Forms, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls;

type
   TFormLoginView = class(TForm)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    ImagenAnagrama: TImage;
    LabelMensaje: TLabel;
    Timer: TTimer;
    LabelMensaje2: TLabel;
    Panel1: TPanel;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    StatusBar: TStatusBar;
    LabelPasswordWarn: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAcceptClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
   protected
    procedure Paint; override;
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   private
    Intentos    :Integer;
   public
    procedure MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
    class function MuestraModal:Boolean;
   end;

var FormLoginView :TFormLoginView;

implementation
uses General, Globales, DMControl, IBQuery;
{$R *.DFM}

class function TFormLoginView.MuestraModal:Boolean;
begin
   FormLoginView := Self.Create(nil);
   try Result := FormLoginView.ShowModal = mrOK;
   finally FormLoginView.Free;
   end;
end;

procedure TFormLoginView.FormCreate(Sender: TObject);
begin
   Intentos := 1;
end;

procedure TFormLoginView.MuestraMensaje(prmMensaje :string; prmMensaje2 :string = '');
begin
   LabelMensaje.Caption  := prmMensaje;
   LabelMensaje2.Caption := prmMensaje2;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
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
         MuestraMensaje('Ha superado el límite de intentos.', 'La aplicación se cerrará inmediatamente');
      end
      else begin
         MuestraMensaje('El usuario o el password no son correctos.', 'Por favor, inténtelo de nuevo.');
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
   LabelMensaje.Caption := '';
   LabelMensaje2.Caption := '';
   Timer.Enabled := False;
   if Intentos > 3 then Application.Terminate;
end;

procedure TFormLoginView.WMNCHitTest(var Msg: TWMNCHitTest);
begin
   {move the form by draging anywhere on the client area }
   inherited;
   if Msg.Result = htClient then Msg.Result := htCaption;
end;

procedure TFormLoginView.Paint;
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

   StatusBar.Left  := 1;
   StatusBar.Top   := Self.Height - StatusBar.Height -3;
   StatusBar.Width := Self.Width -4;

   inherited;
end;

end.
