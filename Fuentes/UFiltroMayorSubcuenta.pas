unit UFiltroMayorSubcuenta;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot;
type
   TWFiltroMayorSubcuenta = class(TForm)
      Panel5:           TPanel;
      Panel4:           TPanel;
      Panel3:           TPanel;
      lTitulo:          TLabel;
      Shape1:           TShape;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtSalir:      TfcImageBtn;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      OvcController1:   TOvcController;
      fcIBCerrar:       TfcImageBtn;
      GroupBox3:        TGroupBox;
      GroupBox4:        TGroupBox;
      Label4:           TLabel;
      FechaImprimir:    TwwDBDateTimePicker;
      oSaldosAcumulados: TCheckBox;
      Label2:           TLabel;
      eMoneda:          TwwDBComboBox;
      oFormatoOficial:  TCheckBox;
      oSinPuntear:      TCheckBox;
      GroupBox1:        TGroupBox;
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
      GroupBox2:        TGroupBox;
      Label20:          TLabel;
      Label24:          TLabel;
      Label25:          TLabel;
      FiltroFechaDesde: TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      RGConcepto:       TDBRadioGroup;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      Label3:           TLabel;
      FiltroConcepto:   TwwDBLookupCombo;
      FiltroDescConcepto: TwwDBLookupCombo;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      FSubcuenta: String;
   end;

var WFiltroMayorSubcuenta: TWFiltroMayorSubcuenta;

implementation
uses DM, DMConta, General, Globales, InfMayor, MenuPrincipal;
{$R *.DFM}

procedure TWFiltroMayorSubcuenta.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('TipoConcepto', ftString, 1, False);
         Add('Concepto', ftVarBytes, 3, False);
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

procedure TWFiltroMayorSubcuenta.InicializarFiltro;
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('FechaDesde').AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime := dUltimaFecha;
      FieldByName('FechaImprimir').Value   := Date;
      FieldByName('Moneda').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('TipoConcepto').AsString := 'T';
   end;
end;

procedure TWFiltroMayorSubcuenta.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;
end;

procedure TWFiltroMayorSubcuenta.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWFiltroMayorSubcuenta.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(CDSFiltro.FieldByName('TipoConcepto').AsString);
   gvFormatoOficial := oFormatoOficial.Checked;
   gvMonedaListado  := CDSFiltro.FieldByName('Moneda').AsString;

   LanzarInfMayor(True, False, FSubcuenta, FSubcuenta, '', '',
      CDSFiltro.FieldByName('FechaDesde').AsDateTime,
      CDSFiltro.FieldByName('FechaHasta').AsDateTime,
      CDSFiltro.FieldByName('FechaImprimir').AsDateTime,
      CDSFiltro.FieldByName('TipoConcepto').AsString,
      CDSFiltro.FieldByName('Concepto').AsString,
      CDSFiltro.FieldByName('CUENTA').AsString,
      CDSFiltro.FieldByName('ID_DELEGACION').AsString,
      CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
      CDSFiltro.FieldByName('ID_SECCION').AsString,
      CDSFiltro.FieldByName('ID_PROYECTO').AsString,
      CDSFiltro.FieldByName('Moneda').AsString, '', '',
      True,
      oSaldosAcumulados.Checked,
      oFormatoOficial.Checked,
      oSinPuntear.Checked);
end;

procedure TWFiltroMayorSubcuenta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWFiltroMayorSubcuenta.FormCreate(Sender: TObject);
begin
   FSubcuenta := '';
end;

procedure TWFiltroMayorSubcuenta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWFiltroMayorSubcuenta.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFiltroMayorSubcuenta.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFiltroMayorSubcuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
