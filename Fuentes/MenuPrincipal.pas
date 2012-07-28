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
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure SUBINFORMEPrint(Sender: TObject);
    procedure ppDetalleAsientoBeforeGenerate(Sender: TObject);
    procedure SUBINFORME_ASIENTOSPrint(Sender: TObject);

    procedure MenuItemSalirClick(Sender: TObject);
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
     ib, ShellApi, stBase, UPreviewForm;


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

//procedure TFormPrincipal.MenuItemConectarseAClick(Sender: TObject);
//begin
//   ShellExecute(handle, 'open', PChar('http://www.jher.es'), nil, nil, SW_MAXIMIZE);
//end;

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
