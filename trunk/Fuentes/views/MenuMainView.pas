unit MenuMainView;
interface
uses Messages, SysUtils, Classes, Forms, Graphics, Buttons, Menus, ExtCtrls,
     ComCtrls, Controls, ImgList, StdCtrls, CustomView;
type
  TFormMenuMain = class(TCustomView)
    MainMenuOptions: TPopupMenu;
    MenuItemMaestros: TMenuItem;
    MenuItemTiposDiario: TMenuItem;
    MenuItemFormasPago: TMenuItem;
    MenuItemN994: TMenuItem;
    MenuItemComerciales: TMenuItem;
    MenuItem2997: TMenuItem;
    MenuItemConceptos: TMenuItem;
    MenuItemProvincias: TMenuItem;
    MenuItemPaises: TMenuItem;
    MenuItem29911: TMenuItem;
    MenuItemSalir: TMenuItem;
    MenuItemPlanContable: TMenuItem;
    MenuItemTitulos: TMenuItem;
    MenuItemGrupos: TMenuItem;
    MenuItemCuentas: TMenuItem;
    MenuItemSubCuentas: TMenuItem;
    MenuItemN1: TMenuItem;
    MenuItemImpresionPlanContable: TMenuItem;
    MenuItemPlanAnalitica: TMenuItem;
    MenuItemDelegaciones: TMenuItem;
    MenuItemDepartamentos: TMenuItem;
    MenuItemSecciones: TMenuItem;
    MenuItemProyectos: TMenuItem;
    MenuItemN6: TMenuItem;
    MenuItemCuentasAnaliticas: TMenuItem;
    MenuItemN13: TMenuItem;
    MenuItemImpresionPlanAnalitica: TMenuItem;
    MenuItemDiario: TMenuItem;
    MenuItemCargaAsientos: TMenuItem;
    MenuItemCargaRapidaAsientos: TMenuItem;
    MenuItemFacturasVenta: TMenuItem;
    MenuItemFacturasCompra: TMenuItem;
    MenuItemCargaSimplificada: TMenuItem;
    MenuItemNominas: TMenuItem;
    MenuItemCobrosPagos: TMenuItem;
    MenuItemN4: TMenuItem;
    MenuItemListadoAsientos: TMenuItem;
    MenuItemMayor: TMenuItem;
    MenuItemN3: TMenuItem;
    MenuItemRecalculoSaldos: TMenuItem;
    MenuItemBorradoGeneralAsientos: TMenuItem;
    MenuItemTraspasoApuntesEntreCuentas: TMenuItem;
    MenuItemCopiaAsientosEntreEmpresas: TMenuItem;
    MenuItemN5: TMenuItem;
    MenuItemPunteoAutomaticoAsientos: TMenuItem;
    MenuitemBalances: TMenuItem;
    MenuItemSumasYSaldos: TMenuItem;
    MenuItemSituacion: TMenuItem;
    MenuItemPerdidasYGanancias: TMenuItem;
    MenuItemN2: TMenuItem;
    MenuItemAcumulados: TMenuItem;
    MenuItemExplotacion: TMenuItem;
    MenuItemImpuestos: TMenuItem;
    MenuItemIVA: TMenuItem;
    MenuItemModelo300: TMenuItem;
    MenuItemLibroFacturasEmitidas: TMenuItem;
    MenuItemLibroFacturasRecibidas: TMenuItem;
    MenuItemLibroFacturasBienesInversion: TMenuItem;
    MenuItemN10: TMenuItem;
    MenuItemOperacionesTerceros347: TMenuItem;
    MenuItemOperacionesCEE: TMenuItem;
    MenuItemN11: TMenuItem;
    MenuItemIRPF110: TMenuItem;
    MenuItemIRPF115: TMenuItem;
    MenuItemN12: TMenuItem;
    MenuItemImpuestoSociedades202: TMenuItem;
    MenuItemGestion: TMenuItem;
    MenuItemCarteraEfectos: TMenuItem;
    MenuItemN16: TMenuItem;
    MenuItemAmortizaciones: TMenuItem;
    MenuItemN18: TMenuItem;
    MenuItemCierreEjercicio: TMenuItem;
    MenuItemProcesoAutomatizado: TMenuItem;
    MenuItemHerramientas: TMenuItem;
    MenuItemEnlaceContable: TMenuItem;
    MenuItemParametrizacion: TMenuItem;
    MenuItemGeneral: TMenuItem;
    MenuItemFacturacion: TMenuItem;
    MenuItemImportacion: TMenuItem;
    MenuItemTraspasoDatos: TMenuItem;
    MenuItemActualizacion: TMenuItem;
    MenuItemVentana: TMenuItem;
    MenuItemAyuda: TMenuItem;
    MenuItemContabilidad: TMenuItem;
    MenuItemN15: TMenuItem;
    MenuItemConectarseA: TMenuItem;
    MenuItemComprobarActualizaciones: TMenuItem;
    MenuItemN14: TMenuItem;
    MenuItemAcercaDe: TMenuItem;
    TreeViewMenu: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure FormShow(Sender: TObject);
  protected
  private
    function  AnyFormEditing:Boolean;
    procedure WMSysCommand(var Message :TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMClose     (var Message :TWMClose     ); message WM_CLOSE;
  public
  end;

implementation

uses Dialogs, Windows;
{$R *.dfm}

function TFormMenuMain.AnyFormEditing:Boolean;
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

procedure TFormMenuMain.WMSysCommand(var Message: TWMSysCommand);
begin
   if (Message.CmdType and $FFF0 = SC_MINIMIZE) and
      (AnyFormEditing) then Exit
                       else inherited;
end;

procedure TFormMenuMain.WMClose(var Message: TWMClose);
begin
   if AnyFormEditing then Exit
                     else Close;
end;

procedure TFormMenuMain.FormClose(Sender: TObject; var Action: TCloseAction);
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

//procedure TFormMenuMain.FormShow(Sender: TObject);
//begin
//   Self.Top  := 0;
//   Self.Left := 0;
//end;

end.
