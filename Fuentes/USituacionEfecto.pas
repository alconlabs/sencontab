unit USituacionEfecto;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Globales, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages,
     OvcBase, ovcdbpf, OvcEF, OvcNF, OvcPB, ovcpf, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel,
     Wwdatsrc, Wwdbcomb, wwdbedit, Wwdotdot, Wwkeycb, wwSpeedButton, CustomView;
type
   TWSituacionEfecto = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      lDescripcion:   TLabel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      eSituacion:     TwwDBComboBox;
      SFichero:       TwwDataSource;
      QFichero:       TClientDataSet;
      QFicheroSITUACION: TStringField;
      QFicheroCHEQUE: TStringField;
      echeque:        TOvcDbPictureField;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
   private
   public
      FOperacionEfectos: TOperacionEfectos;
   end;

var WSituacionEfecto: TWSituacionEfecto;

implementation
uses DM, General, UCarteraEfectos, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWSituacionEfecto.BtnEdtProcesarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   QFichero.Post;

   if FOperacionEfectos = GENERAR_ASIENTO then   begin
      WCarteraEfectos.FSituacion := QFicheroSITUACION.AsString;
   end
   else begin
      WCarteraEfectos.FCheque := QFicheroCHEQUE.AsString;
   end;
end;

procedure TWSituacionEfecto.BtnEdtCancelarClick(Sender: TObject);
begin
   WCarteraEfectos.FSituacion := '';
   WCarteraEfectos.FCheque    := '';
end;

procedure TWSituacionEfecto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWSituacionEfecto.FormShow(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SITUACION', ftString, 1, False);
         Add('CHEQUE', ftString, 15, False);
      end;
      CreateDataset;
      Open;
      append;
   end;

   if FOperacionEfectos = GENERAR_ASIENTO then  begin
      lDescripcion.Caption := 'Seleccione la situación del efecto seleccionado';
      eSituacion.Visible   := True;
      eCheque.Visible      := False;
   end
   else begin
      lDescripcion.Caption := 'Introduzca el número de cheque';
      eSituacion.Visible   := False;
      eCheque.Visible      := True;
   end;

   QFicheroSITUACION.AsString := 'B';
   QFicheroCHEQUE.AsString    := '';
end;

procedure TWSituacionEfecto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtCancelar.Click;
      end;
      VK_F3: begin
         BtnEdtProcesar.Click;
      end;
      VK_UP: begin
         SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
      end;
      VK_DOWN: begin
         SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
      end
   end;
end;

procedure TWSituacionEfecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario       := nil;
   WSituacionEfecto := nil;
end;

procedure TWSituacionEfecto.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWSituacionEfecto.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
