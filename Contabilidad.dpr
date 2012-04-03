program Contabilidad;

uses
  Forms,
  ogfirst,
  Windows,
  DM in 'Fuentes\DM.pas' {DMRef: TDataModule},
  DMControl in 'Fuentes\DMControl.pas' {DmControlRef: TDataModule},
  DMConta in 'Fuentes\DMConta.pas' {DMContaRef: TDataModule},
  DMBalances in 'Fuentes\DMBalances.pas' {DMBlnc: TDataModule},
  MenuPrincipal in 'Fuentes\MenuPrincipal.pas' {FormPrincipal},
  Globales in 'Fuentes\Globales.pas',
  General in 'Fuentes\General.pas',
  Proyectos in 'Fuentes\Proyectos.pas' {WProyectos},
  UPaises in 'Fuentes\UPaises.pas' {WPaises},
  UParametrizacionFacturacion in 'Fuentes\UParametrizacionFacturacion.pas' {WParametrizacionFacturacion},
  Splash in 'Fuentes\Splash.pas' {FormSplash},
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
  UGrupos in 'Fuentes\UGrupos.pas' {WGrupos},
  UTraspasoDatos in 'Fuentes\UTraspasoDatos.pas' {WTraspasoDatos},
  UBorradoDiario in 'Fuentes\UBorradoDiario.pas' {WBorradoDiario},
  UPunteoDiario in 'Fuentes\UPunteoDiario.pas' {WPunteoDiario},
  UCarteraEfectos in 'Fuentes\UCarteraEfectos.pas' {WCarteraEfectos},
  UAmortizaciones in 'Fuentes\UAmortizaciones.pas' {WAmortizaciones},
  UFormasPago in 'Fuentes\UFormasPago.pas' {WFormasPago},
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
  UTiposDiario in 'Fuentes\UTiposDiario.pas' {WTiposDiario},
  UComerciales in 'Fuentes\UComerciales.pas' {WComerciales},
  UDelegaciones in 'Fuentes\UDelegaciones.pas' {WDelegaciones},
  UDepartamentos in 'Fuentes\UDepartamentos.pas' {WDepartamentos},
  USecciones in 'Fuentes\USecciones.pas' {WSecciones},
  UAnaliticas in 'Fuentes\UAnaliticas.pas' {WAnaliticas},
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
  UParametrizacion in 'Fuentes\UParametrizacion.pas' {WParametrizacion},
  UImportacion in 'Fuentes\UImportacion.pas' {WImportacion},
  Provincias in 'Fuentes\Provincias.pas' {FormProvincias},
  UFiltroListadosAsientos in 'Fuentes\UFiltroListadosAsientos.pas' {WFiltroListadosAsientos},
  UFiltro347 in 'Fuentes\UFiltro347.pas' {WFiltro347},
  UFiltroMayorSubcuenta in 'Fuentes\UFiltroMayorSubcuenta.pas' {WFiltroMayorSubcuenta},
  UFiltroSitPgGg in 'Fuentes\UFiltroSitPgGg.pas' {WFiltroSitPgGg},
  UFiltroBalances in 'Fuentes\UFiltroBalances.pas' {WFiltroBalances},
  UFiltroLibroFacturasEmitidas in 'Fuentes\UFiltroLibroFacturasEmitidas.pas' {WFiltroLibroFactEmitidas},
  UFiltroListadosMayor in 'Fuentes\UFiltroListadosMayor.pas' {WFiltroListadosMayor},
  InfAsientos in 'Fuentes\InfAsientos.pas',
  InfMayor in 'Fuentes\InfMayor.pas',
  InfLibroIVA in 'Fuentes\InfLibroIVA.pas',
  InfMod347 in 'Fuentes\InfMod347.pas',
  InfBalanceSumasSaldos in 'Fuentes\InfBalanceSumasSaldos.pas',
  InfBalanceSituacion in 'Fuentes\InfBalanceSituacion.pas',
  ccChildForm in 'Fuentes\ccChildForm.pas' {ccFormChild},
  ccDBIntegrity in 'Fuentes\ccDBIntegrity.pas',
  Login in 'Fuentes\Login.pas' {FormLogin},
  FormHandler in 'Fuentes\FormHandler.pas',
  SearchAccount in 'Fuentes\SearchAccount.pas' {FormSearchAccount},
  SearchConcept in 'Fuentes\SearchConcept.pas' {FormSearchConcept},
  MainControllerClass in 'Fuentes\Controllers\MainControllerClass.pas',
  ConfigurationClass in 'Fuentes\Controllers\ConfigurationClass.pas',
  DBController in 'Fuentes\Controllers\DBController.pas',
  DBConnection in 'Fuentes\models\DBConnection.pas',
  CRSQLConnection in 'Fuentes\models\CRSQLConnection.pas',
  ccStr in 'Fuentes\ccStr.pas',
  Utilidades in 'Fuentes\Utilidades.pas',
  WizardConnectDB in 'Fuentes\WizardConnectDB.pas' {WizardConnectDB},
  D6OnHelpFix in 'Fuentes\D6OnHelpFix.pas',
  HashCriptography in 'Fuentes\HashCriptography.pas',
  LoginModel in 'Fuentes\models\LoginModel.pas',
  LoginView in 'Fuentes\views\LoginView.pas' {FormLoginView},
  LoginController in 'Fuentes\controllers\LoginController.pas',
  MenuAdminController in 'Fuentes\controllers\MenuAdminController.pas',
  MenuAdminView in 'Fuentes\views\MenuAdminView.pas' {FormMenuAdmin},
  WizardGestEnterprises in 'Fuentes\WizardGestEnterprises.pas' {FormWizardGestEnterprises},
  CustomEnterprisesModel in 'Fuentes\models\CustomEnterprisesModel.pas',
  EnterprisesModel in 'Fuentes\models\EnterprisesModel.pas',
  EnterprisesController in 'Fuentes\controllers\EnterprisesController.pas',
  EnterpriseClass in 'Fuentes\BusinessObjects\EnterpriseClass.pas',
  CustomController in 'Fuentes\controllers\CustomController.pas',
  CustomView in 'Fuentes\views\CustomView.pas' {CustomView},
  UsersController in 'Fuentes\controllers\UsersController.pas',
  UsersView in 'Fuentes\views\UsersView.pas' {UsersView},
  EditUserView in 'Fuentes\views\EditUserView.pas' {EditUserView},
  UserClass in 'Fuentes\BusinessObjects\UserClass.pas',
  UsersModel in 'Fuentes\models\UsersModel.pas',
  CustomUsersModel in 'Fuentes\models\CustomUsersModel.pas',
  LabelCaptionForm in 'Fuentes\Tools\LabelCaptionForm.pas',
  CustomDataInputView in 'Fuentes\views\CustomDataInputView.pas' {CustomDataInputView},
  MemCheck in 'Fuentes\Tools\MemCheck.pas';

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
    Application.Run;
    MemChk;
  finally
    MainController.Free;
  end;

  //Application.CreateForm(TDMControlRef, DMControlRef);
  //Application.CreateForm(TFormPrincipal, FormPrincipal);
  //Application.CreateForm(TFormLoginView, FormLoginView);

end.

