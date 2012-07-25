unit UBorradoDiario;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBSQL, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB,
     OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot,
     CustomView;
type
   TWBorradoDiario = class(TCustomView)
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
      OvcController1:   TOvcController;
      Label36:          TLabel;
      Label29:          TLabel;
      Label1:           TLabel;
      OvcDbPictureField3: TOvcDbNumericField;
      OvcDbPictureField4: TOvcDbNumericField;
      eAsiento1:        TOvcDbNumericField;
      OvcDbPictureField6: TOvcDbNumericField;
      Label6:           TLabel;
      Label12:          TLabel;
      Label13:          TLabel;
      Label3:           TLabel;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      Label20:          TLabel;
      Label24:          TLabel;
      Label25:          TLabel;
      cFecha1:          TwwDBDateTimePicker;
      cFecha2:          TwwDBDateTimePicker;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Label2:           TLabel;
      eConcepto:        TwwDBLookupCombo;
      eDescConcepto:    TwwDBLookupCombo;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure SeleccionarContenido(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      TipoListado: Integer;
   end;

var WBorradoDiario: TWBorradoDiario;
implementation
uses General, Cadenas, DM, DMConta, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

procedure TWBorradoDiario.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Asiento1', ftInteger, 0, False);
         Add('Asiento2', ftInteger, 0, False);
         Add('Fecha1', ftDate, 0, False);
         Add('Fecha2', ftDate, 0, False);
         Add('Subcuenta1', ftString, 10, False);
         Add('Subcuenta2', ftString, 10, False);
         Add('Importe1', ftFloat, 0, False);
         Add('Importe2', ftFloat, 0, False);
         Add('Concepto1', ftVarBytes, 3, False);
         Add('Concepto2', ftVarBytes, 3, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWBorradoDiario.InicializarFiltro;
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('Asiento1').AsInteger  := nPrimerAsiento;
      FieldByName('Asiento2').AsInteger  := nUltimoAsiento;
      FieldByName('Fecha1').AsDateTime   := dPrimeraFecha;
      FieldByName('Fecha2').AsDateTime   := dUltimaFecha;
      FieldByName('Importe1').AsFloat    := 0;
      FieldByName('Importe2').AsFloat    := 0;
      FieldByName('Subcuenta1').AsString := '';
      FieldByName('Subcuenta2').AsString := '';
      FieldByName('Concepto1').AsString  := '';
      FieldByName('Concepto2').AsString  := '';
   end;
end;

procedure TWBorradoDiario.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;
   eAsiento1.SetFocus;
end;

procedure TWBorradoDiario.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWBorradoDiario.BtnEdtAceptarClick(Sender: TObject);
var
   Caratula: TEspere;
   Subcuenta_hasta, Subcuenta_desde: String;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if MessageDlg('¿Confirma el borrado de asientos seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Borrando asientos ...';
      Caratula.Ancho        := 300;
      Caratula.Alto         := 150;
      Caratula.Avi_Left     := 20;
      Caratula.Avi_Top      := 80;
      Caratula.Fuente.Color := clWhite;
      Caratula.Fuente.Name  := 'Arial';
      Caratula.Fuente.Size  := 14;
      Caratula.Mensaje_Left := 14;
      Caratula.Mensaje_Top  := 14;
      Caratula.Avi_Color    := $00A56D39;
      Caratula.ColorFondo   := $00A56D39;
      Caratula.MostrarMarco := True;
      Caratula.Avi_Predet   := Ninguno;
      Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
      Caratula.Mostrar;

      subcuenta_desde := CdsFiltro.FieldByName('subcuenta1').AsString;
      subcuenta_hasta := CdsFiltro.FieldByName('subcuenta2').AsString;

      if subcuenta_hasta = '' then begin
         subcuenta_hasta := subcuenta_desde;
      end;

      if length(subcuenta_desde) < gvlongitudsubcuenta then   begin
         subcuenta_desde := BackChar(subcuenta_desde, '0', gvlongitudsubcuenta);
      end;
      if length(subcuenta_hasta) < gvlongitudsubcuenta then   begin
         subcuenta_hasta := Backchar(subcuenta_hasta, '9', gvlongitudsubcuenta);
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         //TODO: database := DmRef.IBDSiamCont;
         Clear;
         Add('delete from diario');
         Add('where asiento in (select asiento from diario ');
         Add('    where Fecha>=:fecha1 and Fecha<=:Fecha2');
         if (CdsFiltro.FieldByName('asiento1').AsInteger <> 0) and
            (CdsFiltro.FieldByName('asiento2').AsInteger <> 0) then   begin
            add(' and asiento>=:asiento1 and asiento<=:asiento2 ');
         end;

         if (RoundToDecimal(CdsFiltro.FieldByName('importe1').AsFloat, 2, True) <> 0) and
            (RoundToDecimal(CdsFiltro.FieldByName('importe2').AsFloat, 2, True) <> 0) then   begin
            add(' and importe>=:importe1 and importe<=:importe2 ');
         end;

         if (CdsFiltro.FieldByName('subcuenta1').AsString <> '') then   begin
            add(' and subcuenta>=:subcuenta1');
            Add(' and SUBCUENTA<=:SUBCUENTA2');
         end;

         if (CdsFiltro.FieldByName('concepto1').AsString <> '') then   begin
            add(' and concepto=:concepto1 ');
         end;

         Add(' )'); // Cierre de subconsulta

         parambyname('Fecha1').AsDateTime := CdsFiltro.FieldByName('Fecha1').AsDateTime;
         parambyname('Fecha2').AsDateTime := CdsFiltro.FieldByName('Fecha2').AsDateTime;

         if (CdsFiltro.FieldByName('asiento1').AsInteger <> 0) and
            (CdsFiltro.FieldByName('asiento2').AsInteger <> 0) then   begin
            parambyname('Asiento1').AsInteger := CdsFiltro.FieldByName('Asiento1').AsInteger;
            parambyname('Asiento2').AsInteger := CdsFiltro.FieldByName('Asiento2').AsInteger;
         end;

         if (RoundToDecimal(CdsFiltro.FieldByName('importe1').AsFloat, 2, True) <> 0) and
            (RoundToDecimal(CdsFiltro.FieldByName('importe2').AsFloat, 2, True) <> 0) then   begin
            parambyname('Importe1').AsDouble := CdsFiltro.FieldByName('Importe1').AsFloat;
            parambyname('Importe2').AsDouble := CdsFiltro.FieldByName('Importe2').AsFloat;
         end;

         if (CdsFiltro.FieldByName('subcuenta1').AsString <> '') then   begin
            parambyname('Subcuenta1').AsString := Subcuenta_Desde;
            parambyname('Subcuenta2').AsString := Subcuenta_Hasta;
         end;

         if (CdsFiltro.FieldByName('concepto1').AsString <> '') then   begin
            parambyname('Concepto1').AsString := CdsFiltro.FieldByName('Concepto1').AsString;
         end;

         ExecQuery;
         Transaction.commitretaining;
         Close;
         Free;
      end;

      Caratula.Cerrar;
      Caratula.Free;

      MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
      Close;
   end;
end;

procedure TWBorradoDiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWBorradoDiario.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWBorradoDiario.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWBorradoDiario.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWBorradoDiario.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWBorradoDiario.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWBorradoDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
