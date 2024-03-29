program Contabilidad;

{%ToDo 'Contabilidad.todo'}

uses
  Forms,
  ogfirst,
  Windows,
  DM in 'Fuentes\DM.pas' {DMRef: TDataModule},
  DMConta in 'Fuentes\DMConta.pas' {DMContaRef: TDataModule},
  DMBalances in 'Fuentes\DMBalances.pas' {DMBlnc: TDataModule},
  MenuPrincipal in 'Fuentes\MenuPrincipal.pas' {FormPrincipal},
  Globales in 'Fuentes\Globales.pas',
  General in 'Fuentes\General.pas',
  UTitulos in 'Fuentes\UTitulos.pas' {WTitulos},
  UCuentas in 'Fuentes\UCuentas.pas' {WCuentas},
  UNuevaSubcuenta in 'Fuentes\UNuevaSubcuenta.pas' {WNuevaSubcuenta},
  UConceptos in 'Fuentes\UConceptos.pas' {WConceptos},
  UCargaApuntes in 'Fuentes\UCargaApuntes.pas' {WCargaApuntes},
  UDiario in 'Fuentes\UDiario.pas' {WDiario},
  UTraspasoApuntes in 'Fuentes\UTraspasoApuntes.pas' {WTraspasoApuntes},
  UPlanAnalico in 'Fuentes\UPlanAnalico.pas' {WPlanAnalitico},
  UCargaAsiento in 'Fuentes\UCargaAsiento.pas' {WCargaAsiento},
  UCargaCobrosPagos in 'Fuentes\UCargaCobrosPagos.pas' {WCargaCobrosPagos},
  UCierreEjercicio in 'Fuentes\UCierreEjercicio.pas' {WCierreEjercicio},
  UEfectosComerciales in 'Fuentes\UEfectosComerciales.pas' {WEfectosComerciales},
  UTraspasoDatos in 'Fuentes\UTraspasoDatos.pas' {WTraspasoDatos},
  UBorradoDiario in 'Fuentes\UBorradoDiario.pas' {WBorradoDiario},
  UPunteoDiario in 'Fuentes\UPunteoDiario.pas' {WPunteoDiario},
  UCarteraEfectos in 'Fuentes\UCarteraEfectos.pas' {WCarteraEfectos},
  UAmortizaciones in 'Fuentes\UAmortizaciones.pas' {WAmortizaciones},
  UEmpresas in 'Fuentes\UEmpresas.pas' {FormEnterprises},
  UDetalleIVA in 'Fuentes\UDetalleIVA.pas' {WDetalleIVA},
  UEnlaceContable in 'Fuentes\UEnlaceContable.pas' {WEnlaceContable},
  UCargaRapidaNominas in 'Fuentes\UCargaRapidaNominas.pas' {WCargaRapidaNominas},
  UIVA300 in 'Fuentes\UIVA300.pas' {WIva300},
  UIrpf110 in 'Fuentes\UIrpf110.pas' {WIrpf110},
  UISoc202 in 'Fuentes\UISoc202.pas' {WISoc202},
  UCopiaAsientos in 'Fuentes\UCopiaAsientos.pas' {WCopiaAsientos},
  UBalAcumulados in 'Fuentes\UBalAcumulados.pas' {WBalAcumulados},
  UBalExplotacion in 'Fuentes\UBalExplotacion.pas' {WBalExplotacion},
  UVencimientos in 'Fuentes\UVencimientos.pas' {WVencimientos},
  USubCuentas in 'Fuentes\USubCuentas.pas' {WSubCuentas},
  UIrpf115 in 'Fuentes\UIrpf115.pas' {WIrpf115},
  UPlanContable in 'Fuentes\UPlanContable.pas' {WPlanContable},
  UCargaRapidaFacturas in 'Fuentes\UCargaRapidaFacturas.pas' {WCargaRapidaFacturas},
  URecalculoSaldos in 'Fuentes\URecalculoSaldos.pas' {WRecalculoSaldos},
  USituacionEfecto in 'Fuentes\USituacionEfecto.pas' {WSituacionEfecto},
  UPreviewForm in 'Fuentes\UPreviewForm.pas' {WPreviewForm},
  UUTilEmpresas in 'Fuentes\UUtilEmpresas.pas' {WUtilEmpresas},
  UActualizacionBD in 'Fuentes\UActualizacionBD.pas' {WActualizacionBD},
  UGeneracionAsiento in 'Fuentes\UGeneracionAsiento.pas' {WGeneracionAsiento},
  UCalculadora in 'Fuentes\UCalculadora.pas' {WCalculadora},
  UImportacion in 'Fuentes\UImportacion.pas' {WImportacion},
  UFiltroListadosAsientos in 'Fuentes\UFiltroListadosAsientos.pas' {WFiltroListadosAsientos},
  UFiltro347 in 'Fuentes\UFiltro347.pas' {WFiltro347},
  UFiltroMayorSubcuenta in 'Fuentes\UFiltroMayorSubcuenta.pas' {WFiltroMayorSubcuenta},
  UFiltroSitPgGg in 'Fuentes\UFiltroSitPgGg.pas' {WFiltroSitPgGg},
  UFiltroBalances in 'Fuentes\UFiltroBalances.pas' {WFiltroBalances},
  UFiltroLibroFacturasEmitidas in 'Fuentes\UFiltroLibroFacturasEmitidas.pas' {WFiltroLibroFactEmitidas},
  UFiltroListadosMayor in 'Fuentes\UFiltroListadosMayor.pas' {WFiltroListadosMayor},
  InfMayor in 'Fuentes\InfMayor.pas',
  InfLibroIVA in 'Fuentes\InfLibroIVA.pas',
  InfMod347 in 'Fuentes\InfMod347.pas',
  InfBalanceSumasSaldos in 'Fuentes\InfBalanceSumasSaldos.pas',
  InfBalanceSituacion in 'Fuentes\InfBalanceSituacion.pas',
  ccDBIntegrity in 'Fuentes\ccDBIntegrity.pas',
  WizardGestEnterprises in 'Fuentes\WizardGestEnterprises.pas' {FormWizardGestEnterprises},
  WizardConnectDB in 'Fuentes\WizardConnectDB.pas' {WizardConnectDB},
  ______BUSSINES_OBJECTS______ in 'Fuentes\______BUSSINES_OBJECTS______.pas',
  EnterpriseClass in 'Fuentes\BusinessObjects\EnterpriseClass.pas',
  UserClass in 'Fuentes\BusinessObjects\UserClass.pas',
  ApplicationClass in 'Fuentes\BusinessObjects\ApplicationClass.pas',
  ProfileClass in 'Fuentes\BusinessObjects\ProfileClass.pas',
  OptionClass in 'Fuentes\BusinessObjects\OptionClass.pas',
  CurrentConfigClass in 'Fuentes\BusinessObjects\CurrentConfigClass.pas',
  ProfileOptionClass in 'Fuentes\BusinessObjects\ProfileOptionClass.pas',
  ______B_O_Lists______ in 'Fuentes\______B_O_Lists______.pas',
  ListOfOptions in 'Fuentes\BOLists\ListOfOptions.pas',
  ListOfProfileOptions in 'Fuentes\BOLists\ListOfProfileOptions.pas',
  ______VIEWS______ in 'Fuentes\______VIEWS______.pas',
  CustomView in 'Fuentes\views\CustomView.pas' {CustomView},
  CustomDataInputView in 'Fuentes\views\CustomDataInputView.pas' {CustomDataInputView},
  LoginView in 'Fuentes\views\LoginView.pas' {FormLoginView},
  MenuAdminView in 'Fuentes\views\MenuAdminView.pas' {FormMenuAdmin},
  UsersView in 'Fuentes\views\UsersView.pas' {UsersView},
  EditUserView in 'Fuentes\views\EditUserView.pas' {EditUserView},
  ProfilesView in 'Fuentes\views\ProfilesView.pas' {ProfilesView},
  EditProfileView in 'Fuentes\views\EditProfileView.pas' {EditProfileView},
  EnterprisesListView in 'Fuentes\views\EnterprisesListView.pas' {FormEnterprisesListView},
  MenuMainView in 'Fuentes\views\MenuMainView.pas' {FormMenuMain},
  ParametersEnterpriseView in 'Fuentes\views\ParametersEnterpriseView.pas' {ParametersEnterpriseView},
  ParametersInvoicingView in 'Fuentes\views\ParametersInvoicingView.pas' {ParametersInvoicingView},
  SearchView in 'Fuentes\views\SearchView.pas' {SearchView},
  ProjectsView in 'Fuentes\views\ProjectsView.pas' {ProjectsView},
  CountysView in 'Fuentes\views\CountysView.pas' {CountysView},
  StatesView in 'Fuentes\views\StatesView.pas' {StatesView},
  GroupsView in 'Fuentes\views\GroupsView.pas' {GroupsView},
  PaymentMethodsView in 'Fuentes\views\PaymentMethodsView.pas' {PaymentMethodsView},
  TypesOfJournalView in 'Fuentes\views\TypesOfJournalView.pas' {TypesOfJournalView},
  SalespersonsView in 'Fuentes\views\SalespersonsView.pas' {SalespersonsView},
  DelegationsView in 'Fuentes\views\DelegationsView.pas' {DelegationsView},
  DepartmentsView in 'Fuentes\views\DepartmentsView.pas' {DepartmentsView},
  SectionsView in 'Fuentes\views\SectionsView.pas' {SectionsView},
  AnalyticsView in 'Fuentes\views\AnalyticsView.pas' {AnalyticsView},
  ______CONTROLLERS______ in 'Fuentes\______CONTROLLERS______.pas',
  CustomController in 'Fuentes\controllers\CustomController.pas',
  CustomSearchController in 'Fuentes\controllers\CustomSearchController.pas',
  MainControllerClass in 'Fuentes\Controllers\MainControllerClass.pas',
  ConfigurationClass in 'Fuentes\Controllers\ConfigurationClass.pas',
  DBController in 'Fuentes\Controllers\DBController.pas',
  LoginController in 'Fuentes\controllers\LoginController.pas',
  MenuAdminController in 'Fuentes\controllers\MenuAdminController.pas',
  EnterprisesController in 'Fuentes\controllers\EnterprisesController.pas',
  UsersController in 'Fuentes\controllers\UsersController.pas',
  ProfilesController in 'Fuentes\controllers\ProfilesController.pas',
  EnterprisesListController in 'Fuentes\controllers\EnterprisesListController.pas',
  MenuMainController in 'Fuentes\controllers\MenuMainController.pas',
  ParametersEnterpriseController in 'Fuentes\controllers\ParametersEnterpriseController.pas',
  ParametersInvoicingController in 'Fuentes\controllers\ParametersInvoicingController.pas',
  SearchAccountController in 'Fuentes\controllers\SearchAccountController.pas',
  SearchConceptController in 'Fuentes\controllers\SearchConceptController.pas',
  ProjectsController in 'Fuentes\controllers\ProjectsController.pas',
  CountysController in 'Fuentes\controllers\CountysController.pas',
  StatesController in 'Fuentes\controllers\StatesController.pas',
  GroupsController in 'Fuentes\controllers\GroupsController.pas',
  PaymentMethodsController in 'Fuentes\controllers\PaymentMethodsController.pas',
  TypesOfJournalController in 'Fuentes\controllers\TypesOfJournalController.pas',
  SalesPersonsController in 'Fuentes\controllers\SalesPersonsController.pas',
  DelegationsController in 'Fuentes\controllers\DelegationsController.pas',
  DepartmentsController in 'Fuentes\controllers\DepartmentsController.pas',
  SectionsController in 'Fuentes\controllers\SectionsController.pas',
  AnalyticsController in 'Fuentes\controllers\AnalyticsController.pas',
  ______CUSTOM_MODELS______ in 'Fuentes\______CUSTOM_MODELS______.pas',
  CustomModel in 'Fuentes\models\CustomModel.pas',
  CustomEnterprisesModel in 'Fuentes\models\CustomEnterprisesModel.pas',
  CustomUsersModel in 'Fuentes\models\CustomUsersModel.pas',
  CustomApplicationsModel in 'Fuentes\models\CustomApplicationsModel.pas',
  CustomOptionsModel in 'Fuentes\models\CustomOptionsModel.pas',
  CustomProfilesModel in 'Fuentes\models\CustomProfilesModel.pas',
  CustomProfileOptionsModel in 'Fuentes\models\CustomProfileOptionsModel.pas',
  ______MODELS______ in 'Fuentes\______MODELS______.pas',
  DBConnection in 'Fuentes\models\DBConnection.pas',
  CRSQLConnection in 'Fuentes\models\CRSQLConnection.pas',
  LoginModel in 'Fuentes\models\LoginModel.pas',
  EnterprisesModel in 'Fuentes\models\EnterprisesModel.pas',
  UsersModel in 'Fuentes\models\UsersModel.pas',
  ApplicationsModel in 'Fuentes\models\ApplicationsModel.pas',
  ProfilesModel in 'Fuentes\models\ProfilesModel.pas',
  OptionsModel in 'Fuentes\models\OptionsModel.pas',
  ProfileOptionsModel in 'Fuentes\models\ProfileOptionsModel.pas',
  DMParametersEnterprise in 'Fuentes\models\DMParametersEnterprise.pas' {DataModuleParametersEnterprise: TDataModule},
  DMSearch in 'Fuentes\models\DMSearch.pas' {DataModuleSearch: TDataModule},
  DMProjects in 'Fuentes\models\DMProjects.pas' {DataModuleProjects: TDataModule},
  DMCountys in 'Fuentes\models\DMCountys.pas' {DataModuleCountys: TDataModule},
  DMStates in 'Fuentes\models\DMStates.pas' {DataModuleStates: TDataModule},
  DMGroups in 'Fuentes\models\DMGroups.pas' {DataModuleGroups: TDataModule},
  DMPaymentMethods in 'Fuentes\models\DMPaymentMethods.pas' {DataModulePaymentMethods: TDataModule},
  DMTypesOfJournal in 'Fuentes\models\DMTypesOfJournal.pas' {DataModuleTypesOfJournal: TDataModule},
  DMSalespersons in 'Fuentes\models\DMSalespersons.pas' {DataModuleSalespersons: TDataModule},
  DMDelegations in 'Fuentes\models\DMDelegations.pas' {DataModuleDelegations: TDataModule},
  DMDepartments in 'Fuentes\models\DMDepartments.pas' {DataModuleDepartments: TDataModule},
  DMSections in 'Fuentes\models\DMSections.pas' {DataModuleSections: TDataModule},
  DMAnalytics in 'Fuentes\models\DMAnalytics.pas' {DataModuleAnalytics: TDataModule},
  ______TOOLS______ in 'Fuentes\______TOOLS______.pas',
  InfAsientos in 'Fuentes\InfAsientos.pas',
  LabelCaptionForm in 'Fuentes\Tools\LabelCaptionForm.pas',
  ccStr in 'Fuentes\Tools\ccStr.pas',
  D6OnHelpFix in 'Fuentes\Tools\D6OnHelpFix.pas',
  Utilidades in 'Fuentes\Tools\Utilidades.pas',
  HashCriptography in 'Fuentes\Tools\HashCriptography.pas';

{$R *.RES}

//********************************************************************
//   Access Help API
//********************************************************************
var
  HHCtrlHandle: THandle = 0;   //0 if hhctrl.ocx is not loaded

{ Externals from HHCTRL.OCX }

var  //functions are invalid if HHCtrlHandle = 0

  HtmlHelpA: function(hwndCaller: HWND; pszFile: PAnsiChar;
    uCommand: UInt; dwData: DWORD): HWND; stdcall;

  HtmlHelpW: function(hwndCaller: HWND; pszFile: PWideChar;
    uCommand: UInt; dwData: DWORD): HWND; stdcall;

  HtmlHelp: function(hwndCaller: HWND; pszFile: PChar;
    uCommand: UInt; dwData: DWORD): HWND; stdcall;

const
  hhctrlLib  = 'hhctrl.ocx';

const
  { Commands to pass to HtmlHelp() }

  HH_DISPLAY_TOPIC        = $0000;
  HH_HELP_CONTEXT         = $000F;
  HH_CLOSE_ALL            = $0012;  // close all help windows opened by the caller
//********************************************************************
//********************************************************************
//   Access Help API
//********************************************************************
const hhPathRegKey = 'CLSID\{adb880a6-d8ff-11cf-9377-00aa003b7a11}\InprocServer32';

{setup HTML Help API function interface
 sets HHCtrlHandle = 0 if API function not available
 Note: See HH.pas instead of writing this code for each application
 }

procedure LoadHtmlHelp;
begin
  if HHCtrlHandle = 0 then
  begin
    HHCtrlHandle := LoadLibrary(hhctrlLib);
    if HHCtrlHandle <> 0 then
    begin
      @HtmlHelpA := GetProcAddress(HHCtrlHandle, 'HtmlHelpA');
      @HtmlHelpW := GetProcAddress(HHCtrlHandle, 'HtmlHelpW');
      @HtmlHelp  := GetProcAddress(HHCtrlHandle, 'HtmlHelpA');
    end;
  end;
end;

procedure UnloadHtmlHelp;
begin
  if HHCtrlHandle <> 0 then
  begin
    FreeLibrary(HHCtrlHandle);
    HHCtrlHandle := 0;
  end;
end;
//********************************************************************

var MainController :TMainController;
var FOldHelpEvent: THelpEvent;  {this shall to be in the MainControllerclass}
begin
  Application.Initialize;
  Application.Title := 'Contabilidad';

  MainController := TMainController.Create;
  //++++++++++++++++++++++++++++++++++++++++++++++++++++++
  {Hook in our help}
  FOldHelpEvent := Application.OnHelp;
  Application.OnHelp := MainController.OnHelp_HelpHook;
  //++++++++++++++++++++++++++++++++++++++++++++++++++++++

  //Load the HTML Help
  LoadHtmlHelp;
  if HHCtrlHandle = 0 then
  begin
    //ShowMessage('HTML Help is not installed on this PC.');
    Halt;
  end;
  //++++++++++++++++++++++++++++++++++++++++++++++++++++++

  try
    MainController.Run;
    //MemChk;
  finally
    MainController.Free;
  end;
end.

