unit UEfectosComerciales;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages, OvcBase,
     ovcdbnf, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, Wwdatsrc,
     Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot, Wwkeycb, wwSpeedButton;
type
   TWEfectosComerciales = class(TForm)
      OvcController1:  TOvcController;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      SFichero:        TwwDataSource;
      QFicheroEfectos: TClientDataSet;
      GroupBox1:       TGroupBox;
      Label81:         TLabel;
      Label82:         TLabel;
      eDescSctaEfectosDescontados: TwwDBLookupCombo;
      eSctaEfectosDescontados: TwwDBLookupCombo;
      eDescSctaDeudasDescuentos: TwwDBLookupCombo;
      eSctaDeudasDescuentos: TwwDBLookupCombo;
      oAsientoRiesgo:  TCheckBox;
      Datos:           TGroupBox;
      Label7:          TLabel;
      Label10:         TLabel;
      Label1:          TLabel;
      eSituacion:      TwwDBComboBox;
      eSubctaEfectosComerciales: TwwDBLookupCombo;
      eDescSubctaEfectosComerciales: TwwDBLookupCombo;
      eDescConcepto:   TwwDBLookupCombo;
      eConcepto:       TwwDBLookupCombo;
      oModificarVtos:  TCheckBox;
      eImporte:        TOvcDbNumericField;
      Label6:          TLabel;
      eImporteRiesgo:  TOvcDbNumericField;
      Label2:          TLabel;
      eFechaVtos:      TwwDBDateTimePicker;
      Label9:          TLabel;
      Label3:          TLabel;
      eFechaRiesgo:    TwwDBDateTimePicker;
      QFicheroEfectosSCTAEFECTOSCOMERCIALES: TStringField;
      QFicheroEfectosSITUACION: TStringField;
      QFicheroEfectosFECHAVTOS: TDateTimeField;
      QFicheroEfectosIMPORTEVTOS: TFloatField;
      QFicheroEfectosIMPORTERIESGO: TFloatField;
      QFicheroEfectosFECHARIESGO: TDateTimeField;
      QFicheroEfectosSCTAEFECTOSDESCONTADOS: TStringField;
      QFicheroEfectosSCTADEUDASDESCUENTOS: TStringField;
      Label4:          TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      QFicheroEfectosID_CONCEPTOS_RIESGO: TVarBytesField;
      QFicheroEfectosID_CONCEPTOS: TVarBytesField;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure eImporteClick(Sender: TObject);
   private
   public
      FFechaVencimiento, FFechaEmision: TDateTime;
      FFactura, FSubcuenta: String;
      FTotalImporte:        Double;
   end;

var WEfectosComerciales: TWEfectosComerciales;

implementation
uses DM, DMConta, General, Globales, UCarteraEfectos, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWEfectosComerciales.BtnEdtProcesarClick(Sender: TObject);
var
   Asiento, AsientoRiesgo: Integer;

   procedure GenerarAsientoSaldarSubcta;
   var
      cComentario: String;
   begin
      Asiento := DMContaRef.ObtenerNumeroAsiento;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('select descripcion from subctas where subcuenta=:subcuenta');
         ParamByName('SUBCUENTA').AsString := FSubcuenta;
         Execquery;
         cComentario := FieldByName('descripcion').AsString;

         Close;
         Clear;
         Add('INSERT INTO DIARIO');
         Add('   (APUNTE, ASIENTO, CONTRAPARTIDA, DEBEHABER,');
         Add('    FECHA, IMPORTE, MONEDA, NUMEROFACTURA, SUBCUENTA,');
         Add('    ID_CONCEPTOS,COMENTARIO)');
         Add('VALUES');
         Add('   (:APUNTE, :ASIENTO, :CONTRAPARTIDA, :DEBEHABER,');
         Add('    :FECHA, :IMPORTE, :MONEDA, :NUMEROFACTURA, :SUBCUENTA,');
         Add('    :ID_CONCEPTOS,:COMENTARIO)');

         // Apunte 1
         Close;
         ParamByName('APUNTE').AsInteger       := 1;
         ParamByName('ASIENTO').AsInteger      := Asiento;
         ParamByName('FECHA').AsDateTime       := QFicheroEfectosFECHAVTOS.AsDateTime;
         ParamByName('IMPORTE').AsDouble       := QFicheroEfectosIMPORTEVTOS.AsFloat;
         ParamByName('MONEDA').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('NUMEROFACTURA').AsString := FFactura;
         ParamByName('ID_CONCEPTOS').AsString  := QFicheroEfectosID_CONCEPTOS.AsString;
         ParamByName('SUBCUENTA').AsString     := QFicheroEfectosSCTAEFECTOSCOMERCIALES.AsString;
         ParamByName('CONTRAPARTIDA').AsString := FSubcuenta;
         ParamByName('DEBEHABER').AsString     := 'D';
         ParamByName('COMENTARIO').AsString    := cComentario;
         ExecQuery;
         Transaction.CommitRetaining;

         // Apunte 2
         Close;
         ParamByName('APUNTE').AsInteger       := 2;
         ParamByName('ASIENTO').AsInteger      := Asiento;
         ParamByName('FECHA').AsDateTime       := QFicheroEfectosFECHAVTOS.AsDateTime;
         ParamByName('IMPORTE').AsDouble       := QFicheroEfectosIMPORTEVTOS.AsFloat;
         ParamByName('MONEDA').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('NUMEROFACTURA').AsString := FFactura;
         ParamByName('ID_CONCEPTOS').AsString  := QFicheroEfectosID_CONCEPTOS.AsString;
         ParamByName('SUBCUENTA').AsString     := FSubcuenta;
         ParamByName('CONTRAPARTIDA').AsString := QFicheroEfectosSCTAEFECTOSCOMERCIALES.AsString;
         ParamByName('DEBEHABER').AsString     := 'H';
         ParamByName('COMENTARIO').AsString    := cComentario;

         ExecQuery;
         Transaction.CommitRetaining;

         Close;
         Free;
      end;
   end;

   procedure ModificarVencimientos;
   var
      I: Integer;
   begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with WCarteraEfectos do begin
         for I := 0 to Rejilla.SelectedList.Count - 1 do begin
            QFichero.GotoBookmark(Rejilla.SelectedList.Items[I]);
            QFichero.Edit;
            QFicheroSUBCUENTA.AsString := QFicheroEfectosSCTAEFECTOSCOMERCIALES.AsString;
            QFicheroSITUACION.AsString := QFicheroEfectosSITUACION.AsString;
            QFichero.Post;
            QFichero.Transaction.CommitRetaining;
         end;
      end;

      GenerarAsientoSaldarSubcta;
   end;

   procedure GenerarAsientoRiesgo;
   begin
      AsientoRiesgo := DMContaRef.ObtenerNumeroAsiento;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('INSERT INTO DIARIO');
         Add('   (APUNTE, ASIENTO, CONTRAPARTIDA, DEBEHABER,');
         Add('    FECHA, IMPORTE, MONEDA, NUMEROFACTURA, SUBCUENTA,');
         Add('    ID_CONCEPTOS)');
         Add('VALUES');
         Add('   (:APUNTE, :ASIENTO, :CONTRAPARTIDA, :DEBEHABER,');
         Add('    :FECHA, :IMPORTE, :MONEDA, :NUMEROFACTURA, :SUBCUENTA,');
         Add('    :ID_CONCEPTOS)');

         // Apunte 1
         Close;
         ParamByName('APUNTE').AsInteger       := 1;
         ParamByName('ASIENTO').AsInteger      := AsientoRiesgo;
         ParamByName('FECHA').AsDateTime       := QFicheroEfectosFECHARIESGO.AsDateTime;
         ParamByName('IMPORTE').AsDouble       := QFicheroEfectosIMPORTERIESGO.AsFloat;
         ParamByName('MONEDA').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('NUMEROFACTURA').AsString := FFactura;
         ParamByName('ID_CONCEPTOS').AsString  := QFicheroEfectosID_CONCEPTOS_RIESGO.AsString;
         ParamByName('SUBCUENTA').AsString     := QFicheroEfectosSCTAEFECTOSDESCONTADOS.AsString;
         ParamByName('CONTRAPARTIDA').AsString := QFicheroEfectosSCTADEUDASDESCUENTOS.AsString;
         ParamByName('DEBEHABER').AsString     := 'D';
         ExecQuery;
         Transaction.CommitRetaining;

         // Apunte 2
         Close;
         ParamByName('APUNTE').AsInteger       := 2;
         ParamByName('ASIENTO').AsInteger      := AsientoRiesgo;
         ParamByName('FECHA').AsDateTime       := QFicheroEfectosFECHARIESGO.AsDateTime;
         ParamByName('IMPORTE').AsDouble       := QFicheroEfectosIMPORTERIESGO.AsFloat;
         ParamByName('MONEDA').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('NUMEROFACTURA').AsString := FFactura;
         ParamByName('ID_CONCEPTOS').AsString  := QFicheroEfectosID_CONCEPTOS_RIESGO.AsString;
         ParamByName('SUBCUENTA').AsString     := QFicheroEfectosSCTADEUDASDESCUENTOS.AsString;
         ParamByName('CONTRAPARTIDA').AsString := QFicheroEfectosSCTAEFECTOSDESCONTADOS.AsString;
         ParamByName('DEBEHABER').AsString     := 'H';
         ExecQuery;
         Transaction.CommitRetaining;

         Close;
         Free;
      end;
   end;

   procedure GenerarNuevoVencimiento;
   var
      DescConcepto: String;
   begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT DESCRIPCION FROM CONCEPTOS WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
         ParamByName('ID_CONCEPTOS').AsString := QFicheroEfectosID_CONCEPTOS_RIESGO.AsString;
         ExecQuery;
         DescConcepto := FieldByName('DESCRIPCION').AsString;

         Close;
         Clear;
         Add('INSERT INTO CARTERAEFECTOS');
         Add('   (SUBCUENTA, SITUACION, SUBCTABANCO, CONCEPTO, FEMISION,');
         Add('    FASIENTO, IMPORTE, FVENCIMIENTO, ASIENTORIESGO)');
         Add('VALUES');
         Add('   (:SUBCUENTA, :SITUACION, :SUBCTABANCO, :CONCEPTO, :FEMISION,');
         Add('    :FASIENTO, :IMPORTE, :FVENCIMIENTO, :ASIENTORIESGO)');

         ParamByName('SUBCUENTA').AsString      := QFicheroEfectosSCTAEFECTOSDESCONTADOS.AsString;
         ParamByName('SITUACION').AsString      := 'B';
         ParamByName('SUBCTABANCO').AsString    := QFicheroEfectosSCTADEUDASDESCUENTOS.AsString;
         ParamByName('CONCEPTO').AsString       := DescConcepto;
         ParamByName('FEMISION').AsDateTime     := FFechaEmision;
         ParamByName('FASIENTO').AsDateTime     := QFicheroEfectosFECHARIESGO.AsDateTime;
         ParamByName('IMPORTE').AsFloat         := QFicheroEfectosIMPORTERIESGO.AsFloat;
         ParamByName('FVENCIMIENTO').AsDateTime := FFechaVencimiento;
         ParamByName('ASIENTORIESGO').AsInteger := AsientoRiesgo;

         ExecQuery;
         Transaction.CommitRetaining;

         Close;
         Free;
      end;
   end;

begin
   Perform(wm_NextDlgCtl, 0, 0);

   Asiento       := 0;
   AsientoRiesgo := 0;


   if oModificarVtos.Checked then  begin
      if QFicheroEfectosSCTAEFECTOSCOMERCIALES.AsString = '' then   begin
         eSubctaEfectosComerciales.SetFocus;
         DatabaseError('La subcuenta de efectos comerciales está en blanco.');
      end;
      if QFicheroEfectosID_CONCEPTOS.AsString = '' then   begin
         eConcepto.SetFocus;
         DatabaseError('El concepto está en blanco.');
      end;
      if QFicheroEfectosSITUACION.AsString = '' then   begin
         eSituacion.SetFocus;
         DatabaseError('La situación está en blanco.');
      end;
      if QFicheroEfectosFECHAVTOS.IsNull then   begin
         eFechaVtos.SetFocus;
         DatabaseError('La fecha de asiento está en blanco.');
      end;
   end;

   if oAsientoRiesgo.Checked then  begin
      if QFicheroEfectosSCTAEFECTOSDESCONTADOS.AsString = '' then   begin
         eSctaEfectosDescontados.SetFocus;
         DatabaseError('La subcuenta de efectos descontados está en blanco.');
      end;
      if QFicheroEfectosSCTADEUDASDESCUENTOS.AsString = '' then   begin
         eSctaDeudasDescuentos.SetFocus;
         DatabaseError('La subcuenta de deudas por descuentos está en blanco.');
      end;
      if QFicheroEfectosFECHARIESGO.IsNull then   begin
         eFechaRiesgo.SetFocus;
         DatabaseError('La fecha de asiento está en blanco.');
      end;
   end;


   // Modificar vencimientos
   if oModificarVtos.Checked then   begin
      ModificarVencimientos;
   end;

   // Asiento de riesgo
   if oAsientoRiesgo.Checked then  begin
      GenerarAsientoRiesgo;
      GenerarNuevoVencimiento;
   end;

   if oModificarVtos.Checked and not oAsientoRiesgo.Checked then   begin
      MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', Asiento), mtInformation, [mbOK], 0);
   end else
   if oAsientoRiesgo.Checked and not oModificarVtos.Checked then   begin
      MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', AsientoRiesgo), mtInformation, [mbOK], 0);
   end else
   if oAsientoRiesgo.Checked and oModificarVtos.Checked then   begin
      MessageDlg('Generados asientos nº ' + FormatFloat('###,###,###', Asiento) + ' y ' +
         FormatFloat('###,###,###', AsientoRiesgo), mtInformation, [mbOK], 0);
   end;

   Close;
end;

procedure TWEfectosComerciales.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWEfectosComerciales.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWEfectosComerciales.FormShow(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFicheroEfectos do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SCTAEFECTOSCOMERCIALES', ftString, 10, False);
         Add('ID_CONCEPTOS', ftVarBytes, 3, False);
         Add('SITUACION', ftString, 1, False);
         Add('FECHAVTOS', ftDateTime, 0, False);
         Add('IMPORTEVTOS', ftFloat, 0, False);

         Add('IMPORTERIESGO', ftFloat, 0, False);
         Add('FECHARIESGO', ftDateTime, 0, False);
         Add('SCTAEFECTOSDESCONTADOS', ftString, 10, False);
         Add('SCTADEUDASDESCUENTOS', ftString, 10, False);
         Add('ID_CONCEPTOS_RIESGO', ftVarBytes, 3, False);
      end;
      CreateDataset;
      Open;
      append;
   end;

   QFicheroEfectosSCTAEFECTOSCOMERCIALES.AsString :=
      DMRef.QParametros.FieldByName('SCTAEFECTOSCOMERCIALES').AsString;
   QFicheroEfectosID_CONCEPTOS.AsString :=
      DMRef.QParametros.FieldByName('CTOEFECTOSCOMERCIALES').AsString;
   QFicheroEfectosSITUACION.AsString   := 'A';   // Aceptado
   QFicheroEfectosFECHAVTOS.AsDateTime := Date;
   QFicheroEfectosIMPORTEVTOS.AsFloat  := FTotalImporte;

   QFicheroEfectosIMPORTERIESGO.AsFloat           := FTotalImporte;
   QFicheroEfectosFECHARIESGO.AsDateTime          := Date;
   QFicheroEfectosSCTAEFECTOSDESCONTADOS.AsString :=
      DMRef.QParametros.FieldByName('SCTAEFECTDESCONTADOS').AsString;
   QFicheroEfectosSCTADEUDASDESCUENTOS.AsString   :=
      DMRef.QParametros.FieldByName('SCTADEUDASDESCUENTOS').AsString;
   QFicheroEfectosID_CONCEPTOS_RIESGO.AsString    :=
      DMRef.QParametros.FieldByName('CTODEUDASDESCUENTOS').AsString;

   eSubctaEfectosComerciales.SetFocus;
end;

procedure TWEfectosComerciales.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtCancelar.Click;
      end;
      VK_F3: begin
         BtnEdtProcesar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBLookupCombo) and not (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBLookupCombo) and not (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWEfectosComerciales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario := nil;
end;

procedure TWEfectosComerciales.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWEfectosComerciales.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWEfectosComerciales.FormCreate(Sender: TObject);
begin
   FSubcuenta        := '';
   FTotalImporte     := 0;
   FFactura          := '';
   FFechaEmision     := 0;
   FFechaVencimiento := 0;
end;

procedure TWEfectosComerciales.eImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
