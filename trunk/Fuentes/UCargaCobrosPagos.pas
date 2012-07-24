unit UCargaCobrosPagos;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcShapeBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSQL,
     IBTableSet, jpeg, Mask, Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNbk, OvcNF,
     OvcPB, OvcPF, StdCtrls, SysUtils, variants, WinProcs, WinTypes, wwclearpanel, Wwdatsrc,
     Wwdbcomb, wwdbdatetimepicker, Wwdbdlg, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, wwDBNavigator, Wwdbspin,
     Wwdotdot, Wwkeycb, wwSpeedButton, Wwtable, CustomView;
type
   TWCargaCobrosPagos = class(TCustomView)
      OvcController1:  TOvcController;
      Shape1:          TShape;
      lTitulo:         TLabel;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtGuardar:   TfcImageBtn;
      BtnEdtSalir:     TfcImageBtn;
      Paginas:         TOvcNotebook;
      GridEdtMovimientos: TwwDBGrid;
      Transaccion:     TIBTransaction;
      QMovimientos:    TIBTableSet;
      SMovimientos:    TDataSource;
      Label5:          TLabel;
      DBText1:         TDBText;
      QMovimientosASIENTO: TIntegerField;
      QMovimientosAPUNTE: TSmallintField;
      QMovimientosFECHA: TDateTimeField;
      QMovimientosSUBCUENTA: TIBStringField;
      QMovimientosID_CONCEPTOS: TIBStringField;
      QMovimientosDEBEHABER: TIBStringField;
      QMovimientosCONTRAPARTIDA: TIBStringField;
      QMovimientosCOMENTARIO: TIBStringField;
      QMovimientosNUMEROFACTURA: TIBStringField;
      QMovimientosCUENTA_ANALITICA: TIBStringField;
      QMovimientosDESCCONCEPTO: TIBStringField;
      QMovimientosDESCSUBCUENTA: TIBStringField;
      QMovimientosIMPORTE: TFloatField;
      QMovimientosDescComentario: TStringField;
      BtnEdtSubcuenta: TfcImageBtn;
      GroupBox1:       TGroupBox;
      LbSubcuenta:     TLabel;
      LbCtoSubcuenta:  TLabel;
      eConceptoDfto:   TwwDBLookupCombo;
      eSubcuentaBanco: TwwDBLookupCombo;
      eSubcuentaBancoDesc: TwwDBLookupCombo;
      eConceptoDftoDesc: TwwDBLookupCombo;
      Datos:           TGroupBox;
      GridEdtCobrosPagos: TwwDBGrid;
      SCobrosPagos:    TwwDataSource;
      QCobrosPagos:    TClientDataSet;
      PermAniadir:     TfcShapeBtn;
      PermBorrar:      TfcShapeBtn;
      QCobrosPagosFECHA: TDateTimeField;
      QCobrosPagosSUBCUENTA: TStringField;
      QCobrosPagosSUBCUENTADESC: TStringField;
      QCobrosPagosIMPORTE: TFloatField;
      QCobrosPagosDESCCONCEPTO: TStringField;
      QCobrosPagosID_DIARIO: TIntegerField;
      QCobrosPagosID_CARTERAEFECTOS: TIntegerField;
      QFichero:        TClientDataSet;
      QFicheroSUBCUENTABANCO: TStringField;
      QFicheroID_CONCEPTOS_DFTO: TVarBytesField;
      SFichero:        TwwDataSource;
      QDiario:         TIBSQL;
      oGenerarUnicoAsiento: TCheckBox;
      QCobrosPagosNUMEROFACTURA: TStringField;
      QCobrosPagosCUENTA_ANALITICA: TStringField;
      PermBqdaDiario:  TfcShapeBtn;
      PermBqdaCartera: TfcShapeBtn;
      QCobrosPagosSITUACION: TStringField;
      QCobrosPagosASIENTO_GENERADO: TIntegerField;
      BtnEdtModificar: TfcImageBtn;
      BtnEdtBorrarMovim: TfcImageBtn;
      GroupBox2:       TGroupBox;
      Label1:          TLabel;
      Label7:          TLabel;
      Label4:          TLabel;
      lSubcuenta:      TLabel;
      Label17:         TLabel;
      eDescSubcuentaCBDESCSUBCUENTA: TwwDBLookupCombo;
      eComentario:     TOvcDbPictureField;
      eConceptoAsientoDesc: TwwDBLookupCombo;
      eImporte:        TOvcDbNumericField;
      eSubcuentaCBSUBCUENTA: TwwDBLookupCombo;
      eConceptoAsiento: TwwDBLookupCombo;
      eAnaliticaNom:   TwwDBLookupCombo;
      eAnalitica:      TwwDBLookupCombo;
      eFecha:          TwwDBDateTimePicker;
      Label2:          TLabel;
      QCobrosPagosCOMENTARIO: TStringField;
      QCobrosPagosID_CONCEPTOS: TVarBytesField;
      eFactura:        TOvcDbPictureField;
      Label16:         TLabel;
      BtnEdtMayor:     TfcImageBtn;
      QCobrosPagosDEBEHABER: TStringField;
      Label6:          TLabel;
      eDebeHaber:      TOvcDbPictureField;
      QMovimientosABREVIATURA: TIBStringField;
      QCobrosPagosIMPORTE_PUNTEO: TFloatField;
      PermMayor:       TfcShapeBtn;
      QMovimientosTIPOASIENTO: TIntegerField;
      QMovimientosASIENTONOMINA: TIntegerField;
      gTotalImporte:   TGroupBox;
      eTotalImporte:   TOvcNumericField;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      QMovimientosEJERCICIO: TIntegerField;
      QMovimientosSERIE: TIBStringField;
      procedure BtnEdtGuardarClick(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure BtnEdtBorrarMovimClick(Sender: TObject);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure PermBorrarClick(Sender: TObject);
      procedure PermAniadirClick(Sender: TObject);
      procedure QCobrosPagosNewRecord(DataSet: TDataSet);
      procedure PermBqdaDiarioClick(Sender: TObject);
      procedure PermBqdaCarteraClick(Sender: TObject);
      procedure BtnEdtModificarClick(Sender: TObject);
      procedure QCobrosPagosCalcFields(DataSet: TDataSet);
      procedure BtnEdtMayorClick(Sender: TObject);
      procedure eSubcuentaCBSUBCUENTACloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      procedure ImporteClick(Sender: TObject);
      procedure PermMayorClick(Sender: TObject);
      procedure eSubcuentaBancoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure eSubcuentaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure QCobrosPagosAfterPost(DataSet: TDataSet);
      procedure oGenerarUnicoAsientoClick(Sender: TObject);
      procedure eDebeHaberExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FColorActual:     TColor;
      FAsientoAnterior: Integer;

      procedure ActualizarCarteraEfectos(ID_Cartera: Integer);
      procedure ComprobarAsientosCobroPago(var OK: Boolean);
      procedure ConfigurarGridCobrosPagos;
      procedure CrearFicheros;
      procedure GenerarAsientosCobroPago;
      procedure PrepararQueryDiario;
      procedure PrepararQueryMovimientos;
      procedure PuntearApunte(ID_Diario: Integer);
      procedure CalcularTotalImporte;
   public
      FID_Diario, FID_Cartera: Integer;
      FSituacion: String;
   end;

var WCargaCobrosPagos: TWCargaCobrosPagos;
implementation
uses Cadenas, DM, DMConta, General, Globales, InfMayor, letras, UCargaAsiento,
     UCargaRapidaNominas, UCarteraEfectos, UDiario, UFiltroMayorSubcuenta, UNuevaSubcuenta, MenuPrincipal;
{$R *.DFM}

procedure TWCargaCobrosPagos.ActualizarCarteraEfectos(ID_Cartera: Integer);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database := DMRef.IBDSiamCont;
      Close;
      Clear;
      Add('UPDATE CARTERAEFECTOS SET');
      Add('   FASIENTO = :FASIENTO,');
      Add('   SUBCTABANCO = :SUBCTABANCO,');
      Add('   SITUACION = :SITUACION');
      Add('WHERE');
      Add('   ID_CARTERAEFECTOS = :ID_CARTERAEFECTOS');

      ParamByName('ID_CARTERAEFECTOS').AsInteger := ID_Cartera;
      ParamByName('FASIENTO').AsDateTime         := QCobrosPagosFECHA.AsDateTime;
      ParamByName('SUBCTABANCO').AsString        := QFicheroSUBCUENTABANCO.AsString;
      ParamByName('SITUACION').AsString          := QCobrosPagosSITUACION.AsString;
      ExecQuery;
      Close;
      Free;
   end;
end;

procedure TWCargaCobrosPagos.ComprobarAsientosCobroPago(var OK: Boolean);
var
   Msg: String;
begin
   OK := True;

   // Msg contendrá la información a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg := '';

   if QCobrosPagos.State in dsEditModes then   begin
      QCobrosPagos.Post;
   end;

   QCobrosPagos.DisableControls;
   QCobrosPagos.First;

   while not QCobrosPagos.EOF do begin
      if QCobrosPagosFECHA.IsNull then   begin
         Msg := Msg + 'La fecha del asiento no puede estar en blanco.' + #13;
      end
      else
      if not DMContaRef.FechaAsientoPerteneceEjercicio(QCobrosPagosFECHA.AsDateTime) then   begin
         if  MessageDlg('La fecha de asiento no pertenece al ejercicio actual.' + #13 +
                        '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
            OK := False;
            Exit;
         end;
      end;

      if QCobrosPagosID_CONCEPTOS.AsString = '' then   begin
         Msg := Msg + 'El concepto no puede estar en blanco.' + #13;
      end;
      if QCobrosPagosSUBCUENTA.AsString = '' then   begin
         Msg := Msg + 'La subcuenta no puede estar vacía.' + #13;
      end;

      // Si los datos especificados no son válidos, presentar mensaje de error.
      if Trim(Msg) <> '' then   begin
         QCobrosPagos.EnableControls;
         GridEdtCobrosPagos.SetFocus;
         OK := False;
         DatabaseError(Msg);
      end;

      QCobrosPagos.Next;
   end;

   QCobrosPagos.First;
   QCobrosPagos.EnableControls;
end;

procedure TWCargaCobrosPagos.ConfigurarGridCobrosPagos;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with GridEdtCobrosPagos do begin
      Selected.Clear;
      Selected.Add('FECHA' + #9 + '12' + #9 + 'FECHA');
      Selected.Add('DESCCONCEPTO' + #9 + '30' + #9 + 'DESCRIPCIÓN CONCEPTO');
      Selected.Add('SUBCUENTA' + #9 + '15' + #9 + 'SUBCUENTA');
      Selected.Add('SUBCUENTADESC' + #9 + '35' + #9 + 'DESCRIPCIÓN SUBCUENTA');
      Selected.Add('IMPORTE' + #9 + '14' + #9 + 'IMPORTE');

      ApplySelected;

      Fields[0].Alignment := taCenter;          // FECHA
      Fields[1].Alignment := taLeftJustify;     // DESCCONCEPTO
      Fields[2].Alignment := taRightJustify;    // SUBCUENTA
      Fields[3].Alignment := taLeftJustify;     // SUBCUENTADESC
      Fields[4].Alignment := taRightJustify;    // IMPORTE
   end;
end;

procedure TWCargaCobrosPagos.CrearFicheros;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SUBCUENTABANCO', ftString, 10, False);
         Add('ID_CONCEPTOS_DFTO', ftVarBytes, 3, False);
      end;
      CreateDataset;
      Open;
      append;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCobrosPagos do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('FECHA', ftDateTime, 0, False);
         Add('ID_CONCEPTOS', ftVarBytes, 3, False);
         Add('SUBCUENTA', ftString, 10, False);
         Add('SUBCUENTADESC', ftString, 80, False);
         Add('IMPORTE', ftFloat, 0, False);
         Add('DESCCONCEPTO', ftString, 30, False);
         Add('ID_DIARIO', ftInteger, 0, False);
         Add('ID_CARTERAEFECTOS', ftInteger, 0, False);
         Add('NUMEROFACTURA', ftString, 10, False);
         Add('CUENTA_ANALITICA', ftString, 10, False);
         Add('SITUACION', ftString, 1, False);
         Add('ASIENTO_GENERADO', ftInteger, 0, False);
         Add('COMENTARIO', ftString, 40, False);
         Add('DEBEHABER', ftString, 1, False);
         Add('IMPORTE_PUNTEO', ftFloat, 0, False);
      end;
      CreateDataset;
      Open;
   end;
end;

procedure TWCargaCobrosPagos.GenerarAsientosCobroPago;
var
   Asiento, Apunte: Integer;
   Importe:         Double;
   Puntear:         Boolean;
   Fecha:           TDateTime;
begin
   Asiento := 0;
   Apunte  := 0;
   Importe := 0;
   Fecha   := Date;

   QCobrosPagos.DisableControls;

   if not QCobrosPagos.IsEmpty and oGenerarUnicoAsiento.Checked then  begin
      Asiento := DMContaRef.ObtenerNumeroAsiento;
      Fecha   := QCobrosPagosFECHA.AsDateTime;
      Apunte  := 1;   // dejar libre el apunte 1 para generarlo al final
   end;

   QCobrosPagos.First;

   while not QCobrosPagos.EOF do begin
      if (QCobrosPagosID_DIARIO.AsInteger <> 0) and (QCobrosPagosNUMEROFACTURA.AsString <> '') and
         ((DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'P') or
         (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'C') or
         (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'A')) then   begin
         Puntear := (RoundToDecimal(QCobrosPagosIMPORTE_PUNTEO.AsFloat, 2, True) =
            RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True));
      end
      else begin
         Puntear := False;
      end;

      if Puntear then   begin
         PuntearApunte(QCobrosPagosID_DIARIO.AsInteger);
      end;

      if QCobrosPagosID_CARTERAEFECTOS.AsInteger <> 0 then   begin
         ActualizarCarteraEfectos(QCobrosPagosID_CARTERAEFECTOS.AsInteger);
      end;


      // Generar un asiento por cada registro
      if not oGenerarUnicoAsiento.Checked then   begin
         Asiento := DMContaRef.ObtenerNumeroAsiento;

         // Apunte 1
         QDiario.Close;
         QDiario.ParamByName('ASIENTO').AsInteger := Asiento;
         QDiario.ParamByName('APUNTE').AsInteger  := 1;

         QDiario.ParamByName('DEBEHABER').AsString := QCobrosPagosDEBEHABER.AsString;

         QDiario.ParamByName('SUBCUENTA').AsString     := QCobrosPagosSUBCUENTA.AsString;
         QDiario.ParamByName('CONTRAPARTIDA').AsString := QFicheroSUBCUENTABANCO.AsString;
         QDiario.ParamByName('FECHA').AsDateTime       := QCobrosPagosFECHA.AsDateTime;
         QDiario.ParamByName('IMPORTE').AsFloat        :=
            RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True);
         QDiario.ParamByName('MONEDA').AsString        :=
            DMRef.QParametros.FieldByName('MONEDA').AsString;
         QDiario.ParamByName('ID_CONCEPTOS').AsString  := QCobrosPagosID_CONCEPTOS.AsString;
         if QCobrosPagosCUENTA_ANALITICA.IsNull then   begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := null;
         end
         else begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := QCobrosPagosCUENTA_ANALITICA.AsVariant;
         end;
         QDiario.ParamByname('COMENTARIO').AsString    := QCobrosPagosCOMENTARIO.AsString;
         QDiario.ParamByName('NUMEROFACTURA').AsString := QCobrosPagosNUMEROFACTURA.AsString;

         if Puntear then   begin
            QDiario.ParamByName('PUNTEO').AsString := 'S';
         end
         else begin
            QDiario.ParamByName('PUNTEO').AsString := 'N';
         end;

         QDiario.ExecQuery;
         QDiario.Transaction.CommitRetaining;

         // Apunte 2
         QDiario.Close;
         QDiario.ParamByName('ASIENTO').AsInteger := Asiento;
         QDiario.ParamByName('APUNTE').AsInteger  := 2;

         if QCobrosPagosDEBEHABER.AsString = 'D' then   begin
            QDiario.ParamByName('DEBEHABER').AsString := 'H';
         end
         else begin
            QDiario.ParamByName('DEBEHABER').AsString := 'D';
         end;

         QDiario.ParamByName('SUBCUENTA').AsString     := QFicheroSUBCUENTABANCO.AsString;
         QDiario.ParamByName('CONTRAPARTIDA').AsString := QCobrosPagosSUBCUENTA.AsString;
         QDiario.ParamByName('FECHA').AsDateTime       := QCobrosPagosFECHA.AsDateTime;
         QDiario.ParamByName('IMPORTE').AsFloat        :=
            RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True);
         QDiario.ParamByName('MONEDA').AsString        :=
            DMRef.QParametros.FieldByName('MONEDA').AsString;
         QDiario.ParamByName('NUMEROFACTURA').AsString := QCobrosPagosNUMEROFACTURA.AsString;

         QDiario.ParamByName('PUNTEO').AsString := 'N';

         QDiario.ParamByName('ID_CONCEPTOS').AsString := QCobrosPagosID_CONCEPTOS.AsString;
         if QCobrosPagosCUENTA_ANALITICA.IsNull then   begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := null;
         end
         else begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := QCobrosPagosCUENTA_ANALITICA.AsVariant;
         end;
         QDiario.ParamByname('COMENTARIO').AsString := QCobrosPagosCOMENTARIO.AsString;
         QDiario.ExecQuery;
         QDiario.Transaction.CommitRetaining;
      end     // if not oGenerarUnicoAsiento.Checked then


      // Generar un único asiento de cobro / pago
      else begin
         Inc(Apunte);
         QDiario.Close;
         QDiario.ParamByName('ASIENTO').AsInteger := Asiento;
         QDiario.ParamByName('APUNTE').AsInteger  := Apunte;

         QDiario.ParamByName('DEBEHABER').AsString := QCobrosPagosDEBEHABER.AsString;
         if QCobrosPagosDEBEHABER.AsString = 'D' then   begin
            Importe := Importe + RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True);
         end
         else begin
            Importe := Importe - RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True);
         end;

         QDiario.ParamByName('SUBCUENTA').AsString     := QCobrosPagosSUBCUENTA.AsString;
         QDiario.ParamByName('CONTRAPARTIDA').AsString := QFicheroSUBCUENTABANCO.AsString;
         QDiario.ParamByName('FECHA').AsDateTime       := Fecha;
         // Tomar la fecha de la primera línea del grid
         QDiario.ParamByName('IMPORTE').AsFloat        :=
            RoundToDecimal(QCobrosPagosIMPORTE.AsFloat, 2, True);
         QDiario.ParamByName('MONEDA').AsString        :=
            DMRef.QParametros.FieldByName('MONEDA').AsString;
         QDiario.ParamByName('NUMEROFACTURA').AsString := QCobrosPagosNUMEROFACTURA.AsString;

         if Puntear then   begin
            QDiario.ParamByName('PUNTEO').AsString := 'S';
         end
         else begin
            QDiario.ParamByName('PUNTEO').AsString := 'N';
         end;

         QDiario.ParamByName('ID_CONCEPTOS').AsString := QCobrosPagosID_CONCEPTOS.AsString;
         if QCobrosPagosCUENTA_ANALITICA.IsNull then   begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := null;
         end
         else begin
            QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := QCobrosPagosCUENTA_ANALITICA.AsVariant;
         end;
         QDiario.ParamByname('COMENTARIO').AsString := QCobrosPagosCOMENTARIO.AsString;
         QDiario.ExecQuery;
         QDiario.Transaction.CommitRetaining;
      end;

      if not (QCobrosPagos.State in dsEditModes) then   begin
         QCobrosPagos.Edit;
      end;
      QCobrosPagosASIENTO_GENERADO.AsInteger := Asiento;
      QCobrosPagos.Post;
      QCobrosPagos.Next;
   end;

   QCobrosPagos.First;
   QCobrosPagos.EnableControls;

   if not QCobrosPagos.IsEmpty and oGenerarUnicoAsiento.Checked then  begin
      QDiario.Close;
      QDiario.ParamByName('ASIENTO').AsInteger := Asiento;
      QDiario.ParamByName('APUNTE').AsInteger  := 1;

      if Importe > 0 then   begin
         QDiario.ParamByName('DEBEHABER').AsString := 'H';
      end
      else begin
         QDiario.ParamByName('DEBEHABER').AsString := 'D';
      end;

      QDiario.ParamByName('SUBCUENTA').AsString      := QFicheroSUBCUENTABANCO.AsString;
      QDiario.ParamByName('CONTRAPARTIDA').AsVariant := null;
      QDiario.ParamByName('FECHA').AsDateTime        := Fecha;
      // Tomar la fecha de la primera línea del grid
      QDiario.ParamByName('IMPORTE').AsFloat         := Abs(Importe);
      QDiario.ParamByName('MONEDA').AsString         :=
         DMRef.QParametros.FieldByName('MONEDA').AsString;
      QDiario.ParamByName('NUMEROFACTURA').AsVariant := null;
      QDiario.ParamByName('PUNTEO').AsString         := 'N';
      QDiario.ParamByName('ID_CONCEPTOS').AsString   := QCobrosPagosID_CONCEPTOS.AsString;
      if QCobrosPagosCUENTA_ANALITICA.IsNull then   begin
         QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := null;
      end
      else begin
         QDiario.ParamByName('CUENTA_ANALITICA').AsVariant := QCobrosPagosCUENTA_ANALITICA.AsVariant;
      end;
      QDiario.ParamByname('COMENTARIO').AsString := QCobrosPagosCOMENTARIO.AsString;
      QDiario.ExecQuery;
      QDiario.Transaction.CommitRetaining;
   end;
end;

procedure TWCargaCobrosPagos.PrepararQueryDiario;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO DIARIO                                           ');
      Add('(ASIENTO, APUNTE, CONTRAPARTIDA, DEBEHABER, FECHA,           ');
      Add(' IMPORTE, MONEDA, NUMEROFACTURA, SUBCUENTA, PUNTEO,          ');
      Add(' ID_CONCEPTOS, CUENTA_ANALITICA, COMENTARIO)                 ');
      Add('VALUES                                                       ');
      Add('(:ASIENTO, :APUNTE, :CONTRAPARTIDA, :DEBEHABER, :FECHA,      ');
      Add(' :IMPORTE, :MONEDA, :NUMEROFACTURA, :SUBCUENTA, :PUNTEO,     ');
      Add(' :ID_CONCEPTOS, :CUENTA_ANALITICA, :COMENTARIO)              ');
   end;
end;

procedure TWCargaCobrosPagos.PrepararQueryMovimientos;
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
      Add('   C.DESCRIPCION DESCCONCEPTO, S.DESCRIPCION DESCSUBCUENTA,D.IMPORTE, S.ABREVIATURA,');
      Add('   D.TIPOASIENTO, D.ASIENTONOMINA');
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

procedure TWCargaCobrosPagos.PuntearApunte(ID_Diario: Integer);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database := DMRef.IBDSiamCont;
      Close;
      Clear;
      Add('UPDATE DIARIO SET PUNTEO = "S"');
      Add('WHERE');
      Add('   ID_DIARIO = :ID_DIARIO AND');
      Add('   NUMEROFACTURA = :NUMEROFACTURA');
      ParamByName('ID_DIARIO').AsInteger    := ID_Diario;
      ParamByName('NUMEROFACTURA').AsString := QCobrosPagosNUMEROFACTURA.AsString;
      ExecQuery;
      Close;
      Free;
   end;
end;

procedure TWCargaCobrosPagos.CalcularTotalImporte;
var
   Marca: TBookMarkStr;
begin
   if oGenerarUnicoAsiento.Checked then  begin
      if QCobrosPagos.State in dsEditModes then   begin
         QCobrosPagos.Post;
      end;

      Marca := QCobrosPagos.BookMark;

      QCobrosPagos.DisableControls;
      QCobrosPagos.First;
      eTotalImporte.AsFloat := 0;
      while not QCobrosPagos.EOF do begin
         if QCobrosPagosDEBEHABER.AsString = 'D' then   begin
            eTotalImporte.AsFloat := eTotalImporte.AsFloat + QCobrosPagosIMPORTE.AsFloat;
         end
         else
         if QCobrosPagosDEBEHABER.AsString = 'H' then   begin
            eTotalImporte.AsFloat := eTotalImporte.AsFloat - QCobrosPagosIMPORTE.AsFloat;
         end;
         QCobrosPagos.Next;
      end;

      QCobrosPagos.BookMark := Marca;

      QCobrosPagos.EnableControls;
   end
   else begin
      eTotalImporte.AsFloat := 0;
   end;
end;

procedure TWCargaCobrosPagos.BtnEdtGuardarClick(Sender: TObject);
var
   Msg: String;
   OK:  Boolean;
begin
   Paginas.Pages[0].Show;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Comprobar subcuenta de banco / caja
   if QFicheroSUBCUENTABANCO.AsString = '' then  begin
      if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
         eSubcuentaBancoDesc.SetFocus;
      end
      else begin
         eSubcuentaBanco.SetFocus;
      end;
      DatabaseError('No puede dejar la subcuenta de banco / caja en blanco.');
   end;

   // Comprobar asientos de cobro / pago
   if QCobrosPagos.IsEmpty then  begin
      GridEdtCobrosPagos.SetFocus;
      DatabaseError('No se ha introducido ningún asiento de cobro / pago.');
   end
   else begin
      ComprobarAsientosCobroPago(OK);
   end;

   // Generar asientos
   if OK then  begin
      eTotalImporte.AsFloat := 0;
      GenerarAsientosCobroPago;

      QCobrosPagos.First;
      if oGenerarUnicoAsiento.Checked or (QCobrosPagos.RecordCount = 1) then begin
         MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', QCobrosPagosASIENTO_GENERADO.AsInteger), mtInformation, [mbOK], 0);
      end
      else begin
         Msg := 'Generados asientos nº ' + FormatFloat('###,###,###',
            QCobrosPagosASIENTO_GENERADO.AsInteger);
         QCobrosPagos.Next;
         while not QCobrosPagos.EOF do begin
            Msg := Msg + ', ' + FormatFloat('###,###,###', QCobrosPagosASIENTO_GENERADO.AsInteger);
            QCobrosPagos.Next;
         end;
         QCobrosPagos.First;
         MessageDlg(Msg, mtInformation, [mbOK], 0);
      end;

      // Inicializar fichero de cobros / pagos
      QCobrosPagos.EmptyDataSet;

      // Refrescar últimos movimientos
      PrepararQueryMovimientos;
      eTotalImporte.AsFloat := 0;
   end;
end;

procedure TWCargaCobrosPagos.BtnEdtSalirClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   if not ((QFichero.Modified) or (QCobrosPagos.Modified)) then Exit;

   if MessageDlg('¿Quiere cancelar los cambios?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Close;
   end;
end;

procedure TWCargaCobrosPagos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWCargaCobrosPagos.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   // Crear fichero
   CrearFicheros;

   // Montar SQL de inserción en Diario
   PrepararQueryDiario;

   PrepararQueryMovimientos;

   // Configurar grid
   ConfigurarGridCobrosPagos;

   eSubcuentaBanco.MaxLength         := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   eSubcuentaBancoDesc.MaxLength     := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   eSubcuentaCBSUBCUENTA.MaxLength   := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   QCobrosPagosIMPORTE.DisplayFormat := '###,###,##0.00';

   Modo(Self, Edita);
   Paginas.Pages[0].Show;

   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
      eSubcuentaBancoDesc.SetFocus;
   end
   else begin
      eSubcuentaBanco.SetFocus;
   end;
end;

procedure TWCargaCobrosPagos.FormCreate(Sender: TObject);
var
   Pos1: Integer;
begin
   Paginas.Height := 441;
   Paginas.Width  := 742;

   ActivarTransacciones(Self);

   // Búsqueda subcuenta
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then  begin
      Pos1 := eSubcuentaBanco.Left;
      eSubcuentaBancoDesc.Left := Pos1;
      eSubcuentaBanco.Left := eSubcuentaBanco.Left + eSubcuentaBancoDesc.Width;
      eSubcuentaBanco.TabStop := False;

      Pos1 := eSubcuentaCBSUBCUENTA.Left;
      eDescSubcuentaCBDESCSUBCUENTA.Left := Pos1;
      eSubcuentaCBSUBCUENTA.Left := eSubcuentaCBSUBCUENTA.Left + eDescSubcuentaCBDESCSUBCUENTA.Width;
      eSubcuentaCBSUBCUENTA.TabStop := False;
   end;
end;

procedure TWCargaCobrosPagos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F2: begin
         PermAniadir.Click;
      end;
      VK_F3: begin
         BtnEdtGuardar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is
            TwwDBDateTimePicker) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBComboBox) then   begin
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
            if QCobrosPagos.State in dsEditModes then begin
               QCobrosPagos.Post;
            end;
            QCobrosPagos.Append;
            if QFicheroID_CONCEPTOS_DFTO.AsString = '' then   begin
               eConceptoAsiento.SetFocus;
            end
            else
            if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
               eDescSubcuentaCBDESCSUBCUENTA.SetFocus;
            end
            else begin
               eSubcuentaCBSUBCUENTA.SetFocus;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox and TwwDBComboBox(
            ActiveControl).DroppedDown) or (ActiveControl is TwwDBLookupCombo and
            not TwwDBLookupCombo(ActiveControl).Grid.Visible) then   begin
            if Shift * [ssAlt] = [] then   begin
               if QCobrosPagos.State in dsEditModes then   begin
                  QCobrosPagos.Post;
               end;
               QCobrosPagos.Append;
               if QFicheroID_CONCEPTOS_DFTO.AsString = '' then   begin
                  eConceptoAsiento.SetFocus;
               end
               else
               if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
                  eDescSubcuentaCBDESCSUBCUENTA.SetFocus;
               end
               else begin
                  eSubcuentaCBSUBCUENTA.SetFocus;
               end;
            end;
         end;
      end
   end;
end;

procedure TWCargaCobrosPagos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCargaCobrosPagos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCargaCobrosPagos.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWCargaCobrosPagos.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
      DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString,
                                      QMovimientosNUMEROFACTURA.AsString,
                                      QMovimientosSERIE.AsString,
                                      QMovimientosEJERCICIO.AsInteger,
                                      QMovimientosCOMENTARIO.AsString,
                                      QMovimientosABREVIATURA.AsString);
end;

procedure TWCargaCobrosPagos.BtnEdtBorrarMovimClick(Sender: TObject);
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
         PrepararQueryMovimientos;
      end;
   end;

   Paginas.Update;
end;

procedure TWCargaCobrosPagos.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then   begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;
   WNuevaSubcuenta.ShowModal;
   WNuevaSubcuenta := nil;
   Paginas.Update;
end;

procedure TWCargaCobrosPagos.PermBorrarClick(Sender: TObject);
begin
   if not QCobrosPagos.IsEmpty then   begin
      if MessageDlg('¿Desea borrar el asiento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         QCobrosPagos.Delete;
      end;
   end;
end;

procedure TWCargaCobrosPagos.PermAniadirClick(Sender: TObject);
begin
   QCobrosPagos.Append;
   if QFicheroID_CONCEPTOS_DFTO.AsString = '' then   begin
      eConceptoAsiento.SetFocus;
   end
   else
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then   begin
      eDescSubcuentaCBDESCSUBCUENTA.SetFocus;
   end
   else begin
      eSubcuentaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaCobrosPagos.QCobrosPagosNewRecord(DataSet: TDataSet);
begin
   QCobrosPagosFECHA.AsDateTime      := Date;
   QCobrosPagosID_CONCEPTOS.AsString := QFicheroID_CONCEPTOS_DFTO.AsString;
   GridEdtCobrosPagos.SetActiveField('SUBCUENTA');
end;

procedure TWCargaCobrosPagos.PermBqdaDiarioClick(Sender: TObject);
begin
   if QCobrosPagos.State in dsEditModes then   begin
      QCobrosPagos.Post;
   end;

   if not QCobrosPagos.IsEmpty then  begin
      //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WDIARIO') then begin
      //   Exit;
      //end;

      if QCobrosPagosSUBCUENTA.AsString <> '' then begin
         if MessageDlg('El asiento seleccionado ya tiene subcuenta.' +
            #13 + '¿Desea continuar la búsqueda de asientos sin tener en cuenta la subcuenta?',
            mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
      end;

      if Assigned(WDiario) then   begin
         WDiario.Close;
      end;
      FID_Diario := 0;
      WDiario    := TWDiario.Create(nil);
      WDiario.FModoConsulta := True;
      WDiario.FImporteDesde := QCobrosPagosIMPORTE.AsFloat;
      WDiario.FImporteHasta := QCobrosPagosIMPORTE.AsFloat;
      WDiario.FFechaDesde := 0;
      WDiario.FFechaHasta := QCobrosPagosFECHA.AsDateTime;
      WDiario.ShowModal;
      if FID_Diario <> 0 then   begin
         if not (QCobrosPagos.State in dsEditModes) then   begin
            QCobrosPagos.Edit;
         end;

         QCobrosPagosID_DIARIO.AsInteger         := FID_Diario;
         QCobrosPagosID_CARTERAEFECTOS.AsInteger := 0;
         QCobrosPagosSITUACION.AsString          := '';
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBQuery.Create(nil), SQL do begin
            Database := DMRef.IBDSiamCont;
            Close;
            Clear;
            Add('SELECT NUMEROFACTURA, SUBCUENTA, CUENTA_ANALITICA, IMPORTE');
            Add('FROM DIARIO WHERE ID_DIARIO = :ID_DIARIO         ');
            ParamByName('ID_DIARIO').AsInteger := FID_Diario;
            Open;

            QCobrosPagosNUMEROFACTURA.AsString     := FieldByName('NUMEROFACTURA').AsString;
            QCobrosPagosSUBCUENTA.AsString         := FieldByName('SUBCUENTA').AsString;
            QCobrosPagosCUENTA_ANALITICA.AsVariant := FieldByName('CUENTA_ANALITICA').AsVariant;
            QCobrosPagosIMPORTE_PUNTEO.AsFloat     := FieldByName('IMPORTE').AsFloat;

            if (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'P') or
               (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'A') or
               (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'B') or
               (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'N') then   begin
               QCobrosPagosDEBEHABER.AsString := 'D';
            end
            else begin
               QCobrosPagosDEBEHABER.AsString := 'H';
            end;

            Free;
         end;
      end;

      GridEdtCobrosPagos.SetFocus;
   end;
   Paginas.Update;
end;

procedure TWCargaCobrosPagos.PermBqdaCarteraClick(Sender: TObject);
begin
   if QCobrosPagos.State in dsEditModes then   begin
      QCobrosPagos.Post;
   end;

   if not QCobrosPagos.IsEmpty then  begin
      if QCobrosPagosSUBCUENTA.AsString = '' then   begin
         if MessageDlg('El asiento seleccionado no tiene subcuenta.' +
            #13 + '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
      end;

      //if not DmControlRef.AccesoUsuario(gvId_Usuario, 'WCARTERAEFECTOS') then begin
      //   Exit;
      //end;

      if Assigned(WCarteraEfectos) then   begin
         WCarteraEfectos.Close;
      end;
      FID_Cartera     := 0;
      FSituacion      := '';
      WCarteraEfectos := TWCarteraEfectos.Create(nil);
      WCarteraEfectos.FModoConsulta := True;
      WCarteraEfectos.FSubcuenta := QCobrosPagosSUBCUENTA.AsString;
      WCarteraEfectos.FImporteDesde := QCobrosPagosIMPORTE.AsFloat;
      WCarteraEfectos.FImporteHasta := QCobrosPagosIMPORTE.AsFloat;
      WCarteraEfectos.FFechaEmisionDesde :=
         DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
      WCarteraEfectos.FFechaEmisionHasta :=
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
      WCarteraEfectos.FFechaVtoDesde := IncMonth(QCobrosPagosFECHA.AsDateTime, -1);
      WCarteraEfectos.FFechaVtoHasta := IncMonth(QCobrosPagosFECHA.AsDateTime, 1);
      WCarteraEfectos.ShowModal;
      if FID_Cartera <> 0 then   begin
         if not (QCobrosPagos.State in dsEditModes) then   begin
            QCobrosPagos.Edit;
         end;
         QCobrosPagosID_CARTERAEFECTOS.AsInteger := FID_Cartera;
         QCobrosPagosID_DIARIO.AsInteger         := 0;
         QCobrosPagosSITUACION.AsString          := FSituacion;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBQuery.Create(nil), SQL do begin
            Database := DMRef.IBDSiamCont;
            Close;
            Clear;
            Add('SELECT SUBCUENTA, ABREVIATURA FROM SUBCTAS');
            Add('WHERE SUBCUENTA = :SUBCUENTA');
            ParamByName('SUBCUENTA').AsString := QFicheroSUBCUENTABANCO.AsString;
            Open;
            if not EOF then   begin
               QCobrosPagosNUMEROFACTURA.AsString := FieldByName('ABREVIATURA').AsString;
            end
            else begin
               Close;
               Clear;
               Add('SELECT SUBCUENTA, FACTCLIENT, FACTPROVEEDOR');
               Add('FROM CARTERAEFECTOS WHERE ID_CARTERAEFECTOS = :ID_CARTERAEFECTOS');
               ParamByName('ID_CARTERAEFECTOS').AsInteger := FID_Cartera;
               Open;

               QCobrosPagosSUBCUENTA.AsString := FieldByName('SUBCUENTA').AsString;
               if FieldByName('FACTCLIENT').AsString <> '' then   begin
                  QCobrosPagosNUMEROFACTURA.AsString := FieldByName('FACTCLIENT').AsString;
               end;
               if FieldByName('FACTPROVEEDOR').AsString <> '' then   begin
                  QCobrosPagosNUMEROFACTURA.AsString := FieldByName('FACTPROVEEDOR').AsString;
               end;

               if (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'P') or
                  (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'A') or
                  (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'B') or
                  (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'N') then
               begin
                  QCobrosPagosDEBEHABER.AsString := 'D';
               end
               else begin
                  QCobrosPagosDEBEHABER.AsString := 'H';
               end;
            end;

            Close;
            Free;
         end;
      end;

      GridEdtCobrosPagos.SetFocus;
   end;
   Paginas.Update;
end;

procedure TWCargaCobrosPagos.BtnEdtModificarClick(Sender: TObject);
var
   Asiento: Integer;
   AsientoNomina, AsientoEmpresa: Integer;
begin
   if not QMovimientos.IsEmpty then  begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then   begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      // ASIENTO DE NÓMINA / SS EMPRESA
      if (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA) or
         (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_SSOCIAL_EMPRESA) then   begin
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;

         if QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA then   begin
            AsientoNomina  := QMovimientosASIENTO.AsInteger;
            AsientoEmpresa := QMovimientosASIENTONOMINA.AsInteger;
         end
         else begin
            AsientoEmpresa := QMovimientosASIENTO.AsInteger;
            AsientoNomina  := QMovimientosASIENTONOMINA.AsInteger;
         end;

         if not Assigned(WCargaRapidaNominas) then   begin
            WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
         end;

         WCargaRapidaNominas.FModoArranque   := Modificacion;
         WCargaRapidaNominas.FAsientoNomina  := AsientoNomina;
         WCargaRapidaNominas.FAsientoEmpresa := AsientoEmpresa;

         WCargaRapidaNominas.ShowModal;
      end

      else begin
         if not Assigned(WCargaAsiento) then   begin
            WCargaAsiento := TWCargaAsiento.Create(nil);
         end;

         WCargaAsiento.FModoArranque := Modificacion;
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;
         WCargaAsiento.FAsiento := Asiento;
         WCargaAsiento.ShowModal;
      end;

      PrepararQueryMovimientos;

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

procedure TWCargaCobrosPagos.QCobrosPagosCalcFields(DataSet: TDataSet);
begin
   if not (QCobrosPagos.IsEmpty) and (QCobrosPagosID_CONCEPTOS.AsString <> '') then   begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('SELECT * FROM CONCEPTOS WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
         ParamByName('ID_CONCEPTOS').AsString := QCobrosPagosID_CONCEPTOS.AsString;
         Open;
         if not EOF then   begin
            QCobrosPagosDESCCONCEPTO.AsString := FieldByName('DESCRIPCION').AsString;
         end;
         Close;
         Free;
      end;
   end;
end;

procedure TWCargaCobrosPagos.BtnEdtMayorClick(Sender: TObject);
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

procedure TWCargaCobrosPagos.eSubcuentaCBSUBCUENTACloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   if Modified then  begin
      if (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'P') or
         (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'A') or
         (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'B') or
         (DMContaRef.ObtenerTipoSubcuenta(QCobrosPagosSUBCUENTA.AsString) = 'N') then   begin
         QCobrosPagosDEBEHABER.AsString := 'D';
      end
      else begin
         QCobrosPagosDEBEHABER.AsString := 'H';
      end;
   end;
end;

procedure TWCargaCobrosPagos.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCargaCobrosPagos.PermMayorClick(Sender: TObject);
begin
   if not QCobrosPagos.IsEmpty and (QCobrosPagosSUBCUENTA.AsString <> '') then  begin
      if DMRef.QParametros.FieldByName('MOSTRAR_FILTRO_MAYOR').AsString = 'S' then   begin
         if not Assigned(WFiltroMayorSubcuenta) then   begin
            WFiltroMayorSubcuenta := TWFiltroMayorSubcuenta.Create(nil);
         end;
         WFiltroMayorSubcuenta.FSubcuenta := QCobrosPagosSUBCUENTA.AsString;
         WFiltroMayorSubcuenta.ShowModal;
         WFiltroMayorSubcuenta := nil;
      end
      else begin
         // Primero vaciar el fichero
         DMContaRef.QInformesConta.EmptyDataset;

         PonerTipoConta('T');

         LanzarInfMayor(True, False,
            QCobrosPagosSUBCUENTA.AsString, QCobrosPagosSUBCUENTA.AsString,
            '', '', DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime,
            DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime, Date, 'T',
            '', '', '', '', '', '', DMRef.QParametros.FieldByName('MONEDA').AsString, '', '');
      end;

      Paginas.Update;
   end;
end;

procedure TWCargaCobrosPagos.eSubcuentaBancoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
            ' caracteres.', mtInformation, [mbOK], 0);
         eSubcuentaBanco.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then   begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (QFichero.State in dsEditModes) then   begin
               QFichero.Edit;
            end;
            QFichero.FieldByName('SUBCUENTABANCO').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eSubcuentaBanco.SetFocus;
   end;
end;

procedure TWCargaCobrosPagos.eSubcuentaCBSUBCUENTANotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then   begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         eSubcuentaCBSUBCUENTA.SetFocus;
         Exit;
      end;

      if MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then   begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (QCobrosPagos.State in dsEditModes) then   begin
               QCobrosPagos.Edit;
            end;
            QCobrosPagos.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eSubcuentaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaCobrosPagos.GridEdtMovimientosMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FAsientoAnterior := QMovimientosASIENTO.AsInteger;
   GridEdtMovimientos.Refresh;
end;

procedure TWCargaCobrosPagos.GridEdtMovimientosCalcCellColors(Sender: TObject;
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

procedure TWCargaCobrosPagos.QCobrosPagosAfterPost(DataSet: TDataSet);
begin
   if oGenerarUnicoAsiento.Checked then  begin
      if QCobrosPagosDEBEHABER.AsString = 'D' then   begin
         eTotalImporte.AsFloat := eTotalImporte.AsFloat + QCobrosPagosIMPORTE.AsFloat;
      end
      else
      if QCobrosPagosDEBEHABER.AsString = 'H' then   begin
         eTotalImporte.AsFloat := eTotalImporte.AsFloat - QCobrosPagosIMPORTE.AsFloat;
      end;
   end;
end;

procedure TWCargaCobrosPagos.oGenerarUnicoAsientoClick(Sender: TObject);
begin
   CalcularTotalImporte;
end;

procedure TWCargaCobrosPagos.eDebeHaberExit(Sender: TObject);
begin
   CalcularTotalImporte;
end;

procedure TWCargaCobrosPagos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
