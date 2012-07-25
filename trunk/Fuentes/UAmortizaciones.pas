unit UAmortizaciones;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBCustomDataSet, IBQuery, IBSQL, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF,
     OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit,
     wwdblook, Wwdotdot, CustomView;

type
   TWAmortizaciones = class(TCustomView)
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
      RGoperacion:      TRadioGroup;
      RGListado:        TRadioGroup;
      RGTipo:           TRadioGroup;
      GroupBox2:        TGroupBox;
      Label2:           TLabel;
      Label3:           TLabel;
      eFecha:           TwwDBDateTimePicker;
      Label20:          TLabel;
      eMoneda:          TwwDBComboBox;
      Label1:           TLabel;
      Label4:           TLabel;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta: TwwDBLookupCombo;
      QTrabajos:        TClientDataSet;
      QModifica:        TIBSQL;
      QAmortizaciones:  TIBQuery;
      SAmortizaciones:  TDataSource;
      QAmortizacionesSUBCUENTA: TIBStringField;
      QAmortizacionesDESCRIPCION: TIBStringField;
      QAmortizacionesCLASE: TFloatField;
      QAmortizacionesTIPOCUENTA: TIBStringField;
      QAmortizacionesFCOMPRA: TDateTimeField;
      QAmortizacionesFBAJA: TDateTimeField;
      QAmortizacionesFULTAMOR: TDateTimeField;
      QAmortizacionesVCOMPRA: TFloatField;
      QAmortizacionesVRESIDUAL: TFloatField;
      QAmortizacionesVAMOR: TFloatField;
      QAmortizacionesANUAL: TFloatField;
      QAmortizacionesVEJPINICIO: TFloatField;
      QAmortizacionesFINICIO: TDateTimeField;
      QAmortizacionesCENTROCOSTE: TIBStringField;
      QAmortizacionesFFINAMOR: TDateTimeField;
      QAmortizacionesSUBGASTO: TIBStringField;
      QAmortizacionesSUBAMOR: TIBStringField;
      QAmortizacionesPERIODO: TIBStringField;
      QAmortizacionesPROVEEDOR: TIBStringField;
      QAmortizacionesFACTURA: TIBStringField;
      QAmortizacionesVEJAINICIO: TFloatField;
      QAmortizacionesVEJPAMOR: TFloatField;
      QAmortizacionesVEJAAMOR: TFloatField;
      STrabajo:         TDataSource;
      QTrabajosSUBCUENTA: TStringField;
      QTrabajosCENTROCOSTE: TStringField;
      QTrabajosINICIO:  TFloatField;
      QTrabajosDESCRIPCION: TStringField;
      QTrabajosCONTRAPARTIDA: TStringField;
      QTrabajosIMPORTE: TFloatField;
      QTrabajosDEBEHABER: TStringField;
      QTrabajosMES1:    TFloatField;
      QTrabajosMES2:    TFloatField;
      QTrabajosMES3:    TFloatField;
      QTrabajosMES4:    TFloatField;
      QTrabajosMES5:    TFloatField;
      QTrabajosMES6:    TFloatField;
      QTrabajosMES7:    TFloatField;
      QTrabajosMES8:    TFloatField;
      QTrabajosMES9:    TFloatField;
      QTrabajosMES10:   TFloatField;
      QTrabajosMES11:   TFloatField;
      QTrabajosMES12:   TFloatField;
      QTrabajosSUMA:    TFloatField;
      QTrabajosTOTAL:   TFloatField;
      QTrabajosTITULOLISTADO: TStringField;
      QAmortizacionesCalcVRESIDUAL: TFloatField;
      QAmortizacionesCalcVAMOR: TFloatField;
      QAmortizacionesCalcVEJPINICIO: TFloatField;
      QAmortizacionesCalcVEJAINICIO: TFloatField;
      QAmortizacionesCalcVEJPAMOR: TFloatField;
      QAmortizacionesCalcVEJAAMOR: TFloatField;
      QAmortizacionesCalcVCOMPRA: TFloatField;
      eConcepto:        TwwDBLookupCombo;
      eDescConcepto:    TwwDBLookupCombo;
      QAmortizacionesCalcVAMORTIZADO: TFloatField;
      Panel1:           TPanel;
      GroupBox3:        TGroupBox;
      Label16:          TLabel;
      Label24:          TLabel;
      Label25:          TLabel;
      Label17:          TLabel;
      FiltroFechaUltDesde: TwwDBDateTimePicker;
      FiltroFechaUltHasta: TwwDBDateTimePicker;
      FiltroFechaCompraDesde: TwwDBDateTimePicker;
      FiltroFechaCompraHasta: TwwDBDateTimePicker;
      Formulario:       TfcImageForm;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure QAmortizacionesCalcFields(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure CrearFicheroTrabajo;
   public
      TipoListado: Integer;
   end;

var WAmortizaciones: TWAmortizaciones;
implementation
uses Cadenas, DM, DMConta, MenuPrincipal, General, Globales, UEspere;

{$R *.DFM}

procedure TWAmortizaciones.CrearFiltro;
begin
   CDSFiltro.Active := False;
   CDSFiltro.FieldDefs.Clear;
   CDSFiltro.FieldDefs.Add('Subcuenta1'      , ftString  , 10, False);
   CDSFiltro.FieldDefs.Add('Subcuenta2'      , ftString  , 10, False);
   CDSFiltro.FieldDefs.Add('Fecha'           , ftDate    ,  0, False);
   CDSFiltro.FieldDefs.Add('FechaCompraDesde', ftDate    ,  0, False);
   CDSFiltro.FieldDefs.Add('FechaCompraHasta', ftDate    ,  0, False);
   CDSFiltro.FieldDefs.Add('FechaUltDesde'   , ftDate    ,  0, False);
   CDSFiltro.FieldDefs.Add('FechaUltHasta'   , ftDate    ,  0, False);
   CDSFiltro.FieldDefs.Add('Moneda'          , ftString  ,  1, False);
   CDSFiltro.FieldDefs.Add('Concepto'        , ftVarBytes,  3, False);
   CDSFiltro.CreateDataSet;
   CDSFiltro.Active := True;
   CDSFiltro.Append;
   CDSFiltro.FieldByName('Fecha').AsDateTime         := DmRef.QParametros.FieldByName('FechaAmortizacion').AsDateTime;
   CDSFiltro.FieldByName('Moneda').AsString          := DMRef.QParametros.FieldByName('MONEDA').AsString;
   CDSFiltro.FieldByName('FechaCompraHasta').AsDateTime :=
      DmRef.QParametros.FieldByName('FechaAmortizacion').AsDateTime;
   CDSFiltro.FieldByName('FechaUltHasta').AsDateTime :=
      DmRef.QParametros.FieldByName('FechaAmortizacion').AsDateTime;
end;

procedure TWAmortizaciones.CrearFicheroTrabajo;
begin
   // Crear fichero de trabajo
   QTrabajos.Active := False;

   QTrabajos.FieldDefs.Clear;
   QTrabajos.FieldDefs.Add('TituloListado', ftString, 100, False);
   QTrabajos.FieldDefs.Add('CentroCoste'  , ftString,  10, False);
   QTrabajos.FieldDefs.Add('Subcuenta'    , ftString,  10, False);
   QTrabajos.FieldDefs.Add('Inicio'       , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Descripcion'  , ftString,  80, False);
   QTrabajos.FieldDefs.Add('Contrapartida', ftString,  10, False);
   QTrabajos.FieldDefs.Add('Importe'      , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Debehaber'    , ftString,   1, False);
   QTrabajos.FieldDefs.Add('Mes1'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes2'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes3'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes4'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes5'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes6'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes7'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes8'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes9'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes10'        , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes11'        , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Mes12'        , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Suma'         , ftFloat ,   0, False);
   QTrabajos.FieldDefs.Add('Total'        , ftFloat ,   0, False);

   QTrabajos.IndexDefs.Clear;
   QTrabajos.IndexDefs.Add('', 'Subcuenta;centrocoste', [ixPrimary]);
   QTrabajos.IndexDefs.Add('DebeHaber', 'Debehaber;Subcuenta', []);
   QTrabajos.CreateDataSet;
   QTrabajos.Active := True;
end;

procedure TWAmortizaciones.FormShow(Sender: TObject);
begin
   CrearFiltro;
   CrearFicheroTrabajo;
end;

procedure TWAmortizaciones.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWAmortizaciones.BtnEdtAceptarClick(Sender: TObject);

   procedure GenerarAsientosAmortizacion;
   var
      nApunte:  Integer;
      nImporte: Double;
      dFecha:   TDateTime;
      nAsiento: Integer;
      Subcuenta_desde, Subcuenta_Hasta: String;
      Caratula: TEspere;
   begin
      if CdsFiltro.FieldByName('concepto').AsString = '' then   begin
         DatabaseError('Debe seleccionar un concepto para la generacion de asientos');
      end;
      
      if MessageDlg('¿Confirma la generación de asientos automáticos?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

      // Confirmar cierre de ejercicio
      if Year(DMRef.QParametros.FieldByName('Fecha_Fin_Ejercicio').AsDateTime) <>
         Year(CDsFiltro.FieldByName('Fecha').AsDateTime) then   begin
         DataBaseError('No puede generar asientos de amortizacion, mientras no cierre el ejercicio.');
      end;

      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Generando asientos ...';
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


      QTrabajos.EmptyDataSet;
      
      QModifica.Close;
      QModifica.SQL.Clear;
      QModifica.SQL.Add('update amortiza set FUltAmor=:FUltAmor,VEjAInicio=:VEjAInicio,');
      QModifica.SQL.Add(' vEjAAmor=:vEjAAmor where subcuenta=:subcuenta');
      QModifica.Prepare;

      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSql.Create(nil), Sql do begin
         Close;
         Clear;
         {TODO : database := DmRef.IBDSiamCont;}
         Add('select a.*,c.tipocuenta from amortiza a,cuentas c');
         Add('where Substr(a.SUBCUENTA,1,3)=c.cuenta and ');
         Add(' ((c.tipocuenta="M") or (c.tipocuenta="I"))');
         if (CdsFiltro.FieldByName('subcuenta1').AsString <> '') then   begin
            add(' and subcuenta>=:subcuenta1');
            Add(' and SUBCUENTA<=:SUBCUENTA2');
         end;

         if (CdsFiltro.FieldByName('subcuenta1').AsString <> '') then   begin
            parambyname('Subcuenta1').AsString := Subcuenta_Desde;
            parambyname('Subcuenta2').AsString := Subcuenta_Hasta;
         end;
         ExecQuery;
         while not EOF do begin
            if (((RGTipo.ItemIndex = 1) and (FieldByName('tipocuenta').AsString = 'I')) or
               ((RGTipo.ItemIndex = 2) and (FieldByName('tipocuenta').AsString = 'M'))) then   begin
               Next;
               continue;
            end;
            if (year(FieldByName('fbaja').AsDateTime) > 1990) and
               (FieldByName('FBaja').AsDateTime <= CdsFiltro.FieldByName('Fecha').AsDateTime) then
            begin
               Next;
               continue;
            end;
            // chequeos propios de fecha
            dFecha := FieldByName('FultAmor').AsDateTime + 28;

            // Fecha de compra y actualizacion de saldos
            if (dFecha <= CdsFiltro.FieldByName('Fecha').AsDateTime) and
               (RoundToDecimal(FieldByName('vEjAAmor').AsFloat, 2, True) > 0) and
               (FieldByName('anual').AsInteger > 0) and
               (not empty(FieldByName('SubGasto').AsString)) and
               (not empty(FieldByName('SubAmor').AsString)) then   begin
               // subcuenta valida por fechas e importe
               nImporte :=
                  RoundToDecimal(FieldByName('vAmor').AsFloat / FieldByName('anual').AsInteger, 2, True);

               // Ajuste del importe
               if (nImporte > FieldByName('vEjAAmor').AsFloat) or
                  ((nImporte * 2) > FieldByName('vEjAAmor').AsFloat) then   begin
                  nImporte := RoundToDecimal(FieldByName('vEjAAmor').AsFloat, 2, True);
               end;

               QModifica.Close;
               QModifica.parambyname('Subcuenta').AsString  :=
                  FieldByName('subcuenta').AsString;
               QModifica.parambyname('FultAmor').AsDateTime :=
                  CdsFiltro.FieldByName('Fecha').AsDateTime;
               QModifica.parambyname('vEjAInicio').AsFloat  :=
                  RoundToDecimal(FieldByName('vEjAInicio').AsFloat + nImporte, 2, True);
               QModifica.parambyname('vEjAAmor').AsFloat    :=
                  RoundToDecimal(FieldByName('vEjAAmor').AsFloat - nImporte, 2, True);
               QModifica.ExecQuery;
               QModifica.Transaction.commitretaining;

               // grabacion de datos subcuenta de gasto
               if not QTrabajos.findkey([FieldByName('SubGasto').AsString, FieldByName('centrocoste').AsString])
               then   begin
                  QTrabajos.append;
               end;
               QTrabajos.edit;
               QTrabajos.FieldByName('centrocoste').AsString :=
                  FieldByName('centrocoste').AsString;
               QTrabajos.FieldByName('subcuenta').AsString   :=
                  FieldByName('subgasto').AsString;
               QTrabajos.FieldByName('debehaber').AsString   := 'D';
               QTrabajos.FieldByName('importe').AsFloat      :=
                  RoundToDecimal(QTrabajos.FieldByName('importe').AsFloat + nImporte, 2, True);
               QTrabajos.post;

               // grabacion de datos subcuenta de amortizacion
               if not QTrabajos.findkey([FieldByName('SubAmor').AsString, FieldByName('centrocoste').AsString])
               then   begin
                  QTrabajos.append;
               end;
               QTrabajos.edit;
               QTrabajos.FieldByName('centrocoste').AsString   :=
                  FieldByName('centrocoste').AsString;
               QTrabajos.FieldByName('subcuenta').AsString     :=
                  FieldByName('SubAmor').AsString;
               QTrabajos.FieldByName('contrapartida').AsString :=
                  FieldByName('subgasto').AsString; // siempre la de gasto
               QTrabajos.FieldByName('debehaber').AsString     := 'H';
               QTrabajos.FieldByName('importe').AsFloat        :=
                  RoundToDecimal(QTrabajos.FieldByName('importe').AsFloat + nImporte, 2, True);
               QTrabajos.post;
            end;
            Next;
         end; // while
         Close;
         // generacion de asientos
         QTrabajos.indexname := 'DebeHaber';
         QTrabajos.First;
         //cCoste:=fieldbyname('CentroCoste').asstring;
         nApunte  := 1;
         // Seleccionar asiento libre
         nAsiento := DmContaRef.ObtenerNumeroAsiento;
         while not QTrabajos.EOF do begin
            Close;
            Clear;
            Add(' INSERT INTO DIARIO (APUNTE,ASIENTO,DEBEHABER,');
            if (QTrabajos.FieldByName('contrapartida').AsString <> '') then   begin
               Add(' CONTRAPARTIDA,');
            end;
            if (QTrabajos.FieldByName('centrocoste').AsString <> '') then   begin
               Add(' CUENTA_ANALITICA,');
            end;
            Add(' FECHA,IMPORTE,MONEDA,SUBCUENTA,ID_CONCEPTOS) ');
            Add(' VALUES (:APUNTE,:ASIENTO,:DEBEHABER,');
            if (QTrabajos.FieldByName('contrapartida').AsString <> '') then   begin
               Add(' :CONTRAPARTIDA,');
            end;
            if (QTrabajos.FieldByName('centrocoste').AsString <> '') then   begin
               Add(' :CUENTA_ANALITICA,');
            end;
            Add(' :FECHA,:IMPORTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS)');
            Params.byname('ASIENTO').AsInteger     := nAsiento;
            Params.byname('APUNTE').AsInteger      := nApunte;
            Params.byname('ID_CONCEPTOS').AsString := CdsFiltro.FieldByName('CONCEPTO').AsString;
            Params.byname('SUBCUENTA').AsString    := QTrabajos.FieldByName('SUBCUENTA').AsString;
            Params.byname('DEBEHABER').AsString    := QTrabajos.FieldByName('DEBEHABER').AsString;
            Params.byname('FECHA').AsDateTime      := CdsFiltro.FieldByName('FECHA').AsDateTime;
            Params.byname('IMPORTE').AsFloat       := QTrabajos.FieldByName('IMPORTE').AsFloat;
            Params.byname('MONEDA').AsString       := DmRef.QParametros.FieldByName('Moneda').AsString;
            if (QTrabajos.FieldByName('contrapartida').AsString <> '') then   begin
               Params.byname('CONTRAPARTIDA').AsString := QTrabajos.FieldByName('CONTRAPARTIDA').AsString;
            end;
            if (QTrabajos.FieldByName('centrocoste').AsString <> '') then   begin
               Params.byname('CUENTA_ANALITICA').AsString := QTrabajos.FieldByName('CENTROCOSTE').AsString;
            end;
            ExecQuery;
            Transaction.CommitRetaining;
            Inc(nApunte);
            QTrabajos.Next;
         end; // while
         Close;
         Free;
      end;

      // Actualizacion de fechas
      DMRef.QParametros.edit;
      DmRef.QParametros.FieldByName('FechaAmortizacion').AsDateTime :=
         CdsFiltro.FieldByName('Fecha').AsDateTime;
      DmRef.QParametros.Post;
      Caratula.Cerrar;
      Caratula.Free;
      MessageDlg('Generación de asientos finalizada correctamente', mtConfirmation, [mbOK], 0);
      Close;
   end;

   procedure GenerarDetalleInmovilizado;
   var
      Subcuenta_desde, Subcuenta_Hasta: String;
      Caratula: TEspere;
   begin
      QTrabajos.EmptyDataSet;

      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Generando informe ...';
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

      QAmortizaciones.Close;
      QAmortizaciones.SQL.Clear;
      //TODO: QAmortizaciones.Database := DmRef.IBDSiamCont;
      QAmortizaciones.SQL.Add('SELECT                                                         ');
      QAmortizaciones.SQL.Add('    A.*, S.DESCRIPCION, C.TIPOCUENTA                           ');
      QAmortizaciones.SQL.Add('FROM AMORTIZA A, CUENTAS C, SUBCTAS S                          ');
      QAmortizaciones.SQL.Add('WHERE                                                          ');
      if RgTipo.ItemIndex = 0 then   begin
         QAmortizaciones.SQL.Add('  (C.TIPOCUENTA = "M" OR C.TIPOCUENTA = "I") AND             ');
      end
      else
      if RgTipo.ItemIndex = 1 then   begin
         QAmortizaciones.SQL.Add('  C.TIPOCUENTA = "M" AND                                     ');
      end
      else begin
         QAmortizaciones.SQL.Add('  C.TIPOCUENTA = "I" AND                                     ');
      end;
      QAmortizaciones.SQL.Add('    SUBSTR(A.SUBCUENTA, 1, 3) = C.CUENTA AND                   ');
      if CDSFiltro.FieldByName('SUBCUENTA1').AsString = '' then   begin
         QAmortizaciones.SQL.Add('  (A.SUBCUENTA IS NULL OR (A.SUBCUENTA >= :SUBCUENTA1 OR A.SUBCUENTA <= :SUBCUENTA2)) AND');
      end
      else begin
         QAmortizaciones.SQL.Add('  A.SUBCUENTA >= :SUBCUENTA1 AND A.SUBCUENTA <= :SUBCUENTA2 AND');
      end;
      QAmortizaciones.SQL.Add('    A.SUBCUENTA = S.SUBCUENTA                                  ');
      if not CDSFiltro.FieldByName('FECHA').IsNull then   begin
         QAmortizaciones.SQL.Add('    AND (A.FBAJA IS NULL OR A.FBAJA <= :FECHA)               ');
      end;
      if CDSFiltro.FieldByName('FECHACOMPRADESDE').IsNull then   begin
         QAmortizaciones.SQL.Add('   AND (A.FCOMPRA IS NULL OR (A.FCOMPRA >= :FECHACOMPRADESDE AND A.FCOMPRA <= :FECHACOMPRAHASTA))');
      end
      else begin
         QAmortizaciones.SQL.Add('   AND A.FCOMPRA >= :FECHACOMPRADESDE AND A.FCOMPRA <= :FECHACOMPRAHASTA');
      end;
      if CDSFiltro.FieldByName('FECHAULTDESDE').IsNull then   begin
         QAmortizaciones.SQL.Add('   AND (A.FULTAMOR IS NULL OR (A.FULTAMOR >= :FECHAULTDESDE AND A.FULTAMOR <= :FECHAULTHASTA))');
      end
      else begin
         QAmortizaciones.SQL.Add('   AND A.FULTAMOR >= :FECHAULTDESDE AND A.FULTAMOR <= :FECHAULTHASTA');
      end;
      QAmortizaciones.SQL.Add('ORDER BY A.CLASE, A.SUBCUENTA                                  ');

      QAmortizaciones.ParamByName('SUBCUENTA1').AsString := subcuenta_desde;
      QAmortizaciones.ParamByName('SUBCUENTA2').AsString := subcuenta_hasta;
      if not CDSFiltro.FieldByName('FECHA').IsNull then   begin
         QAmortizaciones.ParamByName('FECHA').AsDateTime := CDSFiltro.FieldByName('FECHA').AsDateTime;
      end;
      QAmortizaciones.ParamByName('FECHACOMPRADESDE').AsDateTime :=
         CDSFiltro.FieldByName('FECHACOMPRADESDE').AsDateTime;
      QAmortizaciones.ParamByName('FECHACOMPRAHASTA').AsDateTime :=
         CDSFiltro.FieldByName('FECHACOMPRAHASTA').AsDateTime;
      QAmortizaciones.ParamByName('FECHAULTDESDE').AsDateTime    := CDSFiltro.FieldByName('FECHAULTDESDE').AsDateTime;
      QAmortizaciones.ParamByName('FECHAULTHASTA').AsDateTime    := CDSFiltro.FieldByName('FECHAULTHASTA').AsDateTime;

      QAmortizaciones.Open;

      Caratula.Cerrar;
      Caratula.Free;

      FormPrincipal.LanzarListado('LDetalleInmovilizado.rtm', SAmortizaciones, CDSFiltro.FieldByName('MONEDA').AsString);
   end;

   procedure GenerarInformeAmortizacion;
   var
      Subcuenta_desde, Subcuenta_Hasta: String;
      Caratula:  TEspere;
      Importe:   Double;
      Fecha:     TDateTime;
      Ejercicio: Integer;
   begin
      QTrabajos.EmptyDataSet;
      QTrabajos.IndexName := '';

      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Generando informe ...';
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
      with QAmortizaciones, SQL do begin
         Close;
         Clear;
         //TODO: database := DmRef.IBDSiamCont;
         Add('SELECT                                                         ');
         Add('    A.*, S.DESCRIPCION, C.TIPOCUENTA                           ');
         Add('FROM AMORTIZA A, CUENTAS C, SUBCTAS S                          ');
         Add('WHERE                                                          ');
         if RgTipo.ItemIndex = 0 then   begin
            Add('  (C.TIPOCUENTA = "M" OR C.TIPOCUENTA = "I") AND             ');
         end
         else
         if RgTipo.ItemIndex = 1 then   begin
            Add('  C.TIPOCUENTA = "M" AND                                     ');
         end
         else begin
            Add('  C.TIPOCUENTA = "I" AND                                     ');
         end;
         Add('    SUBSTR(A.SUBCUENTA, 1, 3) = C.CUENTA AND                   ');
         if CDSFiltro.FieldByName('SUBCUENTA1').AsString = '' then   begin
            Add('  (A.SUBCUENTA IS NULL OR (A.SUBCUENTA >= :SUBCUENTA1 OR A.SUBCUENTA <= :SUBCUENTA2)) AND');
         end
         else begin
            Add('  A.SUBCUENTA >= :SUBCUENTA1 AND A.SUBCUENTA <= :SUBCUENTA2 AND');
         end;
         Add('   A.SUBCUENTA = S.SUBCUENTA AND                                 ');
         Add('   A.VEJPAMOR <> 0 AND A.VAMOR <> 0 AND A.ANUAL <> 0              ');
         if not CDSFiltro.FieldByName('FECHA').IsNull then   begin
            Add('    AND (A.FBAJA IS NULL OR A.FBAJA <= :FECHA)               ');
         end;
         if not CDSFiltro.FieldByName('FECHA').IsNull then   begin
            Add('    AND (A.FBAJA IS NULL OR A.FBAJA <= :FECHA)               ');
         end;
         if CDSFiltro.FieldByName('FECHACOMPRADESDE').IsNull then   begin
            Add('   AND (A.FCOMPRA IS NULL OR (A.FCOMPRA >= :FECHACOMPRADESDE AND A.FCOMPRA <= :FECHACOMPRAHASTA))');
         end
         else begin
            Add('   AND A.FCOMPRA >= :FECHACOMPRADESDE AND A.FCOMPRA <= :FECHACOMPRAHASTA');
         end;
         if CDSFiltro.FieldByName('FECHAULTDESDE').IsNull then   begin
            Add('   AND (A.FULTAMOR IS NULL OR (A.FULTAMOR >= :FECHAULTDESDE AND A.FULTAMOR <= :FECHAULTHASTA))');
         end
         else begin
            Add('   AND A.FULTAMOR >= :FECHAULTDESDE AND A.FULTAMOR <= :FECHAULTHASTA');
         end;
         Add('ORDER BY A.CLASE, A.SUBCUENTA                                  ');

         ParamByName('SUBCUENTA1').AsString := subcuenta_desde;
         ParamByName('SUBCUENTA2').AsString := subcuenta_hasta;
         if not CDSFiltro.FieldByName('FECHA').IsNull then   begin
            ParamByName('FECHA').AsDateTime := CDSFiltro.FieldByName('FECHA').AsDateTime;
         end;
         ParamByName('FECHACOMPRADESDE').AsDateTime :=
            CDSFiltro.FieldByName('FECHACOMPRADESDE').AsDateTime;
         ParamByName('FECHACOMPRAHASTA').AsDateTime :=
            CDSFiltro.FieldByName('FECHACOMPRAHASTA').AsDateTime;
         ParamByName('FECHAULTDESDE').AsDateTime    := CDSFiltro.FieldByName('FECHAULTDESDE').AsDateTime;
         ParamByName('FECHAULTHASTA').AsDateTime    := CDSFiltro.FieldByName('FECHAULTHASTA').AsDateTime;

         Open;
      end;

      while not QAmortizaciones.EOF do begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QTrabajos do begin
            Append;
            FieldByName('SUBCUENTA').AsString := QAmortizacionesSUBCUENTA.AsString;
            FieldByName('DESCRIPCION').AsString := QAmortizacionesDESCRIPCION.AsString;
            FieldByName('INICIO').AsFloat := QAmortizacionesVEJPINICIO.AsFloat;
            Importe := RoundToDecimal(QAmortizacionesVAMOR.AsFloat / QAmortizacionesANUAL.AsFloat, 0, True);
            FieldByName('SUMA').AsFloat := 0;
            FieldByName('TOTAL').AsFloat := FieldByName('INICIO').AsFloat;

            Ejercicio := Year(CDSFiltro.FieldByName('FECHA').AsDateTime);

            FieldByName('TITULOLISTADO').AsString :=
               'INFORME DE AMORTIZACIÓN DEL EJERCICIO ' + IntToStr(Ejercicio);

            // Mes 1
            Fecha := StrToDateTime('31/1/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJAAMOR.AsFloat then
               begin
                  FieldByName('MES1').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES1').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES1').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES1').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 2
            if IsLeapYear(Ejercicio) then   begin
               Fecha := StrToDateTime('29/2/' + IntToStr(Ejercicio));
            end
            else begin
               Fecha := StrToDateTime('28/2/' + IntToStr(Ejercicio));
            end;
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES2').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES2').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES2').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES2').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 3
            Fecha := StrToDateTime('31/3/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES3').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES3').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES3').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES3').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 4
            Fecha := StrToDateTime('30/4/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES4').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES4').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES4').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES4').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 5
            Fecha := StrToDateTime('31/5/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES5').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES5').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES5').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES5').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 6
            Fecha := StrToDateTime('30/3/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES6').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES6').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES6').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES6').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 7
            Fecha := StrToDateTime('31/7/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES7').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES7').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES7').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES7').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 8
            Fecha := StrToDateTime('31/8/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES8').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES8').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES8').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES8').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 9
            Fecha := StrToDateTime('30/9/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES9').AsFloat  := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES9').AsFloat  :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES9').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES9').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 10
            Fecha := StrToDateTime('31/10/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES10').AsFloat := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES10').AsFloat :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES10').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES10').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 11
            Fecha := StrToDateTime('30/11/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES11').AsFloat := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES11').AsFloat :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES11').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES11').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            // Mes 12
            Fecha := StrToDateTime('31/12/' + IntToStr(Ejercicio));
            if (QAmortizacionesFINICIO.AsDateTime > 0) and
               (QAmortizacionesFINICIO.AsDateTime <= Fecha) then   begin
               if (QAmortizacionesFULTAMOR.AsDateTime > 0) and
                  (QAmortizacionesFULTAMOR.AsDateTime < Fecha) then   begin
                  QAmortizaciones.Next;
                  Continue;
               end;
               if Importe + FieldByName('SUMA').AsFloat <= QAmortizacionesVEJPAMOR.AsFloat then
               begin
                  FieldByName('MES12').AsFloat := Importe;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + Importe;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + Importe;
               end
               else begin
                  FieldByName('MES12').AsFloat :=
                     QAmortizacionesVEJPAMOR.AsFloat - FieldByName('SUMA').AsFloat;
                  FieldByName('SUMA').AsFloat  := FieldByName('SUMA').AsFloat + FieldByName('MES12').AsFloat;
                  FieldByName('TOTAL').AsFloat := FieldByName('TOTAL').AsFloat + FieldByName('MES12').AsFloat;
                  Post;
                  QAmortizaciones.Next;
                  Continue;
               end;
            end;

            Post;
         end;
         QAmortizaciones.Next;
      end;      

      // Conversión de importes
      QTrabajos.First;
      while not QTrabajos.EOF do begin
         QTrabajos.Edit;
         QTrabajosINICIO.AsFloat  := ConversionImporte(QTrabajosINICIO.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosIMPORTE.AsFloat := ConversionImporte(QTrabajosIMPORTE.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes1.AsFloat    := ConversionImporte(QTrabajosMES1.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes2.AsFloat    := ConversionImporte(QTrabajosMES2.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes3.AsFloat    := ConversionImporte(QTrabajosMES3.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes4.AsFloat    := ConversionImporte(QTrabajosMES4.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes5.AsFloat    := ConversionImporte(QTrabajosMES5.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes6.AsFloat    := ConversionImporte(QTrabajosMES6.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes7.AsFloat    := ConversionImporte(QTrabajosMES7.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes8.AsFloat    := ConversionImporte(QTrabajosMES8.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes9.AsFloat    := ConversionImporte(QTrabajosMES9.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes10.AsFloat   := ConversionImporte(QTrabajosMES10.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes11.AsFloat   := ConversionImporte(QTrabajosMES11.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosMes12.AsFloat   := ConversionImporte(QTrabajosMES12.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosSUMA.AsFloat    := ConversionImporte(QTrabajosSUMA.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajosTOTAL.AsFloat   := ConversionImporte(QTrabajosTOTAL.AsFloat, 'E',
            CDSFiltro.FieldByName('MONEDA').AsString);
         QTrabajos.Post;
         QTrabajos.Next;
      end;

      Caratula.Cerrar;
      Caratula.Free;

      FormPrincipal.LanzarListado('LAmortizacion.rtm', STrabajo, CDSFiltro.FieldByName('MONEDA').AsString);
   end;

begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if RgOperacion.ItemIndex = 1 then   begin
      GenerarAsientosAmortizacion;
   end
   else
   if RGListado.ItemIndex = 0 then   begin
      GenerarDetalleInmovilizado;
   end
   else begin
      GenerarInformeAmortizacion;
   end;
end;

procedure TWAmortizaciones.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWAmortizaciones.FormCreate(Sender: TObject);
begin
   //DMContaRef.FijarLongitudSubcuentas(Self);
   //DMContaRef.RefrescarSubcuentas(Self);
   FiltroCBSUBCUENTADesde.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FiltroCBSUBCUENTAHasta.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
end;

procedure TWAmortizaciones.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWAmortizaciones.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWAmortizaciones.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWAmortizaciones.QAmortizacionesCalcFields(DataSet: TDataSet);
begin
   QAmortizacionesCalcVAMOR.AsFloat       :=
      ConversionImporte(QAmortizacionesVAMOR.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVCOMPRA.AsFloat     :=
      ConversionImporte(QAmortizacionesVCOMPRA.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVEJAAMOR.AsFloat    :=
      ConversionImporte(QAmortizacionesVEJAAMOR.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVEJAINICIO.AsFloat  :=
      ConversionImporte(QAmortizacionesVEJAINICIO.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVEJPAMOR.AsFloat    :=
      ConversionImporte(QAmortizacionesVEJPAMOR.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVEJPINICIO.AsFloat  :=
      ConversionImporte(QAmortizacionesVEJPINICIO.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVRESIDUAL.AsFloat   :=
      ConversionImporte(QAmortizacionesVRESIDUAL.AsFloat, 'E',
      CDSFiltro.FieldByName('MONEDA').AsString);
   QAmortizacionesCalcVAMORTIZADO.AsFloat :=
      ConversionImporte(QAmortizacionesVEJPINICIO.AsFloat + QAmortizacionesVEJAINICIO.AsFloat,
      'E', CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWAmortizaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
