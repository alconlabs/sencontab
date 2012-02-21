unit DMConta;
interface
uses Classes, Controls, Dialogs, Forms, Graphics, Messages, SysUtils, Windows,
     IBQuery, IBDatabase, IBSQL, IBTableSet,
     wwclient, Wwtable, IBCustomDataSet, DB, DBTables, DBClient,
     ccMemTable;
type
   TDMContaRef = class(TDataModule)
      QGrupos: TIBTableSet;
      QGruposDesc: TIBTableSet;
      Transaccion: TIBTransaction;
      QGruposDESCRIPCION: TIBStringField;
      QGruposGRUPO: TIBStringField;
      QGruposDescDESCRIPCION: TIBStringField;
      QGruposDescGRUPO: TIBStringField;
      QSubCuentas: TIBTableSet;
      QSubCuentasDesc: TIBTableSet;
      QSubCuentasSUBCUENTA: TIBStringField;
      QSubCuentasDESCRIPCION: TIBStringField;
      QSubCuentasDescSUBCUENTA: TIBStringField;
      QSubCuentasDescDESCRIPCION: TIBStringField;
      QConceptosDesc: TIBTableSet;
      QConceptosDescDESCRIPCION: TIBStringField;
      QConceptosDescTIPOCONCEPTO: TIBStringField;
      QSubCTAGastos:     TIBTableSet;
      IBStringField4:    TIBStringField;
      IBStringField5:    TIBStringField;
      QSubCTAGastosDesc: TIBTableSet;
      IBStringField7:    TIBStringField;
      IBStringField8:    TIBStringField;
      QSubCTABanco:      TIBTableSet;
      IBStringField6:    TIBStringField;
      IBStringField9:    TIBStringField;
      QSubCTABancoDesc:  TIBTableSet;
      IBStringField10:   TIBStringField;
      IBStringField11:   TIBStringField;
      QInformesConta:    TClientDataSet;
      QInformesContaFechaInicial: TDateTimeField;
      QInformesContaFecha: TDateTimeField;
      QInformesContaFechaFinal: TDateTimeField;
      QInformesContaAsiento: TIntegerField;
      QInformesContaApunte: TIntegerField;
      QInformesContaSubcuenta: TStringField;
      QInformesContaDescSubcuenta: TStringField;
      QInformesContaDescApunte: TStringField;
      QInformesContaContrapartida: TStringField;
      QInformesContaDebe: TFloatField;
      QInformesContaHaber: TFloatField;
      QInformesContaSaldo: TFloatField;
      QInformesContaFechaImpresion: TDateField;
      QInformesContaDebeHaber: TStringField;
    SInformesConta: TDataSource;
      QInformesContaImporte: TFloatField;
      QSubCTAProveedores: TIBTableSet;
      IBStringField12:   TIBStringField;
      IBStringField13:   TIBStringField;
      QSubCTAProveedoresDesc: TIBTableSet;
      IBStringField14:   TIBStringField;
      IBStringField15:   TIBStringField;
      QSubCTAIVADeducibleDesc: TIBTableSet;
      IBStringField16:   TIBStringField;
      IBStringField17:   TIBStringField;
      QSubCTAIVADeducible: TIBTableSet;
      IBStringField18:   TIBStringField;
      IBStringField19:   TIBStringField;
      QSubCTACompraDesc: TIBTableSet;
      IBStringField20:   TIBStringField;
      IBStringField21:   TIBStringField;
      QSubCTACompra:     TIBTableSet;
      IBStringField22:   TIBStringField;
      IBStringField23:   TIBStringField;
      QInformesContaDescripcion: TStringField;
      QInformesContaFechaPrevista: TDateField;
      QInformesContaObservaciones: TStringField;
      QInformesContaNombreCliente: TStringField;
      QInformesContaID_Cliente: TIntegerField;
      QInformesContaNumLinea: TIntegerField;
      QInformesContaFactura: TStringField;
      QInformesContaNIF: TStringField;
      QInformesContaBaseImponible: TFloatField;
      QInformesContaCuotaIVA: TFloatField;
      QInformesContaTotalFactura: TFloatField;
      QSubCTAIVARepercutido: TIBTableSet;
      IBStringField24:   TIBStringField;
      IBStringField25:   TIBStringField;
      QSubCTAIVARepercutidoDesc: TIBTableSet;
      IBStringField26:   TIBStringField;
      IBStringField27:   TIBStringField;
      QSubCTAVentas:     TIBTableSet;
      IBStringField28:   TIBStringField;
      IBStringField29:   TIBStringField;
      QSubCTAVentasDesc: TIBTableSet;
      IBStringField30:   TIBStringField;
      IBStringField31:   TIBStringField;
      QSubCTAAmortGastos: TIBTableSet;
      IBStringField32:   TIBStringField;
      IBStringField33:   TIBStringField;
      QSubCTAAmortGastosDesc: TIBTableSet;
      IBStringField34:   TIBStringField;
      IBStringField35:   TIBStringField;
      QInformesContaIVA: TFloatField;
      QInformesContaTitulo: TStringField;
      QInformesContaClienteProveedor: TStringField;
      QInformesContaProvincia: TStringField;
      QInformesContaImporteVentas: TFloatField;
      QInformesContaImporteCompras: TFloatField;
      QInformesContaTotalSumaDebe: TFloatField;
      QInformesContaTotalSumaHaber: TFloatField;
      QInformesContaTotalSumaSaldo: TFloatField;
      QInformesContaGasto: TIntegerField;
      QInformesContaBaseSinIVA: TFloatField;
      QInformesContaBaseConIVA: TFloatField;
      QInformesContaDescConcepto: TStringField;
      QInformesContaEjercicio: TIntegerField;
      QInformesContaDescPeriodo: TStringField;
      QInformesContaIngresos: TFloatField;
      QInformesContaGastos: TFloatField;
      QInformesContaRetenciones: TFloatField;
      QInformesContaMes: TIntegerField;
      QInformesContaTrimestre: TIntegerField;
      QInformesContaTotalBruto: TFloatField;
      QInformesContaTotalBruto16: TFloatField;
      QInformesContaTotalBruto0: TFloatField;
      QInformesContaBaseSinIVA16: TFloatField;
      QInformesContaBaseSinIVA0: TFloatField;
      QInformesContaBaseConIVA16: TFloatField;
      QInformesContaBaseConIVA0: TFloatField;
      QInformesContaCuotaIVA16: TFloatField;
      QInformesContaCuotaIVA0: TFloatField;
      QInformesContaRetenciones16: TFloatField;
      QInformesContaRetenciones0: TFloatField;
      QInformesContaTotalFactura16: TFloatField;
      QInformesContaTotalFactura0: TFloatField;
      QInformesContaDescInforme: TStringField;
      QSubCTAAmort:      TIBTableSet;
      IBStringField1:    TIBStringField;
      IBStringField2:    TIBStringField;
      QSubCTAAmortDesc:  TIBTableSet;
      IBStringField3:    TIBStringField;
      IBStringField36:   TIBStringField;
      QConceptosDescID_CONCEPTOS: TIBStringField;
      QSubCtaClientes:   TIBTableSet;
      IBStringField37:   TIBStringField;
      IBStringField38:   TIBStringField;
      QSubCtaClientesDesc: TIBTableSet;
      IBStringField39:   TIBStringField;
      IBStringField40:   TIBStringField;
      QContadores:       TIBSQL;
      QInformesContaRecargo: TFloatField;
      QInformesContaCuotaRecargo: TFloatField;
      QConceptos:        TIBTableSet;
      IBStringField41:   TIBStringField;
      IBStringField42:   TIBStringField;
      IBStringField43:   TIBStringField;
      QInformesContaId_Conceptos: TStringField;
      sInfBalAcum:       TDataSource;
      QInfBalAcum:       TClientDataSet;
      sInfBalExplo:      TDataSource;
      QInfBalExplo:      TClientDataSet;
      QInfBalAcumCUENTA: TStringField;
      QInfBalAcumDESCRIPCION: TStringField;
      QInfBalAcumMES1:   TFloatField;
      QInfBalAcumMES2:   TFloatField;
      QInfBalAcumMES3:   TFloatField;
      QInfBalAcumMES4:   TFloatField;
      QInfBalAcumMES5:   TFloatField;
      QInfBalAcumMES6:   TFloatField;
      QInfBalAcumMES7:   TFloatField;
      QInfBalAcumMES8:   TFloatField;
      QInfBalAcumMES9:   TFloatField;
      QInfBalAcumMES10:  TFloatField;
      QInfBalAcumMES11:  TFloatField;
      QInfBalAcumMES12:  TFloatField;
      QInfBalAcumTOTAL:  TFloatField;
      QInfBalAcumFECHAINICIAL: TDateTimeField;
      QInfBalAcumFECHAFINAL: TDateTimeField;
      QInfBalAcumFECHAIMPRESION: TDateTimeField;
      QInfBalExploFECHAINICIAL: TDateTimeField;
      QInfBalExploFECHAFINAL: TDateTimeField;
      QInfBalExploFECHAIMPRESION: TDateTimeField;
      QInfBalExploLINEA: TFloatField;
      QInfBalExploCUENTA: TIntegerField;
      QInfBalExploDESCRIPCION: TStringField;
      QInfBalExploSALDOACTUAL: TFloatField;
      QInfBalExploSALDOANTERIOR: TFloatField;
      QInfBalExploSALDODIF: TFloatField;
      QInfBalExploTANTOACTUAL: TFloatField;
      QInfBalExploTANTOANTERIOR: TFloatField;
      QInfBalExploTANTODIF: TFloatField;
      QInfBalAcumTITULOLISTADO: TStringField;
      QSubCtaClientesProv: TIBTableSet;
      QSubCtaClientesProvDesc: TIBTableSet;
      QSubCtaClientesProvDESCRIPCION: TIBStringField;
      QSubCtaClientesProvSUBCUENTA: TIBStringField;
      QSubCtaClientesProvDescDESCRIPCION: TIBStringField;
      QSubCtaClientesProvDescSUBCUENTA: TIBStringField;
      QFiltroAnaliticas: TIBQuery;
      QSubCTANominas:    TIBTableSet;
      IBStringField44:   TIBStringField;
      IBStringField45:   TIBStringField;
      QSubCTANominasDesc: TIBTableSet;
      IBStringField46:   TIBStringField;
      IBStringField47:   TIBStringField;
      QSubCtaCobrosPagos: TIBTableSet;
      QSubCtaCobrosPagosDesc: TIBTableSet;
      QSubCtaCobrosPagosDESCRIPCION: TIBStringField;
      QSubCtaCobrosPagosSUBCUENTA: TIBStringField;
      QSubCtaCobrosPagosDescDESCRIPCION: TIBStringField;
      QSubCtaCobrosPagosDescSUBCUENTA: TIBStringField;
      QSubCTAIVADeducibleIntra: TIBTableSet;
      QSubCTAIVADeducibleIntraDesc: TIBTableSet;
      QSubCTAIVADeducibleIntraDESCRIPCION: TIBStringField;
      QSubCTAIVADeducibleIntraSUBCUENTA: TIBStringField;
      QSubCTAIVADeducibleIntraDescDESCRIPCION: TIBStringField;
      QSubCTAIVADeducibleIntraDescSUBCUENTA: TIBStringField;
      QSubCTAIVARepercutidoIntraDesc: TIBTableSet;
      QSubCTAIVARepercutidoIntra: TIBTableSet;
      QSubCTAIVARepercutidoIntraDESCRIPCION: TIBStringField;
      QSubCTAIVARepercutidoIntraSUBCUENTA: TIBStringField;
      QSubCTAIVARepercutidoIntraDescDESCRIPCION: TIBStringField;
      QSubCTAIVARepercutidoIntraDescSUBCUENTA: TIBStringField;
      SInfDiario:        TDataSource;
      QInfDiario:        TIBTableSet;
      QInfDiarioASIENTO: TIntegerField;
      QInfDiarioAPUNTE:  TSmallintField;
      QInfDiarioFECHA:   TDateTimeField;
      QInfDiarioSUBCUENTA: TIBStringField;
      QInfDiarioID_CONCEPTOS: TIBStringField;
      QInfDiarioDescApunte: TStringField;
      QInfDiarioDEBEHABER: TIBStringField;
      QInfDiarioCONTRAPARTIDA: TIBStringField;
      QInfDiarioPUNTEO:  TIBStringField;
      QInfDiarioDESCSUBCUENTA: TIBStringField;
      QInfDiarioDESCCONCEPTO: TIBStringField;
      QInfDiarioDebe:    TFloatField;
      QInfDiarioHaber:   TFloatField;
      QInfDiarioCOMENTARIO: TIBStringField;
      QInfDiarioIMPORTE: TFloatField;
      QInfDiarioNUMEROFACTURA: TIBStringField;
      QInfDiarioDESCCONTRAPARTIDA: TIBStringField;
      QInfDiarioABREVIATURA: TIBStringField;
      QSubCuentasABREVIATURA: TIBStringField;
      QSubCuentasDescABREVIATURA: TIBStringField;
      QInformesContaCuenta_Analitica: TStringField;
    HCorreo: TwwTable;
      QSubCtaCarteraEfectosDesc: TIBTableSet;
      QSubCtaCarteraEfectos: TIBTableSet;
      QSubCtaCarteraEfectosDESCRIPCION: TIBStringField;
      QSubCtaCarteraEfectosSUBCUENTA: TIBStringField;
      QSubCtaCarteraEfectosDescDESCRIPCION: TIBStringField;
      QSubCtaCarteraEfectosDescSUBCUENTA: TIBStringField;
      QGraficos:         TwwClientDataSet;
      SGraficos:         TDataSource;
      QGraficosDEBEACT:  TFloatField;
      QGraficosDEBEANT:  TFloatField;
      QGraficosHABERACT: TFloatField;
      QGraficosHABERANT: TFloatField;
      QGraficosSALDOACT: TFloatField;
      QGraficosSALDOANT: TFloatField;
      QGraficosMES:      TStringField;
      QGraficosNUMMES:   TIntegerField;
      QSubCTAProveedoresBancos: TIBTableSet;
      QSubCTAProveedoresBancosDesc: TIBTableSet;
      QSubCTAProveedoresBancosDESCRIPCION: TIBStringField;
      QSubCTAProveedoresBancosSUBCUENTA: TIBStringField;
      QSubCTAProveedoresBancosDescDESCRIPCION: TIBStringField;
      QSubCTAProveedoresBancosDescSUBCUENTA: TIBStringField;
      QInfBalExploCUENTA_ANALITICA: TStringField;
      QInfBalExploDESC_ANALITICA: TStringField;
      QInformesContaPUNTEO: TStringField;
      QInfDiarioID_DIARIO: TIntegerField;
      QInfDiarioEJERCICIO: TIntegerField;
      QInfDiarioSERIE:   TIBStringField;
      QSubcuentasSS:     TClientDataSet;
      QInformesContaFSubcuenta: TStringField;
      QInformesContaFDescSubcuenta: TStringField;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure QInformesContaBeforeInsert(DataSet: TDataSet);
      procedure QInfDiarioCalcFields(DataSet: TDataSet);
   private
      procedure AbrirDatasets;
      procedure CerrarDataSets;
      procedure CrearFicheroInformesBalances;
      procedure CrearFicheroInformesConta;
      procedure CrearFicheroGraficos;
   public
      function Obtener_Contador(prmTabla, prmCampo, prmContador: String): Integer;
      procedure ActualizarNumeroGasto(Gasto: Integer);
      function GetDescripcionApunte(DescripConcepto, NumeroFactura, Serie: String;
         Ejercicio: Integer; ComentarioApunte, AbrevSubcta: String): String;
      function ObtenerNumeroAsiento: Integer;
      function ObtenerNumeroAsientoOtraBD(BaseDatos: TibDatabase): Integer;
      procedure ObtenerFiltrosDiario(var nPrimerAsiento, nUltimoAsiento: Integer;
         var dPrimeraFecha, dUltimaFecha: TDatetime);
      function ObtenerUltimoAsientoSubcuenta(Subcuenta: String;
         FechaIni, FechaFin: TDateTime): Integer;
      function Dame_Contador(contador: String): Integer;
      procedure Actualizar_Contador(contador: String; Valor: Integer);
      procedure RefrescarSubcuentas(Subcuenta: String);
      function Pertenece_Analitica(CuentaAnalitica, FiltroCuenta, FiltroCuentaH,
         FiltroDelegacion, FiltroDepartamento, FiltroSeccion, FiltroProyecto: String;
         BaseDatos: TIBDatabase = nil): Boolean;
      function ObtenerTipoSubcuenta(Subcuenta: String): String;
      function AsientoBloqueado(FechaAsiento: TDateTime): Boolean;
      function FechaAsientoPerteneceEjercicio(FechaAsiento: TDateTime): Boolean;
      procedure CrearTablaCorreo;
      procedure InicializarFicherosInformes;
   end;

var
   DMContaRef: TDMContaRef;

implementation
uses General, Globales, DM, Splash;

{$R *.DFM}

procedure TDMContaRef.ActualizarNumeroGasto(Gasto: Integer);
begin
   if Gasto < 0 then Gasto := 0;
   DMRef.EjecutarSQL('SET GENERATOR GASTO TO ' + IntToStr(Gasto));
end;

procedure TDMContaRef.RefrescarSubcuentas(Subcuenta: String);
var TipoCuenta :string;
begin
   Screen.Cursor := crHourGlass;

   TipoCuenta := ObtenerTipoSubcuenta(Subcuenta);


   FIbQueryRefresh(QSubCuentas);
   FIbQueryRefresh(QSubCuentasDesc);

   if TipoCuenta = 'C' then begin
      FibQueryRefresh(QSubCtaClientes);
      FibQueryRefresh(QSubCtaClientesDesc);
      FibQueryRefresh(QSubCtaClientesProv);
      FibQueryRefresh(QSubCtaClientesProvDesc);
      FibQueryRefresh(QSubCtaCobrosPagos);
      FibQueryRefresh(QSubCtaCobrosPagosDesc);
      FibQueryRefresh(QSubCtaCarteraEfectos);
      FibQueryRefresh(QSubCtaCarteraEfectosDesc);
   end else
   if TipoCuenta = 'P' then begin
      FIbQueryRefresh(QSubCTAProveedores);
      FIbQueryRefresh(QSubCTAProveedoresDesc);
      FIbQueryRefresh(QSubCTAProveedoresBancos);
      FIbQueryRefresh(QSubCTAProveedoresBancosDesc);
      FibQueryRefresh(QSubCtaClientesProv);
      FibQueryRefresh(QSubCtaClientesProvDesc);
      FibQueryRefresh(QSubCtaCobrosPagos);
      FibQueryRefresh(QSubCtaCobrosPagosDesc);
      FibQueryRefresh(QSubCtaCarteraEfectos);
      FibQueryRefresh(QSubCtaCarteraEfectosDesc);
   end else
   if TipoCuenta = 'R' then begin
      FIbQueryRefresh(QSubCTAIVARepercutido);
      FIbQueryRefresh(QSubCTAIVARepercutidoDesc);
      FIbQueryRefresh(QSubCTAIVARepercutidoIntra);
      FIbQueryRefresh(QSubCTAIVARepercutidoIntraDesc);
   end else
   if TipoCuenta = 'S' then begin
      FIbQueryRefresh(QSubCTAIVADeducible);
      FIbQueryRefresh(QSubCTAIVADeducibleDesc);
      FIbQueryRefresh(QSubCTAIVADeducibleIntra);
      FIbQueryRefresh(QSubCTAIVADeducibleIntraDesc);
   end else
   if TipoCuenta = 'M' then begin
      FIbQueryRefresh(QSubCTAAmortGastos);
      FIbQueryRefresh(QSubCTAAmortGastosDesc);
      FIbQueryRefresh(QSubCTAAmort);
      FIbQueryRefresh(QSubCTAAmortDesc);
   end else
   if TipoCuenta = 'I' then begin
      FIbQueryRefresh(QSubCTAAmortGastos);
      FIbQueryRefresh(QSubCTAAmortGastosDesc);
      FIbQueryRefresh(QSubCTAAmort);
      FIbQueryRefresh(QSubCTAAmortDesc);
   end else
   if TipoCuenta = 'B' then begin
      FIbQueryRefresh(QSubCTABanco);
      FIbQueryRefresh(QSubCTABancoDesc);
      FibQueryRefresh(QSubCtaCobrosPagos);
      FibQueryRefresh(QSubCtaCobrosPagosDesc);
      FibQueryRefresh(QSubCtaCarteraEfectos);
      FibQueryRefresh(QSubCtaCarteraEfectosDesc);
      FIbQueryRefresh(QSubCTAProveedoresBancos);
      FIbQueryRefresh(QSubCTAProveedoresBancosDesc);
   end else
   if TipoCuenta = 'V' then begin
      FIbQueryRefresh(QSubCTAVentas);
      FIbQueryRefresh(QSubCTAVentasDesc);
   end else
   if TipoCuenta = 'A' then begin
      FIbQueryRefresh(QSubCTAAmortGastos);
      FIbQueryRefresh(QSubCTAAmortGastosDesc);
      FIbQueryRefresh(QSubCTAGastos);
      FIbQueryRefresh(QSubCTAGastosDesc);
      FIbQueryRefresh(QSubCTACompra);
      FIbQueryRefresh(QSubCTACompraDesc);
      FibQueryRefresh(QSubCtaCobrosPagos);
      FibQueryRefresh(QSubCtaCobrosPagosDesc);
   end else
   if TipoCuenta = 'N' then begin
      FIbQueryRefresh(QSubCTANominas);
      FIbQueryRefresh(QSubCTANominasDesc);
   end else
   if TipoCuenta = 'O' then begin
   end;

   Screen.Cursor := crDefault;
end;

function TDMContaRef.GetDescripcionApunte(DescripConcepto, NumeroFactura, Serie: String;
   Ejercicio: Integer; ComentarioApunte, AbrevSubcta: String): String;
var
   Cadena: String;
begin
   Cadena := '';

   if not empty(DescripConcepto) then begin
      Cadena := Trim(DescripConcepto) + ' ';
   end;

   if (DMRef.QParametros.FieldByName('INCLUIR_ABREV').AsString = 'S') and not
      Empty(AbrevSubcta) and (Trim(AbrevSubcta) <> Trim(NumeroFactura)) then begin
      Cadena := Cadena + Trim(AbrevSubcta) + ' ';
   end;

   if not empty(NumeroFactura) then begin
      if (DMRef.QParametros.FieldByName('TRATASERIE').AsString = 'S') then begin
         if Ejercicio > 0 then begin
            Cadena := Cadena + Trim(IntToStr(Ejercicio));
         end;
         if Serie <> '' then begin
            Cadena := Cadena + '/' + Trim(Serie) + '-';
         end;
      end;
      Cadena := Cadena + Trim(NumeroFactura) + ' ';
   end;

   Cadena := Cadena + Trim(ComentarioApunte);

   Result := Copy(Trim(Cadena), 1, 100);
end;

function TDMContaRef.ObtenerNumeroAsiento: Integer;
var Q :TIBSQL;
begin
   Q := TIBSQL.Create(Self);
   Q.Database := DMRef.IBDSiamCont;
   Q.SQL.Add('EXECUTE PROCEDURE Dame_NumeroAsiento');
   try try Q.ExecQuery;
           Result := Q.FieldByName('ASIENTO').AsInteger;
       except Result := -1;
       end;
   finally Q.Free;
   end;
end;

function TDMContaRef.ObtenerNumeroAsientoOtraBD(BaseDatos: TIBDatabase): Integer;
var Q :TIBSQL;
begin
   Q := TIBSQL.Create(nil);
   Q.Database := BaseDatos;
   Q.SQL.Add('execute procedure Dame_NumeroAsiento');
   try
      Q.ExecQuery;
      Result := Q.FieldByName('asiento').AsInteger;
   finally
      Q.Free;
   end;
end;

function TDmContaRef.Dame_Contador(contador: String): Integer;
begin
   QContadores.Close;
   QContadores.SQL.Clear;
   QContadores.SQL.Add('select gen_id(' + contador + ',0) contador from rdb$database');
   QContadores.ExecQuery;
   Result := QContadores.FieldByName('contador').AsInteger;
   QContadores.Close;
end;

function TDMContaRef.Obtener_Contador(prmTabla, prmCampo, prmContador: String): Integer;
var
   Cuantos:  Integer;
   Contador: Integer;
begin
   Contador := -1;
   Cuantos  := 1;
   while Cuantos > 0 do begin
      QContadores.Close;
      QContadores.SQL.Clear;
      QContadores.SQL.Add('SELECT GEN_ID(' + prmContador + ', 1) CONTADOR FROM rdb$database');
      QContadores.ExecQuery;
      QContadores.Transaction.CommitRetaining;
      Contador := QContadores.FieldByName('CONTADOR').AsInteger;

      QContadores.Close;
      QContadores.SQL.Clear;
      QContadores.SQL.Add('SELECT COUNT(*) CUANTOS FROM ' + prmTabla + ' WHERE ' +
         prmCampo + ' = :prmVALOR');
      QContadores.ParamByName('prmVALOR').AsInteger := Contador;
      QContadores.ExecQuery;
      Cuantos := QContadores.FieldByName('CUANTOS').AsInteger;
      QContadores.Close;
   end;
   Result := Contador;
end;

procedure TDmContaRef.Actualizar_Contador(contador: String; Valor: Integer);
begin
   QContadores.Close;
   QContadores.SQL.Clear;
   QContadores.SQL.Add('set generator ' + contador + ' to ' + IntToStr(valor));
   QContadores.ExecQuery;
   QContadores.Transaction.CommitRetaining;
   QContadores.Close;
end;

function TDMContaRef.Pertenece_Analitica(CuentaAnalitica, FiltroCuenta, FiltroCuentaH,
   FiltroDelegacion, FiltroDepartamento, FiltroSeccion, FiltroProyecto: String;
   BaseDatos: TIBDatabase = nil): Boolean;
var Pertenece: Boolean;
begin
   Pertenece := True;

   if (FiltroCuenta <> '') or (FiltroDelegacion <> '') or (FiltroDepartamento <> '') or
      (FiltroSeccion <> '') or (FiltroProyecto <> '') then begin
      QFiltroAnaliticas.Close;
      if BaseDatos = nil then begin
         QFiltroAnaliticas.Database := DMRef.IBDSiamCont;
      end
      else begin
         QFiltroAnaliticas.Database := BaseDatos;
      end;
      QFiltroAnaliticas.Transaction := QFiltroAnaliticas.Database.DefaultTransaction;
      QFiltroAnaliticas.SQL.Clear;
      QFiltroAnaliticas.SQL.Add('SELECT * FROM ANALITICAS');
      QFiltroAnaliticas.SQL.Add('WHERE CUENTA = :CUENTA_ANALITICA');

      if FiltroCuentaH <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND CUENTA>= :CUENTA and cuenta<=:cuentaH');
      end
      else
      if FiltroCuenta <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND CUENTA = :CUENTA');
      end;

      if FiltroDelegacion <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND ID_DELEGACION = :ID_DELEGACION');
      end;
      if FiltroDepartamento <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND ID_DEPARTAMENTO = :ID_DEPARTAMENTO');
      end;
      if FiltroSeccion <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND ID_SECCION = :ID_SECCION');
      end;
      if FiltroProyecto <> '' then begin
         QFiltroAnaliticas.SQL.Add(' AND ID_PROYECTO = :ID_PROYECTO');
      end;

      QFiltroAnaliticas.ParamByName('CUENTA_ANALITICA').AsString := CuentaAnalitica;
      if FiltroCuenta <> '' then begin
         QFiltroAnaliticas.ParamByName('CUENTA').AsString := FiltroCuenta;
      end;
      if FiltroCuentaH <> '' then begin
         QFiltroAnaliticas.ParamByName('CUENTAH').AsString := FiltroCuentaH;
      end;
      if FiltroDelegacion <> '' then begin
         QFiltroAnaliticas.ParamByName('ID_DELEGACION').AsString := FiltroDelegacion;
      end;
      if FiltroDepartamento <> '' then begin
         QFiltroAnaliticas.ParamByName('ID_DEPARTAMENTO').AsString := FiltroDepartamento;
      end;
      if FiltroSeccion <> '' then begin
         QFiltroAnaliticas.ParamByName('ID_SECCION').AsString := FiltroSeccion;
      end;
      if FiltroProyecto <> '' then begin
         QFiltroAnaliticas.ParamByName('ID_PROYECTO').AsString := FiltroProyecto;
      end;

      QFiltroAnaliticas.Open;

      Pertenece := not QFiltroAnaliticas.EOF;

      QFiltroAnaliticas.Close;
   end;

   Result := Pertenece;
end;

procedure TDMContaRef.AbrirDatasets;
begin
   QueryOpen(QGrupos, 'SELECT Grupo, Descripcion ' + 'FROM Grupos ORDER BY Grupo');
   QueryOpen(QGruposDesc, 'SELECT Grupo, Descripcion ' + 'FROM Grupos ORDER BY Descripcion');
   QueryOpen(QSubCuentas, 'SELECT SubCuenta, Descripcion, Abreviatura ' +
      'FROM SubCtas WHERE OBSOLETO <> "S" ORDER BY SubCuenta');
   QueryOpen(QSubCuentasDesc, 'SELECT SubCuenta, Descripcion, Abreviatura ' +
      'FROM SubCtas WHERE OBSOLETO <> "S" ORDER BY Descripcion');

   QueryOpen(QSubCtaClientesProv, 'SELECT SUBCUENTA, DESCRIPCION ' +
      'FROM SUBCTAS_CLIENTES_PROVEEDORES ORDER BY SUBCUENTA');
   QueryOpen(QSubCtaClientesProvDesc, 'SELECT SUBCUENTA, DESCRIPCION ' +
      'FROM SUBCTAS_CLIENTES_PROVEEDORES ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAGastos, 'SELECT subcuenta,descripcion FROM SUBCTAS_gastos ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAGastosDesc, 'SELECT subcuenta,descripcion  FROM SUBCTAS_gastos ORDER BY descripcion');

   QueryOpen(QSubCTABanco, 'SELECT subcuenta,descripcion  from subctaS_banco ORDER BY SUBCUENTA');
   QueryOpen(QSubCTABancoDesc, 'SELECT subcuenta,descripcion  from subctaS_banco ORDER BY descripcion');

   QueryOpen(QSubCTAProveedores,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_PROVEEDOR ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAProveedoresDesc,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_PROVEEDOR ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAProveedoresBancos, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' + 'ORDER BY 1');
   QueryOpen(QSubCTAProveedoresBancosDesc, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' + 'ORDER BY 2');

   QueryOpen(QSubCTAClientes, 'SELECT subcuenta,descripcion  FROM SUBCTAS_CLIENTES ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAClientesDesc,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_CLIENTES ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAAmort, 'SELECT subcuenta,descripcion  FROM SUBCTAS_AMORTIZACION ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAAmortDesc,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_AMORTIZACION ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAIVADeducibleIntra, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_DEDUCIBLE ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS ' +
      'WHERE TIPOIVA = "A" OR TIPOIVA = "C" ' + 'ORDER BY 1');
   QueryOpen(QSubCTAIVADeducibleIntraDesc, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_DEDUCIBLE ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS ' +
      'WHERE TIPOIVA = "A" OR TIPOIVA = "C" ' + 'ORDER BY 2');

   QueryOpen(QSubCTAIVARepercutidoIntra, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_REPERCUTIDO ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS ' +
      'WHERE TIPOIVA = "A" OR TIPOIVA = "C" ' + 'ORDER BY 1');
   QueryOpen(QSubCTAIVARepercutidoIntraDesc,
      'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_REPERCUTIDO ' + 'UNION ' +
      'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS ' + 'WHERE TIPOIVA = "A" OR TIPOIVA = "C" ' +
      'ORDER BY 2');

   QueryOpen(QSubCTAIVADeducible, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_DEDUCIBLE ' +
      'ORDER BY 1');
   QueryOpen(QSubCTAIVADeducibleDesc, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_DEDUCIBLE ' +
      'ORDER BY 2');

   QueryOpen(QSubCTAIVARepercutido, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_REPERCUTIDO ' +
      'ORDER BY 1');
   QueryOpen(QSubCTAIVARepercutidoDesc, 'SELECT subcuenta,descripcion FROM SUBCTAS_IVA_REPERCUTIDO ' +
      'ORDER BY 2');

   QueryOpen(QSubCTACompra, 'SELECT subcuenta,descripcion  FROM SUBCTAS_GASTOS ORDER BY SUBCUENTA');
   QueryOpen(QSubCTACompraDesc, 'SELECT subcuenta,descripcion  FROM SUBCTAS_GASTOS ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAVentas, 'SELECT subcuenta,descripcion FROM SUBCTAS_VENTAS ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAVentasDesc, 'SELECT subcuenta,descripcion  FROM SUBCTAS_VENTAS ORDER BY DESCRIPCION');

   QueryOpen(QSubCTAAmortGastos,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_AMORTIZACION_GASTOS ORDER BY SUBCUENTA');
   QueryOpen(QSubCTAAmortGastosDesc,
      'SELECT subcuenta,descripcion  FROM SUBCTAS_AMORTIZACION_GASTOS ORDER BY DESCRIPCION');

   QueryOpen(QSubCTANominas, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS ORDER BY SUBCUENTA');
   QueryOpen(QSubCTANominasDesc,
      'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS ORDER BY DESCRIPCION');

   QueryOpen(QSubCtaCobrosPagos, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_CLIENTES ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_GASTOS ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS ' + 'ORDER BY 1');
   QueryOpen(QSubCtaCobrosPagosDesc, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_CLIENTES ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_GASTOS ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS ' + 'ORDER BY 2');

   QueryOpen(QConceptos, 'SELECT * FROM CONCEPTOS WHERE OBSOLETO<>"S" ORDER BY ID_CONCEPTOS');
   QueryOpen(QConceptosDesc, 'SELECT * FROM CONCEPTOS WHERE OBSOLETO<>"S" order by descripcion');

   QueryOpen(QInfDiario, 'SELECT	' + 'D.ASIENTO, D.APUNTE, D.SUBCUENTA, D.ID_CONCEPTOS, ' +
      'D.IMPORTE, D.CONTRAPARTIDA, D.NUMEROFACTURA, D.SERIE, D.EJERCICIO,' +
      'D.FECHA, D.DEBEHABER, D.PUNTEO, D.COMENTARIO, ' +
      'S1.DESCRIPCION DESCSUBCUENTA, S1.ABREVIATURA,' + 'S2.DESCRIPCION DESCCONTRAPARTIDA, ' +
      'C.DESCRIPCION DESCCONCEPTO, D.ID_DIARIO ' + 'FROM ' +
      'DIARIO D LEFT JOIN CONCEPTOS C ' + 'ON D.ID_CONCEPTOS = C.ID_CONCEPTOS ' +
      'LEFT JOIN SUBCTAS S1 ' + 'ON D.SUBCUENTA = S1.SUBCUENTA ' +
      'LEFT JOIN SUBCTAS S2 ' + 'ON D.CONTRAPARTIDA = S2.SUBCUENTA ' +
      'WHERE ASIENTO = :ASIENTO ' + 'ORDER BY D.ASIENTO, D.APUNTE');
   QueryOpen(QSubCtaCarteraEfectos, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_CLIENTES ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' + 'ORDER BY 1');
   QueryOpen(QSubCtaCarteraEfectosDesc, 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_CLIENTES ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_PROVEEDOR ' +
      'UNION ' + 'SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_BANCO ' + 'ORDER BY 2');
end;

procedure TDMContaRef.CerrarDataSets;
//var i :integer;
begin
   {$Message Warn 'Produce un Access Violation al terminar los tests }
   //for i := 0 to ComponentCount - 1 do begin
   //   if Components[i] is TDataSet then begin
   //      try    if TDataSet(Components[i]) <> nil then TDataSet(Components[i]).Close;
   //      except ShowMessage('Error datamodulo al cerrar la tabla ' + TDataSet(Components[i]).Name);
   //      end;
   //   end;
   //end;
end;

procedure TDMContaRef.CrearFicheroInformesBalances;
begin
   // Balance acumulados
   QInfBalAcum.Active := False;

   QInfBalAcum.FieldDefs.Clear;
   // Campos generales
   QInfBalAcum.FieldDefs.Add('FechaInicial'  , ftDateTime ,  0, False);
   QInfBalAcum.FieldDefs.Add('FechaFinal'    , ftDateTime ,  0, False);
   QInfBalAcum.FieldDefs.Add('FechaImpresion', ftDateTime ,  0, False);
   QInfBalAcum.FieldDefs.Add('TituloListado' , ftString   , 50, False);

   QInfBalAcum.FieldDefs.Add('Cuenta'     , ftString, 10, False);
   QInfBalAcum.FieldDefs.Add('Descripcion', ftString, 50, False);
   QInfBalAcum.FieldDefs.Add('Mes1'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes2'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes3'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes4'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes5'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes6'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes7'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes8'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes9'       , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes10'      , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes11'      , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Mes12'      , ftFloat ,  0, False);
   QInfBalAcum.FieldDefs.Add('Total'      , ftFloat ,  0, False);

   QInfBalAcum.IndexDefs.Clear;
   QInfBalAcum.IndexDefs.Add('', 'cuenta', [ixPrimary]);

   QInfBalAcum.CreateDataSet;
   QInfBalAcum.Active := True;


   // Balance explotacion
   QInfBalExplo.Active := False;

   QInfBalExplo.FieldDefs.Clear;
   // Campos generales
   QInfBalExplo.FieldDefs.Add('FechaInicial'  , ftDateTime, 0, False);
   QInfBalExplo.FieldDefs.Add('FechaFinal'    , ftDateTime, 0, False);
   QInfBalExplo.FieldDefs.Add('FechaImpresion', ftDateTime, 0, False);

   QInfBalExplo.FieldDefs.Add('CUENTA_ANALITICA', ftString , 10, False);
   QInfBalExplo.FieldDefs.Add('DESC_ANALITICA'  , ftString , 50, False);
   QInfBalExplo.FieldDefs.Add('Linea'           , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('Cuenta'          , ftInteger,  0, False);
   QInfBalExplo.FieldDefs.Add('Descripcion'     , ftString , 50, False);
   QInfBalExplo.FieldDefs.Add('SaldoActual'     , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('SaldoAnterior'   , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('SaldoDif'        , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('TantoActual'     , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('TantoAnterior'   , ftFloat  ,  0, False);
   QInfBalExplo.FieldDefs.Add('TantoDif'        , ftFloat  ,  0, False);

   QInfBalExplo.IndexDefs.Clear;
   QInfBalExplo.IndexDefs.Add('Cuenta'   , 'Cuenta', []);
   QInfBalExplo.IndexDefs.Add('Analitica', 'CUENTA_ANALITICA; CUENTA', []);


   QInfBalExplo.CreateDataSet;
   QInfBalExplo.Active := True;
end;

procedure TDMContaRef.CrearFicheroInformesConta;
begin
   QSubcuentasSS.Active := False;
   QSubcuentasSS.FieldDefs.Clear;
   QSubcuentasSS.FieldDefs.Add('Subcuenta'    , ftString, 10, False);
   QSubcuentasSS.FieldDefs.Add('DescSubcuenta', ftString, 80, False);
   QSubcuentasSS.FieldDefs.Add('Debe'         , ftFloat ,  0, False);
   QSubcuentasSS.FieldDefs.Add('Haber'        , ftFloat ,  0, False);
   QSubcuentasSS.FieldDefs.Add('Saldo'        , ftFloat ,  0, False);
   QSubcuentasSS.IndexDefs.Clear;
   QSubcuentasSS.IndexDefs.Add('SUBCUENTA', 'SUBCUENTA', []);

   QSubcuentasSS.CreateDataSet;
   QSubcuentasSS.Active := True;

   QInformesConta.Active := False;

   QInformesConta.FieldDefs.Clear;
   QInformesConta.FieldDefs.Add('DescInforme'     , ftString  , 255, False);
   QInformesConta.FieldDefs.Add('Fecha'           , ftDateTime,   0, False);
   QInformesConta.FieldDefs.Add('FechaPrevista'   , ftDateTime,   0, False);
   QInformesConta.FieldDefs.Add('FechaInicial'    , ftDateTime,   0, False);
   QInformesConta.FieldDefs.Add('FechaFinal'      , ftDateTime,   0, False);
   QInformesConta.FieldDefs.Add('Titulo'          , ftString  , 100, False);
   QInformesConta.FieldDefs.Add('ClienteProveedor', ftString  ,  10, False);

   QInformesConta.FieldDefs.Add('PUNTEO'          , ftString  ,   1, False);
   QInformesConta.FieldDefs.Add('Gasto'           , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('Asiento'         , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('Apunte'          , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('FSubcuenta'      , ftString  ,  10, False);
   QInformesConta.FieldDefs.Add('FDescSubcuenta'  , ftString  ,  80, False);
   QInformesConta.FieldDefs.Add('Subcuenta'       , ftString  ,  10, False);
   QInformesConta.FieldDefs.Add('DescSubcuenta'   , ftString  ,  80, False);
   QInformesConta.FieldDefs.Add('DescApunte'      , ftString  , 100, False);
   QInformesConta.FieldDefs.Add('Contrapartida'   , ftString  ,  10, False);
   QInformesConta.FieldDefs.Add('Debe'            , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Haber'           , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalSumaDebe'   , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalSumaHaber'  , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Importe'         , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('DebeHaber'       , ftString  ,   1, False);
   QInformesConta.FieldDefs.Add('Saldo'           , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalSumaSaldo'  , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Descripcion'     , ftString  ,  50, False);
   QInformesConta.FieldDefs.Add('Observaciones'   , ftString  , 255, False);
   QInformesConta.FieldDefs.Add('ID_Cliente'      , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('NombreCliente'   , ftString  ,  85, False);

   QInformesConta.FieldDefs.Add('NumLinea'        , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('Factura'         , ftString  ,  10, False);
   QInformesConta.FieldDefs.Add('NIF'             , ftString  ,  15, False);
   QInformesConta.FieldDefs.Add('BaseImponible'   , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseConIVA'      , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseSinIVA'      , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('IVA'             , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('CuotaIVA'        , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Recargo'         , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('CuotaRecargo'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalFactura'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalBruto'      , ftFloat   ,   0, False);

   QInformesConta.FieldDefs.Add('Provincia'       , ftString  ,  25, False);
   QInformesConta.FieldDefs.Add('ImporteVentas'   , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('ImporteCompras'  , ftFloat   ,   0, False);

   QInformesConta.FieldDefs.Add('FechaImpresion'  , ftDateTime,   0, False);

   QInformesConta.FieldDefs.Add('ID_Conceptos'    , ftString  ,   3, False);
   QInformesConta.FieldDefs.Add('DescConcepto'    , ftString  ,  30, False);

   QInformesConta.FieldDefs.Add('Ejercicio'       , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('DescPeriodo'     , ftString  ,  20, False);

   QInformesConta.FieldDefs.Add('Ingresos'        , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Gastos'          , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Retenciones'     , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Mes'             , ftInteger ,   0, False);
   QInformesConta.FieldDefs.Add('Trimestre'       , ftInteger ,   0, False);

   QInformesConta.FieldDefs.Add('TotalBruto16'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalBruto0'     , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseSinIVA16'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseSinIVA0'     , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseConIVA16'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('BaseConIVA0'     , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('CuotaIVA16'      , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('CuotaIVA0'       , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Retenciones16'   , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('Retenciones0'    , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalFactura16'  , ftFloat   ,   0, False);
   QInformesConta.FieldDefs.Add('TotalFactura0'   , ftFloat   ,   0, False);

   QInformesConta.FieldDefs.Add('Cuenta_Analitica', ftString  ,  10, False);


   QInformesConta.IndexDefs.Clear;
   QInformesConta.IndexDefs.Add('SUBCUENTA'  , 'SUBCUENTA', []);
   QInformesConta.IndexDefs.Add('DESCRIPCION', 'DESCSUBCUENTA', []);

   QInformesConta.CreateDataSet;
   QInformesConta.Active := True;
end;

procedure TDMContaRef.CrearFicheroGraficos;
begin
   QGraficos.Active := False;
   QGraficos.FieldDefs.Clear;
   QGraficos.FieldDefs.Add('DEBEACT' , ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('DEBEANT' , ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('HABERACT', ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('HABERANT', ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('SALDOACT', ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('SALDOANT', ftFloat  , 0, False);
   QGraficos.FieldDefs.Add('NUMMES'  , ftInteger, 0, False);
   QGraficos.FieldDefs.Add('MES'     , ftString , 10, False);
   QGraficos.CreateDataSet;
   QGraficos.Active := True;
end;

procedure TDMContaRef.DataModuleCreate(Sender: TObject);
var i :Word;
begin
   FormSplash := TFormSplash.Create(nil);
   try FormSplash.Show;
       FormSplash.Update;

       for i := 0 to (ComponentCount - 1) do begin
          if (Components[i] is TibTransaction) then begin
             TibTransaction(Components[i]).Active := False;
             TibTransaction(Components[i]).Params.Clear;
             TibTransaction(Components[i]).Params.Add('Read_committed');
             TibTransaction(Components[i]).Params.Add('Rec_version'   );
             TibTransaction(Components[i]).Params.Add('Write'         );
             TibTransaction(Components[i]).Active := True;
          end;
       end;
       AbrirDataSets;

       CrearFicheroInformesConta;
       CrearFicheroInformesBalances;
       CrearFicheroGraficos;

       FormSplash.Close;
   finally FormSplash.Free;
   end;
end;

procedure TDMContaRef.DataModuleDestroy(Sender: TObject);
begin
   CerrarDataSets;
end;

procedure TDMContaRef.QInformesContaBeforeInsert(DataSet: TDataSet);
begin
   Application.ProcessMessages;
   if gvProcesoAbortado then begin
      gvProcesoAbortado := False;
      DatabaseError('Proceso cancelado');
   end;
end;

procedure TDMContaRef.ObtenerFiltrosDiario(var nPrimerAsiento, nUltimoAsiento: Integer;
   var dPrimeraFecha, dUltimaFecha: TDatetime);
var Q :TIBSQL;
begin
   Q := TIBSql.Create(nil);
   Q.Database := DmRef.IBDSiamCont;
   try
      Q.SQL.Add('execute procedure dame_primer_asiento');
      Q.ExecQuery;
      nPrimerAsiento := Q.FieldByName('asiento').AsInteger;

      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('execute procedure dame_ultimo_asiento');
      Q.ExecQuery;
      nUltimoAsiento := Q.FieldByName('asiento').AsInteger;

      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('execute procedure dame_primera_fecha_asiento');
      Q.ExecQuery;
      dPrimeraFecha := Q.FieldByName('fecha').AsDateTime;

      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('execute procedure dame_ultima_fecha_asiento');
      Q.ExecQuery;
      dUltimaFecha := Q.FieldByName('fecha').AsDateTime;
   finally
      Q.Free;
   end;
end;

function TDMContaRef.ObtenerTipoSubcuenta(Subcuenta: String): String;
var Q :TIBQuery;
begin
   Q := TIBQuery.Create(nil);
   Q.Database := DMRef.IBDSiamCont;
   Q.SQL.Add('SELECT TIPOCUENTA FROM CUENTAS WHERE CUENTA = :CUENTA');
   Q.ParamByName('CUENTA').AsString := Copy(Subcuenta, 1, 3);
   try
      Q.Open;
      if not Q.EOF then begin
         Result := Q.FieldByName('TIPOCUENTA').AsString;
      end
      else begin
         Result := '';
      end;
   finally
      Q.Free;
   end;
end;

procedure TDMContaRef.QInfDiarioCalcFields(DataSet: TDataSet);
begin
   // Descripci�n del apunte
   QInfDiarioDescApunte.AsString := DMContaRef.GetDescripcionApunte(QInfDiarioDESCCONCEPTO.AsString,
                                                                    QInfDiarioNUMEROFACTURA.AsString,
                                                                    QInfDiarioSERIE.AsString,
                                                                    QInfDiarioEJERCICIO.AsInteger,
                                                                    QInfDiarioCOMENTARIO.AsString,
                                                                    QInfDiarioABREVIATURA.AsString);

   // Campos calculados empleados en el libro de mayor
   if QInfDiarioDEBEHABER.AsString = 'D' then begin
      QInfDiarioDebe.AsFloat := QInfDiarioIMPORTE.AsFloat;
   end
   else begin
      QInfDiarioHaber.AsFloat := QInfDiarioIMPORTE.AsFloat;
   end;
end;

function TDMContaRef.AsientoBloqueado(FechaAsiento: TDateTime): Boolean;
begin
   if DMRef.QParametros.FieldByName('FECHABLOQUEO').IsNull or (FechaAsiento = 0) then begin
      Result := False;
   end
   else begin
      Result := (FechaAsiento < DMRef.QParametros.FieldByName('FECHABLOQUEO').AsDateTime);
   end;
end;

function TDMContaRef.FechaAsientoPerteneceEjercicio(FechaAsiento: TDateTime): Boolean;
begin
   if DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').IsNull or
      DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').IsNull or (FechaAsiento = 0) then begin
      Result := True;
   end
   else begin
      Result := (FechaAsiento >= DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime) and
         (FechaAsiento <= DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime);
   end;
end;

function TDMContaRef.ObtenerUltimoAsientoSubcuenta(Subcuenta: String; FechaIni, FechaFin: TDateTime): Integer;
var Q :TIBQuery;
begin
   Q := TIBQuery.Create(nil);
   Q.Database := DMRef.IBDSiamCont;
   Q.SQL.Add('SELECT ASIENTO FROM DIARIO');
   Q.SQL.Add('WHERE FECHA >= :FECHAINI AND FECHA <= :FECHAFIN AND');
   Q.SQL.Add('      SUBCUENTA = :SUBCUENTA');
   Q.SQL.Add('ORDER BY ASIENTO DESC');
   Q.ParamByName('FECHAINI').AsDateTime := FechaIni;
   Q.ParamByName('FECHAFIN').AsDateTime := FechaFin;
   Q.ParamByName('SUBCUENTA').AsString  := Subcuenta;
   try
      Q.Open;
      if not Q.EOF then begin
         Result := Q.FieldByName('ASIENTO').AsInteger;
      end
      else begin
         Result := 0;
      end;
   finally
      Q.Free;
   end;
end;

procedure TDMContaRef.CrearTablaCorreo;
begin
   HCorreo.Active       := False;
   HCorreo.DatabaseName := 'c:\'; //ExtractFileDir(Application.ExeName);
   HCorreo.TableName    := 'Correo' + '.dbf';

   HCorreo.FieldDefs.Clear;
   HCorreo.FieldDefs.Add('Subcuenta' , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Nombre'    , ftstring, 100, False);
   HCorreo.FieldDefs.Add('Direccion' , ftstring,  85, False);
   HCorreo.FieldDefs.Add('Poblacion' , ftstring,  60, False);
   HCorreo.FieldDefs.Add('CodPostal' , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Provincia' , ftstring,  25, False);
   HCorreo.FieldDefs.Add('Pesetas'   , ftstring, 150, False);
   HCorreo.FieldDefs.Add('Banco'     , ftstring, 100, False);
   HCorreo.FieldDefs.Add('Cheque'    , ftstring,  15, False);
   HCorreo.FieldDefs.Add('TotImporte', ftstring,  14, False);
   HCorreo.FieldDefs.Add('Fecha1'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha2'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha3'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha4'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha5'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha6'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha7'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha8'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha9'    , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Fecha10'   , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Importe1'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe2'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe3'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe4'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe5'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe6'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe7'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe8'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe9'  , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Importe10' , ftstring,  14, False);
   HCorreo.FieldDefs.Add('Texto1'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto2'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto3'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto4'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto5'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto6'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto7'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto8'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto9'    , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Texto10'   , ftstring,  40, False);
   HCorreo.FieldDefs.Add('Ejercicio' , ftstring,   4, False);
   HCorreo.FieldDefs.Add('Empresa'   , ftstring,  50, False);
   HCorreo.FieldDefs.Add('FVencim'   , ftstring,  10, False);
   HCorreo.FieldDefs.Add('Factura1'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura2'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura3'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura4'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura5'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura6'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura7'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura8'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura9'  , ftString,  10, False);
   HCorreo.FieldDefs.Add('Factura10' , ftString,  10, False);
   HCorreo.CreateTable;
end;

procedure TDMContaRef.InicializarFicherosInformes;
begin
   QInformesConta.EmptyDataSet;
   QInfBalExplo.EmptyDataSet;
   QInfBalAcum.EmptyDataSet;
end;

end.
