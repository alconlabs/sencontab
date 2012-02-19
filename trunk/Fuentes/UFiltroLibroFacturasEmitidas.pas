unit UFiltroLibroFacturasEmitidas;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot, CustomView;
type
   TWFiltroLibroFactEmitidas = class(TCustomView)
      Panel5:           TPanel;
      Panel4:           TPanel;
      Panel3:           TPanel;
      lTitulo:          TLabel;
      Shape1:           TShape;
      GroupBox1:        TGroupBox;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtSalir:      TfcImageBtn;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      OvcController1:   TOvcController;
      fcIBCerrar:       TfcImageBtn;
      GroupBox2:        TGroupBox;
      Label24:          TLabel;
      Label25:          TLabel;
      GroupBox4:        TGroupBox;
      Label4:           TLabel;
      FechaImprimir:    TwwDBDateTimePicker;
      FiltroBaseDesde:  TOvcDbNumericField;
      Label2:           TLabel;
      FiltroBaseHasta:  TOvcDbNumericField;
      Label3:           TLabel;
      eMoneda:          TwwDBComboBox;
      gOrden:           TDBRadioGroup;
      FiltroCuotaIVADesde: TOvcDbNumericField;
      Label5:           TLabel;
      FiltroCuotaIVAHasta: TOvcDbNumericField;
      FiltroIVADesde:   TOvcDbNumericField;
      Label6:           TLabel;
      FiltroIVAHasta:   TOvcDbNumericField;
      FiltroFechaFacturaDesde: TwwDBDateTimePicker;
      FiltroFechaFacturaHasta: TwwDBDateTimePicker;
      lbSubcuenta:      TLabel;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      Label7:           TLabel;
      oFormatoOficial:  TCheckBox;
      gInforme:         TDBRadioGroup;
      GroupBox3:        TGroupBox;
      Label1:           TLabel;
      Label8:           TLabel;
      Label9:           TLabel;
      Label10:          TLabel;
      Label11:          TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      eDelegacion:      TwwDBLookupCombo;
      eDepartamento:    TwwDBLookupCombo;
      eSeccion:         TwwDBLookupCombo;
      eProyecto:        TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      gIntracomun:      TDBRadioGroup;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure ImporteClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      TipoListado: Integer;
   end;

var WFiltroLibroFactEmitidas: TWFiltroLibroFactEmitidas;

implementation
uses Cadenas, DM, DMConta, Globales, InfLibroIVA, UIVA300, MenuPrincipal;
{$R *.DFM}

procedure TWFiltroLibroFactEmitidas.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begiN
         Clear;
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('BaseDesde', ftFloat, 0, False);
         Add('BaseHasta', ftFloat, 0, False);
         Add('CuotaIVADesde', ftFloat, 0, False);
         Add('CuotaIVAHasta', ftFloat, 0, False);
         Add('IVADesde', ftFloat, 0, False);
         Add('IVAHasta', ftFloat, 0, False);
         Add('Orden', ftString, 1, False);
         Add('Moneda', ftString, 1, False);
         Add('Subcuenta', ftString, 10, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('Informe', ftString, 1, False);
         Add('Intracomun', ftString, 1, False);
         Add('CUENTA', ftString, 10, False);
         Add('ID_DELEGACION', ftString, 10, False);
         Add('ID_DEPARTAMENTO', ftString, 10, False);
         Add('ID_SECCION', ftString, 10, False);
         Add('ID_PROYECTO', ftString, 10, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWFiltroLibroFactEmitidas.InicializarFiltro;
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('FechaDesde').AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime := dUltimaFecha;
      FieldByName('BaseDesde').AsFloat     := -999999999;
      FieldByName('BaseHasta').AsFloat     := 999999999;
      FieldByName('CuotaIVADesde').AsFloat := -999999999;
      FieldByName('CuotaIVAHasta').AsFloat := 999999999;
      FieldByName('IVAHasta').AsFloat      := 16;
      FieldByName('Orden').AsString        := 'F';
      FieldByName('Moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('FechaImprimir').Value   := Date;
      FieldByName('Informe').AsString      := 'N';
      FieldByName('Intracomun').AsString   := 'E';
   end;
end;

procedure TWFiltroLibroFactEmitidas.FormShow(Sender: TObject);
begin
   screen.cursor := crHourGlass;
   CrearFiltro;
   InicializarFiltro;

   case TipoListado of
      INF_MOD_300: begin
         lTitulo.Caption := 'Modelo I.V.A. 300';
      end;
      INF_FACTURAS_EMITIDAS: begin
         lTitulo.Caption := 'Libro de Facturas Emitidas';
      end;
      INF_FACTURAS_RECIBIDAS: begin
         lTitulo.Caption := 'Libro de Facturas Recibidas';
      end;
      INF_FACTURAS_BIENES: begin
         lTitulo.Caption := 'Libro de Facturas Bienes de Inversión';
      end;
   end;

   gOrden.Visible          := TipoListado <> INF_MOD_300;
   gInforme.Visible        := gOrden.Visible;
   oFormatoOficial.Visible := TipoListado <> INF_MOD_300;
   lbSubcuenta.Visible     := TipoListado <> INF_MOD_300;
   FiltroCBSUBCUENTADesde.Visible := TipoListado <> INF_MOD_300;
   FiltroCBDESCSUBCUENTADesde.Visible := TipoListado <> INF_MOD_300;

   gIntracomun.Visible := TipoListado = INF_FACTURAS_EMITIDAS;

   screen.cursor := crDefault;
end;

procedure TWFiltroLibroFactEmitidas.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltroLibroFactEmitidas.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   case TipoListado of
      INF_MOD_300: begin
         // Abrir Formulario para crear fichero QIVa300
         WIva300 := TWIva300.Create(nil);
         LanzarInfLibroIVA(CDSFiltro.FieldByName('FechaDesde').AsDateTime,
            CDSFiltro.FieldByName('FechaHasta').AsDateTime,
            CDSFiltro.FieldByName('BaseDesde').AsFloat,
            CDSFiltro.FieldByName('BaseHasta').AsFloat,
            CDSFiltro.FieldByName('CuotaIVADesde').AsFloat,
            CDSFiltro.FieldByName('CuotaIVAHasta').AsFloat,
            CDSFiltro.FieldByName('IVADesde').AsFloat,
            CDSFiltro.FieldByName('IVAHasta').AsFloat,
            CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
            oFormatoOficial.Checked,
            'F', // Orden por fecha
            CDSFiltro.FieldByName('Moneda').AsString, '3',
            CDSFiltro.FieldByName('Subcuenta').AsString,
            CDSFiltro.FieldByName('Informe').AsString,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            CDSFiltro.FieldByName('Intracomun').AsString);
         // Mostrar la ventana antes de imprimir el fichero
         WIva300.ShowModal;
         WIva300.Free;
         WIva300 := nil;
      end;
      INF_FACTURAS_EMITIDAS: begin
         LanzarInfLibroIVA(CDSFiltro.FieldByName('FechaDesde').AsDateTime,
            CDSFiltro.FieldByName('FechaHasta').AsDateTime,
            CDSFiltro.FieldByName('BaseDesde').AsFloat,
            CDSFiltro.FieldByName('BaseHasta').AsFloat,
            CDSFiltro.FieldByName('CuotaIVADesde').AsFloat,
            CDSFiltro.FieldByName('CuotaIVAHasta').AsFloat,
            CDSFiltro.FieldByName('IVADesde').AsFloat,
            CDSFiltro.FieldByName('IVAHasta').AsFloat,
            CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
            oFormatoOficial.Checked,
            CDSFiltro.FieldByName('Orden').AsString,
            CDSFiltro.FieldByName('Moneda').AsString, 'E',
            CDSFiltro.FieldByName('Subcuenta').AsString,
            CDSFiltro.FieldByName('Informe').AsString,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            CDSFiltro.FieldByName('INTRACOMUN').AsString);
      end;
      INF_FACTURAS_RECIBIDAS: begin
         LanzarInfLibroIVA(CDSFiltro.FieldByName('FechaDesde').AsDateTime,
            CDSFiltro.FieldByName('FechaHasta').AsDateTime,
            CDSFiltro.FieldByName('BaseDesde').AsFloat,
            CDSFiltro.FieldByName('BaseHasta').AsFloat,
            CDSFiltro.FieldByName('CuotaIVADesde').AsFloat,
            CDSFiltro.FieldByName('CuotaIVAHasta').AsFloat,
            CDSFiltro.FieldByName('IVADesde').AsFloat,
            CDSFiltro.FieldByName('IVAHasta').AsFloat,
            CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
            oFormatoOficial.Checked,
            CDSFiltro.FieldByName('Orden').AsString,
            CDSFiltro.FieldByName('Moneda').AsString, 'R',
            CDSFiltro.FieldByName('Subcuenta').AsString,
            CDSFiltro.FieldByName('Informe').AsString,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            CDSFiltro.FieldByName('INTRACOMUN').AsString);
      end;
      INF_FACTURAS_BIENES: begin
         LanzarInfLibroIVA(CDSFiltro.FieldByName('FechaDesde').AsDateTime,
            CDSFiltro.FieldByName('FechaHasta').AsDateTime,
            CDSFiltro.FieldByName('BaseDesde').AsFloat,
            CDSFiltro.FieldByName('BaseHasta').AsFloat,
            CDSFiltro.FieldByName('CuotaIVADesde').AsFloat,
            CDSFiltro.FieldByName('CuotaIVAHasta').AsFloat,
            CDSFiltro.FieldByName('IVADesde').AsFloat,
            CDSFiltro.FieldByName('IVAHasta').AsFloat,
            CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
            oFormatoOficial.Checked,
            CDSFiltro.FieldByName('Orden').AsString,
            CDSFiltro.FieldByName('Moneda').AsString, 'B',
            CDSFiltro.FieldByName('Subcuenta').AsString,
            CDSFiltro.FieldByName('Informe').AsString,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            CDSFiltro.FieldByName('INTRACOMUN').AsString);
      end;
   end;
end;

procedure TWFiltroLibroFactEmitidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltroLibroFactEmitidas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
   end;
end;

procedure TWFiltroLibroFactEmitidas.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltroLibroFactEmitidas.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltroLibroFactEmitidas.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWFiltroLibroFactEmitidas.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWFiltroLibroFactEmitidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
