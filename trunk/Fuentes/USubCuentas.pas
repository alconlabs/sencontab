unit USubCuentas;
interface
uses Buttons, Classes, ComCtrls, ComObj, Controls, Chart, Db, DBClient, DBCtrls, DBChart, DBTables, Dialogs,
     ExtCtrls, fcButton, fcImage, fcimageform, fcImgBtn, fcpanel, Forms, Graphics, Grids, IBCustomDataSet,
     IBDatabase, IBQuery, IBSQL, IBTableSet, jpeg, Mask, Menus, Messages, navegadorNotarios, OvcBase,
     OvcDbDat, OvcDbNF, OvcDbPF, OvcEdCal, OvcEditF, OvcEdPop, OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, ppCache,
     ppComm, ppDB, ppDBPipe, ppRelatv, Series, StdCtrls, SysUtils, TeEngine, TeeProcs, Windows,
     word_tlb, wwcheckbox, Wwdbcomb, wwdbdatetimepicker, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, Wwdbspin,
     Wwdotdot, wwSpeedButton, Wwtable, xprocs, CustomView;

type
   TWSubCuentas = class(TCustomView)
      Paginas:        TOvcNotebook;
      BtnNavAnadir:   TfcImageBtn;
      BtnNavBorrar:   TfcImageBtn;
      BtnEdtAceptar:  TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      BtnNavCerrar:   TfcImageBtn;
      Label2:         TLabel;
      Shape1:         TShape;
      BtnNavListados: TfcImageBtn;
      QFichero:       TIBTableSet;
      Transaccion:    TIBTransaction;
      CDSFiltro:      TClientDataSet;
      DSFiltro:       TDataSource;
      OvcController1: TOvcController;
      FiltroBuscar:   TGroupBox;
      Label1:         TLabel;
      Label12:        TLabel;
      FiltroBDescripcion: TOvcDbPictureField;
      GroupBox1:      TGroupBox;
      Label3:         TLabel;
      NavAnimate:     TAnimate;
      SpFiltro:       TSpeedButton;
      OvcDescripcion: TOvcDbPictureField;
      Label30:        TLabel;
      Panel5:         TPanel;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Rejilla:        TwwDBGrid;
      fcImageBtnMinimizar: TfcImageBtn;
      fcIBCerrar:     TfcImageBtn;
      Navegador:      TDBNavegadorNotarios;
      DSFichero:      TDataSource;
      FiltroBSubCuenta: TOvcDbPictureField;
      OvcSubCuenta:   TOvcDbPictureField;
      ComboContrapartida: TwwDBLookupCombo;
      ComboContrapartidaDesc: TwwDBLookupCombo;
      Label4:         TLabel;
      PaginasInterno: TOvcNotebook;
      GroupBox2:      TGroupBox;
      GroupBox3:      TGroupBox;
      OvcDbNumericField3: TOvcDbNumericField;
      OvcDbNumericField1: TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      OvcDbNumericField4: TOvcDbNumericField;
      OvcDbNumericField5: TOvcDbNumericField;
      OvcDbNumericField6: TOvcDbNumericField;
      GroupBox4:      TGroupBox;
      OvcDbNumericField7: TOvcDbNumericField;
      OvcDbNumericField8: TOvcDbNumericField;
      OvcDbNumericField9: TOvcDbNumericField;
      OvcDbNumericField10: TOvcDbNumericField;
      OvcDbNumericField11: TOvcDbNumericField;
      OvcDbNumericField12: TOvcDbNumericField;
      Label6:         TLabel;
      Label7:         TLabel;
      Label8:         TLabel;
      Label9:         TLabel;
      Label10:        TLabel;
      Label11:        TLabel;
      GroupBox5:      TGroupBox;
      Label13:        TLabel;
      Label14:        TLabel;
      Label15:        TLabel;
      Label16:        TLabel;
      Label17:        TLabel;
      Label18:        TLabel;
      GroupBox6:      TGroupBox;
      OvcDbNumericField13: TOvcDbNumericField;
      OvcDbNumericField14: TOvcDbNumericField;
      OvcDbNumericField15: TOvcDbNumericField;
      OvcDbNumericField16: TOvcDbNumericField;
      OvcDbNumericField17: TOvcDbNumericField;
      OvcDbNumericField18: TOvcDbNumericField;
      GroupBox7:      TGroupBox;
      OvcDbNumericField19: TOvcDbNumericField;
      OvcDbNumericField20: TOvcDbNumericField;
      OvcDbNumericField21: TOvcDbNumericField;
      OvcDbNumericField22: TOvcDbNumericField;
      OvcDbNumericField23: TOvcDbNumericField;
      OvcDbNumericField24: TOvcDbNumericField;
      OvcDbNumericField25: TOvcDbNumericField;
      OvcDbNumericField26: TOvcDbNumericField;
      Label19:        TLabel;
      Label20:        TLabel;
      GroupBox8:      TGroupBox;
      Label21:        TLabel;
      Label22:        TLabel;
      Label23:        TLabel;
      Label24:        TLabel;
      Label25:        TLabel;
      Label26:        TLabel;
      GroupBox9:      TGroupBox;
      OvcDbNumericField27: TOvcDbNumericField;
      OvcDbNumericField28: TOvcDbNumericField;
      OvcDbNumericField29: TOvcDbNumericField;
      OvcDbNumericField30: TOvcDbNumericField;
      OvcDbNumericField31: TOvcDbNumericField;
      OvcDbNumericField32: TOvcDbNumericField;
      GroupBox10:     TGroupBox;
      OvcDbNumericField33: TOvcDbNumericField;
      OvcDbNumericField34: TOvcDbNumericField;
      OvcDbNumericField35: TOvcDbNumericField;
      OvcDbNumericField36: TOvcDbNumericField;
      OvcDbNumericField37: TOvcDbNumericField;
      OvcDbNumericField38: TOvcDbNumericField;
      GroupBox11:     TGroupBox;
      Label27:        TLabel;
      Label28:        TLabel;
      Label29:        TLabel;
      Label31:        TLabel;
      Label32:        TLabel;
      Label33:        TLabel;
      GroupBox12:     TGroupBox;
      OvcDbNumericField39: TOvcDbNumericField;
      OvcDbNumericField40: TOvcDbNumericField;
      OvcDbNumericField41: TOvcDbNumericField;
      OvcDbNumericField42: TOvcDbNumericField;
      OvcDbNumericField43: TOvcDbNumericField;
      OvcDbNumericField44: TOvcDbNumericField;
      GroupBox13:     TGroupBox;
      OvcDbNumericField45: TOvcDbNumericField;
      OvcDbNumericField46: TOvcDbNumericField;
      OvcDbNumericField47: TOvcDbNumericField;
      OvcDbNumericField48: TOvcDbNumericField;
      OvcDbNumericField49: TOvcDbNumericField;
      OvcDbNumericField50: TOvcDbNumericField;
      OvcDbNumericField51: TOvcDbNumericField;
      OvcDbNumericField52: TOvcDbNumericField;
      Label34:        TLabel;
      Label35:        TLabel;
      GroupBox14:     TGroupBox;
      Label37:        TLabel;
      Label38:        TLabel;
      eNIF:           TOvcDbPictureField;
      ComboProvincia: TwwDBLookupCombo;
      OvcDbPictureField1: TOvcDbPictureField;
      OvcDbPictureField3: TOvcDbPictureField;
      OvcDbPictureField5: TOvcDbPictureField;
      Label36:        TLabel;
      Label40:        TLabel;
      Label41:        TLabel;
      Label42:        TLabel;
      OvcDbPictureField6: TOvcDbPictureField;
      Label43:        TLabel;
      OvcDbPictureField7: TOvcDbPictureField;
      Label44:        TLabel;
      GBIVA:          TGroupBox;
      Label46:        TLabel;
      Label52:        TLabel;
      Label53:        TLabel;
      DBLIVA:         TwwDBLookupCombo;
      OvcDbNumericField53: TOvcDbNumericField;
      OvcDbNumericField54: TOvcDbNumericField;
      QFicheroSaldo:  TFloatField;
      QIVAR:          TIBDataSet;
      QIVAS:          TIBDataSet;
      QIVARTIPO:      TIBStringField;
      QIVARDESCRIPCION: TIBStringField;
      DBCheckBox5:    TDBCheckBox;
      BtnNavModificar: TfcImageBtn;
      QFicheroACUDB01: TFloatField;
      QFicheroACUDB02: TFloatField;
      QFicheroACUDB03: TFloatField;
      QFicheroACUDB04: TFloatField;
      QFicheroACUDB05: TFloatField;
      QFicheroACUDB06: TFloatField;
      QFicheroACUDB07: TFloatField;
      QFicheroACUDB08: TFloatField;
      QFicheroACUDB09: TFloatField;
      QFicheroACUDB10: TFloatField;
      QFicheroACUDB11: TFloatField;
      QFicheroACUDB12: TFloatField;
      QFicheroACUHB01: TFloatField;
      QFicheroACUHB02: TFloatField;
      QFicheroACUHB03: TFloatField;
      QFicheroACUHB04: TFloatField;
      QFicheroACUHB05: TFloatField;
      QFicheroACUHB06: TFloatField;
      QFicheroACUHB07: TFloatField;
      QFicheroACUHB08: TFloatField;
      QFicheroACUHB09: TFloatField;
      QFicheroACUHB10: TFloatField;
      QFicheroACUHB11: TFloatField;
      QFicheroACUHB12: TFloatField;
      QFicheroANTDB:  TFloatField;
      QFicheroANTDB01: TFloatField;
      QFicheroANTDB02: TFloatField;
      QFicheroANTDB03: TFloatField;
      QFicheroANTDB04: TFloatField;
      QFicheroANTDB05: TFloatField;
      QFicheroANTDB06: TFloatField;
      QFicheroANTDB07: TFloatField;
      QFicheroANTDB08: TFloatField;
      QFicheroANTDB09: TFloatField;
      QFicheroANTDB10: TFloatField;
      QFicheroANTDB11: TFloatField;
      QFicheroANTDB12: TFloatField;
      QFicheroANTHB:  TFloatField;
      QFicheroANTHB01: TFloatField;
      QFicheroANTHB02: TFloatField;
      QFicheroANTHB03: TFloatField;
      QFicheroANTHB04: TFloatField;
      QFicheroANTHB05: TFloatField;
      QFicheroANTHB06: TFloatField;
      QFicheroANTHB07: TFloatField;
      QFicheroANTHB08: TFloatField;
      QFicheroANTHB09: TFloatField;
      QFicheroANTHB10: TFloatField;
      QFicheroANTHB11: TFloatField;
      QFicheroANTHB12: TFloatField;
      QFicheroARRENDADOR: TIBStringField;
      QFicheroCONTRAPARTIDA: TIBStringField;
      QFicheroDESCRIPCION: TIBStringField;
      QFicheroDIRECCION: TIBStringField;
      QFicheroFAX:    TIBStringField;
      QFicheroIVA:    TFloatField;
      QFicheroPROFESIONAL: TIBStringField;
      QFicheroRECARGO: TFloatField;
      QFicheroSUBCUENTA: TIBStringField;
      QFicheroSUMADB: TFloatField;
      QFicheroSUMAHB: TFloatField;
      QFicheroTELEFONO: TIBStringField;
      QFicheroTIPOIVA: TIBStringField;
      QFicheroDIRECCION1: TIBStringField;
      QFicheroNIF:    TIBStringField;
      QFicheroCODPOSTAL: TIBStringField;
      QFicheroPOBLACION: TIBStringField;
      QFicheroPROVINCIA: TIBStringField;
      QFicheroPAIS:   TIBStringField;
      QFicheroNUMERO: TIBStringField;
      DBCheckBox1:    TDBCheckBox;
      OvcDbPictureField4: TOvcDbPictureField;
      OvcDbPictureField8: TOvcDbPictureField;
      Label5:         TLabel;
      ePais:          TwwDBLookupCombo;
      GroupBox15:     TGroupBox;
      GroupBox16:     TGroupBox;
      Label39:        TLabel;
      Label45:        TLabel;
      Label47:        TLabel;
      Label48:        TLabel;
      GroupBox17:     TGroupBox;
      Label49:        TLabel;
      DBRadioGroup1:  TDBRadioGroup;
      wwDBSpinEdit1:  TwwDBSpinEdit;
      GroupBox18:     TGroupBox;
      Label50:        TLabel;
      Label51:        TLabel;
      Label54:        TLabel;
      wwDBLookupCombo5: TwwDBLookupCombo;
      wwDBLookupCombo6: TwwDBLookupCombo;
      wwDBLookupCombo7: TwwDBLookupCombo;
      wwDBLookupCombo8: TwwDBLookupCombo;
      wwDBLookupCombo9: TwwDBLookupCombo;
      wwDBLookupCombo10: TwwDBLookupCombo;
      GroupBox19:     TGroupBox;
      Label55:        TLabel;
      Label56:        TLabel;
      wwDBLookupCombo11: TwwDBLookupCombo;
      wwDBLookupCombo12: TwwDBLookupCombo;
      OvcDbPictureField9: TOvcDbPictureField;
      GroupBox20:     TGroupBox;
      GroupBox21:     TGroupBox;
      Label57:        TLabel;
      Label58:        TLabel;
      Label59:        TLabel;
      eVCOMPRA:       TOvcDbNumericField;
      eVRESIDUAL:     TOvcDbNumericField;
      eVAMOR:         TOvcDbNumericField;
      GroupBox22:     TGroupBox;
      Label60:        TLabel;
      Label61:        TLabel;
      eVEJPINICIO:    TOvcDbNumericField;
      eVEJPAMOR:      TOvcDbNumericField;
      GroupBox23:     TGroupBox;
      Label62:        TLabel;
      Label63:        TLabel;
      eVEJAINICIO:    TOvcDbNumericField;
      eVEJAAMOR:      TOvcDbNumericField;
      PGCartas:       TOvcNotebook;
      LBPago:         TLabel;
      LBCheque:       TLabel;
      LBCtoD:         TLabel;
      LBCtoH:         TLabel;
      LbFechaAsiento: TLabel;
      ePermDBLSubDes: TwwDBLookupCombo;
      ePermDBLCtoDDes: TwwDBLookupCombo;
      ePermDBLCtoHDes: TwwDBLookupCombo;
      ePermDBLCtoD:   TwwDBLookupCombo;
      ePermDBLCtoH:   TwwDBLookupCombo;
      ePermDBLSub:    TwwDBLookupCombo;
      GroupBox24:     TGroupBox;
      ePermTotalImporte: TOvcNumericField;
      QAmortiza:      TIBTableSet;
      DsAmortiza:     TDataSource;
      cFCompra:       TwwDBDateTimePicker;
      cFInicio:       TwwDBDateTimePicker;
      cFUltAmor:      TwwDBDateTimePicker;
      cFBaja:         TwwDBDateTimePicker;
      QAmortizaSUBCUENTA: TIBStringField;
      QAmortizaCENTROCOSTE: TIBStringField;
      QAmortizaFCOMPRA: TDateTimeField;
      QAmortizaFINICIO: TDateTimeField;
      QAmortizaFULTAMOR: TDateTimeField;
      QAmortizaFFINAMOR: TDateTimeField;
      QAmortizaFBAJA: TDateTimeField;
      QAmortizaSUBGASTO: TIBStringField;
      QAmortizaSUBAMOR: TIBStringField;
      QAmortizaPERIODO: TIBStringField;
      QAmortizaANUAL: TFloatField;
      QAmortizaPROVEEDOR: TIBStringField;
      QAmortizaFACTURA: TIBStringField;
      QAmortizaVCOMPRA: TFloatField;
      QAmortizaVRESIDUAL: TFloatField;
      QAmortizaVAMOR: TFloatField;
      QAmortizaVEJPINICIO: TFloatField;
      QAmortizaVEJAINICIO: TFloatField;
      QAmortizaVEJPAMOR: TFloatField;
      QAmortizaVEJAAMOR: TFloatField;
      QAmortizaCLASE: TFloatField;
      QFicheroFORMAPAGO: TIBStringField;
      QFicheroDIAPAGO1: TSmallintField;
      QFicheroDIAPAGO2: TSmallintField;
      QFicheroPRES01: TFloatField;
      QFicheroPRES02: TFloatField;
      QFicheroPRES03: TFloatField;
      QFicheroPRES04: TFloatField;
      QFicheroPRES05: TFloatField;
      QFicheroPRES06: TFloatField;
      QFicheroPRES07: TFloatField;
      QFicheroPRES08: TFloatField;
      QFicheroPRES09: TFloatField;
      QFicheroPRES10: TFloatField;
      QFicheroPRES11: TFloatField;
      QFicheroPRES12: TFloatField;
      QFicheroPRESTOT: TFloatField;
      QFicheroOBSOLETO: TIBStringField;
      GroupBox25:     TGroupBox;
      OvcDbNumericField62: TOvcDbNumericField;
      Label64:        TLabel;
      Label65:        TLabel;
      wwDBLookupCombo2: TwwDBLookupCombo;
      wwDBLookupCombo3: TwwDBLookupCombo;
      OvcDbNumericField63: TOvcDbNumericField;
      Label66:        TLabel;
      PopupMenuListados: TPopupMenu;
      DetalledeSubcuentas1: TMenuItem;
      Subcuentas1:    TMenuItem;
      QFicheroDESCFORMAPAGO: TStringField;
      QDiario:        TIBTableSet;
      DSDiario:       TDataSource;
      QDiarioID_DIARIO: TIntegerField;
      QDiarioAPUNTE:  TSmallintField;
      QDiarioASIENTO: TIntegerField;
      QDiarioBASEIMPONIBLE: TFloatField;
      QDiarioCOMENTARIO: TIBStringField;
      QDiarioCONTRAPARTIDA: TIBStringField;
      QDiarioDEBEHABER: TIBStringField;
      QDiarioFECHA:   TDateTimeField;
      QDiarioIMPORTE: TFloatField;
      QDiarioIVA:     TFloatField;
      QDiarioNIF:     TIBStringField;
      QDiarioMONEDA:  TIBStringField;
      QDiarioNUMEROFACTURA: TIBStringField;
      QDiarioRECARGO: TFloatField;
      QDiarioSUBCUENTA: TIBStringField;
      QDiarioPUNTEO:  TIBStringField;
      QDiarioASIENTOPUNTEO: TIntegerField;
      QDiarioPUNTEOIVA: TIBStringField;
      QDiarioID_CONCEPTOS: TIBStringField;
      QDiarioTIPODIARIO: TIBStringField;
      QDiarioCUENTA_ANALITICA: TIBStringField;
      QDiarioCUOTAIVA: TFloatField;
      QDiarioCUOTARECARGO: TFloatField;
      QDiarioDescApunte: TStringField;
      CDSFiltroCartas: TClientDataSet;
      DSFiltroCartas: TDataSource;
      ePermCNumCheque: TOvcDbPictureField;
      BTCarta:        TfcImageBtn;
      BTGenera:       TfcImageBtn;
      QProvincias:    TIBTableSet;
      QProvinciasNOMBRE: TIBStringField;
      QProvinciasPROVINCIA: TIBStringField;
      QProvinciasCODIGO: TIBStringField;
      QSubcuentaPago: TIBTableSet;
      QSubcuentaPagoSUBCUENTA: TIBStringField;
      QSubcuentaPagoDESCRIPCION: TIBStringField;
      ePermFechaHasta: TwwDBDateTimePicker;
      ePermFechaDesde: TwwDBDateTimePicker;
      ePermFechaAsiento: TwwDBDateTimePicker;
      Label67:        TLabel;
      Label68:        TLabel;
      Panel1:         TPanel;
      GridPermPago:   TwwDBGrid;
      SpeedButton1:   TSpeedButton;
      QDiarioDescConcepto: TStringField;
      DBText1:        TDBText;
      DBText2:        TDBText;
      Label69:        TLabel;
      Label70:        TLabel;
      FiltroBTitulo:  TOvcDbPictureField;
      FiltroBGrupo:   TOvcDbPictureField;
      QFicheroDIAPAGO3: TSmallintField;
      Label71:        TLabel;
      OvcDbNumericField64: TOvcDbNumericField;
      QFicheroABREVIATURA: TIBStringField;
      QDiarioABREVIATURA: TStringField;
      DBCheckBox2:    TDBCheckBox;
      DBCheckBox3:    TDBCheckBox;
      QFicheroINTRACOMUNITARIO: TIBStringField;
      PagGraficos:    TOvcNotebook;
      ChartActual:    TDBChart;
      Series1:        TBarSeries;
      ChartAnterior:  TDBChart;
      BarSeries1:     TBarSeries;
      ChartCompara:   TDBChart;
      BarSeries2:     TBarSeries;
      Series2:        TBarSeries;
      BtnPermImprimir: TfcImageBtn;
      wwExpandButton: TwwExpandButton;
      QMovimientos:   TIBTableSet;
      QMovimientosASIENTO: TIntegerField;
      QMovimientosFECHA: TDateTimeField;
      QMovimientosID_CONCEPTOS: TIBStringField;
      QMovimientosDescComentario: TStringField;
      QMovimientosDEBEHABER: TIBStringField;
      QMovimientosIMPORTE: TFloatField;
      QMovimientosCONTRAPARTIDA: TIBStringField;
      QMovimientosCOMENTARIO: TIBStringField;
      QMovimientosDESCCONCEPTO: TStringField;
      SMovimientos:   TDataSource;
      DesplegMovimientos: TwwDBGrid;
      QMovimientosTIPOASIENTO: TIntegerField;
      QMovimientosASIENTONOMINA: TIntegerField;
      QMovimientosNUMEROFACTURA: TIBStringField;
      Panel2:         TPanel;
      Formulario:     TfcImageForm;
      QDiarioTIPOASIENTO: TIntegerField;
      QDiarioASIENTONOMINA: TIntegerField;
      QDiarioEJERCICIO: TIntegerField;
      QDiarioSERIE:   TIBStringField;
      QMovimientosEJERCICIO: TIntegerField;
      QMovimientosSERIE: TIBStringField;
      Label73:        TLabel;
      FiltroBNif:     TOvcDbPictureField;
      BtnNavDuplicar: TfcImageBtn;
      QFicheroSUBCTARET: TIBStringField;
      Label74:        TLabel;
      ComboSuctaRet:  TwwDBLookupCombo;
      ComboDescSuctaRet: TwwDBLookupCombo;
      cbSubctaRet:    TCheckBox;
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnNavAnadirClick(Sender: TObject);
      procedure PaginasPageChanged(Sender: TObject; Index: Integer);
      procedure RejillaDblClick(Sender: TObject);
      procedure QFicheroBeforeOpen(DataSet: TDataSet);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure fcIBMinimizarClick(Sender: TObject);
      procedure BtnNavAnadirMouseEnter(Sender: TObject);
      procedure BtnNavAnadirMouseLeave(Sender: TObject);
      procedure QFicheroAfterEdit(DataSet: TDataSet);
      procedure FiltroBSubcuentaEnter(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnNavBorrarClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
         AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure FormShow(Sender: TObject);
      procedure CreateParams(var Params: TCreateParams); override;
      procedure BtnNavListadosClick(Sender: TObject);
      procedure SpFiltroClick(Sender: TObject);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure QAmortizaNewRecord(DataSet: TDataSet);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure Subcuentas1Click(Sender: TObject);
      procedure Subcuentas1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
         ARect: TRect; State: TOwnerDrawState);
      procedure DetalledeSubcuentas1Click(Sender: TObject);
      procedure BTCartaClick(Sender: TObject);
      procedure BTGeneraClick(Sender: TObject);
      procedure GridPermPagoMultiSelectRecord(Grid: TwwDBGrid; Selecting: Boolean;
         var Accept: Boolean);
      procedure SpeedButton1Click(Sender: TObject);
      procedure QDiarioCalcFields(DataSet: TDataSet);
      procedure QFicheroAfterScroll(DataSet: TDataSet);
      procedure GBIVAEnter(Sender: TObject);
      procedure OvcSubCuentaExit(Sender: TObject);
      procedure ePaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure eNIFExit(Sender: TObject);
      procedure BtnPermImprimirClick(Sender: TObject);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure DesplegMovimientosDblClick(Sender: TObject);
      procedure CalculoImportesAmortizaciones(Sender: TObject);
      procedure eVCOMPRAClick(Sender: TObject);
      procedure BtnNavDuplicarClick(Sender: TObject);
   private
      lAdd:         Boolean;
      CampoOrden:   String;
      FEsProveedor: Boolean;
      procedure ActivarTransacciones;
      procedure CrearFiltro;
      procedure CrearFiltroCartas;
      procedure EjecutarQIVAR;
      procedure EjecutarQIVAS;
      procedure InicializarFiltro;
      procedure PrepararQuery;
      procedure PrepararQueryDiario;
      procedure PrepararRefreshDiario;
      procedure PrepararQueryMovimientos;
      procedure RefrescarControles;
      procedure RellenaChart;
   public
   end;

var WSubCuentas: TWSubCuentas;

implementation
uses DM, DMConta, General, Globales, Letras, UCargaAsiento, UCargaRapidaNominas,
     MenuPrincipal;
{$R *.DFM}

const TabSubCuentas  = 0;
      TabDatos       = 1;
      TabAcumulados  = 2;
      TabGraficos    = 3;
      TabCartas      = 4;
      TabAmortiza    = 5;
      CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'La subcuenta seleccionada se encuentra referenciada en algún asiento.';

procedure TWSubCuentas.ActivarTransacciones;
var
   i: Word;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if (Components[i] is TibTransaction) then   begin
         TibTransaction(Components[i]).active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.add('Read_committed');
         TibTransaction(Components[i]).Params.add('Rec_version');
         TibTransaction(Components[i]).Params.add('Write');
         TibTransaction(Components[i]).active := True;
      end;
   end;
end;

procedure TWSubCuentas.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('BSubCuenta', ftString, 10, False);
         Add('BNif', ftString, 20, False);
         Add('BDescripcion', ftstring, 80, False);
         Add('BTitulo', ftString, 2, False);
         Add('BGrupo', ftString, 3, False);
      end;
      CreateDataSet;
      active := True;
      Append;
   end;
end;

procedure TWSubCuentas.CrearFiltroCartas;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltroCartas do begin
      active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('FECHADESDE', ftDateTime, 0, False);
         Add('FECHAHASTA', ftDateTime, 0, False);
         Add('FECHAASIENTO', ftDateTime, 0, False);
         Add('SUBCUENTA', ftString, 10, False);
         Add('CHEQUE', ftString, 15, False);
         Add('CONCEPTOD', ftVarBytes, 3, False);
         Add('CONCEPTOH', ftVarBytes, 3, False);
      end;
      CreateDataSet;
      active := True;

      Append;
      FieldByName('FECHADESDE').AsDateTime :=
         DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
      FieldByName('FECHAHASTA').AsDateTime :=
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
      FieldByName('SUBCUENTA').AsString    := DmRef.QParametros.FieldByName('SCTABANCO').AsString;
      FieldByName('CONCEPTOD').AsString    := DmRef.QParametros.FieldByName('CTOPAGO').AsString;
      FieldByName('CONCEPTOH').AsString    := DmRef.QParametros.FieldByName('CTOPAGO').AsString;
   end;
end;

procedure TWSubCuentas.EjecutarQIVAR;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIVAR, SelectSQL do begin
      Close;
      Clear;
      Add('SELECT * FROM IVAR ORDER BY DESCRIPCION');
      EnableControls;
      Open;
   end;

end;

procedure TWSubCuentas.EjecutarQIVAS;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIVAS, SelectSQL do begin
      Close;
      Clear;
      Add('SELECT * FROM IVAS ORDER BY DESCRIPCION');
      EnableControls;
      Open;
   end;
end;

procedure TWSubCuentas.InicializarFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('BSubCuenta').AsString   := DMRef.QParametros.FieldByName('FILTROSUBCTAS').AsString;
      FieldByName('BDescripcion').AsString := '';
      FieldByName('BNif').AsString         := '';
      FieldByName('BTitulo').AsString      := '';
      FieldByName('BGrupo').AsString       := '';
   end;
end;

procedure TWSubCuentas.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      DisableControls;
      Close;
      Clear;
      Add(' UPDATE SUBCTAS SET PAIS=:PAIS,CODPOSTAL=:CODPOSTAL,POBLACION=:POBLACION,');
      Add(' PROVINCIA=:PROVINCIA,SUMADB=:SUMADB,SUMAHB=:SUMAHB,ACUDB01=:ACUDB01,');
      Add(' ACUDB02=:ACUDB02,ACUDB03=:ACUDB03,ACUDB04=:ACUDB04,ACUDB05=:ACUDB05,');
      Add(' ACUDB06=:ACUDB06,ACUDB07=:ACUDB07,ACUDB08=:ACUDB08,ACUDB09=:ACUDB09,');
      Add(' ACUDB10=:ACUDB10,ACUDB11=:ACUDB11,ACUDB12=:ACUDB12,ACUHB01=:ACUHB01,');
      Add(' ACUHB02=:ACUHB02,ACUHB03=:ACUHB03,ACUHB04=:ACUHB04,ACUHB05=:ACUHB05,');
      Add(' ACUHB06=:ACUHB06,ACUHB07=:ACUHB07,ACUHB08=:ACUHB08,ACUHB09=:ACUHB09,');
      Add(' ACUHB10=:ACUHB10,ACUHB11=:ACUHB11,ACUHB12=:ACUHB12,ANTDB01=:ANTDB01,');
      Add(' ANTDB02=:ANTDB02,ANTDB03=:ANTDB03,ANTDB04=:ANTDB04,ANTDB05=:ANTDB05,');
      Add(' ANTDB06=:ANTDB06,ANTDB07=:ANTDB07,ANTDB08=:ANTDB08,ANTDB09=:ANTDB09,');
      Add(' ANTDB10=:ANTDB10,ANTDB11=:ANTDB11,ANTDB12=:ANTDB12,ANTHB01=:ANTHB01,');
      Add(' ANTHB02=:ANTHB02,ANTHB03=:ANTHB03,ANTHB04=:ANTHB04,ANTHB05=:ANTHB05,');
      Add(' ANTHB06=:ANTHB06,ANTHB07=:ANTHB07,ANTHB08=:ANTHB08,ANTHB09=:ANTHB09,');
      Add(' ANTHB10=:ANTHB10,ANTHB11=:ANTHB11,ANTHB12=:ANTHB12,ANTHB=:ANTHB,');
      Add(' ANTDB=:ANTDB,IVA=:IVA,RECARGO=:RECARGO,NUMERO=:NUMERO,OBSOLETO=:OBSOLETO,');
      Add(' CONTRAPARTIDA=:CONTRAPARTIDA,DESCRIPCION=:DESCRIPCION,TELEFONO=:TELEFONO,');
      Add(' FAX=:FAX,DIRECCION=:DIRECCION,TIPOIVA=:TIPOIVA,ARRENDADOR=:ARRENDADOR,');
      Add(' PROFESIONAL=:PROFESIONAL,DIRECCION1=:DIRECCION1,NIF=:NIF,');
      Add(' FORMAPAGO=:FORMAPAGO,DIAPAGO1=:DIAPAGO1,DIAPAGO2=:DIAPAGO2,DIAPAGO3=:DIAPAGO3,');
      Add(' PRES01=:PRES01,PRES02=:PRES02,PRES03=:PRES03,PRES04=:PRES04,PRES05=:PRES05,');
      Add(' PRES06=:PRES06,PRES07=:PRES07,PRES08=:PRES08,PRES09=:PRES09,PRES10=:PRES10,');
      Add(' PRES11=:PRES11,PRES12=:PRES12,PRESTOT=:PRESTOT,ABREVIATURA=:ABREVIATURA,');
      Add(' INTRACOMUNITARIO=:INTRACOMUNITARIO,SUBCTARET=:SUBCTARET,');
      Add(' Subcuenta=:subcuenta WHERE SUBCUENTA=:old_SUBCUENTA');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT S.* FROM SubCtas S WHERE S.SubCuenta IS NOT NULL');

      if CDSFiltro.FieldByName('BSubCuenta').AsString <> '' then   begin
         add('AND S.SubCuenta LIKE :BSubCuenta ');
      end
      else
      if CDSFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('AND Upper(S.Descripcion) LIKE Upper(:BDescripcion)');
      end
      else
      if CDSFiltro.FieldByName('BNif').AsString <> '' then   begin
         add('AND Upper(S.Nif) LIKE Upper(:BNif)');
      end
      else
      if CDSFiltro.FieldByName('BTitulo').AsString <> '' then   begin
         Add('AND SUBSTR(S.SUBCUENTA, 1, 3) IN');
         Add('         (SELECT C.CUENTA FROM CUENTAS C');
         Add('          WHERE C.CUENTA = SUBSTR(S.SUBCUENTA, 1, 3)');
         Add('                AND (C.GRUPO1 LIKE :TITULO OR C.GRUPO2 LIKE :TITULO))');
      end
      else
      if CDSFiltro.FieldByName('BGrupo').AsString <> '' then   begin
         Add('AND SUBSTR(S.SUBCUENTA, 1, 3) IN');
         Add('         (SELECT C.CUENTA FROM CUENTAS C');
         Add('          WHERE C.CUENTA = SUBSTR(S.SUBCUENTA, 1, 3)');
         Add('                AND (C.GRUPO1 LIKE :GRUPO OR C.GRUPO2 LIKE :GRUPO))');
      end;

      CampoOrden := UpperCase(Trim(CampoOrden));
      if CampoOrden <> '' then   begin
         Add('ORDER BY ' + CampoOrden);
      end
      else begin
         Add('ORDER BY Descripcion');
      end;

      // PARÁMETROS
      if CDSFiltro.FieldByName('BSubCuenta').AsString <> '' then   begin
         Params.byname('BSubCuenta').AsString :=
            Copy(CDSFiltro.FieldByName('BSubCuenta').AsString + '%', 1,
            CDSFiltro.FieldByName('BSubCuenta').Size);
      end

      else
      if CDSFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         Params.byname('BDescripcion').AsString :=
            Copy(CDSFiltro.FieldByName('BDescripcion').AsString + '%', 1,
            CDSFiltro.FieldByName('BDescripcion').Size);
      end
      else
      if CDSFiltro.FieldByName('BNif').AsString <> '' then   begin
         Params.byname('BNif').AsString :=
            Copy(CDSFiltro.FieldByName('BNif').AsString + '%', 1,
            CDSFiltro.FieldByName('BNif').Size);
      end
      else
      if CDSFiltro.FieldByName('BTitulo').AsString <> '' then   begin
         Params.ByName('Titulo').AsString := CDSFiltro.FieldByName('BTitulo').AsString + '%';
      end
      else
      if CDSFiltro.FieldByName('BGrupo').AsString <> '' then   begin
         Params.ByName('Grupo').AsString :=
            Copy(CDSFiltro.FieldByName('BGrupo').AsString + '%', 1,
            CDSFiltro.FieldByName('BGrupo').Size);
      end;

      Prepare;
      EnableControls;
      Open;

   end;
   SpFiltro.Flat := True;
end;

procedure TWSubCuentas.PrepararQueryDiario;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario, SelectSQL do begin
      Close;
      Clear;
      DataSource := DSFichero;
      Add('SELECT D.*, C.DESCRIPCION DESCCONCEPTO');
      Add('FROM DIARIO D, CONCEPTOS C');
      Add('WHERE');

      if (DmContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'C') or
         (DmContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'P') then   begin
         Add('   D.SUBCUENTA = :SUBCUENTA AND (D.PUNTEO IS NULL OR D.PUNTEO = "" OR PUNTEO = "N")');
         if CDSFiltroCartas.FieldByName('FECHADESDE').IsNull then   begin
            Add(' AND (D.FECHA IS NULL OR (D.FECHA >= :FECHADESDE AND D.FECHA <= :FECHAHASTA))');
         end
         else begin
            Add(' AND D.FECHA >= :FECHADESDE AND D.FECHA <= :FECHAHASTA');
         end;
         Add(' AND D.ID_CONCEPTOS = C.ID_CONCEPTOS');
         Add('ORDER BY D.FECHA, D.ASIENTO');

         ParamByName('FECHADESDE').AsDateTime := CDSFiltroCartas.FieldByName('FECHADESDE').AsDateTime;
         ParamByName('FECHAHASTA').AsDateTime := CDSFiltroCartas.FieldByName('FECHAHASTA').AsDateTime;
         ParamByName('SUBCUENTA').AsString    := CDSFiltroCartas.FieldByName('SUBCUENTA').AsString;
      end
      else begin
         Add(' D.ASIENTO IS NULL');
         Add(' AND D.ID_CONCEPTOS = C.ID_CONCEPTOS');
         Add('ORDER BY D.FECHA, D.ASIENTO');
      end;

      Prepare;
      Open;
   end;
end;

procedure TWSubCuentas.PrepararRefreshDiario;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario, RefreshSQL do begin
      Clear;
      Add('SELECT D.*, C.DESCRIPCION DESCCONCEPTO');
      Add('FROM DIARIO D, CONCEPTOS C');
      Add('WHERE');
      Add(' D.ID_DIARIO = ?ID_DIARIO AND');
      Add(' D.ID_CONCEPTOS = C.ID_CONCEPTOS');
      Add('ORDER BY D.FECHA, D.ASIENTO');
   end;
end;

procedure TWSubCuentas.PrepararQueryMovimientos;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QMovimientos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT');
      Add('   D.ASIENTO,D.FECHA,D.ID_CONCEPTOS, D.DEBEHABER,');
      Add('   D.CONTRAPARTIDA,D.COMENTARIO, D.SERIE, D.EJERCICIO,');
      Add('   C.DESCRIPCION DESCCONCEPTO, D.IMPORTE,');
      Add('   D.TIPOASIENTO, D.ASIENTONOMINA,D.NUMEROFACTURA');
      Add('FROM DIARIO D, CONCEPTOS C');
      Add('WHERE');
      //  Add('   D.FECHA >= :FECHAINI AND D.FECHA <= :FECHAFIN AND');
      Add('   D.FECHA >= :FECHAINI AND ');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS AND');
      Add('   D.SUBCUENTA = :SUBCUENTA');
      Add('ORDER BY D.FECHA, D.ASIENTO');
      Params.ByName('FECHAINI').AsDateTime :=
         DmRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
      //  Params.ByName('FECHAFIN').AsDateTime := DmRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
      Params.ByName('SUBCUENTA').AsString  := QFicheroSUBCUENTA.AsString;
      Prepare;
      EnableControls;
      Open;
   end;
end;

procedure TWSubCuentas.RefrescarControles;
begin
   FEsProveedor := (QFicheroSUBCUENTA.AsString <> '') and
      (DMRef.ExistenRegistros('CUENTAS', 'CUENTA = ' +
      Copy(QFicheroSUBCUENTA.AsString, 1, 3) + ' AND TIPOCUENTA = "P"'));

   ePermTotalImporte.AsFloat := 0;

   if FEsProveedor then   begin
      PGCartas.Pages[0].Caption := 'Pago a Proveedores';
   end
   else begin
      PGCartas.Pages[0].Caption := 'Reclamación a Clientes';
   end;

   BtGenera.Visible := FEsProveedor;
   ePermDBLSub.Visible := FEsProveedor;
   ePermDBLSubDes.Visible := FEsProveedor;
   ePermCNumCheque.Visible := FEsProveedor;
   LbFechaAsiento.Visible := FEsProveedor;
   ePermFechaAsiento.Visible := FEsProveedor;
   ePermDBLCtoD.Visible := FEsProveedor;
   ePermDBLCtoDDes.Visible := FEsProveedor;
   ePermDBLCtoH.Visible := FEsProveedor;
   ePermDBLCtoHDes.Visible := FEsProveedor;
   LBCtoD.Visible   := FEsProveedor;
   LBCtoH.Visible   := FEsProveedor;
   LBPago.Visible   := FEsProveedor;
   LBCheque.Visible := FEsProveedor;
   LBCtoD.Visible   := FEsProveedor;
   LBCtoH.Visible   := FEsProveedor;

   GridPermPago.SelectedList.Clear;

   QDiario.Refresh;
end;

procedure TWSubCuentas.RellenaChart;
var
   I: Integer;
   Grupo1, Grupo2: String;
begin
   Grupo1 := '';
   Grupo2 := '';
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      //TODO: Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT GRUPO1, GRUPO2 FROM CUENTAS WHERE CUENTA = :CUENTA');
      ParamByName('CUENTA').AsString := Copy(QFicheroSUBCUENTA.AsString, 1, 3);
      Open;
      if not EOF then   begin
         Grupo1 := FieldByName('GRUPO1').AsString;
         Grupo2 := FieldByName('GRUPO2').AsString;
      end;
      Close;
      Free;
   end;


   ChartActual.Title.Text.Clear;
   ChartActual.Title.Text.Add(gvNombreEmpresaMenu);

   ChartActual.Foot.Text.Clear;
   ChartActual.Foot.Text.Add(QFicheroSUBCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   ChartAnterior.Title.Text.Clear;
   ChartAnterior.Title.Text.Add(gvNombreEmpresaMenu);

   ChartAnterior.Foot.Text.Clear;
   ChartAnterior.Foot.Text.Add(QFicheroSUBCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   ChartCompara.Title.Text.Clear;
   ChartCompara.Title.Text.Add(gvNombreEmpresaMenu);

   ChartCompara.Foot.Text.Clear;
   ChartCompara.Foot.Text.Add(QFicheroSUBCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DMContaRef, QGraficos do begin
      EmptyDataSet;
      for I := 1 to 12 do begin
         Append;
         QGraficosNUMMES.AsInteger := I;
         case I of
            1: begin
               QGraficosMES.AsString     := 'Ene';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB01.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB01.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB01.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB01.AsFloat;
            end;
            2: begin
               QGraficosMES.AsString     := 'Feb';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB02.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB02.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB02.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB02.AsFloat;
            end;
            3: begin
               QGraficosMES.AsString     := 'Mar';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB03.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB03.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB03.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB03.AsFloat;
            end;
            4: begin
               QGraficosMES.AsString     := 'Abr';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB04.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB04.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB04.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB04.AsFloat;
            end;
            5: begin
               QGraficosMES.AsString     := 'May';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB05.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB05.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB05.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB05.AsFloat;
            end;
            6: begin
               QGraficosMES.AsString     := 'Jun';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB06.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB06.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB06.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB06.AsFloat;
            end;
            7: begin
               QGraficosMES.AsString     := 'Jul';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB07.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB07.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB07.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB07.AsFloat;
            end;
            8: begin
               QGraficosMES.AsString     := 'Ago';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB08.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB08.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB08.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB08.AsFloat;
            end;
            9: begin
               QGraficosMES.AsString     := 'Sep';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB09.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB09.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB09.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB09.AsFloat;
            end;
            10: begin
               QGraficosMES.AsString     := 'Oct';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB10.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB10.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB10.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB10.AsFloat;
            end;
            11: begin
               QGraficosMES.AsString     := 'Nov';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB11.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB11.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB11.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB11.AsFloat;
            end;
            12: begin
               QGraficosMES.AsString     := 'Dic';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB12.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB12.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB12.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB12.AsFloat;
            end;
            13: begin
               QGraficosMES.AsString     := 'Tot';
               QGraficosDEBEACT.AsFloat  :=
                  QFicheroACUDB01.AsFloat + QFicheroACUDB02.AsFloat +
                  QFicheroACUDB03.AsFloat + QFicheroACUDB04.AsFloat +
                  QFicheroACUDB05.AsFloat + QFicheroACUDB06.AsFloat +
                  QFicheroACUDB07.AsFloat + QFicheroACUDB08.AsFloat +
                  QFicheroACUDB09.AsFloat + QFicheroACUDB10.AsFloat +
                  QFicheroACUDB11.AsFloat + QFicheroACUDB12.AsFloat;
               QGraficosDEBEANT.AsFloat  :=
                  QFicheroANTDB01.AsFloat + QFicheroANTDB02.AsFloat +
                  QFicheroANTDB03.AsFloat + QFicheroANTDB04.AsFloat +
                  QFicheroANTDB05.AsFloat + QFicheroANTDB06.AsFloat +
                  QFicheroANTDB07.AsFloat + QFicheroANTDB08.AsFloat +
                  QFicheroANTDB09.AsFloat + QFicheroANTDB10.AsFloat +
                  QFicheroANTDB11.AsFloat + QFicheroANTDB12.AsFloat;
               QGraficosHABERACT.AsFloat :=
                  QFicheroACUHB01.AsFloat + QFicheroACUHB02.AsFloat +
                  QFicheroACUHB03.AsFloat + QFicheroACUHB04.AsFloat +
                  QFicheroACUHB05.AsFloat + QFicheroACUHB06.AsFloat +
                  QFicheroACUHB07.AsFloat + QFicheroACUHB08.AsFloat +
                  QFicheroACUHB09.AsFloat + QFicheroACUHB10.AsFloat +
                  QFicheroACUHB11.AsFloat + QFicheroACUHB12.AsFloat;
               QGraficosHABERANT.AsFloat :=
                  QFicheroANTHB01.AsFloat + QFicheroANTHB02.AsFloat +
                  QFicheroANTHB03.AsFloat + QFicheroANTHB04.AsFloat +
                  QFicheroANTHB05.AsFloat + QFicheroANTHB06.AsFloat +
                  QFicheroANTHB07.AsFloat + QFicheroANTHB08.AsFloat +
                  QFicheroANTHB09.AsFloat + QFicheroANTHB10.AsFloat +
                  QFicheroANTHB11.AsFloat + QFicheroANTHB12.AsFloat;
            end;
         end;    // case

         // Dividir entre 1000
   {   QGraficosDEBEANT.AsInteger := QGraficosDEBEANT.AsInteger div 1000;
      QGraficosDEBEACT.AsInteger := QGraficosDEBEACT.AsInteger div 1000;
      QGraficosHABERANT.AsInteger := QGraficosHABERANT.AsInteger div 1000;
      QGraficosHABERACT.AsInteger := QGraficosHABERACT.AsInteger div 1000;
    }
         // Situar cuentas
         if (Copy(Grupo1, 1, 1) = 'A') or (Copy(Grupo1, 1, 1) = 'D') or
            (Copy(Grupo2, 1, 1) = 'A') or (Copy(Grupo2, 1, 1) = 'D') then   begin
            // Debe
            QGraficosSALDOACT.AsFloat := RoundtoDecimal(QGraficosDEBEACT.AsFloat, 0, True);
            QGraficosSALDOANT.AsFloat := RoundToDecimal(QGraficosDEBEANT.AsFloat, 0, True);
         end
         else begin
            // Haber
            QGraficosSALDOACT.AsFloat := RoundToDecimal(QGraficosHABERACT.AsFloat, 0, True);
            QGraficosSALDOANT.AsFloat := RoundToDecimal(QGraficosHABERANT.AsFloat, 0, True);
         end;
         Post;
      end;   
   end;
end;

procedure TWSubCuentas.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWSubCuentas.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWSubCuentas.FormCreate(Sender: TObject);
begin
   screen.cursor  := crHourGlass;
   Paginas.Width  := 655;
   Paginas.Height := 430;

   ActivarTransacciones;
   CrearFiltro;
   InicializarFiltro;

   CrearFiltroCartas;

   CampoOrden := 'SubCuenta';
   PrepararQuery;
   PrepararQueryMovimientos;

   EjecutarQIVAR;
   EjecutarQIVAS;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAmortiza, SelectSql do begin
      Clear;
      CachedUpdates := True;
      DataSource    := DsFichero;
      add('select * from Amortiza');
      add('where Subcuenta=:subcuenta');
      prepare;
      Open;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QProvincias, SelectSQL do begin
      Close;
      Clear;
      DataSource := DSFichero;
      Add('SELECT * FROM PROVINCIAS WHERE PROVINCIA = :PROVINCIA');
      Prepare;
      Open;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentaPago, SelectSQL do begin
      Close;
      Clear;
      DataSource := DSFiltroCartas;
      Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
      Prepare;
      Open;
   end;

   Mode := fmView;

   OvcSubcuenta.MaxLength     := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   FiltroBSubcuenta.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   ePermDblSub.MaxLength      := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;

   Paginas.Pages[TabSubCuentas].Show;
   PaginasPageChanged(Self, TabSubcuentas);
   screen.cursor := crDefault;
end;

procedure TWSubCuentas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobación del filtro por número de cuenta
      if (FiltroBSubCuenta.Focused) and (Trim(FiltroBSubCuenta.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         CampoOrden := 'SubCuenta';
         PrepararQuery;
         Rejilla.SetFocus;
      end

      // Comprobación del filtro por Descripción de la cuenta
      else
      if (FiltroBDescripcion.Focused) and (Trim(FiltroBDescripcion.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         CampoOrden := 'Descripcion';
         PrepararQuery;
         Rejilla.SetFocus;
      end

      // Comprobación del filtro por Nif de la cuenta
      else
      if (FiltroBNif.Focused) and (Trim(FiltroBNif.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         CampoOrden := 'Nif';
         PrepararQuery;
         Rejilla.SetFocus;
      end


      // Comprobación del filtro por título
      else
      if (FiltroBTitulo.Focused) and (Trim(FiltroBTitulo.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         CampoOrden := 'SubCuenta';
         PrepararQuery;
         Rejilla.SetFocus;
      end

      // Comprobación del filtro por grupo
      else
      if (FiltroBGrupo.Focused) and (Trim(FiltroBGrupo.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         CampoOrden := 'SubCuenta';
         PrepararQuery;
         Rejilla.SetFocus;
      end

      //Si no es ninguno de los otros, dos pasamos al siguiente control
      else
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWSubCuentas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Anterior: Boolean;
   Salir:    Boolean;
begin
   case Key of
      VK_ESCAPE: begin
         Salir := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Salir := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Salir := False;
            end;
         end;
         if Salir then begin
            if TDataSet(Navegador.DataSource.DataSet).State in
               dsEditModes then begin
               BtnEdtCancelar.Click;
            end
            else begin
               BtnNavCerrar.Click;
            end;
         end;
      end;
      VK_SPACE: begin
         if (ActiveControl <> FiltroBSubCuenta) and (ActiveControl <>
            FiltroBDescripcion) and (Paginas.PageIndex <> TabCartas) and
            not (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then
         begin
            if not (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then begin
               Key := 0;
               RejillaDblClick(Self);
            end;
         end;
      end;
      VK_F2: begin
         if not (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then   begin
            BtnNavAnadir.Click;
         end;
      end;
      VK_F3: begin
         if TDataSet(Navegador.DataSource.DataSet).State in dsEditModes then begin
            BtnEdtAceptar.Click;
         end;
      end;
      VK_F4: begin
         if not (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then   begin
            RejillaDblClick(Self);
         end;
      end;
      VK_F5: begin
         if (ActiveControl is TwwDBLookupCombo) then begin
            TwwDBLookupCombo(ActiveControl).DropDown;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            TwwDBComboBox(ActiveControl).DropDown;
         end;
      end;
      VK_F12: begin
         if not (QFichero.State in dsEditModes) then begin
            SpFiltro.Click;
         end;
      end;
      VK_UP: begin
         Anterior := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBGrid) then begin
            Anterior := False;
         end;

         if Anterior then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
   end;
end;

procedure TWSubCuentas.BtnNavAnadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   lAdd := True;
   try
      cbSubctaRet.Visible := True;
      Paginas.PageIndex   := TabDatos;
      QFichero.Insert;
      OvcSubCuenta.SetFocus;
      Mode := fmEdit;
      Paginas.Pages[TabAmortiza].Pagevisible := False;
      PaginasPageChanged(Self, TabDatos);
   except
      raise;
      DatabaseError('Error al añadir una nueva Subcuenta.');
   end;
end;

procedure TWSubCuentas.PaginasPageChanged(Sender: TObject; Index: Integer);
begin
   case Index of
      TabDatos: begin
         BtnNavAnadir.Visible := not (QFichero.State in dsEditModes);
         BtnNavBorrar.Visible := not (QFichero.State in dsEditModes);

         DBLIva.ReadOnly := False;

         if empty(QFicheroSubcuenta.AsString) then   begin
            DBLIva.ReadOnly := True;
            exit;
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSQL.Create(nil), SQL do begin
            Clear;
            //TODO: database := DMRef.IBDSiamCont;
            add('select tipocuenta from cuentas');
            add('where cuenta = :cuenta');
            params.byname('cuenta').AsString := Copy(Trim(QFicheroSUBCUENTA.AsString), 1, 3);
            execquery;
            if (FieldByName('Tipocuenta').AsString = 'R') then   begin
               DBLIva.LookupTable := qivar;
               DBLIVA.LookupTable.EnableControls;
            end
            else
            if (FieldByName('Tipocuenta').AsString = 'S') then   begin
               DBLIva.LookupTable := qivas;
               DBLIVA.LookupTable.EnableControls;
            end
            else begin
               DBLIva.ReadOnly := True;
            end;
            Close;
            Free;
         end;
      end;

      TabAmortiza: begin
         if (QFichero.state in dseditmodes) then   begin
            if (QAmortiza.EOF) then begin
               QAmortiza.insert;
            end
            else begin
               QAmortiza.edit;
            end;
         end;
      end;
      TabCartas: begin
         DMContaRef.CrearTablaCorreo;
         PrepararRefreshDiario;
         PrepararQueryDiario;
         RefrescarControles;
      end;

      TabGraficos: begin
         RellenaChart;
      end;
   end;

   BtnPermImprimir.Visible := Paginas.PageIndex = TabGraficos;
end;

procedure TWSubCuentas.RejillaDblClick(Sender: TObject);
var
   valor: String;
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then  begin
      lAdd := False;
      try
         QFichero.Edit;
         Mode := fmEdit;
         cbSubctaRet.Visible := False;
         Paginas.PageIndex   := TabDatos;
         PaginasPageChanged(self, TabDatos);

         // Si la subcuenta no es del tipo de cuenta de Amort. material o inmaterial
         // no tendra datos y no puede entrar.
         Valor := DmRef.ObtenerValor('TIPOCUENTA', 'CUENTAS', 'CUENTA = ' +
            Copy(Trim(QFicheroSubcuenta.AsString), 1, 3));
         if (Valor <> 'M') and (Valor <> 'I') then   begin
            Paginas.Pages[TabAmortiza].Pagevisible := False;
         end;

         OvcDescripcion.SetFocus;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 +
                        'Puede estar en uso por otra persona.', mtInformation, [mbOK], 0);
      end;
   end;
end;

procedure TWSubCuentas.QFicheroBeforeOpen(DataSet: TDataSet);
begin
   QFichero.EnableControls;
end;

procedure TWSubCuentas.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroPROFESIONAL.AsString := 'N';
   QFicheroArrendador.AsString  := 'N';
   QFicheroObsoleto.AsString    := 'N';
   QFicheroPais.AsString        := 'ES';
   QFicheroINTRACOMUNITARIO.AsString := 'N';
end;

procedure TWSubCuentas.fcIBMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWSubCuentas.BtnNavAnadirMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWSubCuentas.BtnNavAnadirMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWSubCuentas.QFicheroAfterEdit(DataSet: TDataSet);
begin
   PaginasPageChanged(Self, TabDatos);
end;

procedure TWSubCuentas.FiltroBSubcuentaEnter(Sender: TObject);
begin
   if not (CDSFiltro.state in dseditmodes) then begin
      CDSFiltro.edit;
   end;
   CDSFiltro.FieldByName('BSubCuenta').AsString   := '';
   CDSFiltro.FieldByName('BDescripcion').AsString := '';
   CDSFiltro.FieldByName('BTitulo').AsString      := '';
   CDSFiltro.FieldByName('BNif').AsString         := '';
   CDSFiltro.FieldByName('BGrupo').AsString       := '';
end;

procedure TWSubCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      {$Message Warn 'Aparición de TCorreo'}
      DMContaRef.HCorreo.Active := False;
      Action := caFree;
      Formulario.Free;
      Formulario  := nil;
      WSubCuentas := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWSubCuentas.BtnNavBorrarClick(Sender: TObject);
var Subcta     :string;
    SubctaAmor :string;
    SubctaRet  :string;
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if QFichero.IsEmpty then begin
      Exit;
   end;

   if MessageDlg('¿Desea borrar esta subcuenta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then  begin
      try
         Subcta     := QFicheroSUBCUENTA.AsString;
         SubctaAmor := QAmortizaSUBAMOR.AsString;
         SubctaRet  := QFicheroSubctaRet.AsString;
         // Primero hay que borrar su registro de amortizaciones relacionados
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSql.Create(nil), sql do begin
            Close;
            //TODO: Database := DMRef.IBDSiamCont;
            Add('delete from amortiza where subcuenta=:subcuenta');
            parambyname('subcuenta').AsString := Subcta;
            ExecQuery;
            Transaction.CommitRetaining;
            Close;
            Clear;
            // Ahora se borra la subcuenta de retencion ventas
            Close;
            if not empty(SubctaRet) then   begin
               Add('delete from subctas where subcuenta=:subcuenta');
               parambyname('subcuenta').AsString := SubctaRet;
               ExecQuery;
               Transaction.CommitRetaining;
            end;
            // Ahora se borra la subcuenta de amortizacion
            Close;
            if not empty(Subctaamor) then   begin
               Add('delete from subctas where subcuenta=:subcuenta');
               parambyname('subcuenta').AsString := SubctaAmor;
               ExecQuery;
               Transaction.CommitRetaining;
               Close;
            end;
            Free;
         end;
         QFichero.Delete;
         QFichero.Transaction.CommitRetaining;
         DMContaRef.RefrescarSubcuentas(Subcta);

         // fibQueryRefresh(QFichero);
      except
         DatabaseError('No se ha podido borrar la subcuenta seleccionada.' + #13 +
            CADENA_BORRADO);
      end;
   end;
end;

procedure TWSubCuentas.BtnEdtAceptarClick(Sender: TObject);
var
   Subcta, cSubctaRet, cDescripcion, cNif: String;
begin
   Perform(wm_NextDlgCtl, 0, 0);

   // Quitar espacios de subcuenta
   QFicheroSubcuenta.AsString := Trim(QFicheroSubcuenta.AsString);
   cDescripcion := QFicheroDescripcion.AsString;
   cNif         := QFicheroNif.AsString;

   if Length(QFicheroSUBCUENTA.AsString) < DMRef.QParametros.FieldByName(
      'LONGITUD_SUBCUENTAS').AsInteger then  begin
      OvcSubCuenta.SetFocus;
      DatabaseError('La longitud de subcuenta es menor de ' +
         DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
         ' caracteres.');
   end;

   // Comprobar si existe la cuenta a la que pertenece la subcuenta
   if not DMRef.ExistenRegistros('CUENTAS', 'CUENTA = "' +
      Copy(QFicheroSUBCUENTA.AsString, 1, 3) + '"') then   begin
      DatabaseError('No existe la cuenta ' + Copy(QFicheroSUBCUENTA.AsString, 1, 3) +
         ' a la que pertenece la subcuenta seleccionada.');
   end;

   try
      if cbSubctaRet.Checked then   begin
         QFichero.FieldByName('SubctaRet').AsString := '434' + Copy(QFichero.FieldByName('Subcuenta').AsString, 4, 7);
      end;
      QFichero.DisableControls;
      QFichero.Post;
      Subcta := QFicheroSUBCUENTA.AsString;
      QFichero.Transaction.CommitRetaining;
      QAmortiza.ApplyUpdates;
      QAmortiza.Transaction.CommitRetaining;
      QFichero.EnableControls;
   except
      DatabaseError('Error al guardar datos de la Subcuenta.' + #13 +
         'Puede estar duplicada');
      QFichero.EnableControls;
   end;

   if lAdd then  begin
      if not (cdsfiltro.state in dseditmodes) then begin
         cdsfiltro.edit;
      end;
      cdsfiltro.FieldByName('BSubcuenta').AsString :=
         QFichero.FieldByName('Subcuenta').AsString;
      if cbSubctaRet.Checked then   begin
         cSubctaRet := '434' + Copy(QFichero.FieldByName('Subcuenta').AsString, 4, 7);
         Qfichero.insert;
         QFichero.FieldByName('Subcuenta').AsString   := cSubctaRet;
         QFichero.FieldByName('Descripcion').AsString := cDescripcion;
         QFichero.FieldByName('Nif').AsString         := cNif;
         Qfichero.post;
         QFichero.Transaction.CommitRetaining;
      end;
      PrepararQuery;
   end;

   DMContaRef.RefrescarSubcuentas(Subcta);
   Mode := fmView;
   cbSubctaRet.Visible := False;
   Paginas.Pages[TabSubCuentas].Show;
   PaginasPageChanged(Self, TabSubCuentas);
   Rejilla.SetFocus;
end;

procedure TWSubCuentas.BtnEdtCancelarClick(Sender: TObject);
begin
   if MessageDlg('¿Quiere anular los cambios realizados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Cancel;
      except DatabaseError('Error al cancelar la operación');
      end;

      Mode := fmView;
      Paginas.PageIndex := TabSubCuentas;
      PaginasPageChanged(Self, TabSubcuentas);
      cbSubctaRet.Visible := False;

      Rejilla.SetFocus;
   end;
end;

procedure TWSubCuentas.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(CampoOrden)) then   begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWSubCuentas.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'SUBCUENTA') or (UpperCase(AFieldName) = 'DESCRIPCION') then  begin
      CampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;

end;

procedure TWSubCuentas.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBSubCuenta.SetFocus;
end;

procedure TWSubCuentas.CreateParams(var Params: TCreateParams);
begin
   inherited;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with params do begin
      style          := (style or ws_popup) and not ws_dlgframe and not ws_clipchildren;
      doublebuffered := True;
   end;
end;

procedure TWSubCuentas.BtnNavListadosClick(Sender: TObject);
begin
   PopupMenuListados.Popup(Self.Left + BtnNavListados.Left,
      Self.Top + BtnNavListados.Top + BtnNavListados.Height - 5);
end;

procedure TWSubCuentas.SpFiltroClick(Sender: TObject);
begin
   if (CDSFiltro.State in dseditmodes) then begin
      CDSFiltro.post;
   end;

   NavAnimate.Active  := True;
   NavAnimate.Visible := True;

   FiltroBSubcuentaEnter(nil);

   PrepararQuery;

   NavAnimate.Visible := False;
   NavAnimate.Active  := False;
   Paginas.Pages[TabSubCuentas].Show;
   FiltroBuscar.SetFocus;
end;

procedure TWSubCuentas.fcImageBtnMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWSubCuentas.QFicheroCalcFields(DataSet: TDataSet);
begin
   QFicheroSALDO.AsFloat := QFicheroSUMADB.Value - QFicheroSUMAHB.Value;
end;

procedure TWSubCuentas.QAmortizaNewRecord(DataSet: TDataSet);
begin
   QAmortizaSubcuenta.AsString  := QFicheroSubcuenta.AsString;
   QAmortizaClase.AsInteger     :=
      StrToInt(Copy(Trim(QFicheroSubcuenta.AsString), 2, 2));
   QAmortizaPeriodo.AsString    := 'M';
   QAmortizaFCompra.AsDateTime  := date;
   QAmortizaFInicio.AsDateTime  := date;
   QAmortizaFUltAmor.AsDateTime := date;
   //QAmortizaFBaja.asdatetime:=-693594;
   QAmortizaVcompra.AsFloat     := QFicheroSumadb.AsFloat;

   QAmortizaVamor.AsFloat    :=
      QAmortizaVcompra.AsFloat - QAmortizaVresidual.AsFloat;
   QAmortizaVejpamor.AsFloat :=
      QAmortizaVamor.AsFloat - QAmortizaVejpinicio.AsFloat;
   QAmortizaVejaamor.AsFloat :=
      QAmortizaVejpamor.AsFloat - QAmortizaVejainicio.AsFloat;
end;

procedure TWSubCuentas.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWSubCuentas.Subcuentas1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LSubCuentas.rtm', DSFichero);
end;

procedure TWSubCuentas.Subcuentas1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
   ARect: TRect; State: TOwnerDrawState);
begin
   ACanvas.Brush.Color := gcClAplicacion;
   ACanvas.FillRect(ARect);
   ACanvas.Font.Color := clNavy;
   ACanvas.Font.Name  := 'Tahoma';
   ACanvas.TextRect(ARect, ARect.Left + 7, ARect.Top, TMenuItem(Sender).Caption);
end;

procedure TWSubCuentas.DetalledeSubcuentas1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LDetalleSubcuentas.rtm', DSFichero);
end;

procedure TWSubCuentas.BTCartaClick(Sender: TObject);
var
   nTotImporte, nImporte, nTotImpoDec, nTotImpo: Double;
   i, j:    Integer;
   Documento, Registro: String;
   FWord:   Variant;
   Fichero: TextFile;
begin
   Perform(wm_NextDlgCtl, 0, 0);
   AssignFile(Fichero, 'c:\correo.txt');
   Rewrite(Fichero);

   // Primero crear la cabecera del fichero la cual no se usa
   Registro := 'NOMBRE#SUBCUENTA#DIRECCION#POBLACION#CODPOSTAL#PROVINCIA#BANCO#CHEQUE#EJERCICIO#EMPRESA#TOTIMPORTE#EUROS#FECHAASIENTO#FECHA1#TEXTO1#IMPORTE1#FACTURA1#' + 'FECHA2#TEXTO2#IMPORTE2#FACTURA2#FECHA3#TEXTO3#IMPORTE3#FACTURA3#FECHA4#TEXTO4#IMPORTE4#FACTURA4#FECHA5#TEXTO5#IMPORTE5#FACTURA5#' + 'FECHA6#TEXTO6#IMPORTE6#FACTURA6#FECHA7#TEXTO7#IMPORTE7#FACTURA7#FECHA8#TEXTO8#IMPORTE8#FACTURA8#FECHA9#TEXTO9#IMPORTE9#FACTURA9#' + 'FECHA10#TEXTO10#IMPORTE10#FACTURA10#';
   Writeln(Fichero, Registro);

   // Segundo incluir registro
   Registro := QFicheroDESCRIPCION.AsString + '#' + QFicheroSUBCUENTA.AsString + '#' +
      QFicheroDIRECCION.AsString + ' ' + QFicheroDIRECCION1.AsString +
      ', ' + QFicheroNUMERO.AsString + '#' + QFicheroPOBLACION.AsString + '#' +
      QFicheroCODPOSTAL.AsString + '#';
   if not QProvincias.IsEmpty then begin
      Registro := Registro + QProvinciasNOMBRE.AsString + '#';
   end
   else begin
      Registro := Registro + ' ' + '#';
   end;
   if CDSFiltroCartas.FieldByName('SUBCUENTA').AsString <> '' then   begin
      Registro := Registro + DMContaRef.QSubCTABancoDesc.FieldByName('DESCRIPCION').AsString + '#';
   end
   else begin
      Registro := Registro + ' ' + '#';
   end;
   Registro := Registro + CDSFiltroCartas.FieldByName('CHEQUE').AsString + '#' +
      IntToStr(DateYear(DMRef.QParametros.FieldByName(
      'FECHA_INICIO_EJERCICIO').AsDateTime)) + '#' + DMRef.QParametros.FieldByName(
      'NOMBREFISCAL').AsString + '#';


   // Poner fechas, texto e importes
   nTotImporte := 0;
   nTotImpo    := 0;
   nTotImpoDec := 0;

   for i := 0 to GridPermPago.SelectedList.Count - 1 do begin
      QDiario.GotoBookmark(GridPermPago.SelectedList.items[i]);
      if QDiario.FieldByName('Debehaber').AsString = 'H' then  begin
         if FEsProveedor then   begin
            nImporte    := RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
            nTotImpo    := nTotImpo + nImporte;
            nTotImpoDec := nTotImpoDec + nImporte;
         end
         else begin
            nImporte    := (-1) * RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
            nTotImpo    := nTotImpo + nImporte;
            nTotImpoDec := nTotImpoDec + nImporte;
         end;
      end
      else begin
         if FEsProveedor then   begin
            nImporte    := (-1) * RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
            nTotImpo    := nTotImpo + nImporte;
            nTotImpoDec := nTotImpoDec + nImporte;
         end
         else begin
            nImporte    := RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
            nTotImpo    := nTotImpo + nImporte;
            nTotImpoDec := nTotImpoDec + nImporte;
         end;
      end;

      nTotImporte := nTotImporte + nImporte;
      if i = 9 then begin
         break;
      end;

   end;

   Registro := Registro + Format('%.2n', [nTotImporte]) + '#';
   if nTotImpo > 0 then begin
      Registro := Registro + UpperCase(Euros(nTotImpo, 'M')) + '#';
   end
   else begin
      Registro := Registro + 'cero#';
   end;

   Registro := Registro + CDSFiltroCartas.FieldByName('fechaAsiento').AsString + '#';
   if nTotImporte = 0 then begin
      DatabaseError('No ha seleccionado ningún registro.');
   end;

   for i := 0 to GridPermPago.SelectedList.Count - 1 do begin
      QDiario.GotoBookmark(GridPermPago.SelectedList.items[i]);
      if QDiario.FieldByName('Debehaber').AsString = 'H' then   begin
         if FEsProveedor then begin
            nImporte := RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
         end
         else begin
            nImporte := (-1) * RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
         end;
      end
      else begin
         if FEsProveedor then begin
            nImporte := (-1) * RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
         end
         else begin
            nImporte := RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
         end;
      end;
      Registro := Registro + QDiario.FieldByName('fecha').AsString + '#' +
         Copy(QDiarioDescApunte.AsString, 1, 40) + '#' + Format('%.2n', [nImporte]) + '#' +
         QDiarioNUMEROFACTURA.AsString + '#';
      if i = 9 then begin
         break;
      end;
   end;
   // Poner el resto de campos vacios
   if i < 9 then  begin
      for j := i to 9 do begin
         Registro := Registro + ' # # # #';
      end;
   end;
   Writeln(Fichero, Registro);
   CloseFile(Fichero);

   if FEsProveedor then begin
      Documento := DMRef.QParametros.FieldByName('DOCPROVEEDOR').AsString;
   end
   else begin
      Documento := DMRef.QParametros.FieldByName('DOCCLIENTE').AsString;
   end;

   Screen.Cursor := crHourGlass;

   try
      FWord := GetActiveOleObject('Word.Application');
   except
      FWord := CreateOleObject('Word.Application');
   end;

   FWord.Documents.Open(
      FileName := Documento,
      ConfirmConversions := False,
      ReadOnly := True, AddToRecentFiles := False, PasswordDocument := '',
      PasswordTemplate := '', Revert := False, WritePasswordDocument := '',
      WritePasswordTemplate := '', Format := wdOpenFormatAuto);

   FWord.ActiveDocument.MailMerge.MainDocumentType := 0;

   Screen.Cursor := crDefault;

   FWord.ActiveDocument.MailMerge.OpenDataSource(
      Name := 'c:\correo.txt',
      ConfirmConversions := False, ReadOnly := False, LinkToSource := True,
      AddToRecentFiles := False, PasswordDocument := '', PasswordTemplate := '',
      WritePasswordDocument := '', WritePasswordTemplate := '', Revert := False,
      Format := wdOpenFormatAuto, Connection := '',
      SQLStatement := '', SQLStatement1 := '');

   if DMRef.QParametros.FieldByName('DOCIMPRIMIR').AsString = 'S' then   begin
      FWord.activeDocument.MailMerge.Destination := wdSendToNewDocument;
      FWord.Visible := True;
   end
   else begin
      FWord.activeDocument.MailMerge.Destination := wdSendToPrinter;
   end;

   FWord.activeDocument.Mailmerge.MailAsAttachment       := False;
   FWord.activeDocument.Mailmerge.SuppressBlankLines     := True;
   FWord.activeDocument.Mailmerge.Datasource.FirstRecord := wdDefaultFirstRecord;
   FWord.activeDocument.Mailmerge.Datasource.LastRecord  := wdDefaultLastRecord;
   FWord.activeDocument.Mailmerge.Execute(Pause          := False);

   if DMRef.QParametros.FieldByName('DOCIMPRIMIR').AsString <> 'S' then   begin
      FWord.ActiveDocument.Close(wdDoNotSaveChanges);
   end;

   MessageDlg('Impresión de carta finalizada', mtInformation, [mbOK], 0);

   QDiario.Refresh;
end;

procedure TWSubCuentas.BTGeneraClick(Sender: TObject);
var
   i, nAsiento, nApunte:  Integer;
   nTotImporte, nImporte: Double;
   AbreviaturaSubcuenta, cDB, cComentario, cFactura, cCuentaAnalitica: String;
   QAbrevSubctas:         TIBQuery;
begin
   if QDiario.IsEmpty then   begin
      Exit;
   end;

   if GridPermPago.SelectedList.Count = 0 then   begin
      DatabaseError('No ha seleccionado ningún asiento.');
   end;

   // Confirmación
   if MessageDlg('¿Desea generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   Perform(wm_NextDlgCtl, 0, 0);

   if CDSFiltroCartas.FieldByName('FECHAASIENTO').IsNull then  begin
      ePermFechaAsiento.SetFocus;
      DatabaseError('No se puede dejar la fecha de asiento en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;
   if CDSFiltroCartas.FieldByName('SUBCUENTA').AsString = '' then  begin
      ePermDBLSub.SetFocus;
      DatabaseError('No se puede dejar la subcuenta de pago en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;
   if CDSFiltroCartas.FieldByName('CONCEPTOD').AsString = '' then  begin
      ePermDBLCtoD.SetFocus;
      DatabaseError('No se puede dejar el concepto debe en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;
   if CDSFiltroCartas.FieldByName('CONCEPTOH').AsString = '' then  begin
      ePermDBLCtoH.SetFocus;
      DatabaseError('No se puede dejar el concepto haber en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;


   ePermTotalImporte.AsFloat := 0;
   nAsiento := DMContaRef.ObtenerNumeroAsiento;
   { Control inicio programa }
   if nAsiento = 0 then   begin
      nAsiento := 1;
   end;

   nTotImporte := 0;
   nApunte     := 1;

   QAbrevSubctas := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAbrevSubctas, SQL do begin
      Close;
      //TODO: Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT SUBCUENTA, ABREVIATURA FROM SUBCTAS');
      Add('WHERE SUBCUENTA = :SUBCUENTA');
      ParamByName('SUBCUENTA').AsString := CDSFiltroCartas.FieldByName('SUBCUENTA').AsString;
      Open;

      AbreviaturaSubcuenta := FieldByName('ABREVIATURA').AsString;
      Close;
      Free;
   end;


   for i := 0 to GridPermPago.SelectedList.Count - 1 do begin
      QDiario.GotoBookmark(GridPermPago.SelectedList.items[i]);

      cCuentaAnalitica := QDiarioCUENTA_ANALITICA.AsString;
      nImporte         := RoundToDecimal(QDiarioIMPORTE.AsFloat, 2, True);
      cFactura         := QDiarioNUMEROFACTURA.AsString;
      cComentario      := QDiarioCOMENTARIO.AsString;

      if QDiarioDEBEHABER.AsString = 'D' then   begin
         cDB         := 'H';
         nTotImporte := nTotImporte - nImporte;
      end
      else begin
         cDB         := 'D';
         nTotImporte := nTotImporte + nImporte;
      end;


      QDiario.Edit;
      QDiarioPUNTEO.AsString := 'S';
      QDiario.Post;
      QDiario.Transaction.CommitRetaining;
      QDiario.Refresh;


      QDiario.Insert;
      QDiarioASIENTO.AsInteger := nAsiento;
      QDiarioAPUNTE.AsInteger  := nApunte;
      Inc(nApunte);
      QDiarioMONEDA.AsString           := 'E';
      QDiarioSUBCUENTA.AsString        := QFicheroSUBCUENTA.AsString;
      QDiarioCONTRAPARTIDA.AsString    := CDSFiltroCartas.FieldByName('SUBCUENTA').AsString;
      QDiarioFECHA.AsDateTime          := CDSFiltroCartas.FieldByName('FECHAASIENTO').AsDateTime;
      QDiarioDEBEHABER.AsString        := cDB;
      QDiarioCUENTA_ANALITICA.AsString := cCuentaAnalitica;
      QDiarioID_CONCEPTOS.AsString     := CDSFiltroCartas.FieldByName('CONCEPTOD').AsString;
      QDiarioIMPORTE.AsFloat           := nImporte;
      QDiarioNUMEROFACTURA.AsString    := cFactura;
      QDiarioCOMENTARIO.AsString       := cComentario;
      QDiarioPUNTEO.AsString           := 'S';
      QDiario.Post;
      QDiario.Transaction.CommitRetaining;
      QDiario.Refresh;

      QDiario.Freebookmark(GridPermPago.SelectedList.items[i]);
   end; // for

   // Apunte final
   QDiario.Insert;
   QDiarioASIENTO.AsInteger         := nAsiento;
   QDiarioAPUNTE.AsInteger          := nApunte;
   QDiarioMONEDA.AsString           := 'E';
   QDiarioSUBCUENTA.AsString        := CDSFiltroCartas.FieldByName('SUBCUENTA').AsString;
   QDiarioCONTRAPARTIDA.AsString    := QFicheroSUBCUENTA.AsString;
   QDiarioFECHA.AsDateTime          := CDSFiltroCartas.FieldByName('FECHAASIENTO').AsDateTime;
   QDiarioDEBEHABER.AsString        := 'H';
   QDiarioCUENTA_ANALITICA.AsString := cCuentaAnalitica;
   QDiarioID_CONCEPTOS.AsString     := CDSFiltroCartas.FieldByName('CONCEPTOH').AsString;
   QDiarioIMPORTE.AsFloat           := nTotImporte;
   QDiarioNUMEROFACTURA.AsString    := cFactura;
   QDiarioCOMENTARIO.AsString       := 'Ch: ' + CDSFiltroCartas.FieldByName('CHEQUE').AsString +
      ' ' + Trim(QFicheroDESCRIPCION.AsString);
   QDiarioPUNTEO.AsString           := '';
   QDiario.Post;
   QDiario.Transaction.CommitRetaining;
   QDiario.Refresh;

   MessageDlg('Generado asiento nº: ' + IntToStr(nAsiento), mtInformation, [mbOK], 0);

   // Limpiar lista
   GridPermPago.SelectedList.Clear;

   QDiario.Close;
   QDiario.Open;

   QDiario.Refresh;
end;

procedure TWSubCuentas.GridPermPagoMultiSelectRecord(Grid: TwwDBGrid; Selecting: Boolean;
   var Accept: Boolean);
var
   nPor: Integer;
begin
   nPor := 1;
   if FEsProveedor and (grid.datasource.dataset.FieldByName('debehaber').AsString = 'D') then   begin
      nPor := -1;
   end;
   if not FEsProveedor and (grid.datasource.dataset.FieldByName('debehaber').AsString = 'H') then   begin
      nPor := -1;
   end;

   if selecting then   begin
      ePermTotalImporte.AsFloat := ePermTotalImporte.AsFloat +
         (nPor * grid.datasource.dataset.FieldByName('importe').AsFloat);
   end
   else begin
      ePermTotalImporte.AsFloat := ePermTotalImporte.AsFloat -
         (nPor * grid.datasource.dataset.FieldByName('importe').AsFloat);
   end;
end;

procedure TWSubCuentas.SpeedButton1Click(Sender: TObject);
begin
   if CDSFiltroCartas.State in dsEditModes then   begin
      CDSFiltroCartas.Post;
   end;

   PrepararQueryDiario;
end;

procedure TWSubCuentas.QDiarioCalcFields(DataSet: TDataSet);
begin
   QDiarioDescApunte.AsString :=
      DMContaRef.GetDescripcionApunte(QDiarioDescConcepto.AsString,
                                      QDiarioNUMEROFACTURA.AsString,
                                      QDiarioSERIE.AsString,
                                      QDiarioEJERCICIO.AsInteger,
                                      QDiarioCOMENTARIO.AsString,
                                      QDiarioABREVIATURA.AsString);
end;

procedure TWSubCuentas.QFicheroAfterScroll(DataSet: TDataSet);
begin
   QFichero.EnableControls;
   if Paginas.PageIndex = TabCartas then  begin
      PrepararQueryDiario;
      RefrescarControles;
   end else
   if Paginas.PageIndex = TabGraficos then   begin
      RellenaChart;
   end;
end;

procedure TWSubCuentas.GBIVAEnter(Sender: TObject);
begin
   DBLIva.ReadOnly := False;

   if empty(QFicheroSubcuenta.AsString) then  begin
      DBLIva.ReadOnly := True;
      OvcSubCuenta.SetFocus;
      exit;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Clear;
      //TODO: database := DMRef.IBDSiamCont;
      add('select tipocuenta from cuentas');
      add('where cuenta = :cuenta');
      params.byname('cuenta').AsString := Copy(Trim(QFicheroSUBCUENTA.AsString), 1, 3);
      execquery;
      if (FieldByName('Tipocuenta').AsString = 'R') then   begin
         DBLIva.LookupTable := qivar;
         DBLIVA.LookupTable.EnableControls;
      end
      else
      if (FieldByName('Tipocuenta').AsString = 'S') then   begin
         DBLIva.LookupTable := qivas;
         DBLIVA.LookupTable.EnableControls;
      end
      else begin
         DBLIva.ReadOnly := True;
         OvcSubCuenta.SetFocus;
      end;
      Close;
      Free;
   end;
end;

procedure TWSubCuentas.OvcSubCuentaExit(Sender: TObject);
begin
   if (QFichero.State in dsEditModes) and
      ((DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'C') or
      (DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'P')) and
      (QFicheroPAIS.AsString = '') then  begin
      QFicheroPAIS.AsString := 'ES';
      eNIF.MaxLength        := 9;
   end
   else begin
      eNIF.MaxLength := 20;
   end;
end;

procedure TWSubCuentas.ePaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
   modified: Boolean);
begin
   if (QFichero.State in dsEditModes) and (QFicheroPAIS.AsString = 'ES') then   begin
      eNIF.MaxLength := 9;
   end
   else begin
      eNIF.MaxLength := 20;
   end;
end;

procedure TWSubCuentas.eNIFExit(Sender: TObject);
var
   NIF, Letra: String;
begin
   if QFicheroPAIS.AsString = 'ES' then  begin
      if QFichero.State in dsEditModes then   begin
         NIF := QFicheroNIF.AsString;
         if Empty(NIF) then   begin
            Exit;
         end;
         if NIF[1] in ['A'..'Z'] then   begin
            Exit;
         end;
         // chequeo del nif
         Letra := LetraNif(Copy(NIF, 1, 8));
         if Letra <> NIF[9] then   begin
            QFicheroNIF.AsString := Copy(NIF, 1, 8) + Letra;
         end;
      end;
   end;
end;

procedure TWSubCuentas.BtnPermImprimirClick(Sender: TObject);
begin
   if Paginas.PageIndex = TabGraficos then  begin
      if MessageDlg('¿Desea imprimir este gráfico?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         case PagGraficos.PageIndex of
            0: begin
               ChartActual.PrintLandscape;
            end;
            1: begin
               ChartAnterior.PrintLandscape;
            end;
            2: begin
               ChartCompara.PrintLandscape;
            end;
         end;
      end;
   end;
end;

procedure TWSubCuentas.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
         DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString,
                                         QMovimientosNUMEROFACTURA.AsString,
                                         QMovimientosSERIE.AsString,
                                         QMovimientosEJERCICIO.AsInteger,
                                         QMovimientosCOMENTARIO.AsString, '');
end;

procedure TWSubCuentas.DesplegMovimientosDblClick(Sender: TObject);
var
   Asiento, AsientoNomina, AsientoEmpresa: Integer;
begin
   if not QMovimientos.IsEmpty then  begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;

      // ASIENTO DE NÓMINA / SS EMPRESA
      if (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA) or
         (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_SSOCIAL_EMPRESA) then   begin
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
         WCargaAsiento.FAsiento      := QMovimientos.FieldByName('ASIENTO').AsInteger;

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

procedure TWSubCuentas.CalculoImportesAmortizaciones(Sender: TObject);
begin
   if QAmortiza.State in dsEditModes then  begin
      QAmortizaVAMOR.AsFloat    := QAmortizaVCOMPRA.AsFloat - QAmortizaVRESIDUAL.AsFloat;
      QAmortizaVEJPAMOR.AsFloat := QAmortizaVAMOR.AsFloat - QAmortizaVEJPINICIO.AsFloat;
      QAmortizaVEJAAMOR.AsFloat := QAmortizaVEJPAMOR.AsFloat - QAmortizaVEJAINICIO.AsFloat;
   end;
end;

procedure TWSubCuentas.eVCOMPRAClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWSubCuentas.BtnNavDuplicarClick(Sender: TObject);
var
   QOrigen: TibDataset;
   i:       Word;
   Campo:   String;
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   if MessageDlg('¿Quiere duplicar esta Subcuenta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try
         lAdd    := True;
         QOrigen := TibDataset.Create(nil);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QOrigen, selectSql do begin
            //TODO: Database    := DMRef.IBDSiamCont;
            Transaction := Transaccion;
            Clear;
            add('select * from subctas where subcuenta=:subcuenta');
            params.byname('Subcuenta').AsString := QFicheroSubcuenta.AsString;
            Open;

            QFichero.Insert;
            for i := 0 to fieldcount - 1 do begin
               Campo           := fields[i].fieldname;
               QFichero[campo] := QOrigen[campo];
            end;
            Close;
            Free;
         end;
         Paginas.PageIndex := TabDatos;
         OvcSubCuenta.SetFocus;
         Mode := fmEdit;
         Paginas.Pages[TabAmortiza].Pagevisible := False;
         PaginasPageChanged(Self, TabDatos);
      except
         raise;
         DatabaseError('Error al duplicar una Subcuenta.');
      end;
   end;
end;

end.
