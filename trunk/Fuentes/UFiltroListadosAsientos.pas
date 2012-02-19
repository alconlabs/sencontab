unit UFiltroListadosAsientos;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot, CustomView;
type
   TWFiltroListadosAsientos = class(TCustomView)
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
      Label20:          TLabel;
      Label24:          TLabel;
      Label25:          TLabel;
      FiltroFechaDesde: TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      Label3:           TLabel;
      GroupBox4:        TGroupBox;
      Label4:           TLabel;
      FechaImprimir:    TwwDBDateTimePicker;
      FiltroAsientoDesde: TOvcDbNumericField;
      FiltroAsientoHasta: TOvcDbNumericField;
      oSoloAsientosDesc: TCheckBox;
      gInforme:         TDBRadioGroup;
      Label1:           TLabel;
      eMoneda:          TwwDBComboBox;
      oFormatoOficial:  TCheckBox;
      RGConcepto:       TDBRadioGroup;
      RGOrden:          TDBRadioGroup;
      GroupBox3:        TGroupBox;
      Label6:           TLabel;
      Label7:           TLabel;
      Label8:           TLabel;
      Label9:           TLabel;
      Label10:          TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      eDelegacion:      TwwDBLookupCombo;
      eDepartamento:    TwwDBLookupCombo;
      eSeccion:         TwwDBLookupCombo;
      eProyecto:        TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      oSoloAsientosMezcla: TCheckBox;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      TipoListado: Integer;
   end;

var WFiltroListadosAsientos: TWFiltroListadosAsientos;

implementation
uses DM, DMConta, General, Globales, InfAsientos;
{$R *.DFM}

procedure TWFiltroListadosAsientos.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('AsientoDesde', ftInteger, 0, False);
         Add('AsientoHasta', ftInteger, 0, False);
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('Informe', ftString, 1, False);
         Add('Orden', ftString, 1, False);
         Add('TipoConcepto', ftString, 1, False);
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

procedure TWFiltroListadosAsientos.InicializarFiltro;
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('AsientoDesde').Value    := nPrimerAsiento;
      FieldByName('AsientoHasta').Value    := nUltimoAsiento;
      FieldByName('FechaDesde').AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime := dUltimaFecha;
      FieldByName('FechaImprimir').Value   := Date;
      FieldByName('Informe').AsString      := 'N';
      FieldByName('Orden').AsString        := 'A';
      FieldByName('TipoConcepto').AsString := 'T';
      FieldByName('Moneda').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
   end;
end;

procedure TWFiltroListadosAsientos.FormShow(Sender: TObject);
begin
   screen.cursor := crHourGlass;
   CrearFiltro;
   InicializarFiltro;
   FiltroAsientoDesde.SetFocus;
   screen.cursor := crDefault;
end;

procedure TWFiltroListadosAsientos.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltroListadosAsientos.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   PonerTipoConta(CDSFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := CDSFiltro.FieldByName('Moneda').AsString;

   case TipoListado of
      INF_ASIENTOS: begin
         LanzarInfAsientos(CDSFiltro.FieldByName('AsientoDesde').AsInteger,
            CDSFiltro.FieldByName('AsientoHasta').AsInteger,
            CDSFiltro.FieldByName('FechaDesde').AsDateTime,
            CDSFiltro.FieldByName('FechaHasta').AsDateTime,
            CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
            CDSFiltro.FieldByName('TipoConcepto').AsString,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            CDSFiltro.FieldByName('Moneda').AsString,
            CDSFiltro.FieldByName('Orden').AsString = 'A',
            CDSFiltro.FieldByName('Informe').AsString = 'N',
            oSoloAsientosDesc.Checked,
            oSoloAsientosMezcla.Checked,
            oFormatoOficial.Checked);
      end;
   end;
end;

procedure TWFiltroListadosAsientos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltroListadosAsientos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWFiltroListadosAsientos.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltroListadosAsientos.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltroListadosAsientos.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWFiltroListadosAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
