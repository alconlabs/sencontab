unit UCargaAsiento;
interface
uses Buttons, Classes, ComCtrls, Controls, Db, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton,
     fcCalcEdit, fcCombo, fcImage, fcimageform, fcImgBtn, fcShapeBtn, Forms, Globales, Graphics, Grids,
     IBCustomDataSet, IBDatabase, IBQuery, IBSQL, IBTableSet, jpeg, Mask, Menus, Messages, navegadorNotarios,
     OvcBase, ovccalc, ovccaldg, ovcclcdg, OvcDbDat, OvcDbNF, OvcDbPF, ovcdlg, OvcEdCal, OvcEditF, OvcEdPop,
     OvcEF, ovcfiler, ovcmru, OvcNbk, OvcNF, OvcPB, OvcPF, ovcstate, ovcstore, StdCtrls, SysUtils,
     Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, Wwintl,
     wwSpeedButton, CustomView, 
     DBXpress, SqlExpr, CRSQLConnection;
type
   TWCargaAsiento = class(TCustomView)
    EditComentario: TOvcDbPictureField;
    EditDescConcepto: TwwDBLookupCombo;
    EditSubcuentaCBSUBCUENTA: TwwDBLookupCombo;
    EditDescSubcuentaCBDESCSUBCUENTA: TwwDBLookupCombo;
    LabelSubcuenta: TLabel;
    LabelContrapartida: TLabel;
    EditContrapartidaCBSUBCUENTA: TwwDBLookupCombo;
    EditDescContrapartidaCBDESCSUBCUENTA: TwwDBLookupCombo;
    LabelTitulo: TLabel;
    EditFecha: TwwDBDateTimePicker;
    EditDescuadre: TOvcNumericField;
    BtnEdtAnyadir:   TfcImageBtn;
    QDiario: TIBTableSet;
    QDiarioDescApunte: TStringField;
    QDiarioID_DIARIO: TIntegerField;
    QDiarioAPUNTE: TSmallintField;
    QDiarioASIENTO: TIntegerField;
    QDiarioBASEIMPONIBLE: TFloatField;
    QDiarioCOMENTARIO: TIBStringField;
    QDiarioCONTRAPARTIDA: TIBStringField;
    QDiarioDEBEHABER: TIBStringField;
    QDiarioFECHA: TDateTimeField;
    QDiarioIMPORTE: TFloatField;
    QDiarioIVA: TFloatField;
    QDiarioNIF: TIBStringField;
    QDiarioMONEDA: TIBStringField;
    QDiarioNUMEROFACTURA: TIBStringField;
    QDiarioRECARGO: TFloatField;
    QDiarioSUBCUENTA: TIBStringField;
    QDiarioPUNTEO: TIBStringField;
    QDiarioASIENTOPUNTEO: TIntegerField;
    QDiarioPUNTEOIVA: TIBStringField;
    QDiarioID_CONCEPTOS: TIBStringField;
    QDiarioTIPODIARIO: TIBStringField;
    QDiarioCUENTA_ANALITICA: TIBStringField;
    QDiarioCUOTAIVA: TFloatField;
    QDiarioCUOTARECARGO: TFloatField;
    QDiarioTIPOASIENTO: TIntegerField;
    QDiarioASIENTONOMINA: TIntegerField;
    QDiarioEJERCICIO: TIntegerField;
    QDiarioSERIE: TIBStringField;
    QMovimientos:    TIBTableSet;
    QMovimientosASIENTO: TIntegerField;
    QMovimientosFECHA: TDateTimeField;
    QMovimientosID_CONCEPTOS: TIBStringField;
    QMovimientosDescComentario: TStringField;
    QMovimientosDEBEHABER: TIBStringField;
    QMovimientosIMPORTE: TFloatField;
    QMovimientosCONTRAPARTIDA: TIBStringField;
    QMovimientosCOMENTARIO: TIBStringField;
    QMovimientosNUMEROFACTURA: TIBStringField;
    QMovimientosDESCCONCEPTO: TStringField;
    QMovimientosEJERCICIO: TIntegerField;
    QMovimientosSERIE: TIBStringField;
    EditCD_CONCEPTO: TwwDBLookupCombo;
    EditFactura: TOvcDbPictureField;
    EditAnaliticaNom: TwwDBLookupCombo;
    EditAnalitica: TwwDBLookupCombo;
    EditImporte: TOvcDbNumericField;
    EditDebeHaber: TOvcDbPictureField;
    EditCD_TIPO: TOvcDbNumericField;
      Paginas:         TOvcNotebook;
      OvcController1:  TOvcController;
      Panel5:          TPanel;
      Panel3:          TPanel;
      Panel4:          TPanel;
      GridEdtApuntes:  TwwDBGrid;
      GridEdtMovimientos: TwwDBGrid;
      Transaccion:     TIBTransaction;
      Datos:           TGroupBox;
      Label1:          TLabel;
      Label7:          TLabel;
      Panel1:          TPanel;
      Label11:         TLabel;
      Label24:         TLabel;
      Label25:         TLabel;
      Label8:          TLabel;
      Label3:          TLabel;
      FiltroFechaDesde: TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      FiltroImporteDesde: TOvcDbNumericField;
      FiltroImporteHasta: TOvcDbNumericField;
      FiltroDescConcepto: TwwDBLookupCombo;
      QFiltro:         TClientDataSet;
      SFiltro:         TDataSource;
      BtnEdtAceptar:   TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      BtnEdtBorrar:    TfcImageBtn;
      BtnEdtImprimir:  TfcImageBtn;
      SMovimientos:    TDataSource;
      SFichero:        TDataSource;
      SSubCuenta:      TDataSource;
      QSubCuentas:     TIBTableSet;
      QSubCuentasSUBCUENTA: TIBStringField;
      QSubCuentasDESCRIPCION: TIBStringField;
      QSubCuentasCONTRAPARTIDA: TIBStringField;
      QSubCuentasSUMADB: TFloatField;
      QSubCuentasSUMAHB: TFloatField;
      QSubCuentasCalcSaldo: TFloatField;
      Label5:          TLabel;
      gMoneda:         TDBRadioGroup;
      Panel2:          TPanel;
      Label9:          TLabel;
      DBText1:         TDBText;
      Label10:         TLabel;
      DBText2:         TDBText;
      DBText3:         TDBText;
      Label13:         TLabel;
      Label14:         TLabel;
      lSaldoDeudorAcreedor1: TLabel;
      DBText5:         TDBText;
      DBText7:         TDBText;
      DBText8:         TDBText;
      Label2:          TLabel;
      DBText4:         TDBText;
      DBText6:         TDBText;
      Label18:         TLabel;
      Label19:         TLabel;
      lSaldoDeudorAcreedor2: TLabel;
      DBText9:         TDBText;
      DBText10:        TDBText;
      DBText11:        TDBText;
      Bevel1:          TBevel;
      gDescuadre:      TGroupBox;
      FiltroConcepto:  TwwDBLookupCombo;
      RGConcepto:      TDBRadioGroup;
      Label16:         TLabel;
      Label17:         TLabel;
      QConceptos:      TIBSQL;
      BtnEdtSubcuenta: TfcImageBtn;
      GroupBox1:       TGroupBox;
      Label20:         TLabel;
      Label21:         TLabel;
      Label22:         TLabel;
      Label23:         TLabel;
      Label26:         TLabel;
      FiltroCuenta:    TwwDBLookupCombo;
      FiltroDelegacion: TwwDBLookupCombo;
      FiltroDepartamento: TwwDBLookupCombo;
      FiltroSeccion:   TwwDBLookupCombo;
      FiltroProyecto:  TwwDBLookupCombo;
      FiltroCuentaDesc: TwwDBLookupCombo;
      Label27:         TLabel;
      FiltroCBSUBCUENTA: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTA: TwwDBLookupCombo;
      DBText12:        TDBText;
      QSubCuentasDESCCONTRAPARTIDA: TIBStringField;
      BtnEdtDuplicar:  TfcImageBtn;
      BtnEdtRestablecer: TfcImageBtn;
      QSubCuentasABREVIATURA: TIBStringField;
      Label4:          TLabel;
      Label6:          TLabel;
      PermBtnCalculadora: TSpeedButton;
      PermBtnDetalleIVA: TfcShapeBtn;
      QSubCuentasIVA:  TFloatField;
      QSubCuentasRECARGO: TFloatField;
      Panel6:          TPanel;
      Formulario:      TfcImageForm;
      Label12:         TLabel;
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnMouseEnter(Sender: TObject);
      procedure BtnMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure BtnEdtBorrarClick(Sender: TObject);
      procedure QSubCuentasBeforeOpen(DataSet: TDataSet);
      procedure QDiarioNewRecord(DataSet: TDataSet);
      procedure QDiarioCalcFields(DataSet: TDataSet);
      procedure QDiarioAfterScroll(DataSet: TDataSet);
      procedure QDiarioAfterPost(DataSet: TDataSet);
      procedure EditImporteExit(Sender: TObject);
      procedure QSubCuentasCalcFields(DataSet: TDataSet);
      procedure BtnEdtImprimirClick(Sender: TObject);
      procedure EditSubcuentaCBSUBCUENTACloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure PaginasPageChanged(Sender: TObject; Index: Integer);
      procedure BtnEdtAnyadirClick(Sender: TObject);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure BtnEdtRestablecerClick(Sender: TObject);
      procedure EditSubcuentaCBSUBCUENTAEnter(Sender: TObject);
      procedure EditContrapartidaCBSUBCUENTAEnter(Sender: TObject);
      procedure BtnEdtDuplicarClick(Sender: TObject);
      procedure PermBtnCalculadoraClick(Sender: TObject);
      procedure ImporteClick(Sender: TObject);
      procedure EditImporteEnter(Sender: TObject);
      procedure PermBtnDetalleIVAClick(Sender: TObject);
      procedure EditDebeHaberExit(Sender: TObject);
      procedure EditSubcuentaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
      procedure EditContrapartidaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
      procedure GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DatosExit(Sender: TObject);
      procedure EditCD_TIPOExit(Sender: TObject);
   private
      FApunte                :Integer;
      FImporteAnterior       :Double;
      FMoneda                :string;
      FConceptoAnterior      :string;
      FComentarioAnterior    :string;
      FFacturaAnterior       :string;
      FSubcuentaAnterior     :string;
      FContrapartidaAnterior :string;
      FCtaAnaliticaAnterior  :string;
      FSubcuentaAlEntrar     :string;
      FContrapartidaAlEntrar :string;
      FSubcuentaCobroPago    :string;
      FTipoAsiento           :Integer;
      FColorActual           :TColor;
      FAsientoAnterior       :Integer;
      procedure AbrirDetalleImportesIVA;
      procedure ActualizarComentarioAsiento(Comentario: String);
      procedure AplicarCambioSubcuenta;
      procedure CrearFiltro;
      procedure FormatearImportes;
      procedure InicializarFiltro;
      procedure InicializarModoArranque;
      procedure PrepararQueryApuntes;
      procedure PrepararQueryMovimientos;
      procedure PrepararQuerySubcuentas;
      procedure RefrescarDescuadre;
      function  SelectNextApunte(prmAsiento :Integer):Integer;
   public
      FModoArranque   :TModoArranque;
      FAsientoFactura :Integer;
      FAsiento        :Integer;
   end;

var WCargaAsiento: TWCargaAsiento;

implementation
uses DM, DMConta, General, InfMayor, UCalculadora, UDetalleIVA, UEspere, UNuevaSubcuenta,
     UFiltroLibroFacturasEmitidas, UPreviewForm, MenuPrincipal;
{$R *.DFM}

const TabAsiento = 0;
      TabMovim   = 1;
      TabMayor   = 2;
const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWCargaAsiento.AbrirDetalleImportesIVA;
begin
   if not (QDiario.State in dsEditModes) then begin
      QDiario.Edit;
   end;

   QDiarioIVA.AsFloat     := QSubCuentasIVA.AsFloat;
   QDiarioRECARGO.AsFloat := QSubCuentasRECARGO.AsFloat;

   if not Assigned(WDetalleIVA) then begin
      WDetalleIVA := TWDetalleIVA.Create(nil);
   end;
   WDetalleIVA.SFichero.DataSet := QDiario;

   if WDetalleIVA.ShowModal = mrOk then begin
      EditImporte.SetFocus;
   end;

   WDetalleIVA.Free;
   WDetalleIVA := nil;

   RefrescarDescuadre;
end;

procedure TWCargaAsiento.ActualizarComentarioAsiento(Comentario: String);
var Apunte :Integer;
begin
   // Si es factura de compra o venta, actualizar el comentario con la
   // descripción de la subcta de proveedor o cliente seleccionado.
   if (FTipoAsiento = ASIENTO_FACTURA_COMPRA) or (FTipoAsiento = ASIENTO_FACTURA_VENTA) then begin
      if QDiario.State in dsEditModes then begin
         QDiario.Post;
         QDiario.ApplyUpdates;
      end;
      Apunte := QDiarioAPUNTE.AsInteger;

      QDiario.DisableControls;
      try QDiario.First;
          while not QDiario.EOF do begin
             QDiario.Edit;
             QDiarioCOMENTARIO.AsString := Comentario;
             QDiario.Post;
             QDiario.ApplyUpdates;
             QDiario.Next;
          end;

          QDiario.First;
          while not QDiario.EOF do begin
             if QDiarioAPUNTE.AsInteger = Apunte then begin
                Break;
             end;
             QDiario.Next;
          end;
      finally QDiario.EnableControls;
      end;
   end;
end;

procedure TWCargaAsiento.AplicarCambioSubcuenta;
var Apunte         :Integer;
    NuevaSubcuenta :string;
begin
   // Si se modifica la subcuenta, comprobar las contrapartidas del resto de apuntes.
   if (FSubcuentaAlEntrar <> '') and (FSubcuentaAlEntrar <> QDiarioSUBCUENTA.AsString) then begin
      if QDiario.State in dsEditModes then begin
         QDiario.Post;
         QDiario.ApplyUpdates;
      end;

      Apunte         := QDiarioAPUNTE.AsInteger;
      NuevaSubcuenta := QDiarioSUBCUENTA.AsString;

      QDiario.DisableControls;
      try QDiario.First;
          while not QDiario.EOF do begin
             if QDiarioCONTRAPARTIDA.AsString = FSubcuentaAlEntrar then begin
                QDiario.Edit;
                QDiarioCONTRAPARTIDA.AsString := NuevaSubcuenta;
                QDiario.Post;
                QDiario.ApplyUpdates;
             end;
             QDiario.Next;
          end;
          QDiario.First;

          while not QDiario.EOF do begin
             if QDiarioAPUNTE.AsInteger = Apunte then begin
                Break;
             end;
             QDiario.Next;
          end;
      finally QDiario.EnableControls;
      end;
   end;
end;

procedure TWCargaAsiento.CrearFiltro;
begin
   QFiltro.Active := False;
   QFiltro.FieldDefs.Clear;
   QFiltro.FieldDefs.Add('FECHAASIENTO'   , ftDate    ,  0, False);
   QFiltro.FieldDefs.Add('FECHADESDE'     , ftDate    ,  0, False);
   QFiltro.FieldDefs.Add('FECHAHASTA'     , ftDate    ,  0, False);
   QFiltro.FieldDefs.Add('IMPORTEDESDE'   , ftFloat   ,  0, False);
   QFiltro.FieldDefs.Add('IMPORTEHASTA'   , ftFloat   ,  0, False);
   QFiltro.FieldDefs.Add('SUBCUENTA'      , ftString  , 10, False);
   QFiltro.FieldDefs.Add('CONCEPTO'       , ftVarBytes,  3, False);
   QFiltro.FieldDefs.Add('TIPOCONCEPTO'   , ftString  ,  1, False);
   QFiltro.FieldDefs.Add('MONEDA'         , ftString  ,  1, False);
   QFiltro.FieldDefs.Add('CUENTA'         , ftString  , 10, False);
   QFiltro.FieldDefs.Add('ID_DELEGACION'  , ftString  , 10, False);
   QFiltro.FieldDefs.Add('ID_DEPARTAMENTO', ftString  , 10, False);
   QFiltro.FieldDefs.Add('ID_SECCION'     , ftString  , 10, False);
   QFiltro.FieldDefs.Add('ID_PROYECTO'    , ftString  , 10, False);
   QFiltro.CreateDataSet;
   QFiltro.Active := True;
   QFiltro.Append;
end;

procedure TWCargaAsiento.FormatearImportes;
var Cadena :string;
begin
   if QDiarioMONEDA.AsString = 'E' then Cadena := gcFormatoImporteEuros
                                    else Cadena := gcFormatoImportePtas;

   QDiarioIMPORTE.DisplayFormat       := Cadena;
   QDiarioBASEIMPONIBLE.DisplayFormat := Cadena;
   QDiarioCUOTAIVA.DisplayFormat      := Cadena;
   QDiarioCUOTAIVA.DisplayFormat      := Cadena;

   if QDiarioMONEDA.AsString = 'E' then Cadena := '#########.#0'
                                   else Cadena := '#########';
   QDiarioIMPORTE.EditFormat       := Cadena;
   QDiarioBASEIMPONIBLE.EditFormat := Cadena;
   QDiarioCUOTAIVA.EditFormat      := Cadena;
   QDiarioCUOTARECARGO.EditFormat  := Cadena;

   QSubCuentasSUMADB.DisplayFormat    := QDiarioIMPORTE.DisplayFormat;
   QSubCuentasSUMAHB.DisplayFormat    := QDiarioIMPORTE.DisplayFormat;
   QSubCuentasCalcSaldo.DisplayFormat := QDiarioIMPORTE.DisplayFormat;
end;

procedure TWCargaAsiento.InicializarFiltro;
var nPrimerAsiento :Integer;
    nUltimoAsiento :Integer;
    dPrimeraFecha  :TDateTime;
    dUltimaFecha   :TDateTime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   if not(QFiltro.State in dsEditModes) then begin
      QFiltro.Edit;
   end;
   QFiltro.FieldByName('FECHADESDE'  ).AsDateTime := dPrimeraFecha;
   QFiltro.FieldByName('FECHAHASTA'  ).AsDateTime := dUltimaFecha;
   QFiltro.FieldByName('IMPORTEHASTA').AsFloat    := gcMaxInt;
   QFiltro.FieldByName('TIPOCONCEPTO').AsString   := 'T';
   QFiltro.FieldByName('MONEDA'      ).AsString   := DMRef.QParametros.FieldByName('MONEDA').AsString;
   QFiltro.FieldByName('SUBCUENTA'   ).AsString   := QDiarioSUBCUENTA.AsString;
end;

function TWCargaAsiento.SelectNextApunte(prmAsiento :Integer):Integer;
var Q :TSQLQuery;
begin
   Q := DMRef.CreateQuery(['SELECT MAX(APUNTE) MAXIMO    ',
                           'FROM   DIARIO                ',
                           'WHERE  ASIENTO = :prmASIENTO ']);
   Q.ParamByName('prmASIENTO').AsInteger := prmASIENTO;
   try Q.Open;
       Result := Q.FieldByName('MAXIMO').AsInteger + 1;
   finally Q.Free;
   end;
end;

procedure TWCargaAsiento.InicializarModoArranque;
var Subcta          :string;
    Banco           :string;
    Factura         :string;
    CuentaAnalitica :string;
    Importe         :Double;
    Q               :TSQLQuery;
    QAbrev          :TSQLQuery;
begin
   FSubcuentaCobroPago := '';
   // Inserción de asiento
   if FModoArranque = INSERCION then begin
      FApunte      := 0;
      FTipoAsiento := ASIENTO_GENERAL;
      FAsiento     := DMContaRef.ObtenerNumeroAsiento;
      if not(QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;
      QFiltro.FieldByName('FECHAASIENTO').AsDateTime := Date;
      FMoneda               := DMRef.QParametros.FieldByName('MONEDA').AsString;
      FConceptoAnterior     := '';
      FComentarioAnterior   := '';
      FFacturaAnterior      := '';
      FImporteAnterior      := 0;
      FCtaAnaliticaAnterior := '';

      QDiario.Insert;

      BtnEdtDuplicar.Visible := False;
   end else
   // Creación de asiento de cobro / pago
   if (FModoArranque = COBRO_FACTURA) or (FModoArranque = PAGO_FACTURA) then begin
      if not(QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;
      QFiltro.FieldByName('FECHAASIENTO').AsDateTime := Date;
      FMoneda      := DMRef.QParametros.FieldByName('MONEDA').AsString;
      FTipoAsiento := ASIENTO_GENERAL;
      FApunte      := 0;

      Importe := 0;
      Factura := '';
      Q := DMRef.CreateQuery(['SELECT D.SUBCUENTA     ,       ',
                              '       D.IMPORTE       ,       ',
                              '       D.NUMEROFACTURA ,       ',
                              '       D.CUENTA_ANALITICA      ',
                              'FROM   DIARIO  D,              ',
                              '       CUENTAS C               ',
                              'WHERE D.ASIENTO = :ASIENTO AND ']);
      if FModoArranque = COBRO_FACTURA then Q.SQL.Add('   C.TIPOCUENTA = "C" AND')
                                       else Q.SQL.Add('   C.TIPOCUENTA = "P" AND');
      Q.SQL.Add('   SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA');

      Q.ParamByName('ASIENTO').AsInteger := FAsientoFactura;
      try Q.Open;
          if not Q.EOF then begin
             // Datos para el nuevo asiento
             Subcta           := Q.FieldByName('SUBCUENTA').AsString;
             Banco            := DmRef.QParametros.FieldByName('SCTABANCO').AsString;
             Importe          := Q.FieldByName('IMPORTE').AsFloat;
             FImporteAnterior := Importe;
             Factura          := Q.FieldByName('NUMEROFACTURA').AsString;
             CuentaAnalitica  := Q.FieldByName('CUENTA_ANALITICA').AsString;

             // Subcuenta de cliente / proveedor para puntear asientos al grabar
             FSubcuentaCobroPago := Subcta;

             FAsiento := DMContaRef.ObtenerNumeroAsiento;

             // APUNTE 1 ------------------------------------------------------------
             QDiario.Append;
             QDiarioAPUNTE.AsInteger          := FApunte;
             QDiarioASIENTO.AsInteger         := FAsiento;
             QDiarioTIPOASIENTO.AsInteger     := FTipoAsiento;
             QDiarioDEBEHABER.AsString        := 'D';
             QDiarioFECHA.AsDateTime          := Date;
             QDiarioIMPORTE.AsFloat           := Importe;
             QDiarioMONEDA.AsString           := FMoneda;
             QDiarioCUENTA_ANALITICA.AsString := CuentaAnalitica;

             // Asiento de cobro
             if FModoArranque = COBRO_FACTURA then begin
                QDiarioSUBCUENTA.AsString     := Banco;        // Subcta banco
                QDiarioCONTRAPARTIDA.AsString := Subcta;       // Subcta cliente
                QDiarioID_CONCEPTOS.AsString  := DmRef.QParametros.FieldByName('CTOCOBRO').AsString;
             end
             else begin {Asiento de pago}
                QDiarioSUBCUENTA.AsString     := Subcta;       // Subcta proveedor
                QDiarioCONTRAPARTIDA.AsString := Banco;        // Subcta banco
                QDiarioID_CONCEPTOS.AsString  := DmRef.QParametros.FieldByName('CTOPAGO').AsString;
             end;

             // Abreviatura de subcta banco
             try QAbrev := DMRef.CreateQuery(['SELECT ABREVIATURA               ',
                                              'FROM   SUBCTAS                   ',
                                              'WHERE  SUBCUENTA = :prmSUBCUENTA ']);

                 QAbrev.ParamByName('prmSUBCUENTA').AsString := Banco;
                 QAbrev.Open;

                 // Si la subcta tiene abreviatura, numerofactura = abreviatura
                 if not QAbrev.EOF and not QAbrev.FieldByName('ABREVIATURA').IsNull then begin
                    Factura := QAbrev.FieldByName('ABREVIATURA').AsString;
                 end;
             finally Q.Free;
             end;

             QDiarioNUMEROFACTURA.AsString := Factura;

             QDiario.Post;    // FIN APUNTE 1
             QDiario.ApplyUpdates;

             // APUNTE 2 ------------------------------------------------------------
             QDiario.Append;
             QDiarioAPUNTE.AsInteger          := FApunte;
             QDiarioASIENTO.AsInteger         := FAsiento;
             QDiarioTIPOASIENTO.AsInteger     := FTipoAsiento;
             QDiarioDEBEHABER.AsString        := 'H';
             QDiarioFECHA.AsDateTime          := Date;
             QDiarioIMPORTE.AsFloat           := Importe;
             QDiarioMONEDA.AsString           := FMoneda;
             QDiarioCUENTA_ANALITICA.AsString := CuentaAnalitica;
             QDiarioNUMEROFACTURA.AsString    := Factura;

             // Asiento de cobro
             if FModoArranque = COBRO_FACTURA then begin
                QDiarioSUBCUENTA.AsString     := Subcta;       // Subcta cliente
                QDiarioCONTRAPARTIDA.AsString := Banco;        // Subcta banco
                QDiarioID_CONCEPTOS.AsString  := DmRef.QParametros.FieldByName('CTOCOBRO').AsString;
             end
             // Asiento de pago
             else begin
                QDiarioSUBCUENTA.AsString     := Banco;        // Subcta banco
                QDiarioCONTRAPARTIDA.AsString := Subcta;       // Subcta proveedor
                QDiarioID_CONCEPTOS.AsString  := DmRef.QParametros.FieldByName('CTOPAGO').AsString;
             end;
             QDiario.Post;    // FIN APUNTE 2
             QDiario.ApplyUpdates;
          end;  // if not Eof then
      finally Q.Free;
      end;

      FConceptoAnterior     := QDiarioID_CONCEPTOS.AsString;
      FComentarioAnterior   := '';
      FCtaAnaliticaAnterior := '';
      FFacturaAnterior      := Factura;
      FImporteAnterior      := Importe;

      BtnEdtDuplicar.Visible := False;
   end   // else if (FModoArranque = COBRO_FACTURA) or (FModoArranque = PAGO_FACTURA) then
   else begin // Modificación de asiento
      FApunte := SelectNextApunte(QDiarioAPUNTE.AsInteger);
      if not(QDiario.State in dsEditModes) then begin
         QDiario.Edit;
      end;

      FTipoAsiento := QDiarioTIPOASIENTO.AsInteger;
      if not(QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;
      QFiltro.FieldByName('FECHAASIENTO').AsDateTime := QDiarioFECHA.AsDateTime;
      FMoneda               := QDiarioMONEDA.AsString;
      FConceptoAnterior     := QDiarioID_CONCEPTOS.AsString;
      FComentarioAnterior   := QDiarioCOMENTARIO.AsString;
      FFacturaAnterior      := QDiarioNUMEROFACTURA.AsString;
      FImporteAnterior      := QDiarioIMPORTE.AsFloat;
      FCtaAnaliticaAnterior := QDiarioCUENTA_ANALITICA.AsString;

      BtnEdtDuplicar.Visible := True;

      // Solución tratar asientos de factura sin TIPOASIENTO
      if (FModoArranque = MODIFICACION_INFORME) and QDiarioTIPOASIENTO.IsNull and
         Assigned(WFiltroLibroFactEmitidas) then begin
         if WFiltroLibroFactEmitidas.TipoListado = INF_FACTURAS_EMITIDAS then begin
            FTipoAsiento := ASIENTO_FACTURA_VENTA;
         end else
         if WFiltroLibroFactEmitidas.TipoListado = INF_FACTURAS_RECIBIDAS then begin
            FTipoAsiento := ASIENTO_FACTURA_COMPRA;
         end;
      end;
   end;

   LabelTitulo.Caption := 'Carga del Asiento Nº ' + FormatFloat('###,###,###', QDiarioASIENTO.AsInteger);

   // Impedir la generación de un mayor desde el libro mayor
   if Assigned(WPreviewForm) then begin
      Paginas.Pages[TabMayor].PageVisible := False;
   end;
   EditFecha.SetFocus;
end;

procedure TWCargaAsiento.PrepararQueryApuntes;
begin
   QDiario.CachedUpdates := True;
   QDiario.Close;
   try QDiario.SelectSQL.Clear;
       QDiario.SelectSQL.Add('SELECT *                  ');
       QDiario.SelectSQL.Add('FROM   DIARIO             ');
       QDiario.SelectSQL.Add('WHERE  ASIENTO = :ASIENTO ');
       QDiario.SelectSQL.Add('ORDER  BY ASIENTO, APUNTE ');
       QDiario.Params.ByName('ASIENTO').AsInteger := FAsiento;
       QDiario.Prepare;
   finally QDiario.EnableControls;
           QDiario.Open;
   end;

   RefrescarDescuadre;
   FormatearImportes;
end;

procedure TWCargaAsiento.PrepararQueryMovimientos;
begin
   QMovimientos.DisableControls;
   try QMovimientos.Close;
       QMovimientos.SelectSQL.Clear;
       QMovimientos.Transaction.Active := True;
       QMovimientos.SelectSQL.Add('SELECT * FROM DAME_APUNTES_SUBCUENTA(:prmSUBCUENTA, :prmCUANTOS)');
       QMovimientos.SelectSQL.Add('ORDER BY FECHA');
       QMovimientos.ParamByName('prmSUBCUENTA').AsString  := QDiarioSUBCUENTA.AsString;
       QMovimientos.ParamByName('prmCUANTOS'  ).AsInteger := 30;
       QMovimientos.Prepare;
   finally QMovimientos.EnableControls;
   end;
   QMovimientos.Open;
   QMovimientos.Last;
end;

procedure TWCargaAsiento.PrepararQuerySubcuentas;
begin
   QSubCuentas.DisableControls;
   QSubCuentas.Close;
   try QSubCuentas.SelectSQL.Clear;
       QSubCuentas.SelectSQL.Add('SELECT S.SUBCUENTA     ,                ');
       QSubCuentas.SelectSQL.Add('       S.DESCRIPCION   ,                ');
       QSubCuentas.SelectSQL.Add('       S.CONTRAPARTIDA ,                ');
       QSubCuentas.SelectSQL.Add('       S.ABREVIATURA   ,                ');
       QSubCuentas.SelectSQL.Add('       S.SUMADB        ,                ');
       QSubCuentas.SelectSQL.Add('       S.SUMAHB        ,                ');
       QSubCuentas.SelectSQL.Add('       C.DESCRIPCION DESCCONTRAPARTIDA, ');
       QSubCuentas.SelectSQL.Add('       S.IVA           ,                ');
       QSubCuentas.SelectSQL.Add('       S.RECARGO                        ');
       QSubCuentas.SelectSQL.Add('FROM SUBCTAS S LEFT JOIN SUBCTAS C ON S.CONTRAPARTIDA = C.SUBCUENTA');
       QSubCuentas.SelectSQL.Add('WHERE S.SUBCUENTA = :SUBCUENTA');
       QSubCuentas.Prepare;
    finally QSubCuentas.EnableControls;
            QSubCuentas.Open;
    end;
end;

procedure TWCargaAsiento.RefrescarDescuadre;
var SumaDebe  :Double;
    SumaHaber :Double;
    Marca     :TBookmarkStr;
begin
   if QDiario.State in dsEditModes then begin
      QDiario.Post;
      QDiario.ApplyUpdates;
   end;

   Marca := QDiario.Bookmark;
   QDiario.DisableControls;
   try QDiario.First;
       SumaDebe  := 0;
       SumaHaber := 0;
       while not QDiario.EOF do begin
          if QDiarioDEBEHABER.AsString = 'D' then SumaDebe  := SumaDebe + QDiarioIMPORTE.AsFloat
                                              else SumaHaber := SumaHaber + QDiarioIMPORTE.AsFloat;
          QDiario.Next;
       end;
   finally QDiario.Bookmark := Marca;
           QDiario.EnableControls;
   end;

   EditDESCUADRE.AsFloat := RoundToDecimal(SumaDebe - SumaHaber, 2, True);
   if RoundToDecimal(EditDESCUADRE.AsFloat, 2, True) < 0 then EditDESCUADRE.Font.Color := clRed
                                                         else EditDESCUADRE.Font.Color := clNavy;
end;

procedure TWCargaAsiento.FormCreate(Sender: TObject);
var Pos1 :Integer;
begin
   //ActivarTransacciones(Self);

   CrearFiltro;
   InicializarFiltro;
   QConceptos.Close;
   QConceptos.SQL.Clear;
   QConceptos.SQL.Add('SELECT DESCRIPCION                  ');
   QConceptos.SQL.Add('FROM   CONCEPTOS                    ');
   QConceptos.SQL.Add('WHERE  ID_CONCEPTOS = :ID_CONCEPTOS ');
   QConceptos.Prepare;

   // Longitud subcuenta
   EditSubcuentaCBSUBCUENTA.MaxLength     := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   EditContrapartidaCBSUBCUENTA.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   // Búsqueda subcuenta
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
      Pos1 := EditSubcuentaCBSUBCUENTA.Left;
      EditDescSubcuentaCBDESCSUBCUENTA.Left := Pos1;
      EditDescContrapartidaCBDESCSUBCUENTA.Left := Pos1;
      EditSubcuentaCBSUBCUENTA.Left := EditSubcuentaCBSUBCUENTA.Left + EditDescSubcuentaCBDESCSUBCUENTA.Width;
      EditContrapartidaCBSUBCUENTA.Left :=
         EditContrapartidaCBSUBCUENTA.Left + EditDescContrapartidaCBDESCSUBCUENTA.Width;
      EditSubcuentaCBSUBCUENTA.TabStop := False;
      EditContrapartidaCBSUBCUENTA.TabStop := False;
   end;
end;

procedure TWCargaAsiento.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   PrepararQuerySubcuentas;
   PrepararQueryApuntes;  
   PrepararQueryMovimientos;

   InicializarModoArranque;
end;

procedure TWCargaAsiento.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCargaAsiento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWCargaAsiento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtCancelar.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
      VK_UP: begin
         if (ActiveControl is TwwDBGrid) and (QDiario.State in dsEditModes) then
         begin
            QDiario.Post;
            QDiario.ApplyUpdates;
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBComboBox) then begin
            Perform(wm_NextDlgCtl, 0, 0);
            if QDiario.State in dsEditModes then begin
               QDiario.Post;
               QDiario.ApplyUpdates;
            end;
            if QDiario.IsEmpty or (QDiarioIMPORTE.AsFloat <> 0) then begin
               QDiario.Append;
            end;
         end else
         if (ActiveControl is TwwDBComboBox and TwwDBComboBox(
            ActiveControl).DroppedDown) or (ActiveControl is TwwDBLookupCombo and
            not TwwDBLookupCombo(ActiveControl).Grid.Visible) then begin
            if Shift * [ssAlt] = [] then begin
               Perform(wm_NextDlgCtl, 0, 0);
               if QDiario.State in dsEditModes then begin
                  QDiario.Post;
                  QDiario.ApplyUpdates;
               end;
               if QDiario.IsEmpty or (QDiarioIMPORTE.AsFloat <> 0) then begin
                  QDiario.Append;
               end;
            end;
         end;
      end
   end;
end;

procedure TWCargaAsiento.BtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCargaAsiento.BtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCargaAsiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QDiario.State = dsBrowse then begin
      Action := caFree;
      Formulario.Free;
      Formulario    := nil;
      WCargaAsiento := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWCargaAsiento.BtnEdtAceptarClick(Sender: TObject);
var Q :TSQLQuery;
begin
   Perform(WM_NextDlgCtl, 0, 0);
   if QDiario.State in dsEditModes then begin
      QDiario.Post;
      QDiario.ApplyUpdates;
   end;
   FMoneda := QDiarioMONEDA.AsString;

   QDiario.First;
   QDiario.DisableControls;
   Screen.Cursor := crHourGlass;
   {$Message Warn 'SÓLO PARA LA VERSION DEL ASIENTO DE APERTURA'}
   try while not QDiario.EOF do begin
          if (Empty(QDiarioSUBCUENTA.AsString)) then begin
             DatabaseError('No se puede dejar la subcuenta en blanco.');
          end else
          if QDiarioID_CONCEPTOS.AsString = '' then begin
             DatabaseError('No se puede dejar el concepto en blanco.');
          end;
          QDiario.Next;
       end;
   finally QDiario.EnableControls;
           Screen.Cursor := crDefault;
   end;

   // Comprobar si el asiento está descuadrado
   if (RoundToDecimal(EditDESCUADRE.AsFloat, 2, True) <> 0) and
      (MessageDlg('El asiento está descuadrado.' + #13 +
                         '¿Desea guardar los datos?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then begin
      Exit;
   end;

   if not DMContaRef.FechaAsientoPerteneceEjercicio(QFiltro.FieldByName('FECHAASIENTO').AsDateTime) then begin
      if MessageDlg('La fecha del asiento no pertenece al ejercicio actual.' + #13 +
               '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
         Exit;
      end;
   end;

   {$Message Warn 'SÓLO PARA LA VERSION DEL ASIENTO DE APERTURA'}
   Screen.Cursor := crHourGlass;
   QDiario.DisableControls;
   try QDiario.First;
       FApunte := 0;
       while not QDiario.EOF do begin
          Inc(FApunte);
          try QDiario.Edit;
              QDiarioAPUNTE.AsInteger      := FApunte;                                        {Renumerar apuntes       }
              QDiarioFECHA.AsDateTime      := QFiltro.FieldByName('FECHAASIENTO').AsDateTime; {Asignar fecha de asiento}
              QDiarioMONEDA.AsString       := FMoneda;                                        {Asignar moneda          }
              QDiarioTIPOASIENTO.AsInteger := FTipoAsiento;                                   {Tipo Asiento            }
          finally QDiario.Post;
                  QDiario.ApplyUpdates;
          end;
          QDiario.Next;
       end;
   finally Screen.Cursor := crDefault;
           QDiario.EnableControls;
   end;
   
   QDiario.ApplyUpdates;
   QDiario.Transaction.CommitRetaining; {$Message Warn 'Si no está en una Transacción lanza una excepción'}

   if FModoArranque = INSERCION then begin
      FAsiento := DMContaRef.ObtenerNumeroAsiento;
      FApunte  := 0;

      LabelTitulo.Caption := 'Carga del Asiento Nº ' + FormatFloat('###,###,###', FAsiento);
      PrepararQueryApuntes;

      if not (QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;

      QFiltro.FieldByName('FECHAASIENTO').AsDateTime := Date;

      FMoneda               := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FConceptoAnterior     := '';
      FComentarioAnterior   := '';
      FFacturaAnterior      := '';
      FImporteAnterior      :=  0;
      FCtaAnaliticaAnterior := '';

      RefrescarDescuadre;

      QDiario.Insert;

      Mode := fmEdit;
      EditFecha.SetFocus;
   end else
   // Si es asiento de cobro / pago, puntear asientos
   if (FModoArranque = COBRO_FACTURA) or (FModoArranque = PAGO_FACTURA) then begin
      Q := DMRef.CreateQuery(['UPDATE DIARIO SET PUNTEO = "S"                ',
                              'WHERE (    ASIENTO   = :ASIENTOFACTURA    OR  ',    // Punteo asiento factura
                              '       OR  ASIENTO   = :ASIENTOCOBROPAGO) AND ',    // Punteo asiento cobro/pago
                              '       AND SUBCUENTA = :SUBCUENTA             ']);  // Cliente / Proveedor
      Q.ParamByName('SUBCUENTA'       ).AsString  := FSubcuentaCobroPago;
      Q.ParamByName('ASIENTOFACTURA'  ).AsInteger := FAsientoFactura;
      Q.ParamByName('ASIENTOCOBROPAGO').AsInteger := FAsiento;
      try Q.ExecSQL;
          {=> Q.Transaction.CommitRetaining;}{ No parece un código necesario}
      finally Q.Free;
      end;
      MessageDlg('Se ha generado el asiento ' + FormatFloat('###,###,###', QDiarioASIENTO.AsInteger) + #13 +
                 'Si desea ver las modificaciones realizadas, deberá volver a generar el informe.', mtInformation, [mbOK], 0);
      Close;
   end else
   if FModoArranque = MODIFICACION_INFORME then begin
      MessageDlg('Se ha modificado el asiento ' + FormatFloat('###,###,###', QDiarioASIENTO.AsInteger) + #13 +
                 'Si desea ver las modificaciones realizadas, deberá volver a generar el informe.', mtInformation, [mbOK], 0);
      Close;
   end
   else begin
      Close;
   end;
end;

procedure TWCargaAsiento.BtnEdtCancelarClick(Sender: TObject);
var
   cancelar: Boolean;
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);

   if (FModoArranque = INSERCION) then begin
      Cancelar := MessageDlg('¿Desea abandonar la inserción de asientos?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
   end
   else begin
      Cancelar := MessageDlg('¿Quiere anular las modificaciones realizadas a este asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
   end;

   if cancelar then begin
      try
         if QDiario.State in dsEditModes then begin
            QDiario.Cancel;
         end;

         if not QDiario.IsEmpty then begin
            QDiario.CancelUpdates;
         end;

         // Actualizar el valor del generador
         if (FModoArranque = INSERCION    ) or (FModoArranque = DUPLICAR    ) or
            (FModoArranque = COBRO_FACTURA) or (FModoArranque = PAGO_FACTURA) then begin
            {$Message Warn 'Esto terminará en la Modelo correspondiente. De momento lo comentamos para poder desacernos de EjecutaSQL'}
            //DmRef.EjecutarSQL('SET GENERATOR ASIENTO TO ' + IntToStr(FAsiento - 1));
         end;

      except
         DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Close;
   end;
end;

procedure TWCargaAsiento.QDiarioNewRecord(DataSet: TDataSet);
begin
   Inc(FApunte);

   if (FApunte > 1) and (FImporteAnterior = 0) then begin
      QDiario.Cancel;
      Exit;
   end;

   QDiarioASIENTO.AsInteger := FAsiento;

   // Arrastrar subcuenta y contrapartida del anterior sólo en el 2º apunte
   if FApunte = 2 then begin
      QDiarioSUBCUENTA.AsString     := FContrapartidaAnterior;
      QDiarioCONTRAPARTIDA.AsString := FSubcuentaAnterior;
   end;

   QDiarioTIPOASIENTO.AsInteger           := FTipoAsiento;
   QDiarioAPUNTE.AsInteger := FApunte;
   QDiarioFECHA.AsDateTime := QFiltro.FieldByName('FECHAASIENTO').AsDateTime;
   QDiarioMONEDA.AsString  := FMoneda;

   // Si el descuadre es negativo o nulo, generar apunte DEBE
   if RoundToDecimal(EditDESCUADRE.AsFloat, 2, True) < 0 then begin
      QDiarioDEBEHABER.AsString := 'D';
      QDiarioIMPORTE.AsFloat    := - EditDESCUADRE.AsFloat;
   end
   // Si el descuadre es positivo, generar apunte HABER
   else
   if RoundToDecimal(EditDESCUADRE.AsFloat, 2, True) > 0 then begin
      QDiarioDEBEHABER.AsString := 'H';
      QDiarioIMPORTE.AsFloat    := RoundToDecimal(EditDESCUADRE.AsFloat, 2, True);
   end
   else begin
      QDiarioDEBEHABER.AsString := 'D';
      FConceptoAnterior := '';
      FFacturaAnterior  := '';
   end;

   QDiarioID_CONCEPTOS.AsString     := FConceptoAnterior;
   QDiarioCOMENTARIO.AsString       := FComentarioAnterior;
   QDiarioNUMEROFACTURA.AsString    := FFacturaAnterior;
   QDiarioCUENTA_ANALITICA.AsString := FCtaAnaliticaAnterior;

   EditDESCUADRE.AsFloat := 0;

   FormatearImportes;

   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
      EditDescSubcuentaCBDESCSUBCUENTA.SetFocus;
   end
   else begin
      EditSubcuentaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaAsiento.BtnEdtBorrarClick(Sender: TObject);
begin
   if not QDiario.IsEmpty then begin
      if MessageDlg('¿Desea borrar este apunte?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         try QDiario.Delete;
             RefrescarDescuadre;
         except DatabaseError('No se ha podido borrar el apunte seleccionado.' + #13 + CADENA_MANUAL);
         end;
      end;
   end;

   Paginas.Update;
end;

procedure TWCargaAsiento.QSubCuentasBeforeOpen(DataSet: TDataSet);
begin
   QSubCuentas.EnableControls;
end;

procedure TWCargaAsiento.QDiarioCalcFields(DataSet: TDataSet);
var DescConcepto :string;
begin
   DescConcepto := '';
   if (QDiarioID_CONCEPTOS.AsString <> '') then begin
      QConceptos.Close;
      QConceptos.ParamByName('ID_CONCEPTOS').AsString := QDiarioID_CONCEPTOS.AsString;
      QConceptos.ExecQuery;
      DescConcepto := Trim(QConceptos.FieldByName('DESCRIPCION').AsString);
   end;
   // Descripción del apunte
   QDiarioDESCAPUNTE.AsString := DMContaRef.GetDescripcionApunte(DescConcepto,
                                                                 QDiarioNUMEROFACTURA.AsString,
                                                                 QDiarioSERIE.AsString,
                                                                 QDiarioEJERCICIO.AsInteger,
                                                                 QDiarioCOMENTARIO.AsString,
                                                                 QSubCuentasABREVIATURA.AsString);
end;

procedure TWCargaAsiento.EditImporteExit(Sender: TObject);
begin
   if QDiario.State in dsEditModes then begin
      RefrescarDescuadre;
   end;
end;

procedure TWCargaAsiento.QSubCuentasCalcFields(DataSet: TDataSet);
begin
   QSubCuentasCalcSaldo.AsFloat := QSubCuentasSUMADB.AsFloat - QSubCuentasSUMAHB.AsFloat;

   if RoundToDecimal(QSubCuentasCalcSaldo.AsFloat, 2, True) > 0 then begin
      lSaldoDeudorAcreedor1.Caption := 'Saldo Deudor ';
      lSaldoDeudorAcreedor2.Caption := 'Saldo Deudor ';
   end
   else
   if RoundToDecimal(QSubCuentasCalcSaldo.AsFloat, 2, True) < 0 then begin
      lSaldoDeudorAcreedor1.Caption := 'Saldo Acreedor ';
      lSaldoDeudorAcreedor2.Caption := 'Saldo Acreedor ';
      QSubCuentasCalcSaldo.AsFloat  := -QSubCuentasCalcSaldo.AsFloat;
   end
   else begin
      lSaldoDeudorAcreedor1.Caption := 'Saldo ';
      lSaldoDeudorAcreedor2.Caption := 'Saldo ';
   end;
end;

procedure TWCargaAsiento.BtnEdtImprimirClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(QFiltro.FieldByName('TipoConcepto').AsString);
   gvFormatoOficial := False;
   gvMonedaListado  := QFiltro.FieldByName('Moneda').AsString;

   //Self.Hide;

   LanzarInfMayor(True, False, QFiltro.FieldByName('Subcuenta').AsString,
                               QDiarioSubcuenta.AsString, '', '',
                               QFiltro.FieldByName('FechaDesde').AsDateTime,
                               QFiltro.FieldByName('FechaHasta').AsDateTime,
                               Date,   // Fecha de Impresion
                               QFiltro.FieldByName('TipoConcepto').AsString,
                               QFiltro.FieldByName('Concepto').AsString,
                               QFiltro.FieldByName('CUENTA').AsString,
                               QFiltro.FieldByName('ID_DELEGACION').AsString,
                               QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
                               QFiltro.FieldByName('ID_SECCION').AsString,
                               QFiltro.FieldByName('ID_PROYECTO').AsString,
                               DMRef.QParametros.FieldByName('MONEDA').AsString, '', '',
                               False,  // Formato Oficial
                               False); // Solo Asientos sin puntear

   Paginas.Pages[TabAsiento].Show;
   Paginas.Update;
end;

procedure TWCargaAsiento.EditSubcuentaCBSUBCUENTACloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var TipoSubcuenta :string;
begin
   PrepararQuerySubcuentas;

   PermBtnDetalleIVA.Visible := (FTipoAsiento = ASIENTO_FACTURA_COMPRA) or
      (FTipoAsiento = ASIENTO_FACTURA_VENTA);

   if PermBtnDetalleIVA.Visible then begin
      TipoSubcuenta := DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString);
      PermBtnDetalleIVA.Visible := (TipoSubcuenta = 'R') or (TipoSubcuenta = 'S');

      if TipoSubcuenta = 'R' then begin
         PermBtnDetalleIVA.Glyph.LoadFromFile(gvDirImagenes + gcFactVenta);
      end
      else
      if TipoSubcuenta = 'S' then begin
         PermBtnDetalleIVA.Glyph.LoadFromFile(gvDirImagenes + gcFactCompra);
      end;
   end;


   if not QSubCuentas.IsEmpty then begin
      if (FTipoAsiento = ASIENTO_FACTURA_COMPRA) or (FTipoAsiento = ASIENTO_FACTURA_VENTA) then begin
         TipoSubcuenta := DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString);
         if (FSubcuentaAlEntrar <> '') and (DmRef.QParametros.FieldByName(
            'actcomentario').AsString <> 'S') and (FSubcuentaAlEntrar <> QDiarioSUBCUENTA.AsString) and
            ((TipoSubcuenta = 'P') or (TipoSubcuenta = 'C')) and
            (TipoSubcuenta = DMContaRef.ObtenerTipoSubcuenta(FSubcuentaAlEntrar)) then begin
            ActualizarComentarioAsiento(LookupTable.FieldByName('DESCRIPCION').AsString);
         end

         // Si es subcuenta de IVA, abrir ventana de importes
         else
         if (TipoSubcuenta = 'R') or (TipoSubcuenta = 'S') then begin
            AbrirDetalleImportesIVA;
         end
         else begin
            if not (QDiario.State in dsEditModes) then begin
               QDiario.Edit;
            end;
            QDiarioBASEIMPONIBLE.AsFloat := 0;
            QDiarioIVA.AsFloat           := 0;
            QDiarioRECARGO.AsFloat       := 0;
            QDiarioCUOTAIVA.AsFloat      := 0;
            QDiarioCUOTARECARGO.AsFloat  := 0;
            QDiario.Post;
            QDiario.ApplyUpdates;
         end;
      end;


      if not (QDiario.State in dsEditModes) then begin
         QDiario.Edit;
      end;
      if QSubCuentasCONTRAPARTIDA.AsString <> '' then begin
         QDiarioCONTRAPARTIDA.AsString := QSubCuentasCONTRAPARTIDA.AsString;
      end;

      AplicarCambioSubcuenta;
   end;
end;

procedure TWCargaAsiento.PaginasPageChanged(Sender: TObject; Index: Integer);
begin
   if Index = TabMovim then begin
      PrepararQueryMovimientos;
   end
   else
   if Index = TabMayor then begin
      if not (QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;
      QFiltro.FieldByName('SUBCUENTA').AsString := QDiarioSUBCUENTA.AsString;
   end;
end;

procedure TWCargaAsiento.QDiarioAfterPost(DataSet: TDataSet);
begin
   FConceptoAnterior      := QDiarioID_CONCEPTOS.AsString;
   FComentarioAnterior    := QDiarioCOMENTARIO.AsString;
   FFacturaAnterior       := QDiarioNUMEROFACTURA.AsString;
   FImporteAnterior       := QDiarioIMPORTE.AsFloat;
   FSubcuentaAnterior     := QDiarioSUBCUENTA.AsString;
   FContrapartidaAnterior := QDiarioCONTRAPARTIDA.AsString;
   FCtaAnaliticaAnterior  := QDiarioCUENTA_ANALITICA.AsString;
end;

procedure TWCargaAsiento.BtnEdtAnyadirClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if QDiario.State in dsEditModes then begin
      QDiario.Post;
      QDiario.ApplyUpdates;
   end;
   if QDiario.IsEmpty or (QDiarioIMPORTE.AsFloat <> 0) then begin
      QDiario.Append;
   end;
   Paginas.Update;
end;

procedure TWCargaAsiento.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
      DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString ,
                                      QMovimientosNUMEROFACTURA.AsString,
                                      QMovimientosSERIE.AsString        ,
                                      QMovimientosEJERCICIO.AsInteger   ,
                                      QMovimientosCOMENTARIO.AsString   , '');
end;

procedure TWCargaAsiento.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if Key = '.' then Key := ',';
end;

procedure TWCargaAsiento.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;

   WNuevaSubcuenta.ShowModal;
   if WNuevaSubcuenta.FNuevaSubcuenta <> '' then begin
      if not (QDiario.State in dsEditModes) then begin
         QDiario.Edit;
      end;
      QDiarioSUBCUENTA.AsString := WNuevaSubcuenta.FNuevaSubcuenta;
      if WNuevaSubcuenta.FContrapartidaSubcta <> '' then begin
         QDiarioCONTRAPARTIDA.AsString := WNuevaSubcuenta.FContrapartidaSubcta;
      end;
   end;
   
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
      EditDescSubcuentaCBDESCSUBCUENTA.SetFocus;
   end
   else begin
      EditSubcuentaCBSUBCUENTA.SetFocus;
   end;
   WNuevaSubcuenta := nil;
   Paginas.Update;
end;

procedure TWCargaAsiento.BtnEdtRestablecerClick(Sender: TObject);
begin
   if MessageDlg('¿Desea restablecer las modificaciones realizadas a este asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Perform(wm_NextDlgCtl, 0, 0);

      if QDiario.State in dsEditModes then begin
         QDiario.Post;
         QDiario.ApplyUpdates;
      end;

      PrepararQueryApuntes;  
      PrepararQueryMovimientos;

      if (FModoArranque = Insercion) or (FModoArranque = COBRO_FACTURA) or
         (FModoArranque = PAGO_FACTURA) then begin
         FApunte := 0;
         if QFiltro.State in dsEditModes then begin
            QFiltro.Edit;
         end;
         QFiltro.FieldByName('FECHAASIENTO').AsDateTime := Date;
         FMoneda           := DmRef.QParametros.FieldByName('MONEDA').AsString;
         FConceptoAnterior := '';
         FComentarioAnterior := '';
         FFacturaAnterior  := '';
         FImporteAnterior  := 0;
         FCtaAnaliticaAnterior := '';

         QDiario.Insert;
      end
      else begin
         FApunte := QDiario.RecordCount;
         QDiario.Edit;

         if not (QFiltro.State in dsEditModes) then begin
            QFiltro.Edit;
         end;
         QFiltro.FieldByName('FECHAASIENTO').AsDateTime := QDiarioFECHA.AsDateTime;
         FMoneda               := QDiarioMONEDA.AsString;
         FConceptoAnterior     := QDiarioID_CONCEPTOS.AsString;
         FComentarioAnterior   := QDiarioCOMENTARIO.AsString;
         FFacturaAnterior      := QDiarioNUMEROFACTURA.AsString;
         FImporteAnterior      := QDiarioIMPORTE.AsFloat;
         FCtaAnaliticaAnterior := QDiarioCUENTA_ANALITICA.AsString;
      end;

      if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
         EditDescSubcuentaCBDESCSUBCUENTA.SetFocus;
      end
      else begin
         EditSubcuentaCBSUBCUENTA.SetFocus;
      end;

      LabelTitulo.Caption := 'Carga del Asiento Nº ' + FormatFloat('###,###,###', QDiarioASIENTO.AsInteger);

      Paginas.Pages[TabAsiento].Show;
   end;
end;

procedure TWCargaAsiento.EditSubcuentaCBSUBCUENTAEnter(Sender: TObject);
begin
   FSubcuentaAlEntrar := QDiarioSUBCUENTA.AsString;
end;

procedure TWCargaAsiento.EditContrapartidaCBSUBCUENTAEnter(Sender: TObject);
begin
   FContrapartidaAlEntrar := QDiarioCONTRAPARTIDA.AsString;
end;

procedure TWCargaAsiento.BtnEdtDuplicarClick(Sender: TObject);
var Q :TSQLQuery;
begin
   if (not QDiario.IsEmpty) and (MessageDlg('¿Desea duplicar el asiento ' + FormatFloat('###,###,###', QDiarioASIENTO.AsInteger) + ' ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      Perform(wm_NextDlgCtl, 0, 0);
      Q := DMRef.CreateQuery(['SELECT TIPOASIENTO     ,     ',
                              '       ASIENTO         ,     ',
                              '       APUNTE          ,     ',
                              '       BASEIMPONIBLE   ,     ',
                              '       COMENTARIO      ,     ',
                              '       CONTRAPARTIDA   ,     ',
                              '       CUENTA_ANALITICA,     ',
                              '       CUOTAIVA        ,     ',
                              '       CUOTARECARGO    ,     ',
                              '       DEBEHABER       ,     ',
                              '       FECHA           ,     ',
                              '       IMPORTE         ,     ',
                              '       IVA             ,     ',
                              '       MONEDA          ,     ',
                              '       NIF             ,     ',
                              '       NUMEROFACTURA   ,     ',
                              '       RECARGO         ,     ',
                              '       ID_CONCEPTOS    ,     ',
                              '       SUBCUENTA             ',
                              'FROM   DIARIO                ',
                              'WHERE  ASIENTO = :prmASIENTO ',
                              'ORDER BY ASIENTO, APUNTE     ']);
      Q.ParamByName('prmASIENTO').AsInteger := FAsiento;
      try Q.Open;
          FModoArranque := DUPLICAR;
          FAsiento      := DMContaRef.ObtenerNumeroAsiento;
          EditFecha.SetFocus;
          LabelTitulo.Caption := 'Carga del Asiento Nº ' + FormatFloat('###,###,###', FAsiento);

          QDiario.Close;
          QDiario.ParamByName('ASIENTO').AsInteger := FAsiento;
          QDiario.Open;

          while not Q.EOF do begin
             QDiario.Insert;
             QDiarioTIPOASIENTO.AsInteger     := Q.FieldByName('TIPOASIENTO'     ).AsInteger;
             QDiarioASIENTO.AsInteger         := FAsiento;
             QDiarioAPUNTE.AsInteger          := Q.FieldByName('APUNTE'          ).AsInteger;
             QDiarioBASEIMPONIBLE.AsFloat     := Q.FieldByName('BASEIMPONIBLE'   ).AsFloat;
             QDiarioCOMENTARIO.AsString       := Q.FieldByName('COMENTARIO'      ).AsString;
             QDiarioCONTRAPARTIDA.AsString    := Q.FieldByName('CONTRAPARTIDA'   ).AsString;
             QDiarioCUENTA_ANALITICA.AsString := Q.FieldByName('CUENTA_ANALITICA').AsString;
             QDiarioCUOTAIVA.AsFloat          := Q.FieldByName('CUOTAIVA'        ).AsFloat;
             QDiarioCUOTARECARGO.AsFloat      := Q.FieldByName('CUOTARECARGO'    ).AsFloat;
             QDiarioDEBEHABER.AsString        := Q.FieldByName('DEBEHABER'       ).AsString;
             QDiarioFECHA.AsDateTime          := Q.FieldByName('FECHA'           ).AsDateTime;
             QDiarioID_CONCEPTOS.AsString     := Q.FieldByName('ID_CONCEPTOS'    ).AsString;
             QDiarioIMPORTE.AsFloat           := Q.FieldByName('IMPORTE'         ).AsFloat;
             QDiarioIVA.AsFloat               := Q.FieldByName('IVA'             ).AsFloat;
             QDiarioMONEDA.AsString           := Q.FieldByName('MONEDA'          ).AsString;
             QDiarioNIF.AsString              := Q.FieldByName('NIF'             ).AsString;
             QDiarioNUMEROFACTURA.AsString    := Q.FieldByName('NUMEROFACTURA'   ).AsString;
             QDiarioRECARGO.AsFloat           := Q.FieldByName('RECARGO'         ).AsFloat;
             QDiarioSUBCUENTA.AsString        := Q.FieldByName('SUBCUENTA'       ).AsString;
             QDiario.Post;
             QDiario.ApplyUpdates;

             FApunte := Q.FieldByName('APUNTE').AsInteger;
             if QFiltro.State in dsEditModes then QFiltro.Edit; 

             QFiltro.FieldByName('FECHAASIENTO').AsDateTime := Q.FieldByName('FECHA').AsDateTime;
             FMoneda               := Q.FieldByName('MONEDA'          ).AsString;
             FConceptoAnterior     := Q.FieldByName('ID_CONCEPTOS'    ).AsString;
             FFacturaAnterior      := Q.FieldByName('NUMEROFACTURA'   ).AsString;
             FComentarioAnterior   := Q.FieldByName('COMENTARIO'      ).AsString;
             FImporteAnterior      := Q.FieldByName('IMPORTE'         ).AsFloat;
             FCtaAnaliticaAnterior := Q.FieldByName('CUENTA_ANALITICA').AsString;

             Q.Next;
          end;
      finally Q.Free;
      end;

      RefrescarDescuadre;

      FormatearImportes;
   end;
end;

procedure TWCargaAsiento.PermBtnCalculadoraClick(Sender: TObject);
begin
   // Si es subcuenta de IVA, el importe es no modificable
   if not QDiario.EOF and (QDiarioSUBCUENTA.AsString <> '') and
      ((DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString) = 'R') or
      (DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString) = 'S')) then begin
      Exit;
   end;

   if not Assigned(WCalculadora) then begin
      WCalculadora := TWCalculadora.Create(nil);
   end;
   
   if WCalculadora.ShowModal = mrOk then begin
      if not (QDiario.State in dsEditModes) then begin
         QDiario.Edit;
      end;
      QDiarioIMPORTE.AsFloat := WCalculadora.Importe;
      EditImporte.SetFocus;
      // Actualizar descuadre
      RefrescarDescuadre;
   end;
end;

procedure TWCargaAsiento.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCargaAsiento.EditImporteEnter(Sender: TObject);
var TipoSubcuenta :string;
begin
   // Si es subcuenta de IVA de factura, el importe es no modificable
   if not QDiario.EOF and ((FTipoAsiento = CARGA_FACTURAS_COMPRA) or
      (FTipoAsiento = CARGA_FACTURAS_VENTA)) and (QDiarioSUBCUENTA.AsString <> '') then begin
      TipoSubcuenta := DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString);
      if (TipoSubcuenta = 'R') or (TipoSubcuenta = 'S') then begin
         Perform(wm_NextDlgCtl, 0, 0);
      end;
   end;
end;

procedure TWCargaAsiento.PermBtnDetalleIVAClick(Sender: TObject);
begin
   if not QDiario.EOF and (QDiarioSUBCUENTA.AsString <> '') and
      ((DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString) = 'R') or
       (DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString) = 'S')) then begin
      AbrirDetalleImportesIVA;
      // Actualizar descuadre
      RefrescarDescuadre;
   end;
end;

procedure TWCargaAsiento.QDiarioAfterScroll(DataSet: TDataSet);
var TipoSubcuenta :string;
begin
   PermBtnDetalleIVA.Visible := (FTipoAsiento = ASIENTO_FACTURA_COMPRA) or
      (FTipoAsiento = ASIENTO_FACTURA_VENTA);

   if PermBtnDetalleIVA.Visible then begin
      TipoSubcuenta := DMContaRef.ObtenerTipoSubcuenta(QDiarioSUBCUENTA.AsString);
      PermBtnDetalleIVA.Visible := (TipoSubcuenta = 'R') or (TipoSubcuenta = 'S');

      if TipoSubcuenta = 'R' then begin
         PermBtnDetalleIVA.Glyph.LoadFromFile(gvDirImagenes + gcFactVenta);
      end else
      if TipoSubcuenta = 'S' then begin
         PermBtnDetalleIVA.Glyph.LoadFromFile(gvDirImagenes + gcFactCompra);
      end;
   end;
end;

procedure TWCargaAsiento.EditDebeHaberExit(Sender: TObject);
begin
   if (QDiarioDEBEHABER.AsString <> 'D') and (QDiarioDEBEHABER.AsString <> 'H') then begin
      MessageDlg('Debe seleccionar DEBE o HABER', mtInformation, [mbOK], 0);
      EditDebeHaber.SetFocus;
   end
   else RefrescarDescuadre;
end;

procedure TWCargaAsiento.EditSubcuentaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es meno de '+DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
            ' caracteres.', mtInformation, [mbOK], 0);
         EditSubcuentaCBSUBCUENTA.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta inexistente ¿Desea crearla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then begin
            if not (QDiario.State in dsEditModes) then begin
               QDiario.Edit;
            end;
            QDiarioSUBCUENTA.AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            if WNuevaSubcuenta.FContrapartidaSubcta <> '' then begin
               QDiarioCONTRAPARTIDA.AsString := WNuevaSubcuenta.FContrapartidaSubcta;
            end;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      EditSubcuentaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaAsiento.EditContrapartidaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' +
            DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
            ' caracteres.', mtInformation, [mbOK], 0);
         EditContrapartidaCBSUBCUENTA.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta no existente. ¿Quiere añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then begin
            if not (QDiario.State in dsEditModes) then begin
               QDiario.Edit;
            end;
            QDiarioCONTRAPARTIDA.AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      EditContrapartidaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaAsiento.GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FAsientoAnterior := QMovimientosASIENTO.AsInteger;
   GridEdtMovimientos.Refresh;
end;

procedure TWCargaAsiento.GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if QMovimientosASIENTO.AsInteger <> FAsientoAnterior then begin
      FAsientoAnterior := QMovimientosASIENTO.AsInteger;
      if FColorActual = COLOR_ASIENTO1 then FColorActual := COLOR_ASIENTO2
                                       else FColorActual := COLOR_ASIENTO1;
   end;
   
   if State * [gdFixed, gdSelected] = [] then begin
      ABrush.Color := FColorActual;
   end;
end;

procedure TWCargaAsiento.DatosExit(Sender: TObject);
begin
   if QDiario.State in dsEditModes then begin
      QDiario.Post;
      QDiario.ApplyUpdates;
   end;
end;

procedure TWCargaAsiento.EditCD_TIPOExit(Sender: TObject);
begin
   FTipoAsiento := QDiarioTipoAsiento.AsInteger;
end;

end.
