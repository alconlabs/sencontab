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
    QParametrosSCTANOMSUELDO_DS: TStringField;
    QParametrosSCTANOMSST_DS: TStringField;
    QParametrosSCTANOMPAGO_DS: TStringField;
    QParametrosSCTAOTRASREMUN_DS: TStringField;
    QParametrosSCTANOMCARGO_DS: TStringField;
    QParametrosSCTANOMSSE_DS: TStringField;
    QParametrosSCTANOMIRPF_DS: TStringField;
    QParametrosSUBCUENTA_CIERRE_DS: TStringField;
    LConceptos: TSimpleDataSet;
    LConceptosID_CONCEPTOS: TStringField;
    LConceptosDESCRIPCION: TStringField;
    LConceptosTIPOCONTABILIDAD: TStringField;
    LConceptosTIPOCONCEPTO: TStringField;
    LConceptosOBSOLETO: TStringField;
    LConceptosSUBCUENTA: TStringField;
    LConceptosCONTRAPARTIDA: TStringField;
    procedure QParametrosCalcFields(DataSet: TDataSet);
  private
    DB :TCRSQLConnection;
    function GetAccountDescr(prmAccount :string):string;
    function GetConceptDescr(prmConcept :string):string;
  public
    procedure Initialize(ADBController :TDBController);
    function  IntegrityValidate :Boolean;
    function  BussinesValidate  :Boolean;
  end;

implementation

uses DBConnection;

{$R *.dfm}

{ TDataModuleParametersEnterprise }

function TDataModuleParametersEnterprise.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleParametersEnterprise.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleParametersEnterprise.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QParametros.Connection := ADBController.DBConnection.Connection;
   QParametros.Open;

   LProvincias.Connection := ADBController.DBConnection.Connection;
   LProvincias.Open;

   LConceptos.Connection := ADBController.DBConnection.Connection;
   LConceptos.Open;
end;

procedure TDataModuleParametersEnterprise.QParametrosCalcFields(DataSet: TDataSet);
begin
   QParametrosSCTAIVANORMAL_DS.AsString            := GetAccountDescr(QParametrosSCTAIVANORMAL.AsString);
   QParametrosSCTAIVAREDUCIDO_DS.AsString          := GetAccountDescr(QParametrosSCTAIVAREDUCIDO.AsString);
   QParametrosSCTAIVASUPER_DS.AsString             := GetAccountDescr(QParametrosSCTAIVASUPER.AsString);
   QParametrosSCTAIVAEXENTO_DS.AsString            := GetAccountDescr(QParametrosSCTAIVAEXENTO.AsString);
   QParametrosSCTAIVAINTRADEDUCIBLE_DS.AsString    := GetAccountDescr(QParametrosSCTAIVAINTRADEDUCIBLE.AsString);                               
   QParametrosSCTAIVAINTRA_DS.AsString             := GetAccountDescr(QParametrosSCTAIVAINTRA.AsString);                                        
   QParametrosSCTAVENTAS_DS.AsString               := GetAccountDescr(QParametrosSCTAVENTAS.AsString);
   QParametrosSCTADEVOLUCION_DS.AsString           := GetAccountDescr(QParametrosSCTADEVOLUCION.AsString);
   QParametrosSCTARECNORMAL_DS.AsString            := GetAccountDescr(QParametrosSCTARECNORMAL.AsString);                                       
   QParametrosSCTARECREDUCIDO_DS.AsString          := GetAccountDescr(QParametrosSCTARECREDUCIDO.AsString);
   QParametrosSCTARECSUPER_DS.AsString             := GetAccountDescr(QParametrosSCTARECSUPER.AsString);                                        
   QParametrosVGENERICA_DS.AsString                := GetAccountDescr(QParametrosVGENERICA.AsString);
   QParametrosSUBCAJA_DS.AsString                  := GetAccountDescr(QParametrosSUBCAJA.AsString);                                             
   QParametrosSCTAIVAEXENTOCEE_DS.AsString         := GetAccountDescr(QParametrosSCTAIVAEXENTOCEE.AsString);                                    
   QParametrosSCTAINTERESES_DS.AsString            := GetAccountDescr(QParametrosSCTAINTERESES.AsString);                                       
   QParametrosSCTAEXPORTACIONES_DS.AsString        := GetAccountDescr(QParametrosSCTAEXPORTACIONES.AsString);                                   
   QParametrosSCTAIVACNORMAL_DS.AsString           := GetAccountDescr(QParametrosSCTAIVACNORMAL.AsString);                                      
   QParametrosSCTAIVACREDUCIDO_DS.AsString         := GetAccountDescr(QParametrosSCTAIVACREDUCIDO.AsString);                                    
   QParametrosSCTAIVACSUPER_DS.AsString            := GetAccountDescr(QParametrosSCTAIVACSUPER.AsString);                                       
   QParametrosSCTAIVACEXENTO_DS.AsString           := GetAccountDescr(QParametrosSCTAIVACEXENTO.AsString);                                      
   QParametrosSCTACOMPRAS_DS.AsString              := GetAccountDescr(QParametrosSCTACOMPRAS.AsString);                                         
   QParametrosSCTAIVACINTRADEDUCIBLE_DS.AsString   := GetAccountDescr(QParametrosSCTAIVACINTRADEDUCIBLE.AsString);                              
   QParametrosSCTAIVACINTRAREPERCUTIDO_DS.AsString := GetAccountDescr(QParametrosSCTAIVACINTRAREPERCUTIDO.AsString);                            
   QParametrosVGENERICAC_DS.AsString               := GetAccountDescr(QParametrosVGENERICAC.AsString);                                          
   QParametrosSCTAEFECTOSCOMERCIALES_DS.AsString   := GetAccountDescr(QParametrosSCTAEFECTOSCOMERCIALES.AsString);
   QParametrosSCTAEFECTDESCONTADOS_DS.AsString     := GetAccountDescr(QParametrosSCTAEFECTDESCONTADOS.AsString);
   QParametrosSCTADEUDASDESCUENTOS_DS.AsString     := GetAccountDescr(QParametrosSCTADEUDASDESCUENTOS.AsString);
   QParametrosSCTAREMESAEFECTOS_DS.AsString        := GetAccountDescr(QParametrosSCTAREMESAEFECTOS.AsString);
   QParametrosSCTADTOPPV_DS.AsString               := GetAccountDescr(QParametrosSCTADTOPPV.AsString);                                          
   QParametrosSCTADTOPPC_DS.AsString               := GetAccountDescr(QParametrosSCTADTOPPC.AsString);                                          
   QParametrosSCTARETPROF_DS.AsString              := GetAccountDescr(QParametrosSCTARETPROF.AsString);                                         
   QParametrosSCTARETARRE_DS.AsString              := GetAccountDescr(QParametrosSCTARETARRE.AsString);                                         
   QParametrosSCTAHACIVA_DS.AsString               := GetAccountDescr(QParametrosSCTAHACIVA.AsString);
   QParametrosSCTAGENINTRACOM_DS.AsString          := GetAccountDescr(QParametrosSCTAGENINTRACOM.AsString);                                     
   QParametrosSCTABANCO_DS.AsString                := GetAccountDescr(QParametrosSCTABANCO.AsString);
   QParametrosSCTANOMSUELDO_DS.AsString            := GetAccountDescr(QParametrosSCTANOMSUELDO.AsString);
   QParametrosSCTANOMSST_DS.AsString               := GetAccountDescr(QParametrosSCTANOMSST.AsString);
   QParametrosSCTANOMPAGO_DS.AsString              := GetAccountDescr(QParametrosSCTANOMPAGO.AsString);
   QParametrosSCTAOTRASREMUN_DS.AsString           := GetAccountDescr(QParametrosSCTAOTRASREMUN.AsString);
   QParametrosSCTANOMIRPF_DS.AsString              := GetAccountDescr(QParametrosSCTANOMIRPF.AsString);
   QParametrosSCTANOMCARGO_DS.AsString             := GetAccountDescr(QParametrosSCTANOMCARGO.AsString);
   QParametrosSCTANOMSSE_DS.AsString               := GetAccountDescr(QParametrosSCTANOMSSE.AsString);
   QParametrosSUBCUENTA_CIERRE_DS.AsString         := GetAccountDescr(QParametrosSUBCUENTA_CIERRE.AsString);

   QParametrosCTOIVANORMAL_DS.AsString             := GetConceptDescr(QParametrosCTOIVANORMAL.AsString);
   QParametrosCTOIVAREDUCIDO_DS.AsString           := GetConceptDescr(QParametrosCTOIVAREDUCIDO.AsString);
   QParametrosCTOIVASUPER_DS.AsString              := GetConceptDescr(QParametrosCTOIVASUPER.AsString);
   QParametrosCTOIVAEXENTO_DS.AsString             := GetConceptDescr(QParametrosCTOIVAEXENTO.AsString);
   QParametrosCTOIVAINTRA_DS.AsString              := GetConceptDescr(QParametrosCTOIVAINTRA.AsString);
   QParametrosCTOVENTAS_DS.AsString                := GetConceptDescr(QParametrosCTOVENTAS.AsString);
   QParametrosCTODEVOLUCION_DS.AsString            := GetConceptDescr(QParametrosCTODEVOLUCION.AsString);
   QParametrosCTOCLIENTES_DS.AsString              := GetConceptDescr(QParametrosCTOCLIENTES.AsString);
   QParametrosCTORECNORMAL_DS.AsString             := GetConceptDescr(QParametrosCTORECNORMAL.AsString);
   QParametrosCTORECREDUCIDO_DS.AsString           := GetConceptDescr(QParametrosCTORECREDUCIDO.AsString);
   QParametrosCTORECSUPER_DS.AsString              := GetConceptDescr(QParametrosCTORECSUPER.AsString);
   QParametrosCTOCOBROF_DS.AsString                := GetConceptDescr(QParametrosCTOCOBROF.AsString);
   QParametrosCTORECIBOVENTAS_DS.AsString          := GetConceptDescr(QParametrosCTORECIBOVENTAS.AsString);
   QParametrosCTOIVACNORMAL_DS.AsString            := GetConceptDescr(QParametrosCTOIVACNORMAL.AsString);
   QParametrosCTOIVACREDUCIDO_DS.AsString          := GetConceptDescr(QParametrosCTOIVACREDUCIDO.AsString);
   QParametrosCTOIVACSUPER_DS.AsString             := GetConceptDescr(QParametrosCTOIVACSUPER.AsString);
   QParametrosCTOIVACEXENTO_DS.AsString            := GetConceptDescr(QParametrosCTOIVACEXENTO.AsString);
   QParametrosCTOCOMPRAS_DS.AsString               := GetConceptDescr(QParametrosCTOCOMPRAS.AsString);
   QParametrosCTOPROVEEDORES_DS.AsString           := GetConceptDescr(QParametrosCTOPROVEEDORES.AsString);
   QParametrosCTOPROVINTRA_DS.AsString             := GetConceptDescr(QParametrosCTOPROVINTRA.AsString);
   QParametrosCTOPAGOF_DS.AsString                 := GetConceptDescr(QParametrosCTOPAGOF.AsString);
   QParametrosCTOEFECTOSCOMERCIALES_DS.AsString    := GetConceptDescr(QParametrosCTOEFECTOSCOMERCIALES.AsString);
   QParametrosCTODEUDASDESCUENTOS_DS.AsString      := GetConceptDescr(QParametrosCTODEUDASDESCUENTOS.AsString);
   QParametrosCTOREMESAEFECTOS_DS.AsString         := GetConceptDescr(QParametrosCTOREMESAEFECTOS.AsString);
   QParametrosCTODTOPPV_DS.AsString                := GetConceptDescr(QParametrosCTODTOPPV.AsString);
   QParametrosCTODTOPPC_DS.AsString                := GetConceptDescr(QParametrosCTODTOPPC.AsString);
   QParametrosCTORETPROF_DS.AsString               := GetConceptDescr(QParametrosCTORETPROF.AsString);
   QParametrosCTORETARRE_DS.AsString               := GetConceptDescr(QParametrosCTORETARRE.AsString);
   QParametrosCTOHACIVA_DS.AsString                := GetConceptDescr(QParametrosCTOHACIVA.AsString);
   QParametrosCTOCOBRO_DS.AsString                 := GetConceptDescr(QParametrosCTOCOBRO.AsString);
   QParametrosCTOPAGO_DS.AsString                  := GetConceptDescr(QParametrosCTOPAGO.AsString);                                             
end;

function TDataModuleParametersEnterprise.GetAccountDescr(prmAccount: string): string;
var QAccounts :TSQLQuery;
begin
   QAccounts := TSQLQuery.Create(nil);
   try
      QAccounts.SQLConnection := DB;
      QAccounts.SQL.Add('SELECT DESCRIPCION               ');
      QAccounts.SQL.Add('FROM   SUBCTAS                   ');
      QAccounts.SQL.Add('WHERE  SUBCUENTA = :prmSUBCUENTA ');
      QAccounts.ParamCheck := True;
      QAccounts.ParamByName('prmSUBCUENTA').AsString := prmAccount;
      QAccounts.Open;
      Result := QAccounts.FieldByName('DESCRIPCION').AsString;
   finally
      QAccounts.Free;
   end;
end;

function TDataModuleParametersEnterprise.GetConceptDescr(prmConcept: string): string;
var QConcepts :TSQLQuery;
begin
   QConcepts := TSQLQuery.Create(nil);
   try
      QConcepts.SQLConnection := DB;
      QConcepts.SQL.Add('SELECT DESCRIPCION                     ');
      QConcepts.SQL.Add('FROM   CONCEPTOS                       ');
      QConcepts.SQL.Add('WHERE  ID_CONCEPTOS = :prmID_CONCEPTOS ');
      QConcepts.ParamCheck := True;
      QConcepts.ParamByName('prmID_CONCEPTOS').AsString := prmConcept;
      QConcepts.Open;
      Result := QConcepts.FieldByName('DESCRIPCION').AsString;
   finally
      QConcepts.Free;
   end;
end;

end.

SELECT PRM.ID_PARAMETROS                                       ,
       PRM.LONGITUD_SUBCUENTAS                                 ,
       PRM.FECHA_INICIO_APLICACION                             ,
       PRM.FECHA_INICIO_EJERCICIO                              ,
       PRM.FECHA_FIN_EJERCICIO                                 ,
       PRM.CTO_REGULARIZACION                                  ,
       PRM.SUBCUENTA_CIERRE                                    ,
       PRM.MONEDA                                              ,
       PRM.NOMBREFISCAL                                        ,
       PRM.DIRECCION                                           ,
       PRM.DIRECCION1                                          ,
       PRM.POBLACION                                           ,
       PRM.CODPOSTAL                                           ,
       PRM.PROVINCIA                                           ,
       PRM.NIF                                                 ,
       PRM.CONTACTO                                            ,
       PRM.DOCCLIENTE                                          ,
       PRM.DOCPROVEEDOR                                        ,
       PRM.DOC347                                              ,
       PRM.FECHABLOQUEO                                        ,
       PRM.CTO_APERTURA                                        ,
       PRM.CTO_REGULARIZACION_ESP                              ,
       PRM.FECHAAMORTIZACION                                   ,
       PRM.RECARGO                                             ,
       PRM.CTO_APERTURA_ESP                                    ,
       PRM.SCTAIVANORMAL                                       ,
       S01.DESCRIPCION              SCTAIVANORMAL_DS           ,
       PRM.SCTAIVAREDUCIDO                                     ,
       S02.DESCRIPCION              SCTAIVAREDUCIDO_DS         ,
       PRM.SCTAIVASUPER                                        ,
       S03.DESCRIPCION              SCTAIVASUPER_DS            ,
       PRM.SCTAIVAEXENTO                                       ,
       S04.DESCRIPCION              SCTAIVAEXENTO_DS           ,
       PRM.SCTAIVAINTRADEDUCIBLE                               ,
       S05.DESCRIPCION              SCTAIVAINTRADEDUCIBLE_DS   ,
       PRM.SCTAIVAINTRA                                        ,
       S06.DESCRIPCION              SCTAIVAINTRA_DS            ,
       PRM.SCTAVENTAS                                          ,
       S07.DESCRIPCION              SCTAVENTAS_DS              ,
       PRM.SCTADEVOLUCION                                      ,
       S08.DESCRIPCION              SCTADEVOLUCION_DS          ,
       PRM.SCTARECNORMAL                                       ,
       S09.DESCRIPCION              SCTARECNORMAL_DS           ,
       PRM.SCTARECREDUCIDO                                     ,
       S10.DESCRIPCION              SCTARECREDUCIDO_DS         ,
       PRM.SCTARECSUPER                                        ,
       S11.DESCRIPCION              SCTARECSUPER_DS            ,
       PRM.VGENERICA                                           ,
       S12.DESCRIPCION              VGENERICA_DS               ,
       PRM.SUBCAJA                                             ,
       S13.DESCRIPCION              SUBCAJA_DS                 ,
       PRM.SCTAIVAEXENTOCEE                                    ,
       S14.DESCRIPCION              SCTAIVAEXENTOCEE_DS        ,
       PRM.SCTAINTERESES                                       ,
       S15.DESCRIPCION              SCTAINTERESES_DS           ,
       PRM.SCTAEXPORTACIONES                                   ,
       S16.DESCRIPCION              SCTAEXPORTACIONES_DS       ,
       PRM.SCTAIVACNORMAL                                      ,
       S17.DESCRIPCION              SCTAIVACNORMAL_DS          ,
       PRM.SCTAIVACREDUCIDO                                    ,
       S18.DESCRIPCION              SCTAIVACREDUCIDO_DS        ,
       PRM.SCTAIVACSUPER                                       ,
       S19.DESCRIPCION              SCTAIVACSUPER_DS           ,
       PRM.SCTAIVACEXENTO                                      ,
       S20.DESCRIPCION              SCTAIVACEXENTO_DS          ,
       PRM.SCTACOMPRAS                                         ,
       S21.DESCRIPCION              SCTACOMPRAS_DS             ,
       PRM.SCTAIVACINTRADEDUCIBLE                              ,
       S22.DESCRIPCION              SCTAIVACINTRADEDUCIBLE_DS  ,
       PRM.SCTAIVACINTRAREPERCUTIDO                            ,
       S23.DESCRIPCION              SCTAIVACINTRAREPERCUTIDO_DS,
       PRM.VGENERICAC                                          ,
       S24.DESCRIPCION              VGENERICAC_DS              ,
       PRM.SCTAEFECTOSCOMERCIALES                              ,
       S25.DESCRIPCION              SCTAEFECTOSCOMERCIALES_DS  ,
       PRM.SCTAEFECTDESCONTADOS                                ,
       S26.DESCRIPCION              SCTAEFECTDESCONTADOS_DS    ,
       PRM.SCTADEUDASDESCUENTOS                                ,
       S27.DESCRIPCION              SCTADEUDASDESCUENTOS_DS    ,
       PRM.SCTAREMESAEFECTOS                                   ,
       S28.DESCRIPCION              SCTAREMESAEFECTOS_DS       ,
       PRM.SCTADTOPPV                                          ,
       S29.DESCRIPCION              SCTADTOPPV_DS              ,
       PRM.SCTADTOPPC                                          ,
       S30.DESCRIPCION              SCTADTOPPC_DS              ,
       PRM.SCTARETPROF                                         ,
       S31.DESCRIPCION              SCTARETPROF_DS             ,
       PRM.SCTARETARRE                                         ,
       S32.DESCRIPCION              SCTARETARRE_DS             ,
       PRM.SCTAHACIVA                                          ,
       S33.DESCRIPCION              SCTAHACIVA_DS              ,
       PRM.SCTAGENINTRACOM                                     ,
       S34.DESCRIPCION              SCTAGENINTRACOM_DS         ,
       PRM.SCTABANCO                                           ,
       S35.DESCRIPCION              SCTABANCO_DS               ,
       PRM.SCTANOMSUELDO                                       ,
       S36.DESCRIPCION              SCTANOMSUELDO_DS           ,
       PRM.CTOIVANORMAL                                        ,
       C01.DESCRIPCION              CTOIVANORMAL_DS            ,
       PRM.CTOIVAREDUCIDO                                      ,
       C02.DESCRIPCION              CTOIVAREDUCIDO_DS          ,
       PRM.CTOIVASUPER                                         ,
       C03.DESCRIPCION              CTOIVASUPER_DS             ,
       PRM.CTOIVAEXENTO                                        ,
       C04.DESCRIPCION              CTOIVAEXENTO_DS            ,
       PRM.CTOIVAINTRA                                         ,
       C05.DESCRIPCION              CTOIVAINTRA_DS             ,
       PRM.CTOVENTAS                                           ,
       C06.DESCRIPCION              CTOVENTAS_DS               ,
       PRM.CTODEVOLUCION                                       ,
       C07.DESCRIPCION              CTODEVOLUCION_DS           ,
       PRM.CTOCLIENTES                                         ,
       C08.DESCRIPCION              CTOCLIENTES_DS             ,
       PRM.CTORECNORMAL                                        ,
       C09.DESCRIPCION              CTORECNORMAL_DS            ,
       PRM.CTORECREDUCIDO                                      ,
       C10.DESCRIPCION              CTORECREDUCIDO_DS          ,
       PRM.CTORECSUPER                                         ,
       C11.DESCRIPCION              CTORECSUPER_DS             ,
       PRM.CTOCOBROF                                           ,
       C12.DESCRIPCION              CTOCOBROF_DS               ,
       PRM.CTORECIBOVENTAS                                     ,
       C13.DESCRIPCION              CTORECIBOVENTAS_DS         ,
       PRM.CTOIVACNORMAL                                       ,
       C14.DESCRIPCION              CTOIVACNORMAL_DS           ,
       PRM.CTOIVACREDUCIDO                                     ,
       C15.DESCRIPCION              CTOIVACREDUCIDO_DS         ,
       PRM.CTOIVACSUPER                                        ,
       C16.DESCRIPCION              CTOIVACSUPER_DS            ,
       PRM.CTOIVACEXENTO                                       ,
       C17.DESCRIPCION              CTOIVACEXENTO_DS           ,
       PRM.CTOCOMPRAS                                          ,
       C18.DESCRIPCION              CTOCOMPRAS_DS              ,
       PRM.CTOPROVEEDORES                                      ,
       C19.DESCRIPCION              CTOPROVEEDORES_DS          ,
       PRM.CTOPROVINTRA                                        ,
       C20.DESCRIPCION              CTOPROVINTRA_DS            ,
       PRM.CTOPAGOF                                            ,
       C21.DESCRIPCION              CTOPAGOF_DS                ,
       PRM.CTOEFECTOSCOMERCIALES                               ,
       C22.DESCRIPCION              CTOEFECTOSCOMERCIALES_DS   ,
       PRM.CTODEUDASDESCUENTOS                                 ,
       C23.DESCRIPCION              CTODEUDASDESCUENTOS_DS     ,
       PRM.CTOREMESAEFECTOS                                    ,
       C24.DESCRIPCION              CTOREMESAEFECTOS_DS        ,
       PRM.CTODTOPPV                                           ,
       C25.DESCRIPCION              CTODTOPPV_DS               ,
       PRM.CTODTOPPC                                           ,
       C26.DESCRIPCION              CTODTOPPC_DS               ,
       PRM.CTORETPROF                                          ,
       C27.DESCRIPCION              CTORETPROF_DS              ,
       PRM.CTORETARRE                                          ,
       C28.DESCRIPCION              CTORETARRE_DS              ,
       PRM.CTOHACIVA                                           ,
       C29.DESCRIPCION              CTOHACIVA_DS               ,
       PRM.CTOCOBRO                                            ,
       C30.DESCRIPCION              CTOCOBRO_DS                ,
       PRM.CTOPAGO                                             ,
       C31.DESCRIPCION              CTOPAGO_DS                 ,
       PRM.SCTADESCUENTO                                       ,
       PRM.CTODESCUENTO                                        ,
       PRM.CTONOME                                             ,
       PRM.CTONOMT                                             ,
       PRM.SCTANOMIRPF                                         ,
       PRM.SCTANOMPAGO                                         ,
       PRM.SCTANOMSSE                                          ,
       PRM.SCTANOMSST                                          ,
       PRM.SCTANOMCARGO                                        ,
       PRM.TANTORETPROF                                        ,
       PRM.TANTORETARRE                                        ,
       PRM.TELEFONO                                            ,
       PRM.FAX                                                 ,
       PRM.DOCIMPRIMIR                                         ,
       PRM.SIGLAVIA                                            ,
       PRM.NUMEROCALLE                                         ,
       PRM.ESCALERA                                            ,
       PRM.PISO                                                ,
       PRM.PUERTA                                              ,
       PRM.CCC                                                 ,
       PRM.CODADMON                                            ,
       PRM.GESTIONA_CARTERA_EFECTOS                            ,
       PRM.FILTRO_ASIENTOS_INICIO                              ,
       PRM.INCLUIR_ABREV                                       ,
       PRM.ASIENTOS_INICIO_INTERVALO_BQDA                      ,
       PRM.ASIENTOS_FIN_INTERVALO_BQDA                         ,
       PRM.MOSTRAR_FILTRO_MAYOR                                ,
       PRM.ASIENTO_INICIO_INTERVALO_FILTRO                     ,
       PRM.ASIENTO_FIN_INTERVALO_FILTRO                        ,
       PRM.ASIENTO_NOMINA_INDIVIDUAL                           ,
       PRM.BUSQUEDA_SUBCTAS                                    ,
       PRM.SCTAOTRASREMUN                                      ,
       PRM.DESCPROV_CARTERAEFECTOS                             ,
       PRM.DESCCLI_CARTERAEFECTOS                              ,
       PRM.TIPOEMPRESA                                         ,
       PRM.FILTROSUBCTAS                                       ,
       PRM.OFFICE2003                                          ,
       PRM.TRATASERIE                                          ,
       PRM.ACTCOMENTARIO
FROM PARAMETROS PRM
LEFT JOIN SUBCTAS S01 ON S01.SUBCUENTA = PRM.SCTAIVANORMAL
LEFT JOIN SUBCTAS S02 ON S02.SUBCUENTA = PRM.SCTAIVAREDUCIDO
LEFT JOIN SUBCTAS S03 ON S03.SUBCUENTA = PRM.SCTAIVASUPER
LEFT JOIN SUBCTAS S04 ON S04.SUBCUENTA = PRM.SCTAIVAEXENTO
LEFT JOIN SUBCTAS S05 ON S05.SUBCUENTA = PRM.SCTAIVAINTRADEDUCIBLE
LEFT JOIN SUBCTAS S06 ON S06.SUBCUENTA = PRM.SCTAIVAINTRA
LEFT JOIN SUBCTAS S07 ON S07.SUBCUENTA = PRM.SCTAVENTAS
LEFT JOIN SUBCTAS S08 ON S08.SUBCUENTA = PRM.SCTADEVOLUCION
LEFT JOIN SUBCTAS S09 ON S09.SUBCUENTA = PRM.SCTARECNORMAL
LEFT JOIN SUBCTAS S10 ON S10.SUBCUENTA = PRM.SCTARECREDUCIDO
LEFT JOIN SUBCTAS S11 ON S11.SUBCUENTA = PRM.SCTARECSUPER
LEFT JOIN SUBCTAS S12 ON S12.SUBCUENTA = PRM.VGENERICA
LEFT JOIN SUBCTAS S13 ON S13.SUBCUENTA = PRM.SUBCAJA
LEFT JOIN SUBCTAS S14 ON S14.SUBCUENTA = PRM.SCTAIVAEXENTOCEE
LEFT JOIN SUBCTAS S15 ON S15.SUBCUENTA = PRM.SCTAINTERESES
LEFT JOIN SUBCTAS S16 ON S16.SUBCUENTA = PRM.SCTAEXPORTACIONES
LEFT JOIN SUBCTAS S17 ON S17.SUBCUENTA = PRM.SCTAIVACNORMAL
LEFT JOIN SUBCTAS S18 ON S18.SUBCUENTA = PRM.SCTAIVACREDUCIDO
LEFT JOIN SUBCTAS S19 ON S19.SUBCUENTA = PRM.SCTAIVACSUPER
LEFT JOIN SUBCTAS S20 ON S20.SUBCUENTA = PRM.SCTAIVACEXENTO
LEFT JOIN SUBCTAS S21 ON S21.SUBCUENTA = PRM.SCTACOMPRAS
LEFT JOIN SUBCTAS S22 ON S22.SUBCUENTA = PRM.SCTAIVACINTRADEDUCIBLE
LEFT JOIN SUBCTAS S23 ON S23.SUBCUENTA = PRM.SCTAIVACINTRAREPERCUTIDO
LEFT JOIN SUBCTAS S24 ON S24.SUBCUENTA = PRM.VGENERICAC
LEFT JOIN SUBCTAS S25 ON S25.SUBCUENTA = PRM.SCTAEFECTOSCOMERCIALES
LEFT JOIN SUBCTAS S26 ON S26.SUBCUENTA = PRM.SCTAEFECTDESCONTADOS
LEFT JOIN SUBCTAS S27 ON S27.SUBCUENTA = PRM.SCTADEUDASDESCUENTOS
LEFT JOIN SUBCTAS S28 ON S28.SUBCUENTA = PRM.SCTAREMESAEFECTOS
LEFT JOIN SUBCTAS S29 ON S29.SUBCUENTA = PRM.SCTADTOPPV
LEFT JOIN SUBCTAS S30 ON S30.SUBCUENTA = PRM.SCTADTOPPC
LEFT JOIN SUBCTAS S31 ON S31.SUBCUENTA = PRM.SCTARETPROF
LEFT JOIN SUBCTAS S32 ON S32.SUBCUENTA = PRM.SCTARETARRE
LEFT JOIN SUBCTAS S33 ON S33.SUBCUENTA = PRM.SCTAHACIVA
LEFT JOIN SUBCTAS S34 ON S34.SUBCUENTA = PRM.SCTAGENINTRACOM
LEFT JOIN SUBCTAS S35 ON S35.SUBCUENTA = PRM.SCTABANCO
LEFT JOIN SUBCTAS S36 ON S36.SUBCUENTA = PRM.SCTANOMSUELDO
LEFT JOIN CONCEPTOS C01 ON C01.ID_CONCEPTOS = PRM.CTOIVANORMAL
LEFT JOIN CONCEPTOS C02 ON C02.ID_CONCEPTOS = PRM.CTOIVAREDUCIDO
LEFT JOIN CONCEPTOS C03 ON C03.ID_CONCEPTOS = PRM.CTOIVASUPER
LEFT JOIN CONCEPTOS C04 ON C04.ID_CONCEPTOS = PRM.CTOIVAEXENTO
LEFT JOIN CONCEPTOS C05 ON C05.ID_CONCEPTOS = PRM.CTOIVAINTRA
LEFT JOIN CONCEPTOS C06 ON C06.ID_CONCEPTOS = PRM.CTOVENTAS
LEFT JOIN CONCEPTOS C07 ON C07.ID_CONCEPTOS = PRM.CTODEVOLUCION
LEFT JOIN CONCEPTOS C08 ON C08.ID_CONCEPTOS = PRM.CTOCLIENTES
LEFT JOIN CONCEPTOS C09 ON C09.ID_CONCEPTOS = PRM.CTORECNORMAL
LEFT JOIN CONCEPTOS C10 ON C10.ID_CONCEPTOS = PRM.CTORECREDUCIDO
LEFT JOIN CONCEPTOS C11 ON C11.ID_CONCEPTOS = PRM.CTORECSUPER
LEFT JOIN CONCEPTOS C12 ON C12.ID_CONCEPTOS = PRM.CTOCOBROF
LEFT JOIN CONCEPTOS C13 ON C13.ID_CONCEPTOS = PRM.CTORECIBOVENTAS
LEFT JOIN CONCEPTOS C14 ON C14.ID_CONCEPTOS = PRM.CTOIVACNORMAL
LEFT JOIN CONCEPTOS C15 ON C15.ID_CONCEPTOS = PRM.CTOIVACREDUCIDO
LEFT JOIN CONCEPTOS C16 ON C16.ID_CONCEPTOS = PRM.CTOIVACSUPER
LEFT JOIN CONCEPTOS C17 ON C17.ID_CONCEPTOS = PRM.CTOIVACEXENTO
LEFT JOIN CONCEPTOS C18 ON C18.ID_CONCEPTOS = PRM.CTOCOMPRAS
LEFT JOIN CONCEPTOS C19 ON C19.ID_CONCEPTOS = PRM.CTOPROVEEDORES
LEFT JOIN CONCEPTOS C20 ON C20.ID_CONCEPTOS = PRM.CTOPROVINTRA
LEFT JOIN CONCEPTOS C21 ON C21.ID_CONCEPTOS = PRM.CTOPAGOF
LEFT JOIN CONCEPTOS C22 ON C22.ID_CONCEPTOS = PRM.CTOEFECTOSCOMERCIALES
LEFT JOIN CONCEPTOS C23 ON C23.ID_CONCEPTOS = PRM.CTODEUDASDESCUENTOS
LEFT JOIN CONCEPTOS C24 ON C24.ID_CONCEPTOS = PRM.CTOREMESAEFECTOS
LEFT JOIN CONCEPTOS C25 ON C25.ID_CONCEPTOS = PRM.CTODTOPPV
LEFT JOIN CONCEPTOS C26 ON C26.ID_CONCEPTOS = PRM.CTODTOPPC
LEFT JOIN CONCEPTOS C27 ON C27.ID_CONCEPTOS = PRM.CTORETPROF
LEFT JOIN CONCEPTOS C28 ON C28.ID_CONCEPTOS = PRM.CTORETARRE
LEFT JOIN CONCEPTOS C29 ON C29.ID_CONCEPTOS = PRM.CTOHACIVA
LEFT JOIN CONCEPTOS C30 ON C30.ID_CONCEPTOS = PRM.CTOCOBRO
LEFT JOIN CONCEPTOS C31 ON C31.ID_CONCEPTOS = PRM.CTOPAGO





SELECT ID_PARAMETROS                  ,
       LONGITUD_SUBCUENTAS            ,
       FECHA_INICIO_APLICACION        ,
       FECHA_INICIO_EJERCICIO         ,
       FECHA_FIN_EJERCICIO            ,
       CTO_REGULARIZACION             ,
       SUBCUENTA_CIERRE               ,
       MONEDA                         ,
       NOMBREFISCAL                   ,
       DIRECCION                      ,
       DIRECCION1                     ,
       POBLACION                      ,
       CODPOSTAL                      ,
       PROVINCIA                      ,
       NIF                            ,
       CONTACTO                       ,
       DOCCLIENTE                     ,
       DOCPROVEEDOR                   ,
       DOC347                         ,
       FECHABLOQUEO                   ,
       CTO_APERTURA                   ,
       CTO_REGULARIZACION_ESP         ,
       FECHAAMORTIZACION              ,
       RECARGO                        ,
       CTO_APERTURA_ESP               ,
       SCTAIVANORMAL                  ,
       SCTAIVASUPER                   ,
       SCTAIVAREDUCIDO                ,
       SCTAIVAEXENTO                  ,
       SCTAIVAINTRADEDUCIBLE          ,
       SCTAIVAINTRA                   ,
       SCTAVENTAS                     ,
       SCTADEVOLUCION                 ,
       SCTARECNORMAL                  ,
       SCTARECREDUCIDO                ,
       SCTARECSUPER                   ,
       VGENERICA                      ,
       SUBCAJA                        ,
       SCTAIVAEXENTOCEE               ,
       SCTAINTERESES                  ,
       SCTAEXPORTACIONES              ,
       SCTAIVACNORMAL                 ,
       SCTAIVACREDUCIDO               ,
       SCTAIVACSUPER                  ,
       SCTAIVACEXENTO                 ,
       SCTACOMPRAS                    ,
       SCTAIVACINTRADEDUCIBLE         ,
       SCTAIVACINTRAREPERCUTIDO       ,
       VGENERICAC                     ,
       SCTAEFECTOSCOMERCIALES         ,
       SCTAEFECTDESCONTADOS           ,
       SCTADEUDASDESCUENTOS           ,
       SCTAREMESAEFECTOS              ,
       SCTADTOPPV                     ,
       SCTADTOPPC                     ,
       SCTARETPROF                    ,
       SCTARETARRE                    ,
       SCTAHACIVA                     ,
       SCTAGENINTRACOM                ,
       SCTABANCO                      ,
       SCTANOMSUELDO                  ,
       CTOIVANORMAL                   ,
       CTOIVAREDUCIDO                 ,
       CTOIVASUPER                    ,
       CTOIVAEXENTO                   ,
       CTOIVAINTRA                    ,
       CTOVENTAS                      ,
       CTODEVOLUCION                  ,
       CTOCLIENTES                    ,
       CTORECNORMAL                   ,
       CTORECREDUCIDO                 ,
       CTORECSUPER                    ,
       CTOCOBROF                      ,
       CTORECIBOVENTAS                ,
       CTOIVACNORMAL                  ,
       CTOIVACREDUCIDO                ,
       CTOIVACSUPER                   ,
       CTOIVACEXENTO                  ,
       CTOCOMPRAS                     ,
       CTOPROVEEDORES                 ,
       CTOPROVINTRA                   ,
       CTOPAGOF                       ,
       CTOEFECTOSCOMERCIALES          ,
       CTODEUDASDESCUENTOS            ,
       CTOREMESAEFECTOS               ,
       CTODTOPPV                      ,
       CTODTOPPC                      ,
       CTORETPROF                     ,
       CTORETARRE                     ,
       CTOHACIVA                      ,
       CTOCOBRO                       ,
       CTOPAGO                        ,
       SCTADESCUENTO                  ,
       CTODESCUENTO                   ,
       CTONOME                        ,
       CTONOMT                        ,
       SCTANOMIRPF                    ,
       SCTANOMPAGO                    ,
       SCTANOMSSE                     ,
       SCTANOMSST                     ,
       SCTANOMCARGO                   ,
       TANTORETPROF                   ,
       TANTORETARRE                   ,
       TELEFONO                       ,
       FAX                            ,
       DOCIMPRIMIR                    ,
       SIGLAVIA                       ,
       NUMEROCALLE                    ,
       ESCALERA                       ,
       PISO                           ,
       PUERTA                         ,
       CCC                            ,
       CODADMON                       ,
       GESTIONA_CARTERA_EFECTOS       ,
       FILTRO_ASIENTOS_INICIO         ,
       INCLUIR_ABREV                  ,
       ASIENTOS_INICIO_INTERVALO_BQDA ,
       ASIENTOS_FIN_INTERVALO_BQDA    ,
       MOSTRAR_FILTRO_MAYOR           ,
       ASIENTO_INICIO_INTERVALO_FILTRO,
       ASIENTO_FIN_INTERVALO_FILTRO   ,
       ASIENTO_NOMINA_INDIVIDUAL      ,
       BUSQUEDA_SUBCTAS               ,
       SCTAOTRASREMUN                 ,
       DESCPROV_CARTERAEFECTOS        ,
       DESCCLI_CARTERAEFECTOS         ,
       TIPOEMPRESA                    ,
       FILTROSUBCTAS                  ,
       OFFICE2003                     ,
       TRATASERIE                     ,
       ACTCOMENTARIO
FROM PARAMETROS

