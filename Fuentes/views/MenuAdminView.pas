unit MenuAdminView;
interface
uses Messages, SysUtils, Classes, Forms,
     SHDocVw, DB, AppEvnts, OleCtrls, Graphics, Buttons, Menus, ExtCtrls,
     ComCtrls, Controls, ImgList;
type
  TFormMenuAdmin = class(TForm)
    ImageList: TImageList;
    MainMenu: TPopupMenu;
    MenuItemTopComercial: TMenuItem;
    MenuItemFormaPago: TMenuItem;
    MenuItemSubClientes: TMenuItem;
    MenuItemSubObras: TMenuItem;
    MenuItemSubFamilias: TMenuItem;
    MenuItemSubMaderas: TMenuItem;
    MenuItemConceptosdeObra: TMenuItem;
    MenuItemAcercade: TMenuItem;
    MenuItemConfigProducto: TMenuItem;
    MenuItemBugTracking: TMenuItem;
    MenuItemPlantillas: TMenuItem;
    MenuItemGestionInformes: TMenuItem;
    MenuItemSistema: TMenuItem;
    MenuItemSalir: TMenuItem;
    MenuItemSubCascada: TMenuItem;
    MenuItemSubOrganizarIconos: TMenuItem;
    MenuItemSubMinimizarTodos: TMenuItem;
    MenuItemOrganizaciondeInformes: TMenuItem;
    MenuItemTopConfiguracion: TMenuItem;
    MenuItemTipoUsuario: TMenuItem;
    MenuItemDelegaciones: TMenuItem;
    MenuItemUsuarios: TMenuItem;
    MenuItemDepartamentos: TMenuItem;
    MenuItemAplicaciones: TMenuItem;
    MenuItemVersiones: TMenuItem;
    MenuItemTipoDocumento: TMenuItem;
    MenuItemOpcionesMenu: TMenuItem;
    MenuItemFormulariosAplicacion: TMenuItem;
    MenuItemUsuariosMenus: TMenuItem;
    MenuItemUsuariosForms: TMenuItem;
    N1: TMenuItem;
    MenuItemMenusUsuarios: TMenuItem;
    MenuItemTopColocacion: TMenuItem;
    MenuItemGestionDeBichos: TMenuItem;
    MenuItemSubVentaPedidos: TMenuItem;
    MenuItemOtrasTablas: TMenuItem;
    MenuItemContadores: TMenuItem;
    N4: TMenuItem;
    MenuItemSubAgentesComerciales: TMenuItem;
    MenuItemSubColocadores: TMenuItem;
    MenuItemSubUnidadesEjecucion: TMenuItem;
    MenuItemCertifColocadores: TMenuItem;
    MenuItemSubPagares: TMenuItem;
    MenuItemTipoEfecto: TMenuItem;
    MenuItemUnidsMedida: TMenuItem;
    Splitter1: TSplitter;
    PanelMenu: TPanel;
    N5: TMenuItem;
    MenuItemNavIntranet: TMenuItem;
    MenuItemProformasColocacion: TMenuItem;
    MenuItemTopAdministracion: TMenuItem;
    MenuItemCuentasBancarias: TMenuItem;
    N6: TMenuItem;
    MenuItemRemoteDesktop: TMenuItem;
    MenuItemSubConsultaVntPedidos: TMenuItem;
    MenuItemSubFacturasVenta: TMenuItem;
    MenuItemConsultaCertificaciones: TMenuItem;
    MenuItemConsultadeproformas: TMenuItem;
    MenuItemSubFormulas: TMenuItem;
    MenuItemSubComponentes: TMenuItem;
    MenuItemFamProduc: TMenuItem;
    MenuItemTOPCompras: TMenuItem;
    MenuItemProveedores: TMenuItem;
    MenuItemPedidosCompras: TMenuItem;
    MenuItemConsultaComponentes: TMenuItem;
    MenuItemContactos: TMenuItem;
    MenuItemEjecutadorConsultas: TMenuItem;
    MenuItemTopCalidad: TMenuItem;
    MenuItemInformesColocacion: TMenuItem;
    MenuitemSeguimientoObras: TMenuItem;
    MenuItemTopOfTecnica: TMenuItem;
    MenuItemLotesDeCompra: TMenuItem;
    MenuItemVisadoTecnicoPedidos: TMenuItem;
    MenuItemConsultaVntPedidosPremarcos: TMenuItem;
    MenuItemSeriesCompraVenta: TMenuItem;
    MenuitemRecuperarConexion: TMenuItem;
    ImageList2: TImageList;
    ImageListGrandes: TImageList;
    SpeedButton1: TSpeedButton;
    PageControl: TPageControl;
    TabAdministracion: TTabSheet;
    TabComercial: TTabSheet;
    TabPlanificacion: TTabSheet;
    TabCompras: TTabSheet;
    TabOficinaTecnica: TTabSheet;
    ImageAdministracion: TImage;
    ImageComercial: TImage;
    ImagePlanificacion: TImage;
    ImageCompras: TImage;
    ImageOficinaTecnica: TImage;
    PanelSuperior: TPanel;
    BtnComercial: TSpeedButton;
    BtnOficinaTecnica: TSpeedButton;
    BtnPlanificacion: TSpeedButton;
    BtnLogistExpedic: TSpeedButton;
    BtnFabricacion: TSpeedButton;
    BtnCompras: TSpeedButton;
    BtnAdministracion: TSpeedButton;
    BtnCalidad: TSpeedButton;
    BtnObraEnCurso: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Animate: TAnimate;
    MenuItemTopPlanificacion: TMenuItem;
    TabFabricacion: TTabSheet;
    TabCalidad: TTabSheet;
    TabDireccion: TTabSheet;
    TabLogistExpedic: TTabSheet;
    TabObraEnCurso: TTabSheet;
    TabConfiguracion: TTabSheet;
    ImageCalidad: TImage;
    ImageDireccion: TImage;
    ImageLogistExpedic: TImage;
    ImageObraEnCurso: TImage;
    ImageConfiguracion: TImage;
    ImageFabricacion: TImage;
    MenuItemTopFabricacion: TMenuItem;
    BtnConfiguracion: TSpeedButton;
    MenuItemTopExpediciones: TMenuItem;
    BtnX: TSpeedButton;
    BtnSalir: TSpeedButton;
    BtnSistema: TSpeedButton;
    TabSistema: TTabSheet;
    ImageSistema: TImage;
    N7: TMenuItem;
    N8: TMenuItem;
    N3: TMenuItem;
    N9: TMenuItem;
    N2: TMenuItem;
    StatusBar: TStatusBar;
    MenuItemAlbaranesExpedicion: TMenuItem;
    PageControlLeft: TPageControl;
    ImagenGrande: TImage;
    PanelBoton: TPanel;
    TreeView: TTreeView;
    WebBrowser: TWebBrowser;
    N10: TMenuItem;
    MenuItemDocumentacionUsuario: TMenuItem;
    MenuItemConsultaFacturasEmitidas: TMenuItem;
    MenuItemFacturasCompra: TMenuItem;
    MenuItemConsultaFacturasCompra: TMenuItem;
    MenuItemSituacionesPago: TMenuItem;
    MenuItemPuestosFabrica: TMenuItem;
    MenuItemTurnos: TMenuItem;
    MenuItemTurnosFecha: TMenuItem;
    MenuItemRutaFabricacion: TMenuItem;
    MenuItemFamiliasPedido: TMenuItem;
    MenuItemGenerarPagaresFacturasCompra: TMenuItem;
    N11: TMenuItem;
    MenuItemTurnosPorSemana: TMenuItem;
    N12: TMenuItem;
    MenuItemCargaPorPuesto: TMenuItem;
    MenuItemTipoComponente: TMenuItem;
    N13: TMenuItem;
    MenuItemProgramacionFabrica: TMenuItem;
    N14: TMenuItem;
    MenuItemPartesTrabajoPorPuesto: TMenuItem;
    MenuItemControlFabricacion: TMenuItem;
    MenuItemRecepcionMateriales: TMenuItem;
    MenuItemPlanCarga: TMenuItem;
    MenuItemPuntosControlFabrica: TMenuItem;
    MenuItemPuntosControlTipoComponente: TMenuItem;
    MenuItemConsultaControlFabricacion: TMenuItem;
    MenuItemArticulos: TMenuItem;
    MenuItemAlmacenes: TMenuItem;
    MenuItemTiposMovimiento: TMenuItem;
    MenuItemConsultaMovimientosAlmacen: TMenuItem;
    MenuItemRealizacionInventarios: TMenuItem;
    MenuItemEntradasAlmacen: TMenuItem;
    MenuItemTiposArticulo: TMenuItem;
    MenuItemConsultaStocks: TMenuItem;
    MenuItemGestionComponentes: TMenuItem;
    MenuItemGestionArticulos: TMenuItem;
    N15: TMenuItem;
    MenuItemSalidasAlmacen: TMenuItem;
    N16: TMenuItem;
    MenuItemConsultaInventarios: TMenuItem;
    MenuItemReubicacionMateriales: TMenuItem;
    MenuItemEntradasProductoTerminado: TMenuItem;
    MenuItemAlbaranesAlmacen: TMenuItem;
    procedure TimerDocumentosTimer(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function  AnyFormEditing:Boolean;
    procedure WMSysCommand(var Message :TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMClose     (var Message :TWMClose     ); message WM_CLOSE;
    //procedure LoadTreeViewFromMenu(prmTreeView :TTreeView; prmMenu :TPopupMenu; prmMenuItem :TMenuItem);
    //procedure CreateTreeViewItem(prmTreeView :TTreeView; prmMenu :TMenuItem; prmPadre :TTreeNode);
    //function  NoHayVentanasAbiertas:Boolean;
    //procedure AdjustButtonSize(W :Integer; H :Integer);
    //procedure MuestraError(prmErrorMessage :string);
    //procedure TryInsertForm(prmOpcionMenu :TMenuItem; prmChildForm :TFormClass);
  public
  end;

//var
//  FormMenuAdmin: TFormMenuAdmin;

implementation

uses Dialogs, Windows;
{$R *.dfm}

function TFormMenuAdmin.AnyFormEditing:Boolean;
var i       :Integer;
    j       :Integer;
    locForm :TForm;
begin
   Result := False;
   for i := 0 to MDIChildCount - 1 do begin
       locForm := MDIChildren[i];
       for j := 0 to locForm.ComponentCount - 1 do begin
           //if locForm.Components[j] is TccFormHandler then begin
           //   if TccFormHandler(locForm.Components[j]).Mode = fmEditing then Result := True;
           //end;
           if Result then Break;
       end;
   end;
end;

procedure TFormMenuAdmin.WMSysCommand(var Message: TWMSysCommand);
begin
   if (Message.CmdType and $FFF0 = SC_MINIMIZE) and
      (AnyFormEditing) then Exit
                       else inherited;
end;

procedure TFormMenuAdmin.WMClose(var Message: TWMClose);
begin
   if AnyFormEditing then Exit
                     else Close;
end;

//function TFormMenuPrincipal.NoHayVentanasAbiertas:Boolean;
//begin
//   if Application.MainForm.MDIChildCount > 0 then begin
//      MessageDlg('Para seleccionar esta opción ha de cerrar previamente todas las ventanas.',
//                        ,mb_OK or mb_IconWarning or mb_DefButton1);
//      Result := False;
//   end
//   else Result := True;
//end;

procedure TFormMenuAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //{$IFNDEF _CONSOLE_TESTRUNNER}
   //// este primer if detecta si Delphi o C++Builder está siendo ejecutado.
   //if FindWindow('TAppBuilder', nil) <> 0 then begin
   //   //DM.DropTemporalDirectory;
   //   Application.Terminate;
   //end
   //else begin
   //   if MessageDlg('¿Desea realmente salir de la aplicación?',
   //                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
   //      //ShowMessage(DM.PathTemporal);
   //      //DM.DropTemporalDirectory;
   //      Application.Terminate;
   //   end
   //   else Abort;
   //end;
   //{$ELSE}
   ////Action := caFree;
   //{$ENDIF}
end;

//procedure TFormMenuAdmin.MuestraError(prmErrorMessage :string);
//begin
//   StatusBar.Font.Color := clRed;
//   StatusBar.Font.Style := [fsBold];
//   StatusBar.Panels[1].Text := '      '+prmErrorMessage;
//   MessageBeep(MB_ICONHAND);
//   Timer.Enabled := True;
//end;

//procedure TFormMenuAdmin.TryInsertForm(prmOpcionMenu :TMenuItem;
//                                           prmChildForm  :TFormClass);
//
//   function OpcionDisponible:Boolean;
//   var Q :TSQLQuery;
//   begin
//      Q := DM.DB.CreateQuery(['SELECT COUNT(*) ESTA                       ',
//                              'FROM   USUARIOS_MENUS                      ',
//                              'WHERE  CD_APLICACION  = :prmCD_APLICACION  ',
//                              'AND    CD_USUARIO     = :prmCD_USUARIO     ',
//                              'AND    CD_OPCIONMENU  = :prmCD_OPCIONMENU  ']);
//      Q.ParamByName('prmCD_APLICACION').Value := UpperCase(DM.Aplicacion);
//      Q.ParamByName('prmCD_USUARIO'   ).Value := UpperCase(DM.Usuario   );
//      Q.ParamByName('prmCD_OPCIONMENU').Value := Copy(UpperCase(prmOpcionMenu.Name),9, Length(prmOpcionMenu.Name));
//
//      try Q.Open;
//          Result := Q.FieldByName('ESTA').AsInteger > 0;
//      finally Q.Free;
//      end;
//   end;
//
//begin
//   if OpcionDisponible then begin
//      ccInsertForm(Self, prmChildForm);
//   end
//   else begin
//      MuestraError('O P C I O N   N O   D I S P O N I B L E  ');
//   end;
//end;

procedure TFormMenuAdmin.MenuItemClick(Sender: TObject);

   //procedure AunNo(prmMessage :string);
   //begin
   //   ShowMessage(prmMessage);
   //end;

//var i :Integer;
begin
   //Animate.Active  := True;
   //Animate.Visible := True;
   //Screen.Cursor   := crHourGlass;
   //try
   //if Sender = MenuItemSubMinimizarTodos then begin
   //   for i := 0 to ComponentCount -1 do begin
   //       if Components[i] is TForm then begin
   //          SendMessage(TForm(Components[i]).Handle, WS_MINIMIZE, 0, 0);
   //       end;
   //   end;
   //end else
   //if Sender = MenuItemAcercade then begin
   //   Animate.Active  := False;
   //   Animate.Visible := False;
   //   Screen.Cursor   := crDefault;
   //   //ccCreateModal(TFormAcercaDe);
   //end else
   //if Sender = BtnSistema        then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemSistema          ) else
   //if Sender = BtnComercial      then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopComercial     ) else
   //if Sender = BtnOficinaTecnica then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopOfTecnica     ) else
   //if Sender = BtnPlanificacion  then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopPlanificacion ) else
   //if Sender = BtnCompras        then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopCompras       ) else
   //if Sender = BtnFabricacion    then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopFabricacion   ) else
   //if Sender = BtnLogistExpedic  then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopExpediciones  ) else
   //if Sender = BtnObraEnCurso    then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopColocacion    ) else
   //if Sender = BtnAdministracion then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopAdministracion) else
   //if Sender = BtnCalidad        then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopCalidad       ) else
   //if Sender = BtnConfiguracion  then LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemTopConfiguracion ) else
   //if Sender = MenuItemSubCascada                     then Cascade                                          else
   //if Sender = MenuItemSubOrganizarIconos             then ArrangeIcons                                     else
   //if Sender = MenuItemOrganizaciondeInformes         then TryInsertForm(TMenuItem(Sender), TFormOrgListados                  ) else
   //if Sender = MenuItemNavIntranet                    then TryInsertForm(TMenuItem(Sender), TFormNavIntranet                  ) else
   //if Sender = MenuItemTipoUsuario                    then TryInsertForm(TMenuItem(Sender), TFormTipoUsuario                  ) else
   //if Sender = MenuItemDelegaciones                   then TryInsertForm(TMenuItem(Sender), TFormDelegaciones                 ) else
   //if Sender = MenuItemUsuarios                       then TryInsertForm(TMenuItem(Sender), TFormUsuarios                     ) else
   //if Sender = MenuItemDepartamentos                  then TryInsertForm(TMenuItem(Sender), TFormDepartamentos                ) else
   //if Sender = MenuItemAplicaciones                   then TryInsertForm(TMenuItem(Sender), TFormAplicaciones                 ) else
   //if Sender = MenuItemTipoDocumento                  then TryInsertForm(TMenuItem(Sender), TFormTipoDocumento                ) else
   //if Sender = MenuItemVersiones                      then TryInsertForm(TMenuItem(Sender), TFormAplVersiones                 ) else
   //if Sender = MenuItemOpcionesMenu                   then TryInsertForm(TMenuItem(Sender), TFormOpcionesMenu                 ) else
   //if Sender = MenuItemFormulariosAplicacion          then TryInsertForm(TMenuItem(Sender), TFormFormsAplicacion              ) else
   //if Sender = MenuItemUsuariosMenus                  then TryInsertForm(TMenuItem(Sender), TFormUsuariosMenus                ) else
   //if Sender = MenuItemMenusUsuarios                  then TryInsertForm(TMenuItem(Sender), TFormMenusUsuarios                ) else
   //if Sender = MenuItemUsuariosForms                  then TryInsertForm(TMenuItem(Sender), TFormUsuariosForms                ) else
   //if Sender = MenuItemSubClientes                    then TryInsertForm(TMenuItem(Sender), TFormClientes                     ) else
   //if Sender = MenuItemGestionInformes                then TryInsertForm(TMenuItem(Sender), TFormDesigner                     ) else
   //if Sender = MenuItemBugTracking                    then TryInsertForm(TMenuItem(Sender), TFormBugTracking                  ) else
   //if Sender = MenuItemSubObras                       then TryInsertForm(TMenuItem(Sender), TFormObras                        ) else
   //if Sender = MenuitemSeguimientoObras               then TryInsertForm(TMenuItem(Sender), TFormSeguimientoObra              ) else
   //if Sender = MenuItemSubFamilias                    then TryInsertForm(TMenuItem(Sender), TFormFamilias                     ) else
   //if Sender = MenuItemSubMaderas                     then TryInsertForm(TMenuItem(Sender), TFormMaderas                      ) else
   //if Sender = MenuItemConfigProducto                 then TryInsertForm(TMenuItem(Sender), TFormConfigProducto               ) else
   //if Sender = MenuItemConceptosdeObra                then TryInsertForm(TMenuItem(Sender), TFormConceptosObra                ) else
   //if Sender = MenuItemFormaPago                      then TryInsertForm(TMenuItem(Sender), TFormFormaPago                    ) else
   //if Sender = MenuItemPlantillas                     then TryInsertForm(TMenuItem(Sender), TFormPlantillas                   ) else
   //if Sender = MenuItemGestionDeBichos                then TryInsertForm(TMenuItem(Sender), TFormBugTracking                  ) else
   //if Sender = MenuItemSubVentaPedidos                then TryInsertForm(TMenuItem(Sender), TFormVentaPedidos                 ) else
   //if Sender = MenuItemSubConsultaVntPedidos          then TryInsertForm(TMenuItem(Sender), TFormConsultaVntPedidos           ) else
   //if Sender = MenuItemContadores                     then TryInsertForm(TMenuItem(Sender), TFormContadores                   ) else
   //if Sender = MenuItemSubAgentesComerciales          then TryInsertForm(TMenuItem(Sender), TFormAgentes                      ) else
   //if Sender = MenuItemSubColocadores                 then TryInsertForm(TMenuItem(Sender), TFormColocadores                  ) else
   //if Sender = MenuItemSubUnidadesEjecucion           then TryInsertForm(TMenuItem(Sender), TFormUnidadesEjecucion            ) else
   //if Sender = MenuItemCertifColocadores              then TryInsertForm(TMenuItem(Sender), TFormCertifColocadores            ) else
   //if Sender = MenuItemProformasColocacion            then TryInsertForm(TMenuItem(Sender), TFormProformasColocacion          ) else
   //if Sender = MenuItemSubPagares                     then TryInsertForm(TMenuItem(Sender), TFormPagares                      ) else
   //if Sender = MenuItemTipoEfecto                     then TryInsertForm(TMenuItem(Sender), TFormTipoEfecto                   ) else
   //if Sender = MenuItemUnidsMedida                    then TryInsertForm(TMenuItem(Sender), TFormUnidsMedida                  ) else
   //if Sender = MenuItemCuentasBancarias               then TryInsertForm(TMenuItem(Sender), TFormCuentasBancarias             ) else
   //if Sender = MenuItemRemoteDesktop                  then TryInsertForm(TMenuItem(Sender), TFormRemoteDesktop                ) else
   //if Sender = MenuItemSubFacturasVenta               then TryInsertForm(TMenuItem(Sender), TFormFacturasVenta                ) else
   //if Sender = MenuItemConsultaCertificaciones        then TryInsertForm(TMenuItem(Sender), TFormConsultaCertificaciones      ) else
   //if Sender = MenuItemSubFormulas                    then TryInsertForm(TMenuItem(Sender), TFormFormulas                     ) else
   //if Sender = MenuItemSubComponentes                 then TryInsertForm(TMenuItem(Sender), TFormComponentes                  ) else
   //if Sender = MenuItemFamProduc                      then TryInsertForm(TMenuItem(Sender), TFormFamiliaProduccion            ) else
   //if Sender = MenuItemConsultaDeProformas            then TryInsertForm(TMenuItem(Sender), TFormConsultaProformas            ) else
   //if Sender = MenuItemProveedores                    then TryInsertForm(TMenuItem(Sender), TFormProveedores                  ) else
   //if Sender = MenuItemPedidosCompras                 then TryInsertForm(TMenuItem(Sender), TFormComprasPedidos               ) else
   //if Sender = MenuItemConsultaComponentes            then TryInsertForm(TMenuItem(Sender), TFormConsultaComponentes          ) else
   //if Sender = MenuItemContactos                      then TryInsertForm(TMenuItem(Sender), TFormContactos                    ) else
   //if Sender = MenuItemEjecutadorConsultas            then TryInsertForm(TMenuItem(Sender), TFormEjecutadorConsultas          ) else
   //if Sender = MenuItemLotesDeCompra                  then TryInsertForm(TMenuItem(Sender), TFormLotesDeCompra                ) else
   //if Sender = MenuItemProgramacionFabrica            then TryInsertForm(TMenuItem(Sender), TFormProgramacionFabrica          ) else
   //if Sender = MenuItemVisadoTecnicoPedidos           then TryInsertForm(TMenuItem(Sender), TFormVisadoTecnicoPedidos         ) else
   //if Sender = MenuItemSeriesCompraVenta              then TryInsertForm(TMenuItem(Sender), TFormSeriesCompraVenta            ) else
   //if Sender = MenuItemConsultaVntPedidosPremarcos    then TryInsertForm(TMenuItem(Sender), TFormConsultaVntPedidosPremarcos  ) else
   //if Sender = MenuItemAlbaranesExpedicion            then TryInsertForm(TMenuItem(Sender), TFormAlbaranes                    ) else
   //if Sender = MenuItemDocumentacionUsuario           then TryInsertForm(TMenuItem(Sender), TFormDocUsuario                   ) else
   //if Sender = MenuItemConsultaFacturasEmitidas       then TryInsertForm(TMenuItem(Sender), TFormConsultaFacturasEmitidas     ) else
   //if Sender = MenuItemFacturasCompra                 then TryInsertForm(TMenuItem(Sender), TFormCompraFacturas               ) else
   //if Sender = MenuItemConsultaFacturasCompra         then TryInsertForm(TMenuItem(Sender), TFormConsultaFacturasCompra       ) else
   //if Sender = MenuItemPuestosFabrica                 then TryInsertForm(TMenuItem(Sender), TFormPuestosFabrica               ) else
   //if Sender = MenuItemTurnos                         then TryInsertForm(TMenuItem(Sender), TFormTurnos                       ) else
   //if Sender = MenuItemTurnosFecha                    then TryInsertForm(TMenuItem(Sender), TFormTurnosFecha                  ) else
   //if Sender = MenuItemRutaFabricacion                then TryInsertForm(TMenuItem(Sender), TFormRutaFabricacion              ) else
   //if Sender = MenuItemFamiliasPedido                 then TryInsertForm(TMenuitem(Sender), TFormFamiliasPedido               ) else
   //if Sender = MenuItemSituacionesPago                then TryInsertForm(TMenuItem(Sender), TFormSituacionesPago              ) else
   //if Sender = MenuItemGenerarPagaresFacturasCompra   then TryInsertForm(TMenuItem(Sender), TFormGenerarPagaresFacturasCompra ) else
   //if Sender = MenuItemTurnosPorSemana                then TryInsertForm(TMenuItem(Sender), TFormTurnosSemana                 ) else
   //if Sender = MenuItemCargaPorPuesto                 then TryInsertForm(TMenuItem(Sender), TFormCargaPorPuesto               ) else
   //if Sender = MenuItemTipoComponente                 then TryInsertForm(TMenuItem(Sender), TFormTipoComponente               ) else
   //if Sender = MenuItemPartesTrabajoPorPuesto         then TryInsertForm(TMenuItem(Sender), TFormPartesTrabajoPorPuesto       ) else
   //if Sender = MenuItemControlFabricacion             then TryInsertForm(TMenuItem(Sender), TFormControlFabricacion           ) else
   //if Sender = MenuItemRecepcionMateriales            then TryInsertForm(TMenuItem(Sender), TFormRecepcionMateriales          ) else
   //if Sender = MenuItemPlanCarga                      then TryInsertForm(TMenuItem(Sender), TFormPlanCarga                    ) else
   //if Sender = MenuItemPuntosControlFabrica           then TryInsertForm(TMenuItem(Sender), TFormPuntosControlFabrica         ) else
   //if Sender = MenuItemPuntosControlTipoComponente    then TryInsertForm(TMenuItem(Sender), TFormPuntosControlTipoComponente  ) else
   //if Sender = MenuItemConsultaControlFabricacion     then TryInsertForm(TMenuItem(Sender), TFormConsultaControlFabricacion   ) else
   //if Sender = MenuItemArticulos                      then TryInsertForm(TMenuItem(Sender), TFormArticulos                    ) else
   //if Sender = MenuItemAlmacenes                      then TryInsertForm(TMenuItem(Sender), TFormAlmacenes                    ) else
   //if Sender = MenuItemTiposMovimiento                then TryInsertForm(TMenuItem(Sender), TFormTiposMovimiento              ) else
   //if Sender = MenuItemConsultaMovimientosAlmacen	    then TryInsertForm(TMenuItem(Sender), TFormConsultaMovimientosAlmacen   ) else
   //if Sender = MenuItemRealizacionInventarios         then TryInsertForm(TMenuItem(Sender), TFormRealizacionInventarios       ) else
   //if Sender = MenuItemEntradasAlmacen                then TryInsertForm(TMenuItem(Sender), TFormEntradasAlmacen              ) else
   //if Sender = MenuItemTiposArticulo                  then TryInsertForm(TMenuItem(Sender), TFormTiposArticulo                ) else
   //if Sender = MenuItemConsultaStocks                 then TryInsertForm(TMenuItem(Sender), TFormConsultaStocks               ) else
   //if Sender = MenuItemGestionComponentes             then TryInsertForm(TMenuItem(Sender), TFormGestionComponentes           ) else
   //if Sender = MenuItemGestionArticulos               then TryInsertForm(TMenuItem(Sender), TFormGestionArticulos             ) else
   //if Sender = MenuItemSalidasAlmacen                 then TryInsertForm(TMenuItem(Sender), TFormSalidasAlmacen               ) else
   //if Sender = MenuItemConsultaInventarios            then TryInsertForm(TMenuItem(Sender), TFormConsultaInventarios          ) else
   //if Sender = MenuItemReubicacionMateriales          then TryInsertForm(TMenuItem(Sender), TFormReubicacionMateriales        ) else
   //if Sender = MenuItemEntradasProductoTerminado      then TryInsertForm(TMenuItem(Sender), TFormEntradasProductoTerminado    ) else
   //if Sender = MenuItemAlbaranesAlmacen               then TryInsertForm(TMenuItem(Sender), TFormAlbaranesAlmacen             ) else
   //if Sender = MenuItemRecuperarConexion              then begin
   //   try     DM.DB.Close;
   //   finally DM.DB.Open;
   //   end;
   //end else
   //if (Sender = MenuItemSalir) or (Sender = BtnSalir) then Close;
   //
   //finally Animate.Active  := False;
   //        Animate.Visible := False;
   //        Screen.Cursor   := crDefault;
   //end;
end;

procedure TFormMenuAdmin.TimerDocumentosTimer(Sender: TObject);
(* Esto sólo le funcionaba a Ana Descalzo
   Queda desactivado hasta nueva orden. Al paracer nadie lo utilizaba *)
//var Q    :TSQLQuery;
//    Resp : String;
begin
//   TimerDocumentos.Enabled := False;
//   Q := DM.DB.CreateQuery(['SELECT COUNT(*) DOCUMENTOS         ',
//                           'FROM   DOCUMENTACION_USUARIO       ',
//                           'WHERE  CD_USUARIO = :prmCD_USUARIO ']);
//   Q.ParamByName('prmCD_USUARIO').Value := UpperCase(DM.Usuario);
//
//   try Q.Open;
//       if Q.FieldByName('DOCUMENTOS').AsInteger > 0 then begin
//          case MessageDlg('Tiene '+Q.FieldByName('DOCUMENTOS').AsString+' documentos pendientes. ¿Desea verlos ahora?',
//                     mtConfirmation, [mbYes, mbNo, mbIgnore], 0) of
//             mrYes: ccInsertForm(Application.MainForm, TFormDocUsuario);
//             mrNo:;
//             mrIgnore:
//                begin
//                   TimerDocumentos.Enabled := False;
//                   Resp := 'Ignorar';
//                end;
//          end;
//       end;
//   finally Q.Free;
//           if  Resp <> 'Ignorar' then TimerDocumentos.Enabled := True;
//   end;
end;

procedure TFormMenuAdmin.TimerTimer(Sender: TObject);
begin
   //StatusBar.Panels[1].Text := '';
   //Timer.Enabled := False;
end;

procedure TFormMenuAdmin.TreeViewClick(Sender: TObject);
begin
   //if (not TreeView.Selected.HasChildren) and
   //    Assigned(TMenuItem(Treeview.Selected.Data).OnClick) then begin
   //   TMenuItem(Treeview.Selected.Data).OnClick(Treeview.Selected.Data);
   //end;
end;

procedure TFormMenuAdmin.FormCreate(Sender: TObject);
//var HTMLText :TStringList;
begin
   //AdjustButtonSize(PanelSuperior.Width, PanelSuperior.Height);
   //LoadTreeViewFromMenu(TreeView, MainMenu, MenuItemSistema);

   //HTMLText := TStringList.Create;
   //try
   //   HTMLText.Clear;
   //   HTMLText.Add('<html>                                                  ');
   //   HTMLText.Add('<body scroll= NO BGCOLOR=SILVER CENTER=YES>             ');
   //   HTMLText.Add('<script language="JavaScript" src="http://www.inquiero.com/inquiero/web/an/ann4.asp?login=48206&lang=es"></script>');
   //   HTMLText.Add('</body>                                                 ');
   //   HTMLText.Add('</html>                                                 ');
   //   ShowWebHTML(WebBrowser.ControlInterface, HTMLText.Text);
   //finally HTMLText.Free;
   //end;

   //HDocumentUsuario.Connection := DM.DB;
   //QDocUsuario.Connection      := DM.DB;
   //HDocumentUsuario.Open;
   //TimerDocumentos.Interval    := DM.DELAY_DOCUMENTS;
   //TimerDocumentos.Enabled     := True;
end;

procedure TFormMenuAdmin.FormResize(Sender: TObject);
begin
   //AdjustButtonSize(PanelSuperior.Width, PanelSuperior.Height);
end;

//procedure TFormMenuAdmin.LoadTreeViewFromMenu(prmTreeView :TTreeview; prmMenu :TPopupMenu; prmMenuItem :TMenuItem);
//var i :Integer;
//    j :Integer;
//begin
//   PanelBoton.Caption := prmMenuItem.Caption;
//   if prmMenuItem = MenuItemSistema           then ImagenGrande.Picture.Assign(ImageSistema.Picture       ) else
//   if prmMenuItem = MenuItemTopComercial      then ImagenGrande.Picture.Assign(ImageComercial.Picture     ) else
//   if prmMenuItem = MenuItemTopOfTecnica      then ImagenGrande.Picture.Assign(ImageOficinaTecnica.Picture) else
//   if prmMenuItem = MenuItemTopPlanificacion  then ImagenGrande.Picture.Assign(ImagePlanificacion.Picture ) else
//   if prmMenuItem = MenuItemTopCompras        then ImagenGrande.Picture.Assign(ImageCompras.Picture       ) else
//   if prmMenuItem = MenuItemTopFabricacion    then ImagenGrande.Picture.Assign(ImageFabricacion.Picture   ) else
//   if prmMenuItem = MenuItemTopExpediciones   then ImagenGrande.Picture.Assign(ImageLogistExpedic.Picture ) else
//   if prmMenuItem = MenuItemTopColocacion     then ImagenGrande.Picture.Assign(ImageObraEnCurso.Picture   ) else
//   if prmMenuItem = MenuItemTopAdministracion then ImagenGrande.Picture.Assign(ImageAdministracion.Picture) else
//   if prmMenuItem = MenuItemTopCalidad        then ImagenGrande.Picture.Assign(ImageCalidad.Picture       ) else
//   if prmMenuItem = MenuItemTopConfiguracion  then ImagenGrande.Picture.Assign(ImageConfiguracion.Picture ) ;
//   prmTreeView.Items.Clear;
//   
//   i := 0;
//   while not (prmMenu.Items[i].Name = prmMenuItem.Name) do Inc(i);
//   for j := 0 to prmMenu.Items[i].Count - 1 do begin
//      CreateTreeViewItem(prmTreeView, prmMenu.Items[i][j], nil);
//   end;
//end;

//procedure TFormMenuAdmin.CreateTreeViewItem(prmTreeView :TTreeview; prmMenu :TMenuItem; prmPadre :TTreeNode);
//var i     :Integer;
//    Nodo  :TTreeNode;
//    Nodo2 :TTreeNode;
//
//   function noand(const s:string):string; // strips off "&" in captions
//   begin
//      Result := s;
//      while Pos('&', Result) > 0 do begin
//         Delete(Result, Pos('&', Result), 1);
//      end;
//   end;
//
//begin
//   if prmPadre = nil then begin
//      Nodo := prmTreeView.Items.AddChild(prmPadre, noand(prmMenu.Caption)); // n = new node
//      Nodo.Data       := prmMenu; {the data part of the node points out the menu item}
//      Nodo.ImageIndex := -1; //prmMenu.ImageIndex;
//      //if prmMenu.ImageIndex = -1 then n.ImageIndex := 0;
//      Nodo.SelectedIndex := Nodo.ImageIndex;
//   end
//   else Nodo := prmPadre;
//
//   for i := 0 to prmMenu.Count -1 do begin
//     if prmMenu.Items[i].Caption ='-' then Continue;
//     if not prmMenu.Items[i].Visible  then Continue;
//     Nodo2 := prmTreeView.Items.AddChild(Nodo, noand(prmMenu.Items[i].Caption)); // n2 = new subnode of n
//     Nodo2.Data          := prmMenu.Items[i]; // points out the original menu item
//     Nodo2.ImageIndex    := prmMenu.Items[i].ImageIndex; // glyph stuff. see above
//     Nodo2.SelectedIndex := Nodo2.Imageindex;
//     // recursive call if current item has children
//     if prmMenu.Items[i].Count > 0 then CreateTreeViewItem(prmTreeView, prmMenu.Items[i], Nodo2);
//    end;
//end;

procedure TFormMenuAdmin.FormShow(Sender: TObject);
//var i :Integer;
begin
   //DM.SetDigitsSemanaTrabajo(ccDigit1, ccDigit2, FormatFloat('00', DM.SemanaTrabajo));
   //i := 0;
   //while (not (Pos('hostname', LowerCase(DM.DB.Params[i])) <> 0)) or (i = DM.DB.Params.Count - 1) do Inc(i);
   //MenuItemRecuperarConexion.Caption := 'Recuperar Conexión : ' + DM.DB.Params[i];
end;

//procedure TFormMenuAdmin.AdjustButtonSize(W :Integer; H :Integer);
//const MAX_W = 70;
//var Count       :Integer;
//    MinW        :Integer;
//    i           :Integer;
//    Space       :Integer;
//    Temp        :Integer;
//    Remain      :Integer;
//    x           :Integer;
//    MinBtnSize  :TPoint;
//    ButtonWidth :Integer;
//begin
//   MinBtnSize := Point(20, 20);
//
//   Count := 13; {Número de Botones}
//   MinW := Count * (MinBtnSize.X);
//   if W < MinW  then W := MinW;
//   //if H < MinBtnSize.Y then H := MinBtnSize.Y;
//   ButtonWidth := (W) div Count;
//   Temp        := Count * (ButtonWidth);
//   //if Align = alNone  then W := Temp;
//   //X := ccDigit2.Left + ccDigit2.Width;
//   X := 0;
//   Remain := W - Temp;
//   Temp   := Count div 2;
//
//   if ButtonWidth > MAX_W then ButtonWidth := MAX_W;
//
//   for i := 1 to Count do begin
//      Space := 0;
//      if Remain <> 0  then begin
//         Dec(Temp, Remain);
//         if Temp < 0 then begin
//            Inc (Temp, Count);
//            Space := 1;
//         end;
//      end;
//
//      case i of
//          1:BtnSistema.SetBounds       (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          2:BtnComercial.SetBounds     (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          3:BtnOficinaTecnica.SetBounds(X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          4:BtnPlanificacion.SetBounds (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          5:BtnCompras.SetBounds       (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          6:BtnFabricacion.SetBounds   (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          7:BtnLogistExpedic.SetBounds (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          8:BtnObraEnCurso.SetBounds   (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//          9:BtnAdministracion.SetBounds(X, 0, ButtonWidth + Space, PanelSuperior.Height);
//         10:BtnCalidad.SetBounds       (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//         11:BtnConfiguracion.SetBounds (X, 0, ButtonWidth + Space, PanelSuperior.Height);
//         //10:SpeedButton10.SetBounds(X, 0, ButtonWidth + Space, PanelSuperior.Height);
//         12:BtnSalir.SetBounds(X, 0, ButtonWidth + Space, PanelSuperior.Height);
//         13:BtnX.SetBounds(X, 0, ButtonWidth + Space, PanelSuperior.Height);
//      end;
//      Inc(X, ButtonWidth + Space);
//   end;
//end;

end.
