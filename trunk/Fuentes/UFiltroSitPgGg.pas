unit UFiltroSitPgGg;
interface
uses Classes, comctrls, Controls, CheckLst, Db, DBClient, DBCtrls, DBGrids, Dialogs, ExtCtrls, fcButton,
     fcImage, fcimageform, fcImgBtn, Forms, Graphics, Grids, IBQuery, Mask, Messages, OvcBase, OvcDbNF,
     OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker,
     wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, CustomView;
type
   TWFiltroSitPgGg = class(TCustomView)
      Panel5:           TPanel;
      Panel4:           TPanel;
      Panel3:           TPanel;
    LabelTitulo: TLabel;
      Shape1:           TShape;
      GroupBox1:        TGroupBox;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtSalir:      TfcImageBtn;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      OvcController1:   TOvcController;
      fcIBCerrar:       TfcImageBtn;
      GroupBox4:        TGroupBox;
      Label4:           TLabel;
      FechaImprimir:    TwwDBDateTimePicker;
      oSaldosEjerAnterior: TCheckBox;
      GroupBox3:        TGroupBox;
      Label2:           TLabel;
      Label1:           TLabel;
      Label5:           TLabel;
      wwDBDateTimePicker1: TwwDBDateTimePicker;
      wwDBDateTimePicker2: TwwDBDateTimePicker;
      Label3:           TLabel;
      eMoneda:          TwwDBComboBox;
      RGConcepto:       TDBRadioGroup;
      GroupBox2:        TGroupBox;
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
      GroupBox5:        TGroupBox;
      lbEmpresas:       TCheckListBox;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      Label11:          TLabel;
      wwDBLookupCombo3: TwwDBLookupCombo;
    Label12: TLabel;
    DBGridTitulos: TDBGrid;
    Label13: TLabel;
    DBGridGrupos: TDBGrid;
    Label14: TLabel;
    DBGridCuentas: TDBGrid;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    Label16: TLabel;
    DBGrid2: TDBGrid;
    Label17: TLabel;
    DBGrid3: TDBGrid;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure RellenarEmpresas;
   public
      TipoListado: Integer;
   end;


{TODO: Debe existir una lista de empresas para el componente de selección de la empresa del Ejercicion Anterior}

var WFiltroSitPgGg: TWFiltroSitPgGg;

implementation
uses DM, DMConta, General, Globales, xprocs, DMBalances;
{$R *.DFM}

procedure TWFiltroSitPgGg.CrearFiltro;
begin
   CDSFiltro.Active := False;
   CDSFiltro.FieldDefs.Clear;
   CDSFiltro.FieldDefs.Add('FechaDesde'     , ftDate   ,  0, False);
   CDSFiltro.FieldDefs.Add('FechaHasta'     , ftDate   ,  0, False);
   CDSFiltro.FieldDefs.Add('TipoConcepto'   , ftString ,  1, False);
   CDSFiltro.FieldDefs.Add('Empresa'        , ftInteger,  0, False);
   CDSFiltro.FieldDefs.Add('Moneda'         , ftString ,  1, False);
   CDSFiltro.FieldDefs.Add('FechaImprimir'  , ftDate   ,  0, False);
   CDSFiltro.FieldDefs.Add('CUENTA'         , ftString , 10, False);
   CDSFiltro.FieldDefs.Add('ID_DELEGACION'  , ftString , 10, False);
   CDSFiltro.FieldDefs.Add('ID_DEPARTAMENTO', ftString , 10, False);
   CDSFiltro.FieldDefs.Add('ID_SECCION'     , ftString , 10, False);
   CDSFiltro.FieldDefs.Add('ID_PROYECTO'    , ftString , 10, False);
   CDSFiltro.CreateDataSet;
   CDSFiltro.Active := True;
   CDSFiltro.Append;
end;

procedure TWFiltroSitPgGg.InicializarFiltro;
var nPrimerAsiento :Integer;
    nUltimoAsiento :Integer;
   dPrimeraFecha   :TDateTime;
   dUltimaFecha    :TDateTime;
begin
   DMContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   CDSFiltro.FieldByName('FechaDesde'   ).AsDateTime := dPrimeraFecha;
   CDSFiltro.FieldByName('FechaHasta'   ).AsDateTime := dUltimaFecha;
   CDSFiltro.FieldByName('TipoConcepto' ).AsString   := 'T';
   CDSFiltro.FieldByName('Moneda'       ).AsString   := DMRef.QParametros.FieldByName('MONEDA').AsString;
   CDSFiltro.FieldByName('FechaImprimir').Value      := Date;

   oSaldosEjerAnterior.Checked := False;
end;

procedure TWFiltroSitPgGg.RellenarEmpresas;
begin
   lbEmpresas.Clear;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      //Database := DmControlRef.BDControl;
      {$Message Warn 'Requiere una adaptación a SQL Server'}
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

procedure TWFiltroSitPgGg.FormShow(Sender: TObject);
begin
   screen.cursor := crHourGlass;
   CrearFiltro;
   InicializarFiltro;

   RellenarEmpresas;

   case TipoListado of
      INF_BALANCE_SITUACION            :LabelTitulo.Caption := 'Balance de Situación';
      INF_BALANCE_PERDIDAS_Y_GANANCIAS :LabelTitulo.Caption := 'Cuenta de Pérdidas y Ganancias';
   end;
   Screen.Cursor := crDefault;
end;

procedure TWFiltroSitPgGg.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltroSitPgGg.BtnEdtAceptarClick(Sender: TObject);
var Empresas :TStringList;
    i        :Integer;
begin
   { Primero vaciar la tabla }
   DMContaRef.QInformesConta.EmptyDataset;
   if OSaldosEjerAnterior.Checked and (CDSFiltro.FieldByName('Empresa').AsInteger <> 0) then begin
      DatabaseError('Debe seleccionar una empresa o saldos acumulados para el ejercicio anterior.' +
         'Ambas opciones a la vez es incompatible.');
   end;

   if OSaldosEjerAnterior.Checked or (CDSFiltro.FieldByName('Empresa').AsInteger <> 0) then begin
      CDSFiltro.FieldByName('TipoConcepto').AsString := 'N';
      { Como compara por meses se pone fecha de hasta como el ultimo dia del mes }
      CDSFiltro.FieldByName('FechaHasta').AsDateTime :=
         DateEndofMonth(CDSFiltro.FieldByName('FechaHasta').AsDateTime);
   end;
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(CDSFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := CDSFiltro.FieldByName('Moneda').AsString;

   Empresas := TStringList.Create;
   Empresas.Clear;
   for I := 0 to lbEmpresas.Items.Count - 1 do begin
      if lbEmpresas.Checked[I] then begin
         Empresas.Add(lbEmpresas.Items[I]);
      end;
   end;
   DMBlnc.ProcesaInfBalanceSituacion(TipoListado,
   //LanzarInfBalanceSituacion(TipoListado,
                             CDSFiltro.FieldByName('FechaDesde'     ).AsDateTime,
                             CDSFiltro.FieldByName('FechaHasta'     ).AsDateTime,
                             CDSFiltro.FieldByName('FechaImprimir'  ).AsDateTime,
                             oSaldosEjerAnterior.Checked,
                             CDSFiltro.FieldByName('MONEDA'         ).AsString,
                             CDSFiltro.FieldByName('TipoConcepto'   ).AsString,
                             CDSFiltro.FieldByName('CUENTA'         ).AsString,
                             CDSFiltro.FieldByName('ID_DELEGACION'  ).AsString,
                             CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
                             CDSFiltro.FieldByName('ID_SECCION'     ).AsString,
                             CDSFiltro.FieldByName('ID_PROYECTO'    ).AsString,
                             Empresas,
                             CDSFiltro.FieldByName('Empresa'        ).AsInteger);

   Empresas.Free;
end;

procedure TWFiltroSitPgGg.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltroSitPgGg.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWFiltroSitPgGg.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltroSitPgGg.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltroSitPgGg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
