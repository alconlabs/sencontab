program Contabilidad;

uses
  Forms,
  ogfirst,
  DM in 'Fuentes\DM.pas' {DMRef: TDataModule},
  DMControl in 'Fuentes\DMControl.pas' {DmControlRef: TDataModule},
  DMConta in 'Fuentes\DMConta.pas' {DMContaRef: TDataModule},
  DMBalances in 'Fuentes\DMBalances.pas' {DMBlnc: TDataModule},
  MenuPrincipal in 'Fuentes\MenuPrincipal.pas' {FormPrincipal},
  Globales in 'Fuentes\Globales.pas',
  Login in 'Fuentes\Login.pas' {FormLogin},
  General in 'Fuentes\General.pas',
  Proyectos in 'Fuentes\Proyectos.pas' {WProyectos},
  UPaises in 'Fuentes\UPaises.pas' {WPaises},
  UParametrizacionFacturacion in 'Fuentes\UParametrizacionFacturacion.pas' {WParametrizacionFacturacion},
  Splash in 'Fuentes\Splash.pas' {FormSplash},
  UUsuarios in 'Fuentes\UUsuarios.pas' {WUsuarios},
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
  UEmpresas in 'Fuentes\UEmpresas.pas' {WEmpresas},
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
  FormHandler in 'Fuentes\FormHandler.pas',
  SearchAccount in 'Fuentes\SearchAccount.pas' {FormSearchAccount},
  SearchConcept in 'Fuentes\SearchConcept.pas' {FormSearchConcept},
  MainControllerClass in 'Fuentes\Controllers\MainControllerClass.pas',
  ConfigurationClass in 'Fuentes\Controllers\ConfigurationClass.pas',
  DBController in 'Fuentes\Controllers\DBController.pas',
  DBConnection in 'Fuentes\models\DBConnection.pas',
  LoginController in 'Fuentes\controllers\LoginController.pas',
  LoginView in 'Fuentes\views\LoginView.pas' {FormLoginView},
  CRSQLConnection in 'Fuentes\models\CRSQLConnection.pas',
  ccStr in 'Fuentes\ccStr.pas',
  Utilidades in 'Fuentes\Utilidades.pas',
  WizardConnectDB in 'Fuentes\WizardConnectDB.pas' {WizardConnectDB},
  D6OnHelpFix in 'Fuentes\D6OnHelpFix.pas',
  HashCriptography in 'Fuentes\HashCriptography.pas',
  LoginModel in 'Fuentes\models\LoginModel.pas',
  MenuAdminController in 'Fuentes\controllers\MenuAdminController.pas',
  MenuAdminView in 'Fuentes\views\MenuAdminView.pas' {FormMenuAdmin};

{$R *.RES}

var MainController :TMainController;
begin
  Application.Initialize;
  Application.Title := 'Contabilidad';

  MainController := TMainController.Create;
  try
    MainController.Run;
    Application.Run;
  finally
    MainController.Free;
  end;

  //Application.CreateForm(TDMControlRef, DMControlRef);
  //Application.CreateForm(TFormPrincipal, FormPrincipal);
  //Application.CreateForm(TFormLoginView, FormLoginView);

end.

