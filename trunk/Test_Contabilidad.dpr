program Test_Contabilidad;

uses
  Forms,
  TestFrameWork,
  GUITestRunner,
  DM in 'Fuentes\DM.pas' {DMRef: TDataModule},
  DMControl in 'Fuentes\DMControl.pas' {DmControlRef: TDataModule},
  DMConta in 'Fuentes\DMConta.pas' {DMContaRef: TDataModule},
  TestMainForm in 'UnitTests\TestMainForm.pas' {FormTestMainForm},
  UTDataBase in 'UnitTests\UTDataBase.pas',
  Provincias in 'Fuentes\Provincias.pas' {FormProvincias},
  CustomView in 'Fuentes\views\CustomView.pas' {CustomView},
  ConfigurationClass in 'Fuentes\controllers\ConfigurationClass.pas',
  LabelCaptionForm in 'Fuentes\Tools\LabelCaptionForm.pas',
  CRSQLConnection in 'Fuentes\models\CRSQLConnection.pas',
  DBController in 'Fuentes\controllers\DBController.pas',
  DBConnection in 'Fuentes\models\DBConnection.pas',
  EnterpriseClass in 'Fuentes\BusinessObjects\EnterpriseClass.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.



  //Project1TestCases in 'Project1TestCases.pas';
  //ogfirst,
  //
  //
  //
  //UPrincipal in 'Fuentes\UPrincipal.pas' {WPrincipal},
  //
  //ULogin in 'Fuentes\ULogin.pas' {WLogin},
  //General in 'Fuentes\General.pas',
  //UProyectos in 'Fuentes\UProyectos.pas' {WProyectos},
  //UPaises in 'Fuentes\UPaises.pas' {WPaises},
  //UParametrizacionFacturacion in 'Fuentes\UParametrizacionFacturacion.pas' {WParametrizacionFacturacion},
  //USplash in 'Fuentes\USplash.pas' {WSplash},
  //UUsuarios in 'Fuentes\UUsuarios.pas' {WUsuarios},
  //UTitulos in 'Fuentes\UTitulos.pas' {WTitulos},
  //UCuentas in 'Fuentes\UCuentas.pas' {WCuentas},
  //UNuevaSubcuenta in 'Fuentes\UNuevaSubcuenta.pas' {WNuevaSubcuenta},
  //InfAsientos in 'Fuentes\InfAsientos.pas',
  //UFiltroListadosAsientos in 'Fuentes\UFiltroListadosAsientos.pas' {WFiltroListadosAsientos},
  //InfMayor in 'Fuentes\InfMayor.pas',
  //UConceptos in 'Fuentes\UConceptos.pas' {WConceptos},
  //UCargaApuntes in 'Fuentes\UCargaApuntes.pas' {WCargaApuntes},
  //UDiario in 'Fuentes\UDiario.pas' {WDiario},
  //UTraspasoApuntes in 'Fuentes\UTraspasoApuntes.pas' {WTraspasoApuntes},
  //InfLibroIVA in 'Fuentes\InfLibroIVA.pas',
  //UPlanAnalico in 'Fuentes\UPlanAnalico.pas' {WPlanAnalitico},
  //InfMod347 in 'Fuentes\InfMod347.pas',
  //UFiltro347 in 'Fuentes\UFiltro347.pas' {WFiltro347},
  //InfBalanceSumasSaldos in 'Fuentes\InfBalanceSumasSaldos.pas',
  //UFiltroMayorSubcuenta in 'Fuentes\UFiltroMayorSubcuenta.pas' {WFiltroMayorSubcuenta},
  //UCargaAsiento in 'Fuentes\UCargaAsiento.pas' {WCargaAsiento},
  //UFiltroSitPgGg in 'Fuentes\UFiltroSitPgGg.pas' {WFiltroSitPgGg},
  //InfBalanceSituacion in 'Fuentes\InfBalanceSituacion.pas',
  //UCargaCobrosPagos in 'Fuentes\UCargaCobrosPagos.pas' {WCargaCobrosPagos},
  //UCierreEjercicio in 'Fuentes\UCierreEjercicio.pas' {WCierreEjercicio},
  //UFiltroBalances in 'Fuentes\UFiltroBalances.pas' {WFiltroBalances},
  //UEfectosComerciales in 'Fuentes\UEfectosComerciales.pas' {WEfectosComerciales},
  //UGrupos in 'Fuentes\UGrupos.pas' {WGrupos},
  //UTraspasoDatos in 'Fuentes\UTraspasoDatos.pas' {WTraspasoDatos},
  //UBorradoDiario in 'Fuentes\UBorradoDiario.pas' {WBorradoDiario},
  //UPunteoDiario in 'Fuentes\UPunteoDiario.pas' {WPunteoDiario},
  //UCarteraEfectos in 'Fuentes\UCarteraEfectos.pas' {WCarteraEfectos},
  //UAmortizaciones in 'Fuentes\UAmortizaciones.pas' {WAmortizaciones},
  //UFormasPago in 'Fuentes\UFormasPago.pas' {WFormasPago},
  //UEmpresas in 'Fuentes\UEmpresas.pas' {WEmpresas},
  //UDetalleIVA in 'Fuentes\UDetalleIVA.pas' {WDetalleIVA},
  //UEnlaceContable in 'Fuentes\UEnlaceContable.pas' {WEnlaceContable},
  //UCargaRapidaNominas in 'Fuentes\UCargaRapidaNominas.pas' {WCargaRapidaNominas},
  //UIVA300 in 'Fuentes\UIVA300.pas' {WIva300},
  //UIrpf110 in 'Fuentes\UIrpf110.pas' {WIrpf110},
  //UISoc202 in 'Fuentes\UISoc202.pas' {WISoc202},
  //UCopiaAsientos in 'Fuentes\UCopiaAsientos.pas' {WCopiaAsientos},
  //UBalAcumulados in 'Fuentes\UBalAcumulados.pas' {WBalAcumulados},
  //UBalExplotacion in 'Fuentes\UBalExplotacion.pas' {WBalExplotacion},
  //UProvincias in 'Fuentes\UProvincias.pas' {WProvincias},
  //UTiposDiario in 'Fuentes\UTiposDiario.pas' {WTiposDiario},
  //UComerciales in 'Fuentes\UComerciales.pas' {WComerciales},
  //UDelegaciones in 'Fuentes\UDelegaciones.pas' {WDelegaciones},
  //UDepartamentos in 'Fuentes\UDepartamentos.pas' {WDepartamentos},
  //USecciones in 'Fuentes\USecciones.pas' {WSecciones},
  //UAnaliticas in 'Fuentes\UAnaliticas.pas' {WAnaliticas},
  //UVencimientos in 'Fuentes\UVencimientos.pas' {WVencimientos},
  //USubCuentas in 'Fuentes\USubCuentas.pas' {WSubCuentas},
  //UIrpf115 in 'Fuentes\UIrpf115.pas' {WIrpf115},
  //UFiltroLibroFacturasEmitidas in 'Fuentes\UFiltroLibroFacturasEmitidas.pas' {WFiltroLibroFactEmitidas},
  //UPlanContable in 'Fuentes\UPlanContable.pas' {WPlanContable},
  //UCargaRapidaFacturas in 'Fuentes\UCargaRapidaFacturas.pas' {WCargaRapidaFacturas},
  //URecalculoSaldos in 'Fuentes\URecalculoSaldos.pas' {WRecalculoSaldos},
  //USituacionEfecto in 'Fuentes\USituacionEfecto.pas' {WSituacionEfecto},
  //UPreviewForm in 'Fuentes\UPreviewForm.pas' {WPreviewForm},
  //UUTilEmpresas in 'Fuentes\UUtilEmpresas.pas' {WUtilEmpresas},
  //UActualizacionBD in 'Fuentes\UActualizacionBD.pas' {WActualizacionBD},
  //UFiltroListadosMayor in 'Fuentes\UFiltroListadosMayor.pas' {WFiltroListadosMayor},
  //UGeneracionAsiento in 'Fuentes\UGeneracionAsiento.pas' {WGeneracionAsiento},
  //UCalculadora in 'Fuentes\UCalculadora.pas' {WCalculadora},
  //UParametrizacion in 'Fuentes\UParametrizacion.pas' {WParametrizacion},
  //UImportacion in 'Fuentes\UImportacion.pas' {WImportacion};
