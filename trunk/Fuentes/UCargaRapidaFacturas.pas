unit UCargaRapidaFacturas;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcShapeBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSQL,
     IBTableSet, jpeg, Mask, Messages, navegadorNotarios, OvcBase, ovcclcdg, OvcDbNF, OvcDbPF, ovcdlg, OvcEF,
     OvcNbk, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Variants, WinProcs, WinTypes, wwclearpanel,
     wwclient, Wwdatsrc, Wwdbcomb, wwdbdatetimepicker, Wwdbdlg, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook,
     wwDBNavigator, Wwdbspin, Wwdotdot, Wwkeycb, wwSpeedButton, Wwtable, CustomView;
type
   TWCargaRapidaFacturas = class(TCustomView)
      OvcController1: TOvcController;
      Shape1:         TShape;
      lTitulo:        TLabel;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtGuardar:  TfcImageBtn;
      BtnEdtSalir:    TfcImageBtn;
      SFichero:       TwwDataSource;
      Paginas:        TOvcNotebook;
      GridEdtMovimientos: TwwDBGrid;
      Transaccion:    TIBTransaction;
      QMovimientos:   TIBTableSet;
      SMovimientos:   TDataSource;
      Label5:         TLabel;
      DBText1:        TDBText;
      GroupBox3:      TGroupBox;
      Label9:         TLabel;
      Label10:        TLabel;
      cComentario:    TOvcDbPictureField;
      wwDBLookupCombo11: TwwDBLookupCombo;
      wwDBLookupCombo12: TwwDBLookupCombo;
      QMovimientosASIENTO: TIntegerField;
      QMovimientosAPUNTE: TSmallintField;
      QMovimientosFECHA: TDateTimeField;
      QMovimientosSUBCUENTA: TIBStringField;
      QMovimientosID_CONCEPTOS: TIBStringField;
      QMovimientosDEBEHABER: TIBStringField;
      QMovimientosCONTRAPARTIDA: TIBStringField;
      QMovimientosCOMENTARIO: TIBStringField;
      QMovimientosNUMEROFACTURA: TIBStringField;
      QMovimientosCUENTA_ANALITICA: TIBStringField;
      QMovimientosDESCCONCEPTO: TIBStringField;
      QMovimientosDESCSUBCUENTA: TIBStringField;
      QMovimientosIMPORTE: TFloatField;
      QMovimientosDescComentario: TStringField;
      QSubcuentas:    TIBSQL;
      BtnEdtSubcuenta: TfcImageBtn;
      GroupBox1:      TGroupBox;
      Label1:         TLabel;
      Label2:         TLabel;
      Label6:         TLabel;
      PermBtnCalculadora2: TSpeedButton;
      Label20:        TLabel;
      PermBtnCalculadora: TSpeedButton;
      LbSubcuenta:    TLabel;
      LbCtoSubcuenta: TLabel;
      Label15:        TLabel;
      Label65:        TLabel;
      Label64:        TLabel;
      Label66:        TLabel;
      eConcepto:      TwwDBLookupCombo;
      NFactura:       TOvcDbPictureField;
      nImporte:       TOvcDbNumericField;
      nImporteDto:    TOvcDbNumericField;
      dblSubcuenta:   TwwDBLookupCombo;
      dblSubcuentaN:  TwwDBLookupCombo;
      FechaFactura:   TwwDBDateTimePicker;
      cNif:           TOvcDbPictureField;
      wwDBLookupCombo2: TwwDBLookupCombo;
      wwDBLookupCombo3: TwwDBLookupCombo;
      OvcDbNumericField62: TOvcDbNumericField;
      OvcDbNumericField63: TOvcDbNumericField;
      eDescConcepto:  TwwDBLookupCombo;
      GroupBox2:      TGroupBox;
      Label11:        TLabel;
      Label3:         TLabel;
      Label14:        TLabel;
      CBRealizar:     TCheckBox;
      dblBanco:       TwwDBLookupCombo;
      dblBancoN:      TwwDBLookupCombo;
      dFechaCobro:    TwwDBDateTimePicker;
      wwDBLookupCombo8: TwwDBLookupCombo;
      dblCtoBanco:    TwwDBLookupCombo;
      Datos:          TGroupBox;
      GridEdtSubcuentasIVA: TwwDBGrid;
      eSbctaIVADesc:  TwwDBLookupCombo;
      eContrapartida: TwwDBLookupCombo;
      eContrapartidaDesc: TwwDBLookupCombo;
      SGastos:        TwwDataSource;
      QGastos:        TClientDataSet;
      QGastosSBCTA_IVA: TStringField;
      QGastosSBCTA_IVA_DESC: TStringField;
      QGastosBASE_IMPONIBLE_IVA: TFloatField;
      QGastosCONTRAPARTIDA: TStringField;
      QGastosCONTRAPARTIDA_DESC: TStringField;
      QGastosGENERADO: TStringField;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo4: TwwDBLookupCombo;
      Label12:        TLabel;
      QGastosCUOTA_IVA: TFloatField;
      LbProfArre:     TLabel;
      OvcDbNumericField2: TOvcDbNumericField;
      PermAniadirIVA: TfcShapeBtn;
      PermBorrarIVA:  TfcShapeBtn;
      PermInicializar: TfcShapeBtn;
      LbCtoContra:    TLabel;
      eConceptoVentaCompra: TwwDBLookupCombo;
      wwDBLookupCombo7: TwwDBLookupCombo;
      eCtoIVAIntra:   TwwDBLookupCombo;
      lCtoIVAIntra:   TLabel;
      eCtoIVAIntraDesc: TwwDBLookupCombo;
      lIntracomunitaria: TLabel;
      oIntracomunitaria: TCheckBox;
      BtnEdtModificar: TfcImageBtn;
      BtnEdtBorrarMovim: TfcImageBtn;
      OvcDbNumericField1: TOvcDbNumericField;
      Label4:         TLabel;
      BtnEdtMayor:    TfcImageBtn;
      QMovimientosABREVIATURA: TIBStringField;
      nImpCuotaIVA:   TwwDBEdit;
      nImpBaseImponible: TwwDBEdit;
      eFacturaIntracom: TOvcDbPictureField;
      lFacturaIntracom: TLabel;
      QGastosCTO_IVA: TStringField;
      eConceptoIVA:   TwwDBLookupCombo;
      QMovimientosTIPOASIENTO: TIntegerField;
      QMovimientosASIENTONOMINA: TIntegerField;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      QMovimientosEJERCICIO: TIntegerField;
      QMovimientosSERIE: TIBStringField;
      PermBtnRetVentas: TSpeedButton;
      lbRetVentas:    TLabel;
      cImpRetVentas:  TOvcDbNumericField;
      QFichero:       TwwClientDataSet;
      procedure BtnEdtGuardarClick(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure PonerPictures(cMoneda: String);
      procedure dblSubcuentaExit(Sender: TObject);
      procedure dblSubcuentaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure FechaFacturaExit(Sender: TObject);
      procedure cNifExit(Sender: TObject);
      procedure dblSubcuentaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure BtnEdtBorrarMovimClick(Sender: TObject);
      procedure CBRealizarClick(Sender: TObject);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure PermBorrarIVAClick(Sender: TObject);
      procedure QGastosNewRecord(DataSet: TDataSet);
      procedure GridEdtSubcuentasIVAKeyPress(Sender: TObject; var Key: Char);
      procedure PermAniadirIVAClick(Sender: TObject);
      procedure PermInicializarClick(Sender: TObject);
      procedure oIntracomunitariaClick(Sender: TObject);
      procedure BtnEdtModificarClick(Sender: TObject);
      procedure BtnEdtMayorClick(Sender: TObject);
      procedure PermBtnCalculadoraClick(Sender: TObject);
      procedure PermBtnCalculadora2Click(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
      procedure nImporteExit(Sender: TObject);
      procedure nImpCuotaIVAExit(Sender: TObject);
      procedure nImpBaseImponibleExit(Sender: TObject);
      procedure eSbctaIVADescCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      procedure eContrapartidaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FContrapartida:   String;
      FColorActual:     TColor;
      FAsientoAnterior: Integer;

      procedure RecalcularBaseImponible;
      procedure RecalcularIVA;
      procedure ConfigurarGridSubcuentasIVA;
      procedure CrearFicheros;
      procedure CrearFichero_QFichero;
      procedure CrearFichero_QGastos;
      procedure PrepararQueryMovimientos;
   public
      TipoCarga:        Integer;
      cTipoDH, cContra: String;
      lProfesional, lArrendador, lIntracom: Boolean;
   end;

var WCargaRapidaFacturas: TWCargaRapidaFacturas;
implementation
uses Cadenas, DM, DMConta, General, Globales, InfMayor, letras, UCalculadora, UCargaAsiento,
     UCargaRapidaNominas, UFiltroMayorSubcuenta, UNuevaSubcuenta, MenuPrincipal, UVencimientos;
{$R *.DFM}

procedure TWCargaRapidaFacturas.RecalcularBaseImponible;
var TipoIVA, Recargo, BaseImponible: Double;
    QSelSubcuenta: TIBQuery;
begin
   if QGastos.State in dsEditModes then begin
      QGastos.Post;
   end;

   if not QGastos.IsEmpty and (QGastosSBCTA_IVA.AsString <> '') then  begin
      QSelSubcuenta := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QSelSubcuenta, SQL do begin
         Close;
         //TODO: Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
         ParamByName('SUBCUENTA').AsString := QGastosSBCTA_IVA.AsString;
         Open;
         TipoIVA := FieldByName('IVA').AsFloat;
         Recargo := FieldByName('RECARGO').AsFloat;
      end;

      if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
         BaseImponible :=
            QFichero.FieldByName('IMPORTE').AsFloat /
            ((1 + (0.01 * TipoIVA) + (0.01 * Recargo)) -
            (0.01 *
            QFichero.FieldByName('TANTORETENCION').AsFloat));
      end
      else begin
         BaseImponible :=
            QFichero.FieldByName('IMPORTE').AsFloat / (1 + (0.01 * TipoIVA) + (0.01 * Recargo));
      end;

      QGastos.Edit;
      QGastosBASE_IMPONIBLE_IVA.AsFloat := RoundToDecimal(BaseImponible, 2, True);
      //    QGastosBASE_IMPONIBLE_IVA.AsFloat := RoundToDecimal(BaseImponible, 3, TRUE);
      QGastos.Post;

      QSelSubcuenta.Close;
      QSelSubcuenta.Free;
   end;
end;

procedure TWCargaRapidaFacturas.RecalcularIVA;
var
   TipoIVA, Recargo, CuotaIVA: Double;
   QSelSubcuenta: TIBQuery;
begin
   if QGastos.State in dsEditModes then   begin
      QGastos.Post;
   end;

   if not QGastos.IsEmpty and (QGastosSBCTA_IVA.AsString <> '') then  begin
      QSelSubcuenta := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QSelSubcuenta, SQL do begin
         Close;
         //TODO: Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
         ParamByName('SUBCUENTA').AsString := QGastosSBCTA_IVA.AsString;
         Open;
         TipoIVA := FieldByName('IVA').AsFloat;
         Recargo := FieldByName('RECARGO').AsFloat;
      end;

      if RoundToDecimal(Recargo, 3, True) = 0 then   begin
         CuotaIVA := (QGastosBASE_IMPONIBLE_IVA.AsFloat * 0.01 * TipoIVA);
      end
      else begin
         CuotaIVA := (QGastosBASE_IMPONIBLE_IVA.AsFloat * 0.01 * TipoIVA) +
            (QGastosBASE_IMPONIBLE_IVA.AsFloat * 0.01 * Recargo);
      end;

      QGastos.Edit;
      QGastosCUOTA_IVA.AsFloat := RoundToDecimal(CuotaIVA, 2, True);
      //    QGastosCUOTA_IVA.AsFloat := RoundToDecimal(CuotaIVA, 3, TRUE);
      QGastos.Post;

      QSelSubcuenta.Close;
      QSelSubcuenta.Free;
   end;
end;

procedure TWCargaRapidaFacturas.ConfigurarGridSubcuentasIVA;
begin
   // Configuración del grid de subcuentas de IVA
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with GridEdtSubcuentasIVA do begin
      Selected.Clear;
      Selected.Add('SBCTA_IVA_DESC' + #9 + '34' + #9 + 'TIPO I.V.A.');
      Selected.Add('BASE_IMPONIBLE_IVA' + #9 + '12' + #9 + 'B. IMPONIBLE');
      Selected.Add('CUOTA_IVA' + #9 + '12' + #9 + 'CUOTA I.V.A.');
      Selected.Add('CTO_IVA' + #9 + '6' + #9 + 'CTO');
      // Búsqueda subcuenta
      if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            Selected.Add('CONTRAPARTIDA_DESC' + #9 + '34' + #9 + 'COMPRAS / AMORTIZACIÓN');
         end
         else begin
            Selected.Add('CONTRAPARTIDA_DESC' + #9 + '34' + #9 + 'VENTAS');
         end;
         Selected.Add('CONTRAPARTIDA' + #9 + '10' + #9 + 'CONTRAP.');
      end
      else begin
         Selected.Add('CONTRAPARTIDA' + #9 + '10' + #9 + 'CONTRAP.');
         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            Selected.Add('CONTRAPARTIDA_DESC' + #9 + '34' + #9 + 'COMPRAS / AMORTIZACIÓN');
         end
         else begin
            Selected.Add('CONTRAPARTIDA_DESC' + #9 + '34' + #9 + 'VENTAS');
         end;
      end;

      ApplySelected;

      SetControlType('SBCTA_IVA_DESC', fctCustom, 'eSbctaIVADesc');
      SetControlType('CONTRAPARTIDA', fctCustom, 'eContrapartida');
      SetControlType('CONTRAPARTIDA_DESC', fctCustom, 'eContrapartidaDesc');
      SetControlType('CUOTA_IVA', fctCustom, 'nImpCuotaIVA');
      SetControlType('CTO_IVA', fctCustom, 'eConceptoIVA');
      SetControlType('BASE_IMPONIBLE_IVA', fctCustom, 'nImpBaseImponible');

      Fields[0].Alignment := taLeftJustify;     // SBCTA_IVA_DESC
      Fields[1].Alignment := taRightJustify;    // BASE_IMPONIBLE_IVA
      Fields[2].Alignment := taRightJustify;    // CUOTA_IVA
      Fields[3].Alignment := taCenter;          // CTO_IVA
      Fields[4].Alignment := taRightJustify;    // CONTRAPARTIDA
      Fields[5].Alignment := taLeftJustify;     // CONTRAPARTIDA_DESC
   end;
end;

procedure TWCargaRapidaFacturas.CrearFicheros;
begin
   // Crear e inicializar QFichero
   CrearFichero_QFichero;

   // Crear e inicializar QGastos
   CrearFichero_QGastos;
end;

procedure TWCargaRapidaFacturas.CrearFichero_QFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('numerofactura', ftString, 10, False);
         Add('NumeroFacturaIntracom', ftString, 10, False);
         Add('Fecha', ftDate, 0, False);
         Add('Importe', ftFloat, 0, False);
         Add('ImporteRetVenta', ftFloat, 0, False);
         Add('ImporteProntoPago', ftFloat, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('Subcuenta', ftString, 10, False);
         Add('CtoSubcuenta', ftVarBytes, 3, False);
         Add('CtoIva', ftVarBytes, 3, False);
         Add('CtoIvaIntra', ftVarBytes, 3, False);
         Add('CtoContra', ftVarBytes, 3, False);
         Add('Comentario', ftString, 30, False);
         Add('Analitica', ftString, 10, False);
         Add('TantoRetencion', ftFloat, 0, False);
         Add('Nif', ftString, 15, False);
         Add('Banco', ftString, 10, False);
         Add('FechaVto', ftDate, 0, False);
         Add('CtoBanco', ftVarBytes, 3, False);
         Add('FormaPago', ftVarBytes, 3, False);
         Add('DiaPago1', ftInteger, 0, False);
         Add('DiaPago2', ftInteger, 0, False);
         Add('DiaPago3', ftInteger, 0, False);
      end;
      CreateDataset;
      Open;
      append;

      FieldByName('NUMEROFACTURA').AsString := '';
      FieldByName('NUMEROFACTURAINTRACOM').AsString := '';
      FieldByName('Fecha').AsDateTime := date;
      FieldByName('Moneda').AsString  := DmREf.QParametros.FieldByName('MONEDA').AsString;
      PonerPictures(FieldByName('moneda').AsString);

      FieldByName('CTOIVAINTRA').AsString := DMRef.QParametros.FieldByName('CTOIVAINTRA').AsString;
      if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
         FieldByName('CtoIva').AsString := DmRef.QParametros.FieldByName('CtoIvaCNormal').AsString;
      end
      else begin
         FieldByName('CtoIva').AsString := DmRef.QParametros.FieldByName('CtoIvaNormal').AsString;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.CrearFichero_QGastos;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QGastos, FieldDefs do begin
      Active := False;
      Clear;

      Add('SBCTA_IVA', ftString, 10, False);
      Add('SBCTA_IVA_DESC', ftString, 80, False);
      Add('CUOTA_IVA', ftFloat, 0, False);
      Add('BASE_IMPONIBLE_IVA', ftFloat, 0, False);
      Add('CONTRAPARTIDA', ftString, 10, False);
      Add('CONTRAPARTIDA_DESC', ftString, 80, False);
      Add('GENERADO', ftString, 1, False);
      Add('CTO_IVA', ftString, 3, False);

      if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
         FieldByName('CONTRAPARTIDA_DESC').LookupDataSet := DMContaRef.QSubctaAmortGastos;
         FieldByName('SBCTA_IVA_DESC').LookupDataSet     := DMContaRef.QSubCTAIVADeducibleIntra;
      end
      else begin
         FieldByName('CONTRAPARTIDA_DESC').LookupDataSet := DMContaRef.QSubctaVentas;
         FieldByName('SBCTA_IVA_DESC').LookupDataSet     := DMContaRef.QSubCTAIVARepercutidoIntra;
      end;

      CreateDataSet;
      Active := True;

      Append;
      if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
         FieldByName('SBCTA_IVA').AsString     := DMRef.QParametros.FieldByName('SCTAIVACNORMAL').AsString;
         FieldByName('CONTRAPARTIDA').AsString := DMRef.QParametros.FieldByName('SCTACOMPRAS').AsString;
      end
      else begin
         FieldByName('SBCTA_IVA').AsString     := DMRef.QParametros.FieldByName('SCTAIVANORMAL').AsString;
         FieldByName('CONTRAPARTIDA').AsString := DMRef.QParametros.FieldByName('SCTAVENTAS').AsString;
      end;
      Post;
      Edit;
   end;
end;

procedure TWCargaRapidaFacturas.PrepararQueryMovimientos;
var
   Asiento: Integer;
begin
   Asiento := DMRef.ObtenerValor('GEN_ID(ASIENTO, 0)', 'RDB$DATABASE', '');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QMovimientos, SelectSQL do begin
      DisableControls;
      Close;
      Transaction.active := True;
      Transaction.CommitRetaining;
      Clear;
      Add('SELECT');
      Add('   D.ASIENTO,D.APUNTE,D.FECHA,D.SUBCUENTA,D.ID_CONCEPTOS, D.DEBEHABER,');
      Add('   D.CONTRAPARTIDA,D.COMENTARIO,D.NUMEROFACTURA,D.CUENTA_ANALITICA,');
      Add('   C.DESCRIPCION DESCCONCEPTO, S.DESCRIPCION DESCSUBCUENTA,D.IMPORTE, S.ABREVIATURA,');
      Add('   D.TIPOASIENTO, D.ASIENTONOMINA, D.SERIE, D.EJERCICIO');
      Add('FROM DIARIO D, CONCEPTOS C, SUBCTAS S');
      Add('WHERE');
      Add('   D.ASIENTO >= :ASIENTO1 AND D.ASIENTO <= :ASIENTO2 AND');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS AND');
      Add('   D.SUBCUENTA = S.SUBCUENTA');
      Add('ORDER BY D.ASIENTO, D.APUNTE');
      Params.ByName('ASIENTO1').AsInteger := Asiento - 30;
      Params.ByName('ASIENTO2').AsInteger := Asiento;
      Prepare;
      EnableControls;
      Open;
      Last;
   end;
end;

procedure TWCargaRapidaFacturas.BtnEdtGuardarClick(Sender: TObject);
var
   nAsiento, nApunte, nAsientoFactura: Integer;
   lCondAnalitica: Boolean;
   nImpBase, nImpCli, nSumaIva: Double;
   cComentario, cSubctaRetVenta: String;
   QDiario:        TIbSql;
   DatosCorrectos: Boolean;
   ConceptoIVA, DebeHaberIVA, ComentarioIVA: String;
   BaseImponibleIVA, ImporteIVA: Double;

   procedure ComprobarDatosSubcuentasIVAValidos(var OK: Boolean);
   var
      Msg:        String;
      TotImporte: Double;
   begin
      OK := True;

      // Msg contendrá la información a presentar al usuario sobre los datos
      // que ha de introducir antes de guardar el registro.
      Msg := '';

      if QGastos.State in dsEditModes then   begin
         QGastos.Post;
      end;

      QGastos.DisableControls;
      QGastos.First;
      while not QGastos.EOF do begin
         if (QGastos.FieldByName('SBCTA_IVA').AsString = '') and
            (QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat = 0) and
            (QGastos.FieldByName('CUOTA_IVA').AsFloat = 0) then   begin
            QGastos.Delete;
         end
         else begin
            QGastos.Next;
         end;
      end;
      QGastos.First;
      QGastos.EnableControls;

      if QGastos.IsEmpty then   begin
         Msg := 'Debe seleccionar el tipo de I.V.A.';
         Paginas.Pages[0].Show;
         OK := False;
         DatabaseError(Msg);
      end
      else begin
         QGastos.DisableControls;
         QGastos.First;
         while not QGastos.EOF do begin
            if QGastos.FieldByName('SBCTA_IVA').AsString = '' then   begin
               Msg := Msg + 'No se puede dejar la subcta de IVA en blanco.' + #13;
            end;
            if QGastos.FieldByName('CONTRAPARTIDA').AsString = '' then   begin
               Msg := Msg + 'No se puede dejar la contrapartida en blanco.' + #13;
            end;
            if QGastos.FieldByName('CTO_IVA').AsString = '' then   begin
               Msg := Msg + 'No se puede dejar el concepto de IVA en blanco.' + #13;
            end;
            if (QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat = 0) and
               (QGastos.FieldByName('CUOTA_IVA').AsFloat = 0) and (QGastos.RecordCount > 1) and
               not oIntracomunitaria.Checked then   begin
               Msg := Msg + 'No se puede dejar la base imponible y la cuota en blanco.' + #13;
            end;

            if (QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat <> 0) and
               (QGastos.FieldByName('CUOTA_IVA').AsFloat = 0) and
               (DMRef.ObtenerValor('IVA', 'SUBCTAS', 'SUBCUENTA = "' +
               QGastos.FieldByName('SBCTA_IVA').AsString + '"') > 0) then   begin
               QGastos.Edit;
               if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then   begin
                  QGastos.FieldByName('CUOTA_IVA').AsFloat :=
                     RoundToDecimal(QFichero.FieldByName('IMPORTE').AsFloat -
                     QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat, 3, True);
               end
               else begin
                  Msg := Msg + 'No se puede dejar la cuota de IVA en blanco.' + #13;
               end;
               QGastos.Post;
            end
            else
            if (QGastos.FieldByName('CUOTA_IVA').AsFloat <> 0) and
               (QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat = 0) then   begin
               QGastos.Edit;
               if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then   begin
                  QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat :=
                     RoundToDecimal(QFichero.FieldByName('IMPORTE').AsFloat -
                     QGastos.FieldByName('CUOTA_IVA').AsFloat, 3, True);
               end
               else begin
                  Msg := Msg + 'No se puede dejar la base imponible en blanco.' + #13;
               end;
               QGastos.Post;
            end;

            // Si los datos especificados no son válidos, presentar mensaje de error.
            if Trim(Msg) <> '' then   begin
               Msg := Msg + 'Por favor, revise los datos de entrada.';

               QGastos.EnableControls;
               Paginas.Pages[0].Show;
               GridEdtSubcuentasIVA.SetFocus;
               OK := False;
               DatabaseError(Msg);
            end;

            QGastos.Next;
         end;

         QGastos.EnableControls;
      end;

      QGastos.First;
      if (QGastos.RecordCount > 1) and not oIntracomunitaria.Checked and
         (RoundToDecimal(QFichero.FieldByName('ImporteProntoPago').AsFloat, 3, True) = 0) then   begin
         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            TotImporte := 0;
            while not QGastos.EOF do begin
               QSubcuentas.Close;
               QSubcuentas.parambyname('subcuenta').AsString :=
                  QGastos.FieldByName('SBCTA_IVA').AsString;
               QSubcuentas.ExecQuery;

               TotImporte := TotImporte + QGastos.FieldByName('CUOTA_IVA').AsFloat;
               TotImporte := TotImporte + QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat +
                  QSubcuentas.FieldByName('recargo').AsFloat;
               if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then
               begin
                  TotImporte := TotImporte - RoundToDecimal(
                     QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat * 0.01 *
                     QFichero.FieldByName('TANTORETENCION').AsFloat, 3, True);
               end;
               QGastos.Next;
            end;
         end       // CARGA_FACTURAS_COMPRA
         else begin
            TotImporte := 0;
            while not QGastos.EOF do begin
               QSubcuentas.Close;
               QSubcuentas.parambyname('subcuenta').AsString :=
                  QGastos.FieldByName('SBCTA_IVA').AsString;
               QSubcuentas.ExecQuery;

               TotImporte := TotImporte + QGastos.FieldByName('CUOTA_IVA').AsFloat;
               TotImporte := TotImporte + QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat +
                  QSubcuentas.FieldByName('recargo').AsFloat;
               if QFichero.FieldByName('TANTORETENCION').AsFloat <> 0 then   begin
                  TotImporte := TotImporte + RoundToDecimal(
                     QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat * 0.01 *
                     QFichero.FieldByName('TANTORETENCION').AsFloat, 3, True);
               end;
               QGastos.Next;
            end;
         end;      // CARGA_FACTURAS_VENTA
         if Qfichero.FieldByName('ImporteRetVenta').AsFloat <> 0 then   begin
            TotImporte := TotImporte - Qfichero.FieldByName('importeRetVenta').AsFloat;
         end;
         if RoundToDecimal(TotImporte, 2, True) <> 0 then   begin
            if RoundToDecimal(TotImporte, 2, True) <> RoundToDecimal(
               QFichero.FieldByName('IMPORTE').AsFloat, 2, True) then   begin
               if MessageDlg('La factura está descuadrada.' + #13 + '¿Desea continuar?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
                  QGastos.EnableControls;
                  Paginas.Pages[0].Show;
                  GridEdtSubcuentasIVA.SetFocus;
                  OK := False;
               end;
            end;
         end;
      end else
      // Si sólo se especifica un tipo de IVA y se introduce la cuota de IVA y
      // la base imponible, generar el apunte de IVA sin tener en cuenta el
      // tipo de IVA de la subcuenta.
      if (QGastos.RecordCount = 1) and (QGastosCUOTA_IVA.AsFloat <> 0) and
         (QGastosBASE_IMPONIBLE_IVA.AsFloat <> 0) then   begin
         TotImporte := RoundToDecimal(QGastosCUOTA_IVA.AsFloat +
            QGastosBASE_IMPONIBLE_IVA.AsFloat, 3, True);
         if QFichero.FieldByName('TANTORETENCION').AsFloat <> 0 then   begin
            if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
               TotImporte := TotImporte - RoundToDecimal(QGastosBASE_IMPONIBLE_IVA.AsFloat *
                  0.01 * QFichero.FieldByName('TANTORETENCION').AsFloat, 3, True);
            end
            else begin
               TotImporte := TotImporte + RoundToDecimal(QGastosBASE_IMPONIBLE_IVA.AsFloat *
                  0.01 * QFichero.FieldByName('TANTORETENCION').AsFloat, 3, True);
            end;
         end;
         if Qfichero.FieldByName('ImporteRetVenta').AsFloat <> 0 then   begin
            TotImporte := TotImporte - Qfichero.FieldByName('importeRetVenta').AsFloat;
         end;
         if RoundToDecimal(TotImporte, 2, True) <> RoundToDecimal(
            QFichero.FieldByName('IMPORTE').AsFloat, 2, True) then   begin
            if MessageDlg('La factura está descuadrada.' + #13 + '¿Desea continuar?',
                          mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
               OK := False;
            end;
         end;
      end;

      QGastos.First;
   end;

begin
   Paginas.Pages[0].Show;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   NFactura.SetFocus;

   if not DMContaRef.FechaAsientoPerteneceEjercicio(QFichero.FieldByName('FECHA').AsDateTime) then  begin
      if MessageDlg('La fecha de factura no pertenece al ejercicio actual.' + #13 +
                    '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   // Verificar numero de factura.
   if Empty(QFichero.FieldByName('numerofactura').AsString) then begin
      if MessageDlg('No ha indicado número de factura ¿Confirma?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
         nFactura.SetFocus;
         Exit;
      end;
   end
   else begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSql.Create(nil), SQL do begin
         //TODO: Database := DMRef.IBDSiamCont;
         Clear;
         Add('select asiento from diario');
         Add(' where subcuenta=:subcuenta and numerofactura=:numerofactura');
         Add(' and debehaber=:debehaber and fecha>=:fechaIni and fecha<=:FechaFin');
         prepare;
         parambyname('fechaIni').AsDateTime    :=
            DmRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
         parambyname('fechaFin').AsDateTime    := DmRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
         parambyname('debehaber').AsString     := cTipoDH;
         parambyname('subcuenta').AsString     := QFichero.FieldByName('subcuenta').AsString;
         parambyname('numerofactura').AsString := QFichero.FieldByName('numerofactura').AsString;
         Execquery;
         nAsiento := FieldByName('asiento').AsInteger;
         Close;
         Free;
         if nAsiento > 0 then   begin
            DatabaseError('Factura ' + Trim(QFichero.FieldByName('numerofactura').AsString) +
               ' duplicada en asiento nº ' + Trim(IntToStr(nAsiento)) + '.');
         end;
      end;
   end;

   // Verificar importe.
   if RoundToDecimal(QFichero.FieldByName('importe').AsFloat, 3, True) = 0 then begin
      nImporte.SetFocus;
      DatabaseError('El importe no puede ser cero.');
   end;

   // Verificar subcuenta no este vacia
   if empty(QFichero.FieldByName('Subcuenta').AsString) then begin
      if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
         dblSubcuentaN.SetFocus;
      end
      else begin
         dblSubcuenta.SetFocus;
      end;
      DatabaseError('La subcuenta Cliente/Proveedor seleccionada no puede estar vacía.');
   end;

   if QFichero.FieldByName('CtoSubcuenta').AsString = '' then begin
      eConcepto.SetFocus;
      DatabaseError('El concepto de Cliente/Proveedor no puede estar vacío.');
   end;
   if QFichero.FieldByName('CtoContra').AsString = '' then begin
      eConceptoVentaCompra.SetFocus;
      DatabaseError('El concepto de Ventas/Compras no puede estar vacío.');
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      //TODO: Database := DMRef.IBDSiamCont;
      Close;
      Clear;
      Add('select descripcion,iva,recargo,profesional,arrendador,contrapartida,');
      Add('       formapago, diapago1, diapago2, diapago3, tipoiva,            ');
      Add('       intracomunitario,subctaret from subctas                      ');
      Add(' where subcuenta=:subcuenta                                         ');
      prepare;
   end;

   // Comprobar tipos de IVA
   ComprobarDatosSubcuentasIVAValidos(DatosCorrectos);

   // Verificar q tiene subcuenta retencion ventas
   if QFichero.FieldByName('importeRetVenta').AsFloat <> 0 then begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         QFichero.FieldByName('Subcuenta').AsString;
      QSubcuentas.ExecQuery;
      cSubCtaRetVenta := QSubcuentas.FieldByName('SubctaRet').AsString;
      if empty(QSubcuentas.FieldByName('SubctaRet').AsString) then   begin
         DatabaseError('No tiene subcuenta de retención en el cliente seleccionado en esta factura.');
      end;
   end;


   if not DatosCorrectos then   begin
      Exit;
   end;

   QGastos.First;

   // Chequeos
   if cbRealizar.Checked then  begin
      if empty(QFichero.FieldByName('Banco').AsString) then   begin
         if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
            dblBancoN.SetFocus;
         end
         else begin
            dblBanco.SetFocus;
         end;
         DatabaseError('La subcuenta de Banco / Caja seleccionada no puede estar vacía.');
      end;
      // Verificar fecha de cobro/pago
      if QFichero.FieldByName('FechaVto').AsDateTime = 0 then   begin
         dfechaCobro.SetFocus;
         DatabaseError('Fecha de Cobro / Pago no válida.');
      end;
      if empty(QFichero.FieldByName('CtoBanco').AsString) then   begin
         dblCtoBanco.SetFocus;
         DatabaseError('El Concepto Banco / Caja seleccionado no puede estar vacío.');
      end;
   end;

   // Generacion del asiento
   nAsiento        := DMContaRef.ObtenerNumeroAsiento;
   nAsientoFactura := nAsiento;
   lCondAnalitica  := not empty(QFichero.FieldByName('analitica').AsString);

   QDiario := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario, Sql do begin
      //TODO: Database := DMRef.IBDSiamCont;
      Close;
      Clear;
      Add('INSERT INTO DIARIO ');
      Add('   (TIPOASIENTO, APUNTE, ASIENTO, COMENTARIO, NIF,');
      if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then begin
         Add('CONTRAPARTIDA,');
      end;
      Add('    DEBEHABER, FECHA, ID_CONCEPTOS,');
      if lCondAnalitica then begin
         Add('CUENTA_ANALITICA,');
      end;
      Add('    IMPORTE, MONEDA, NUMEROFACTURA, PUNTEO, SUBCUENTA)');
      Add('VALUES');
      Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO,:COMENTARIO, :NIF,');
      if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then begin
         Add(':CONTRAPARTIDA,');
      end;
      Add('    :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
      if lCondAnalitica then begin
         Add(':ANALITICA,');
      end;
      Add('    :IMPORTE, :MONEDA, :NUMEROFACTURA, :PUNTEO, :SUBCUENTA)');

      // apunte 1
      // Si la factura es intracomunitaria, el apunte de compras es el 1
      if oIntracomunitaria.Checked then   begin
         nApunte := 2;
      end
      else begin
         nApunte := 1;
      end;
      if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
         ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
      end
      else begin
         ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
      end;

      parambyname('Apunte').AsInteger := nApunte;
      Inc(nApunte);
      parambyname('asiento').AsInteger := nAsiento;
      parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
      parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         QFichero.FieldByName('subcuenta').AsString;
      QSubcuentas.ExecQuery;

      lProfesional := (QSubcuentas.FieldByName('profesional').AsString = 'S');
      lArrendador  := (QSubcuentas.FieldByName('arrendador').AsString = 'S');
      lIntracom    := (QSubcuentas.FieldByName('INTRACOMUNITARIO').AsString = 'S');

      parambyname('subcuenta').AsString := QFichero.FieldByName('subcuenta').AsString;

      if lCondAnalitica then   begin
         parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
      end;

      if QFichero.FieldByName('subcuenta').AsString = DmRef.QParametros.FieldByName(
         'Vgenerica').AsString then   begin
         parambyname('id_Conceptos').AsString := DmRef.QParametros.FieldByName('CtoCobroF').AsString;
      end
      else
      if QFichero.FieldByName('subcuenta').AsString = DmRef.QParametros.FieldByName(
         'VgenericaC').AsString then   begin
         parambyname('id_Conceptos').AsString := DmRef.QParametros.FieldByName('CtoPagoF').AsString;
      end
      else begin
         parambyname('id_Conceptos').AsString := QFichero.FieldByName('CtoSubcuenta').AsString;
      end;

      if TipoCarga = CARGA_FACTURAS_COMPRA then begin
         parambyname('DebeHaber').AsString := 'H';
      end
      else begin
         parambyname('DebeHaber').AsString := 'D';
      end;

      if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then   begin
         parambyname('Contrapartida').AsString := QGastos.FieldByName('CONTRAPARTIDA').AsString;
      end;

      parambyname('Importe').AsFloat :=
         RoundToDecimal(QFichero.FieldByName('Importe').AsFloat, 3, True);

      nImpCli := parambyname('importe').AsFloat;

      parambyname('numerofactura').AsString :=
         QFichero.FieldByName('numerofactura').AsString;

      if cbRealizar.Checked then begin
         parambyname('punteo').AsString := 'S';
      end
      else begin
         parambyname('punteo').AsString := 'N';
      end;

      cComentario := Copy(QSubcuentas.FieldByName('descripcion').AsString, 1, 40);
      if empty(QFichero.FieldByName('Comentario').AsString) then   begin
         parambyname('comentario').AsString := cComentario;
      end
      else begin
         parambyname('comentario').AsString := QFichero.FieldByName('comentario').AsString;
      end;

      parambyname('NIF').AsString := QFichero.FieldByName('NIF').AsString;

      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 1


      nSumaIva := 0;
      nImpBase := 0;

      // Factura Intracomunitaria
      if oIntracomunitaria.Checked then   begin
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (TIPOASIENTO, APUNTE, ASIENTO, BASEIMPONIBLE, COMENTARIO, NIF, RECARGO,');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS, CUOTAIVA,CUOTARECARGO,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :BASEIMPONIBLE, :COMENTARIO, :NIF,:RECARGO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,:CUOTAIVA,:CUOTARECARGO,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

         QGastos.First;
         while not QGastos.EOF do begin
            Close;

            if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
               ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
            end
            else begin
               ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
            end;

            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger := nAsiento;
            parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
            parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

            QSubcuentas.Close;
            QSubcuentas.parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;
            QSubcuentas.ExecQuery;

            parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;

            if lCondAnalitica then   begin
               parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
            end;

            if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
               if DMContaRef.ObtenerTipoSubcuenta(QGastos.FieldByName('SBCTA_IVA').AsString) = 'R' then
               begin
                  parambyname('DebeHaber').AsString    := 'H';
                  //             parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVAIntra').asstring;
                  parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;
               end
               else begin
                  parambyname('DebeHaber').AsString    := 'D';
                  //             parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVA').asstring;
                  parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;
               end;
            end
            else begin
               if (QSubcuentas.FieldByName('TIPOIVA').AsString = 'C') or
                  (QSubcuentas.FieldByName('TIPOIVA').AsString = 'A') then   begin
                  parambyname('DebeHaber').AsString    := 'D';
                  //            parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVAIntra').asstring;
                  parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;
               end
               else begin
                  parambyname('DebeHaber').AsString    := 'H';
                  //            parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVA').asstring;
                  parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;
               end;
            end;


            if lIntracom and (DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString <> '') then
            begin
               if (QSubcuentas.FieldByName('TIPOIVA').AsString = 'C') or
                  (QSubcuentas.FieldByName('TIPOIVA').AsString = 'A') then   begin
                  ParamByName('CONTRAPARTIDA').AsString := DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString;
               end
               else begin
                  parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;
               end;
            end
            else begin
               parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;
            end;

            parambyname('Iva').AsFloat := QSubcuentas.FieldByName('iva').AsFloat;

            parambyname('recargo').AsFloat := QSubcuentas.FieldByName('recargo').AsFloat;

            nImpBase := nImpCli;

            parambyname('importe').AsFloat :=
               RoundToDecimal(nImpBase * ((0.01 * parambyname('iva').AsFloat) +
               (0.01 * parambyname('recargo').AsFloat)), 3, True);

            parambyname('baseimponible').AsFloat := RoundToDecimal(nImpBase, 3, True);

            if RoundToDecimal(parambyname('recargo').AsFloat, 3, True) = 0 then   begin
               parambyname('cuotaiva').AsFloat     := parambyname('importe').AsFloat;
               parambyname('cuotarecargo').AsFloat := 0;
            end
            else begin
               parambyname('cuotaiva').AsFloat     := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('iva').AsFloat;
               parambyname('cuotarecargo').AsFloat := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('recargo').AsFloat;
            end;

            if lIntracom and (QFichero.FieldByName('NUMEROFACTURAINTRACOM').AsString <> '') then
            begin
               if (QSubcuentas.FieldByName('TIPOIVA').AsString = 'C') or
                  (QSubcuentas.FieldByName('TIPOIVA').AsString = 'A') then   begin
                  ParamByName('NUMEROFACTURA').AsString := QFichero.FieldByName('NUMEROFACTURAINTRACOM').AsString;
               end
               else begin
                  parambyname('numerofactura').AsString := QFichero.FieldByName('numerofactura').AsString;
               end;
            end
            else begin
               parambyname('numerofactura').AsString :=
                  QFichero.FieldByName('numerofactura').AsString;
            end;

            if empty(QFichero.FieldByName('Comentario').AsString) then   begin
               parambyname('comentario').AsString := cComentario;
            end
            else begin
               parambyname('comentario').AsString :=
                  QFichero.FieldByName('comentario').AsString;
            end;

            parambyname('NIF').AsString := QFichero.FieldByName('NIF').AsString;

            ConceptoIVA      := ParamByName('ID_CONCEPTOS').AsString;
            DebeHaberIVA     := ParamByname('DEBEHABER').AsString;
            BaseImponibleIVA := ParamByName('BASEIMPONIBLE').AsFloat;
            ImporteIVA       := ParamByName('IMPORTE').AsFloat;
            ComentarioIVA    := ParamByName('COMENTARIO').AsString;

            ExecQuery;
            Transaction.CommitRetaining;

            // Generar un nuevo apunte contra la subcuenta genérica intracomunitaria
            // por cada subcuenta de IVA
            if lIntracom and (DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString <> '') then
            begin
               if (QSubcuentas.FieldByName('TIPOIVA').AsString = 'C') or
                  (QSubcuentas.FieldByName('TIPOIVA').AsString = 'A') then   begin
                  Close;

                  if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
                     ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
                  end
                  else begin
                     ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
                  end;

                  ParamByName('APUNTE').AsInteger := nApunte;
                  Inc(nApunte);
                  ParamByName('ASIENTO').AsInteger     := nAsiento;
                  ParamByName('BASEIMPONIBLE').AsFloat := 0;
                  ParamByName('COMENTARIO').AsString   := ComentarioIVA;
                  ParamByName('NIF').AsString          := QFichero.FieldByName('NIF').AsString;
                  ParamByName('RECARGO').AsFloat       := 0;
                  ParamByName('CONTRAPARTIDA').AsVariant := null;
                  ParamByName('DEBEHABER').AsString    := DebeHaberIVA;
                  ParamByName('FECHA').AsDateTime      := QFichero.FieldByName('FECHA').AsDateTime;
                  ParamByName('ID_CONCEPTOS').AsString := ConceptoIVA;
                  ParamByName('CUOTAIVA').AsFloat      := 0;
                  ParamByName('CUOTARECARGO').AsFloat  := 0;
                  if lCondAnalitica then   begin
                     ParamByName('ANALITICA').AsString := QFichero.FieldByName('ANALITICA').AsString;
                  end;
                  ParamByName('IMPORTE').AsFloat := BaseImponibleIVA + ImporteIVA;
                  ParamByName('IVA').AsFloat     := 0;
                  ParamByName('MONEDA').AsString := QFichero.FieldByName('MONEDA').AsString;
                  if (QFichero.FieldByName('NUMEROFACTURAINTRACOM').AsString <> '') then   begin
                     ParamByName('NUMEROFACTURA').AsString := QFichero.FieldByName('NUMEROFACTURAINTRACOM').AsString;
                  end
                  else begin
                     ParamByName('NUMEROFACTURA').AsString := QFichero.FieldByName('NUMEROFACTURA').AsString;
                  end;
                  ParamByName('SUBCUENTA').AsString :=
                     DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString;
                  ExecQuery;
                  Transaction.CommitRetaining;
               end;
            end;

            QGastos.Next;
         end;
      end     // if oIntracomunitaria.Checked then

      // Apunte 2
      else
      if QGastos.RecordCount > 1 then // Varios I.V.A.
      begin
         QGastos.First;
         while not QGastos.EOF do begin
            QSubcuentas.Close;
            QSubcuentas.parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;
            QSubcuentas.ExecQuery;

            if (RoundToDecimal(QGastos.FieldByName('CUOTA_IVA').AsFloat, 3, True) <> 0) or
               (QSubcuentas.FieldByName('IVA').AsFloat = 0) then   begin
               // Apunte IVA
               Close;
               Clear;
               Add('INSERT INTO DIARIO ');
               Add('   (TIPOASIENTO, APUNTE, ASIENTO, BASEIMPONIBLE, COMENTARIO, NIF, RECARGO,');
               Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS, CUOTAIVA,CUOTARECARGO,');
               if lCondAnalitica then begin
                  Add('CUENTA_ANALITICA,');
               end;
               Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
               Add('VALUES');
               Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :BASEIMPONIBLE, :COMENTARIO, :NIF,:RECARGO,');
               Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,:CUOTAIVA,:CUOTARECARGO,');
               if lCondAnalitica then begin
                  Add(':ANALITICA,');
               end;
               Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

               if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
                  ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
               end
               else begin
                  ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
               end;

               parambyname('Apunte').AsInteger := nApunte;
               Inc(nApunte);
               parambyname('asiento').AsInteger := nAsiento;
               parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
               parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

               QSubcuentas.Close;
               QSubcuentas.parambyname('subcuenta').AsString :=
                  QGastos.FieldByName('SBCTA_IVA').AsString;
               QSubcuentas.ExecQuery;

               parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;

               if lCondAnalitica then   begin
                  parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
               end;

               //          parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVA').asstring;
               parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;

               if TipoCarga = CARGA_FACTURAS_COMPRA then begin
                  parambyname('DebeHaber').AsString := 'D';
               end
               else begin
                  parambyname('DebeHaber').AsString := 'H';
               end;

               parambyname('Fecha').AsDateTime := QFichero.FieldByName('fecha').AsDateTime;

               parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;

               parambyname('Iva').AsFloat := QSubcuentas.FieldByName('iva').AsFloat;

               parambyname('recargo').AsFloat := QSubcuentas.FieldByName('recargo').AsFloat;

               parambyname('importe').AsFloat :=
                  RoundToDecimal(QGastos.FieldByName('CUOTA_IVA').AsFloat, 3, True);

               parambyname('baseimponible').AsFloat :=
                  RoundToDecimal(QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat, 3, True);

{          parambyname('baseimponible').asfloat:=
            RoundToDecimal(100*(parambyname('importe').asfloat/
            (parambyname('iva').asfloat+parambyname('recargo').asfloat)),3,True);}

               if RoundToDecimal(parambyname('recargo').AsFloat, 3, True) = 0 then   begin
                  parambyname('cuotaiva').AsFloat     := parambyname('importe').AsFloat;
                  parambyname('cuotarecargo').AsFloat := 0;
               end
               else begin
                  parambyname('cuotaiva').AsFloat     :=
                     QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat * 0.01 * parambyname('iva').AsFloat;
                  parambyname('cuotarecargo').AsFloat := parambyname('baseimponible').AsFloat * 0.01 *
                     parambyname('recargo').AsFloat;
               end;

               nSumaIva := RoundTodecimal(nSumaIva + QGastos.FieldByName('CUOTA_IVA').AsFloat, 3, True);

               parambyname('numerofactura').AsString :=
                  QFichero.FieldByName('numerofactura').AsString;

               if empty(QFichero.FieldByName('Comentario').AsString) then   begin
                  parambyname('comentario').AsString := cComentario;
               end
               else begin
                  parambyname('comentario').AsString :=
                     QFichero.FieldByName('comentario').AsString;
               end;

               parambyname('NIF').AsString := QFichero.FieldByName('NIF').AsString;
               ExecQuery;
               Transaction.CommitRetaining;
               // Final Apunte IVA


               // Apunte Gasto o Ventas
               Close;
               Clear;
               Add('INSERT INTO DIARIO ');
               Add('   (TIPOASIENTO, APUNTE, ASIENTO, COMENTARIO, ');
               Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS,');
               if lCondAnalitica then begin
                  Add('CUENTA_ANALITICA,');
               end;
               Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
               Add('VALUES');
               Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :COMENTARIO,');
               Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
               if lCondAnalitica then begin
                  Add(':ANALITICA,');
               end;
               Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

               if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
                  ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
               end
               else begin
                  ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
               end;

               parambyname('Apunte').AsInteger := nApunte;
               Inc(nApunte);
               parambyname('asiento').AsInteger := nAsiento;
               parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
               parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

               parambyname('subcuenta').AsString :=
                  QGastos.FieldByName('CONTRAPARTIDA').AsString;

               if lCondAnalitica then   begin
                  parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
               end;

               parambyname('id_Conceptos').AsString := QFichero.FieldByName('CtoContra').AsString;

               if TipoCarga = CARGA_FACTURAS_COMPRA then begin
                  parambyname('DebeHaber').AsString := 'D';
               end
               else begin
                  parambyname('DebeHaber').AsString := 'H';
               end;

               parambyname('Fecha').AsDateTime := QFichero.FieldByName('fecha').AsDateTime;

               parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;

               parambyname('Importe').AsFloat :=
                  RoundToDecimal(QGastos.FieldByName('BASE_IMPONIBLE_IVA').AsFloat, 3, True);

{          parambyname('Importe').asfloat:=
           RoundToDecimal(100*
            (QGastos.FieldByName('CUOTA_IVA').AsFloat /
             (QSubcuentas.fieldbyname('Iva').asfloat+
              QSubcuentas.fieldbyname('Recargo').asfloat)),3,True);}

               parambyname('numerofactura').AsString :=
                  QFichero.FieldByName('numerofactura').AsString;

               if empty(QFichero.FieldByName('Comentario').AsString) then   begin
                  parambyname('comentario').AsString := cComentario;
               end
               else begin
                  parambyname('comentario').AsString :=
                     QFichero.FieldByName('comentario').AsString;
               end;

               ExecQuery;
               Transaction.CommitRetaining;
               // Final Apunte Gasto o Ventas
            end; // Final
            QGastos.Next;
         end;
      end

      else // Solo un tipo de Iva
      begin
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (TIPOASIENTO, APUNTE, ASIENTO, BASEIMPONIBLE, COMENTARIO, NIF, RECARGO,');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS, CUOTAIVA,CUOTARECARGO,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :BASEIMPONIBLE, :COMENTARIO, :NIF,:RECARGO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,:CUOTAIVA,:CUOTARECARGO,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
         end
         else begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
         end;

         parambyname('Apunte').AsInteger := 2;
         Inc(nApunte);
         parambyname('asiento').AsInteger := nAsiento;
         parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
         parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

         QSubcuentas.Close;
         QSubcuentas.parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;
         QSubcuentas.ExecQuery;

         parambyname('subcuenta').AsString := QGastos.FieldByName('SBCTA_IVA').AsString;

         if lCondAnalitica then   begin
            parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
         end;

         //      parambyname('id_Conceptos').asstring:=QFichero.fieldbyname('CtoIVA').asstring;
         parambyname('id_Conceptos').AsString := QGastos.FieldByName('Cto_IVA').AsString;

         if TipoCarga = CARGA_FACTURAS_COMPRA then begin
            parambyname('DebeHaber').AsString := 'D';
         end
         else begin
            parambyname('DebeHaber').AsString := 'H';
         end;

         parambyname('Fecha').AsDateTime := QFichero.FieldByName('fecha').AsDateTime;

         parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;

         parambyname('Iva').AsFloat := QSubcuentas.FieldByName('iva').AsFloat;

         parambyname('recargo').AsFloat := QSubcuentas.FieldByName('recargo').AsFloat;

         // Si sólo se especifica un tipo de IVA y se introduce la cuota de IVA y
         // la base imponible, generar el apunte de IVA sin tener en cuenta el
         // tipo de IVA de la subcuenta.
         if (QGastosCUOTA_IVA.AsFloat <> 0) and (QGastosBASE_IMPONIBLE_IVA.AsFloat <> 0) then   begin
            ParamByName('IMPORTE').AsFloat       := QGastosCUOTA_IVA.AsFloat;
            ParamByName('BASEIMPONIBLE').AsFloat := QGastosBASE_IMPONIBLE_IVA.AsFloat;
            if RoundToDecimal(parambyname('recargo').AsFloat, 3, True) = 0 then   begin
               parambyname('cuotaiva').AsFloat     := parambyname('importe').AsFloat;
               parambyname('cuotarecargo').AsFloat := 0;
            end
            else begin
               parambyname('cuotaiva').AsFloat     := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('iva').AsFloat;
               parambyname('cuotarecargo').AsFloat := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('recargo').AsFloat;
            end;
            nImpBase := QGastosBASE_IMPONIBLE_IVA.AsFloat;
         end
         else begin
            if QFichero.FieldByName('TantoRetencion').AsFloat > 0 then   begin
               nImpBase := nImpCli / ((1 + (0.01 * parambyname('iva').AsFloat) +
                  (0.01 * parambyname('recargo').AsFloat)) - (0.01 * QFichero.FieldByName('TantoRetencion').AsFloat));

               parambyname('importe').AsFloat :=
                  RoundToDecimal(nImpBase * ((0.01 * parambyname('iva').AsFloat) +
                  (0.01 * parambyname('recargo').AsFloat)), 3, True);
            end
            else begin
               nImpBase := nImpCli / (1 + (0.01 * parambyname('iva').AsFloat) +
                  (0.01 * parambyname('recargo').AsFloat));

               parambyname('importe').AsFloat := RoundToDecimal(nImpCli - nImpBase, 3, True);
            end;

            parambyname('baseimponible').AsFloat := RoundToDecimal(nImpBase, 3, True);


            if RoundToDecimal(parambyname('recargo').AsFloat, 3, True) = 0 then   begin
               parambyname('cuotaiva').AsFloat     := parambyname('importe').AsFloat;
               parambyname('cuotarecargo').AsFloat := 0;
            end
            else begin
               parambyname('cuotaiva').AsFloat     := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('iva').AsFloat;
               parambyname('cuotarecargo').AsFloat := parambyname('baseimponible').AsFloat * 0.01 *
                  parambyname('recargo').AsFloat;
            end;
         end;

         parambyname('numerofactura').AsString :=
            QFichero.FieldByName('numerofactura').AsString;

         if empty(QFichero.FieldByName('Comentario').AsString) then   begin
            parambyname('comentario').AsString := cComentario;
         end
         else begin
            parambyname('comentario').AsString :=
               QFichero.FieldByName('comentario').AsString;
         end;

         parambyname('NIF').AsString := QFichero.FieldByName('NIF').AsString;
         ExecQuery;
         Transaction.CommitRetaining;
      end;  // Apunte 2
            // Final un solo tipo de IVA


      QGastos.First;
      if (QGastos.RecordCount = 1) or oIntracomunitaria.Checked then   begin
         // Apunte 3
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (TIPOASIENTO, APUNTE, ASIENTO, COMENTARIO, ');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :COMENTARIO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
         end
         else begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
         end;

         // Si la factura es intracomunitaria, el apunte de compras es el 1
         if oIntracomunitaria.Checked then   begin
            ParamByName('APUNTE').AsInteger := 1;
         end
         else begin
            parambyname('Apunte').AsInteger := nApunte;
         end;

         Inc(nApunte);
         parambyname('asiento').AsInteger := nAsiento;
         parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
         parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

         parambyname('subcuenta').AsString := QGastos.FieldByName('CONTRAPARTIDA').AsString;

         if lCondAnalitica then   begin
            parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
         end;

         parambyname('id_Conceptos').AsString := QFichero.FieldByName('CtoContra').AsString;

         if TipoCarga = CARGA_FACTURAS_COMPRA then begin
            parambyname('DebeHaber').AsString := 'D';
         end
         else begin
            parambyname('DebeHaber').AsString := 'H';
         end;

         parambyname('Fecha').AsDateTime := QFichero.FieldByName('fecha').AsDateTime;

         parambyname('Contrapartida').AsString := QFichero.FieldByName('SUBCUENTA').AsString;

         // Defecto
         if QGastos.RecordCount > 1 then   begin
            parambyname('Importe').AsFloat :=
               RoundToDecimal(QFichero.FieldByName('importe').AsFloat - nSumaIva, 3, True);
         end
         else begin
            parambyname('Importe').AsFloat := RoundToDecimal(nImpBase, 3, True);
         end;

         if RoundToDecimal(QFichero.FieldByName('ImporteProntoPago').AsFloat, 3, True) <> 0 then   begin
            parambyname('Importe').AsFloat := RoundToDecimal(nImpBase +
               QFichero.FieldByName('ImporteProntoPago').AsFloat, 3, True);
         end;

         parambyname('numerofactura').AsString :=
            QFichero.FieldByName('numerofactura').AsString;

         if empty(QFichero.FieldByName('Comentario').AsString) then   begin
            parambyname('comentario').AsString := cComentario;
         end
         else begin
            parambyname('comentario').AsString :=
               QFichero.FieldByName('comentario').AsString;
         end;

         ExecQuery;
         Transaction.CommitRetaining;
      end; // cbIva.Itemindex<>4

      if (RoundToDecimal(QFichero.FieldByName('ImporteProntoPago').AsFloat, 3, True) <> 0) or
         (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) or
         (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
         // Apunte 4
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (TIPOASIENTO, APUNTE, ASIENTO, COMENTARIO, ');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:TIPOASIENTO, :APUNTE, :ASIENTO, :COMENTARIO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_COMPRA;
         end
         else begin
            ParamByName('TIPOASIENTO').AsInteger := ASIENTO_FACTURA_VENTA;
         end;

         parambyname('Apunte').AsInteger  := nApunte;
         parambyname('asiento').AsInteger := nAsiento;
         parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
         parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

         if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
            if lProfesional then   begin
               parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SctaRetProf').AsString;
            end
            else begin
               parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SctaRetArre').AsString;
            end;
         end
         else
         if (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) then   begin
            parambyname('subcuenta').AsString := cSubctaRetVenta;
         end
         else begin
            if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
               parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SctaDtoPpc').AsString;
            end
            else begin
               parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SctaDtoPpv').AsString;
            end;
         end;

         if lCondAnalitica then   begin
            parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
         end;

         if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
            if lProfesional then   begin
               parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoRetProf').AsString;
            end
            else begin
               parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoRetArre').AsString;
            end;
         end
         else
         if (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) then   begin
            parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoClientes').AsString;
         end
         else begin
            if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
               parambyname('id_Conceptos').AsString := DmRef.QParametros.FieldByName('CtoDtoPPc').AsString;
            end
            else begin
               parambyname('id_Conceptos').AsString := DmRef.QParametros.FieldByName('CtoDtoPPv').AsString;
            end;
         end;

         if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
            parambyname('DebeHaber').AsString := 'H';
         end
         else
         if (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) then   begin
            parambyname('DebeHaber').AsString := 'D';
         end
         else
         if TipoCarga = CARGA_FACTURAS_COMPRA then begin
            parambyname('DebeHaber').AsString := 'H';
         end
         else begin
            parambyname('DebeHaber').AsString := 'D';
         end;

         parambyname('Fecha').AsDateTime := QFichero.FieldByName('fecha').AsDateTime;

         parambyname('Contrapartida').AsString :=
            QFichero.FieldByName('Subcuenta').AsString;

         if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
            parambyname('Importe').AsFloat :=
               RoundToDecimal(nImpBase * (0.01 * QFichero.FieldByName('TantoRetencion').AsFloat), 3, True);
         end
         else
         if (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) then   begin
            parambyname('Importe').AsFloat := RoundToDecimal(
               QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True);
         end
         else begin
            parambyname('Importe').AsFloat := RoundToDecimal(
               QFichero.FieldByName('ImporteProntoPago').AsFloat, 3, True);
         end;

         parambyname('numerofactura').AsString :=
            QFichero.FieldByName('numerofactura').AsString;

         if empty(QFichero.FieldByName('Comentario').AsString) then   begin
            parambyname('comentario').AsString := cComentario;
         end
         else begin
            parambyname('comentario').AsString :=
               QFichero.FieldByName('comentario').AsString;
         end;

         ExecQuery;
         Transaction.CommitRetaining;
      end;
   end;

   if cbRealizar.Checked then   begin
      // Generacion del asiento del banco
      nAsiento := DMContaRef.ObtenerNumeroAsiento;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QDiario, Sql do begin
         // apunte 1 banco
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (APUNTE, ASIENTO, COMENTARIO, ');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS, PUNTEO,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:APUNTE, :ASIENTO, :COMENTARIO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS, :PUNTEO,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');

         parambyname('Apunte').AsInteger  := 1;
         parambyname('asiento').AsInteger := nAsiento;
         parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
         parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

         if TipoCarga = CARGA_FACTURAS_VENTA then   begin
            parambyname('subcuenta').AsString     := QFichero.FieldByName('banco').AsString;
            parambyname('Contrapartida').AsString := QFichero.FieldByName('subcuenta').AsString;
            ParamByName('PUNTEO').AsString        := '';
         end
         else begin
            parambyname('subcuenta').AsString     := QFichero.FieldByName('subcuenta').AsString;
            parambyname('Contrapartida').AsString := QFichero.FieldByName('banco').AsString;
            ParamByName('PUNTEO').AsString        := 'S';
         end;

         if lCondAnalitica then   begin
            parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
         end;

         parambyname('id_Conceptos').AsString := QFichero.FieldByName('CtoBanco').AsString;

         parambyname('DebeHaber').AsString := 'D';

         parambyname('Fecha').AsDateTime := QFichero.FieldByName('fechavto').AsDateTime;


         parambyname('importe').AsFloat :=
            RoundToDecimal(QFichero.FieldByName('importe').AsFloat, 3, True);

         parambyname('numerofactura').AsString := QFichero.FieldByName('numerofactura').AsString;

         if not empty(QFichero.FieldByName('Comentario').AsString) then   begin
            parambyname('comentario').AsString :=
               QFichero.FieldByName('comentario').AsString;
         end
         else begin
            QSubcuentas.Close;
            QSubcuentas.parambyname('subcuenta').AsString :=
               QFichero.FieldByName('subcuenta').AsString;
            QSubcuentas.ExecQuery;
            parambyname('comentario').AsString :=
               QSubcuentas.FieldByName('descripcion').AsString;
         end;
         ExecQuery;
         Transaction.CommitRetaining;

         // Apunte 2 banco
         Close;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('   (APUNTE, ASIENTO, COMENTARIO, PUNTEO,');
         Add('    CONTRAPARTIDA, DEBEHABER, FECHA, ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add('CUENTA_ANALITICA,');
         end;
         Add('    IMPORTE, IVA, MONEDA, NUMEROFACTURA, SUBCUENTA)');
         Add('VALUES');
         Add('   (:APUNTE, :ASIENTO, :COMENTARIO, :PUNTEO,');
         Add('    :CONTRAPARTIDA, :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
         if lCondAnalitica then begin
            Add(':ANALITICA,');
         end;
         Add('    :IMPORTE, :IVA, :MONEDA, :NUMEROFACTURA, :SUBCUENTA)');
         parambyname('Apunte').AsInteger  := 2;
         parambyname('asiento').AsInteger := nAsiento;
         parambyname('Fecha').AsDateTime  := QFichero.FieldByName('fecha').AsDateTime;
         parambyname('moneda').AsString   := Qfichero.FieldByName('moneda').AsString;

         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            parambyname('subcuenta').AsString     := QFichero.FieldByName('banco').AsString;
            parambyname('Contrapartida').AsString := QFichero.FieldByName('subcuenta').AsString;
            ParamByName('PUNTEO').AsString        := '';
         end
         else begin
            parambyname('subcuenta').AsString     := QFichero.FieldByName('subcuenta').AsString;
            parambyname('Contrapartida').AsString := QFichero.FieldByName('banco').AsString;
            ParamByName('PUNTEO').AsString        := 'S';
         end;

         if lCondAnalitica then   begin
            parambyname('analitica').AsString := QFichero.FieldByName('Analitica').AsString;
         end;

         parambyname('id_Conceptos').AsString := QFichero.FieldByName('CtoBanco').AsString;

         parambyname('DebeHaber').AsString := 'H';

         parambyname('Fecha').AsDateTime := QFichero.FieldByName('fechavto').AsDateTime;

         parambyname('importe').AsFloat :=
            RoundToDecimal(QFichero.FieldByName('importe').AsFloat, 3, True);

         parambyname('numerofactura').AsString := QFichero.FieldByName('numerofactura').AsString;

         if not empty(QFichero.FieldByName('Comentario').AsString) then   begin
            parambyname('comentario').AsString :=
               QFichero.FieldByName('comentario').AsString;
         end
         else begin
            QSubcuentas.Close;
            QSubcuentas.parambyname('subcuenta').AsString :=
               QFichero.FieldByName('subcuenta').AsString;
            QSubcuentas.ExecQuery;
            parambyname('comentario').AsString :=
               QSubcuentas.FieldByName('descripcion').AsString;
         end;
         ExecQuery;
         Transaction.CommitRetaining;
      end;
   end;

   if cbRealizar.Checked then begin
      MessageDlg('Generados asientos nº ' + FormatFloat('###,###,###', nAsientoFactura) + ' y ' +
                 FormatFloat('###,###,###', nAsiento), mtInformation, [mbOK], 0);
   end
   else begin
      MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', nAsientoFactura), mtInformation, [mbOK], 0);
   end;

   if QFichero.FieldByName('FORMAPAGO').AsString <> '' then   begin
      if MessageDlg('¿Desea generar los vencimientos correspondientes a esta factura?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         WVencimientos := TWVencimientos.Create(nil);

         WVencimientos.FFormaPago       := QFichero.FieldByName('FORMAPAGO').AsString;
         WVencimientos.FFechaEmision    := QFichero.FieldByName('FECHA').AsDateTime;
         WVencimientos.FDiaPago1        := QFichero.FieldByName('DIAPAGO1').AsInteger;
         WVencimientos.FDiaPago2        := QFichero.FieldByName('DIAPAGO2').AsInteger;
         WVencimientos.FDiaPago3        := QFichero.FieldByName('DIAPAGO3').AsInteger;
         WVencimientos.FSubcuenta       := QFichero.FieldByName('SUBCUENTA').AsString;
         WVencimientos.FFactura         := QFichero.FieldByName('NUMEROFACTURA').AsString;
         WVencimientos.FEsFacturaCompra := (TipoCarga = CARGA_FACTURAS_COMPRA);
         WVencimientos.FImporteFactura  :=
            RoundToDecimal(QFichero.FieldByName('IMPORTE').AsFloat, 3, True);
         WVencimientos.FFechaFactura    := QFichero.FieldByName('FECHA').AsDateTime;
         WVencimientos.FAsiento         := nAsientoFactura;

         WVencimientos.ShowModal;
      end;
   end;

   // Toques finales
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario do begin
      Close;
      Free;
   end;

   QSubcuentas.Close;

   oIntracomunitaria.Checked := False;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('importe').AsFloat := 0;
      // No se quiere inicializar siempre el tanto por ciento, ya que si no
      // cambia de proveedor, se debe seguir manteniendo este valor
      //lbProfArre.caption:='% Retención de Profesional / Arrendatario ';
      //fieldbyname('tantoretencion').asfloat:=0;
      FieldByName('ImporteProntoPago').AsFloat := 0;
      FieldByName('fechavto').AsDateTime := 0;
      FieldByName('numerofactura').AsString := '';
      FieldByName('NUMEROFACTURAINTRACOM').AsString := '';
      FieldByName('nif').AsString := '';
      FieldByName('comentario').AsString := '';
      FieldByName('analitica').AsString := '';
      cbRealizar.Checked := False;
   end;

   nFactura.SetFocus;
   PrepararQueryMovimientos;
end;

procedure TWCargaRapidaFacturas.BtnEdtSalirClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   if MessageDlg('¿Quiere cancelar los cambios?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then Close;
end;

procedure TWCargaRapidaFacturas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWCargaRapidaFacturas.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   // Crear ficheros de Factura y Gastos
   CrearFicheros;

   // Configurar grid de subcuentas de IVA
   ConfigurarGridSubcuentasIVA;

   lbRetVentas.Visible      := (TipoCarga = CARGA_FACTURAS_VENTA);
   cImpRetVentas.Visible    := (TipoCarga = CARGA_FACTURAS_VENTA);
   PermBtnRetVentas.Visible := (TipoCarga = CARGA_FACTURAS_VENTA);

   // Poner Labeles segun tipo de Carga rapida
   case TipoCarga of
      CARGA_FACTURAS_COMPRA: begin
         lTitulo.Caption := 'Carga Rápida de Facturas de Compra';
         cTipoDH         := 'H';
         lbSubcuenta.Caption := 'Proveedor';
         dblSubcuenta.LookupTable := DMContaRef.QSubCTAProveedoresBancos;
         dblSubcuentaN.LookupTable := DMContaRef.QSubCTAProveedoresBancosDesc;
         lbCtoSubcuenta.Caption := 'Concepto Proveedor';
         lbCtoContra.Caption := 'Concepto Compras / Amortización';
         cbRealizar.Caption := 'Realizar el Pago ?';
         eContrapartida.LookupTable := DmContaRef.QSubctaAmortGastos;
         eContrapartidaDesc.LookupTable := DmContaRef.QSubctaAmortGastosDesc;
         eSbctaIVADesc.LookupTable := DMContaRef.QSubCTAIVADeducibleDesc;
      end;
      CARGA_FACTURAS_VENTA: begin
         lTitulo.Caption := 'Carga Rápida de Facturas de Venta';
         cTipoDH         := 'D';
         lbSubcuenta.Caption := 'Cliente';
         dblSubcuenta.LookupTable := DMContaRef.QSubCtaClientes;
         dblSubcuentaN.LookupTable := DMContaRef.QSubCtaClientesDesc;
         lbCtoSubcuenta.Caption := 'Concepto Cliente';
         lbCtoContra.Caption := 'Concepto Ventas';
         cbRealizar.Caption := 'Realizar el Cobro ?';
         eContrapartida.LookupTable := DmContaRef.QSubctaVentas;
         eContrapartidaDesc.LookupTable := DmContaRef.QSubctaVentasDesc;
         eSbctaIVADesc.LookupTable := DmcontaRef.QSubCTAIVARepercutidoDesc;
      end;
   end;

   Modo(Self, Edita);
   nFactura.SetFocus;
   Paginas.Pages[0].Show;
   PrepararQueryMovimientos;
end;

procedure TWCargaRapidaFacturas.FormCreate(Sender: TObject);
var
   Pos1: Integer;
begin
   //  Paginas.Height := 441;
   //  Paginas.Width := 742;

   //ActivarTransacciones(Self);

   // Longitud subcuentas
   dblSubcuenta.MaxLength   := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eContrapartida.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   dblBanco.MaxLength       := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;

   // Búsqueda subcuenta
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then  begin
      Pos1 := dblSubcuenta.Left;
      dblSubcuentaN.Left := Pos1;
      dblSubcuenta.Left := dblSubcuenta.Left + dblSubcuentaN.Width;
      dblSubcuenta.TabStop := False;

      Pos1           := dblBanco.Left;
      dblBancoN.Left := Pos1;
      dblBanco.Left  := dblBanco.Left + dblBancoN.Width;
      dblBanco.TabStop := False;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, sql do begin
      Close;
      Clear;
      Add(' select contrapartida, arrendador, profesional, formapago,');
      Add('        diapago1, diapago2, diapago3, intracomunitario');
      Add(' from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;
end;

procedure TWCargaRapidaFacturas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtGuardar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is
            TwwDBDateTimePicker) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBComboBox) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is
            TwwDBDateTimePicker) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBComboBox) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCargaRapidaFacturas.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCargaRapidaFacturas.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWCargaRapidaFacturas.PonerPictures(cMoneda: String);
begin
   if cMoneda = 'E' then  begin
      nImporte.picturemask           := '###,###,###.##';
      nImporteDto.picturemask        := '###,###,###.##';
      QGastosCUOTA_IVA.DisplayFormat := '###,###,##0.00';
      QGastosBASE_IMPONIBLE_IVA.DisplayFormat := '###,###,##0.00';
   end
   else begin
      nImporte.picturemask           := '###,###,###';
      nImporteDto.picturemask        := '###,###,###';
      QGastosCUOTA_IVA.DisplayFormat := '###,###,###';
      QGastosBASE_IMPONIBLE_IVA.DisplayFormat := '###,###,###';
   end;
end;

procedure TWCargaRapidaFacturas.dblSubcuentaExit(Sender: TObject);
begin
   if (QFichero.FieldByName('SUBCUENTA').AsString <> '') and
      ((QFichero.FieldByName('subcuenta').AsString = DmRef.QParametros.FieldByName(
      'VgenericaC').AsString) or (QFichero.FieldByName('subcuenta').AsString =
      DmRef.QPArametros.FieldByName('Vgenerica').AsString) or
      (DMContaRef.ObtenerTipoSubcuenta(QFichero.FieldByName('SUBCUENTA').AsString) = 'B')) then   begin
      cNif.SetFocus;
   end;
end;

procedure TWCargaRapidaFacturas.dblSubcuentaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         dblSubcuenta.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then   begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (QFichero.State in dsEditModes) then   begin
               QFichero.Edit;
            end;
            QFichero.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      dblSubcuenta.SetFocus;
      dblSubcuentaCloseUp(nil, DMContaRef.QSubCtaClientes, QFichero, True);
   end;
end;

procedure TWCargaRapidaFacturas.FechaFacturaExit(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      FieldByName('FechaVto').AsDateTime := FieldByName('Fecha').AsDateTime;
   end;
end;

procedure TWCargaRapidaFacturas.cNifExit(Sender: TObject);
var
   cLetraNif, cNif: String;
begin
   eConcepto.SetFocus;
   cNif := QFichero.FieldByName('nif').AsString;
   if empty(cNif) then begin
      exit;
   end;
   if cNif[1] in ['A'..'Z'] then begin
      cComentario.SetFocus;
      exit;
   end;
   // chequeo del nif
   cLetraNif := LetraNif(Copy(cNif, 1, 8));
   if cLetraNif <> cNif[9] then  begin
      QFichero.FieldByName('nif').AsString := Copy(cNif, 1, 8) + cLetraNif;
   end;
   cComentario.SetFocus;
end;

procedure TWCargaRapidaFacturas.dblSubcuentaCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
var
   lFormaPago: String;
begin
   if not modified then begin
      exit;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas do begin
      Close;
      parambyname('subcuenta').AsString := QFichero.FieldByName('subcuenta').AsString;
      execquery;
      cContra      := FieldByName('contrapartida').AsString;
      lProfesional := FieldByName('profesional').AsString = 'S';
      lArrendador  := FieldByName('arrendador').AsString = 'S';

      if TipoCarga = CARGA_FACTURAS_VENTA then  begin
         if length(Trim(cContra)) > 0 then   begin
            FContrapartida := cContra;
         end
         else begin
            FContrapartida := DmRef.QParametros.FieldByName('Sctaventas').AsString;
         end;
      end
      else
      if TipoCarga = CARGA_FACTURAS_COMPRA then  begin
         if length(Trim(cContra)) > 0 then   begin
            FContrapartida := cContra;
         end
         else begin
            FContrapartida := DmRef.QParametros.FieldByName('Sctacompras').AsString;
         end;
      end;

      lIntracom := FieldByName('INTRACOMUNITARIO').AsString = 'S';
      oIntracomunitaria.Checked := lIntracom;

      //  lbProfArre.caption:='% Retención de Profesional / Arrendatario ';
      lbProfArre.Caption := '% Retención';
      if FieldByName('FORMAPAGO').IsNull then   begin
         lFormaPago := '';
      end
      else begin
         lFormaPago := FieldByName('FORMAPAGO').AsVariant;
      end;
   end;

   QFichero.FieldByName('TantoRetencion').AsFloat := 0;
   QFichero.FieldByName('FORMAPAGO').AsString     := lFormaPago;

   QFichero.FieldByName('DIAPAGO1').AsInteger   := QSubcuentas.FieldByName('DIAPAGO1').AsInteger;
   QFichero.FieldByName('DIAPAGO2').AsInteger   := QSubcuentas.FieldByName('DIAPAGO2').AsInteger;
   QFichero.FieldByName('DIAPAGO3').AsInteger   := QSubcuentas.FieldByName('DIAPAGO3').AsInteger;
   QFichero.FieldByName('CTOIVAINTRA').AsString := DMRef.QParametros.FieldByName('CTOIVAINTRA').AsString;


   if TipoCarga = CARGA_FACTURAS_VENTA then  begin
      // Clientes
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         if not lIntracom then   begin
            QGastos.EmptyDataSet;
            QGastos.Append;
            QGastos.FieldByName('SBCTA_IVA').AsString :=
               DmRef.QParametros.FieldByName('Sctaivanormal').AsString;
            QGastos.FieldByName('CONTRAPARTIDA').AsString := FContrapartida;
            FieldByName('CtoIva').AsString := DmRef.QParametros.FieldByName('CtoIvaNormal').AsString;
         end;
         FieldByName('CtoContra').AsString    := DmRef.QParametros.FieldByName('CtoVentas').AsString;
         FieldByName('CtoSubcuenta').AsString := DmRef.QParametros.FieldByName('CtoClientes').AsString;
      end;
   end;

   if TipoCarga = CARGA_FACTURAS_COMPRA then  begin
      // Proveedores
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         if not lIntracom then   begin
            QGastos.EmptyDataSet;
            QGastos.Append;
            QGastos.FieldByName('SBCTA_IVA').AsString     :=
               DmRef.QParametros.FieldByName('SCTAIVACNORMAL').AsString;
            QGastos.FieldByName('CONTRAPARTIDA').AsString := FContrapartida;
         end;

         FieldByName('CtoIva').AsString := DmRef.QParametros.FieldByName('CtoIvaCNormal').AsString;

         FieldByName('CtoContra').AsString := DmRef.QParametros.FieldByName('CtoCompras').AsString;

         if oIntracomunitaria.Checked then   begin
            FieldByName('CTOSUBCUENTA').AsString := DMRef.QParametros.FieldByName('CTOPROVINTRA').AsString;
            FieldByName('CTOCONTRA').AsString    := DMRef.QParametros.FieldByName('CTOPROVINTRA').AsString;
         end
         else begin
            FieldByName('CtoSubcuenta').AsString := DmRef.QParametros.FieldByName('CtoProveedores').AsString;
         end;

         if lArrendador then   begin
            //      lbProfArre.caption:='% Retención de Arrendador';
            FieldByName('TantoRetencion').AsFloat := DmRef.QParametros.FieldByName('TantoRetArre').AsFloat;
         end;

         if lProfesional then   begin
            //      lbProfArre.caption:='% Retención de Profesional';
            FieldByName('TantoRetencion').AsFloat := DmRef.QParametros.FieldByName('TantoRetProf').AsFloat;
         end;
      end;
   end;

   // Recalcular cuota y base imponible
   nImporte.OnExit(nil);
end;

procedure TWCargaRapidaFacturas.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
         DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString,
                                         QMovimientosNUMEROFACTURA.AsString,
                                         QMovimientosSERIE.AsString,
                                         QMovimientosEJERCICIO.AsInteger,
                                         QMovimientosCOMENTARIO.AsString,
                                         QMovimientosABREVIATURA.AsString);
end;

procedure TWCargaRapidaFacturas.BtnEdtBorrarMovimClick(Sender: TObject);
begin
   if not QMovimientos.IsEmpty then begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede borrar un asiento bloqueado.');
      end;

      if MessageDlg('¿Desea borrar el asiento ' + FormatFloat('###,###,###', QMovimientos.FieldByName('ASIENTO').AsInteger) +
         ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         //   DmContaRef.Actualizar_Contador('asiento',QMovimientos.fieldbyname('asiento').asinteger-1);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSql.Create(nil), sql do begin
            Close;
            //TODO: Database := DMRef.IBDSiamCont;
            Clear;
            Add('DELETE FROM DIARIO WHERE ASIENTO = :prmASIENTO');
            ParamByName('prmASIENTO').AsInteger := QMovimientos.FieldByName('ASIENTO').AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;
            Close;
            Free;
         end;
         PrepararQueryMovimientos;
      end;
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaFacturas.CBRealizarClick(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      FieldByName('FechaVto').AsDateTime := FieldByName('Fecha').AsDateTime;
      FieldByName('BANCO').AsString      := DmRef.QParametros.FieldByName('SCTABANCO').AsString;
      if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
         FieldByName('CTOBANCO').AsString := DmRef.QParametros.FieldByName('CTOPAGO').AsString;
      end
      else begin
         FieldByName('CTOBANCO').AsString := DmRef.QParametros.FieldByName('CTOCOBRO').AsString;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then   begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;
   WNuevaSubcuenta.ShowModal;
   if WNuevaSubcuenta.FNuevaSubcuenta <> '' then  begin
      if not (QFichero.State in dsEditModes) then   begin
         QFichero.Edit;
      end;
      QFichero.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
   end;

   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
      dblSubcuentaN.SetFocus;
   end
   else begin
      dblSubcuenta.SetFocus;
   end;
   dblSubcuentaCloseUp(nil, DMContaRef.QSubCtaClientes, QFichero, True);
   WNuevaSubcuenta := nil;
   Paginas.Update;
end;

procedure TWCargaRapidaFacturas.PermBorrarIVAClick(Sender: TObject);
begin
   if not QGastos.IsEmpty then begin
      if MessageDlg('¿Desea borrar el tipo de I.V.A. seleccionado', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         QGastos.Delete;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.QGastosNewRecord(DataSet: TDataSet);
begin
   QGastos.FieldByName('CONTRAPARTIDA').AsString := FContrapartida;

   if oIntracomunitaria.Checked then   begin
      QGastos.FieldByName('CTO_IVA').AsString := QFichero.FieldByName('CTOIVAINTRA').AsString;
   end
   else begin
      QGastos.FieldByName('CTO_IVA').AsString := QFichero.FieldByName('CtoIva').AsString;
   end;

   GridEdtSubcuentasIVA.SetActiveField('SBCTA_IVA_DESC');
end;

procedure TWCargaRapidaFacturas.GridEdtSubcuentasIVAKeyPress(Sender: TObject; var Key: Char);
begin
   if (GridEdtSubcuentasIVA.SelectedField.FieldName = 'CUOTA_IVA') or
      (GridEdtSubcuentasIVA.SelectedField.FieldName = 'BASE_IMPONIBLE_IVA') then   begin
      if (key = '.') then begin
         key := ',';
      end;
   end;
end;

procedure TWCargaRapidaFacturas.PermAniadirIVAClick(Sender: TObject);
begin
   QGastos.Append;
end;

procedure TWCargaRapidaFacturas.PermInicializarClick(Sender: TObject);
begin
   if MessageDlg('¿Desea inicializar el asinto de factura?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         if not (state in dseditmodes) then begin
            edit;
         end;
         FieldByName('importe').AsFloat := 0;
         // No se quiere inicializar siempre el tanto por ciento, ya que si no
         // cambia de proveedor, se debe seguir manteniendo este valor
         //lbProfArre.caption:='% Retención de Profesional / Arrendatario ';
         //fieldbyname('tantoretencion').asfloat:=0;
         FieldByName('ImporteProntoPago').AsFloat    := 0;
         FieldByName('fechavto'         ).AsDateTime := 0;
         FieldByName('numerofactura'    ).AsString   := '';
         FieldByName('nif'              ).AsString   := '';
         FieldByName('comentario'       ).AsString   := '';
         FieldByName('analitica'        ).AsString   := '';
         cbRealizar.Checked := False;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QGastos do begin
         EmptyDataSet;
         Append;
         if TipoCarga = CARGA_FACTURAS_COMPRA then   begin
            FieldByName('SBCTA_IVA').AsString     := DMRef.QParametros.FieldByName('SCTAIVACNORMAL').AsString;
            FieldByName('CONTRAPARTIDA').AsString := FContrapartida;
         end
         else begin
            FieldByName('SBCTA_IVA').AsString     := DMRef.QParametros.FieldByName('SCTAIVANORMAL').AsString;
            FieldByName('CONTRAPARTIDA').AsString := FContrapartida;
         end;
         Post;
         Edit;
      end;
   end;

   nFactura.SetFocus;
end;

procedure TWCargaRapidaFacturas.oIntracomunitariaClick(Sender: TObject);
begin
   lFacturaIntracom.Visible := oIntracomunitaria.Checked;
   eFacturaIntracom.Visible := oIntracomunitaria.Checked;

   // Factura de compra
   if TipoCarga = CARGA_FACTURAS_COMPRA then  begin
      if oIntracomunitaria.Checked then   begin
         eSbctaIVADesc.LookupTable := DMContaRef.QSubCTAIVADeducibleIntraDesc;
         eSbctaIVADesc.LookupTable.Close;
         eSbctaIVADesc.LookupTable.Open;
         QFichero.FieldByName('CTOSUBCUENTA').AsString :=
            DMRef.QParametros.FieldByName('CTOPROVINTRA').AsString;
         QFichero.FieldByName('CTOCONTRA').AsString    :=
            DMRef.QParametros.FieldByName('CTOPROVINTRA').AsString;
         QFichero.FieldByName('CTOIVAINTRA').AsString  :=
            DMRef.QParametros.FieldByName('CTOIVAINTRA').AsString;
         if (DmRef.QParametros.FieldByName('SCTAIVACINTRADEDUCIBLE').AsString <> '') or
            (DmRef.QParametros.FieldByName('SCTAIVACINTRAREPERCUTIDO').AsString <> '') then   begin
            if QGastos.State in dsEditModes then   begin
               QGastos.Cancel;
            end;
            QGastos.EmptyDataSet;
            if (DmRef.QParametros.FieldByName('SCTAIVACEXENTO').AsString <> '') then   begin
               QGastos.Append;
               QGastosSBCTA_IVA.AsString         := DmRef.QParametros.FieldByName('SCTAIVACEXENTO').AsString;
               QGastosBASE_IMPONIBLE_IVA.AsFloat :=
                  RoundToDecimal(QFichero.FieldByName('IMPORTE').AsFloat, 3, True);
               QGastos.Post;
            end;
            if (DmRef.QParametros.FieldByName('SCTAIVACINTRADEDUCIBLE').AsString <> '') then   begin
               QGastos.Append;
               QGastosSBCTA_IVA.AsString := DmRef.QParametros.FieldByName('SCTAIVACINTRADEDUCIBLE').AsString;
               QGastos.Post;
            end;
            if (DmRef.QParametros.FieldByName('SCTAIVACINTRAREPERCUTIDO').AsString <> '') then   begin
               QGastos.Append;
               QGastosSBCTA_IVA.AsString :=
                  DmRef.QParametros.FieldByName('SCTAIVACINTRAREPERCUTIDO').AsString;
               QGastos.Post;
            end;
         end;
      end   // if oIntracomunitaria.Checked then
      else begin
         eSbctaIVADesc.LookupTable := DMContaRef.QSubCTAIVADeducibleDesc;
         eSbctaIVADesc.LookupTable.Close;
         eSbctaIVADesc.LookupTable.Open;
         QFichero.FieldByName('CtoSubcuenta').AsString :=
            DmRef.QParametros.FieldByName('CtoProveedores').AsString;
      end;
   end

   // Factura de venta
   else
   if TipoCarga = CARGA_FACTURAS_VENTA then  begin
      if oIntracomunitaria.Checked then   begin
         eSbctaIVADesc.LookupTable := DMContaRef.QSubCTAIVARepercutidoIntraDesc;
         eSbctaIVADesc.LookupTable.Close;
         eSbctaIVADesc.LookupTable.Open;
         if QGastos.State in dsEditModes then   begin
            QGastos.Cancel;
         end;
         QGastos.EmptyDataSet;
{      if (DmRef.QParametros.FieldByName('SCTAIVAEXENTO').AsString <> '') then
      begin
        QGastos.Append;
        QGastosSBCTA_IVA.AsString := DmRef.QParametros.FieldByName('SCTAIVAEXENTO').AsString;
        QGastos.Post;
      end;}
         if (DmRef.QParametros.FieldByName('SCTAIVAINTRA').AsString <> '') then   begin
            QGastos.Append;
            QGastosSBCTA_IVA.AsString := DmRef.QParametros.FieldByName('SCTAIVAINTRA').AsString;
            QGastos.Post;
         end;
      end   // if oIntracomunitaria.Checked then
      else begin
         eSbctaIVADesc.LookupTable := DMContaRef.QSubCTAIVARepercutidoDesc;
         eSbctaIVADesc.LookupTable.Close;
         eSbctaIVADesc.LookupTable.Open;
      end;
   end;


   if oIntracomunitaria.Checked then   begin
      eFacturaIntracom.SetFocus;
   end;
end;

procedure TWCargaRapidaFacturas.BtnEdtModificarClick(Sender: TObject);
var
   Asiento: Integer;
   AsientoNomina, AsientoEmpresa: Integer;
begin
   if not QMovimientos.IsEmpty then  begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      // ASIENTO DE NÓMINA / SS EMPRESA
      if (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA) or
         (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_SSOCIAL_EMPRESA) then   begin
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;

         if QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA then   begin
            AsientoNomina  := QMovimientosASIENTO.AsInteger;
            AsientoEmpresa := QMovimientosASIENTONOMINA.AsInteger;
         end
         else begin
            AsientoEmpresa := QMovimientosASIENTO.AsInteger;
            AsientoNomina  := QMovimientosASIENTONOMINA.AsInteger;
         end;

         if not Assigned(WCargaRapidaNominas) then   begin
            WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
         end;

         WCargaRapidaNominas.FModoArranque   := Modificacion;
         WCargaRapidaNominas.FAsientoNomina  := AsientoNomina;
         WCargaRapidaNominas.FAsientoEmpresa := AsientoEmpresa;

         WCargaRapidaNominas.ShowModal;
      end

      else begin
         if not Assigned(WCargaAsiento) then   begin
            WCargaAsiento := TWCargaAsiento.Create(nil);
         end;

         WCargaAsiento.FModoArranque := Modificacion;
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;
         WCargaAsiento.FAsiento := Asiento;
         WCargaAsiento.ShowModal;
      end;

      PrepararQueryMovimientos;

      QMovimientos.DisableControls;
      QMovimientos.First;
      while not QMovimientos.EOF do begin
         if QMovimientos.FieldByName('ASIENTO').AsInteger = Asiento then   begin
            Break;
         end;
         QMovimientos.Next;
      end;
      QMovimientos.EnableControls;
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaFacturas.BtnEdtMayorClick(Sender: TObject);
begin
   if DMRef.QParametros.FieldByName('MOSTRAR_FILTRO_MAYOR').AsString = 'S' then  begin
      if not Assigned(WFiltroMayorSubcuenta) then   begin
         WFiltroMayorSubcuenta := TWFiltroMayorSubcuenta.Create(nil);
      end;
      WFiltroMayorSubcuenta.FSubcuenta := QMovimientosSUBCUENTA.AsString;
      WFiltroMayorSubcuenta.ShowModal;
      WFiltroMayorSubcuenta := nil;
   end
   else begin
      // Primero vaciar el fichero
      DMContaRef.QInformesConta.EmptyDataset;

      PonerTipoConta('T');

      LanzarInfMayor(True, False,
         QMovimientosSUBCUENTA.AsString, QMovimientosSUBCUENTA.AsString,
         '', '', DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime,
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime, Date, 'T',
         '', '', '', '', '', '', DMRef.QParametros.FieldByName('MONEDA').AsString, '', '');
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaFacturas.PermBtnCalculadoraClick(Sender: TObject);
begin
   if not Assigned(WCalculadora) then   begin
      WCalculadora := TWCalculadora.Create(nil);
   end;
   if WCalculadora.ShowModal = mrOk then  begin
      if not (QFichero.State in dsEditModes) then   begin
         QFichero.Edit;
      end;
      QFichero.FieldByName('IMPORTE').AsFloat := WCalculadora.Importe;
      nImporte.SetFocus;
   end;
end;

procedure TWCargaRapidaFacturas.PermBtnCalculadora2Click(Sender: TObject);
begin
   if not Assigned(WCalculadora) then   begin
      WCalculadora := TWCalculadora.Create(nil);
   end;
   if WCalculadora.ShowModal = mrOk then  begin
      if not (QFichero.State in dsEditModes) then   begin
         QFichero.Edit;
      end;
      QFichero.FieldByName('IMPORTEPRONTOPAGO').AsFloat := WCalculadora.Importe;
      nImporteDto.SetFocus;
   end;
end;

procedure TWCargaRapidaFacturas.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCargaRapidaFacturas.nImporteExit(Sender: TObject);
var
   TipoIVA, Recargo, CuotaIVA, BaseImponible: Double;
   QSelSubcuenta: TIBQuery;
begin
   if not oIntracomunitaria.Checked and (QFichero.FieldByName('IMPORTE').AsFloat <> 0) then  begin
      if QGastos.State in dsEditModes then begin
         QGastos.Post;
      end;

      if QGastos.RecordCount = 1 then   begin
         QSelSubcuenta := TIBQuery.Create(nil);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QSelSubcuenta, SQL do begin
            Close;
            //TODO: Database := DMRef.IBDSiamCont;
            Clear;
            Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
            ParamByName('SUBCUENTA').AsString := QGastosSBCTA_IVA.AsString;
            Open;
            TipoIVA := FieldByName('IVA').AsFloat;
            Recargo := FieldByName('RECARGO').AsFloat;
         end;

         if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
            BaseImponible :=
               QFichero.FieldByName('IMPORTE').AsFloat /
               ((1 + (0.01 * TipoIVA) + (0.01 * Recargo)) -
               (0.01 *
               QFichero.FieldByName('TANTORETENCION').AsFloat));
            CuotaIVA      := BaseImponible * ((0.01 * TipoIVA) + (0.01 * Recargo));
         end
         else
         if (RoundToDecimal(QFichero.FieldByName('ImporteRetVenta').AsFloat, 3, True) <> 0) then   begin
            BaseImponible :=
               (QFichero.FieldByName('IMPORTE').AsFloat + QFichero.FieldByName(
               'importeRetVenta').AsFloat) / (1 + (0.01 * TipoIVA) + (0.01 * Recargo));
            CuotaIVA      := QFichero.FieldByName('IMPORTE').AsFloat + QFichero.FieldByName(
               'importeRetVenta').AsFloat - BaseImponible;
         end
         else begin
            BaseImponible :=
               QFichero.FieldByName('IMPORTE').AsFloat / (1 + (0.01 * TipoIVA) + (0.01 * Recargo));
            CuotaIVA      := QFichero.FieldByName('IMPORTE').AsFloat - BaseImponible;
         end;

         QGastos.Edit;
         QGastosBASE_IMPONIBLE_IVA.AsFloat := RoundToDecimal(BaseImponible, 3, True);
         QGastosCUOTA_IVA.AsFloat          := RoundToDecimal(CuotaIVA, 3, True);

         QSelSubcuenta.Close;
         QSelSubcuenta.Free;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.nImpCuotaIVAExit(Sender: TObject);
begin
   if QGastos.State in dsEditModes then begin
      QGastos.Post;
   end;
   if not (Qfichero.FieldByName('importeRetVenta').AsFloat <> 0) and (QGastos.RecordCount = 1) then
   begin
      RecalcularBaseImponible;
   end;
end;

procedure TWCargaRapidaFacturas.nImpBaseImponibleExit(Sender: TObject);
begin
   if QGastos.State in dsEditModes then   begin
      QGastos.Post;
   end;

   RecalcularIVA;
end;

procedure TWCargaRapidaFacturas.eSbctaIVADescCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
var
   TipoIVA, Recargo, BaseImponible, CuotaIVA: Double;
   QSelSubcuenta: TIBQuery;
begin
   if QGastos.State in dsEditModes then   begin
      QGastos.Post;
   end;

   // Un tipo de IVA
   if QGastos.RecordCount = 1 then  begin
      QSelSubcuenta := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QSelSubcuenta, SQL do begin
         Close;
         //TODO: Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
         ParamByName('SUBCUENTA').AsString := QGastosSBCTA_IVA.AsString;
         Open;
         TipoIVA := FieldByName('IVA').AsFloat;
         Recargo := FieldByName('RECARGO').AsFloat;
      end;

      if (RoundToDecimal(QFichero.FieldByName('TantoRetencion').AsFloat, 3, True) <> 0) then   begin
         BaseImponible :=
            QFichero.FieldByName('IMPORTE').AsFloat /
            ((1 + (0.01 * TipoIVA) + (0.01 * Recargo)) -
            (0.01 *
            QFichero.FieldByName('TANTORETENCION').AsFloat));
         CuotaIVA      := BaseImponible * ((0.01 * TipoIVA) + (0.01 * Recargo));
      end
      else begin
         BaseImponible :=
            QFichero.FieldByName('IMPORTE').AsFloat / (1 + (0.01 * TipoIVA) + (0.01 * Recargo));
         CuotaIVA      := QFichero.FieldByName('IMPORTE').AsFloat - BaseImponible;
      end;

      QGastos.Edit;
      QGastosBASE_IMPONIBLE_IVA.AsFloat := RoundToDecimal(BaseImponible, 3, True);
      QGastosCUOTA_IVA.AsFloat          := RoundToDecimal(CuotaIVA, 3, True);
      QGastos.Post;

      QSelSubcuenta.Close;
      QSelSubcuenta.Free;
   end

   // Varios tipos de IVA
   else begin
      if QGastosBASE_IMPONIBLE_IVA.AsFloat = 0 then   begin
         RecalcularBaseImponible;
      end
      else begin
         RecalcularIVA;
      end;
   end;
end;

procedure TWCargaRapidaFacturas.eContrapartidaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         eContrapartida.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then   begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (QGastos.State in dsEditModes) then   begin
               QGastos.Edit;
            end;
            QGastos.FieldByName('CONTRAPARTIDA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eContrapartida.SetFocus;
   end;
end;

procedure TWCargaRapidaFacturas.GridEdtMovimientosMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FAsientoAnterior := QMovimientosASIENTO.AsInteger;
   GridEdtMovimientos.Refresh;
end;

procedure TWCargaRapidaFacturas.GridEdtMovimientosCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if QMovimientosASIENTO.AsInteger <> FAsientoAnterior then  begin
      FAsientoAnterior := QMovimientosASIENTO.AsInteger;
      if FColorActual = COLOR_ASIENTO1 then   begin
         FColorActual := COLOR_ASIENTO2;
      end
      else begin
         FColorActual := COLOR_ASIENTO1;
      end;
   end;
   if State * [gdFixed, gdSelected] = [] then   begin
      ABrush.Color := FColorActual;
   end;
end;

procedure TWCargaRapidaFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
