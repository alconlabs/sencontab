unit UFiltro347;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot;

type
   TWFiltro347 = class(TForm)
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
      GroupBox4:        TGroupBox;
      Label4:           TLabel;
      FechaImprimir:    TwwDBDateTimePicker;
      FiltroImporteDesde: TOvcDbNumericField;
      Label2:           TLabel;
      FiltroImporteHasta: TOvcDbNumericField;
      Label3:           TLabel;
      eMoneda:          TwwDBComboBox;
      Label7:           TLabel;
      FiltroAsientoDesde: TOvcDbNumericField;
      FiltroAsientoHasta: TOvcDbNumericField;
      oGenerarCartas:   TCheckBox;
      oGenerarDiskette: TCheckBox;
      RGConcepto:       TDBRadioGroup;
      GroupBox3:        TGroupBox;
      FiltroCBDESCSUBCUENTAHasta1: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTADesde1: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde1: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta1: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde2: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta2: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTAHasta2: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTADesde2: TwwDBLookupCombo;
      oSubcuenta:       TCheckBox;
      oDescripcion:     TCheckBox;
      gTipo216:         TDBRadioGroup;
      oExcluirProfesionales: TCheckBox;
      gOrden:           TDBRadioGroup;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure oSubcuentaClick(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      TipoListado: Integer;
   end;

var WFiltro347: TWFiltro347;
implementation
uses DM, DMConta, General, Globales, InfMod347;
{$R *.DFM}

procedure TWFiltro347.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SubcuentaDesde', ftString, 10, False);
         Add('SubcuentaHasta', ftString, 10, False);
         Add('DescripcionDesde', ftString, 80, False);
         Add('DescripcionHasta', ftString, 80, False);
         Add('AsientoDesde', ftInteger, 0, False);
         Add('AsientoHasta', ftInteger, 0, False);
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('ImporteDesde', ftFloat, 0, False);
         Add('ImporteHasta', ftFloat, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('TipoConcepto', ftString, 1, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('TIPO216', ftString, 1, False);
         Add('ORDEN', ftString, 1, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWFiltro347.InicializarFiltro;
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
      if TipoListado = INF_MOD_347 then   begin
         FieldByName('ImporteDesde').AsFloat := 3005.06;
      end
      else begin
         FieldByName('ImporteDesde').AsFloat := -9999999;
      end;
      FieldByName('ImporteHasta').AsFloat  := 9999999;
      FieldByName('TipoConcepto').AsString := 'T';
      FieldByName('TIPO216').AsString      := 'I';
      FieldByName('Moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('FechaImprimir').Value   := Date;
      FieldByName('ORDEN').AsString        := 'S';
   end;
end;

procedure TWFiltro347.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;

   case TipoListado of
      INF_MOD_347: begin
         lTitulo.Caption := 'Operaciones con Terceros (347)';
      end;
   end;
end;

procedure TWFiltro347.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltro347.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(CDSFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := CDSFiltro.FieldByName('Moneda').AsString;

   LanzarInfModelo347(TipoListado,
      CDSFiltro.FieldByName('AsientoDesde').AsInteger,
      CDSFiltro.FieldByName('AsientoHasta').AsInteger,
      CDSFiltro.FieldByName('FechaDesde').AsDateTime,
      CDSFiltro.FieldByName('FechaHasta').AsDateTime,
      CDSFiltro.FieldByName('ImporteDesde').AsFloat,
      CDSFiltro.FieldByName('ImporteHasta').AsFloat,
      oSubcuenta.Checked, oDescripcion.Checked,
      CDSFiltro.FieldByName('SubcuentaDesde').AsString,
      CDSFiltro.FieldByName('SubcuentaHasta').AsString,
      CDSFiltro.FieldByName('DescripcionDesde').AsString,
      CDSFiltro.FieldByName('DescripcionHasta').AsString,
      CDSFiltro.FieldByName('TipoConcepto').AsString,
      CDSFiltro.FieldByName('TIPO216').AsString,
      CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
      oGenerarCartas.Checked, oGenerarDiskette.Checked,
      CDSFiltro.FieldByName('Moneda').AsString,
      oExcluirProfesionales.Checked,
      CDSFiltro.FieldByName('ORDEN').AsString);
end;

procedure TWFiltro347.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltro347.FormCreate(Sender: TObject);
begin
   if TipoListado = INF_MOD_347 then  begin
      lTitulo.Caption := 'Operaciones con Terceros (347)';
   end
   else begin
      lTitulo.Caption := 'Operaciones con la C.E.E. (349 y 216)';
   end;

   FiltroCBSUBCUENTADesde1.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTAHasta1.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTADesde2.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTAHasta2.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
end;

procedure TWFiltro347.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWFiltro347.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltro347.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltro347.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWFiltro347.oSubcuentaClick(Sender: TObject);
begin
   FiltroCBSUBCUENTADesde1.Enabled     := oSubcuenta.Checked;
   FiltroCBSUBCUENTAHasta1.Enabled     := oSubcuenta.Checked;
   FiltroCBDESCSUBCUENTADesde1.Enabled := oSubcuenta.Checked;
   FiltroCBDESCSUBCUENTAHasta1.Enabled := oSubcuenta.Checked;

   FiltroCBSUBCUENTADesde2.Enabled     := oDescripcion.Checked;
   FiltroCBSUBCUENTAHasta2.Enabled     := oDescripcion.Checked;
   FiltroCBDESCSUBCUENTADesde2.Enabled := oDescripcion.Checked;
   FiltroCBDESCSUBCUENTAHasta2.Enabled := oDescripcion.Checked;
end;

procedure TWFiltro347.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWFiltro347.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
