unit UCargaRapidaNominas;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcShapeBtn, Forms, Globales, Graphics, Grids, IBCustomDataSet, IBDatabase,
     IBQuery, IBSQL, IBTableSet, jpeg, Mask, Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF,
     OvcNbk, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, variants, WinProcs, WinTypes, wwclearpanel,
     wwclient, Wwdatsrc, Wwdbcomb, wwdbdatetimepicker, Wwdbdlg, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook,
     wwDBNavigator, Wwdbspin, Wwdotdot, Wwkeycb, wwSpeedButton, Wwtable;
type
   TWCargaRapidaNominas = class(TForm)
      OvcController1:  TOvcController;
      Shape1:          TShape;
      lTitulo:         TLabel;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtGuardar:   TfcImageBtn;
      SFichero:        TwwDataSource;
      QFichero:        TClientDataSet;
      Paginas:         TOvcNotebook;
      GridEdtMovimientos: TwwDBGrid;
      Transaccion:     TIBTransaction;
      SMovimientos:    TDataSource;
      Label1:          TLabel;
      DBText1:         TDBText;
      QMovimientos:    TIBTableSet;
      QMovimientosASIENTO: TIntegerField;
      QMovimientosAPUNTE: TSmallintField;
      QMovimientosFECHA: TDateTimeField;
      QMovimientosSUBCUENTA: TIBStringField;
      QMovimientosID_CONCEPTOS: TIBStringField;
      QMovimientosDescComentario: TStringField;
      QMovimientosDEBEHABER: TIBStringField;
      QMovimientosIMPORTE: TFloatField;
      QMovimientosCONTRAPARTIDA: TIBStringField;
      QMovimientosCOMENTARIO: TIBStringField;
      QMovimientosNUMEROFACTURA: TIBStringField;
      QMovimientosCUENTA_ANALITICA: TIBStringField;
      QMovimientosDESCCONCEPTO: TIBStringField;
      QMovimientosDESCSUBCUENTA: TIBStringField;
      BtnEdtSalir:     TfcImageBtn;
      Label5:          TLabel;
      BtnEdtSubcuenta: TfcImageBtn;
      SEmpleados:      TwwDataSource;
      QEmpleados:      TClientDataSet;
      QEmpleadosNOMINA: TFloatField;
      QEmpleadosIRPF:  TFloatField;
      QEmpleadosSSOCIAL: TFloatField;
      QEmpleadosNETO:  TFloatField;
      GroupBox7:       TGroupBox;
      Label37:         TLabel;
      Label38:         TLabel;
      Label39:         TLabel;
      Label41:         TLabel;
      eSubctaSueldosSalarios: TwwDBLookupCombo;
      eDescSubctaSueldosSalarios: TwwDBLookupCombo;
      eSubctaSS:       TwwDBLookupCombo;
      eDescSubctaSS:   TwwDBLookupCombo;
      eSubctaIRPF:     TwwDBLookupCombo;
      eDescSubctaIRPF: TwwDBLookupCombo;
      wwDBLookupCombo9: TwwDBLookupCombo;
      wwDBLookupCombo8: TwwDBLookupCombo;
      GroupBox8:       TGroupBox;
      Label43:         TLabel;
      Label44:         TLabel;
      Label50:         TLabel;
      Label7:          TLabel;
      wwDBLookupCombo2: TwwDBLookupCombo;
      eSubctaGastoSSEmpresa: TwwDBLookupCombo;
      eDescSubctaGastoSSEmpresa: TwwDBLookupCombo;
      eSubctaSSEmpresa: TwwDBLookupCombo;
      eDescSubctaSSEmpresa: TwwDBLookupCombo;
      eEmpresa:        TOvcDbNumericField;
      wwDBLookupCombo1: TwwDBLookupCombo;
      Datos:           TGroupBox;
      GridEdtEmpleados: TwwDBGrid;
      Label2:          TLabel;
      Label4:          TLabel;
      eComentario:     TOvcDbPictureField;
      eFecha:          TwwDBDateTimePicker;
      QEmpleadosSUBCUENTA: TStringField;
      QEmpleadosDESCRIPCION: TStringField;
      eSubcuenta:      TwwDBLookupCombo;
      eSubcuentaDesc:  TwwDBLookupCombo;
      PermAniadir:     TfcShapeBtn;
      PermBorrar:      TfcShapeBtn;
      PermInicializar: TfcShapeBtn;
      BtnEdtModificar: TfcImageBtn;
      BtnEdtBorrarMovim: TfcImageBtn;
      BtnEdtMayor:     TfcImageBtn;
      QMovimientosABREVIATURA: TIBStringField;
      eAnalitica:      TwwDBLookupCombo;
      Label17:         TLabel;
      eAnaliticaNom:   TwwDBLookupCombo;
      QEmpleadosN:     TStringField;
      Label3:          TLabel;
      eSubctaOtras:    TwwDBLookupCombo;
      eDescSubctaOtras: TwwDBLookupCombo;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      QMovimientosEJERCICIO: TIntegerField;
      QMovimientosSERIE: TIBStringField;
      procedure BtnEdtGuardarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure BtnEdtBorrarMovimClick(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure GridEdtEmpleadosCellChanged(Sender: TObject);
      procedure BtnEdtRestablecerClick(Sender: TObject);
      procedure BtnEdtBorrarEmpleadoClick(Sender: TObject);
      procedure QEmpleadosCalcFields(DataSet: TDataSet);
      procedure BtnEdtAniadirClick(Sender: TObject);
      procedure GridEdtEmpleadosKeyPress(Sender: TObject; var Key: Char);
      procedure BtnEdtModificarClick(Sender: TObject);
      procedure BtnEdtMayorClick(Sender: TObject);
      procedure ImporteClick(Sender: TObject);
      procedure eSubcuentaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
   private
      FColorActual:     TColor;
      FAsientoAnterior: Integer;

      procedure ConfigurarGridEmpleados;
      procedure CrearFichero;
      function DatosEmpleadosValidos: Boolean;
      procedure InicializarFichero_QFichero;
      procedure InicializarFichero_QEmpleados;
      procedure InicializarModoArranque;
      procedure PrepararQuery;
      procedure RellenarAsientoEmpresa;
      procedure RellenarNominasEmpleados;
      procedure BorrarAsiento(Asiento: Integer);
      procedure BorrarNominas(Asiento: Integer);
   public
      FModoArranque: TModoArranque;
      FAsientoNomina, FAsientoEmpresa: Integer;
   end;

var WCargaRapidaNominas: TWCargaRapidaNominas;
implementation
uses Cadenas, DM, DMConta, General, InfMayor, UCargaAsiento, UFiltroMayorSubcuenta, UNuevaSubcuenta,
     MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWCargaRapidaNominas.ConfigurarGridEmpleados;
begin
   // Configuración del grid de empleados
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with GridEdtEmpleados do begin
      Selected.Clear;
      if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
         Selected.Add('DESCRIPCION' + #9 + '36' + #9 + 'DESCRIPCIÓN');
         Selected.Add('SUBCUENTA' + #9 + '14' + #9 + 'SUBCUENTA');
      end
      else begin
         Selected.Add('SUBCUENTA' + #9 + '14' + #9 + 'SUBCUENTA');
         Selected.Add('DESCRIPCION' + #9 + '36' + #9 + 'DESCRIPCIÓN');
      end;
      Selected.Add('NOMINA' + #9 + '12' + #9 + 'IMP. NÓMINA');
      Selected.Add('IRPF' + #9 + '12' + #9 + 'I.R.P.F.');
      Selected.Add('SSOCIAL' + #9 + '12' + #9 + 'S. SOCIAL');
      Selected.Add('NETO' + #9 + '12' + #9 + 'NETO');
      Selected.Add('N' + #9 + '7' + #9 + 'NÓMINA');

      ApplySelected;

      SetControlType('SUBCUENTA', fctCustom, 'eSubcuenta');
      SetControlType('DESCRIPCION', fctCustom, 'eSubcuentaDesc');
      SetControlType('N', fctCheckBox, 'S;N');
   end;
end;

procedure TWCargaRapidaNominas.CrearFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('SCTANOMSUELDO', ftString, 10, False);
      Add('SCTAOTRAS', ftString, 10, False);
      Add('SCTANOMSST', ftString, 10, False);
      Add('SCTANOMIRPF', ftString, 10, False);
      Add('CTONOMT', ftVarBytes, 3, False);
      Add('SCTANOMCARGO', ftString, 10, False);
      Add('SCTANOMSSE', ftString, 10, False);
      Add('CTONOME', ftVarBytes, 3, False);
      Add('IMPEMPRESA', ftFloat, 0, False);

      Add('Fecha', ftDate, 0, False);
      Add('CUENTA_ANALITICA', ftString, 10, False);
      Add('COMENTARIO', ftString, 40, False);

      CreateDataSet;
      Active := True;
      Append;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QEmpleados, FieldDefs do begin
      Active := False;
      Clear;

      Add('SUBCUENTA', ftString, 10, False);
      Add('DESCRIPCION', ftString, 80, False);
      Add('NOMINA', ftFloat, 0, False);
      Add('IRPF', ftFloat, 0, False);
      Add('SSOCIAL', ftFloat, 0, False);
      Add('NETO', ftFloat, 0, False);
      Add('N', ftString, 1, False);

      FieldByName('NETO').FieldKind := fkCalculated;

      CreateDataSet;
      Active := True;

      Append;
      Post;
   end;

   QEmpleadosNOMINA.DisplayFormat  := '###,###,###.##';
   QEmpleadosIRPF.DisplayFormat    := '###,###,###.##';
   QEmpleadosSSOCIAL.DisplayFormat := '###,###,###.##';
   QEmpleadosNETO.DisplayFormat    := '###,###,###.##';

   Modo(Self, Edita);
end;

function TWCargaRapidaNominas.DatosEmpleadosValidos: Boolean;
var
   Msg:       String;
   Confirmar: Boolean;
begin
   // Msg contendrá la información a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg       := '';
   Result    := True;
   Confirmar := True;

   if QEmpleados.State in dsEditModes then   begin
      QEmpleados.Post;
   end;

   QEmpleados.DisableControls;
   QEmpleados.First;

   while not QEmpleados.EOF do begin
      if RoundToDecimal(QEmpleados.FieldByName('NETO').AsFloat, 2, True) < 0 then   begin
         Msg := 'El importe neto no puede ser negativo.';
      end;

      // Si los datos especificados no son válidos, presentar mensaje de error.
      if Trim(Msg) <> '' then   begin
         QEmpleados.EnableControls;
         GridEdtEmpleados.SetFocus;
         Result := False;
         DatabaseError(Msg);
      end;

      if (RoundToDecimal(QEmpleados.FieldByName('NOMINA').AsFloat, 2, True) = 0) and Confirmar then
      begin
         if MessageDlg('¿Desea generar también las nóminas con importe cero?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
            QEmpleados.EnableControls;
            Result := False;
            Exit;
         end;

         Confirmar := False;
      end;

      if (QEmpleados.FieldByName('N').AsString <> 'S') and
         Empty(QFichero.FieldByName('SCTAOTRAS').AsString) then   begin
         QEmpleados.EnableControls;
         Result := False;
         MessageDlg('No se puede dejar en blanco la subcuenta de otras remuneraciones.', mtInformation, [mbOK], 0);
         Exit;
      end;

      QEmpleados.Next;
   end;

   QEmpleados.First;
   QEmpleados.EnableControls;
end;

procedure TWCargaRapidaNominas.InicializarFichero_QFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Edit;

      FieldByName('Fecha').AsDateTime          := Date;
      FieldByName('SCTANOMSUELDO').AsString    := DmRef.QParametros.FieldByName('SctaNomsueldo').AsString;
      FieldByName('SCTAOTRAS').AsString        := DMRef.QParametros.FieldByName('SCTAOTRASREMUN').AsString;
      FieldByName('SCTANOMSST').AsString       := DmRef.QParametros.FieldByName('SctaNomSSt').AsString;
      FieldByName('SCTANOMIRPF').AsString      := DmRef.QParametros.FieldByName('SctaNomIrpf').AsString;
      FieldByName('CTONOMT').AsString          := DmRef.QParametros.FieldByName('CtoNomt').AsString;
      FieldByName('SCTANOMCARGO').AsString     := DmRef.QParametros.FieldByName('SctaNomCargo').AsString;
      FieldByName('SCTANOMSSE').AsString       := DmRef.QParametros.FieldByName('SctaNomsse').AsString;
      QFichero.FieldByName('CTONOME').AsString := DmRef.QParametros.FieldByName('CtoNomE').AsString;

      Post;
   end;
end;

procedure TWCargaRapidaNominas.InicializarFichero_QEmpleados;
begin
   QEmpleados.EmptyDataSet;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;

      Clear;
      Add('SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS');
      Add('WHERE SUBCUENTA <> :SUBCUENTA');
      Add('ORDER BY SUBCUENTA');
      ParamByName('SUBCUENTA').AsString := DMRef.QParametros.FieldByName('SCTANOMPAGO').AsString;
      ExecQuery;

      if EOF then   begin
         Close;
         Clear;
         Add('SELECT SUBCUENTA, DESCRIPCION FROM SUBCTAS_NOMINAS');
         Add('ORDER BY SUBCUENTA');
         ExecQuery;
      end;

      while not EOF do begin
         QEmpleados.Append;
         QEmpleadosSUBCUENTA.AsString   := FieldByName('SUBCUENTA').AsString;
         QEmpleadosDESCRIPCION.AsString := FieldByName('DESCRIPCION').AsString;
         QEmpleadosN.AsString           := 'S';
         QEmpleados.Post;

         Next;
      end;

      Close;
      Free;
   end;

   QEmpleados.First;
   QEmpleados.Edit;
end;

procedure TWCargaRapidaNominas.InicializarModoArranque;
begin
   InicializarFichero_QFichero;

   if FModoArranque = INSERCION then  begin
      InicializarFichero_QEmpleados;
   end
   else begin
      RellenarAsientoEmpresa;
      RellenarNominasEmpleados;
   end;
end;

procedure TWCargaRapidaNominas.PrepararQuery;
var
   Asiento: Integer;
begin
   Asiento := DMRef.ObtenerValor('GEN_ID(ASIENTO, 0)', 'RDB$DATABASE', '');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QMovimientos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT');
      Add('   D.ASIENTO,D.APUNTE,D.FECHA,D.SUBCUENTA,D.ID_CONCEPTOS, D.DEBEHABER,');
      Add('   D.CONTRAPARTIDA,D.COMENTARIO,D.NUMEROFACTURA,D.CUENTA_ANALITICA,D.SERIE, D.EJERCICIO,');
      Add('   C.DESCRIPCION DESCCONCEPTO, S.DESCRIPCION DESCSUBCUENTA,D.IMPORTE,S.ABREVIATURA');
      Add('FROM DIARIO D, CONCEPTOS C, SUBCTAS S');
      Add('WHERE');
      Add('   D.ASIENTO >= :ASIENTO1 AND D.ASIENTO <= :ASIENTO2 AND');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS AND');
      Add('   D.SUBCUENTA = S.SUBCUENTA');
      Add('ORDER BY D.ASIENTO, D.APUNTE');
      Params.ByName('ASIENTO1').AsInteger := Asiento - 30;
      Params.ByName('ASIENTO2').AsInteger := Asiento;
      Prepare;
      EnableControls;
      Open;
      Last;
   end;
end;

procedure TWCargaRapidaNominas.RellenarAsientoEmpresa;
begin
   if FAsientoEmpresa <> 0 then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT * FROM DIARIO WHERE ASIENTO = :ASIENTO ORDER BY APUNTE');
         ParamByName('ASIENTO').AsInteger := FAsientoEmpresa;
         Open;

         if not EOF then   begin
            if not (QFichero.State in dsEditModes) then   begin
               QFichero.Edit;
            end;

            QFichero.FieldByName('FECHA').AsDateTime           := FieldByName('FECHA').AsDateTime;
            QFichero.FieldByName('COMENTARIO').AsString        := FieldByName('COMENTARIO').AsString;
            QFichero.FieldByName('CUENTA_ANALITICA').AsVariant := FieldByName('CUENTA_ANALITICA').AsVariant;

            QFichero.FieldByName('SCTANOMCARGO').AsString := FieldByName('SUBCUENTA').AsString;
            QFichero.FieldByName('SCTANOMSSE').AsString   := FieldByName('CONTRAPARTIDA').AsString;
            QFichero.FieldByName('IMPEMPRESA').AsFloat    := FieldByName('IMPORTE').AsFloat;
            QFichero.FieldByName('CTONOME').AsString      := FieldByName('ID_CONCEPTOS').AsString;
         end;

         Close;
         Free;
      end;
   end;
end;

procedure TWCargaRapidaNominas.RellenarNominasEmpleados;
begin
   QEmpleados.EmptyDataSet;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT * FROM DIARIO WHERE ASIENTO = :ASIENTO ORDER BY APUNTE');
      ParamByName('ASIENTO').AsInteger := FAsientoNomina;
      Open;

      while not EOF do begin
         if not (QFichero.State in dsEditModes) then   begin
            QFichero.Edit;
         end;

         QFichero.FieldByName('FECHA').AsDateTime           := FieldByName('FECHA').AsDateTime;
         QFichero.FieldByName('COMENTARIO').AsString        := FieldByName('COMENTARIO').AsString;
         QFichero.FieldByName('CUENTA_ANALITICA').AsVariant := FieldByName('CUENTA_ANALITICA').AsVariant;

         if FieldByName('APUNTE').AsInteger = 1 then   begin
            QFichero.FieldByName('SCTANOMSUELDO').AsString := FieldByName('SUBCUENTA').AsString;
         end
         else
         if FieldByName('APUNTE').AsInteger = 2 then   begin
            QFichero.FieldByName('SCTANOMSST').AsString := FieldByName('SUBCUENTA').AsString;
         end
         else
         if FieldByName('APUNTE').AsInteger = 3 then   begin
            QFichero.FieldByName('SCTANOMIRPF').AsString := FieldByName('SUBCUENTA').AsString;
         end;
         QFichero.FieldByName('CTONOMT').AsString := FieldByName('ID_CONCEPTOS').AsString;

         Next;
      end;


      Close;
      Clear;
      Add('SELECT * FROM NOMINAS WHERE ASIENTO = :ASIENTO');
      Add('ORDER BY SUBCUENTA');
      ParamByName('ASIENTO').AsInteger := FAsientoNomina;
      Open;

      while not EOF do begin
         QEmpleados.Append;
         QEmpleadosSUBCUENTA.AsString := FieldByName('SUBCUENTA').AsString;
         QEmpleadosNOMINA.AsFloat     := FieldByName('NOMINA').AsFloat;
         QEmpleadosIRPF.AsFloat       := FieldByName('IRPF').AsFloat;
         QEmpleadosNETO.AsFloat       := FieldByName('NETO').AsFloat;
         QEmpleadosSSOCIAL.AsFloat    := FieldByName('SSOCIAL').AsFloat;
         if FieldByName('NOMINA_EMPLEADO').IsNull or
            (FieldByName('NOMINA_EMPLEADO').AsString = 'S') then   begin
            QEmpleadosN.AsString := 'S';
         end
         else begin
            QEmpleadosN.AsString := 'N';
         end;
         QEmpleados.Post;

         Next;
      end;

      Close;
      Free;
   end;

   QEmpleados.First;
   QEmpleados.Edit;
end;

procedure TWCargaRapidaNominas.BorrarAsiento(Asiento: Integer);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('DELETE FROM DIARIO WHERE ASIENTO = :ASIENTO');
      ParamByName('ASIENTO').AsInteger := Asiento;
      ExecQuery;
      Transaction.CommitRetaining;
      Close;
      Free;
   end;
end;

procedure TWCargaRapidaNominas.BorrarNominas(Asiento: Integer);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('DELETE FROM NOMINAS WHERE ASIENTO = :ASIENTO');
      ParamByName('ASIENTO').AsInteger := Asiento;
      ExecQuery;
      Transaction.CommitRetaining;
      Close;
      Free;
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtGuardarClick(Sender: TObject);
var
   Msg:      String;
   nAsiento, nAsientoEmpresa, nApunte: Integer;
   SumaNomina, SumaRemuneraciones, SumaIRPF, SumaSS, TotImporte: Double;
   QNominas: TIBSQL;
   HayOtrasRemuneraciones: Boolean;
begin
   Paginas.Pages[0].Show;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Msg contendrá la información a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg := '';

   if QFichero.FieldByName('FECHA').IsNull then   begin
      Msg := Msg + 'No se puede dejar la fecha en blanco.' + #13;
   end
   else
   if not DMContaRef.FechaAsientoPerteneceEjercicio(QFichero.FieldByName('FECHA').AsDateTime) then   begin
      if MessageDlg('La fecha de asiento no pertenece al ejercicio actual.' + #13 +
         '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if Empty(QFichero.FieldByName('SCTANOMSUELDO').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco la subcuenta de sueldos y salarios.' + #13;
   end;
   if Empty(QFichero.FieldByName('SCTANOMSST').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco la subcuenta de seg. social asiento trabajador.' + #13;
   end;
   if Empty(QFichero.FieldByName('SCTANOMIRPF').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco la subcuenta de Hacienda IRPF.' + #13;
   end;
   if Empty(QFichero.FieldByName('SCTANOMCARGO').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco la subcuenta de gastos seg. Social Empresa.' + #13;
   end;
   if Empty(QFichero.FieldByName('SCTANOMSSE').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco la subcuenta de Seg. Social en asiento Empresa.' + #13;
   end;
   if Empty(QFichero.FieldByName('CTONOMT').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco el concepto del asiento del trabajador.' + #13;
   end;
   if Empty(QFichero.FieldByName('CTONOME').AsString) then   begin
      Msg := Msg + 'No se puede dejar en blanco el concepto del asiento de la empresa.' + #13;
   end;

   if QEmpleados.State in dsEditModes then   begin
      QEmpleados.Post;
   end;
   QEmpleados.First;
   if QEmpleados.EOF then  begin
      GridEdtEmpleados.SetFocus;
      Msg := Msg + 'No se ha introducido ninguna subcuenta de nómina.' + #13;
   end;

   // Si los datos especificados no son válidos, presentar mensaje de error.
   if Trim(Msg) <> '' then  begin
      Msg := Msg + 'Por favor, revise los datos de entrada.';
      Paginas.Pages[0].Show;
      eFecha.SetFocus;
      DatabaseError(Msg);
   end;

   if RoundToDecimal(QFichero.FieldByName('IMPEMPRESA').AsFloat, 2, True) = 0 then begin
      if MessageDlg('No se ha indicado el importe del asiento de la empresa.' + #13 +
         'Se generará únicamente el asiento de nómina.' + #13 +
         '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if not DatosEmpleadosValidos then   begin
      Exit;
   end;


   // Asiento de nómina
   if FAsientoNomina = 0 then   begin
      nAsiento := DMContaRef.ObtenerNumeroAsiento;
   end
   else begin
      nAsiento := FAsientoNomina;
   end;

   // Asiento de Empresa
   if RoundToDecimal(QFichero.FieldByName('IMPEMPRESA').AsFloat, 2, True) <> 0 then  begin
      if FAsientoEmpresa = 0 then   begin
         nAsientoEmpresa := DMContaRef.ObtenerNumeroAsiento;
      end
      else begin
         nAsientoEmpresa := FAsientoEmpresa;
      end;
   end
   else begin
      nAsientoEmpresa := 0;
   end;


   // Si estamos en modo modificación, borrar los asientos antes de grabar
   if FModoArranque = MODIFICACION then  begin
      BorrarAsiento(nAsiento);
      BorrarNominas(nAsiento);
      if nAsientoEmpresa <> 0 then   begin
         BorrarAsiento(nAsientoEmpresa);
      end;
   end;

   // Inserción de nóminas
   QNominas := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QNominas, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO NOMINAS (ASIENTO, NOMINA, IRPF, SSOCIAL, NETO, SUBCUENTA, NOMINA_EMPLEADO)');
      Add('VALUES');
      Add('(:ASIENTO, :NOMINA, :IRPF, :SSOCIAL, :NETO, :SUBCUENTA, :NOMINA_EMPLEADO)');
   end;

   // Grabar asientos
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSql.Create(nil), sql do begin
      Close;
      Clear;
      Database := DmRef.IbdSiamcont;
      Add('insert into diario(tipoasiento, asientonomina, asiento,apunte,id_conceptos,');
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
         Add('comentario,');
      end;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
         Add('cuenta_analitica,');
      end;
      Add(' subcuenta,contrapartida,debehaber,fecha,importe,moneda)');
      Add(' values (:tipoasiento, :asientonomina, :asiento,:apunte,:id_conceptos,');
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
         Add(':comentario,');
      end;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
         Add(':CUENTA_ANALITICA,');
      end;
      Add(' :subcuenta,:contrapartida,:debehaber,:fecha,:importe,:moneda)');

      SumaNomina := 0;
      SumaRemuneraciones := 0;
      SumaIRPF   := 0;
      SumaSS     := 0;
      TotImporte := 0;

      HayOtrasRemuneraciones := False;

      QEmpleados.First;
      while not QEmpleados.EOF do begin
         if QEmpleadosN.AsString = 'S' then    // Apunte de nómina
         begin
            SumaNomina := SumaNomina + QEmpleados.FieldByName('NOMINA').AsFloat;
            TotImporte := TotImporte + (QEmpleadosNOMINA.AsFloat -
               QEmpleadosIRPF.AsFloat -
               QEmpleadosSSOCIAL.AsFloat);
         end
         else    // Apunte otras remuneraciones
         begin
            HayOtrasRemuneraciones := True;
            SumaRemuneraciones     := SumaRemuneraciones + QEmpleadosNOMINA.AsFloat;
         end;

         SumaIRPF := SumaIRPF + QEmpleados.FieldByName('IRPF').AsFloat;
         SumaSS   := SumaSS + QEmpleados.FieldByName('SSOCIAL').AsFloat;

         QNominas.Close;
         QNominas.ParamByName('ASIENTO').AsInteger  := nAsiento;
         QNominas.ParamByName('NOMINA').AsDouble    := QEmpleadosNOMINA.AsFloat;
         QNominas.ParamByName('IRPF').AsDouble      := QEmpleadosIRPF.AsFloat;
         QNominas.ParamByName('SSOCIAL').AsDouble   := QEmpleadosSSOCIAL.AsFloat;
         QNominas.ParamByName('NETO').AsDouble      := QEmpleadosNETO.AsFloat;
         QNominas.ParamByName('SUBCUENTA').AsString := QEmpleadosSUBCUENTA.AsString;
         QNominas.ParamByName('NOMINA_EMPLEADO').AsString := QEmpleadosN.AsString;
         QNominas.ExecQuery;
         QNominas.Transaction.CommitRetaining;

         QEmpleados.Next;
      end;
      QEmpleados.First;


      // Apunte 1
      ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
      ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
      parambyname('asiento').AsInteger       := nAsiento;
      parambyname('apunte').AsInteger        := 1;
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
         parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
      end;
      parambyname('debehaber').AsString      := 'D';
      parambyname('subcuenta').AsString      := Qfichero.FieldByName('sctaNomSueldo').AsString;
      parambyname('contrapartida').AsVariant := null;
      parambyname('fecha').AsDateTime        := Qfichero.FieldByName('fecha').AsDateTime;
      parambyname('importe').AsFloat         := SumaNomina;
      parambyname('moneda').AsString         := DmREf.QParametros.FieldByName('Moneda').AsString;
      parambyname('id_conceptos').AsString   := Qfichero.FieldByName('CtoNomT').AsString;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
         parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
      end;
      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 1

      // Apunte 2
      ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
      ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
      parambyname('asiento').AsInteger       := nAsiento;
      parambyname('apunte').AsInteger        := 2;
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
         parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
      end;
      parambyname('debehaber').AsString     := 'H';
      parambyname('subcuenta').AsString     := Qfichero.FieldByName('sctaNomSst').AsString;
      parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomsueldo').AsString;
      parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
      parambyname('importe').AsFloat        := SumaSS;
      parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
      parambyname('id_conceptos').AsString  := Qfichero.FieldByName('CtoNomT').AsString;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
         parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
      end;
      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 2

      // Apunte 3
      ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
      ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
      parambyname('asiento').AsInteger       := nAsiento;
      parambyname('apunte').AsInteger        := 3;
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
         parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
      end;
      parambyname('debehaber').AsString     := 'H';
      parambyname('subcuenta').AsString     := Qfichero.FieldByName('sctaNomIrpf').AsString;
      parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomsueldo').AsString;
      parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
      parambyname('importe').AsFloat        := SumaIRPF;
      parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
      parambyname('id_conceptos').AsString  := Qfichero.FieldByName('CtoNomT').AsString;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
         parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
      end;
      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 3

      // Generar apuntes de nóminas por cada EMPLEADO
      if DMRef.QParametros.FieldByName('ASIENTO_NOMINA_INDIVIDUAL').AsString = 'S' then   begin
         nApunte := 4;
         QEmpleados.First;
         while not QEmpleados.EOF do begin
            // Generar apunte de EMPLEADO
            ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
            ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
            parambyname('asiento').AsInteger       := nAsiento;
            parambyname('apunte').AsInteger        := nApunte;
            if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
               parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
            end;
            parambyname('debehaber').AsString := 'H';
            parambyname('subcuenta').AsString := QEmpleadosSUBCUENTA.AsString;

            if QEmpleadosN.AsString = 'S' then    // Apunte de nómina
            begin
               parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomsueldo').AsString;
            end
            else    // Apunte otras remuneraciones
            begin
               ParamByName('CONTRAPARTIDA').AsString := QFichero.FieldByName('SCTAOTRAS').AsString;
            end;
            parambyname('fecha').AsDateTime      := Qfichero.FieldByName('fecha').AsDateTime;
            parambyname('importe').AsFloat       :=
               QEmpleadosNOMINA.AsFloat - QEmpleadosIRPF.AsFloat -
               QEmpleadosSSOCIAL.AsFloat;
            parambyname('moneda').AsString       := DmREf.QParametros.FieldByName('Moneda').AsString;
            parambyname('id_conceptos').AsString := Qfichero.FieldByName('CtoNomT').AsString;
            if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
               parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
            end;
            ExecQuery;
            Transaction.CommitRetaining;
            Inc(nApunte);

            QEmpleados.Next;
         end;
      end
      // Generar apunte global
      else begin
         // Apunte de pago nóminas
         ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
         ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
         parambyname('asiento').AsInteger       := nAsiento;
         parambyname('apunte').AsInteger        := 4;
         if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
            parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
         end;
         parambyname('debehaber').AsString     := 'H';
         parambyname('subcuenta').AsString     := DMRef.QParametros.FieldByName('SCTANOMPAGO').AsString;
         parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomsueldo').AsString;
         parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
         parambyname('importe').AsFloat        := TotImporte;
         parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
         parambyname('id_conceptos').AsString  := Qfichero.FieldByName('CtoNomT').AsString;
         if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
            parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
         end;
         ExecQuery;
         Transaction.CommitRetaining;

         // Apuntes otras remuneraciones
         nApunte := 5;
         QEmpleados.First;
         while not QEmpleados.EOF do begin
            if QEmpleadosN.AsString = 'N' then   begin
               ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
               ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
               parambyname('asiento').AsInteger       := nAsiento;
               parambyname('apunte').AsInteger        := nApunte;
               if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
                  parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
               end;
               parambyname('debehaber').AsString     := 'H';
               parambyname('subcuenta').AsString     := QEmpleadosSUBCUENTA.AsString;
               parambyname('contrapartida').AsString := QFichero.FieldByName('SCTAOTRAS').AsString;
               parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
               parambyname('importe').AsFloat        :=
                  QEmpleadosNOMINA.AsFloat - QEmpleadosIRPF.AsFloat -
                  QEmpleadosSSOCIAL.AsFloat;
               parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
               parambyname('id_conceptos').AsString  := Qfichero.FieldByName('CtoNomT').AsString;
               if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
                  parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
               end;
               ExecQuery;
               Transaction.CommitRetaining;
            end;
            QEmpleados.Next;
         end;
         QEmpleados.First;
      end;


      if HayOtrasRemuneraciones then   begin
         // Apunte Gasto otras Remuneraciones
         ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_NOMINA;
         ParamByName('ASIENTONOMINA').AsInteger := nAsientoEmpresa;
         parambyname('asiento').AsInteger       := nAsiento;
         parambyname('apunte').AsInteger        := nApunte;
         if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
            parambyname('comentario').AsString := Trim(QFichero.FieldByName('comentario').AsString);
         end;
         parambyname('debehaber').AsString      := 'D';
         parambyname('subcuenta').AsString      := Qfichero.FieldByName('sctaotras').AsString;
         parambyname('contrapartida').AsVariant := null;
         parambyname('fecha').AsDateTime        := Qfichero.FieldByName('fecha').AsDateTime;
         parambyname('importe').AsFloat         := SumaRemuneraciones;
         parambyname('moneda').AsString         := DmREf.QParametros.FieldByName('Moneda').AsString;
         parambyname('id_conceptos').AsString   := Qfichero.FieldByName('CtoNomT').AsString;
         if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
            parambyname('CUENTA_ANALITICA').AsString := Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
         end;
         ExecQuery;
         Transaction.CommitRetaining;
         // Final Apunte remuneraciones
      end;


      // ASIENTO SEG. SOCIAL
      if RoundToDecimal(QFichero.FieldByName('IMPEMPRESA').AsFloat, 2, True) <> 0 then   begin
         // Apunte 1
         ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_SSOCIAL_EMPRESA;
         ParamByName('ASIENTONOMINA').AsInteger := nAsiento;
         parambyname('asiento').AsInteger       := nAsientoEmpresa;
         parambyname('apunte').AsInteger        := 1;
         if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
            parambyname('comentario').AsString :=
               Trim(QFichero.FieldByName('comentario').AsString);
         end;
         parambyname('debehaber').AsString     := 'D';
         parambyname('subcuenta').AsString     := Qfichero.FieldByName('sctaNomCargo').AsString;
         parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomSse').AsString;
         parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
         parambyname('importe').AsFloat        := Qfichero.FieldByName('impempresa').AsFloat;
         parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
         parambyname('id_conceptos').AsString  := Qfichero.FieldByName('ctonome').AsString;
         if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
            parambyname('CUENTA_ANALITICA').AsString :=
               Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
         end;
         ExecQuery;
         Transaction.CommitRetaining;
         // Final Apunte 1

         // Apunte 2
         ParamByName('TIPOASIENTO').AsInteger   := ASIENTO_SSOCIAL_EMPRESA;
         ParamByName('ASIENTONOMINA').AsInteger := nAsiento;
         parambyname('asiento').AsInteger       := nAsientoEmpresa;
         parambyname('apunte').AsInteger        := 2;
         if not empty(QFichero.FieldByName('COMENTARIO').AsString) then   begin
            parambyname('comentario').AsString :=
               Trim(QFichero.FieldByName('comentario').AsString);
         end;
         parambyname('debehaber').AsString     := 'H';
         parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
         parambyname('importe').AsFloat        := Qfichero.FieldByName('impempresa').AsFloat;
         parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
         parambyname('subcuenta').AsString     := Qfichero.FieldByName('sctaNomSse').AsString;
         parambyname('contrapartida').AsString := Qfichero.FieldByName('sctaNomCargo').AsString;
         parambyname('id_conceptos').AsString  := Qfichero.FieldByName('ctonome').AsString;
         if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then   begin
            parambyname('CUENTA_ANALITICA').AsString :=
               Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
         end;
         ExecQuery;
         Transaction.CommitRetaining;
         // Final Apunte 2
      end;

      Close;
      Free;
   end;

   QNominas.Close;
   QNominas.Free;


   // Asientos grabados
   if RoundToDecimal(QFichero.FieldByName('IMPEMPRESA').AsFloat, 2, True) = 0 then   begin
      MessageDlg('Se ha grabado el asiento ' + FormatFloat('###,###,###', nAsiento), mtInformation, [mbOK], 0);
   end
   else begin
      MessageDlg('Se ha grabado el asiento ' + FormatFloat('###,###,###', nAsiento) + ' y el ' + FormatFloat('###,###,###', nAsientoEmpresa), mtInformation, [mbOK], 0);
   end;


   // Si estamos en modo inserción, inicializar controles para un nuevo asiento.
   if FModoArranque = INSERCION then  begin
      Modo(Self, Edita);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         Edit;
         FieldByName('SCTANOMSUELDO').AsString    := DmRef.QParametros.FieldByName('SctaNomsueldo').AsString;
         FieldByName('SCTAOTRAS').AsString        := DmRef.QParametros.FieldByName('SctaOtrasRemun').AsString;
         FieldByName('SCTANOMSST').AsString       := DmRef.QParametros.FieldByName('SctaNomSSt').AsString;
         FieldByName('SCTANOMIRPF').AsString      := DmRef.QParametros.FieldByName('SctaNomIrpf').AsString;
         FieldByName('CTONOMT').AsString          := DmRef.QParametros.FieldByName('CtoNomt').AsString;
         FieldByName('SCTANOMCARGO').AsString     := DmRef.QParametros.FieldByName('SctaNomCargo').AsString;
         FieldByName('SCTANOMSSE').AsString       := DmRef.QParametros.FieldByName('SctaNomsse').AsString;
         QFichero.FieldByName('CTONOME').AsString := DmRef.QParametros.FieldByName('CtoNomE').AsString;
         Post;
      end;

      InicializarFichero_QEmpleados;

      PrepararQuery;
   end
   else begin
      Close;
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtBorrarMovimClick(Sender: TObject);
begin
   if not QMovimientos.IsEmpty then begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede borrar un asiento bloqueado.');
      end;

      if MessageDlg('¿Desea borrar el asiento ' + FormatFloat('###,###,###', QMovimientos.FieldByName('ASIENTO').AsInteger) +
         ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSql.Create(nil), sql do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            add('delete from diario where asiento=:asiento');
            parambyname('asiento').AsInteger := QMovimientos.FieldByName('asiento').AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;
            Close;
            Free;
         end;
         PrepararQuery;
      end;
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaNominas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then begin
      //Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then  begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWCargaRapidaNominas.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   InicializarModoArranque;

   Paginas.Pages[0].Show;
   eFecha.SetFocus;
end;

procedure TWCargaRapidaNominas.FormCreate(Sender: TObject);
var
   Pos1: Integer;
begin
   ActivarTransacciones(Self);

   Paginas.Height := 441;
   Paginas.Width  := 742;

   CrearFichero;

   PrepararQuery;

   // Configurar grid
   ConfigurarGridEmpleados;

   // Longitud subcuentas
   eSubcuenta.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;

   eSubctaSueldosSalarios.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eSubctaOtras.MaxLength     := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eSubctaSS.MaxLength        := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eSubctaIRPF.MaxLength      := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eSubctaGastoSSEmpresa.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;
   eSubctaSSEmpresa.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;

   // Búsqueda subcuenta
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then  begin
      eSubcuenta.TabStop := False;

      Pos1 := eSubctaSueldosSalarios.Left;
      eDescSubctaSueldosSalarios.Left := Pos1;
      eDescSubctaSS.Left := Pos1;
      eDescSubctaGastoSSEmpresa.Left := Pos1;
      eDescSubctaSSEmpresa.Left := Pos1;

      eSubctaSueldosSalarios.Left := eSubctaSueldosSalarios.Left + eDescSubctaSueldosSalarios.Width;
      eSubctaSS.Left        := eSubctaSS.Left + eDescSubctaSueldosSalarios.Width;
      eSubctaGastoSSEmpresa.Left := eSubctaGastoSSEmpresa.Left + eDescSubctaSueldosSalarios.Width;
      eSubctaSSEmpresa.Left := eSubctaSSEmpresa.Left + eDescSubctaSueldosSalarios.Width;

      eSubctaSueldosSalarios.TabStop := False;
      eSubctaSS.TabStop        := False;
      eSubctaGastoSSEmpresa.TabStop := False;
      eSubctaSSEmpresa.TabStop := False;

      Pos1 := eSubctaIRPF.Left;
      eDescSubctaIRPF.Left := Pos1;
      eDescSubctaOtras.Left := Pos1;
      eSubctaIRPF.Left := eSubctaIRPF.Left + eDescSubctaIRPF.Width;
      eSubctaOtras.Left := eSubctaOtras.Left + eDescSubctaOtras.Width;
      eSubctaIRPF.TabStop := False;
      eSubctaOtras.TabStop := False;
   end;
end;

procedure TWCargaRapidaNominas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtGuardar.Click;
      end;
      VK_F5: begin
         if (ActiveControl is TwwDBLookupCombo) then   begin
            (ActiveControl as TwwDBLookupCombo).DropDown;
         end
         else
         if (ActiveControl is TwwDBComboBox) then   begin
            (ActiveControl as TwwDBComboBox).DropDown;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBDateTimePicker) and
            not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then   begin
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
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBComboBox) then   begin
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

procedure TWCargaRapidaNominas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario          := nil;
   WCargaRapidaNominas := nil;
end;

procedure TWCargaRapidaNominas.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCargaRapidaNominas.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCargaRapidaNominas.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
         DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString,
                                         QMovimientosNUMEROFACTURA.AsString,
                                         QMovimientosSERIE.AsString,
                                         QMovimientosEJERCICIO.AsInteger,
                                         QMovimientosCOMENTARIO.AsString,
                                         QMovimientosABREVIATURA.AsString);
end;

procedure TWCargaRapidaNominas.BtnEdtSalirClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);
   if (QFichero.Modified) and (MessageDlg('Ha hecho modificaciones. ¿Quiere salir?',
               mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
   Close;
end;

procedure TWCargaRapidaNominas.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then   begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;
   WNuevaSubcuenta.ShowModal;
   WNuevaSubcuenta := nil;
   Paginas.Update;
end;

procedure TWCargaRapidaNominas.GridEdtEmpleadosCellChanged(Sender: TObject);
begin
   if QEmpleados.State in dsEditModes then   begin
      QEmpleados.OnCalcFields(nil);
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtRestablecerClick(Sender: TObject);
begin
   if MessageDlg('¿Desea inicializar el asiento de nóminas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QFichero do begin
         Edit;
         FieldByName('SCTANOMSUELDO').AsString    := DmRef.QParametros.FieldByName('SctaNomsueldo').AsString;
         FieldByName('SCTAOTRAS').AsString        := DmRef.QParametros.FieldByName('SctaOtrasRenum').AsString;
         FieldByName('SCTANOMSST').AsString       := DmRef.QParametros.FieldByName('SctaNomSSt').AsString;
         FieldByName('SCTANOMIRPF').AsString      := DmRef.QParametros.FieldByName('SctaNomIrpf').AsString;
         FieldByName('CTONOMT').AsString          := DmRef.QParametros.FieldByName('CtoNomt').AsString;
         FieldByName('SCTANOMCARGO').AsString     := DmRef.QParametros.FieldByName('SctaNomCargo').AsString;
         FieldByName('SCTANOMSSE').AsString       := DmRef.QParametros.FieldByName('SctaNomsse').AsString;
         QFichero.FieldByName('CTONOME').AsString := DmRef.QParametros.FieldByName('CtoNomE').AsString;
         Post;
      end;

      InicializarFichero_QEmpleados;
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtBorrarEmpleadoClick(Sender: TObject);
begin
   if not QEmpleados.IsEmpty then   begin
      if MessageDlg('¿Desea borrar la nómina seleccionada?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         QEmpleados.Delete;
      end;
   end;
end;

procedure TWCargaRapidaNominas.QEmpleadosCalcFields(DataSet: TDataSet);
begin
   QEmpleadosNETO.AsFloat := RoundToDecimal(QEmpleadosNOMINA.AsFloat -
      QEmpleadosIRPF.AsFloat - QEmpleadosSSOCIAL.AsFloat, 2, True);
end;

procedure TWCargaRapidaNominas.BtnEdtAniadirClick(Sender: TObject);
begin
   QEmpleados.Append;
end;

procedure TWCargaRapidaNominas.GridEdtEmpleadosKeyPress(Sender: TObject; var Key: Char);
begin
   if (GridEdtEmpleados.SelectedField.FieldName = 'NOMINA') or
      (GridEdtEmpleados.SelectedField.FieldName = 'IRPF') or
      (GridEdtEmpleados.SelectedField.FieldName = 'SSOCIAL') or
      (GridEdtEmpleados.SelectedField.FieldName = 'NETO') then   begin
      if (key = '.') then begin
         key := ',';
      end;
   end;
end;

procedure TWCargaRapidaNominas.BtnEdtModificarClick(Sender: TObject);
var
   Asiento: Integer;
begin
   if not QMovimientos.IsEmpty then  begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      if not Assigned(WCargaAsiento) then   begin
         WCargaAsiento := TWCargaAsiento.Create(nil);
      end;

      WCargaAsiento.FModoArranque := Modificacion;
      Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;
      WCargaAsiento.FAsiento := Asiento;
      WCargaAsiento.ShowModal;

      PrepararQuery;

      QMovimientos.DisableControls;
      QMovimientos.First;
      while not QMovimientos.EOF do begin
         if QMovimientos.FieldByName('ASIENTO').AsInteger = Asiento then   begin
            Break;
         end;
         QMovimientos.Next;
      end;
      QMovimientos.EnableControls;
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaNominas.BtnEdtMayorClick(Sender: TObject);
begin
   if DMRef.QParametros.FieldByName('MOSTRAR_FILTRO_MAYOR').AsString = 'S' then  begin
      if not Assigned(WFiltroMayorSubcuenta) then   begin
         WFiltroMayorSubcuenta := TWFiltroMayorSubcuenta.Create(nil);
      end;
      WFiltroMayorSubcuenta.FSubcuenta := QMovimientosSUBCUENTA.AsString;
      WFiltroMayorSubcuenta.ShowModal;
      WFiltroMayorSubcuenta := nil;
   end
   else begin
      // Primero vaciar el fichero
      DMContaRef.QInformesConta.EmptyDataset;

      PonerTipoConta('T');

      LanzarInfMayor(True, False,
         QMovimientosSUBCUENTA.AsString, QMovimientosSUBCUENTA.AsString,
         '', '', DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime,
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime, Date, 'T',
         '', '', '', '', '', '', DMRef.QParametros.FieldByName('MONEDA').AsString, '', '');
   end;

   Paginas.Update;
end;

procedure TWCargaRapidaNominas.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCargaRapidaNominas.eSubcuentaNotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then   begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                       ' caracteres.', mtInformation, [mbOK], 0);
         eSubcuenta.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta no existente. ¿Quiere añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (QEmpleados.State in dsEditModes) then   begin
               QEmpleados.Edit;
            end;
            QEmpleados.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eSubcuenta.SetFocus;
   end;
end;

procedure TWCargaRapidaNominas.GridEdtMovimientosMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FAsientoAnterior := QMovimientosASIENTO.AsInteger;
   GridEdtMovimientos.Refresh;
end;

procedure TWCargaRapidaNominas.GridEdtMovimientosCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if QMovimientosASIENTO.AsInteger <> FAsientoAnterior then  begin
      FAsientoAnterior := QMovimientosASIENTO.AsInteger;
      if FColorActual = COLOR_ASIENTO1 then   begin
         FColorActual := COLOR_ASIENTO2;
      end
      else begin
         FColorActual := COLOR_ASIENTO1;
      end;
   end;
   if State * [gdFixed, gdSelected] = [] then   begin
      ABrush.Color := FColorActual;
   end;
end;

end.
