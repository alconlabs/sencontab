unit DM;
interface
uses Classes, Controls, Db, Dialogs, Forms, Graphics,IBQuery, Messages, SysUtils, Variants, Windows,
     Globales, DBXpress, SqlExpr, CRSQLConnection, IBCustomDataSet, IBTableSet, IBSQL,
     FMTBcd, DBClient, SimpleDS;
type
  TDMRef = class(TDataModule)
    QAuxiliar:      TIBSQL;
    QPaisNom:       TIBTableSet;
    QPaisNomPAIS:   TIBStringField;
    QPaisNomNOMBRE: TIBStringField;
    QAnaliticasNom: TIBTableSet;
    IBStringField41: TIBStringField;
    IBStringField42: TIBStringField;
    IBStringField43: TIBStringField;
    IBStringField44: TIBStringField;
    IBStringField45: TIBStringField;
    IBStringField46: TIBStringField;
    QDelegacionNom: TIBTableSet;
    QDelegacionNomNOMBRE: TIBStringField;
    QDelegacionNomID_DELEGACION: TIBStringField;
    QDepartamentoNom: TIBTableSet;
    QDepartamentoNomNOMBRE: TIBStringField;
    QDepartamentoNomID_DEPARTAMENTO: TIBStringField;
    QProyectoNom:   TIBTableSet;
    QProyectoNomNOMBRE: TIBStringField;
    QProyectoNomID_PROYECTO: TIBStringField;
    QSeccionNom:    TIBTableSet;
    QSeccionNomNOMBRE: TIBStringField;
    QSeccionNomID_SECCION: TIBStringField;
    QDelegacion:    TIBTableSet;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    QDepartamento:  TIBTableSet;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    QProyecto:      TIBTableSet;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    QSeccion:       TIBTableSet;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    QComercial:     TIBTableSet;
    QComercialNOMBRE: TIBStringField;
    QComercialCOMERCIAL: TIBStringField;
    QcomercialNom:  TIBTableSet;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    QFormaPago:     TIBTableSet;
    QFormaPagoFORMAPAGO: TIBStringField;
    QFormaPagoCLASE: TIBStringField;
    QFormaPagoDESCRIBE: TIBStringField;
    QFormaPagoINTERVALO: TSmallintField;
    QFormaPagoNUMVENCI: TSmallintField;
    QFormaPagoOBSOLETO: TIBStringField;
    QFormaPagoNom:  TIBTableSet;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IBStringField14: TIBStringField;
    QTipoDiario:    TIBTableSet;
    QTipoDiarioDESCRIPCION: TIBStringField;
    QTipoDiarioTIPODIARIO: TIBStringField;
    QTipodiarioNom: TIBTableSet;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    DB: TCRSQLConnection;
    BDEjAnterior: TCRSQLConnection;
    IBDConsolida: TCRSQLConnection;
    QAnaliticas: TSQLQuery;
    QAnaliticasCUENTA: TStringField;
    QAnaliticasNOMBRE: TStringField;
    QAnaliticasID_PROYECTO: TStringField;
    QAnaliticasID_SECCION: TStringField;
    QAnaliticasID_DEPARTAMENTO: TStringField;
    QAnaliticasID_DELEGACION: TStringField;
    QParametros: TSimpleDataSet;
    QParametrosID_PARAMETROS: TIntegerField;
    QParametrosLONGITUD_SUBCUENTAS: TIntegerField;
    QParametrosFECHA_INICIO_APLICACION: TSQLTimeStampField;
    QParametrosFECHA_INICIO_EJERCICIO: TSQLTimeStampField;
    QParametrosFECHA_FIN_EJERCICIO: TSQLTimeStampField;
    QParametrosCTO_REGULARIZACION: TStringField;
    QParametrosSUBCUENTA_CIERRE: TStringField;
    QParametrosMONEDA: TStringField;
    QParametrosNOMBREFISCAL: TStringField;
    QParametrosDIRECCION: TStringField;
    QParametrosDIRECCION1: TStringField;
    QParametrosPOBLACION: TStringField;
    QParametrosCODPOSTAL: TStringField;
    QParametrosPROVINCIA: TStringField;
    QParametrosNIF: TStringField;
    QParametrosCONTACTO: TStringField;
    QParametrosDOCCLIENTE: TStringField;
    QParametrosDOCPROVEEDOR: TStringField;
    QParametrosDOC347: TStringField;
    QParametrosFECHABLOQUEO: TSQLTimeStampField;
    QParametrosCTO_APERTURA: TStringField;
    QParametrosCTO_REGULARIZACION_ESP: TStringField;
    QParametrosFECHAAMORTIZACION: TSQLTimeStampField;
    QParametrosRECARGO: TStringField;
    QParametrosCTO_APERTURA_ESP: TStringField;
    QParametrosSCTAIVANORMAL: TStringField;
    QParametrosSCTAIVANORMAL_DS: TStringField;
    QParametrosSCTAIVAREDUCIDO: TStringField;
    QParametrosSCTAIVAREDUCIDO_DS: TStringField;
    QParametrosSCTAIVASUPER: TStringField;
    QParametrosSCTAIVASUPER_DS: TStringField;
    QParametrosSCTAIVAEXENTO: TStringField;
    QParametrosSCTAIVAEXENTO_DS: TStringField;
    QParametrosSCTAIVAINTRADEDUCIBLE: TStringField;
    QParametrosSCTAIVAINTRADEDUCIBLE_DS: TStringField;
    QParametrosSCTAIVAINTRA: TStringField;
    QParametrosSCTAIVAINTRA_DS: TStringField;
    QParametrosSCTAVENTAS: TStringField;
    QParametrosSCTAVENTAS_DS: TStringField;
    QParametrosSCTADEVOLUCION: TStringField;
    QParametrosSCTADEVOLUCION_DS: TStringField;
    QParametrosSCTARECNORMAL: TStringField;
    QParametrosSCTARECNORMAL_DS: TStringField;
    QParametrosSCTARECREDUCIDO: TStringField;
    QParametrosSCTARECREDUCIDO_DS: TStringField;
    QParametrosSCTARECSUPER: TStringField;
    QParametrosSCTARECSUPER_DS: TStringField;
    QParametrosVGENERICA: TStringField;
    QParametrosVGENERICA_DS: TStringField;
    QParametrosSUBCAJA: TStringField;
    QParametrosSUBCAJA_DS: TStringField;
    QParametrosSCTAIVAEXENTOCEE: TStringField;
    QParametrosSCTAIVAEXENTOCEE_DS: TStringField;
    QParametrosSCTAINTERESES: TStringField;
    QParametrosSCTAINTERESES_DS: TStringField;
    QParametrosSCTAEXPORTACIONES: TStringField;
    QParametrosSCTAEXPORTACIONES_DS: TStringField;
    QParametrosSCTAIVACNORMAL: TStringField;
    QParametrosSCTAIVACNORMAL_DS: TStringField;
    QParametrosSCTAIVACREDUCIDO: TStringField;
    QParametrosSCTAIVACREDUCIDO_DS: TStringField;
    QParametrosSCTAIVACSUPER: TStringField;
    QParametrosSCTAIVACSUPER_DS: TStringField;
    QParametrosSCTAIVACEXENTO: TStringField;
    QParametrosSCTAIVACEXENTO_DS: TStringField;
    QParametrosSCTACOMPRAS: TStringField;
    QParametrosSCTACOMPRAS_DS: TStringField;
    QParametrosSCTAIVACINTRADEDUCIBLE: TStringField;
    QParametrosSCTAIVACINTRADEDUCIBLE_DS: TStringField;
    QParametrosSCTAIVACINTRAREPERCUTIDO: TStringField;
    QParametrosSCTAIVACINTRAREPERCUTIDO_DS: TStringField;
    QParametrosVGENERICAC: TStringField;
    QParametrosVGENERICAC_DS: TStringField;
    QParametrosSCTAEFECTOSCOMERCIALES: TStringField;
    QParametrosSCTAEFECTOSCOMERCIALES_DS: TStringField;
    QParametrosSCTAEFECTDESCONTADOS: TStringField;
    QParametrosSCTAEFECTDESCONTADOS_DS: TStringField;
    QParametrosSCTADEUDASDESCUENTOS: TStringField;
    QParametrosSCTADEUDASDESCUENTOS_DS: TStringField;
    QParametrosSCTAREMESAEFECTOS: TStringField;
    QParametrosSCTAREMESAEFECTOS_DS: TStringField;
    QParametrosSCTADTOPPV: TStringField;
    QParametrosSCTADTOPPV_DS: TStringField;
    QParametrosSCTADTOPPC: TStringField;
    QParametrosSCTADTOPPC_DS: TStringField;
    QParametrosSCTARETPROF: TStringField;
    QParametrosSCTARETPROF_DS: TStringField;
    QParametrosSCTARETARRE: TStringField;
    QParametrosSCTARETARRE_DS: TStringField;
    QParametrosSCTAHACIVA: TStringField;
    QParametrosSCTAHACIVA_DS: TStringField;
    QParametrosSCTAGENINTRACOM: TStringField;
    QParametrosSCTAGENINTRACOM_DS: TStringField;
    QParametrosSCTABANCO: TStringField;
    QParametrosSCTABANCO_DS: TStringField;
    QParametrosCTOIVANORMAL: TStringField;
    QParametrosCTOIVANORMAL_DS: TStringField;
    QParametrosCTOIVAREDUCIDO: TStringField;
    QParametrosCTOIVAREDUCIDO_DS: TStringField;
    QParametrosCTOIVASUPER: TStringField;
    QParametrosCTOIVASUPER_DS: TStringField;
    QParametrosCTOIVAEXENTO: TStringField;
    QParametrosCTOIVAEXENTO_DS: TStringField;
    QParametrosCTOIVAINTRA: TStringField;
    QParametrosCTOIVAINTRA_DS: TStringField;
    QParametrosCTOVENTAS: TStringField;
    QParametrosCTOVENTAS_DS: TStringField;
    QParametrosCTODEVOLUCION: TStringField;
    QParametrosCTODEVOLUCION_DS: TStringField;
    QParametrosCTOCLIENTES: TStringField;
    QParametrosCTOCLIENTES_DS: TStringField;
    QParametrosCTORECNORMAL: TStringField;
    QParametrosCTORECNORMAL_DS: TStringField;
    QParametrosCTORECREDUCIDO: TStringField;
    QParametrosCTORECREDUCIDO_DS: TStringField;
    QParametrosCTORECSUPER: TStringField;
    QParametrosCTORECSUPER_DS: TStringField;
    QParametrosCTOCOBROF: TStringField;
    QParametrosCTOCOBROF_DS: TStringField;
    QParametrosCTORECIBOVENTAS: TStringField;
    QParametrosCTORECIBOVENTAS_DS: TStringField;
    QParametrosCTOIVACNORMAL: TStringField;
    QParametrosCTOIVACNORMAL_DS: TStringField;
    QParametrosCTOIVACREDUCIDO: TStringField;
    QParametrosCTOIVACREDUCIDO_DS: TStringField;
    QParametrosCTOIVACSUPER: TStringField;
    QParametrosCTOIVACSUPER_DS: TStringField;
    QParametrosCTOIVACEXENTO: TStringField;
    QParametrosCTOIVACEXENTO_DS: TStringField;
    QParametrosCTOCOMPRAS: TStringField;
    QParametrosCTOCOMPRAS_DS: TStringField;
    QParametrosCTOPROVEEDORES: TStringField;
    QParametrosCTOPROVEEDORES_DS: TStringField;
    QParametrosCTOPROVINTRA: TStringField;
    QParametrosCTOPROVINTRA_DS: TStringField;
    QParametrosCTOPAGOF: TStringField;
    QParametrosCTOPAGOF_DS: TStringField;
    QParametrosCTOEFECTOSCOMERCIALES: TStringField;
    QParametrosCTOEFECTOSCOMERCIALES_DS: TStringField;
    QParametrosCTODEUDASDESCUENTOS: TStringField;
    QParametrosCTODEUDASDESCUENTOS_DS: TStringField;
    QParametrosCTOREMESAEFECTOS: TStringField;
    QParametrosCTOREMESAEFECTOS_DS: TStringField;
    QParametrosCTODTOPPV: TStringField;
    QParametrosCTODTOPPV_DS: TStringField;
    QParametrosCTODTOPPC: TStringField;
    QParametrosCTODTOPPC_DS: TStringField;
    QParametrosCTORETPROF: TStringField;
    QParametrosCTORETPROF_DS: TStringField;
    QParametrosCTORETARRE: TStringField;
    QParametrosCTORETARRE_DS: TStringField;
    QParametrosCTOHACIVA: TStringField;
    QParametrosCTOHACIVA_DS: TStringField;
    QParametrosCTOCOBRO: TStringField;
    QParametrosCTOCOBRO_DS: TStringField;
    QParametrosCTOPAGO: TStringField;
    QParametrosCTOPAGO_DS: TStringField;
    QParametrosSCTADESCUENTO: TStringField;
    QParametrosCTODESCUENTO: TStringField;
    QParametrosCTONOME: TStringField;
    QParametrosCTONOMT: TStringField;
    QParametrosSCTANOMSUELDO: TStringField;
    QParametrosSCTANOMIRPF: TStringField;
    QParametrosSCTANOMPAGO: TStringField;
    QParametrosSCTANOMSSE: TStringField;
    QParametrosSCTANOMSST: TStringField;
    QParametrosSCTANOMCARGO: TStringField;
    QParametrosTANTORETPROF: TBCDField;
    QParametrosTANTORETARRE: TBCDField;
    QParametrosTELEFONO: TStringField;
    QParametrosFAX: TStringField;
    QParametrosDOCIMPRIMIR: TStringField;
    QParametrosSIGLAVIA: TStringField;
    QParametrosNUMEROCALLE: TStringField;
    QParametrosESCALERA: TStringField;
    QParametrosPISO: TStringField;
    QParametrosPUERTA: TStringField;
    QParametrosCCC: TStringField;
    QParametrosCODADMON: TStringField;
    QParametrosGESTIONA_CARTERA_EFECTOS: TStringField;
    QParametrosFILTRO_ASIENTOS_INICIO: TStringField;
    QParametrosINCLUIR_ABREV: TStringField;
    QParametrosASIENTOS_INICIO_INTERVALO_BQDA: TIntegerField;
    QParametrosASIENTOS_FIN_INTERVALO_BQDA: TIntegerField;
    QParametrosMOSTRAR_FILTRO_MAYOR: TStringField;
    QParametrosASIENTO_INICIO_INTERVALO_FILTRO: TIntegerField;
    QParametrosASIENTO_FIN_INTERVALO_FILTRO: TIntegerField;
    QParametrosASIENTO_NOMINA_INDIVIDUAL: TStringField;
    QParametrosBUSQUEDA_SUBCTAS: TStringField;
    QParametrosSCTAOTRASREMUN: TStringField;
    QParametrosDESCPROV_CARTERAEFECTOS: TStringField;
    QParametrosDESCCLI_CARTERAEFECTOS: TStringField;
    QParametrosTIPOEMPRESA: TStringField;
    QParametrosFILTROSUBCTAS: TStringField;
    QParametrosOFFICE2003: TStringField;
    QParametrosTRATASERIE: TStringField;
    QParametrosACTCOMENTARIO: TStringField;
    QProvinciasNom: TSimpleDataSet;
    QProvinciasNomPROVINCIA: TStringField;
    QProvinciasNomNOMBRE: TStringField;
    QProvinciasNomCODIGO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  protected
    procedure Loaded; override;
  private
  public
    procedure AbrirDataSets;
    procedure CerrarDataSets;
    procedure ConectarBDEmpresa(prmCD_EMPRESA :string);
    procedure ConectarBDEmpresaAnterior(prmCD_EMPRESA :Integer);
    //procedure EjecutarSQL(Sentencia: String);
    function  ExistenRegistros(Tabla, Condicion: String): Boolean;
    function  ObtenerValor(Campo, Tabla, Condicion: String; Orden: String = ''): Variant;
    function  CreateQuery          (const prmSQL :array of string):TSQLQuery;
    function  CreateQueryConsolida (const prmSQL :array of string):TSQLQuery;
    function  CreateQueryEjAnterior(const prmSQL :array of string):TSQLQuery;
  end;

var DMRef: TDMRef;

implementation
uses General;
{$R *.DFM}

function TDMRef.CreateQuery(const prmSQL :array of string):TSQLQuery;
var Query :TSQLQuery;
    i     :Integer;
begin
   Query := TSQLQuery.Create(nil);
   Query.SQLConnection := DB;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryConsolida(const prmSQL :array of string):TSQLQuery;
var Query :TSQLQuery;
    i     :Integer;
begin
   Query := TSQLQuery.Create(nil);
   //TODO: Query.SQLConnection := IBDConsolida;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryEjAnterior(const prmSQL :array of string):TSQLQuery;
var Query :TSQLQuery;
    i     :Integer;
begin
   Query := TSQLQuery.Create(nil);
   //TODO: Query.SQLConnection := BDEjAnterior;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;


procedure TDMRef.AbrirDataSets;
begin
   //QueryOpen(QParametros, '');//'SELECT * FROM PARAMETROS ORDER BY ID_PARAMETROS DESC');

   {$Message Warn 'No debe ser necesario mantener todos los Datasets Abiertos desde el primer Momento'}
   (*QueryOpen(QPaisNom, 'SELECT * FROM PAISES ORDER BY NOMBRE');

   QueryOpen(QProvinciasNom  , 'SELECT * FROM PROVINCIAS   ORDER BY NOMBRE         ');
   QueryOpen(QSeccionNom     , 'SELECT * FROM SECCION      ORDER BY ID_SECCION     ');
   QueryOpen(QSeccionNom     , 'SELECT * FROM SECCION      ORDER BY NOMBRE         ');
   QueryOpen(QProyecto       , 'SELECT * FROM PROYECTO     ORDER BY ID_PROYECTO    ');
   QueryOpen(QProyectoNom    , 'SELECT * FROM PROYECTO     ORDER BY NOMBRE         ');
   QueryOpen(QDepartamento   , 'SELECT * FROM DEPARTAMENTO ORDER BY ID_DEPARTAMENTO');
   QueryOpen(QDepartamentoNom, 'SELECT * FROM DEPARTAMENTO ORDER BY NOMBRE         ');
   QueryOpen(QDelegacion     , 'SELECT * FROM DELEGACION   ORDER BY ID_DELEGACION  ');
   QueryOpen(QDelegacionNom  , 'SELECT * FROM DELEGACION   ORDER BY NOMBRE         ');
   QueryOpen(QAnaliticas     , 'SELECT * FROM ANALITICAS   ORDER BY CUENTA         ');
   QueryOpen(QAnaliticasNom  , 'SELECT * FROM ANALITICAS   ORDER BY NOMBRE         ');
   QueryOpen(QComercial      , 'SELECT * FROM COMERCIALES  ORDER BY COMERCIAL      ');
   QueryOpen(QComercialNom   , 'SELECT * FROM COMERCIALES  ORDER BY NOMBRE         ');
   QueryOpen(QFormaPago      , 'SELECT * FROM FORMAS WHERE OBSOLETO <> "S" ORDER BY FORMAPAGO');
   QueryOpen(QFormaPagoNom   , 'SELECT * FROM FORMAS WHERE OBSOLETO <> "S" ORDER BY DESCRIBE');
   QueryOpen(QTipodiario     , 'SELECT * FROM TIPODIARIO   ORDER BY TIPODIARIO     ');
   QueryOpen(QTipodiarioNom  , 'SELECT * FROM TIPODIARIO   ORDER BY DESCRIPCION    ');*)

   //gvNombreEmpresa := DmRef.QParametros.FieldByName('NombreFiscal').AsString;
end;

procedure TDMRef.CerrarDataSets;
var i: Integer;
begin
   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDataSet then begin
         try
            TDataSet(Components[i]).Close;
         except
            ShowMessage('Error datamodulo al cerrar la tabla ' + TDataSet(Components[i]).Name);
         end;
      end;
   end;
end;

procedure TDMRef.ConectarBDEmpresa(prmCD_EMPRESA :string);
var Q :TIBQuery;
begin
   {$Message Warn 'Requiere acaptación a SQL Server'}
   //Para una determinada empresa, toma los datos de conexión, que se encontraban el la base de datos de Control.

(*
   Q := TIBQuery.Create(nil);
   try Q.Database := DMControlRef.BDControl;
       Q.SQL.Add('SELECT SERVIDOR, UBICACION               ');
       Q.SQL.Add('FROM   EMPRESAS                          ');
       Q.SQL.Add('WHERE  UPPER(NOMBRE) = UPPER(:prmNOMBRE) ');
       Q.ParamByName('prmNOMBRE').AsString := prmCD_EMPRESA;
       Q.Open;
       if not Q.EOF then begin
          try IBDConsolida.Close;
              if Empty(Q.FieldByName('SERVIDOR').AsString) then begin
                 IBDConsolida.DatabaseName := Q.FieldByName('UBICACION').AsString;
              end
              else begin
                IBDConsolida.DatabaseName := Trim(Q.FieldByName('SERVIDOR').AsString) + ':' + Trim(Q.FieldByName('UBICACION').AsString);
              end;
              IBDConsolida.Connected := True;
              IBTConsolida.Active    := True;
          except Q.Close;
                 Q.Free;
                 DatabaseError('Error al conectar base de datos ' + prmCD_EMPRESA);
          end;
       end
       else DatabaseError('Error al conectar base de datos ' + prmCD_EMPRESA);
   finally Q.Close;
           Q.Free;
   end;
   *)
end;

procedure TDMRef.ConectarBDEmpresaAnterior(prmCD_EMPRESA :Integer);
var NomEmpresa: string;
begin
   {$Message Warn 'Requiere adaptación a SQL Server`'}
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}

   {Para un nombre de base de datos conecta con el servidor de Control y conecta un componente de base de datos.}
(*
   with TIBQuery.Create(nil), SQL do begin
      Close;
      Database := DmControlRef.BDControl;
      Clear;
      Add('SELECT * FROM EMPRESAS WHERE id_Empresa=:Empresa');
      ParamByName('Empresa').AsInteger := prmCD_EMPRESA;
      Open;
      if not EOF then begin
         try
            NomEmpresa := FieldByName('Nombre').AsString;
            BDEjAnterior.Connected := False;
            if Empty(FieldByName('SERVIDOR').AsString) then begin
               BDEjAnterior.DatabaseName := FieldByName('UBICACION').AsString;
            end
            else begin
               BDEjAnterior.DatabaseName := Trim(FieldByName('SERVIDOR').AsString) + ':' +
                  Trim(FieldByName('UBICACION').AsString);
            end;
            BDEjAnterior.Connected   := True;
            TransBdEjAnterior.Active := True;
         except Close;
                Free;
                DatabaseError('Error al conectar base de datos ' + NomEmpresa);
         end;
      end
      else begin
         Close;
         Free;
         DatabaseError('Error al conectar base de datos ' + NomEmpresa);
      end;
      Close;
      Free;
   end;
*)
end;

//procedure TDMRef.EjecutarSQL(Sentencia: String);
//var Q :TIBSQL;
//begin
//   Q := TIBSQL.Create(nil);
//   Q.DataBase := IBDSiamCont;
//   Q.SQL.Add(Sentencia);
//   try     Q.ExecQuery;
//           Q.Transaction.CommitRetaining;
//   finally Q.Free;
//   end;
//end;

function TDMRef.ExistenRegistros(Tabla, Condicion: String): Boolean;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAuxiliar do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) NUM FROM ' + Tabla);
      if Trim(Condicion) <> '' then begin
         SQL.Add('WHERE ' + Condicion);
      end;
      Prepare;
      ExecQuery;
      Result := (QAuxiliar.FieldByName('NUM').AsInteger <> 0);
   end;
end;

procedure TDMRef.Loaded;
var Directorio :string;
begin
   inherited;
   //IBDConsolida.Connected := False;
   //IBDSiamCont.Connected  := False;
   Directorio          := ExtractFilePath(Application.ExeName);
   gvDirImagenes       := Directorio + gcDirImagenes;
   gvDirInformes       := Directorio + gcDirInformes;
   //IBT1.Active         := False;
   //IBTConsolida.Active := False;

   //IBDSiamCont.Params.Clear;
   //IBDSiamCont.Params.Add('user_name=SYSDBA');
   //IBDSiamCont.Params.Add('password=masterkey');
   //if Empty(gvServidor) then begin
   //   IBDSiamCont.DatabaseName := gvUbicacionEmpresa;
   //end
   //else begin
   //   IBDSiamCont.DatabaseName := Trim(gvServidor) + ':' + Trim(gvUbicacionEmpresa);
   //end;
   //IBDSiamCont.Connected := True;
   //IBT1.Active           := True;
   //
   //IBDConsolida.Params.Clear;
   //IBDConsolida.Params.Add('user_name=SYSDBA');
   //IBDConsolida.Params.Add('password=masterkey');
end;

function TDMRef.ObtenerValor(Campo, Tabla, Condicion: String; Orden: String): Variant;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAuxiliar do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + Campo + ' VALOR FROM ' + Tabla);
      if Trim(Condicion) <> '' then begin
         SQL.Add('WHERE ' + Condicion);
      end;
      if Trim(Orden) <> '' then begin
         SQL.Add('ORDER BY ' + Orden);
      end;
      Prepare;
      ExecQuery;
      if RecordCount <> 0 then begin
         Result := QAuxiliar.FieldByName('VALOR').AsVariant;
      end
      else begin
         Result := Null;
      end;
   end;
end;

procedure TDMRef.DataModuleCreate(Sender: TObject);
var i :Integer;
begin
   AbrirDataSets;

   DMRef.QParametros.Close;
   DMRef.QParametros.Open;
   //DMRef.QParametros.Regenerar := True;
   //FIbQueryRefresh(DMRef.QParametros);

   gvlongitudsubcuenta  := QParametros.FieldByName('Longitud_subcuentas').AsInteger;
   gvTratamientoRecargo := (QParametros.FieldByName('Recargo').AsString = 'S');
end;

procedure TDMRef.DataModuleDestroy(Sender: TObject);
begin
   CerrarDataSets;
end;

end.



