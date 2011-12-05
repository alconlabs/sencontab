unit UFiltroBalances;
interface
uses Classes, comctrls, Controls, CheckLst, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, IBQuery, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF,
     OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook,
     Wwdotdot, Grids, DBGrids, DMBalances;
type
   TWFiltroBalances = class(TForm)
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
      Label3:           TLabel;
      eMoneda:          TwwDBComboBox;
      oConSubcuentas:   TCheckBox;
      oSoloSaldos:      TCheckBox;
      lSubtotales1:     TLabel;
      eNivel1:          TOvcDbNumericField;
      eNivel2:          TOvcDbNumericField;
      lSubtotales2:     TLabel;
      OvcController1:   TOvcController;
      RGConcepto:       TDBRadioGroup;
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
      GroupBox5:        TGroupBox;
      lbEmpresas:       TCheckListBox;
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
      procedure oSubcuentaClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure RellenarEmpresas;
   public
      TipoListado: Integer;
   end;

var WFiltroBalances: TWFiltroBalances;

implementation
uses DM, DMConta, DMControl, General, Globales, InfBalanceSumasSaldos;
{$R *.DFM}

procedure TWFiltroBalances.CrearFiltro;
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
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('TipoConcepto', ftString, 1, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('Nivel1', ftInteger, 0, False);
         Add('Nivel2', ftInteger, 0, False);
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

procedure TWFiltroBalances.InicializarFiltro;
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('SubcuentaHasta').AsString := REPLICATE('9', 10);
      FieldByName('FechaDesde').AsDateTime   := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime   := dUltimaFecha;
      FieldByName('Moneda').AsString         := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('TipoConcepto').AsString   := 'T';
      FieldByName('FechaImprimir').Value     := Date;
      FieldByName('Nivel1').AsInteger        := 3;
      FieldByName('Nivel2').AsInteger        := 1;
   end;
end;

procedure TWFiltroBalances.RellenarEmpresas;
begin
   lbEmpresas.Clear;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Database := DmControlRef.BDControl;
      Close;
      Clear;
      Add('SELECT NOMBRE FROM EMPRESAS');
      Add('WHERE ID_EMPRESA <> :ID_EMPRESA');
      Add('ORDER BY NOMBRE');
      ParamByName('ID_EMPRESA').AsInteger := gvEmpresaActual;
      Open;
      while not EOF do begin
         lbEmpresas.Items.Add(FieldByName('NOMBRE').AsString);
         Next;
      end;
      Close;
      Free;
   end;
end;

procedure TWFiltroBalances.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;

   RellenarEmpresas;

   case TipoListado of
      INF_BALANCE_SUMAS_Y_SALDOS: begin
         lTitulo.Caption := 'Balance de Sumas y Saldos';
      end;
   end;
end;

procedure TWFiltroBalances.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltroBalances.BtnEdtAceptarClick(Sender: TObject);
var
   Empresas: TStringList;
   I:        Integer;
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(CDSFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := CDSFiltro.FieldByName('Moneda').AsString;

   Empresas := TStringList.Create;
   Empresas.Clear;
   for I := 0 to lbEmpresas.Items.Count - 1 do begin
      if lbEmpresas.Checked[I] then   begin
         Empresas.Add(lbEmpresas.Items[I]);
      end;
   end;

   case TipoListado of
      INF_BALANCE_SUMAS_Y_SALDOS: begin
         LanzarInfBalanceSumasYGastos(CDSFiltro.FieldByName('FECHADESDE').AsDateTime,
            CDSFiltro.FieldByName('FECHAHASTA').AsDateTime,
            CDSFiltro.FieldByName('FECHAIMPRIMIR').AsDateTime,
            oSubcuenta.Checked, oDescripcion.Checked,
            CDSFiltro.FieldByName('SUBCUENTADESDE').AsString,
            CDSFiltro.FieldByName('SUBCUENTAHASTA').AsString,
            CDSFiltro.FieldByName('DESCRIPCIONDESDE').AsString,
            CDSFiltro.FieldByName('DESCRIPCIONHASTA').AsString,
            CDSFiltro.FieldByName('TipoConcepto').AsString,
            oConSubcuentas.Checked,
            oSoloSaldos.Checked,
            CDSFiltro.FieldByName('CUENTA').AsString,
            CDSFiltro.FieldByName('ID_DELEGACION').AsString,
            CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            CDSFiltro.FieldByName('ID_SECCION').AsString,
            CDSFiltro.FieldByName('ID_PROYECTO').AsString,
            Empresas,
            CDSFiltro.FieldByName('MONEDA').AsString,
            CDSFiltro.FieldByName('NIVEL1').AsInteger,
            CDSFiltro.FieldByName('NIVEL2').AsInteger);
      end;
   end;

   Empresas.Free;
end;

procedure TWFiltroBalances.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltroBalances.FormCreate(Sender: TObject);
begin
   screen.cursor := crHourGlass;
   //DMContaRef.FijarLongitudSubcuentas(Self);
   //DMContaRef.RefrescarSubcuentas(Self);
   FiltroCBSUBCUENTADesde1.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTAHasta1.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTADesde2.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTAHasta2.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   screen.cursor := crDefault;
end;

procedure TWFiltroBalances.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWFiltroBalances.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltroBalances.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltroBalances.oSubcuentaClick(Sender: TObject);
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

procedure TWFiltroBalances.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
