unit MenuPrincipal;
interface
uses Windows, TXComp, TXRB, Menus, ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
     ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ovcbase, AppEvnts, ImgList, Controls, Buttons, fcButton,
     fcImgBtn, ExtCtrls, Graphics, Classes, Forms, SysUtils, DB, ppdevice, ppFildev, ppMemo, ppModule, ppNoDataDlg,
     ppRegion, ppStrtch, ppSubRpt, ppTypes, ppViewr, jpeg,
     CustomView;
type
   TFormPrincipal = class(TCustomView)
    ImageList: TImageList;
    ApplicationEvents: TApplicationEvents;
    OvcController: TOvcController;
    Enlace1: TppBDEPipeline;
    InformePrincipal: TppReport;
    Panel1: TPanel;
    ExtraOptions: TExtraOptions;
    BtnCuentas: TSpeedButton;
    BtnSubCuentas: TSpeedButton;
    BtnCargaAsientos: TSpeedButton;
    BtnCargaNominas: TSpeedButton;
    BtnListadoAsientos: TSpeedButton;
    BtnListadoMayor: TSpeedButton;
    BtnCargaFacturasCompra: TSpeedButton;
    BtnCargaFacturasVenta: TSpeedButton;
    BtnCargaSimplificada: TSpeedButton;
    BtnCargaCobrosPagos: TSpeedButton;
    Enlace2: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    MenuPrincipal: TMainMenu;
    MenuItemMaestros: TMenuItem;
    MenuItemTiposDiario: TMenuItem;
    MenuItemFormasPago: TMenuItem;
    MenuItemComerciales: TMenuItem;
    MenuItemConceptos: TMenuItem;
    MenuItemProvincias: TMenuItem;
    MenuItemPaises: TMenuItem;
    MenuItemSalir: TMenuItem;
    MenuItemTitulos: TMenuItem;
    MenuItemTraspasoDatos: TMenuItem;
    MenuItemActualizacionDB: TMenuItem;
    MenuItemVentana: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    LineaCabecera1: TppLabel;
    ppShape4: TppShape;
    ppDBText10: TppDBText;
    LineaDescripcion: TppLabel;
    InformeLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppShape2: TppShape;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    LineaTipoConta: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppImporte3: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    EstiloPagina: TppPageStyle;
    ppLabel11: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText15: TppDBText;
    ppSuma1: TppDBCalc;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppImporte1: TppDBText;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppImporte2: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SMBtnSalirClick(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure Enlace1Open(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDBText9Print(Sender: TObject);
    procedure MenuItemGruposClick(Sender: TObject);
    procedure MenuItemProvinciasClick(Sender: TObject);
    procedure MenuItemPaisesClick(Sender: TObject);
    procedure MenuItemConceptosClick(Sender: TObject);
    procedure MenuItemTitulosClick(Sender: TObject);
    procedure MenuItemCuentasCuentasClick(Sender: TObject);
    procedure MenuItemSubCuentasClick(Sender: TObject);
    procedure MenuItemListadoAsientosClick(Sender: TObject);
    procedure MenuItemMayorClick(Sender: TObject);
    procedure MenuItemGeneralClick(Sender: TObject);
    procedure MenuItemRecalculoSaldosClick(Sender: TObject);
    procedure MenuItemTraspasoApuntesEntreCuentasClick(Sender: TObject);
    procedure MenuItemProcesoAutomatizadoClick(Sender: TObject);
    procedure MenuItemModelo300Click(Sender: TObject);
    procedure MenuItemLibroFacturasEmitidasClick(Sender: TObject);
    procedure MenuItemLibroFacturasRecibidasClick(Sender: TObject);
    procedure MenuItemOperacionesTerceros347Click(Sender: TObject);
    procedure MenuItemSumasYSaldosClick(Sender: TObject);
    procedure MenuItemSituacionClick(Sender: TObject);
    procedure MenuItemPerdidasYGananciasClick(Sender: TObject);
    procedure MenuItemFacturasCompraClick(Sender: TObject);
    procedure MenuItemCargaSimplificadaClick(Sender: TObject);
    procedure MenuItemCargaAsientosClick(Sender: TObject);
    procedure MenuItemConectarseAClick(Sender: TObject);
    procedure MenuItemTraspasoDatosClick(Sender: TObject);
    procedure MenuItemBorradoGeneralAsientosClick(Sender: TObject);
    procedure MenuItemPunteoAutomaticoAsientos(Sender: TObject);
    procedure MenuItemAmortizacionesClick(Sender: TObject);
    procedure MenuItemCarteraEfectosClick(Sender: TObject);
    procedure MeMenuItemCuentasAnaliticasClick(Sender: TObject);
    procedure MenuItemLibroFacturasBienesInversion(Sender: TObject);
    procedure MenuItemOperacionesCEEClick(Sender: TObject);
    procedure MenuItemEnlaceContableClick(Sender: TObject);
    procedure MenuItemFacturasVentaClick(Sender: TObject);
    procedure MenuItemNominasClick(Sender: TObject);
    procedure MenuItemIRPF110Click(Sender: TObject);
    procedure MenuItemImpuestoSociedades202Click(Sender: TObject);
    procedure MenuItemCopiaAsientosEntreEmpresas(Sender: TObject);
    procedure MenuItemAcumuladosClick(Sender: TObject);
    procedure MenuItemExplotacionClick(Sender: TObject);
    procedure MenuItemTiposDiarioClick(Sender: TObject);
    procedure MenuItemComercialesClick(Sender: TObject);
    procedure MenuItemDelegacionesClick(Sender: TObject);
    procedure MenuItemDepartamentosClick(Sender: TObject);
    procedure MenuItemSeccionesClick(Sender: TObject);
    procedure MenuItemProyectosClick(Sender: TObject);
    procedure MenuItemFormasPagoClick(Sender: TObject);
    procedure MenuItemIRPF115Click(Sender: TObject);
    procedure MenuItemImpresionPlanContableClick(Sender: TObject);
    procedure MenuItemImpresionPlanAnaliticaClick(Sender: TObject);
    procedure MenuItemCobrosPagosClick(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure SUBINFORMEPrint(Sender: TObject);
    procedure ppDetalleAsientoBeforeGenerate(Sender: TObject);
    procedure SUBINFORME_ASIENTOSPrint(Sender: TObject);
    procedure MenuItemFacturacionClick(Sender: TObject);
    procedure MenuItemImportacionClick(Sender: TObject);
    procedure MenuItemSalirClick(Sender: TObject);
    procedure MenuItemActualizacionDBClick(Sender: TObject);
   private
     FSubInformesImpresos :set of 1..255;
     FNombreInforme       :string;

     procedure RellenarLineasCabeceraDescripcion(Nombre_Archivo :string; DataSource :TDataSource);
     procedure RellenarLineasCabeceraInforme    (Nombre_Archivo :string; DataSource :TDataSource);
     procedure RellenarLineasPie(Nombre_Archivo :string);
     procedure CamposOpcionales(MostrarCamposOpcionales :Boolean);
   public
     RejillaActiva :Word;
     procedure LanzarListado(Nombre_Archivo :string;
                             prmDataSource  :TDataSource;
                             MonedaImpresion         :string  = 'P';
                             Recorrer                :Boolean = True;
                             ImprimirPortada         :Boolean = False;
                             SaltoPagina             :Boolean = False;
                             ImprimirDetalle         :Boolean = False;
                             ImpresionDuplex         :Boolean = False;
                             ImprimirSoloRegActual   :Boolean = False;
                             MostrarCamposOpcionales :Boolean = True);
     procedure ReportTemplateEvent(Sender: TObject);
     procedure PonerTituloMenu;
   end;

var
   FormPrincipal   :TFormPrincipal;
   totalPaginas :Double;

implementation

uses Dialogs, General, Globales, Cadenas, DM, DMConta, Registry, ogUtil, Wwdbgrid,
     ccUtilesMDIForms,
     ib, ShellApi, stBase, UAmortizaciones, UAnaliticas, UBalAcumulados, UBalExplotacion, UBorradoDiario,
     UCargaApuntes, UCargaCobrosPagos, UCargaRapidaFacturas, UCargaRapidaNominas, UCarteraEfectos,
     UCierreEjercicio, UComerciales, UConceptos, UCopiaAsientos, UCuentas, UDelegaciones, UDepartamentos,
     UDiario, UEmpresas, UEnlaceContable, UEspere, UFiltro347, UFiltroBalances, UFiltroLibroFacturasEmitidas,
     UFiltroListadosAsientos, UFiltroListadosMayor, UFiltroSitPgGg, UFormasPago, UGrupos, UImportacion,
     UIrpf110, UIrpf115, UISoc202, UPaises, UParametrizacion, UParametrizacionFacturacion,
     UPlanAnalico, UPlanContable, UPreviewForm, Proyectos, UPunteoDiario, URecalculoSaldos,
     USecciones, USubCuentas, UTiposDiario, UTitulos, UTraspasoApuntes, UTraspasoDatos,
     Provincias, UActualizacionBD;
{$R *.DFM}

procedure TFormPrincipal.LanzarListado(Nombre_Archivo :string;
                                       prmDataSource  :TDataSource;
                                       MonedaImpresion         :string  = 'P';
                                       Recorrer                :Boolean = True;
                                       ImprimirPortada         :Boolean = False;
                                       SaltoPagina             :Boolean = False;
                                       ImprimirDetalle         :Boolean = False;
                                       ImpresionDuplex         :Boolean = False;
                                       ImprimirSoloRegActual   :Boolean = False;
                                       MostrarCamposOpcionales :Boolean = True);
var Marca: TBookMarkStr;
begin
   FNombreInforme := Nombre_Archivo;

   Marca := prmDataSource.DataSet.BookMark;
   Enlace1.DataSource := prmDataSource;

   InformePrincipal.DataPipeline      := Enlace1;
   InformePrincipal.Template.FileName := gvDirInformes + Nombre_Archivo;
   InformePrincipal.Template.LoadFromFile;
   InformePrincipal.Device            := dvScreen;

   InformePrincipal.AllowPrintToFile := True;
   InformePrincipal.TextFileType     := ftFixedLength;

   { Rellenar las líneas de cabecera del informe }
   RellenarLineasCabeceraInforme(Nombre_Archivo, prmDataSource);

   { Impresión duplex }
   if ImpresionDuplex then InformePrincipal.PrinterSetup.Duplex := dpVertical
                      else InformePrincipal.PrinterSetup.Duplex := dpNone;
   { Salto de página }
   if (Self.FindComponent('ppGroupPrincipal') <> nil) then begin
      TppGroup(Self.FindComponent('ppGroupPrincipal')).NewPage := SaltoPagina;
   end;

   { Imprimir portada }
   // TppTitleBand(Self.FindComponent('Portada')).Visible := ImprimirPortada;
   //  Si Visible = FALSE, imprime la portada en blanco. Para evitarlo, es
   // necesario destruir el componente Portada.
   if (Self.FindComponent('Portada') <> nil) and not ImprimirPortada then begin
      TppTitleBand(Self.FindComponent('Portada')).Free;
   end;

   { Imprimir Banda de detalle }
   if (Self.FindComponent('ppBandaDetalle1') <> nil) and not ImprimirDetalle then begin
      TppSubReport(Self.FindComponent('ppBandaDetalle1')).Free;
   end;

   if (Self.FindComponent('EstiloPagina') <> nil) then begin
      TppPageStyle(Self.FindComponent('EstiloPagina')).Free;
   end;

   Moneda(Self, MonedaImpresion);
   CamposOpcionales(MostrarCamposOpcionales);

   if Recorrer then begin
      prmDataSource.DataSet.DisableControls;
   end;

   if ImprimirSoloRegActual then begin
      Enlace1.RangeBegin := rbCurrentRecord;
      Enlace1.RangeEnd   := reCurrentRecord;
   end
   else begin
      Enlace1.RangeBegin := rbFirstRecord;
      Enlace1.RangeEnd   := reLastRecord;
   end;

   if (UpperCase(Nombre_Archivo) = 'LMAYOR.RTM'                      ) or
      (UpperCase(Nombre_Archivo) = 'LASIENTOS.RTM'                   ) or
      (UpperCase(Nombre_Archivo) = 'LASIENTOSEXPANDIDO.RTM'          ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDAS.RTM'      ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASTIPOIVA.RTM'       ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM') then begin
      FSubInformesImpresos := [];
      if not Assigned(WPreviewForm) then begin
         WPreviewForm := TWPreviewForm.Create(nil);
      end;

      InformePrincipal.PrintToDevices;

      WPreviewForm.FNombreArchivo := Nombre_Archivo;
      WPreviewForm.ShowModal;
      WPreviewForm := nil;
   end
   else begin
      InformePrincipal.Print;

      if not prmDataSource.DataSet.EOF then begin
         prmDataSource.DataSet.BookMark := Marca;
      end;
   end;

   if Recorrer then begin
      prmDataSource.DataSet.EnableControls;
   end;
end;

procedure TFormPrincipal.CamposOpcionales(MostrarCamposOpcionales: Boolean);
var i :integer;
begin
   for i := 0 to Self.ComponentCount - 1 do begin
      if Self.Components[i] is TppCustomComponent then begin
         if Copy(UpperCase(TppCustomComponent(Self.Components[i]).UserName), 1, 8) = 'OPCIONAL' then begin
            TppCustomComponent(Self.Components[i]).Visible := MostrarCamposOpcionales;
         end;
      end;
   end;
end;

procedure TFormPrincipal.RellenarLineasCabeceraDescripcion(Nombre_Archivo: String; DataSource: TDataSource);
var Descripcion :string;
begin
   if gvFormatoOficial and ((UpperCase(Nombre_Archivo) = 'LASIENTOS.RTM'                    ) or
                            (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDAS.RTM'       ) or
                            (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASTIPOIVA.RTM'        ) or
                            (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM' ) or
                            (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDAS.RTM'      ) or
                            (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDASSUBCTA.RTM') or
                            (UpperCase(Nombre_Archivo) = 'LMAYOR.RTM'                       )) then begin
      if Self.FindComponent('LbAsiento') <> nil then TppLabel(Self.FindComponent('LbAsiento')).Visible := False;
      if Self.FindComponent('LbApunte' ) <> nil then TppLabel(Self.FindComponent('LbApunte' )).Visible := False;
      if Self.FindComponent('cAsiento' ) <> nil then TppLabel(Self.FindComponent('cAsiento' )).Visible := False;
      if Self.FindComponent('cApunte'  ) <> nil then TppLabel(Self.FindComponent('cApunte'  )).Visible := False;
   end;

   if (UpperCase(Nombre_Archivo) = 'LASIENTOS.RTM'                    ) or
      (UpperCase(Nombre_Archivo) = 'LASIENTOSEXPANDIDO.RTM'           ) or
      (UpperCase(Nombre_Archivo) = 'LMAYOR.RTM'                       ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDAS.RTM'       ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASTIPOIVA.RTM'        ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM' ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDAS.RTM'      ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDASSUBCTA.RTM') or
      (UpperCase(Nombre_Archivo) = 'LOPERATER347.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LOPERATER349.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCESITUACION.RTM'            ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCESITUACIONANTERIOR.RTM'    ) or
      (UpperCase(Nombre_Archivo) = 'LCUENTAPPGG.RTM'                  ) or
      (UpperCase(Nombre_Archivo) = 'LCUENTAPPGGANTERIOR.RTM'          ) or
      (UpperCase(Nombre_Archivo) = 'LSUMASSALDOS.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LSUMASSALDOSSALDO.RTM'            ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEACUMULADOS.RTM'           ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEEXPLOTACION.RTM'          ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEEXPLOTACION_ANALITICA.RTM') or
      (UpperCase(Nombre_Archivo) = 'LMODELO300.RTM'                   ) then begin{ Descripción }
      Descripcion := 'Desde la fecha ' + FormatDateTime('dd/mm/yyyy',
                     DataSource.DataSet.FieldByName('FechaInicial').AsDateTime) + ' hasta ' +
                     FormatDateTime('dd/mm/yyyy', DataSource.DataSet.FieldByName('FechaFinal').AsDateTime);
   end;

   { Rellenar Línea de Nombre de empresa }
   if Self.FindComponent('LineaCabecera1') <> nil then begin
      TppLabel(Self.FindComponent('LineaCabecera1')).Caption := gvNombreEmpresa;
   end;

   if (UpperCase(Nombre_Archivo) = 'LASIENTOS.RTM'                    ) or
      (UpperCase(Nombre_Archivo) = 'LASIENTOSEXPANDIDO.RTM'           ) or
      (UpperCase(Nombre_Archivo) = 'LMAYOR.RTM'                       ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDAS.RTM'       ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASTIPOIVA.RTM'        ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDAS.RTM'      ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM' ) or
      (UpperCase(Nombre_Archivo) = 'LLIBROFACTURASRECIBIDASSUBCTA.RTM') or
      (UpperCase(Nombre_Archivo) = 'LOPERATER347.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LOPERATER349.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCESITUACION.RTM'            ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCESITUACIONANTERIOR.RTM'    ) or
      (UpperCase(Nombre_Archivo) = 'LINGRESOSGASTOS.RTM'              ) or
      (UpperCase(Nombre_Archivo) = 'LCUENTAPPGG.RTM'                  ) or
      (UpperCase(Nombre_Archivo) = 'LCUENTAPPGGANTERIOR.RTM'          ) or
      (UpperCase(Nombre_Archivo) = 'LSUMASSALDOS.RTM'                 ) or
      (UpperCase(Nombre_Archivo) = 'LSUMASSALDOSSALDO.RTM'            ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEACUMULADOS.RTM'           ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEEXPLOTACION.RTM'          ) or
      (UpperCase(Nombre_Archivo) = 'LBALANCEEXPLOTACION_ANALITICA.RTM') or
      (UpperCase(Nombre_Archivo) = 'LMODELO300.RTM'                   ) then begin
      { Rellenar Etiqueta de tipo de contabilidad }
      if Self.FindComponent('LineaTipoConta'  ) <> nil then TppLabel(Self.FindComponent('LineaTipoConta'  )).Caption := gvTipoConta;
      { Rellenar Línea de Descripción }
      if Self.FindComponent('LineaDescripcion') <> nil then TppLabel(Self.FindComponent('LineaDescripcion')).Caption := Descripcion;
      { Rellenar Línea de Descripción Portada }
      if Self.FindComponent('LineaPortada4'   ) <> nil then TppLabel(Self.FindComponent('LineaPortada4'   )).Caption := Descripcion;
   end;
end;

procedure TFormPrincipal.RellenarLineasCabeceraInforme(Nombre_Archivo: String; DataSource: TDataSource);
begin
   RellenarLineasCabeceraDescripcion(Nombre_Archivo, DataSource);
   RellenarLineasPie(Nombre_Archivo);
end;

procedure TFormPrincipal.RellenarLineasPie(Nombre_Archivo: String);
begin
   // Rellenar Líneas de Pie
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
   InformePrincipal.Template.OnNew     := ReportTemplateEvent;
   InformePrincipal.Template.OnLoadEnd := ReportTemplateEvent;

   gvDirectorio   := ExtractFilePath(Application.ExeName);
   gvDirImagenes  := gvDirectorio + gcDirImagenes;

   {***************************************************************************************}

   { Este valor indica a AbrirEmpresa un modo de funcionamiento. }
   //DMControlRef.AbrirEmpresa(gvEmpresaActual);
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
   PonerTituloMenu;
end;

procedure TFormPrincipal.SMBtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFormPrincipal.ApplicationEventsException(Sender: TObject; E: Exception);
var Mensaje  :string;
    Busca    :string;
    Posicion :Cardinal;
    M        :Char;
    B        :Char;
begin
   if E is EInOutError then begin
      gvProcesoAbortado := True;
   end
   else begin
      Mensaje := E.Message;
      if (E is EibInterbaseError) and (EibInterbaseError(E).sqlCode = -803) then begin
         Mensaje := 'El registro que intenta introducir ya existe con ese código.';
      end;

      if (E is EibInterbaseError) and (EibInterbaseError(E).sqlCode = -836) then begin
         Busca := #10;
         M     := Mensaje[1];
         B     := Busca[1];
         Search(M, Length(Mensaje), B, Length(Busca), Posicion);
         Mensaje := Copy(Mensaje, Posicion + 2, Length(Mensaje));
      end;

      MessageDlg(Mensaje, mtInformation, [mbOK], 0);
   end;
end;

procedure TFormPrincipal.Enlace1Open(Sender: TObject);
begin
   if not Assigned(WPreviewForm) then begin
      if not(InformePrincipal.PreviewForm.WindowState = wsMaximized) then begin
         InformePrincipal.PreviewForm.Visible     := False;
         InformePrincipal.PreviewForm.BorderIcons := InformePrincipal.PreviewForm.BorderIcons - [biMinimize];
         InformePrincipal.PreviewForm.BorderStyle := bsNone;
         InformePrincipal.PreviewForm.WindowState := wsMaximized;
         TppViewer(InformePrincipal.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
         InformePrincipal.PreviewForm.Visible     := True;
      end;
   end
   else begin
      DMContaRef.QInfDiario.Close;
      DMContaRef.QInfDiario.ParamByName('ASIENTO').AsInteger := 0;
      DMContaRef.QInfDiario.Open;
      Enlace2.DataSource := DMContaRef.SInfDiario;
   end;
end;

procedure TFormPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := MessageDlg('¿Desea finalizar la aplicación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
   if CanClose then begin
      DMContaRef.Free;
      DMRef.Free;
   end;
end;

procedure TFormPrincipal.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   TotalPaginas := 0;
   if Self.FindComponent('TotalPagina') <> nil then begin
      TppLabel(Self.FindComponent('TotalPagina')).Caption := FloatToStr(TotalPaginas);
   end;
end;

procedure TFormPrincipal.ppDBText9Print(Sender :TObject);
begin
   if Self.FindComponent('ppDBText9') <> nil then begin
      TotalPaginas := TotalPaginas + TppDBText(Self.FindComponent('ppDBText9')).FieldValue;
   end;
   if Self.FindComponent('TotalPagina') <> nil then begin
      TppLabel(Self.FindComponent('TotalPagina')).Caption := FloatToStrF(TotalPaginas, ffNumber, 10, 2);
   end;
end;

procedure TFormPrincipal.PonerTituloMenu;
begin
   Self.Caption := Space(15) + gvNombreEmpresaMenu + Space(15) + '-' + space(5) +
      'GESTION CONTABLE PYMES  Versión 5.0 (1997-2012)';
end;

procedure TFormPrincipal.MenuItemGruposClick(Sender: TObject);
begin
   {$Message Warn '1ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WGRUPOS') then Exit;
   if not Assigned(WGrupos) then WGrupos := TWGrupos.Create(nil);
   WGrupos.Show;
end;

procedure TFormPrincipal.MenuItemProvinciasClick(Sender: TObject);
begin
   {$Message Warn '2ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPROVINCIAS') then Exit;
   //if not Assigned(WProvincias) then WProvincias := TWProvincias.Create(nil);
   //WProvincias.Show;
   ccInsertForm(Self, TFormProvincias);
   //if not Assigned(FormProvincias) then FormProvincias := TFormProvincias.Create(nil);
   //FormProvincias.Show;
end;

procedure TFormPrincipal.MenuItemPaisesClick(Sender: TObject);
begin
   {$Message Warn '3ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPAISES') then Exit;
   if not Assigned(WPaises) then WPaises := TWPaises.Create(nil);
   WPaises.Show;
end;

procedure TFormPrincipal.MenuItemConceptosClick(Sender: TObject);
begin
   {$Message Warn '4ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCONCEPTOS') then Exit;
   if not Assigned(WConceptos) then WConceptos := TWConceptos.Create(nil);
   WConceptos.Show;
end;

procedure TFormPrincipal.MenuItemTitulosClick(Sender: TObject);
begin
   {$Message Warn '6ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTITULOS') then Exit;
   if not Assigned(WTitulos) then WTitulos := TWTitulos.Create(nil);
   WTitulos.Show;
end;

procedure TFormPrincipal.MenuItemCuentasCuentasClick(Sender: TObject);
begin
   {$Message Warn '7ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCUENTAS') then Exit;
   if not Assigned(WCuentas) then WCuentas := TWCuentas.Create(nil);
   WCuentas.Show;
end;

procedure TFormPrincipal.MenuItemSubCuentasClick(Sender: TObject);
begin
   {$Message Warn '8ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WSUBCUENTAS') then Exit;
   if not Assigned(WSubcuentas) then WSubcuentas := TWSubcuentas.Create(nil);
   WSubcuentas.Show;
end;

procedure TFormPrincipal.MenuItemListadoAsientosClick(Sender: TObject);
begin
   {$Message Warn '9ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLISTADOSASIENTOS') then Exit;
   if not Assigned(WFiltroListadosAsientos) then WFiltroListadosAsientos := TWFiltroListadosAsientos.Create(nil);
   WFiltroListadosAsientos.TipoListado := INF_ASIENTOS;
   WFiltroListadosAsientos.ShowModal;
   WFiltroListadosAsientos := nil;
end;

procedure TFormPrincipal.MenuItemMayorClick(Sender: TObject);
begin
   {$Message Warn '10ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLISTADOSMAYOR') then Exit;
   if not Assigned(WFiltroListadosMayor) then WFiltroListadosMayor := TWFiltroListadosMayor.Create(nil);
   WFiltroListadosMayor.TipoListado := INF_MAYOR;
   WFiltroListadosMayor.ShowModal;
   WFiltroListadosMayor := nil;
end;

procedure TFormPrincipal.MenuItemGeneralClick(Sender: TObject);
begin
   {$Message Warn '11ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPARAMETRIZACION') then Exit;
   if not Assigned(WParametrizacion) then WParametrizacion := TWParametrizacion.Create(nil);
   WParametrizacion.ShowModal;
   WParametrizacion.Free;
   WParametrizacion := nil;
end;

procedure TFormPrincipal.MenuItemFacturacionClick(Sender: TObject);
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

procedure TFormPrincipal.MenuItemRecalculoSaldosClick(Sender: TObject);
begin
   {$Message Warn '13ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WRECALCULOSALDOS') then Exit;
   if not Assigned(WRecalculoSaldos) then WRecalculoSaldos := TWRecalculoSaldos.Create(nil);
   WRecalculoSaldos.ShowModal;
   WRecalculoSaldos.Free;
   WRecalculoSaldos := nil;
end;

procedure TFormPrincipal.MenuItemTraspasoApuntesEntreCuentasClick(Sender: TObject);
begin
   {$Message Warn '14ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTRASPASOAPUNTES') then Exit;
   if not Assigned(WTraspasoApuntes) then WTraspasoApuntes := TWTraspasoApuntes.Create(nil);
   WTraspasoApuntes.ShowModal;
   WTraspasoApuntes.Free;
   WTraspasoApuntes := nil;
end;

procedure TFormPrincipal.MenuItemProcesoAutomatizadoClick(Sender: TObject);
begin
   {$Message Warn '15ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCIERREEJERCICIO') then Exit;
   if not Assigned(WCierreEjercicio) then WCierreEjercicio := TWCierreEjercicio.Create(nil);
   WCierreEjercicio.ShowModal;
   WCierreEjercicio.Free;
   WCierreEjercicio := nil;
end;

procedure TFormPrincipal.MenuItemModelo300Click(Sender: TObject);
begin
   {$Message Warn '16ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_MOD_300;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TFormPrincipal.MenuItemLibroFacturasEmitidasClick(Sender: TObject);
begin
   {$Message Warn '17ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_EMITIDAS;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TFormPrincipal.MenuItemLibroFacturasRecibidasClick(Sender: TObject);
begin
   {$Message Warn '18ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_RECIBIDAS;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TFormPrincipal.MenuItemOperacionesTerceros347Click(Sender: TObject);
begin
   {$Message Warn '19ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTRO347') then Exit;
   if not Assigned(WFiltro347) then WFiltro347 := TWFiltro347.Create(nil);
   WFiltro347.TipoListado := INF_MOD_347;
   WFiltro347.ShowModal;
   WFiltro347.Free;
   WFiltro347 := nil;
end;

procedure TFormPrincipal.MenuItemSumasYSaldosClick(Sender: TObject);
begin
   {$Message Warn '20ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROBALANCES') then Exit;
   if not Assigned(WFiltroBalances) then WFiltroBalances := TWFiltroBalances.Create(nil);
   WFiltroBalances.TipoListado := INF_BALANCE_SUMAS_Y_SALDOS;
   WFiltroBalances.ShowModal;
   WFiltroBalances := nil;
end;

procedure TFormPrincipal.MenuItemSituacionClick(Sender: TObject);
begin
   {$Message Warn '21ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROSITPGGG') then Exit;
   if not Assigned(WFiltroSitPgGg) then WFiltroSitPgGg := TWFiltroSitPgGg.Create(nil);
   WFiltroSitPgGg.TipoListado := INF_BALANCE_SITUACION;
   WFiltroSitPgGg.ShowModal;
   WFiltroSitPgGg := nil;
end;

procedure TFormPrincipal.MenuItemPerdidasYGananciasClick(Sender: TObject);
begin
   {$Message Warn '22ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROSITPGGG') then Exit;
   if not Assigned(WFiltroSitPgGg) then WFiltroSitPgGg := TWFiltroSitPgGg.Create(nil);
   WFiltroSitPgGg.TipoListado := INF_BALANCE_PERDIDAS_Y_GANANCIAS;
   WFiltroSitPgGg.ShowModal;
   WFiltroSitPgGg := nil;
end;

procedure TFormPrincipal.MenuItemFacturasCompraClick(Sender: TObject);
begin
   {$Message Warn '23ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDAFACTURAS') then Exit;
   if not Assigned(WCargaRapidaFacturas) then WCargaRapidaFacturas := TWCargaRapidaFacturas.Create(nil);
   WCargaRapidaFacturas.TipoCarga := CARGA_FACTURAS_COMPRA;
   WCargaRapidaFacturas.ShowModal;
   WCargaRapidaFacturas.Free;
   WCargaRapidaFacturas := nil;
end;

procedure TFormPrincipal.MenuItemCargaSimplificadaClick(Sender: TObject);
begin
   {$Message Warn '24ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGAAPUNTES') then Exit;
   if not Assigned(WCargaApuntes) then WCargaApuntes := TWCargaApuntes.Create(nil);
   WCargaApuntes.ShowModal;
   WCargaApuntes.Free;
   WCargaApuntes := nil;
end;

procedure TFormPrincipal.MenuItemCargaAsientosClick(Sender: TObject);
begin
   {$Message Warn '25ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDIARIO') then Exit;
   if not Assigned(WDiario) then WDiario := TWDiario.Create(nil);
   WDiario.Show;
end;

procedure TFormPrincipal.MenuItemTraspasoDatosClick(Sender: TObject);
begin
   {$Message Warn '26ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTRASPASODATOS') then Exit;
   if not Assigned(WTraspasoDatos) then WTraspasoDatos := TWTraspasoDatos.Create(nil);
   WTraspasoDatos.ShowModal;
   WTraspasoDatos.Free;
   WTraspasoDatos := nil;
end;

procedure TFormPrincipal.MenuItemBorradoGeneralAsientosClick(Sender: TObject);
begin
   {$Message Warn '27ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBORRADODIARIO') then Exit;
   if not Assigned(WBorradoDiario) then WBorradoDiario := TWBorradoDiario.Create(nil);
   WBorradoDiario.ShowModal;
   WBorradoDiario.Free;
   WBorradoDiario := nil;
end;

procedure TFormPrincipal.MenuItemPunteoAutomaticoAsientos(Sender: TObject);
begin
   {$Message Warn '28ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPUNTEODIARIO') then Exit;
   if not Assigned(WPunteoDiario) then WPunteoDiario := TWPunteoDiario.Create(nil);
   WPunteoDiario.ShowModal;
   WPunteoDiario.Free;
   WPunteoDiario := nil;
end;

procedure TFormPrincipal.MenuItemAmortizacionesClick(Sender: TObject);
begin
   {$Message Warn '29ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WAMORTIZACIONES') then Exit;
   if not Assigned(WAmortizaciones) then WAmortizaciones := TWAmortizaciones.Create(nil);
   WAmortizaciones.ShowModal;
   WAmortizaciones.Free;
   WAmortizaciones := nil;
end;

procedure TFormPrincipal.MenuItemCarteraEfectosClick(Sender: TObject);
begin
   {$Message Warn '30ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARTERAEFECTOS') then Exit;
   if not Assigned(WCarteraEfectos) then WCarteraEfectos := TWCarteraEfectos.Create(nil);
   WCarteraEfectos.Show;
end;

procedure TFormPrincipal.MeMenuItemCuentasAnaliticasClick(Sender: TObject);
begin
   {$Message Warn '31ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WANALITICAS') then Exit;
   if not Assigned(WAnaliticas) then WAnaliticas := TWAnaliticas.Create(nil);
   WAnaliticas.Show;
end;

procedure TFormPrincipal.MenuItemLibroFacturasBienesInversion(Sender: TObject);
begin
   {$Message Warn '33ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTROLIBROFACTEMITIDAS') then Exit;
   if not Assigned(WFiltroLibroFactEmitidas) then WFiltroLibroFactEmitidas := TWFiltroLibroFactEmitidas.Create(nil);
   WFiltroLibroFactEmitidas.TipoListado := INF_FACTURAS_BIENES;
   WFiltroLibroFactEmitidas.ShowModal;
   WFiltroLibroFactEmitidas.Free;
   WFiltroLibroFactEmitidas := nil;
end;

procedure TFormPrincipal.MenuItemOperacionesCEEClick(Sender: TObject);
begin
   {$Message Warn '34ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFILTRO347') then Exit;
   if not Assigned(WFiltro347) then WFiltro347 := TWFiltro347.Create(nil);
   WFiltro347.TipoListado := INF_MOD_349;
   WFiltro347.ShowModal;
   WFiltro347.Free;
   WFiltro347 := nil;
end;

procedure TFormPrincipal.MenuItemEnlaceContableClick(Sender: TObject);
begin
   {$Message Warn '35ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WENLACECONTABLE') then Exit;
   if not Assigned(WEnlaceContable) then WEnlaceContable := TWEnlaceContable.Create(nil);
   WEnlaceContable.ShowModal;
   WEnlaceContable.Free;
   WEnlaceContable := nil;
end;

procedure TFormPrincipal.MenuItemFacturasVentaClick(Sender: TObject);
begin
   {$Message Warn '36ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDAFACTURAS') then Exit;
   if not Assigned(WCargaRapidaFacturas) then WCargaRapidaFacturas := TWCargaRapidaFacturas.Create(nil);
   WCargaRapidaFacturas.TipoCarga := CARGA_FACTURAS_VENTA;
   WCargaRapidaFacturas.ShowModal;
   WCargaRapidaFacturas.Free;
   WCargaRapidaFacturas := nil;
end;

procedure TFormPrincipal.MenuItemNominasClick(Sender: TObject);
begin
   {$Message Warn '37ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGARAPIDANOMINAS') then Exit;
   if not Assigned(WCargaRapidaNominas) then WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
   WCargaRapidaNominas.ShowModal;
   WCargaRapidaNominas.Free;
   WCargaRapidaNominas := nil;
end;

procedure TFormPrincipal.MenuItemIRPF110Click(Sender: TObject);
begin
   {$Message Warn '38ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WIRPF110') then Exit;
   if not Assigned(WIrpf110) then WIrpf110 := TWIrpf110.Create(nil);
   WIrpf110.ShowModal;
   WIrpf110.Free;
   WIrpf110 := nil;
end;

procedure TFormPrincipal.MenuItemImpuestoSociedades202Click(Sender: TObject);
begin
   {$Message Warn '39ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WISOC202') then Exit;
   if not Assigned(WISoc202) then WISoc202 := TWISoc202.Create(nil);
   WISoc202.ShowModal;
   WISoc202.Free;
   WISoc202 := nil;
end;

procedure TFormPrincipal.MenuItemCopiaAsientosEntreEmpresas(Sender: TObject);
begin
   {$Message Warn '40ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCOPIAASIENTOS') then Exit;
   if not Assigned(WCopiaAsientos) then WCopiaAsientos := TWCopiaAsientos.Create(nil);
   WCopiaAsientos.ShowModal;
   WCopiaAsientos.Free;
   WCopiaAsientos := nil;
end;

procedure TFormPrincipal.MenuItemAcumuladosClick(Sender: TObject);
begin
   {$Message Warn '41ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBALACUMULADOS') then Exit;
   if not Assigned(WBalAcumulados) then WBalAcumulados := TWBalAcumulados.Create(nil);
   WBalAcumulados.ShowModal;
   WBalAcumulados.Free;
   WBalAcumulados := nil;
end;

procedure TFormPrincipal.MenuItemExplotacionClick(Sender: TObject);
begin
   {$Message Warn '42ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WBALEXPLOTACION') then Exit;
   if not Assigned(WBalExplotacion) then WBalExplotacion := TWBalExplotacion.Create(nil);
   WBalExplotacion.ShowModal;
   WBalExplotacion.Free;
   WBalExplotacion := nil;
end;

procedure TFormPrincipal.MenuItemTiposDiarioClick(Sender: TObject);
begin
   {$Message Warn '43ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WTIPOSDIARIO') then Exit;
   if not Assigned(WTiposDiario) then WTiposDiario := TWTiposDiario.Create(nil);
   WTiposDiario.Show;
end;

procedure TFormPrincipal.MenuItemComercialesClick(Sender: TObject);
begin
   {$Message Warn '44ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCOMERCIALES') then Exit;
   if not Assigned(WComerciales) then WComerciales := TWComerciales.Create(nil);
   WComerciales.Show;
end;

procedure TFormPrincipal.MenuItemDelegacionesClick(Sender: TObject);
begin
   {$Message Warn '45ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDELEGACIONES') then Exit;
   if not Assigned(WDelegaciones) then WDelegaciones := TWDelegaciones.Create(nil);
   WDelegaciones.Show;
end;

procedure TFormPrincipal.MenuItemDepartamentosClick(Sender: TObject);
begin
   {$Message Warn '46ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDEPARTAMENTOS') then Exit;
   if not Assigned(WDepartamentos) then WDepartamentos := TWDepartamentos.Create(nil);
   WDepartamentos.Show;
end;

procedure TFormPrincipal.MenuItemSeccionesClick(Sender: TObject);
begin
   {$Message Warn '47ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WSECCIONES') then Exit;
   if not Assigned(WSecciones) then WSecciones := TWSecciones.Create(nil);
   WSecciones.Show;
end;

procedure TFormPrincipal.MenuItemProyectosClick(Sender: TObject);
begin
   {$Message Warn '48ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPROYECTOS') then Exit;
   if not Assigned(WProyectos) then WProyectos := TWProyectos.Create(nil);
   WProyectos.Show;
end;

procedure TFormPrincipal.MenuItemFormasPagoClick(Sender: TObject);
begin
   {$Message Warn '49ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WFORMASPAGO') then Exit;
   if not Assigned(WFormasPago) then WFormasPago := TWFormasPago.Create(nil);
   WFormasPago.Show;
end;

procedure TFormPrincipal.MenuItemIRPF115Click(Sender: TObject);
begin
   {$Message Warn '50ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WIRPF115') then Exit;
   if not Assigned(WIrpf115) then WIrpf115 := TWIrpf115.Create(nil);
   WIrpf115.ShowModal;
   WIrpf115.Free;
   WIrpf115 := nil;
end;

procedure TFormPrincipal.MenuItemImpresionPlanContableClick(Sender: TObject);
begin
   {$Message Warn '51ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPLANCONTABLE') then Exit;
   if not Assigned(WPlanContable) then WPlanContable := TWPlanContable.Create(nil);
   WPlanContable.ShowModal;
   WPlanContable.Free;
   WPlanContable := nil;
end;

procedure TFormPrincipal.MenuItemImpresionPlanAnaliticaClick(Sender: TObject);
begin
   {$Message Warn '52ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WPLANANALITICO') then Exit;
   if not Assigned(WPlanAnalitico) then WPlanAnalitico := TWPlanAnalitico.Create(nil);
   WPlanAnalitico.ShowModal;
   WPlanAnalitico.Free;
   WPlanAnalitico := nil;
end;

procedure TFormPrincipal.MenuItemCobrosPagosClick(Sender: TObject);
begin
   {$Message Warn '53ª Ventana para Test}
   //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARGACOBROSPAGOS') then Exit;
   if not Assigned(WCargaCobrosPagos) then WCargaCobrosPagos := TWCargaCobrosPagos.Create(nil);
   WCargaCobrosPagos.ShowModal;
   WCargaCobrosPagos.Free;
   WCargaCobrosPagos := nil;
end;

procedure TFormPrincipal.MenuItemImportacionClick(Sender: TObject);
begin
   {$Message Warn '54ª Ventana para Test}
   if not Assigned(WImportacion) then WImportacion := TWImportacion.Create(nil);
   WImportacion.ShowModal;
   WImportacion.Free;
   WImportacion := nil;
end;

procedure TFormPrincipal.MenuItemActualizacionDBClick(Sender: TObject);
begin
   {$Message Warn '55ª Ventana para Test}
   if not Assigned(WActualizacionBD) then WActualizacionBD := TWActualizacionBD.Create(nil);
   WActualizacionBD.ShowModal;
   WActualizacionBD.Free;
   WActualizacionBD := nil;
end;

procedure TFormPrincipal.MenuItemConectarseAClick(Sender: TObject);
begin
   ShellExecute(handle, 'open', PChar('http://www.jher.es'), nil, nil, SW_MAXIMIZE);
end;

procedure TFormPrincipal.ReportTemplateEvent(Sender: TObject);
begin
   {set default report properties}
   InformePrincipal.AllowPrintToFile := True;
   ppUnRegisterDevice(TppTextFileDevice);
end;

procedure TFormPrincipal.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
   if (Self.FindComponent('SUBINFORME') <> nil) then begin
      TppSubReport(Self.FindComponent('SUBINFORME')).Tag := DMContaRef.QInformesContaAsiento.AsInteger;
   end;
end;

procedure TFormPrincipal.SUBINFORMEPrint(Sender: TObject);
begin
   DMContaRef.QInfDiario.Close;
   DMContaRef.QInfDiario.ParamByName('ASIENTO').AsInteger := TppSubReport(Sender).Tag;
   DMContaRef.QInfDiario.Open;

   if not DMContaRef.QInfDiario.EOF then begin
      if TppSubReport(Sender).DrillDownExpanded then begin
         if not (StrToInt(TppSubReport(Sender).CurrentExpansionKey) in FSubInformesImpresos) then begin
            WPreviewForm.FAsiento := TppSubReport(Sender).Tag;
         end;
         FSubInformesImpresos := FSubInformesImpresos + [StrToInt(TppSubReport(Sender).CurrentExpansionKey)];
      end else
      if (UpperCase(FNombreInforme) = 'LMAYOR.RTM'                      ) or
         (UpperCase(FNombreInforme) = 'LLIBROFACTURASEMITIDAS.RTM'      ) or
         (UpperCase(FNombreInforme) = 'LLIBROFACTURASTIPOIVA.RTM'       ) or
         (UpperCase(FNombreInforme) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM') then begin
         FSubInformesImpresos := FSubInformesImpresos - [StrToInt(TppSubReport(Sender).CurrentExpansionKey)];
      end
      else begin
         TppSubReport(Sender).RemoveExpansion(TppSubReport(Sender).CurrentExpansionKey);
         FSubInformesImpresos := FSubInformesImpresos -  [StrToInt(TppSubReport(Sender).CurrentExpansionKey)];
      end;
   end;
end;

procedure TFormPrincipal.ppDetalleAsientoBeforeGenerate(Sender: TObject);
begin
   // Almacenar el número de asiento
   if (Self.FindComponent('SUBINFORME_ASIENTOS') <> nil) then begin
      TppSubReport(Self.FindComponent('SUBINFORME_ASIENTOS')).Tag :=
         Enlace1.DataSource.DataSet.FieldByName('ASIENTO').AsInteger;
   end;
end;

procedure TFormPrincipal.SUBINFORME_ASIENTOSPrint(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TppSubReport(Sender) do begin
      TppRegion(DrillDownComponent).Brush.Color := clWhite;
      if DrillDownExpanded then begin
         if not (StrToInt(TppSubReport(Sender).CurrentExpansionKey) in FSubInformesImpresos) then begin
            TppRegion(DrillDownComponent).Brush.Color := gcClListado;
            FSubInformesImpresos  := FSubInformesImpresos + [StrToInt(CurrentExpansionKey)];
            WPreviewForm.FAsiento := TppSubReport(Sender).Tag;
         end
         else begin
            RemoveExpansion(CurrentExpansionKey);
            FSubInformesImpresos := FSubInformesImpresos - [StrToInt(CurrentExpansionKey)];
         end;
      end
      else begin
         RemoveExpansion(CurrentExpansionKey);
         FSubInformesImpresos := FSubInformesImpresos - [StrToInt(CurrentExpansionKey)];
      end;
   end;
end;


procedure TFormPrincipal.MenuItemSalirClick(Sender: TObject);
begin
   Close;
end;



end.
