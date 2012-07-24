unit DM;
interface
uses Classes, Controls, Db, Dialogs, Forms, Graphics,IBQuery, Messages, SysUtils, Variants, Windows,
     Globales, IBCustomDataSet, IBDatabase, IBSQL, IBTableSet, DBClient;
type
  TDMRef = class(TDataModule)
    IBDSiamCont:    TIBDatabase;
    IBT1:           TIBTransaction;
    QAuxiliar:      TIBSQL;
    QProvinciasNom: TIBTableSet;
    QPaisNom:       TIBTableSet;
    QParametros: TIBDataSet;
    QProvinciasNomPROVINCIA: TIBStringField;
    QProvinciasNomNOMBRE: TIBStringField;
    QProvinciasNomCODIGO: TIBStringField;
    QPaisNomPAIS:   TIBStringField;
    QPaisNomNOMBRE: TIBStringField;
    QAnaliticas:    TIBTableSet;
    QAnaliticasID_PROYECTO: TIBStringField;
    QAnaliticasID_SECCION: TIBStringField;
    QAnaliticasID_DEPARTAMENTO: TIBStringField;
    QAnaliticasID_DELEGACION: TIBStringField;
    QAnaliticasNOMBRE: TIBStringField;
    QAnaliticasCUENTA: TIBStringField;
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
    IBDConsolida:   TIBDatabase;
    IBTConsolida:   TIBTransaction;
    TransBdEjanterior: TIBTransaction;
    BDEjAnterior:   TIBDatabase;
    QParametrosID_PARAMETROS: TSmallintField;
    QParametrosLONGITUD_SUBCUENTAS: TSmallintField;
    QParametrosFECHA_INICIO_APLICACION: TDateTimeField;
    QParametrosFECHA_INICIO_EJERCICIO: TDateTimeField;
    QParametrosFECHA_FIN_EJERCICIO: TDateTimeField;
    QParametrosCTO_REGULARIZACION: TIBStringField;
    QParametrosSUBCUENTA_CIERRE: TIBStringField;
    QParametrosMONEDA: TIBStringField;
    QParametrosNOMBREFISCAL: TIBStringField;
    QParametrosDIRECCION: TIBStringField;
    QParametrosDIRECCION1: TIBStringField;
    QParametrosPOBLACION: TIBStringField;
    QParametrosCODPOSTAL: TIBStringField;
    QParametrosPROVINCIA: TIBStringField;
    QParametrosNIF: TIBStringField;
    QParametrosCONTACTO: TIBStringField;
    QParametrosDOCCLIENTE: TIBStringField;
    QParametrosDOCPROVEEDOR: TIBStringField;
    QParametrosDOC347: TIBStringField;
    QParametrosFECHABLOQUEO: TDateTimeField;
    QParametrosCTO_APERTURA: TIBStringField;
    QParametrosCTO_REGULARIZACION_ESP: TIBStringField;
    QParametrosFECHAAMORTIZACION: TDateTimeField;
    QParametrosRECARGO: TIBStringField;
    QParametrosCTO_APERTURA_ESP: TIBStringField;
    QParametrosSCTAIVANORMAL: TIBStringField;
    QParametrosSCTAIVANORMAL_DS: TIBStringField;
    QParametrosSCTAIVAREDUCIDO: TIBStringField;
    QParametrosSCTAIVAREDUCIDO_DS: TIBStringField;
    QParametrosSCTAIVASUPER: TIBStringField;
    QParametrosSCTAIVASUPER_DS: TIBStringField;
    QParametrosSCTAIVAEXENTO: TIBStringField;
    QParametrosSCTAIVAEXENTO_DS: TIBStringField;
    QParametrosSCTAIVAINTRADEDUCIBLE: TIBStringField;
    QParametrosSCTAIVAINTRADEDUCIBLE_DS: TIBStringField;
    QParametrosSCTAIVAINTRA: TIBStringField;
    QParametrosSCTAIVAINTRA_DS: TIBStringField;
    QParametrosSCTAVENTAS: TIBStringField;
    QParametrosSCTAVENTAS_DS: TIBStringField;
    QParametrosSCTADEVOLUCION: TIBStringField;
    QParametrosSCTADEVOLUCION_DS: TIBStringField;
    QParametrosSCTARECNORMAL: TIBStringField;
    QParametrosSCTARECNORMAL_DS: TIBStringField;
    QParametrosSCTARECREDUCIDO: TIBStringField;
    QParametrosSCTARECREDUCIDO_DS: TIBStringField;
    QParametrosSCTARECSUPER: TIBStringField;
    QParametrosSCTARECSUPER_DS: TIBStringField;
    QParametrosVGENERICA: TIBStringField;
    QParametrosVGENERICA_DS: TIBStringField;
    QParametrosSUBCAJA: TIBStringField;
    QParametrosSUBCAJA_DS: TIBStringField;
    QParametrosSCTAIVAEXENTOCEE: TIBStringField;
    QParametrosSCTAIVAEXENTOCEE_DS: TIBStringField;
    QParametrosSCTAINTERESES: TIBStringField;
    QParametrosSCTAINTERESES_DS: TIBStringField;
    QParametrosSCTAEXPORTACIONES: TIBStringField;
    QParametrosSCTAEXPORTACIONES_DS: TIBStringField;
    QParametrosSCTAIVACNORMAL: TIBStringField;
    QParametrosSCTAIVACNORMAL_DS: TIBStringField;
    QParametrosSCTAIVACREDUCIDO: TIBStringField;
    QParametrosSCTAIVACREDUCIDO_DS: TIBStringField;
    QParametrosSCTAIVACSUPER: TIBStringField;
    QParametrosSCTAIVACSUPER_DS: TIBStringField;
    QParametrosSCTAIVACEXENTO: TIBStringField;
    QParametrosSCTAIVACEXENTO_DS: TIBStringField;
    QParametrosSCTACOMPRAS: TIBStringField;
    QParametrosSCTACOMPRAS_DS: TIBStringField;
    QParametrosSCTAIVACINTRADEDUCIBLE: TIBStringField;
    QParametrosSCTAIVACINTRADEDUCIBLE_DS: TIBStringField;
    QParametrosSCTAIVACINTRAREPERCUTIDO: TIBStringField;
    QParametrosSCTAIVACINTRAREPERCUTIDO_DS: TIBStringField;
    QParametrosVGENERICAC: TIBStringField;
    QParametrosVGENERICAC_DS: TIBStringField;
    QParametrosSCTAEFECTOSCOMERCIALES: TIBStringField;
    QParametrosSCTAEFECTOSCOMERCIALES_DS: TIBStringField;
    QParametrosSCTAEFECTDESCONTADOS: TIBStringField;
    QParametrosSCTAEFECTDESCONTADOS_DS: TIBStringField;
    QParametrosSCTADEUDASDESCUENTOS: TIBStringField;
    QParametrosSCTADEUDASDESCUENTOS_DS: TIBStringField;
    QParametrosSCTAREMESAEFECTOS: TIBStringField;
    QParametrosSCTAREMESAEFECTOS_DS: TIBStringField;
    QParametrosSCTADTOPPV: TIBStringField;
    QParametrosSCTADTOPPV_DS: TIBStringField;
    QParametrosSCTADTOPPC: TIBStringField;
    QParametrosSCTADTOPPC_DS: TIBStringField;
    QParametrosSCTARETPROF: TIBStringField;
    QParametrosSCTARETPROF_DS: TIBStringField;
    QParametrosSCTARETARRE: TIBStringField;
    QParametrosSCTARETARRE_DS: TIBStringField;
    QParametrosSCTAHACIVA: TIBStringField;
    QParametrosSCTAHACIVA_DS: TIBStringField;
    QParametrosSCTAGENINTRACOM: TIBStringField;
    QParametrosSCTAGENINTRACOM_DS: TIBStringField;
    QParametrosSCTABANCO: TIBStringField;
    QParametrosSCTABANCO_DS: TIBStringField;
    QParametrosCTOIVANORMAL: TIBStringField;
    QParametrosCTOIVANORMAL_DS: TIBStringField;
    QParametrosCTOIVAREDUCIDO: TIBStringField;
    QParametrosCTOIVAREDUCIDO_DS: TIBStringField;
    QParametrosCTOIVASUPER: TIBStringField;
    QParametrosCTOIVASUPER_DS: TIBStringField;
    QParametrosCTOIVAEXENTO: TIBStringField;
    QParametrosCTOIVAEXENTO_DS: TIBStringField;
    QParametrosCTOIVAINTRA: TIBStringField;
    QParametrosCTOIVAINTRA_DS: TIBStringField;
    QParametrosCTOVENTAS: TIBStringField;
    QParametrosCTOVENTAS_DS: TIBStringField;
    QParametrosCTODEVOLUCION: TIBStringField;
    QParametrosCTODEVOLUCION_DS: TIBStringField;
    QParametrosCTOCLIENTES: TIBStringField;
    QParametrosCTOCLIENTES_DS: TIBStringField;
    QParametrosCTORECNORMAL: TIBStringField;
    QParametrosCTORECNORMAL_DS: TIBStringField;
    QParametrosCTORECREDUCIDO: TIBStringField;
    QParametrosCTORECREDUCIDO_DS: TIBStringField;
    QParametrosCTORECSUPER: TIBStringField;
    QParametrosCTORECSUPER_DS: TIBStringField;
    QParametrosCTOCOBROF: TIBStringField;
    QParametrosCTOCOBROF_DS: TIBStringField;
    QParametrosCTORECIBOVENTAS: TIBStringField;
    QParametrosCTORECIBOVENTAS_DS: TIBStringField;
    QParametrosCTOIVACNORMAL: TIBStringField;
    QParametrosCTOIVACNORMAL_DS: TIBStringField;
    QParametrosCTOIVACREDUCIDO: TIBStringField;
    QParametrosCTOIVACREDUCIDO_DS: TIBStringField;
    QParametrosCTOIVACSUPER: TIBStringField;
    QParametrosCTOIVACSUPER_DS: TIBStringField;
    QParametrosCTOIVACEXENTO: TIBStringField;
    QParametrosCTOIVACEXENTO_DS: TIBStringField;
    QParametrosCTOCOMPRAS: TIBStringField;
    QParametrosCTOCOMPRAS_DS: TIBStringField;
    QParametrosCTOPROVEEDORES: TIBStringField;
    QParametrosCTOPROVEEDORES_DS: TIBStringField;
    QParametrosCTOPROVINTRA: TIBStringField;
    QParametrosCTOPROVINTRA_DS: TIBStringField;
    QParametrosCTOPAGOF: TIBStringField;
    QParametrosCTOPAGOF_DS: TIBStringField;
    QParametrosCTOEFECTOSCOMERCIALES: TIBStringField;
    QParametrosCTOEFECTOSCOMERCIALES_DS: TIBStringField;
    QParametrosCTODEUDASDESCUENTOS: TIBStringField;
    QParametrosCTODEUDASDESCUENTOS_DS: TIBStringField;
    QParametrosCTOREMESAEFECTOS: TIBStringField;
    QParametrosCTOREMESAEFECTOS_DS: TIBStringField;
    QParametrosCTODTOPPV: TIBStringField;
    QParametrosCTODTOPPV_DS: TIBStringField;
    QParametrosCTODTOPPC: TIBStringField;
    QParametrosCTODTOPPC_DS: TIBStringField;
    QParametrosCTORETPROF: TIBStringField;
    QParametrosCTORETPROF_DS: TIBStringField;
    QParametrosCTORETARRE: TIBStringField;
    QParametrosCTORETARRE_DS: TIBStringField;
    QParametrosCTOHACIVA: TIBStringField;
    QParametrosCTOHACIVA_DS: TIBStringField;
    QParametrosCTOCOBRO: TIBStringField;
    QParametrosCTOCOBRO_DS: TIBStringField;
    QParametrosCTOPAGO: TIBStringField;
    QParametrosCTOPAGO_DS: TIBStringField;
    QParametrosSCTADESCUENTO: TIBStringField;
    QParametrosCTODESCUENTO: TIBStringField;
    QParametrosCTONOME: TIBStringField;
    QParametrosCTONOMT: TIBStringField;
    QParametrosSCTANOMSUELDO: TIBStringField;
    QParametrosSCTANOMIRPF: TIBStringField;
    QParametrosSCTANOMPAGO: TIBStringField;
    QParametrosSCTANOMSSE: TIBStringField;
    QParametrosSCTANOMSST: TIBStringField;
    QParametrosSCTANOMCARGO: TIBStringField;
    QParametrosTANTORETPROF: TFloatField;
    QParametrosTANTORETARRE: TFloatField;
    QParametrosTELEFONO: TIBStringField;
    QParametrosFAX: TIBStringField;
    QParametrosDOCIMPRIMIR: TIBStringField;
    QParametrosSIGLAVIA: TIBStringField;
    QParametrosNUMEROCALLE: TIBStringField;
    QParametrosESCALERA: TIBStringField;
    QParametrosPISO: TIBStringField;
    QParametrosPUERTA: TIBStringField;
    QParametrosCCC: TIBStringField;
    QParametrosCODADMON: TIBStringField;
    QParametrosGESTIONA_CARTERA_EFECTOS: TIBStringField;
    QParametrosFILTRO_ASIENTOS_INICIO: TIBStringField;
    QParametrosINCLUIR_ABREV: TIBStringField;
    QParametrosASIENTOS_INICIO_INTERVALO_BQDA: TSmallintField;
    QParametrosASIENTOS_FIN_INTERVALO_BQDA: TSmallintField;
    QParametrosMOSTRAR_FILTRO_MAYOR: TIBStringField;
    QParametrosASIENTO_INICIO_INTERVALO_FILTRO: TSmallintField;
    QParametrosASIENTO_FIN_INTERVALO_FILTRO: TSmallintField;
    QParametrosASIENTO_NOMINA_INDIVIDUAL: TIBStringField;
    QParametrosBUSQUEDA_SUBCTAS: TIBStringField;
    QParametrosSCTAOTRASREMUN: TIBStringField;
    QParametrosDESCPROV_CARTERAEFECTOS: TIBStringField;
    QParametrosDESCCLI_CARTERAEFECTOS: TIBStringField;
    QParametrosTIPOEMPRESA: TIBStringField;
    QParametrosFILTROSUBCTAS: TIBStringField;
    QParametrosOFFICE2003: TIBStringField;
    QParametrosTRATASERIE: TIBStringField;
    QParametrosACTCOMENTARIO: TIBStringField;
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
    function  CreateQuery          (const prmSQL :array of string):TIBQuery;
    function  CreateQueryConsolida (const prmSQL :array of string):TIBQuery;
    function  CreateQueryEjAnterior(const prmSQL :array of string):TIBQuery;
  end;

var DMRef: TDMRef;

implementation
uses General;
{$R *.DFM}

function TDMRef.CreateQuery(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := IBDSiamCont;
   Query.Transaction := IBDSiamCont.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryConsolida(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := IBDConsolida;
   Query.Transaction := IBDConsolida.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryEjAnterior(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := BDEjAnterior;
   Query.Transaction := BdEjAnterior.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;


procedure TDMRef.AbrirDataSets;
begin
   //QueryOpen(QParametros, '');//'SELECT * FROM PARAMETROS ORDER BY ID_PARAMETROS DESC');

   QueryOpen(QPaisNom, 'SELECT * FROM PAISES ORDER BY NOMBRE');

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
   QueryOpen(QTipodiarioNom  , 'SELECT * FROM TIPODIARIO   ORDER BY DESCRIPCION    ');

   gvNombreEmpresa := DmRef.QParametros.FieldByName('NombreFiscal').AsString;
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
   IBDConsolida.Connected := False;
   IBDSiamCont.Connected  := False;
   Directorio          := ExtractFilePath(Application.ExeName);
   gvDirImagenes       := Directorio + gcDirImagenes;
   gvDirInformes       := Directorio + gcDirInformes;
   IBT1.Active         := False;
   IBTConsolida.Active := False;

   IBDSiamCont.Params.Clear;
   IBDSiamCont.Params.Add('user_name=SYSDBA');
   IBDSiamCont.Params.Add('password=masterkey');
   if Empty(gvServidor) then begin
      IBDSiamCont.DatabaseName := gvUbicacionEmpresa;
   end
   else begin
      IBDSiamCont.DatabaseName := Trim(gvServidor) + ':' + Trim(gvUbicacionEmpresa);
   end;
   IBDSiamCont.Connected := True;
   IBT1.Active           := True;

   IBDConsolida.Params.Clear;
   IBDConsolida.Params.Add('user_name=SYSDBA');
   IBDConsolida.Params.Add('password=masterkey');
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
   //activar transacciones
   for i := 0 to (ComponentCount - 1) do begin
      if Components[i] is TibTransaction then begin
         TibTransaction(Components[i]).Active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.Add('Read_committed');
         TibTransaction(Components[i]).Params.Add('Rec_version');
         TibTransaction(Components[i]).Params.Add('Write');
         if (TibTransaction(Components[i]) <> IBTConsolida) and
            (TibTransaction(Components[i]) <> TransBdEjAnterior) then begin
            TibTransaction(Components[i]).Active := True;
         end;
      end;
   end;

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



