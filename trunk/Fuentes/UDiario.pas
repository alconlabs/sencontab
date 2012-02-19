unit UDiario;
interface
uses Buttons, Classes, ComCtrls, Controls, Db, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton,
     fcImage, fcimageform, fcImgBtn, fcpanel, Forms, Globales, Graphics, Grids, IBCustomDataSet, IBDatabase,
     IBQuery, IBSQL, IBTableSet, jpeg, Mask, Menus, Messages, navegadorNotarios, OvcBase, OvcDbDat, OvcDbNF,
     OvcDbPF, OvcEdCal, OvcEditF, OvcEdPop, OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, ppCache, ppComm, ppDB,
     ppDBPipe, ppRelatv, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit,
     Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, wwSpeedButton,
     CustomView;
type
   TWDiario = class(TCustomView)
      lTitulo:         TLabel;
      Shape1:          TShape;
      QFichero:        TIBTableSet;
      Transaccion:     TIBTransaction;
      QFiltro:         TClientDataSet;
      SFiltro:         TDataSource;
      OvcController1:  TOvcController;
      PopupMenuListados: TPopupMenu;
      ListadoAsientoActual: TMenuItem;
      Panel5:          TPanel;
      Panel3:          TPanel;
      Panel4:          TPanel;
      fcImageBtnMinimizar: TfcImageBtn;
      fcIBCerrar:      TfcImageBtn;
      SFichero:        TDataSource;
      QFicheroDescApunte: TStringField;
      Panel:           TPanel;
      SpFiltro:        TSpeedButton;
      BtnNavAniadir:   TfcImageBtn;
      BtnNavBorrar:    TfcImageBtn;
      BtnNavCerrar:    TfcImageBtn;
      Navegador:       TDBNavegadorNotarios;
      BtnNavListados:  TfcImageBtn;
      ListadoAsientos: TMenuItem;
      QFicheroDESCSUBCUENTA: TIBStringField;
      QFicheroDESCCONCEPTO: TIBStringField;
      QFicheroCalcImporte: TStringField;
      QFicheroDebe:    TFloatField;
      QFicheroHaber:   TFloatField;
      QFicheroFechaInicial: TDateTimeField;
      QFicheroFechaFinal: TDateTimeField;
      QFicheroFechaImpresion: TDateTimeField;
      BtnNavModificar: TfcImageBtn;
      DBText1:         TDBText;
      QFicheroID_DIARIO: TIntegerField;
      QFicheroAPUNTE:  TSmallintField;
      QFicheroASIENTO: TIntegerField;
      QFicheroBASEIMPONIBLE: TFloatField;
      QFicheroCOMENTARIO: TIBStringField;
      QFicheroCONTRAPARTIDA: TIBStringField;
      QFicheroDEBEHABER: TIBStringField;
      QFicheroFECHA:   TDateTimeField;
      QFicheroIMPORTE: TFloatField;
      QFicheroIVA:     TFloatField;
      QFicheroNIF:     TIBStringField;
      QFicheroMONEDA:  TIBStringField;
      QFicheroNUMEROFACTURA: TIBStringField;
      QFicheroRECARGO: TFloatField;
      QFicheroSUBCUENTA: TIBStringField;
      QFicheroPUNTEO:  TIBStringField;
      QFicheroASIENTOPUNTEO: TIntegerField;
      QFicheroPUNTEOIVA: TIBStringField;
      QFicheroID_CONCEPTOS: TIBStringField;
      QFicheroTIPODIARIO: TIBStringField;
      QFicheroCUENTA_ANALITICA: TIBStringField;
      QFicheroCUOTAIVA: TFloatField;
      QFicheroCUOTARECARGO: TFloatField;
      BtnNavDuplicar:  TfcImageBtn;
      BtnNavVencimientos: TfcImageBtn;
      BtnNavSeleccion: TfcImageBtn;
      Label12:         TLabel;
      DBText2:         TDBText;
      Paginas:         TOvcNotebook;
      Buscar:          TGroupBox;
      Label1:          TLabel;
      Label8:          TLabel;
      FiltroBAsiento:  TOvcDbNumericField;
      FiltroBFactura:  TOvcDbPictureField;
      Panel1:          TPanel;
      GroupBox2:       TGroupBox;
      Label2:          TLabel;
      Label24:         TLabel;
      Label25:         TLabel;
      Label4:          TLabel;
      Label20:         TLabel;
      Label15:         TLabel;
      Label3:          TLabel;
      Label11:         TLabel;
      FiltroAsientoDesde: TOvcDbNumericField;
      FiltroFechaDesde: TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      FiltroAsientoHasta: TOvcDbNumericField;
      FiltroImporteDesde: TOvcDbNumericField;
      FiltroImporteHasta: TOvcDbNumericField;
      FiltroCBDESCSUBCUENTA: TwwDBLookupCombo;
      FiltroCBSUBCUENTA: TwwDBLookupCombo;
      FiltroDescConcepto: TwwDBLookupCombo;
      FiltroConcepto:  TwwDBLookupCombo;
      GroupBox1:       TGroupBox;
      Label6:          TLabel;
      Label7:          TLabel;
      Label5:          TLabel;
      Label9:          TLabel;
      Label10:         TLabel;
      FiltroCuenta:    TwwDBLookupCombo;
      FiltroDelegacion: TwwDBLookupCombo;
      FiltroDepartamento: TwwDBLookupCombo;
      FiltroSeccion:   TwwDBLookupCombo;
      FiltroProyecto:  TwwDBLookupCombo;
      FiltroCuentaDesc: TwwDBLookupCombo;
      FiltroCBDESCCONTRAPARTIDA: TwwDBLookupCombo;
      FiltroCBCONTRAPARTIDA: TwwDBLookupCombo;
      QFicheroDESCCONTRAPARTIDA: TStringField;
      FiltroBSubcuenta: TOvcDbPictureField;
      Label13:         TLabel;
      Label14:         TLabel;
      FiltroBDescSubcuenta: TOvcDbPictureField;
      FiltroBContrapartida: TOvcDbPictureField;
      Label16:         TLabel;
      Label17:         TLabel;
      FiltroBDescContrapartida: TOvcDbPictureField;
      QFicheroABREVIATURA: TIBStringField;
      BtnNavAsientoBaja: TfcImageBtn;
      DBRadioGroup2:   TDBRadioGroup;
      DBRadioGroup1:   TDBRadioGroup;
      DBRadioGroup3:   TDBRadioGroup;
      Rejilla:         TwwDBGrid;
      QFicheroTIPOASIENTO: TIntegerField;
      QFicheroASIENTONOMINA: TIntegerField;
      Panel2:          TPanel;
      Formulario:      TfcImageForm;
      BtnNavRenumerar: TfcImageBtn;
      QFicheroEJERCICIO: TIntegerField;
      QFicheroSERIE:   TIBStringField;
      Label18:         TLabel;
      FiltroBImporte:  TOvcDbNumericField;
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnNavAnadirClick(Sender: TObject);
      procedure RejillaDblClick(Sender: TObject);
      procedure fcIBMinimizarClick(Sender: TObject);
      procedure BtnMouseEnter(Sender: TObject);
      procedure BtnMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnNavBorrarClick(Sender: TObject);
      procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure FormShow(Sender: TObject);
      procedure BtnNavListadosClick(Sender: TObject);
      procedure SpFiltroClick(Sender: TObject);
      procedure ListadoAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure LimpiarFiltro(Sender: TObject);
      procedure LimpiarFiltroFacturas(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure ListadoAsientosClick(Sender: TObject);
      procedure ListadoAsientoActualClick(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure RejillaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure BtnNavDuplicarClick(Sender: TObject);
      procedure BtnNavVencimientosClick(Sender: TObject);
      procedure BtnNavSeleccionClick(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
      procedure BtnNavAsientoBajaClick(Sender: TObject);
      procedure RejillaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure BtnNavRenumerarClick(Sender: TObject);
      procedure FiltroImporteDesdeExit(Sender: TObject);
   private
      FCampoOrden            :string;
      FColorActual           :TColor;
      FAsientoAnterior       :Integer;
      FFechaAnterior         :TDateTime;
      FSubcuentaAnterior     :string;
      FConceptoAnterior      :string;
      FContrapartidaAnterior :string;
      procedure AnyadirAsiento;
      procedure BorrarAsiento(ASIENTO: Integer);
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure ModificarAsiento;
      procedure MostrarUltimosMovimientos;
      procedure PrepararQuery;
      procedure PrepararRefresh;
   public
      FModoConsulta :Boolean;
      FImporteDesde :Double;
      FImporteHasta :Double;
      FFechaDesde   :TDateTime;
      FFechaHasta   :TDateTime;
   end;

var WDiario: TWDiario;

implementation
uses Cadenas, DM, DMConta, DMControl, General, InfAsientos, UCargaApuntes, UCargaAsiento,
     UCargaCobrosPagos, UCargaRapidaNominas, UCarteraEfectos, UEspere, MenuPrincipal;
{$R *.DFM}

const TabDiario = 0;
      TabFiltro = 1;
const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWDiario.AnyadirAsiento;
begin
   if not Assigned(WCargaAsiento) then begin
      WCargaAsiento := TWCargaAsiento.Create(nil);
   end;

   WCargaAsiento.FModoArranque := INSERCION;

   WCargaAsiento.ShowModal;

   InicializarFiltro;

   MostrarUltimosMovimientos;
   Paginas.Update;
   FiltroBAsiento.Repaint;
   Rejilla.Repaint;
end;

procedure TWDiario.BorrarAsiento(ASIENTO: Integer);
begin
   try
      DmRef.EjecutarSQL('DELETE FROM DIARIO ' + 'WHERE ' + 'ASIENTO = ' + IntToStr(ASIENTO));
      PrepararQuery;
   except
      DatabaseError('No se ha podido borrar el asiento seleccionado.' + #13 + CADENA_MANUAL);
   end;
end;

procedure TWDiario.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('BAsiento'          , ftInteger ,  0, False);
         Add('BFactura'          , ftString  , 10, False);
         Add('BSubcuenta'        , ftString  , 10, False);
         Add('BDescSubcuenta'    , ftString  , 80, False);
         Add('BContrapartida'    , ftString  , 10, False);
         Add('BDescContrapartida', ftString  , 80, False);
         Add('BImporte'          , ftFloat   ,  0, False);
         Add('FechaDesde'        , ftDate    ,  0, False);
         Add('FechaHasta'        , ftDate    ,  0, False);
         Add('AsientoDesde'      , ftInteger ,  0, False);
         Add('AsientoHasta'      , ftInteger ,  0, False);
         Add('ImporteDesde'      , ftFloat   ,  0, False);
         Add('ImporteHasta'      , ftFloat   ,  0, False);
         Add('Subcuenta'         , ftString  , 10, False);
         Add('Contrapartida'     , ftString  , 10, False);
         Add('Analitica'         , ftString  , 10, False);
         Add('TipoConcepto'      , ftString  ,  1, False);
         Add('Concepto'          , ftVarBytes,  3, False);
         Add('Moneda'            , ftString  ,  1, False);
         Add('CUENTA'            , ftString  , 10, False);
         Add('ID_DELEGACION'     , ftString  , 10, False);
         Add('ID_DEPARTAMENTO'   , ftString  , 10, False);
         Add('ID_SECCION'        , ftString  , 10, False);
         Add('ID_PROYECTO'       , ftString  , 10, False);
         Add('PUNTEO'            , ftString  ,  1, False);
      end;
      CreateDataSet;
      active := True;
      Append;
   end;
end;

procedure TWDiario.InicializarFiltro;
var nPrimerAsiento :Integer;
    nUltimoAsiento :Integer;
    dPrimeraFecha  :TDateTime;
    dUltimaFecha   :TDateTime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      if not (State in dsEditModes) then begin
         Edit;
      end;

      if DMRef.QParametros.FieldByName('FILTRO_ASIENTOS_INICIO').AsString = 'S' then begin
         FieldByName('AsientoDesde').Value := nPrimerAsiento;
      end else
      if DMRef.QParametros.FieldByName('ASIENTO_INICIO_INTERVALO_FILTRO').AsInteger > 0 then begin
         FieldByName('AsientoDesde').Value :=
            nUltimoAsiento - DMRef.QParametros.FieldByName(
            'ASIENTO_INICIO_INTERVALO_FILTRO').AsInteger;
      end
      else begin
         FieldByName('AsientoDesde').Value := nUltimoAsiento - 50;
      end;

      if FieldByName('AsientoDesde').Value < 0 then begin
         FieldByName('AsientoDesde').Value := 0;
      end;

      if DMRef.QParametros.FieldByName('ASIENTO_FIN_INTERVALO_FILTRO').AsInteger > 0 then begin
         FieldByName('AsientoHasta').Value :=
            nUltimoAsiento + DMRef.QParametros.FieldByName(
            'ASIENTO_FIN_INTERVALO_FILTRO').AsInteger;
      end
      else begin
         FieldByName('AsientoHasta').Value := nUltimoAsiento;
      end;


      FieldByName('FechaDesde'  ).AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta'  ).AsDateTime := dUltimaFecha;
      FieldByName('ImporteDesde').AsFloat    := -99999999;
      FieldByName('ImporteHasta').AsFloat    := 999999999;
      FieldByName('TipoConcepto').AsString   := 'T';
      FieldByName('Moneda'      ).AsString   := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('PUNTEO'      ).AsString   := 'A';
   end;

   if FModoConsulta then begin
      QFiltro.FieldByName('IMPORTEDESDE').AsFloat    := FImporteDesde;
      QFiltro.FieldByName('IMPORTEHASTA').AsFloat    := FImporteHasta;
      QFiltro.FieldByName('FECHADESDE'  ).AsDateTime := FFechaDesde;
      QFiltro.FieldByName('FECHAHASTA'  ).AsDateTime := FFechaHasta;
      QFiltro.FieldByName('ASIENTODESDE').AsInteger  := 1;
   end;
end;

procedure TWDiario.ModificarAsiento;
var AsientoNomina  :Integer;
    AsientoEmpresa :Integer;
begin
   if not QFichero.IsEmpty then begin
      if DMContaRef.AsientoBloqueado(QFicheroFECHA.AsDateTime) then begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      // ASIENTO DE NÓMINA / SS EMPRESA
      if (QFicheroTIPOASIENTO.AsInteger = ASIENTO_NOMINA) or
         (QFicheroTIPOASIENTO.AsInteger = ASIENTO_SSOCIAL_EMPRESA) then begin
         if QFicheroTIPOASIENTO.AsInteger = ASIENTO_NOMINA then begin
            AsientoNomina  := QFicheroASIENTO.AsInteger;
            AsientoEmpresa := QFicheroASIENTONOMINA.AsInteger;
         end
         else begin
            AsientoEmpresa := QFicheroASIENTO.AsInteger;
            AsientoNomina  := QFicheroASIENTONOMINA.AsInteger;
         end;

         if not Assigned(WCargaRapidaNominas) then begin
            WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
         end;

         WCargaRapidaNominas.FModoArranque   := MODIFICACION;
         WCargaRapidaNominas.FAsientoNomina  := AsientoNomina;
         WCargaRapidaNominas.FAsientoEmpresa := AsientoEmpresa;

         WCargaRapidaNominas.ShowModal;
      end
      else begin
         if not Assigned(WCargaAsiento) then begin
            WCargaAsiento := TWCargaAsiento.Create(nil);
         end;

         WCargaAsiento.FModoArranque := MODIFICACION;
         WCargaAsiento.FAsiento      := QFichero.FieldByName('ASIENTO').AsInteger;

         WCargaAsiento.ShowModal;
      end;

      if not (QFiltro.State in dsEditModes) then begin
         QFiltro.Edit;
      end;
      QFiltro.FieldByName('BAsiento').AsInteger := QFichero.FieldByName('ASIENTO').AsInteger;
      PrepararQuery;
   end;

   Paginas.PageIndex := TabDiario;

   FiltroBAsiento.SetFocus;
   Paginas.Update;
   FiltroBAsiento.Repaint;
   Rejilla.Repaint;
end;

procedure TWDiario.MostrarUltimosMovimientos;
var Asiento :Integer;
begin
   Asiento := DMRef.ObtenerValor('GEN_ID(ASIENTO, 0)', 'RDB$DATABASE', '');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;

      Add('SELECT');
      Add('   DISTINCT D.*, C.DESCRIPCION DESCCONCEPTO, S1.ABREVIATURA,');
      Add('   S1.DESCRIPCION DESCSUBCUENTA, S2.DESCRIPCION DESCCONTRAPARTIDA');
      Add('FROM DIARIO D LEFT JOIN CONCEPTOS C');
      Add('              ON D.ID_CONCEPTOS = C.ID_CONCEPTOS');
      Add('              LEFT JOIN SUBCTAS S1');
      Add('              ON D.SUBCUENTA = S1.SUBCUENTA');
      Add('              LEFT JOIN SUBCTAS S2');
      Add('              ON D.CONTRAPARTIDA = S2.SUBCUENTA');
      Add('WHERE');
      Add('   D.ASIENTO >= :ASIENTO1 AND D.ASIENTO <= :ASIENTO2 AND');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS');
      Add('ORDER BY D.ASIENTO, D.APUNTE');

      Params.ByName('ASIENTO1').AsInteger := Asiento - 30;
      Params.ByName('ASIENTO2').AsInteger := Asiento;

      Prepare;
      Open;

      Last;
      EnableControls;
   end;

   Paginas.PageIndex := TabDiario;

   FiltroBAsiento.SetFocus;
   Rejilla.Repaint;
end;

procedure TWDiario.PrepararQuery;
var Caratula :TEspere;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;

      Add('SELECT');
      Add('   D.*,');
      Add('   S1.DESCRIPCION DESCSUBCUENTA, S2.DESCRIPCION DESCCONTRAPARTIDA,');
      Add('   C.DESCRIPCION DESCCONCEPTO, S1.ABREVIATURA');
      Add('FROM DIARIO D LEFT JOIN CONCEPTOS C ON D.ID_CONCEPTOS = C.ID_CONCEPTOS');
      Add('              LEFT JOIN SUBCTAS S1 ON D.SUBCUENTA = S1.SUBCUENTA');
      Add('              LEFT JOIN SUBCTAS S2 ON D.CONTRAPARTIDA = S2.SUBCUENTA');

      if (QFiltro.FieldByName('BASIENTO').AsInteger = 0) and
         (QFiltro.FieldByName('BFACTURA').AsString = '') and
         (QFiltro.FieldByName('BSUBCUENTA').AsString = '') and
         (QFiltro.FieldByName('BDESCSUBCUENTA').AsString = '') and
         (QFiltro.FieldByName('BCONTRAPARTIDA').AsString = '') and
         (QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString = '') and
         ((QFiltro.FieldByName('CUENTA').AsString <> '') or
         (QFiltro.FieldByName('ID_DELEGACION').AsString <> '') or
         (QFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '') or
         (QFiltro.FieldByName('ID_SECCION').AsString <> '') or
         (QFiltro.FieldByName('ID_PROYECTO').AsString <> '')) then begin
         Add(', ANALITICAS A');
      end;
      Add('WHERE');

      if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
         Add(' C.TIPOCONTABILIDAD=:TIPOCONCEPTO AND');
      end;

      if QFiltro.FieldByName('BASIENTO').AsInteger <> 0 then
         // Mostrar el asiento buscado y los n asientos anteriores y posteriores a él
      begin
         Add('  D.ASIENTO >= :ASIENTOINI AND D.ASIENTO <= :ASIENTOFIN');
      end
      else
      if QFiltro.FieldByName('BImporte').AsInteger <> 0 then begin
         Add('  D.IMPORTE>=:BIMPORTEDESDE and D.Importe<=:BimporteHasta ');
      end
      else
      if (QFiltro.FieldByName('BFACTURA').AsString <> '') then begin
         Add(' D.NUMEROFACTURA = :FACTURA  AND');
         Add(' D.FECHA >= :FECHADESDE AND D.FECHA <= :FECHAHASTA');
      end
      else
      if QFiltro.FieldByName('BSUBCUENTA').AsString <> '' then begin
         Add(' D.SUBCUENTA LIKE :SUBCUENTA');
      end
      else
      if QFiltro.FieldByName('BDESCSUBCUENTA').AsString <> '' then begin
         Add(' S1.DESCRIPCION LIKE :DESCSUBCUENTA');
      end
      else
      if QFiltro.FieldByName('BCONTRAPARTIDA').AsString <> '' then begin
         Add(' D.CONTRAPARTIDA LIKE :CONTRAPARTIDA');
      end
      else
      if QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString <> '' then begin
         Add(' S2.DESCRIPCION LIKE :DESCCONTRAPARTIDA');
      end
      else begin
         // Asiento
         Add('   D.ASIENTO >= :ASIENTODESDE AND D.ASIENTO <= :ASIENTOHASTA AND');

         // Fecha
         if QFiltro.FieldByName('FECHADESDE').IsNull then begin
            Add('   (D.FECHA IS NULL OR (D.FECHA >= :FECHADESDE AND D.FECHA <= :FECHAHASTA)) AND');
         end
         else begin
            Add('   D.FECHA >= :FECHADESDE AND D.FECHA <= :FECHAHASTA AND');
         end;

         // Importe
         if QFiltro.FieldByName('IMPORTEDESDE').AsFloat = 0 then begin
            Add('   (D.IMPORTE IS NULL OR (D.IMPORTE >= :IMPORTEDESDE AND D.IMPORTE <= :IMPORTEHASTA))');
         end
         else begin
            Add('   D.IMPORTE >= :IMPORTEDESDE AND D.IMPORTE <= :IMPORTEHASTA');
         end;

         // Subcuenta
         if QFiltro.FieldByName('SUBCUENTA').AsString <> '' then begin
            Add('   AND D.SUBCUENTA LIKE :SUBCUENTA');
         end;

         // Contrapartida
         if QFiltro.FieldByName('CONTRAPARTIDA').AsString <> '' then begin
            Add('   AND D.CONTRAPARTIDA LIKE :CONTRAPARTIDA');
         end;

         // Concepto
         if not empty(QFiltro.FieldByName('CONCEPTO').AsString) then begin
            Add('   AND D.ID_CONCEPTOS=:CONCEPTO');
         end;

         // Punteo
         if QFiltro.FieldByName('PUNTEO').AsString = 'S' then begin
            Add('   AND D.PUNTEO = "S"');
         end
         else
         if QFiltro.FieldByName('PUNTEO').AsString = 'N' then begin
            Add('   AND (D.PUNTEO = "" OR D.PUNTEO IS NULL OR D.PUNTEO = "N")');
         end;

         // Analítica
         if QFiltro.FieldByName('CUENTA').AsString <> '' then begin
            Add('   AND A.CUENTA = :CUENTA');
         end;
         if QFiltro.FieldByName('ID_DELEGACION').AsString <> '' then begin
            Add('   AND A.ID_DELEGACION = :ID_DELEGACION');
         end;
         if QFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '' then begin
            Add('   AND A.ID_DEPARTAMENTO = :ID_DEPARTAMENTO');
         end;
         if QFiltro.FieldByName('ID_SECCION').AsString <> '' then begin
            Add('   AND A.ID_SECCION = :ID_SECCION');
         end;
         if QFiltro.FieldByName('ID_PROYECTO').AsString <> '' then begin
            Add('   AND A.ID_PROYECTO = :ID_PROYECTO');
         end;
         if (QFiltro.FieldByName('CUENTA').AsString <> '') or
            (QFiltro.FieldByName('ID_DELEGACION').AsString <> '') or
            (QFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '') or
            (QFiltro.FieldByName('ID_SECCION').AsString <> '') or
            (QFiltro.FieldByName('ID_PROYECTO').AsString <> '') then begin
            Add('   AND A.CUENTA = D.CUENTA_ANALITICA');
         end;
      end;

      FCampoOrden := UpperCase(Trim(FCampoOrden));
      if FCampoOrden = 'ASIENTO'       then Add('ORDER BY D.ASIENTO      , D.APUNTE'                         ) else
      if FCampoOrden = 'FECHA'         then Add('ORDER BY D.FECHA        , D.ASIENTO, D.APUNTE'              ) else
      if FCampoOrden = 'SUBCUENTA'     then Add('ORDER BY D.SUBCUENTA    , D.FECHA  , D.ASIENTO  , D.APUNTE' ) else
      if FCampoOrden = 'CONTRAPARTIDA' then Add('ORDER BY D.CONTRAPARTIDA, D.FECHA  , D.ASIENTO  , D.APUNTE' ) else
      if FCampoOrden = 'ID_CONCEPTOS'  then Add('ORDER BY D.ID_CONCEPTOS , D.FECHA  , D.SUBCUENTA, D.ASIENTO') else
      if FCampoOrden <> '' then Add('ORDER BY ' + FCampoOrden)
      else Add('ORDER BY D.ASIENTO, D.APUNTE');

      // PARÁMETROS
      if QFiltro.FieldByName('BASIENTO').AsInteger <> 0 then  begin
         // Mostrar el asiento buscado y los n asientos anteriores y posteriores a él
         Params.ByName('ASIENTOINI').AsInteger :=
            QFiltro.FieldByName('BASIENTO').AsInteger -
            DMRef.QParametros.FieldByName('ASIENTOS_INICIO_INTERVALO_BQDA').AsInteger;
         Params.ByName('ASIENTOFIN').AsInteger :=
            QFiltro.FieldByName('BASIENTO').AsInteger +
            DMRef.QParametros.FieldByName('ASIENTOS_FIN_INTERVALO_BQDA').AsInteger;
      end
      else
      if QFiltro.FieldByName('BIMPORTE').AsInteger <> 0 then begin
         Qfichero.Params.ByName('BIMPORTEDESDE').AsDouble :=
            RoundTodecimal(QFiltro.FieldByName('BIMPORTE').AsFloat, 2, True) - 0.01;
         Qfichero.Params.ByName('BIMPORTEHASTA').AsDouble :=
            RoundTodecimal(QFiltro.FieldByName('BIMPORTE').AsFloat, 2, True) + 0.01;
      end
      else
      if (QFiltro.FieldByName('BFACTURA').AsString <> '') then  begin
         Params.ByName('FACTURA').AsString      := QFiltro.FieldByName('BFACTURA').AsString;
         // Fecha, solo busca facturas dentro del ejercicio actual
         Params.ByName('FECHADESDE').AsDateTime := QFiltro.FieldByName('FECHADesde').AsDateTime;
         Params.ByName('FECHAHASTA').AsDateTime := QFiltro.FieldByName('FECHAHasta').AsDateTime;
      end
      else
      if QFiltro.FieldByName('BSUBCUENTA').AsString <> '' then begin
         ParamByName('SUBCUENTA').AsString :=
            Copy(QFiltro.FieldByName('BSUBCUENTA').AsString + '%', 1, QFiltro.FieldByName('BSUBCUENTA').Size);
      end
      else
      if QFiltro.FieldByName('BDESCSUBCUENTA').AsString <> '' then begin
         ParamByName('DESCSUBCUENTA').AsString :=
            Copy(QFiltro.FieldByName('BDESCSUBCUENTA').AsString + '%', 1,
            QFiltro.FieldByName('BDESCSUBCUENTA').Size);
      end
      else
      if QFiltro.FieldByName('BCONTRAPARTIDA').AsString <> '' then begin
         ParamByName('CONTRAPARTIDA').AsString :=
            Copy(QFiltro.FieldByName('BCONTRAPARTIDA').AsString + '%', 1,
            QFiltro.FieldByName('BCONTRAPARTIDA').Size);
      end
      else
      if QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString <> '' then begin
         ParamByName('DESCCONTRAPARTIDA').AsString :=
            Copy(QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString + '%', 1,
            QFiltro.FieldByName('BDESCCONTRAPARTIDA').Size);
      end
      else begin
         // Asiento
         Params.ByName('ASIENTODESDE').AsInteger := QFiltro.FieldByName('ASIENTODESDE').AsInteger;
         Params.ByName('ASIENTOHASTA').AsInteger := QFiltro.FieldByName('ASIENTOHASTA').AsInteger;

         // Fecha
         Params.ByName('FECHADESDE').AsDateTime := QFiltro.FieldByName('FECHADESDE').AsDateTime;
         Params.ByName('FECHAHASTA').AsDateTime := QFiltro.FieldByName('FECHAHASTA').AsDateTime;

         // Importe
         Params.ByName('IMPORTEDESDE').AsDouble := QFiltro.FieldByName('IMPORTEDESDE').AsFloat - 0.01;
         Params.ByName('IMPORTEHASTA').AsDouble := QFiltro.FieldByName('IMPORTEHASTA').AsFloat + 0.01;

         // Subcuenta
         if QFiltro.FieldByName('SUBCUENTA').AsString <> '' then begin
            Params.ByName('SUBCUENTA').AsString := QFiltro.FieldByName('SUBCUENTA').AsString + '%';
         end;

         // Contrapartida
         if QFiltro.FieldByName('CONTRAPARTIDA').AsString <> '' then begin
            Params.ByName('CONTRAPARTIDA').AsString := QFiltro.FieldByName('CONTRAPARTIDA').AsString + '%';
         end;

         // Concepto
         if not empty(QFiltro.FieldByName('CONCEPTO').AsString) then begin
            Params.ByName('CONCEPTO').AsString := QFiltro.FieldByName('CONCEPTO').AsString;
         end;

         if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
            Params.ByName('TIPOCONCEPTO').AsString := QFiltro.FieldByName('TIPOCONCEPTO').AsString;
         end;

         // Analítica
         if QFiltro.FieldByName('CUENTA').AsString <> '' then begin
            ParamByName('CUENTA').AsString := QFiltro.FieldByName('CUENTA').AsString;
         end;
         if QFiltro.FieldByName('ID_DELEGACION').AsString <> '' then begin
            ParamByName('ID_DELEGACION').AsString := QFiltro.FieldByName('ID_DELEGACION').AsString;
         end;
         if QFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '' then begin
            ParamByName('ID_DEPARTAMENTO').AsString := QFiltro.FieldByName('ID_DEPARTAMENTO').AsString;
         end;
         if QFiltro.FieldByName('ID_SECCION').AsString <> '' then begin
            ParamByName('ID_SECCION').AsString := QFiltro.FieldByName('ID_SECCION').AsString;
         end;
         if QFiltro.FieldByName('ID_PROYECTO').AsString <> '' then begin
            ParamByName('ID_PROYECTO').AsString := QFiltro.FieldByName('ID_PROYECTO').AsString;
         end;
      end;

      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Abriendo diario ...';
      Caratula.Ancho        := 300;
      Caratula.Alto         := 150;
      Caratula.Avi_Left     := 20;
      Caratula.Avi_Top      := 80;
      Caratula.Fuente.Color := clWhite;
      Caratula.Fuente.Name  := 'Arial';
      Caratula.Fuente.Size  := 14;
      Caratula.Mensaje_Left := 14;
      Caratula.Mensaje_Top  := 14;
      Caratula.Avi_Color    := $00A56D39;
      Caratula.ColorFondo   := $00A56D39;
      Caratula.MostrarMarco := True;
      Caratula.Avi_Predet   := Ninguno;
      Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
      Caratula.Mostrar;

      Prepare;
      Open;
      if QFiltro.FieldByName('BASIENTO').AsInteger = 0 then begin
         Last;
      end;
      EnableControls;

      Caratula.Cerrar;
      Caratula.Free;

      Paginas.Update;
      FiltroBAsiento.Repaint;
      Rejilla.Repaint;
   end;

   if not QFichero.EOF and (QFiltro.FieldByName('BASIENTO').AsInteger <> 0) then begin
      // Posicionarnos en el asiento buscado
      QFichero.DisableControls;
      QFichero.First;
      while not QFichero.EOF and (QFicheroASIENTO.AsInteger <>
            QFiltro.FieldByName('BASIENTO').AsInteger) do begin
         QFichero.Next;
      end;

      if DMRef.QParametros.FieldByName('ASIENTOS_INICIO_INTERVALO_BQDA').AsInteger > 0 then  begin
         // Posicionarnos en el último apunte del asiento buscado
         while not QFichero.EOF and (QFicheroASIENTO.AsInteger =
               QFiltro.FieldByName('BASIENTO').AsInteger) do begin
            QFichero.Next;
         end;
         if QFicheroASIENTO.AsInteger <> QFiltro.FieldByName('BASIENTO').AsInteger then begin
            QFichero.Prior;
         end;
      end;
      QFichero.EnableControls;
   end;

   Rejilla.Repaint;
end;

procedure TWDiario.PrepararRefresh;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, RefreshSQL do begin
      Clear;

      Add('SELECT');
      Add('   D.*,');
      Add('   S1.DESCRIPCION DESCSUBCUENTA, S2.DESCRIPCION DESCCONTRAPARTIDA,');
      Add('   C.DESCRIPCION DESCCONCEPTO, S1.ABREVIATURA');
      Add('FROM DIARIO D LEFT JOIN CONCEPTOS C ON D.ID_CONCEPTOS = C.ID_CONCEPTOS');
      Add('              LEFT JOIN SUBCTAS S1 ON D.SUBCUENTA = S1.SUBCUENTA');
      Add('              LEFT JOIN SUBCTAS S2 ON D.CONTRAPARTIDA = S2.SUBCUENTA');

      Add('WHERE');
      Add('   D.ID_DIARIO = ?ID_DIARIO');


      FCampoOrden := UpperCase(Trim(FCampoOrden));
      if (FCampoOrden = 'ASIENTO') then begin
         Add('ORDER BY D.ASIENTO, D.APUNTE');
      end
      else
      if FCampoOrden = 'FECHA' then begin
         Add('ORDER BY D.FECHA, D.ASIENTO, D.APUNTE');
      end
      else
      if FCampoOrden = 'SUBCUENTA' then begin
         Add('ORDER BY D.SUBCUENTA, D.FECHA, D.ASIENTO, D.APUNTE');
      end
      else
      if FCampoOrden = 'CONTRAPARTIDA' then begin
         Add('ORDER BY D.CONTRAPARTIDA, D.FECHA, D.ASIENTO, D.APUNTE');
      end
      else
      if FCampoOrden = 'ID_CONCEPTOS' then begin
         Add('ORDER BY D.ID_CONCEPTOS, D.FECHA, D.SUBCUENTA, D.ASIENTO');
      end
      else
      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end
      else begin
         Add('ORDER BY D.ASIENTO, D.APUNTE');
      end;
   end;
end;

procedure TWDiario.BtnNavCerrarClick(Sender: TObject);
begin
   if FModoConsulta then begin
      WCargaCobrosPagos.FID_Diario := 0;
   end;

   Close;
end;

procedure TWDiario.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWDiario.FormCreate(Sender: TObject);
begin
   Screen.cursor := crHourGlass;
   ActivarTransacciones(Self);
   CrearFiltro;

   Modo(Self, Naveg);
   //CargaImagenesMensaje(Mensaje);


   FiltroCBSUBCUENTA.MaxLength     := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBCONTRAPARTIDA.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   FModoConsulta := False;

   Screen.cursor := crDefault;
end;

procedure TWDiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then begin
      // Comprobación del filtro por asiento
      if (FiltroBAsiento.Focused) and (FiltroBAsiento.AsInteger <> 0) then begin
         key := #0;
         if QFiltro.State in dsEditModes then begin
            QFiltro.Post;
         end;
         PrepararQuery;
      end
      // Comprobación del filtro por factura
      else
      if (FiltroBFactura.Focused) and (FiltroBFactura.AsString <> '') then begin
         key := #0;
         if QFiltro.State in dsEditModes then begin
            QFiltro.Post;
         end;
         PrepararQuery;
      end
      // Comprobación del filtro por Importe
      else
      if ((FiltroBImporte.Focused) and (FiltroBImporte.AsFloat <> 0)) then begin
         key := #0;
         if QFiltro.State in dsEditModes then begin
            QFiltro.Post;
         end;
         PrepararQuery;
      end
      // Comprobación del filtro por subcuenta y contrapartida
      else
      if ((FiltroBSubcuenta.Focused) and (FiltroBSubcuenta.AsString <> '')) or
         ((FiltroBDescSubcuenta.Focused) and (FiltroBDescSubcuenta.AsString <> '')) or
         ((FiltroBContrapartida.Focused) and (FiltroBContrapartida.AsString <> '')) or
         ((FiltroBDescContrapartida.Focused) and (FiltroBDescContrapartida.AsString <> '')) then  begin
         key := #0;
         if QFiltro.State in dsEditModes then begin
            QFiltro.Post;
         end;
         PrepararQuery;
      end
      //Si no es ninguno, pasamos al siguiente control
      else
      if (not (ActiveControl is TwwDBGrid)) then begin
         Key := #0;

         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWDiario.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnNavCerrar.Click;
      end;
      VK_SPACE: begin
         if (UpperCase(Copy(ActiveControl.Name, 1, 6)) <> 'FILTRO') and
            not (QFichero.State in dsEditModes) then begin
            //Anulamos el evento de la tecla
            Key := 0;
            ModificarAsiento;
         end;
      end;
      VK_F2: begin
         if not (QFichero.State in dsEditModes) then begin
            AnyadirAsiento;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBDateTimePicker) and
            not (ActiveControl is TwwDBLookupCombo) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBDateTimePicker) and
            not (ActiveControl is TwwDBLookupCombo) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
      VK_F12: begin
         if not (QFichero.State in dsEditModes) then begin
            SpFiltro.Click;
         end;
      end;
   end;
end;

procedure TWDiario.BtnNavAnadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   AnyadirAsiento;
end;

procedure TWDiario.RejillaDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   ModificarAsiento;
end;

procedure TWDiario.fcIBMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWDiario.BtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWDiario.BtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WDiario    := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWDiario.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then begin
      if DMContaRef.AsientoBloqueado(QFicheroFECHA.AsDateTime) then begin
         DatabaseError('No se puede borrar un asiento bloqueado.');
      end;
      if MessageDlg('¿Desea borrar el asiento ' + FormatFloat('###,###,###', QFicheroASIENTO.AsInteger) + ' ?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         BorrarAsiento(QFicheroASIENTO.AsInteger);
      end;
      
      Paginas.Update;
      FiltroBAsiento.Repaint;
      Rejilla.Repaint;
   end;
end;

procedure TWDiario.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if StrPos(PChar(UpperCase(FCampoOrden)), PChar(UpperCase(AFieldName))) <> nil then begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWDiario.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'ASIENTO') or (UpperCase(AFieldName) = 'FECHA') or
      (UpperCase(AFieldName) = 'SUBCUENTA') or (UpperCase(AFieldName) = 'ID_CONCEPTOS') or
      (UpperCase(AFieldName) = 'CONTRAPARTIDA') then begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWDiario.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   InicializarFiltro;
   FCampoOrden := 'ASIENTO, APUNTE';
   PrepararRefresh;
   PrepararQuery;
   QFichero.Last;

   Paginas.Pages[TabDiario].Show;
   FiltroBAsiento.SetFocus;

   if not FModoConsulta then  begin
      BtnNavSeleccion.Free;
   end
   else begin
      BtnNavAniadir.Free;
      BtnNavModificar.Free;
      BtnNavBorrar.Free;
      BtnNavDuplicar.Free;
      BtnNavVencimientos.Free;
      BtnNavAsientoBaja.Free;
      BtnNavRenumerar.Free;
   end;
end;

procedure TWDiario.BtnNavListadosClick(Sender: TObject);
begin
   PopupMenuListados.Popup(Self.Left + Panel.Left + BtnNavListados.Left,
      Self.Top + Panel.Top + BtnNavListados.Top + BtnNavListados.Height - 5);
end;

procedure TWDiario.SpFiltroClick(Sender: TObject);
begin
   if (QFiltro.State in dseditmodes) then begin
      QFiltro.post;
   end;

   LimpiarFiltro(nil);

   PrepararQuery;

   Paginas.Pages[TabDiario].Show;
   FiltroBAsiento.SetFocus;
end;

procedure TWDiario.ListadoAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
   ARect: TRect; State: TOwnerDrawState);
begin
   if State * [odSelected, odFocused] = [] then  begin
      ACanvas.Font.Color  := clNavy;
      ACanvas.Brush.Color := gcClAplicacion;
   end
   else begin
      ACanvas.Font.Color  := clWhite;
      ACanvas.Brush.Color := clNavy;
   end;
   ACanvas.FillRect(ARect);
   ACanvas.Font.Name := 'Tahoma';
   if TMenuItem(Sender).Caption <> '-' then begin
      ACanvas.TextRect(ARect, ARect.Left + 7, ARect.Top, TMenuItem(Sender).Caption);
   end;
end;

procedure TWDiario.fcImageBtnMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWDiario.LimpiarFiltro(Sender: TObject);
begin
   if not (QFiltro.state in dseditmodes) then begin
      QFiltro.edit;
   end;
   QFiltro.FieldByName('BImporte').AsInteger          := 0;
   QFiltro.FieldByName('BAsiento').AsInteger          := 0;
   QFiltro.FieldByName('BFactura').AsString           := '';
   QFiltro.FieldByName('BSUBCUENTA').AsString         := '';
   QFiltro.FieldByName('BDESCSUBCUENTA').AsString     := '';
   QFiltro.FieldByName('BCONTRAPARTIDA').AsString     := '';
   QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString := '';
end;

procedure TWDiario.LimpiarFiltroFacturas(Sender: TObject);
begin
   if not (QFiltro.state in dseditmodes) then begin
      QFiltro.edit;
   end;
   QFiltro.FieldByName('BImporte').AsInteger          := 0;
   QFiltro.FieldByName('BAsiento').AsInteger          := 0;
   QFiltro.FieldByName('BSUBCUENTA').AsString         := '';
   QFiltro.FieldByName('BDESCSUBCUENTA').AsString     := '';
   QFiltro.FieldByName('BCONTRAPARTIDA').AsString     := '';
   QFiltro.FieldByName('BDESCCONTRAPARTIDA').AsString := '';
end;

procedure TWDiario.QFicheroCalcFields(DataSet: TDataSet);
begin
   // Descripción del apunte
   QFicheroDESCAPUNTE.AsString :=
      DMContaRef.GetDescripcionApunte(QFicheroDESCCONCEPTO.AsString,
                                      QFicheroNUMEROFACTURA.AsString,
                                      QFicheroSERIE.AsString,
                                      QFicheroEJERCICIO.AsInteger,
                                      QFicheroCOMENTARIO.AsString,
                                      QFicheroABREVIATURA.AsString);

   // Importe
   if QFiltro.FieldByName('MONEDA').AsString = 'E' then begin
      QFicheroCalcImporte.AsString := FormatFloat('###,###,##0.#0',
         ConversionImporte(QFicheroIMPORTE.AsFloat,
         QFicheroMONEDA.AsString,
         QFiltro.FieldByName('MONEDA').AsString));
   end
   else begin
      QFicheroCalcImporte.AsString := FormatFloat('###,###,###',
         ConversionImporte(QFicheroIMPORTE.AsFloat,
         QFicheroMONEDA.AsString,
         QFiltro.FieldByName('MONEDA').AsString));
   end;

   // Campos calculados empleados en el listado de asientos
   if QFicheroDEBEHABER.AsString = 'D' then begin
      QFicheroDebe.AsFloat := ConversionImporte(QFicheroIMPORTE.AsFloat,
         QFicheroMONEDA.AsString,
         QFiltro.FieldByName('MONEDA').AsString);
   end
   else begin
      QFicheroHaber.AsFloat := ConversionImporte(QFicheroIMPORTE.AsFloat,
         QFicheroMONEDA.AsString,
         QFiltro.FieldByName('MONEDA').AsString);
   end;
   QFichero.FieldByName('FechaInicial').AsDateTime   := QFiltro.FieldByName('FechaDesde').AsDateTime;
   QFichero.FieldByName('FechaFinal').AsDateTime     := QFiltro.FieldByName('FechaHasta').AsDateTime;
   QFichero.FieldByName('FechaImpresion').AsDateTime := Date;
end;

procedure TWDiario.ListadoAsientosClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   // Necesarios para el informe
   PonerTipoConta(QFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado  := QFiltro.FieldByName('Moneda').AsString;
   gvFormatoOficial := False;

   FormPrincipal.LanzarListado('LAsientos.rtm', SFichero, QFiltro.FieldByName('MONEDA').AsString);

   Paginas.Pages[TabDiario].Show;
end;

procedure TWDiario.ListadoAsientoActualClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   Perform(wm_NextDlgCtl, 0, 0);

   // Necesarios para el informe
   PonerTipoConta(QFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := QFiltro.FieldByName('Moneda').AsString;

   if not QFichero.IsEmpty then begin
      LanzarInfAsientos(QFichero.FieldByName('Asiento').AsInteger,
         QFichero.FieldByName('Asiento').AsInteger,
         QFichero.FieldByName('Fecha').AsDateTime,
         QFichero.FieldByName('Fecha').AsDateTime, Date,
         QFiltro.FieldByName('TipoConcepto').AsString,
         '', '', '', '', '',
         QFiltro.FieldByName('Moneda').AsString,
         True,  // Ordenado por asiento
         True,  // Informe Normal
         False, // Solo asientos descuadrados
         False);
   end; // Formato Oficial

   Paginas.Pages[TabDiario].Show;
end;

procedure TWDiario.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWDiario.RejillaMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
var
   coord:   TGridCoord;
   cNomCol: String;
begin
   if button = mbright then begin
      coord   := Rejilla.Mousecoord(x, y);
      cNomCol := Rejilla.fieldname(coord.x);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         DisableControls;
         if uppercase(cNomcol) = 'PUNTEO' then begin
            Edit;
            if empty(FieldByName('Punteo').AsString) then begin
               FieldByName('Punteo').AsString := 'S';
            end
            else begin
               FieldByName('Punteo').AsString := ' ';
            end;
            Post;
            Transaction.CommitRetaining;
            Refresh;
         end;
         EnableControls;
      end;
   end;

   FAsientoAnterior       := QFicheroASIENTO.AsInteger;
   FFechaAnterior         := QFicheroFECHA.AsDateTime;
   FSubcuentaAnterior     := QFicheroSUBCUENTA.AsString;
   FConceptoAnterior      := QFicheroID_CONCEPTOS.AsString;
   FContrapartidaAnterior := QFicheroCONTRAPARTIDA.AsString;

   Rejilla.Refresh;
end;

procedure TWDiario.BtnNavDuplicarClick(Sender: TObject);
var
   nAsiento:           Integer;
   QDiario, QDuplicar: TIBsql;
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea duplicar el asiento ' + FormatFloat('###,###,###', QFicheroASIENTO.AsInteger) + ' ?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      nAsiento  := DMContaRef.ObtenerNumeroAsiento;
      QDuplicar := TIbSql.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QDuplicar, Sql do begin
         Close;
         Clear;
         Database := DMRef.IBDSiamCont;
      end;
      QDiario := TIbSql.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QDiario, Sql do begin
         Close;
         Clear;
         Database := DMRef.IBDSiamCont;
         Add('select * from Diario where Asiento=:asiento');
         parambyname('Asiento').AsInteger := QFicheroAsiento.AsInteger;
         ExecQuery;
         while not EOF do begin
            QDuplicar.Close;
            QDuplicar.Sql.Clear;
            QDuplicar.Sql.Add(' INSERT INTO DIARIO (TIPOASIENTO, ID_DIARIO,APUNTE,ASIENTO,BASEIMPONIBLE,');
            QDuplicar.Sql.Add(' COMENTARIO,DEBEHABER,FECHA,');
            if not empty(FieldByName('cuenta_analitica').AsString) then begin
               QDuplicar.Sql.Add(' CUENTA_ANALITICA,');
            end;
            QDuplicar.Sql.Add(' IMPORTE,IVA,NIF,MONEDA,NUMEROFACTURA,RECARGO,');
            if (FieldByName('contrapartida').AsString) = '' then begin
               QDuplicar.Sql.Add(' SUBCUENTA,ID_CONCEPTOS) ');
            end
            else begin
               QDuplicar.Sql.Add(' SUBCUENTA,ID_CONCEPTOS,CONTRAPARTIDA) ');
            end;
            QDuplicar.Sql.Add(' VALUES(:TIPOASIENTO, :ID_DIARIO,:APUNTE,:ASIENTO,:BASEIMPONIBLE,');
            QDuplicar.Sql.Add(' :COMENTARIO,:DEBEHABER,:FECHA,');
            if not empty(FieldByName('cuenta_analitica').AsString) then begin
               QDuplicar.Sql.Add(' :CUENTA_ANALITICA,');
            end;
            QDuplicar.Sql.Add(' :IMPORTE,:IVA,:NIF,:MONEDA,:NUMEROFACTURA,:RECARGO,');
            if (FieldByName('contrapartida').AsString) = '' then begin
               QDuplicar.Sql.Add(' :SUBCUENTA,:ID_CONCEPTOS) ');
            end
            else begin
               QDuplicar.Sql.Add(' :SUBCUENTA,:ID_CONCEPTOS,:CONTRAPARTIDA) ');
            end;

            QDuplicar.Params.ByName('TIPOASIENTO'  ).AsInteger := FieldByName('TIPOASIENTO').AsInteger;
            QDuplicar.Params.byname('ID_DIARIO'    ).AsInteger := DmContaRef.Obtener_Contador('diario', 'id_diario', 'Diario');
            QDuplicar.Params.byname('APUNTE'       ).AsInteger := FieldByName('APUNTE').AsInteger;
            QDuplicar.Params.byname('ASIENTO'      ).AsInteger := nAsiento;
            QDuplicar.Params.byname('BASEIMPONIBLE').AsFloat   := FieldByName('BASEIMPONIBLE').AsFloat;
            QDuplicar.Params.byname('ID_CONCEPTOS' ).AsString  := FieldByName('ID_CONCEPTOS').AsString;
            QDuplicar.Params.byname('SUBCUENTA'    ).AsString  := FieldByName('SUBCUENTA').AsString;
            if not empty(FieldByName('Cuenta_Analitica').AsString) then begin
               QDuplicar.Params.byname('CUENTA_ANALITICA').AsString := FieldByName('Cuenta_Analitica').AsString;
            end;
            QDuplicar.Params.byname('COMENTARIO'   ).AsString   := FieldByName('COMENTARIO'   ).AsString;
            QDuplicar.Params.byname('DEBEHABER'    ).AsString   := FieldByName('DEBEHABER'    ).AsString;
            QDuplicar.Params.byname('FECHA'        ).AsDateTime := Date;
            QDuplicar.Params.byname('IMPORTE'      ).AsFloat    := FieldByName('IMPORTE'      ).AsFloat;
            QDuplicar.Params.byname('IVA'          ).AsFloat    := FieldByName('IVA'          ).AsFloat;
            QDuplicar.Params.byname('NIF'          ).AsString   := FieldByName('NIF'          ).AsString;
            QDuplicar.Params.byname('MONEDA'       ).AsString   := FieldByName('MONEDA'       ).AsString;
            QDuplicar.Params.byname('NUMEROFACTURA').AsString   := FieldByName('NUMEROFACTURA').AsString;
            QDuplicar.Params.byname('RECARGO'      ).AsFloat    := FieldByName('RECARGO'      ).AsFloat;
            if (FieldByName('contrapartida').AsString <> '') then begin
               QDuplicar.Params.byname('CONTRAPARTIDA').AsString := FieldByName('CONTRAPARTIDA').AsString;
            end;
            QDuplicar.ExecQuery;
            QDuplicar.Transaction.CommitRetaining;
            Next;
         end;
         Close;
         Free;
      end;

      if QFicheroTIPOASIENTO.AsInteger = ASIENTO_NOMINA then  begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QDuplicar, SQL do begin
            Close;
            Clear;
            Add('INSERT INTO NOMINAS (ASIENTO, NOMINA, IRPF, SSOCIAL, NETO, SUBCUENTA)');
            Add('SELECT ' + IntToStr(nAsiento) + ', NOMINA, IRPF, SSOCIAL, NETO, SUBCUENTA');
            Add('FROM NOMINAS WHERE ASIENTO = :ASIENTO');
            ParamByName('ASIENTO').AsInteger := QFicheroASIENTO.AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;
         end;
      end;

      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QDuplicar do begin
         Close;
         Free;
      end;
      //Mostrar asiento duplicado
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFiltro do begin
         if not (state in dseditmodes) then begin
            edit;
         end;
         FieldByName('BAsiento').AsInteger := nAsiento;
         post;
      end;
   end;

   PrepararQuery;
   Paginas.Update;
   FiltroBAsiento.Repaint;
   Rejilla.Repaint;

   // Editar asiento duplicado
   ModificarAsiento;
end;

procedure TWDiario.BtnNavVencimientosClick(Sender: TObject);
var TipoCuenta :string;
begin
   if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARTERAEFECTOS') then begin
      Exit;
   end;


   if not QFichero.IsEmpty then  begin
      TipoCuenta := '';
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT TIPOCUENTA FROM CUENTAS');
         Add('WHERE CUENTA = :CUENTA');
         ParamByName('CUENTA').AsString := Copy(QFicheroSUBCUENTA.AsString, 1, 3);
         Open;
         if not EOF then begin
            TipoCuenta := FieldByName('TIPOCUENTA').AsString;
         end;
         Close;
         Free;
      end;

      if (TipoCuenta = 'C') and (QFicheroDEBEHABER.AsString = 'D') then begin
         if Copy(QFicheroSUBCUENTA.AsString, 1, 3) = '431' then begin
            if MessageDlg('¿Desea generar el vencimiento asociado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
               if Assigned(WCarteraEfectos) then begin
                  WCarteraEfectos.Close;
               end;
               WCarteraEfectos           := TWCarteraEfectos.Create(nil);
               WCarteraEfectos.FNuevoVto := True;
               WCarteraEfectos.FSubcuentaNuevoVto := QFicheroSUBCUENTA.AsString;
               WCarteraEfectos.FConceptoNuevoVto := QFicheroDescApunte.AsString;
               WCarteraEfectos.FImporteNuevoVto := QFicheroIMPORTE.AsFloat;
               WCarteraEfectos.Show;
            end;
         end
         else begin
            if (QFicheroNUMEROFACTURA.AsString <> '') then begin
               if Assigned(WCarteraEfectos) then begin
                  WCarteraEfectos.Close;
               end;
               WCarteraEfectos := TWCarteraEfectos.Create(nil);
               WCarteraEfectos.FFacturaCliente := QFicheroNUMEROFACTURA.AsString;
               WCarteraEfectos.Show;
            end;
         end;
      end
      else
      if (TipoCuenta = 'P') and (QFicheroDEBEHABER.AsString = 'H') then begin
         if (QFicheroNUMEROFACTURA.AsString <> '') then begin
            if Assigned(WCarteraEfectos) then begin
               WCarteraEfectos.Close;
            end;
            WCarteraEfectos := TWCarteraEfectos.Create(nil);
            WCarteraEfectos.FFacturaProveedor := QFicheroNUMEROFACTURA.AsString;
            WCarteraEfectos.Show;
         end;
      end
      else begin
         MessageDlg('Seleccione una Factura de Venta o de Compra', mtError, [mbOK], 0);
      end;
   end;
   Paginas.Update;
   FiltroBAsiento.Repaint;
   Rejilla.Repaint;
end;

procedure TWDiario.BtnNavSeleccionClick(Sender: TObject);
begin
   if not QFichero.IsEmpty then  begin
      if (DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) <> 'P') and
         (DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) <> 'C') then begin
         MessageDlg('El apunte seleccionado no corresponde a una subcuenta de proveedor o cliente', mtError, [mbOK], 0);
      end
      else begin
         WCargaCobrosPagos.FID_Diario := QFicheroID_DIARIO.AsInteger;
         Close;
      end;
   end;
end;

procedure TWDiario.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWDiario.BtnNavAsientoBajaClick(Sender: TObject);
var Asiento   :Integer;
    QAsientos :TIBQuery;
begin
   if not QFichero.IsEmpty then  begin
      if MessageDlg('¿Confirma la realización del asiento de baja?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         Asiento := DMContaRef.ObtenerNumeroAsiento;

         QAsientos := TIBQuery.Create(nil);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QAsientos, SQL do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            Add('SELECT * FROM DIARIO WHERE ASIENTO = :ASIENTO');
            ParamByName('ASIENTO').AsInteger := QFicheroASIENTO.AsInteger;
            Open;
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSQL.Create(nil), SQL do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            Add('INSERT INTO DIARIO ');
            Add('(APUNTE, ASIENTO, COMENTARIO, CONTRAPARTIDA, DEBEHABER,');
            Add(' FECHA, IMPORTE, MONEDA, NUMEROFACTURA, SUBCUENTA,');
            Add(' ID_CONCEPTOS, CUENTA_ANALITICA)');
            Add('VALUES');
            Add('(:APUNTE, :ASIENTO, :COMENTARIO, :CONTRAPARTIDA, :DEBEHABER,');
            Add(' :FECHA, :IMPORTE, :MONEDA, :NUMEROFACTURA, :SUBCUENTA,');
            Add(' :ID_CONCEPTOS, :CUENTA_ANALITICA)');
            while not QAsientos.EOF do begin
               Close;
               ParamByName('APUNTE').AsInteger        := QAsientos.FieldByName('APUNTE').AsInteger;
               ParamByName('ASIENTO').AsInteger       := Asiento;
               ParamByName('COMENTARIO').AsString     := QAsientos.FieldByName('COMENTARIO').AsString;
               ParamByName('CONTRAPARTIDA').AsVariant := QAsientos.FieldByName('SUBCUENTA').AsVariant;
               ParamByName('DEBEHABER').AsString      := QAsientos.FieldByName('DEBEHABER').AsString;
               ParamByName('FECHA').AsDateTime        := Date;
               ParamByName('IMPORTE').AsDouble        :=
                  RoundToDecimal(QAsientos.FieldByName('IMPORTE').AsFloat, 2, True);
               ParamByName('MONEDA').AsString         := QAsientos.FieldByName('MONEDA').AsString;
               ParamByName('NUMEROFACTURA').AsString  := QAsientos.FieldByName('NUMEROFACTURA').AsString;
               ParamByName('SUBCUENTA').AsVariant     := QAsientos.FieldByName('CONTRAPARTIDA').AsVariant;
               ParamByName('ID_CONCEPTOS').AsVariant  := QAsientos.FieldByName('ID_CONCEPTOS').AsVariant;
               ParamByName('CUENTA_ANALITICA').AsVariant :=
                  QAsientos.FieldByName('CUENTA_ANALITICA').AsVariant;
               ExecQuery;
               Transaction.CommitRetaining;
               QAsientos.Next;
            end;  // while not QAsientos.Eof do

            Close;
            Free;
         end;
         MessageDlg('Generado el asiento nº ' + IntToStr(Asiento), mtInformation, [mbOK], 0);
      end;
   end;        
end;

procedure TWDiario.RejillaCalcCellColors(Sender: TObject; Field: TField;
   State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   // Ordenación por ASIENTO
   if StrPos(PChar(UpperCase(FCampoOrden)), 'ASIENTO') <> nil then  begin
      if QFicheroASIENTO.AsInteger <> FAsientoAnterior then begin
         FAsientoAnterior := QFicheroASIENTO.AsInteger;
         if FColorActual = COLOR_ASIENTO1 then begin
            FColorActual := COLOR_ASIENTO2;
         end
         else begin
            FColorActual := COLOR_ASIENTO1;
         end;
      end;
   end
   // Ordenación por FECHA
   else
   if StrPos(PChar(UpperCase(FCampoOrden)), 'FECHA') <> nil then  begin
      if QFicheroFECHA.AsDateTime <> FFechaAnterior then begin
         FFechaAnterior := QFicheroFECHA.AsDateTime;
         if FColorActual = COLOR_ASIENTO1 then begin
            FColorActual := COLOR_ASIENTO2;
         end
         else begin
            FColorActual := COLOR_ASIENTO1;
         end;
      end;
   end
   // Ordenación por SUBCUENTA
   else
   if StrPos(PChar(UpperCase(FCampoOrden)), 'SUBCUENTA') <> nil then  begin
      if QFicheroSUBCUENTA.AsString <> FSubcuentaAnterior then begin
         FSubcuentaAnterior := QFicheroSUBCUENTA.AsString;
         if FColorActual = COLOR_ASIENTO1 then begin
            FColorActual := COLOR_ASIENTO2;
         end
         else begin
            FColorActual := COLOR_ASIENTO1;
         end;
      end;
   end
   // Ordenación por CONCEPTO
   else
   if StrPos(PChar(UpperCase(FCampoOrden)), 'ID_CONCEPTOS') <> nil then  begin
      if QFicheroID_CONCEPTOS.AsString <> FConceptoAnterior then begin
         FConceptoAnterior := QFicheroID_CONCEPTOS.AsString;
         if FColorActual = COLOR_ASIENTO1 then begin
            FColorActual := COLOR_ASIENTO2;
         end
         else begin
            FColorActual := COLOR_ASIENTO1;
         end;
      end;
   end
   // Ordenación por CONTRAPARTIDA
   else
   if StrPos(PChar(UpperCase(FCampoOrden)), 'CONTRAPARTIDA') <> nil then  begin
      if QFicheroCONTRAPARTIDA.AsString <> FContrapartidaAnterior then begin
         FContrapartidaAnterior := QFicheroCONTRAPARTIDA.AsString;
         if FColorActual = COLOR_ASIENTO1 then begin
            FColorActual := COLOR_ASIENTO2;
         end
         else begin
            FColorActual := COLOR_ASIENTO1;
         end;
      end;
   end

   else begin
      FColorActual := COLOR_ASIENTO1;
   end;


   if State * [gdFixed, gdSelected] = [] then begin
      ABrush.Color := FColorActual;
   end;
end;

procedure TWDiario.BtnNavRenumerarClick(Sender: TObject);
var Asiento :Integer;
begin
   if not QFichero.IsEmpty then  begin
      if MessageDlg('¿Confirma la renumeración del asiento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         Asiento := DMContaRef.ObtenerNumeroAsiento;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSQL.Create(nil), SQL do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            Add('UPDATE DIARIO SET ASIENTO = :ASIENTO_NUEVO');
            Add('WHERE ASIENTO = :ASIENTO_ACTUAL');
            ParamByName('ASIENTO_NUEVO').AsInteger  := Asiento;
            ParamByName('ASIENTO_ACTUAL').AsInteger := QFicheroASIENTO.AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;

            Close;
            Free;
         end;    

         if not (QFiltro.State in dsEditModes) then begin
            QFiltro.Edit;
         end;
         QFiltro.FieldByName('BAsiento').AsInteger := Asiento;
         PrepararQuery;

         Paginas.PageIndex := TabDiario;

         FiltroBAsiento.SetFocus;
         Paginas.Update;
         FiltroBAsiento.Repaint;
         Rejilla.Repaint;

         MessageDlg('Asiento renumerado ' + IntToStr(Asiento), mtInformation, [mbOK], 0);
      end;
   end;        // if not QFichero.IsEmpty then
end;

procedure TWDiario.FiltroImporteDesdeExit(Sender: TObject);
begin
   if QFiltro.State in dsEditModes then begin
      QFiltro.FieldByName('IMPORTEHASTA').AsFloat := QFiltro.FieldByName('IMPORTEDESDE').AsFloat;
   end;
end;

end.
