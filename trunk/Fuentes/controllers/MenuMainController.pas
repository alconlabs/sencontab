unit MenuMainController;

interface

uses Classes, DBController, ComCtrls, Menus, 
     CustomController,
     MenuMainView,
     CurrentConfigClass,
     UsersController,
     ProfilesController,
     UserClass;

type
  TMenuMainController = class(TCustomController)
  private
    FView                  :TFormMenuMain;
    FCurrentConfig         :TCurrentConfig;
    FUsersController       :TUsersController;
    procedure CreateMenuOptions(prmTreeView :TTreeView; prmMenuItem :TMenuItem; prmNode :TTreeNode);
    {----------------------------------------------------------------------}
    procedure MenuOptionParametersEnterprise(Sender: TObject);
    procedure MenuOptionGrupos(Sender: TObject);
    procedure MenuOptionProvincias(Sender: TObject);
    procedure MenuOptionPaises(Sender: TObject);
    procedure MenuOptionConceptos(Sender: TObject);
    procedure MenuOptionTitulos(Sender: TObject);
    procedure MenuOptionCuentas(Sender: TObject);
    procedure MenuOptionSubCuentas(Sender: TObject);
    procedure MenuOptionListadoAsientos(Sender: TObject);
    procedure MenuOptionMayor(Sender: TObject);
    procedure MenuOptionFacturacion(Sender: TObject);
    procedure MenuOptionRecalculoSaldos(Sender: TObject);
    procedure MenuOptionTraspasoApuntesEntreCuentas(Sender: TObject);
    procedure MenuOptionProcesoAutomatizado(Sender: TObject);
    procedure MenuOptionModelo300(Sender: TObject);
    procedure MenuOptionLibroFacturasEmitidas(Sender: TObject);
    procedure MenuOptionLibroFacturasRecibidas(Sender: TObject);
    procedure MenuOptionOperacionesTerceros347(Sender: TObject);
    procedure MenuOptionSumasYSaldos(Sender: TObject);
    procedure MenuOptionSituacion(Sender: TObject);
    procedure MenuOptionPerdidasYGanancias(Sender: TObject);
    procedure MenuOptionFacturasCompra(Sender: TObject);
    procedure MenuOptionCargaSimplificada(Sender: TObject);
    procedure MenuOptionCargaAsientos(Sender: TObject);
    procedure MenuOptionTraspasoDatos(Sender: TObject);
    procedure MenuOptionBorradoGeneralAsientos(Sender: TObject);
    procedure MenuOptionPunteoAutomaticoAsientos(Sender: TObject);
    procedure MenuOptionAmortizaciones(Sender: TObject);
    procedure MenuOptionCarteraEfectos(Sender: TObject);
    procedure MenuOptionCuentasAnaliticas(Sender: TObject);
    procedure MenuOptionLibroFacturasBienesInversion(Sender: TObject);
    procedure MenuOptionOperacionesCEE(Sender: TObject);
    procedure MenuOptionEnlaceContable(Sender: TObject);
    procedure MenuOptionFacturasVenta(Sender: TObject);
    procedure MenuOptionNominas(Sender: TObject);
    procedure MenuOptionIRPF110(Sender: TObject);
    procedure MenuOptionImpuestoSociedades202(Sender: TObject);
    procedure MenuOptionCopiaAsientosEntreEmpresas(Sender: TObject);
    procedure MenuOptionAcumulados(Sender: TObject);
    procedure MenuOptionExplotacion(Sender: TObject);
    procedure MenuOptionTiposDiario(Sender: TObject);
    procedure MenuOptionComerciales(Sender: TObject);
    procedure MenuOptionDelegaciones(Sender: TObject);
    procedure MenuOptionDepartamentos(Sender: TObject);
    procedure MenuOptionSecciones(Sender: TObject);
    procedure MenuOptionProyectos(Sender: TObject);
    procedure MenuOptionFormasPago(Sender: TObject);
    procedure MenuOptionIRPF115(Sender: TObject);
    procedure MenuOptionImpresionPlanContable(Sender: TObject);
    procedure MenuOptionImpresionPlanAnalitica(Sender: TObject);
    procedure MenuOptionCobrosPagos(Sender: TObject);
    procedure MenuOptionImportacion(Sender: TObject);
    procedure MenuOptionActualizacion(Sender: TObject);
    {----------------------------------------------------------------------}
  protected
    //procedure LabelUsersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuSelection(Sender: TObject);
  public
    constructor Create(ADBController    :TDBController;
                       AUser            :TUser;
                       prmCD_ENTERPRISE :string;
                       prmCD_PROFILE    :string;
                       prmAPPLICATION   :string); reintroduce;
    destructor  Destroy; override;
    procedure ShowView;
  end;

implementation
uses Forms, Controls, SysUtils, Utilidades, CustomView, Globales,
     ParametersEnterpriseController,
     UAmortizaciones, UAnaliticas, UBalAcumulados, UBalExplotacion, UBorradoDiario,
     UCargaApuntes, UCargaCobrosPagos, UCargaRapidaFacturas, UCargaRapidaNominas, UCarteraEfectos,
     UCierreEjercicio, UComerciales, UConceptos, UCopiaAsientos, UCuentas, UDelegaciones, UDepartamentos,
     UDiario, UEmpresas, UEnlaceContable, UEspere, UFiltro347, UFiltroBalances, UFiltroLibroFacturasEmitidas,
     UFiltroListadosAsientos, UFiltroListadosMayor, UFiltroSitPgGg, UFormasPago, UGrupos, UImportacion,
     UIrpf110, UIrpf115, UISoc202, UPaises, UParametrizacionFacturacion,
     UPlanAnalico, UPlanContable, UPreviewForm, Proyectos, UPunteoDiario, URecalculoSaldos,
     USecciones, USubCuentas, UTiposDiario, UTitulos, UTraspasoApuntes, UTraspasoDatos,
     Provincias, UActualizacionBD;

constructor TMenuMainController.Create(ADBController    :TDBController;
                                       AUser            :TUser;
                                       prmCD_ENTERPRISE :string;
                                       prmCD_PROFILE    :string;
                                       prmAPPLICATION   :string); 
begin
   inherited Create(ADBController);
   FCurrentConfig := TCurrentConfig.Create();
   FCurrentConfig.CreateUserAuthenticated(AUser);
   ADBController.DBConfig.DataBase := prmCD_ENTERPRISE;
   FCurrentConfig.CreateDBConfiguration(ADBController.DBConfig);
   FCurrentConfig.APPLICATION   := prmAPPLICATION;
   FCurrentConfig.CD_ENTERPRISE := prmCD_ENTERPRISE;
   FCurrentConfig.CD_PROFILE    := prmCD_PROFILE;
   FCurrentConfig.Initialize;
end;

destructor TMenuMainController.Destroy;
begin
   FView.Free;
end;

//procedure TMenuMainController.LabelUsersClick(Sender: TObject);
//begin
//   FUsersController := TUsersController.Create(DBCtlr);
//   try
//      FUsersController.ShowView;
//   finally
//   end;
//end;

procedure TMenuMainController.FormShow(Sender: TObject);
begin
   //if FView.TreeViewMenu.Items.Count = 0 then begin

   //end;

   FView.Top  := 0;
   FView.Left := 0;
end;

procedure TMenuMainController.ShowView;
begin
   Application.CreateForm(TFormMenuMain, FView);
   FView.OnShow  := FormShow;
   FView.OnPaint := FormShow;
   FView.TreeViewMenu.OnClick := MenuSelection;

   {----------------------------------------------------------------------}
   { Assignament of Delegates to the Menu Items.                          }
   {----------------------------------------------------------------------}
    FView.MenuItemParametersEnterprise.OnClick         := MenuOptionParametersEnterprise;
    FView.MenuItemGrupos.OnClick                       := MenuOptionGrupos;
    FView.MenuItemProvincias.OnClick                   := MenuOptionProvincias;
    FView.MenuItemPaises.OnClick                       := MenuOptionPaises;
    FView.MenuItemConceptos.OnClick                    := MenuOptionConceptos;
    FView.MenuItemTitulos.OnClick                      := MenuOptionTitulos;
    FView.MenuItemCuentas.OnClick                      := MenuOptionCuentas;
    FView.MenuItemSubCuentas.OnClick                   := MenuOptionSubCuentas;
    FView.MenuItemListadoAsientos.OnClick              := MenuOptionListadoAsientos;
    FView.MenuItemMayor.OnClick                        := MenuOptionMayor;
    FView.MenuItemFacturacion.OnClick                  := MenuOptionFacturacion;
    FView.MenuItemRecalculoSaldos.OnClick              := MenuOptionRecalculoSaldos;
    FView.MenuItemTraspasoApuntesEntreCuentas.OnClick  := MenuOptionTraspasoApuntesEntreCuentas;
    FView.MenuItemProcesoAutomatizado.OnClick          := MenuOptionProcesoAutomatizado;
    FView.MenuItemModelo300.OnClick                    := MenuOptionModelo300;
    FView.MenuItemLibroFacturasEmitidas.OnClick        := MenuOptionLibroFacturasEmitidas;
    FView.MenuItemLibroFacturasRecibidas.OnClick       := MenuOptionLibroFacturasRecibidas;
    FView.MenuItemOperacionesTerceros347.OnClick       := MenuOptionOperacionesTerceros347;
    FView.MenuItemSumasYSaldos.OnClick                 := MenuOptionSumasYSaldos;
    FView.MenuItemSituacion.OnClick                    := MenuOptionSituacion;
    FView.MenuItemPerdidasYGanancias.OnClick           := MenuOptionPerdidasYGanancias;
    FView.MenuItemFacturasCompra.OnClick               := MenuOptionFacturasCompra;
    FView.MenuItemCargaSimplificada.OnClick            := MenuOptionCargaSimplificada;
    FView.MenuItemCargaAsientos.OnClick                := MenuOptionCargaAsientos;
    FView.MenuItemTraspasoDatos.OnClick                := MenuOptionTraspasoDatos;
    FView.MenuItemBorradoGeneralAsientos.OnClick       := MenuOptionBorradoGeneralAsientos;
    FView.MenuItemPunteoAutomaticoAsientos.OnClick     := MenuOptionPunteoAutomaticoAsientos;
    FView.MenuItemAmortizaciones.OnClick               := MenuOptionAmortizaciones;
    FView.MenuItemCarteraEfectos.OnClick               := MenuOptionCarteraEfectos;
    FView.MenuItemCuentasAnaliticas.OnClick            := MenuOptionCuentasAnaliticas;
    FView.MenuItemLibroFacturasBienesInversion.OnClick := MenuOptionLibroFacturasBienesInversion;
    FView.MenuItemOperacionesCEE.OnClick               := MenuOptionOperacionesCEE;
    FView.MenuItemEnlaceContable.OnClick               := MenuOptionEnlaceContable;
    FView.MenuItemFacturasVenta.OnClick                := MenuOptionFacturasVenta;
    FView.MenuItemNominas.OnClick                      := MenuOptionNominas;
    FView.MenuItemIRPF110.OnClick                      := MenuOptionIRPF110;
    FView.MenuItemImpuestoSociedades202.OnClick        := MenuOptionImpuestoSociedades202;
    FView.MenuItemCopiaAsientosEntreEmpresas.OnClick   := MenuOptionCopiaAsientosEntreEmpresas;
    FView.MenuItemAcumulados.OnClick                   := MenuOptionAcumulados;
    FView.MenuItemExplotacion.OnClick                  := MenuOptionExplotacion;
    FView.MenuItemTiposDiario.OnClick                  := MenuOptionTiposDiario;
    FView.MenuItemComerciales.OnClick                  := MenuOptionComerciales;
    FView.MenuItemDelegaciones.OnClick                 := MenuOptionDelegaciones;
    FView.MenuItemDepartamentos.OnClick                := MenuOptionDepartamentos;
    FView.MenuItemSecciones.OnClick                    := MenuOptionSecciones;
    FView.MenuItemProyectos.OnClick                    := MenuOptionProyectos;
    FView.MenuItemFormasPago.OnClick                   := MenuOptionFormasPago;
    FView.MenuItemIRPF115.OnClick                      := MenuOptionIRPF115;
    FView.MenuItemImpresionPlanContable.OnClick        := MenuOptionImpresionPlanContable;
    FView.MenuItemImpresionPlanAnalitica.OnClick       := MenuOptionImpresionPlanAnalitica;
    FView.MenuItemCobrosPagos.OnClick                  := MenuOptionCobrosPagos;
    FView.MenuItemImportacion.OnClick                  := MenuOptionImportacion;
    FView.MenuItemActualizacion.OnClick                := MenuOptionActualizacion;
    {----------------------------------------------------------------------}

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   { Delegates Assignation }
   //FView.LabelUsers.OnClick := LabelUsersClick;
   FView.TreeViewMenu.Items.Clear;
   CreateMenuOptions(FView.TreeViewMenu, FView.MainMenuOptions.Items, nil);
   FView.Show;
end;

procedure TMenuMainController.MenuOptionGrupos(Sender: TObject);
begin
   {$Message Warn '1ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WGRUPOS') then Exit;
   if not Assigned(WGrupos) then WGrupos := TWGrupos.Create(nil);
   WGrupos.Show;
end;

procedure TMenuMainController.MenuOptionProvincias(Sender: TObject);
begin
   {$Message Warn '2ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPROVINCIAS') then Exit;
   //if not Assigned(WProvincias) then WProvincias := TWProvincias.Create(nil);
   //WProvincias.Show;

   {<<<<<<=========>>>>>>>>>} {ccInsertForm(Self, TFormProvincias);}
   if not Assigned(FormProvincias) then FormProvincias := TFormProvincias.Create(nil);
   FormProvincias.Show;
end;

procedure TMenuMainController.MenuOptionPaises(Sender: TObject);
begin
   {$Message Warn '3ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPAISES') then Exit;
   if not Assigned(WPaises) then WPaises := TWPaises.Create(nil);
   WPaises.Show;
end;

procedure TMenuMainController.MenuOptionConceptos(Sender: TObject);
begin
   {$Message Warn '4ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCONCEPTOS') then Exit;
   if not Assigned(WConceptos) then WConceptos := TWConceptos.Create(nil);
   WConceptos.Show;
end;

procedure TMenuMainController.MenuOptionTitulos(Sender: TObject);
begin
   {$Message Warn '6ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTITULOS') then Exit;
   if not Assigned(WTitulos) then WTitulos := TWTitulos.Create(nil);
   WTitulos.Show;
end;

procedure TMenuMainController.MenuOptionCuentas(Sender: TObject);
begin
   {$Message Warn '7ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCUENTAS') then Exit;
   if not Assigned(WCuentas) then WCuentas := TWCuentas.Create(nil);
   WCuentas.Show;
end;

procedure TMenuMainController.MenuOptionSubCuentas(Sender: TObject);
begin
   {$Message Warn '8ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WSUBCUENTAS') then Exit;
   if not Assigned(WSubcuentas) then WSubcuentas := TWSubcuentas.Create(nil);
   WSubcuentas.Show;
end;

procedure TMenuMainController.MenuOptionListadoAsientos(Sender: TObject);
begin
   {$Message Warn '9ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLISTADOSASIENTOS') then Exit;
   if not Assigned(WFiltroListadosAsientos) then WFiltroListadosAsientos := TWFiltroListadosAsientos.Create(nil);
   WFiltroListadosAsientos.TipoListado := INF_ASIENTOS;
   WFiltroListadosAsientos.ShowModal;
   WFiltroListadosAsientos := nil;
end;

procedure TMenuMainController.MenuOptionMayor(Sender: TObject);
begin
   {$Message Warn '10ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLISTADOSMAYOR') then Exit;
   if not Assigned(WFiltroListadosMayor) then WFiltroListadosMayor := TWFiltroListadosMayor.Create(nil);
   WFiltroListadosMayor.TipoListado := INF_MAYOR;
   WFiltroListadosMayor.ShowModal;
   WFiltroListadosMayor := nil;
end;

procedure TMenuMainController.MenuOptionParametersEnterprise(Sender: TObject);
begin
   with TParametersEnterpriseController.Create(FCurrentConfig) do begin
      try
         ShowView;
      finally
         Free;
      end;
   end;
   {$Message Warn '11ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPARAMETRIZACION') then Exit;
   //if not Assigned(WParametrizacion) then WParametrizacion := TWParametrizacion.Create(nil);
   //WParametrizacion.ShowModal;
   //WParametrizacion.Free;
   //WParametrizacion := nil;
end;

procedure TMenuMainController.MenuOptionFacturacion(Sender: TObject);
var ParametersFact :TWParametrizacionFacturacion;
begin
   {$Message Warn '12ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPARAMETRIZACION') then Exit;
   ParametersFact := TWParametrizacionFacturacion.Create(Application);
   try
      ParametersFact.ShowModal;
   finally
      ParametersFact.Free;
   end;
end;

procedure TMenuMainController.MenuOptionRecalculoSaldos(Sender: TObject);
begin
   {$Message Warn '13ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WRECALCULOSALDOS') then Exit;
   if not Assigned(WRecalculoSaldos) then WRecalculoSaldos := TWRecalculoSaldos.Create(nil);
   WRecalculoSaldos.ShowModal;
   WRecalculoSaldos.Free;
   WRecalculoSaldos := nil;
end;

procedure TMenuMainController.MenuOptionTraspasoApuntesEntreCuentas(Sender: TObject);
begin
   {$Message Warn '14ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTRASPASOAPUNTES') then Exit;
   if not Assigned(WTraspasoApuntes) then WTraspasoApuntes := TWTraspasoApuntes.Create(nil);
   WTraspasoApuntes.ShowModal;
   WTraspasoApuntes.Free;
   WTraspasoApuntes := nil;
end;

procedure TMenuMainController.MenuOptionProcesoAutomatizado(Sender: TObject);
begin
   {$Message Warn '15ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCIERREEJERCICIO') then Exit;
   if not Assigned(WCierreEjercicio) then WCierreEjercicio := TWCierreEjercicio.Create(nil);
   WCierreEjercicio.ShowModal;
   WCierreEjercicio.Free;
   WCierreEjercicio := nil;
end;

procedure TMenuMainController.MenuOptionModelo300(Sender: TObject);
begin
   {$Message Warn '16ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_MOD_300;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TMenuMainController.MenuOptionLibroFacturasEmitidas(Sender: TObject);
begin
   {$Message Warn '17ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_EMITIDAS;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TMenuMainController.MenuOptionLibroFacturasRecibidas(Sender: TObject);
begin
   {$Message Warn '18ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_RECIBIDAS;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TMenuMainController.MenuOptionOperacionesTerceros347(Sender: TObject);
begin
   {$Message Warn '19ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTRO347') then Exit;
   if not Assigned(WFiltro347) then WFiltro347 := TWFiltro347.Create(nil);
   WFiltro347.TipoListado := INF_MOD_347;
   WFiltro347.ShowModal;
   WFiltro347.Free;
   WFiltro347 := nil;
end;

procedure TMenuMainController.MenuOptionSumasYSaldos(Sender: TObject);
begin
   {$Message Warn '20ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROBALANCES') then Exit;
   if not Assigned(WFiltroBalances) then WFiltroBalances := TWFiltroBalances.Create(nil);
   WFiltroBalances.TipoListado := INF_BALANCE_SUMAS_Y_SALDOS;
   WFiltroBalances.ShowModal;
   WFiltroBalances := nil;
end;

procedure TMenuMainController.MenuOptionSituacion(Sender: TObject);
begin
   {$Message Warn '21ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROSITPGGG') then Exit;
   if not Assigned(WFiltroSitPgGg) then WFiltroSitPgGg := TWFiltroSitPgGg.Create(nil);
   WFiltroSitPgGg.TipoListado := INF_BALANCE_SITUACION;
   WFiltroSitPgGg.ShowModal;
   WFiltroSitPgGg := nil;
end;

procedure TMenuMainController.MenuOptionPerdidasYGanancias(Sender: TObject);
begin
   {$Message Warn '22ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROSITPGGG') then Exit;
   if not Assigned(WFiltroSitPgGg) then WFiltroSitPgGg := TWFiltroSitPgGg.Create(nil);
   WFiltroSitPgGg.TipoListado := INF_BALANCE_PERDIDAS_Y_GANANCIAS;
   WFiltroSitPgGg.ShowModal;
   WFiltroSitPgGg := nil;
end;

procedure TMenuMainController.MenuOptionFacturasCompra(Sender: TObject);
begin
   {$Message Warn '23ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDAFACTURAS') then Exit;
   if not Assigned(WCargaRapidaFacturas) then WCargaRapidaFacturas := TWCargaRapidaFacturas.Create(nil);
   WCargaRapidaFacturas.TipoCarga := CARGA_FACTURAS_COMPRA;
   WCargaRapidaFacturas.ShowModal;
   WCargaRapidaFacturas.Free;
   WCargaRapidaFacturas := nil;
end;

procedure TMenuMainController.MenuOptionCargaSimplificada(Sender: TObject);
begin
   {$Message Warn '24ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGAAPUNTES') then Exit;
   if not Assigned(WCargaApuntes) then WCargaApuntes := TWCargaApuntes.Create(nil);
   WCargaApuntes.ShowModal;
   WCargaApuntes.Free;
   WCargaApuntes := nil;
end;

procedure TMenuMainController.MenuOptionCargaAsientos(Sender: TObject);
begin
   {$Message Warn '25ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDIARIO') then Exit;
   if not Assigned(WDiario) then WDiario := TWDiario.Create(nil);
   WDiario.Show;
end;

procedure TMenuMainController.MenuOptionTraspasoDatos(Sender: TObject);
begin
   {$Message Warn '26ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTRASPASODATOS') then Exit;
   if not Assigned(WTraspasoDatos) then WTraspasoDatos := TWTraspasoDatos.Create(nil);
   WTraspasoDatos.ShowModal;
   WTraspasoDatos.Free;
   WTraspasoDatos := nil;
end;

procedure TMenuMainController.MenuOptionBorradoGeneralAsientos(Sender: TObject);
begin
   {$Message Warn '27ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBORRADODIARIO') then Exit;
   if not Assigned(WBorradoDiario) then WBorradoDiario := TWBorradoDiario.Create(nil);
   WBorradoDiario.ShowModal;
   WBorradoDiario.Free;
   WBorradoDiario := nil;
end;

procedure TMenuMainController.MenuOptionPunteoAutomaticoAsientos(Sender: TObject);
begin
   {$Message Warn '28ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPUNTEODIARIO') then Exit;
   if not Assigned(WPunteoDiario) then WPunteoDiario := TWPunteoDiario.Create(nil);
   WPunteoDiario.ShowModal;
   WPunteoDiario.Free;
   WPunteoDiario := nil;
end;

procedure TMenuMainController.MenuOptionAmortizaciones(Sender: TObject);
begin
   {$Message Warn '29ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WAMORTIZACIONES') then Exit;
   if not Assigned(WAmortizaciones) then WAmortizaciones := TWAmortizaciones.Create(nil);
   WAmortizaciones.ShowModal;
   WAmortizaciones.Free;
   WAmortizaciones := nil;
end;

procedure TMenuMainController.MenuOptionCarteraEfectos(Sender: TObject);
begin
   {$Message Warn '30ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARTERAEFECTOS') then Exit;
   if not Assigned(WCarteraEfectos) then WCarteraEfectos := TWCarteraEfectos.Create(nil);
   WCarteraEfectos.Show;
end;

procedure TMenuMainController.MenuOptionCuentasAnaliticas(Sender: TObject);
begin
   {$Message Warn '31ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WANALITICAS') then Exit;
   if not Assigned(WAnaliticas) then WAnaliticas := TWAnaliticas.Create(nil);
   WAnaliticas.Show;
end;

procedure TMenuMainController.MenuOptionLibroFacturasBienesInversion(Sender: TObject);
begin
   {$Message Warn '33ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_BIENES;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TMenuMainController.MenuOptionOperacionesCEE(Sender: TObject);
begin
   {$Message Warn '34ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTRO347') then Exit;
   if not Assigned(WFiltro347) then WFiltro347 := TWFiltro347.Create(nil);
   WFiltro347.TipoListado := INF_MOD_349;
   WFiltro347.ShowModal;
   WFiltro347.Free;
   WFiltro347 := nil;
end;

procedure TMenuMainController.MenuOptionEnlaceContable(Sender: TObject);
begin
   {$Message Warn '35ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WENLACECONTABLE') then Exit;
   if not Assigned(WEnlaceContable) then WEnlaceContable := TWEnlaceContable.Create(nil);
   WEnlaceContable.ShowModal;
   WEnlaceContable.Free;
   WEnlaceContable := nil;
end;

procedure TMenuMainController.MenuOptionFacturasVenta(Sender: TObject);
begin
   {$Message Warn '36ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDAFACTURAS') then Exit;
   if not Assigned(WCargaRapidaFacturas) then WCargaRapidaFacturas := TWCargaRapidaFacturas.Create(nil);
   WCargaRapidaFacturas.TipoCarga := CARGA_FACTURAS_VENTA;
   WCargaRapidaFacturas.ShowModal;
   WCargaRapidaFacturas.Free;
   WCargaRapidaFacturas := nil;
end;

procedure TMenuMainController.MenuOptionNominas(Sender: TObject);
begin
   {$Message Warn '37ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDANOMINAS') then Exit;
   if not Assigned(WCargaRapidaNominas) then WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
   WCargaRapidaNominas.ShowModal;
   WCargaRapidaNominas.Free;
   WCargaRapidaNominas := nil;
end;

procedure TMenuMainController.MenuOptionIRPF110(Sender: TObject);
begin
   {$Message Warn '38ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WIRPF110') then Exit;
   if not Assigned(WIrpf110) then WIrpf110 := TWIrpf110.Create(nil);
   WIrpf110.ShowModal;
   WIrpf110.Free;
   WIrpf110 := nil;
end;

procedure TMenuMainController.MenuOptionImpuestoSociedades202(Sender: TObject);
begin
   {$Message Warn '39ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WISOC202') then Exit;
   if not Assigned(WISoc202) then WISoc202 := TWISoc202.Create(nil);
   WISoc202.ShowModal;
   WISoc202.Free;
   WISoc202 := nil;
end;

procedure TMenuMainController.MenuOptionCopiaAsientosEntreEmpresas(Sender: TObject);
begin
   {$Message Warn '40ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCOPIAASIENTOS') then Exit;
   if not Assigned(WCopiaAsientos) then WCopiaAsientos := TWCopiaAsientos.Create(nil);
   WCopiaAsientos.ShowModal;
   WCopiaAsientos.Free;
   WCopiaAsientos := nil;
end;

procedure TMenuMainController.MenuOptionAcumulados(Sender: TObject);
begin
   {$Message Warn '41ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBALACUMULADOS') then Exit;
   if not Assigned(WBalAcumulados) then WBalAcumulados := TWBalAcumulados.Create(nil);
   WBalAcumulados.ShowModal;
   WBalAcumulados.Free;
   WBalAcumulados := nil;
end;

procedure TMenuMainController.MenuOptionExplotacion(Sender: TObject);
begin
   {$Message Warn '42ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBALEXPLOTACION') then Exit;
   if not Assigned(WBalExplotacion) then WBalExplotacion := TWBalExplotacion.Create(nil);
   WBalExplotacion.ShowModal;
   WBalExplotacion.Free;
   WBalExplotacion := nil;
end;

procedure TMenuMainController.MenuOptionTiposDiario(Sender: TObject);
begin
   {$Message Warn '43ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTIPOSDIARIO') then Exit;
   if not Assigned(WTiposDiario) then WTiposDiario := TWTiposDiario.Create(nil);
   WTiposDiario.Show;
end;

procedure TMenuMainController.MenuOptionComerciales(Sender: TObject);
begin
   {$Message Warn '44ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCOMERCIALES') then Exit;
   if not Assigned(WComerciales) then WComerciales := TWComerciales.Create(nil);
   WComerciales.Show;
end;

procedure TMenuMainController.MenuOptionDelegaciones(Sender: TObject);
begin
   {$Message Warn '45ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDELEGACIONES') then Exit;
   if not Assigned(WDelegaciones) then WDelegaciones := TWDelegaciones.Create(nil);
   WDelegaciones.Show;
end;

procedure TMenuMainController.MenuOptionDepartamentos(Sender: TObject);
begin
   {$Message Warn '46ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDEPARTAMENTOS') then Exit;
   if not Assigned(WDepartamentos) then WDepartamentos := TWDepartamentos.Create(nil);
   WDepartamentos.Show;
end;

procedure TMenuMainController.MenuOptionSecciones(Sender: TObject);
begin
   {$Message Warn '47ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WSECCIONES') then Exit;
   if not Assigned(WSecciones) then WSecciones := TWSecciones.Create(nil);
   WSecciones.Show;
end;

procedure TMenuMainController.MenuOptionProyectos(Sender: TObject);
begin
   {$Message Warn '48ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPROYECTOS') then Exit;
   if not Assigned(WProyectos) then WProyectos := TWProyectos.Create(nil);
   WProyectos.Show;
end;

procedure TMenuMainController.MenuOptionFormasPago(Sender: TObject);
begin
   {$Message Warn '49ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFORMASPAGO') then Exit;
   if not Assigned(WFormasPago) then WFormasPago := TWFormasPago.Create(nil);
   WFormasPago.Show;
end;

procedure TMenuMainController.MenuOptionIRPF115(Sender: TObject);
begin
   {$Message Warn '50ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WIRPF115') then Exit;
   if not Assigned(WIrpf115) then WIrpf115 := TWIrpf115.Create(nil);
   WIrpf115.ShowModal;
   WIrpf115.Free;
   WIrpf115 := nil;
end;

procedure TMenuMainController.MenuOptionImpresionPlanContable(Sender: TObject);
begin
   {$Message Warn '51ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPLANCONTABLE') then Exit;
   if not Assigned(WPlanContable) then WPlanContable := TWPlanContable.Create(nil);
   WPlanContable.ShowModal;
   WPlanContable.Free;
   WPlanContable := nil;
end;

procedure TMenuMainController.MenuOptionImpresionPlanAnalitica(Sender: TObject);
begin
   {$Message Warn '52ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPLANANALITICO') then Exit;
   if not Assigned(WPlanAnalitico) then WPlanAnalitico := TWPlanAnalitico.Create(nil);
   WPlanAnalitico.ShowModal;
   WPlanAnalitico.Free;
   WPlanAnalitico := nil;
end;

procedure TMenuMainController.MenuOptionCobrosPagos(Sender: TObject);
begin
   {$Message Warn '53ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGACOBROSPAGOS') then Exit;
   if not Assigned(WCargaCobrosPagos) then WCargaCobrosPagos := TWCargaCobrosPagos.Create(nil);
   WCargaCobrosPagos.ShowModal;
   WCargaCobrosPagos.Free;
   WCargaCobrosPagos := nil;
end;

procedure TMenuMainController.MenuOptionImportacion(Sender: TObject);
begin
   {$Message Warn '54ª Ventana para Test}
   if not Assigned(WImportacion) then WImportacion := TWImportacion.Create(nil);
   WImportacion.ShowModal;
   WImportacion.Free;
   WImportacion := nil;
end;

procedure TMenuMainController.MenuOptionActualizacion(Sender: TObject);
begin
   {$Message Warn '55ª Ventana para Test}
   if not Assigned(WActualizacionBD) then WActualizacionBD := TWActualizacionBD.Create(nil);
   WActualizacionBD.ShowModal;
   WActualizacionBD.Free;
   WActualizacionBD := nil;
end;

procedure TMenuMainController.CreateMenuOptions(prmTreeView :TTreeView;
                                                prmMenuItem :TMenuItem;
                                                prmNode     :TTreeNode);
var i        :Integer;
    Node     :TTreeNode;
    Delegate :TDelegate;
begin
   { For each element into the current menu level }
   for i := 0 to prmMenuItem.Count - 1 do begin
      if prmMenuItem.Count > 0 then begin
        { Create a Child element }
        Node := prmTreeView.Items.AddChild(prmNode, prmMenuItem.Items[i].Caption);
        Node.ImageIndex := prmMenuItem.Items[i].ImageIndex;
        { Create a Delegate Object witch has only a container for the OnClic event of the Item }
        Delegate := TDelegate.Create(prmTreeView);
        Delegate.OnClick := prmMenuItem.Items[i].OnClick;
        Node.Data := Delegate;
        BoldTreeNode(prmNode, True);
        { Recursive calling }
        CreateMenuOptions(prmTreeView, prmMenuItem.Items[i], Node);
      end
      else begin
        { Create the element and assign the image index }
        Node := prmTreeView.Items.Add(nil, prmMenuItem.Items[i].Caption);
        Node.ImageIndex := prmMenuItem.Items[i].ImageIndex;
        { The next line asure this state in case of not assignated }
        Node.Data := nil;
      end;
   end;
end;

procedure TMenuMainController.MenuSelection(Sender: TObject);
var Node     :TTreeNode;
    Delegate :TDelegate;
begin
   { Hay que saber si el click ha sido sobre un nodo }
   if TTreeView(Sender).Selected <> nil then begin
      Node := TTreeView(Sender).Selected;
      if Node.Data <> nil then begin
         Delegate := TDelegate(Node.Data);
         if Delegate.Execute then begin
            TTreeView(Sender).Selected := nil;
         end;
      end;
   end;
end;

end.
