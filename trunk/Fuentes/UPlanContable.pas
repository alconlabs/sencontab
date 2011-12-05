unit UPlanContable;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBCustomDataSet, IBQuery, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF,
     OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit,
     wwdblook, Wwdotdot;
type
   TWPlanContable = class(TForm)
      Panel5:         TPanel;
      Panel4:         TPanel;
      Panel3:         TPanel;
      lTitulo:        TLabel;
      Shape1:         TShape;
      GroupBox1:      TGroupBox;
      BtnEdtAceptar:  TfcImageBtn;
      BtnEdtSalir:    TfcImageBtn;
      QFichero:       TClientDataSet;
      SFichero:       TDataSource;
      OvcController1: TOvcController;
      fcIBCerrar:     TfcImageBtn;
      gTipoInforme:   TRadioGroup;
      QTitulos:       TIBQuery;
      QGrupos:        TIBQuery;
      QCuentas:       TIBQuery;
      QFicheroGRUPO:  TStringField;
      QFicheroCUENTA: TStringField;
      QFicheroTITULO: TStringField;
      QFicheroDESCTITULO: TStringField;
      QFicheroDESCGRUPO: TStringField;
      QFicheroDESCCUENTA: TStringField;
      QFicheroDESCLISTADO: TStringField;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFichero;
   public
   end;

var WPlanContable: TWPlanContable;

implementation
uses cadenas, DM, DMConta, Globales, MenuPrincipal;
{$R *.DFM}

procedure TWPlanContable.CrearFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('GRUPO', ftString, 3, False);
      Add('CUENTA', ftString, 3, False);
      Add('TITULO', ftString, 2, False);
      Add('DESCGRUPO', ftString, 50, False);
      Add('DESCCUENTA', ftString, 50, False);
      Add('DESCTITULO', ftString, 50, False);
      Add('DESCLISTADO', ftString, 100, False);
      CreateDataSet;
      Active := True;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, IndexDefs do begin
      Add('', '', []);
      Add('TITULO', 'TITULO;GRUPO;CUENTA', []);
   end;
end;

procedure TWPlanContable.FormCreate(Sender: TObject);
begin
   gTipoInforme.ItemIndex := 0;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QTitulos, SQL do begin
      Close;
      Clear;
      Add('SELECT TITULO, DESCRIPCION FROM TITULOS');
      Add('WHERE TITULO = :TITULO');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QGrupos, SQL do begin
      Close;
      Clear;
      Add('SELECT GRUPO, DESCRIPCION FROM GRUPOS');
      Add('WHERE GRUPO = :GRUPO');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas, SQL do begin
      Close;
      Clear;
      Add('SELECT CUENTA, DESCRIPCION, GRUPO1, GRUPO2, TIPOCUENTA');
      Add('FROM CUENTAS ORDER BY CUENTA');
   end;

   CrearFichero;
end;

procedure TWPlanContable.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWPlanContable.BtnEdtAceptarClick(Sender: TObject);
var
   Grupo1, Grupo2: String;
begin
   // Primero vaciar el fichero
   QFichero.EmptyDataSet;
   QFichero.IndexName := '';

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Balance de situación
   if gTipoInforme.ItemIndex = 0 then  begin
      QCuentas.Close;
      QCuentas.Open;
      while not QCuentas.EOF do begin
         Grupo1 := QCuentas.FieldByName('GRUPO1').AsString;
         Grupo2 := QCuentas.FieldByName('GRUPO2').AsString;
         if (Copy(Grupo1, 1, 1) = 'A') or (Copy(Grupo1, 1, 1) = 'P') then   begin
            QFichero.Insert;
            QFicheroGRUPO.AsString      := Grupo1;
            QFicheroCUENTA.AsString     := QCuentas.FieldByName('CUENTA').AsString;
            QFicheroDESCCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            QFichero.Post;
         end;
         if (Copy(Grupo2, 1, 1) = 'A') or (Copy(Grupo2, 1, 1) = 'P') then   begin
            QFichero.Insert;
            QFicheroGRUPO.AsString      := Grupo2;
            QFicheroCUENTA.AsString     := QCuentas.FieldByName('CUENTA').AsString;
            QFicheroDESCCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            QFichero.Post;
         end;
         QCuentas.Next;
      end;
   end

   // Cuenta de pérdidas y ganancias
   else begin
      QCuentas.Close;
      QCuentas.Open;
      while not QCuentas.EOF do begin
         Grupo1 := QCuentas.FieldByName('GRUPO1').AsString;
         Grupo2 := QCuentas.FieldByName('GRUPO2').AsString;
         if (Copy(Grupo1, 1, 1) = 'D') or (Copy(Grupo1, 1, 1) = 'H') then   begin
            QFichero.Insert;
            QFicheroGRUPO.AsString      := Grupo1;
            QFicheroCUENTA.AsString     := QCuentas.FieldByName('CUENTA').AsString;
            QFicheroDESCCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            QFichero.Post;
         end;
         if (Copy(Grupo2, 1, 1) = 'D') or (Copy(Grupo2, 1, 1) = 'H') then   begin
            QFichero.Insert;
            QFicheroGRUPO.AsString      := Grupo2;
            QFicheroCUENTA.AsString     := QCuentas.FieldByName('CUENTA').AsString;
            QFicheroDESCCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            QFichero.Post;
         end;
         QCuentas.Next;
      end;
   end;

   QFichero.First;
   while not QFichero.EOF do begin
      QFichero.Edit;

      QGrupos.Close;
      QGrupos.ParamByName('GRUPO').AsString := QFicheroGRUPO.AsString;
      QGrupos.Open;

      if not QGrupos.EOF then   begin
         QFicheroDESCGRUPO.AsString := QGrupos.FieldByName('DESCRIPCION').AsString;
      end;

      QTitulos.Close;
      QTitulos.ParamByName('TITULO').AsString := Copy(QFicheroGRUPO.AsString, 1, 2);
      QTitulos.Open;

      if not QTitulos.EOF then   begin
         QFicheroTITULO.AsString     := QTitulos.FieldByName('TITULO').AsString;
         QFicheroDESCTITULO.AsString := QTitulos.FieldByName('DESCRIPCION').AsString;
      end;

      if gTipoInforme.ItemIndex = 0 then   begin
         QFicheroDESCLISTADO.AsString := 'Listado Plan Contable : BALANCE DE SITUACIÓN';
      end
      else begin
         QFicheroDESCLISTADO.AsString := 'Listado Plan Contable : CUENTA PÉRDIDAS Y GANANCIAS';
      end;

      QFichero.Post;
      QFichero.Next;
   end;

   QFichero.IndexName := 'TITULO';
   QFichero.First;

   FormPrincipal.LanzarListado('LPLANCONTABLE.RTM', SFichero);
end;

procedure TWPlanContable.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWPlanContable.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
   end;
end;

procedure TWPlanContable.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWPlanContable.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWPlanContable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
