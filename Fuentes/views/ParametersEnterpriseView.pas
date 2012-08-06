unit ParametersEnterpriseView;
interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
     DBCtrls, ExtCtrls, DB, Buttons, ComCtrls, DBClient, Mask,
     CustomView,
     DMParametersEnterprise;
type
  TParametersEnterpriseView = class(TCustomView)
    OpenDialog: TOpenDialog;
    PnlBtn: TPanel;
    Label89: TLabel;
    PageControl: TPageControl;
    TabSheetGeneral: TTabSheet;
    LabelNif: TLabel;
    LabelDireccion: TLabel;
    LabelPostal: TLabel;
    LabelPoblacion: TLabel;
    LabelProvincia: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label60: TLabel;
    lLongSubcuentas: TLabel;
    Label74: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EditNOMBREFISCAL: TDBEdit;
    EditNIF: TDBEdit;
    EditDIRECCION: TDBEdit;
    EditCODPOSTAL: TDBEdit;
    EditPOBLACION: TDBEdit;
    EditPROVINCIA: TDBLookupComboBox;
    EditTELEFONO: TDBEdit;
    EditCONTACTO: TDBEdit;
    EditFAX: TDBEdit;
    EditAsiento: TDBEdit;
    CheckBoxRECARGO: TDBCheckBox;
    EditLONGITUD_SUBCUENTAS: TDBEdit;
    GroupBox2: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    EditFECHA_INICIO_EJERCICIO: TDBEdit;
    EditFECHA_FIN_EJERCICIO: TDBEdit;
    EditFECHAAMORTIZACION: TDBEdit;
    EditFECHABLOQUEO: TDBEdit;
    EditSIGLAVIA: TDBEdit;
    EditNUMEROCALLE: TDBEdit;
    EditESCALERA: TDBEdit;
    EditPISO: TDBEdit;
    EditPUERTA: TDBEdit;
    EditCODADMON: TDBEdit;
    EditCCC: TDBEdit;
    CheckBoxGESTIONA_CARTERA_EFECTOS: TDBCheckBox;
    CheckBoxINCLUIR_ABREV: TDBCheckBox;
    GroupBox16: TGroupBox;
    Label76: TLabel;
    Label80: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    EditASIENTOS_INICIO_INTERVALO_BQDA: TDBEdit;
    EditASIENTOS_FIN_INTERVALO_BQDA: TDBEdit;
    EditASIENTO_INICIO_INTERVALO_FILTRO: TDBEdit;
    EditASIENTO_FIN_INTERVALO_FILTRO: TDBEdit;
    CheckBoxFILTRO_ASIENTOS_INICIO: TDBCheckBox;
    CheckBoxMOSTRAR_FILTRO_MAYOR: TDBCheckBox;
    RadioGroupBUSQUEDA_SUBCTAS: TDBRadioGroup;
    EditFILTROSUCUENTAS: TDBEdit;
    CheckBoxACTCOMENTARIO: TDBCheckBox;
    CheckBoxTRATASERIE: TDBCheckBox;
    TabSheetNominas: TTabSheet;
    GroupBox7: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    TextCTONOMT: TDBText;
    Label100: TLabel;
    TextSCTANOMSUELDO: TDBText;
    TextSCTANOMSUELDO_DS: TDBText;
    TextSCTANOMSST: TDBText;
    TextSCTANOMSST_DS: TDBText;
    TextSCTANOMIRPF: TDBText;
    TextSCTANOMIRPF_DS: TDBText;
    TextSCTANOMPAGO: TDBText;
    TextSCTANOMPAGO_DS: TDBText;
    EditCTONOMT: TDBLookupComboBox;
    CheckBoxASIENTO_NOMINA_INDIVIDUAL: TDBCheckBox;
    TextSCTAOTRASREMUN: TDBText;
    TextSCTAOTRASREMUN_DS: TDBText;
    GroupBox8: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label50: TLabel;
    TextCTONOME: TDBText;
    TextSCTANOMCARGO: TDBText;
    TextSCTANOMCARGO_DS: TDBText;
    TextSCTANOMSSE: TDBText;
    TextSCTANOMSSE_DS: TDBText;
    EditCTONOME: TDBLookupComboBox;
    TabSheetCierreEjercicio: TTabSheet;
    GroupBox12: TGroupBox;
    Label62: TLabel;
    GroupBox14: TGroupBox;
    Label63: TLabel;
    Label77: TLabel;
    TextCTO_REGULARIZACION: TDBText;
    TextCTO_REGULARIZACION_ESP: TDBText;
    EditCTO_REGULARIZACION: TDBLookupComboBox;
    EditCTO_REGULARIZACION_ESP: TDBLookupComboBox;
    GroupBox15: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    TextCTO_APERTURA_ESP: TDBText;
    TextCTO_APERTURA: TDBText;
    EditCTO_APERTURA: TDBLookupComboBox;
    EditCTO_APERTURA_ESP: TDBLookupComboBox;
    TextSUBCUENTA_CIERRE: TDBText;
    TextSUBCUENTA_CIERRE_DS: TDBText;
    TabSheetDocumentos: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    BtnDocCliente: TSpeedButton;
    BtnDocProveedor: TSpeedButton;
    BtnDoc347: TSpeedButton;
    EditDOCCLIENTE: TDBEdit;
    EditDOCPROVEEDOR: TDBEdit;
    EditDOC347: TDBEdit;
    DataSource: TDataSource;
    BtnCancel: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnModify: TSpeedButton;
    RadioGroupMONEDA: TDBRadioGroup;
    RadioGroupTIPOEMPRESA: TDBRadioGroup;
    BtnFECHA_INICIO_EJERCICIO: TSpeedButton;
    BtnFECHA_FIN_EJERCICIO: TSpeedButton;
    BtnFECHAAMORTIZACION: TSpeedButton;
    BtnFECHABLOQUEO: TSpeedButton;
    CBImprimir: TDBCheckBox;
    SProvincias: TDataSource;
    BtnSearchSCTANOMSUELDO: TSpeedButton;
    BtnSearchSCTANOMSST: TSpeedButton;
    BtnSearchSCTANOMPAGO: TSpeedButton;
    BtnSearchSCTAOTRASREMUN: TSpeedButton;
    BtnSearchSCTANOMIRPF: TSpeedButton;
    BtnSearchSCTANOMCARGO: TSpeedButton;
    BtnSearchSCTANOMSSE: TSpeedButton;
    BtnSearchSUBCUENTA_CIERRE: TSpeedButton;
    SConceptos: TDataSource;
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
  private
  public
  end;

implementation
uses InfAsientos;
{$R *.DFM}

procedure TParametersEnterpriseView.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := Mode = fmView;
end;

end.


