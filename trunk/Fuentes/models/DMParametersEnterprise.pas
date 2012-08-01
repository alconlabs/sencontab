unit DMParametersEnterprise;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleParametersEnterprise = class(TDataModule)
    NoUse: TCRSQLConnection;
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
    LProvincias: TSimpleDataSet;
    LProvinciasPROVINCIA: TStringField;
    LProvinciasNOMBRE: TStringField;
    LProvinciasCODIGO: TStringField;
  private
    DB :TCRSQLConnection;
  public
    procedure Initialize(ADBController :TDBController);
  end;

var
  DataModuleParametersEnterprise: TDataModuleParametersEnterprise;

implementation

uses DBConnection;

{$R *.dfm}

{ TDataModuleParametersEnterprise }

procedure TDataModuleParametersEnterprise.Initialize(ADBController: TDBController);
begin
   QParametros.Connection := ADBController.DBConnection.Connection;
   QParametros.Open;

   LProvincias.Connection := ADBController.DBConnection.Connection;
   LProvincias.Open;
end;

end.
