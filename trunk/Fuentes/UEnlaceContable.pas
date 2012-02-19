unit UEnlaceContable;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton,
     fcImage, fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSQL,
     jpeg, Mask, Messages, OvcBase, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, variants, WinProcs, WinTypes,
     wwclearpanel, Wwkeycb, wwSpeedButton, CustomView;

type
   TWEnlaceContable = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      TEnlace:        TTable;
      Label1:         TLabel;
      Memo:           TMemo;
      QFichero:       TClientDataSet;
      SFichero:       TDataSource;
      QFicheroASIENTO: TIntegerField;
      QFicheroMONEDA: TStringField;
      QFicheroAPUNTE: TIntegerField;
      QFicheroSUBCUENTA: TStringField;
      QFicheroFECHA:  TDateTimeField;
      QFicheroIMPORTE: TFloatField;
      QFicheroDEBEHABER: TStringField;
      QFicheroCONTRAPARTIDA: TStringField;
      QFicheroNUMEROFACTURA: TStringField;
      QFicheroCOMENTARIO: TStringField;
      QFicheroNIF:    TStringField;
      QFicheroRECARGO: TFloatField;
      QFicheroIVA:    TFloatField;
      QFicheroBASEIMPONIBLE: TFloatField;
      QFicheroCUOTAIVA: TFloatField;
      QFicheroCUOTARECARGO: TFloatField;
      QFicheroCUENTA_ANALITICA: TStringField;
      BtnEdtImprimir: TfcImageBtn;
      gOrden:         TRadioGroup;
      QFicheroFECHAINICIAL: TDateTimeField;
      QFicheroFECHAFINAL: TDateTimeField;
      QFicheroDESCSUBCUENTA: TStringField;
      QFicheroDESCAPUNTE: TStringField;
      QFicheroID_CONCEPTOS: TStringField;
      QFicheroDEBE:   TFloatField;
      QFicheroHABER:  TFloatField;
      QFicheroFECHAIMPRESION: TDateTimeField;
      QBuscaSubcuenta: TIBSQL;
      QInsertaSubcuenta: TIBSQL;
      QCarteraEfectos: TIBSQL;
      QSubcuentas:    TIBSQL;
      QBorraDiario:   TIBSQL;
      QBorraCartera:  TIBSQL;
      QBuscaDiario:   TIBSQL;
      QInfSubcta:     TIBQuery;
      QBuscaProvincia: TIBQuery;
      QInsProvincia:  TIBSQL;
      QModificaSubcuenta: TIBSQL;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      Qdiario:        TIBQuery;
      QFicheroSERIE:  TStringField;
      QFicheroEJERCICIO: TIntegerField;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure BtnEdtImprimirClick(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
   private
      procedure CrearFichero;
   public
      procedure EnlaceReciboVentas;
      procedure EnlaceSubcuentas;
      procedure EnlaceCheques;
      procedure EnlaceFacturas;
   end;

var WEnlaceContable: TWEnlaceContable;

implementation
uses DM, DMConta, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

procedure TWEnlaceContable.CrearFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('FECHAINICIAL', ftDateTime, 0, False);
      Add('FECHAFINAL', ftDateTime, 0, False);
      Add('FECHAIMPRESION', ftDateTime, 0, False);
      Add('ASIENTO', ftInteger, 0, False);
      Add('MONEDA', ftString, 1, False);
      Add('APUNTE', ftInteger, 0, False);
      Add('SUBCUENTA', ftString, 10, False);
      Add('FECHA', ftDateTime, 0, False);
      Add('IMPORTE', ftFloat, 0, False);
      Add('DEBE', ftFloat, 0, False);
      Add('HABER', ftFloat, 0, False);
      Add('ID_CONCEPTOS', ftString, 3, False);
      Add('DEBEHABER', ftString, 1, False);
      Add('CONTRAPARTIDA', ftString, 10, False);
      Add('NUMEROFACTURA', ftString, 10, False);
      Add('COMENTARIO', ftString, 40, False);
      Add('NIF', ftString, 15, False);
      Add('RECARGO', ftFloat, 0, False);
      Add('IVA', ftFloat, 0, False);
      Add('BASEIMPONIBLE', ftFloat, 0, False);
      Add('CUOTAIVA', ftFloat, 0, False);
      Add('CUOTARECARGO', ftFloat, 0, False);
      Add('CUENTA_ANALITICA', ftString, 10, False);
      Add('DESCSUBCUENTA', ftString, 100, False);
      Add('DESCAPUNTE', ftString, 100, False);
      Add('EJERCICIO', ftInteger, 0, False);
      Add('SERIE', ftString, 5, False);

      FieldByName('DESCSUBCUENTA').FieldKind := fkCalculated;
      FieldByName('DESCAPUNTE').FieldKind    := fkCalculated;
      FieldByName('DEBE').FieldKind          := fkCalculated;
      FieldByName('HABER').FieldKind         := fkCalculated;

      CreateDataSet;
      Active := True;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, IndexDefs do begin
      Add('FECHA', 'FECHA;ASIENTO;APUNTE', []);
      Add('ASIENTO', 'ASIENTO;APUNTE', []);
   end;
end;

procedure TWEnlaceContable.BtnEdtProcesarClick(Sender: TObject);
var
   Caratula: TEspere;
begin
   QFichero.EmptyDataSet;
   Memo.Lines.Clear;

   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Verificar que existe el fichero de enlace
   if not fileExists(gvDirectorio + 'enlace.db') then   begin
      DatabaseError('No existe el fichero de enlace de contabilidad.');
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

   try
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TEnlace do begin
         Databasename := gvDirectorio;
         Tablename    := 'enlace.db';
         Exclusive    := True;
         Open;
         First;
         while not EOF do begin
            // Chequeo del campo pasado
            if (empty(FieldByName('pasado').AsString)) or (FieldByName('pasado').AsString = 'N') then
            begin
               if FieldByName('Tipo_Fv').AsString = 'R' then begin
                  EnlaceReciboVentas;
               end
               else
               if FieldByName('Tipo_Fv').AsString = 'C' then begin
                  EnlaceCheques;
               end
               else
               if FieldByName('Tipo_Fv').AsString = 'S' then begin
                  EnlaceSubcuentas;
               end
               else
               if FieldByName('Tipo_Fv').AsString = 'F' then begin
                  EnlaceFacturas;
               end;
            end;
            Next;
         end;
         Close;
      end;
   except
      on e: Exception do begin
         Caratula.Cerrar;
         Caratula.Free;
         DatabaseError(e.Message);
      end;
   end;

   Caratula.Cerrar;
   Caratula.Free;
   MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
end;

procedure TWEnlaceContable.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWEnlaceContable.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWEnlaceContable.FormShow(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInfSubcta, SQL do begin
      Close;
      Clear;
      Add('SELECT DESCRIPCION FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');
   end;

   CrearFichero;
end;

procedure TWEnlaceContable.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
      end;
      VK_DOWN: begin
         SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
      end
   end;
end;

procedure TWEnlaceContable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario      := nil;
   WEnlaceContable := nil;
end;

procedure TWEnlaceContable.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWEnlaceContable.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWEnlaceContable.EnlaceReciboVentas;
var
   nAsiento, nApunte: Integer;
   dFechaRecibos: TDatetime;
   cContrapartida, cComentario: String;
   lSerie, lCondicion: Boolean;
   Marca: TBookMarkStr;
begin

   lSerie := (Dmref.QParametros.FieldByName('TrataSerie').AsString = 'S');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('select count(*) as cuantos from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCarteraEfectos, SQL do begin
      Close;
      Clear;
      Add('update CarteraEfectos set situacion="B",FAsiento=:Fecha,SubctaBanco=:Banco');
      Add(' where subcuenta=:subcuenta and factclient=:factura and importe=:importe');
      if lSerie then begin
         Add(' and serie=:serie and ejercicio=:ejercicio');
      end;
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('insert into subctas(subcuenta,descripcion,obsoleto)');
      Add(' values (:subcuenta,:descripcion, "N")');
      prepare;
   end;

   lCondicion := (TEnlace.FindField('centrocoste') <> nil) and (not
      empty(TEnlace.FieldByName('centrocoste').AsString));
   nAsiento   := DMContaRef.ObtenerNumeroAsiento;
   nApunte    := 1;
   // Recibo de Ventas - automatizacion de remesas bancarias
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TEnlace do begin
      Marca := BookMark;
      // Vamos al final para tomar del banco la fecha de todo el asiento
      last;
      dFechaRecibos  := FieldByName('Fecha').AsDateTime;
      cContrapartida := FieldByName('subcta').AsString;

      // Buscar si existe la subcuenta del banco
      QBuscaSubcuenta.Close;
      QBuscaSubcuenta.parambyname('subcuenta').AsString :=
         Trim(FieldByName('subcta').AsString);
      QBuscaSubcuenta.ExecQuery;
      if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then  begin
         // Error : Subcuenta de banco no encontrada
         // Se da de alta
         QInsertaSubcuenta.Close;
         QInsertaSubcuenta.parambyname('subcuenta').AsString   :=
            Trim(FieldByName('subcta').AsString);
         QInsertaSubcuenta.parambyname('descripcion').AsString := 'CREADA EN ENLACE CONTABLE';
         QInsertaSubcuenta.ExecQuery;
         QInsertaSubcuenta.Transaction.CommitRetaining;
      end;

      // Debe permanecer en el ultimo registro para poner como primer apunte
      // del asiento, el banco al debe.
      QDiario.Close;
      QDiario.Sql.Clear;
      QDiario.Sql.Add('INSERT INTO DIARIO(ASIENTO,MONEDA,APUNTE,SUBCUENTA,ID_CONCEPTOS,');
      if lSerie then begin
         QDiario.Sql.Add(' SERIE,EJERCICIO,');
      end;
      QDiario.Sql.Add(' DEBEHABER,IMPORTE,FECHA');
      if not lCondicion then begin
         QDiario.Sql.Add(')');
      end
      else begin
         QDiario.Sql.Add(',CUENTA_ANALITICA)');
      end;
      QDiario.Sql.Add('VALUES (:ASIENTO,:MONEDA,:APUNTE,:SUBCUENTA,:ID_CONCEPTOS,');
      if lSerie then begin
         QDiario.Sql.Add(' :SERIE,:EJERCICIO,');
      end;
      QDiario.Sql.Add(' "D",:IMPORTE,:FECHA');
      if not lCondicion then begin
         QDiario.Sql.Add(')');
      end
      else begin
         QDiario.Sql.Add(',:CUENTA_ANALITICA)');
      end;
      QDiario.parambyname('asiento').AsInteger     := nAsiento;
      QDiario.parambyname('moneda').AsString       := Dmref.QParametros.FieldByName('Moneda').AsString;
      QDiario.parambyname('apunte').AsInteger      := nApunte;
      QDiario.parambyname('subcuenta').AsString    := FieldByName('subcta').AsString;
      QDiario.parambyname('fecha').AsDateTime      := dFechaRecibos;
      QDiario.parambyname('importe').AsFloat       :=
         RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
      QDiario.parambyname('id_conceptos').AsString := '07'; // cobro facturas
      if lSerie then   begin
         QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
         QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
      end;
      if lCondicion then   begin
         QDiario.parambyname('cuenta_analitica').AsString := Copy(FieldByName('centrocoste').AsString, 1, 10);
      end;
      QDiario.ExecSql;
      QDiario.Transaction.Commitretaining;

      Memo.Lines.Add(DateTimeToStr(dFechaRecibos) + ' - Cobro Factura: ' +
         FieldByName('FACTURA').AsString + ' - Subcuenta: ' + FieldByName('subcta').AsString +
         ' - Importe: ' + FormatFloat('###,###,##0.00', FieldByName('IMPORTE').AsFloat));

      // Guardar en tabla en memoria
      QFichero.Insert;
      QFicheroASIENTO.AsInteger         := nAsiento;
      QFicheroMONEDA.AsString           := Dmref.QParametros.FieldByName('Moneda').AsString;
      QFicheroAPUNTE.AsInteger          := nApunte;
      QFicheroSUBCUENTA.AsString        := FieldByName('subcta').AsString;
      QFicheroID_CONCEPTOS.AsString     := '07'; // cobro facturas
      QFicheroDEBEHABER.AsString        := 'D';
      QFicheroIMPORTE.AsFloat           :=
         RoundTodecimal(FieldByName('importe').AsFloat, 2, True);
      QFicheroFECHA.AsDateTime          := dFechaRecibos;
      QFicheroFECHAIMPRESION.AsDateTime := Date;
      if lSerie then   begin
         QFicheroSerie.AsString      := FieldByName('serie').AsString;
         QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
      end;
      QFichero.Post;

      Inc(nApunte);

      // Actualizar pasado
      Edit;
      FieldByName('pasado').AsString := 'S';
      Post;

      BookMark := Marca;
      prior;
      while not EOF do begin
         if FieldByName('pasado').AsString <> 'S' then   begin
            QBuscaSubcuenta.Close;
            QBuscaSubcuenta.parambyname('subcuenta').AsString :=
               Trim(FieldByName('subcta').AsString);
            QBuscaSubcuenta.ExecQuery;

            // Buscar si la subcuenta Existe
            if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then   begin
               // Error : Subcuenta no encontrada
               // Se da de alta
               QInsertaSubcuenta.Close;
               QInsertaSubcuenta.parambyname('subcuenta').AsString   :=
                  Trim(FieldByName('subcta').AsString);
               QInsertaSubcuenta.parambyname('descripcion').AsString := 'CREADA EN ENLACE CONTABLE';
               QInsertaSubcuenta.ExecQuery;
               QInsertaSubcuenta.Transaction.CommitRetaining;
            end;

            QCarteraEfectos.Close;
            QCarteraEfectos.parambyname('subcuenta').AsString :=
               Trim(FieldByName('subcta').AsString);
            QCarteraEfectos.parambyname('Banco').AsString     := cContrapartida;
            QCarteraEfectos.parambyname('Factura').AsString   := FieldByName('Factura').AsString;
            QCarteraEfectos.parambyname('Importe').AsFloat    :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QCarteraEfectos.parambyname('Fecha').AsDateTime   := dFechaRecibos;
            if lSerie then   begin
               QCarteraEfectos.parambyname('serie').AsString      := FieldByName('serie').AsString;
               QCarteraEfectos.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
            end;
            QCarteraEfectos.ExecQuery;
            QCarteraEfectos.Transaction.CommitRetaining;

            QDiario.Close;
            QDiario.Sql.Clear;
            QDiario.Sql.Add('INSERT INTO DIARIO(ASIENTO,MONEDA,APUNTE,SUBCUENTA,ID_CONCEPTOS,');
            QDiario.Sql.Add(' DEBEHABER,IMPORTE,NUMEROFACTURA,FECHA,COMENTARIO,');
            if lSerie then begin
               QDiario.Sql.Add(' SERIE,EJERCICIO,');
            end;
            QDiario.Sql.Add('CONTRAPARTIDA');
            if not lCondicion then begin
               QDiario.Sql.Add(')');
            end
            else begin
               QDiario.Sql.Add(',CUENTA_ANALITICA)');
            end;
            QDiario.Sql.Add('VALUES (:ASIENTO,:MONEDA,:APUNTE,:SUBCUENTA,:ID_CONCEPTOS,');
            QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:NUMEROFACTURA,:FECHA,:COMENTARIO,');
            if lSerie then begin
               QDiario.Sql.Add(' :SERIE,:EJERCICIO,');
            end;
            QDiario.Sql.Add(':CONTRAPARTIDA');
            if not lCondicion then begin
               QDiario.Sql.Add(')');
            end
            else begin
               QDiario.Sql.Add(',:CUENTA_ANALITICA)');
            end;
            QDiario.parambyname('asiento').AsInteger       := nAsiento;
            QDiario.parambyname('moneda').AsString         := Dmref.QParametros.FieldByName('Moneda').AsString;
            QDiario.parambyname('apunte').AsInteger        := nApunte;
            QDiario.parambyname('subcuenta').AsString      := FieldByName('subcta').AsString;
            QDiario.parambyname('debehaber').AsString      := 'H';
            QDiario.parambyname('contrapartida').AsString  := cContrapartida;
            QDiario.parambyname('NumeroFactura').AsInteger := FieldByName('factura').AsInteger;
            QDiario.parambyname('fecha').AsDateTime        := dFechaRecibos;
            QDiario.parambyname('importe').AsFloat         :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QDiario.parambyname('id_conceptos').AsString   := '07'; // cobro facturas

            cComentario := '';
            if (findfield('fechavenc') <> nil) and (copy(Trim(FieldByName('subcta').AsString), 1, 3) <> '572') then
            begin
               cComentario := 'VTO. ' + FieldByName('fechavenc').AsString;
            end;
            QDiario.parambyname('comentario').AsString := cComentario;
            if lSerie then   begin
               QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
               QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
            end;
            if lCondicion then   begin
               QDiario.parambyname('cuenta_analitica').AsString := Copy(FieldByName('centrocoste').AsString, 1, 10);
            end;
            QDiario.ExecSql;
            QDiario.Transaction.Commitretaining;

            // Guardar en tabla en memoria
            QFichero.Insert;
            QFicheroASIENTO.AsInteger         := nAsiento;
            QFicheroMONEDA.AsString           := Dmref.QParametros.FieldByName('Moneda').AsString;
            QFicheroAPUNTE.AsInteger          := nApunte;
            QFicheroSUBCUENTA.AsString        := FieldByName('subcta').AsString;
            QFicheroID_CONCEPTOS.AsString     := '07'; // cobro facturas
            QFicheroDEBEHABER.AsString        := 'H';
            QFicheroIMPORTE.AsFloat           :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QFicheroNUMEROFACTURA.AsString    := FieldByName('FACTURA').AsString;
            QFicheroFECHA.AsDateTime          := dFechaRecibos;
            QFicheroCOMENTARIO.AsString       := cComentario;
            QFicheroCONTRAPARTIDA.AsString    := cContrapartida;
            QFicheroFECHAIMPRESION.AsDateTime := Date;
            if lSerie then   begin
               QFicheroSerie.AsString      := FieldByName('serie').AsString;
               QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
            end;
            QFichero.Post;

            Inc(nApunte);

            // Actualizar pasado
            Edit;
            FieldByName('pasado').AsString := 'S';
            Post;
         end; 
         Next;
      end;
   end;
end;

procedure TWEnlaceContable.EnlaceCheques;
var nAsiento, nAsientoBorra: Integer;
    lCondicion: Boolean;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TEnlace do begin
      while not EOF do begin
         if FieldByName('pasado').AsString <> 'S' then   begin
            // centro coste liq. agudo
            lCondicion := (FindField('ccoste') <> nil) and (not
               empty(FieldByName('ccoste').AsString));
            QDiario.Close;
            QDiario.Sql.Clear;
            QDiario.Sql.Add('INSERT INTO DIARIO(ASIENTO,MONEDA,APUNTE,SUBCUENTA,ID_CONCEPTOS,');
            QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,NUMEROFACTURA,FECHA,COMENTARIO');
            if not lCondicion then begin
               QDiario.Sql.Add(')');
            end
            else begin
               QDiario.Sql.Add(',CUENTA_ANALITICA)');
            end;
            QDiario.Sql.Add('VALUES (:ASIENTO,:MONEDA,:APUNTE,:SUBCUENTA,:ID_CONCEPTOS,');
            QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:NUMEROFACTURA,:FECHA,:COMENTARIO');
            if not lCondicion then begin
               QDiario.Sql.Add(')');
            end
            else begin
               QDiario.Sql.Add(',:CUENTA_ANALITICA)');
            end;

            nAsiento := DMContaRef.ObtenerNumeroAsiento;

            Memo.Lines.Add(DateTimeToStr(FieldByName('fecha').AsDateTime) +
               ' - Pago Hoja Liquidación: ' + FieldByName('FACTURA').AsString +
               ' - Importe: ' + FormatFloat('###,###,##0.00', FieldByName('IMPORTE').AsFloat));

            // Antes de insertar el asiento hay q borrar si existia antes
            if FieldByName('subcta').AsString <> '' then   begin
               QBuscaDiario.Close;
               QBuscaDiario.SQL.Clear;
               QBuscaDiario.SQL.Add('select asiento from diario ');
               QBuscaDiario.SQL.Add(' where numerofactura=:numerofactura and ');
               QBuscaDiario.SQL.Add('  subcuenta=:subcuenta and id_conceptos="41"');
               QBuscaDiario.ParamByName('NUMEROFACTURA').AsString := FieldByName('FACTURA').AsString;
               QBuscaDiario.ParamByName('SUBCUENTA').AsString     := FieldByName('SUBCTA').AsString;
               QBuscaDiario.ExecQuery;

               if QBuscaDiario.FieldByName('asiento').AsInteger > 0 then   begin
                  nAsientoBorra := QBuscaDiario.FieldByName('asiento').AsInteger;
                  QBuscaDiario.Close;
                  QBuscaDiario.SQL.Clear;
                  QBuscaDiario.SQL.Add('delete from diario where asiento=:asiento');
                  QBuscaDiario.ParamByName('asiento').AsInteger := nAsientoBorra;
                  QBuscaDiario.ExecQuery;
                  QBuscaDiario.Transaction.CommitRetaining;
               end;
            end;

            // Apunte 1
            QDiario.parambyname('asiento').AsInteger      := nAsiento;
            QDiario.parambyname('moneda').AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
            QDiario.parambyname('apunte').AsInteger       := 1;
            QDiario.parambyname('subcuenta').AsString     := FieldByName('subcta').AsString;
            QDiario.parambyname('id_conceptos').AsString  := '41'; // PAGO HOJA LIQUIDACION
            QDiario.parambyname('debehaber').AsString     := 'D';
            QDiario.parambyname('importe').AsFloat        :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QDiario.parambyname('contrapartida').AsString :=
               Trim(FieldByName('subbanco').AsString);  // Banco
            QDiario.parambyname('numerofactura').AsString := FieldByName('factura').AsString;
            QDiario.parambyname('fecha').AsDateTime       := FieldByName('fecha').AsDateTime;
            QDiario.parambyname('comentario').AsString    := FieldByName('factura').AsString;
            if lCondicion then   begin
               QDiario.parambyname('cuenta_analitica').AsString := Copy(FieldByName('ccoste').AsString, 1, 10);
            end;
            QDiario.ExecSql;
            QDiario.Transaction.Commitretaining;

            // Guardar en tabla en memoria
            QFichero.Insert;
            QFicheroASIENTO.AsInteger      := nAsiento;
            QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
            QFicheroAPUNTE.AsInteger       := 1;
            QFicheroSUBCUENTA.AsString     := FieldByName('subcta').AsString;
            QFicheroID_CONCEPTOS.AsString  := '41'; // PAGO HOJA LIQUIDACION
            QFicheroDEBEHABER.AsString     := 'D';
            QFicheroIMPORTE.AsFloat        :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QFicheroNUMEROFACTURA.AsString := FieldByName('FACTURA').AsString;
            QFicheroFECHA.AsDateTime       := FieldByName('FECHA').AsDateTime;
            QFicheroCOMENTARIO.AsString    := FieldByName('FACTURA').AsString;
            QFicheroCONTRAPARTIDA.AsString := Trim(FieldByName('SUBBANCO').AsString);
            if lCondicion then   begin
               QFicheroCUENTA_ANALITICA.AsString := Copy(FieldByName('CCOSTE').AsString, 1, 10);
            end;
            QFicheroFECHAIMPRESION.AsDateTime := Date;
            QFichero.Post;

            // Apunte 2
            QDiario.Close;
            QDiario.parambyname('asiento').AsInteger      := nAsiento;
            QDiario.parambyname('apunte').AsInteger       := 2;
            QDiario.parambyname('moneda').AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
            QDiario.parambyname('subcuenta').AsString     := Trim(FieldByName('subbanco').AsString);
            QDiario.parambyname('debehaber').AsString     := 'H';
            QDiario.parambyname('fecha').AsDateTime       := FieldByName('fecha').AsDateTime;
            QDiario.parambyname('importe').AsFloat        :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QDiario.parambyname('id_conceptos').AsString  := '41'; // PAGO HOJA LIQUIDACION
            QDiario.parambyname('contrapartida').AsString :=
               Trim(FieldByName('subcta').AsString);  // Banco
            QDiario.parambyname('numerofactura').AsString := FieldByName('factura').AsString;
            QDiario.parambyname('comentario').AsString    := FieldByName('factura').AsString;
            if lCondicion then   begin
               QDiario.parambyname('cuenta_analitica').AsString := Copy(FieldByName('ccoste').AsString, 1, 10);
            end;
            QDiario.ExecSql;
            QDiario.Transaction.Commitretaining;

            // Guardar en tabla en memoria
            QFichero.Insert;
            QFicheroASIENTO.AsInteger      := nAsiento;
            QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
            QFicheroAPUNTE.AsInteger       := 2;
            QFicheroSUBCUENTA.AsString     := Trim(FieldByName('SUBBANCO').AsString);
            QFicheroID_CONCEPTOS.AsString  := '41'; // PAGO HOJA LIQUIDACION
            QFicheroDEBEHABER.AsString     := 'H';
            QFicheroIMPORTE.AsFloat        :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
            QFicheroNUMEROFACTURA.AsString := FieldByName('FACTURA').AsString;
            QFicheroFECHA.AsDateTime       := FieldByName('FECHA').AsDateTime;
            QFicheroCOMENTARIO.AsString    := FieldByName('FACTURA').AsString;
            QFicheroCONTRAPARTIDA.AsString := Trim(FieldByName('SUBCTA').AsString);
            if lCondicion then   begin
               QFicheroCUENTA_ANALITICA.AsString := Copy(FieldByName('CCOSTE').AsString, 1, 10);
            end;
            QFicheroFECHAIMPRESION.AsDateTime := Date;
            QFichero.Post;

            // Actualizar pasado
            Edit;
            FieldByName('pasado').AsString := 'S';
            Post;
         end; 
         Next;
      end;
   end;
end;

procedure TWEnlaceContable.EnlaceFacturas;
var
   lCondCoste, lCondComercial, lSerie, lIgest: Boolean;
   nTipo4, nTipo16, nTipo7, nTipoRec4, nTipoRec1, nTipoRec05: Double;
   cPasado, cComentario, cNif, cContrapartida, cConcepto, cFactura: String;
   TipoAsiento, nAsiento, nApunte: Integer;
begin

   lSerie := (Dmref.QParametros.FieldByName('TrataSerie').AsString = 'S');
   lIgest := (Tenlace.findfield('Aplicacion') <> nil) and
      (TEnlace.FieldByName('Aplicacion').AsString = 'I');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Clear;
      Add('select subcuenta,iva,recargo,descripcion,contrapartida from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('select count(*) as cuantos from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBorraDiario, SQL do begin
      Close;
      Clear;
      Add('delete from diario');
      Add(' where asiento=:asiento');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('insert into subctas (subcuenta,descripcion,pais,direccion,nif,codpostal,');
      Add(' poblacion,provincia,');
      Add('telefono,fax,obsoleto)');
      Add('values(:subcuenta,:descripcion,:pais,:direccion,:nif,:codpostal,');
      Add(' :poblacion,:provincia,');
      Add(' :telefono,:fax, "N") ');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QModificaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('update subctas set descripcion=:descripcion,direccion=:direccion,nif=:nif,codpostal=:codpostal,');
      Add(' poblacion=:poblacion,telefono=:telefono,fax=:fax ');
      if not lIGest then begin
         Add(' ,provincia=:provincia ');
      end;
      Add('where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBorraCartera, SQL do begin
      Close;
      Clear;
      Add('delete from carteraefectos');
      Add(' where factclient=:factclient and subcuenta=:subcuenta ');
      if lSerie then begin
         Add(' and ejercicio=:ejercicio and serie=:serie ');
      end;
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaProvincia, SQL do begin
      Close;
      Clear;
      Add('SELECT * FROM PROVINCIAS WHERE PROVINCIA = :PROVINCIA');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsProvincia, SQL do begin
      Close;
      Clear;
      Add('INSERT INTO PROVINCIAS (PROVINCIA, NOMBRE, CODIGO)');
      Add('VALUES (:PROVINCIA, :NOMBRE, :CODIGO)');
   end;

   // Inicializacion de tipos
   //nTipo4:=99;
   //nTipo7:=99;
   //nTipo16:=99;
   //nTipoRec4:=99;
   //nTipoRec1:=99;
   //nTipoRec05:=99;

   // Poner valores reales a los tipos
   // I.V.A. Normal
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('Sctaivanormal').AsString;
   QSubcuentas.ExecQuery;
   nTipo16 := QSubcuentas.FieldByName('iva').AsFloat;
   // I.V.A. Reducido
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('SctaivaReducido').AsString;
   QSubcuentas.ExecQuery;
   nTipo7 := QSubcuentas.FieldByName('iva').AsFloat;
   // I.V.A. Su perReducido
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('Sctaivasuper').AsString;
   QSubcuentas.ExecQuery;
   nTipo4 := QSubcuentas.FieldByName('iva').AsFloat;

   // Rec. Equiv. Normal
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('SctaRecnormal').AsString;
   QSubcuentas.ExecQuery;
   nTipoRec4 := QSubcuentas.FieldByName('recargo').AsFloat;
   // Rec. Equi. Reducido
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('SctaRecReducido').AsString;
   QSubcuentas.ExecQuery;
   nTipoRec1 := QSubcuentas.FieldByName('recargo').AsFloat;
   // Rec. Equi. SuperReducido
   QSubcuentas.Close;
   QSubcuentas.parambyname('subcuenta').AsString :=
      DmRef.QParametros.FieldByName('SctaRecSuper').AsString;
   QSubcuentas.ExecQuery;
   nTipoRec05 := QSubcuentas.FieldByName('recargo').AsFloat;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TEnlace do begin
      while not EOF do begin
         // Salir para hacer los cobros en metalico
         if FieldByName('tipo_Fv').AsString = 'R' then begin
            exit;
         end;
         if FieldByName('pasado').AsString <> 'S' then   begin
            cPasado := 'S';
            if FieldByName('tipo_Fv').AsString = 'V' then // Recibos de las facturas
            begin
               // Solo se crean registros si se gestiona en la empresa actual
               // la cartera de efectos
               if DmRef.QParametros.FieldByName('GESTIONA_CARTERA_EFECTOS').AsString = 'S' then   begin
                  // Seleccion de campo de facturas 
                  if (findfield('numfactu') <> nil) and (FieldByName('numfactu').AsString <> '') then
                  begin
                     cFactura := FieldByName('NumFactu').AsString;
                  end
                  else begin
                     cFactura := FieldByName('Factura').AsString;
                  end;

                  lCondComercial := (FindField('comercial') <> nil) and
                     (not empty(FieldByName('comercial').AsString));
                  QCarteraEfectos.Close;
                  QCarteraEfectos.Sql.Clear;
                  QCarteraEfectos.Sql.Add('insert into carteraefectos (SUBCUENTA,SITUACION,CONCEPTO,');
                  QCarteraEfectos.Sql.Add(' FEMISION,IMPORTE,');
                  if lSerie then begin
                     QCarteraEfectos.Sql.Add('SERIE,EJERCICIO,');
                  end;
                  if FieldByName('debehaber').AsString = 'D' then begin
                     QCarteraEfectos.Sql.Add('FACTCLIENT,');
                  end
                  else begin
                     QCarteraEfectos.Sql.Add('FACTPROVEEDOR,');
                  end;
                  QCarteraEfectos.Sql.Add(' FVENCIMIENTO');
                  if lCondComercial then begin
                     QCarteraEfectos.Sql.Add(',COMERCIAL,IMPCOMISION)');
                  end
                  else begin
                     QCarteraEfectos.Sql.Add(')');
                  end;
                  QCarteraEfectos.Sql.Add('values (:SUBCUENTA,:SITUACION,:CONCEPTO,:FEMISION,');
                  QCarteraEfectos.Sql.Add(' :IMPORTE,');
                  if lSerie then begin
                     QCarteraEfectos.Sql.Add(':SERIE,:EJERCICIO,');
                  end;
                  if FieldByName('debehaber').AsString = 'D' then begin
                     QCarteraEfectos.Sql.Add(':FACTCLIENT,');
                  end
                  else begin
                     QCarteraEfectos.Sql.Add(':FACTPROVEEDOR,');
                  end;
                  QCarteraEfectos.Sql.Add(':FVENCIMIENTO');
                  if lCondComercial then begin
                     QCarteraEfectos.Sql.Add(',:COMERCIAL,:IMPCOMISION)');
                  end
                  else begin
                     QCarteraEfectos.Sql.Add(')');
                  end;

                  QCarteraEfectos.parambyname('subcuenta').AsString := FieldByName('subcta').AsString;
                  if Trim(FieldByName('subcta').AsString) =
                     Trim(DmRef.QParametros.FieldByName('VGenerica').AsString) then   begin
                     QCarteraEfectos.parambyname('situacion').AsString := 'A';
                  end // aceptado si generica ventas
                  else begin
                     QCarteraEfectos.parambyname('situacion').AsString := 'N';
                  end;
                  QCarteraEfectos.parambyname('femision').AsDateTime     := FieldByName('fecha').AsDateTime;
                  QCarteraEfectos.parambyname('importe').AsFloat         :=
                     RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
                  QCarteraEfectos.parambyname('fvencimiento').AsDateTime := FieldByName('fvencim').AsDateTime;

                  if lSerie then   begin
                     QCarteraEfectos.parambyname('serie').AsString      := FieldByName('serie').AsString;
                     QCarteraEfectos.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                  end;

                  if lCondComercial then   begin
                     QCarteraEfectos.parambyname('comercial').AsString  :=
                        Copy(FieldByName('comercial').AsString, 1, 10);
                     QCarteraEfectos.parambyname('impcomision').AsFloat :=
                        RoundToDecimal(FieldByName('impcomision').AsFloat, 2, True);
                  end;
                  if FieldByName('debehaber').AsString = 'D' then   begin
                     if not empty(cFactura) then   begin
                        QCarteraEfectos.parambyname('factclient').AsString := cFactura;
                     end
                     else begin
                        QCarteraEfectos.parambyname('factclient').AsString :=
                           IntToStr((FieldByName('anualfactu').AsInteger * 10000) +
                           FieldByName('numfactu').AsInteger);
                     end;

                     if DMRef.QParametros.FieldByName('DESCCLI_CARTERAEFECTOS').AsString = 'S' then   begin
                        QSubcuentas.Close;
                        QSubcuentas.ParamByName('SUBCUENTA').AsString := FieldByName('subcta').AsString;
                        QSubcuentas.ExecQuery;
                        if not QSubcuentas.EOF then   begin
                           QCarteraEfectos.parambyname('concepto').AsString := QSubcuentas.FieldByName('DESCRIPCION').AsString;
                        end
                        else begin
                           if lSerie then   begin
                              QCarteraEfectos.parambyname('concepto').AsString :=
                                 'COBRO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                                 Trim(QCarteraEfectos.parambyname('ejercicio').AsString) + '/' +
                                 Trim(QCarteraEfectos.parambyname('serie').AsString) + '-' +
                                 Trim(QCarteraEfectos.parambyname('factclient').AsString);
                           end
                           else begin
                              QCarteraEfectos.parambyname('concepto').AsString :=
                                 'COBRO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                                 Trim(QCarteraEfectos.parambyname('factclient').AsString);
                           end;
                        end;
                     end
                     else begin
                        if lSerie then   begin
                           QCarteraEfectos.parambyname('concepto').AsString :=
                              'COBRO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                              Trim(QCarteraEfectos.parambyname('ejercicio').AsString) + '/' +
                              Trim(QCarteraEfectos.parambyname('serie').AsString) + '-' +
                              Trim(QCarteraEfectos.parambyname('factclient').AsString);
                        end
                        else begin
                           QCarteraEfectos.parambyname('concepto').AsString :=
                              'COBRO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                              Trim(QCarteraEfectos.parambyname('factclient').AsString);
                        end;
                     end;
                  end
                  else begin
                     QCarteraEfectos.parambyname('situacion').AsString := 'A';
                     if not empty(cFactura) then   begin
                        QCarteraEfectos.parambyname('factproveedor').AsString := cFactura;
                     end
                     else begin
                        QCarteraEfectos.parambyname('factproveedor').AsString :=
                           FieldByName('anualfactu').AsString + '/' + FieldByName('factprove').AsString;
                     end;

                     if DMRef.QParametros.FieldByName('DESCPROV_CARTERAEFECTOS').AsString = 'S' then   begin
                        QSubcuentas.Close;
                        QSubcuentas.ParamByName('SUBCUENTA').AsString := FieldByName('subcta').AsString;
                        QSubcuentas.ExecQuery;
                        if not QSubcuentas.EOF then   begin
                           QCarteraEfectos.parambyname('concepto').AsString := QSubcuentas.FieldByName('DESCRIPCION').AsString;
                        end
                        else begin
                           if lSerie then   begin
                              QCarteraEfectos.parambyname('concepto').AsString :=
                                 'PAGO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                                 Trim(QCarteraEfectos.parambyname('ejercicio').AsString) + '/' +
                                 Trim(QCarteraEfectos.parambyname('serie').AsString) + '-' +
                                 Trim(QCarteraEfectos.parambyname('factproveedor').AsString);
                           end
                           else begin
                              QCarteraEfectos.parambyname('concepto').AsString :=
                                 'PAGO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                                 Trim(QCarteraEfectos.parambyname('factproveedor').AsString);
                           end;
                        end;
                     end
                     else begin
                        if lSerie then   begin
                           QCarteraEfectos.parambyname('concepto').AsString :=
                              'PAGO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                              Trim(QCarteraEfectos.parambyname('ejercicio').AsString) + '/' +
                              Trim(QCarteraEfectos.parambyname('serie').AsString) + '-' +
                              Trim(QCarteraEfectos.parambyname('factproveedor').AsString);
                        end
                        else begin
                           QCarteraEfectos.parambyname('concepto').AsString :=
                              'PAGO VTO. ' + FieldByName('fvencim').AsString + ' FACT. ' +
                              Trim(QCarteraEfectos.parambyname('factproveedor').AsString);
                        end;
                     end;
                  end;
                  QCarteraEfectos.ExecQuery;
                  QCarteraEfectos.Transaction.CommitRetaining;
               end;
            end
            else begin
               // Seleccion de campo de facturas 
               if (findfield('numfactu') <> nil) and (FieldByName('numfactu').AsString <> '') then
               begin
                  cFactura := FieldByName('NumFactu').AsString;
               end
               else begin
                  cFactura := FieldByName('Factura').AsString;
               end;

               // Facturas de Ventas o Compras
               // Buscar si ya se ha enlazado anteriormente
               // 'DEBEHABER;NUMEROFACTURA;SUBCUENTA'

               // DebeHaber = D -> Fact. Venta
               // Bqda por DEBEHABER;NUMEROFACTURA
               if FieldByName('DEBEHABER').AsString = 'D' then   begin
                  // El tipo de cuenta debe ser de cliente, por problemas en el 
                  // enlace de Facturas de sanca
                  QBuscaDiario.Close;
                  QBuscaDiario.SQL.Clear;
                  QBuscaDiario.SQL.Add('select d.asiento from diario d, cuentas c');
                  QBuscaDiario.SQL.Add(' where d.numerofactura=:numerofactura and d.debehaber=:debehaber');
                  if lSerie then begin
                     QBuscaDiario.SQL.Add(' and d.serie=:serie and d.ejercicio=:ejercicio');
                  end;
                  QBuscaDiario.SQL.Add(' and substr(d.subcuenta,1,3)=c.cuenta and c.tipocuenta="C" ');
                  QBuscaDiario.ParamByName('NUMEROFACTURA').AsString := cFactura;
                  if lSerie then   begin
                     QBuscaDiario.ParamByName('SERIE').AsString      := FieldByName('SERIE').AsString;
                     QBuscaDiario.ParamByName('EJERCICIO').AsInteger := FieldByName('EJERCICIO').AsInteger;
                  end;
                  QBuscaDiario.ParamByName('DEBEHABER').AsString := FieldByName('DEBEHABER').AsString;
                  QBuscaDiario.prepare;
                  QBuscaDiario.ExecQuery;
               end

               // DebeHaber = H -> Fact. Compra
               // Bqda por DEBEHABER;NUMEROFACTURA;SUBCUENTA
               else begin
                  QBuscaDiario.Close;
                  QBuscaDiario.SQL.Clear;
                  QBuscaDiario.SQL.Add('select asiento from diario');
                  QBuscaDiario.SQL.Add(' where subcuenta=:subcuenta and numerofactura=:numerofactura');
                  if lSerie then begin
                     QBuscaDiario.SQL.Add(' and d.serie=:serie and d.ejercicio=:ejercicio');
                  end;
                  QBuscaDiario.SQL.Add(' and debehaber=:debehaber');
                  QBuscaDiario.ParamByName('SUBCUENTA').AsString     := FieldByName('SUBCTA').AsString;
                  QBuscaDiario.ParamByName('NUMEROFACTURA').AsString := cFactura;
                  QBuscaDiario.ParamByName('DEBEHABER').AsString     := FieldByName('DEBEHABER').AsString;
                  if lSerie then   begin
                     QBuscaDiario.ParamByName('SERIE').AsString      := FieldByName('SERIE').AsString;
                     QBuscaDiario.ParamByName('EJERCICIO').AsInteger := FieldByName('EJERCICIO').AsInteger;
                  end;
                  QBuscaDiario.prepare;
                  QBuscaDiario.ExecQuery;
               end;

               if QBuscaDiario.FieldByName('asiento').AsInteger > 0 then   begin
                  // Error : Factura encontrada , se borra asiento
                  QBorraDiario.Close;
                  QBorraDiario.parambyname('asiento').AsInteger := QBuscaDiario.FieldByName('asiento').AsInteger;
                  QBorraDiario.ExecQuery;
                  QBorraDiario.transaction.commitretaining;
                  if DmRef.QParametros.FieldByName('GESTIONA_CARTERA_EFECTOS').AsString = 'S' then   begin
                     // Borrado de vencimientos
                     QBorraCartera.Close;
                     QBorraCartera.parambyname('factclient').AsString := cFactura;
                     QBorraCartera.parambyname('subcuenta').AsString  := FieldByName('subcta').AsString;
                     if lSerie then   begin
                        QBorraCartera.ParamByName('SERIE').AsString      := FieldByName('SERIE').AsString;
                        QBorraCartera.ParamByName('EJERCICIO').AsInteger := FieldByName('EJERCICIO').AsInteger;
                     end;
                     QBorraCartera.ExecQuery;
                     QBorraCartera.transaction.commitretaining;
                  end;
                  cPasado := 'B';
               end;
               // Final :Buscar si ya se ha enlazado anteriormente


               if (findfield('contrapartida') <> nil) and
                  (not empty(FieldByName('contrapartida').AsString))
               then   begin
                  QBuscaSubcuenta.Close;
                  QBuscaSubcuenta.parambyname('subcuenta').AsString :=
                     Trim(FieldByName('contrapartida').AsString);
                  QBuscaSubcuenta.ExecQuery;

                  // Buscar si la contrapartida Existe
                  if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then   begin
                     // Error : Contrapartida no encontrada
                     // Se da de alta
                     cPasado := 'G';

                     QInsertaSubcuenta.Close;
                     QInsertaSubcuenta.parambyname('subcuenta').AsString   :=
                        Trim(FieldByName('contrapartida').AsString);
                     QInsertaSubcuenta.parambyname('descripcion').AsString :=
                        'Creada en enlace contable';
                     QInsertaSubcuenta.parambyname('pais').AsString        := 'ES';
                     QInsertaSubcuenta.parambyname('direccion').AsString   := '';
                     QInsertaSubcuenta.parambyname('nif').AsString         := '';
                     QInsertaSubcuenta.parambyname('codpostal').AsString   := '';
                     QInsertaSubcuenta.parambyname('poblacion').AsString   := '';
                     QInsertaSubcuenta.parambyname('provincia').AsVariant  := null;
                     QInsertaSubcuenta.parambyname('telefono').AsString    := '';
                     QInsertaSubcuenta.parambyname('fax').AsString         := '';
                     QInsertaSubcuenta.ExecQuery;
                     QInsertaSubcuenta.Transaction.CommitRetaining;
                  end;
               end; // Final Error : Contrapartida no encontrada

               QBuscaSubcuenta.Close;
               QBuscaSubcuenta.parambyname('subcuenta').AsString :=
                  Trim(FieldByName('subcta').AsString);
               QBuscaSubcuenta.ExecQuery;

               // Buscar si la subcuenta Existe
               if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then   begin
                  // Error : Subcuenta no encontrada
                  // Se da de alta
                  cPasado := 'G';

                  // Buscar provincia
                  if (not lIGest) and (not FieldByName('PROVINCIA').IsNull) then   begin
                     QBuscaProvincia.Close;
                     QBuscaProvincia.ParamByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
                     QBuscaProvincia.Open;
                     if QBuscaProvincia.EOF then   begin
                        QInsProvincia.Close;
                        QInsProvincia.ParamByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
                        QInsProvincia.ParamByName('NOMBRE').AsString    := 'CREADO EN ENLACE CONTABLE';
                        QInsProvincia.ParamByName('CODIGO').AsString    := '';
                        QInsProvincia.ExecQuery;
                        QInsProvincia.Transaction.CommitRetaining;
                     end;
                     QBuscaProvincia.Close;
                  end;

                  QInsertaSubcuenta.Close;
                  QInsertaSubcuenta.parambyname('subcuenta').AsString   :=
                     Trim(FieldByName('subcta').AsString);
                  QInsertaSubcuenta.parambyname('descripcion').AsString :=
                     Copy(FieldByName('nombre').AsString, 1, 80);
                  QInsertaSubcuenta.parambyname('pais').AsString        := 'ES';
                  QInsertaSubcuenta.parambyname('direccion').AsString   :=
                     Copy(FieldByName('direccion').AsString, 1, 35);
                  QInsertaSubcuenta.parambyname('nif').AsString         :=
                     Copy(FieldByName('nif').AsString, 1, 20);
                  QInsertaSubcuenta.parambyname('codpostal').AsString   :=
                     Copy(FieldByName('codpostal').AsString, 1, 10);
                  QInsertaSubcuenta.parambyname('poblacion').AsString   :=
                     Copy(FieldByName('poblacion').AsString, 1, 60);

                  // Defecto para I-Gest q no tiene campo de provincia en el enlace
                  QInsertaSubcuenta.parambyname('provincia').AsVariant := null;
                  if not lIgest then   begin
                     if FieldByName('provincia').IsNull then   begin
                        QInsertaSubcuenta.parambyname('provincia').AsVariant := null;
                     end
                     else begin
                        QInsertaSubcuenta.parambyname('provincia').AsString :=
                           Copy(FieldByName('provincia').AsString, 1, 2);
                     end;
                  end;

                  QInsertaSubcuenta.parambyname('telefono').AsString :=
                     Copy(FieldByName('telefono').AsString, 1, 16);
                  QInsertaSubcuenta.parambyname('fax').AsString      :=
                     Copy(FieldByName('fax').AsString, 1, 16);
                  QInsertaSubcuenta.ExecQuery;
                  QInsertaSubcuenta.Transaction.CommitRetaining;
                  cComentario := Trim(FieldByName('nombre').AsString);

                  DMContaRef.RefrescarSubcuentas(FieldByName('SUBCTA').AsString);
               end; // Final Error : Subcuenta no encontrada
               QSubcuentas.Close;
               QSubcuentas.parambyname('subcuenta').AsString :=
                  Trim(FieldByName('subcta').AsString);
               QSubcuentas.ExecQuery;
               cComentario := Trim(QSubcuentas.FieldByName('Descripcion').AsString);

               // Si la subcuenta de enlace es la genérica de ventas / compras
               // se pone en comentario el nombre que viene del enlace.
               // Igual para el NIF .
               // Todo esto es para que salga en los listados.
               cNif := '';
               if (Trim(FieldByName('subcta').AsString) =
                  Trim(DmRef.QParametros.FieldByName('VGenerica').AsString)) or
                  (Trim(FieldByName('subcta').AsString) =
                  Trim(DmRef.QParametros.FieldByName('VGenericaC').AsString)) then   begin
                  cComentario := Trim(FieldByName('nombre').AsString);
                  cNif        := FieldByName('Nif').AsString;
               end;
               nAsiento := DMContaRef.ObtenerNumeroAsiento;

               Memo.Lines.Add(DateTimeToStr(FieldByName('fecha').AsDateTime) + ' - Factura: ' +
                  cFactura + ' - Subcuenta: ' + FieldByName('Subcta').AsString +
                  ' - Importe: ' + FormatFloat('###,###,##0.00', FieldByName('IMPORTE').AsFloat));

               // Apunte 1
               lCondCoste := ((FindField('centrocoste') <> nil) and (not
                  empty(FieldByName('centrocoste').AsString))) or ((FindField('ccoste') <> nil) and
                  (not empty(FieldByName('ccoste').AsString)));

               QDiario.Close;
               QDiario.Sql.Clear;
               QDiario.Sql.Add('INSERT INTO DIARIO(TIPOASIENTO, ASIENTO,APUNTE,MONEDA,SUBCUENTA,ID_CONCEPTOS,');
               QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,FECHA,NUMEROFACTURA,COMENTARIO,');
               QDiario.Sql.Add(' NIF');
               if lSerie then begin
                  QDiario.Sql.Add(',SERIE,EJERCICIO');
               end;
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',CUENTA_ANALITICA)');
               end;
               QDiario.Sql.Add('VALUES (:TIPOASIENTO, :ASIENTO,:APUNTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS,');
               QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:FECHA,:NUMEROFACTURA,');
               QDiario.Sql.Add(' :COMENTARIO,:NIF');
               if lSerie then begin
                  QDiario.Sql.Add(',:SERIE,:EJERCICIO');
               end;
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',:CUENTA_ANALITICA)');
               end;

               cContrapartida := QSubcuentas.FieldByName('contrapartida').AsString;
               if Trim(cContrapartida) = '0' then begin
                  cContrapartida := '';
               end;

               // Enlace de marcas de Diarsa
               if (findfield('contrapartida') <> nil) and
                  (not empty(FieldByName('contrapartida').AsString))
               then   begin
                  cContrapartida := FieldByName('contrapartida').AsString;
               end;

               if FieldByName('Debehaber').AsString = 'D' then   begin
                  TipoAsiento := ASIENTO_FACTURA_VENTA;
                  if (findfield('concepto') <> nil) and (FieldByName('concepto').AsString <> '') then
                  begin
                     cConcepto := FieldByName('Concepto').AsString;
                  end
                  else begin
                     cConcepto := DmRef.QParametros.FieldByName('CtoClientes').AsString;
                  end;
                  if empty(cContrapartida) then   begin
                     cContrapartida := DmRef.QParametros.FieldByName('Sctaventas').AsString;
                  end;
               end
               else begin
                  TipoAsiento := ASIENTO_FACTURA_COMPRA;
                  cConcepto   := DmRef.QParametros.FieldByName('CtoProveedores').AsString;
                  if empty(cContrapartida) then   begin
                     cContrapartida := DmRef.QParametros.FieldByName('SctaCompras').AsString;
                  end;
               end;


               if lCondCoste and (FindField('centrocoste') <> nil) and
                  (FieldByName('centrocoste').AsString <> '') then   begin
                  QDiario.parambyname('cuenta_analitica').AsString :=
                     FieldByName('centrocoste').AsString;
               end;

               if lCondCoste and (FindField('ccoste') <> nil) and
                  (FieldByName('ccoste').AsString <> '') then  // centro coste enlace Fact.agudo
               begin
                  QDiario.parambyname('cuenta_analitica').AsString :=
                     FieldByName('ccoste').AsString;
               end;

               if lSerie then   begin
                  QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                  QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
               end;

               QDiario.parambyname('asiento').AsInteger      := nAsiento;
               QDiario.parambyname('apunte').AsInteger       := 1;
               QDiario.ParamByName('TIPOASIENTO').AsInteger  := TipoAsiento;
               QDiario.parambyname('moneda').AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
               QDiario.parambyname('subcuenta').AsString     := Trim(FieldByName('subcta').AsString);
               QDiario.parambyname('id_conceptos').AsString  := cConcepto;
               QDiario.parambyname('debehaber').AsString     := FieldByName('Debehaber').AsString;
               QDiario.parambyname('importe').AsFloat        :=
                  RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
               QDiario.parambyname('contrapartida').AsString := cContrapartida;
               QDiario.parambyname('fecha').AsDateTime       := FieldByName('fecha').AsDateTime;
               QDiario.parambyname('numerofactura').AsString := cFactura;
               QDiario.parambyname('comentario').AsString    := Copy(cComentario, 1, 40);
               QDiario.parambyname('nif').AsString           := Copy(cNif, 1, 15);

               QDiario.ExecSql;
               QDiario.Transaction.CommitRetaining;
               // Final Apunte 1

               // Guardar en tabla en memoria
               QFichero.Insert;
               QFicheroASIENTO.AsInteger      := nAsiento;
               QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
               QFicheroAPUNTE.AsInteger       := 1;
               QFicheroSUBCUENTA.AsString     := FieldByName('subcta').AsString;
               QFicheroID_CONCEPTOS.AsString  := cConcepto;
               QFicheroDEBEHABER.AsString     := FieldByName('DEBEHABER').AsString;
               QFicheroIMPORTE.AsFloat        :=
                  RoundToDecimal(FieldByName('importe').AsFloat, 2, True);
               QFicheroNUMEROFACTURA.AsString := cFactura;
               QFicheroFECHA.AsDateTime       := FieldByName('FECHA').AsDateTime;
               QFicheroCOMENTARIO.AsString    := Copy(cComentario, 1, 40);
               QFicheroCONTRAPARTIDA.AsString := cContrapartida;
               QFicheroNIF.AsString           := Copy(cNif, 1, 15);
               if lSerie then   begin
                  QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
                  QFicheroSerie.AsString      := FieldByName('serie').AsString;
               end;
               if lCondCoste then   begin
                  QFicheroCUENTA_ANALITICA.AsString := Copy(FieldByName('centrocoste').AsString, 1, 10);
               end;
               QFicheroFECHAIMPRESION.AsDateTime := Date;
               QFichero.Post;


               // Apunte 2 - Subcuenta de IVA
               QDiario.Close;
               QDiario.Sql.Clear;
               QDiario.Sql.Add('INSERT INTO DIARIO(TIPOASIENTO, ASIENTO,APUNTE,MONEDA,SUBCUENTA,ID_CONCEPTOS,');
               QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,FECHA,NUMEROFACTURA,COMENTARIO,NIF,');
               if lSerie then begin
                  QDiario.Sql.Add('SERIE,EJERCICIO,');
               end;
               QDiario.Sql.Add(' RECARGO,IVA,BASEIMPONIBLE,CUOTAIVA,CUOTARECARGO');
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',CUENTA_ANALITICA)');
               end;
               QDiario.Sql.Add('VALUES (:TIPOASIENTO, :ASIENTO,:APUNTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS,');
               QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:FECHA,:NUMEROFACTURA,:COMENTARIO,:NIF,');
               if lSerie then begin
                  QDiario.Sql.Add(':SERIE,:EJERCICIO,');
               end;
               QDiario.Sql.Add(':RECARGO,:IVA,:BASEIMPONIBLE,:CUOTAIVA,:CUOTARECARGO');
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',:CUENTA_ANALITICA)');
               end;

               QDiario.parambyname('asiento').AsInteger     := nAsiento;
               QDiario.parambyname('apunte').AsInteger      := 2;
               QDiario.ParamByName('TIPOASIENTO').AsInteger := TipoAsiento;
               QDiario.parambyname('moneda').AsString       := Dmref.QParametros.FieldByName('Moneda').AsString;
               if lSerie then   begin
                  QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                  QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
               end;
               if FieldByName('DebeHaber').AsString = 'D' then   begin
                  QDiario.parambyname('debehaber').AsString := 'H';
               end
               else begin
                  QDiario.parambyname('debehaber').AsString := 'D';
               end;
               QDiario.parambyname('fecha').AsDateTime := FieldByName('fecha').AsDateTime;

               if RoundToDecimal(FieldByName('iva').AsFloat, 2, True) = 0 then   begin
                  QDiario.parambyname('subcuenta').AsString :=
                     DmRef.QParametros.FieldByName('SctaIvaExento').AsString;
                  // Tipos de Diarsa, se deberian parametrizar???
                  if findfield('TipoSinIva') <> nil then   begin
                     if FieldByName('TipoSinIva').AsString = 'C' then // Iva exento C.E.E.
                     begin
                        QDiario.parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SCTAIVAEXENTOCEE').AsString;
                     end
                     else
                     if FieldByName('TipoSinIva').AsString = 'I' then // Intereses
                     begin
                        QDiario.parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SCTAINTERESES').AsString;
                     end
                     else
                     if FieldByName('TipoSinIva').AsString = 'E' then // Exportaciones
                     begin
                        QDiario.parambyname('subcuenta').AsString := DmRef.QParametros.FieldByName('SCTAEXPORTACIONES').AsString;
                     end;
                  end;
                  QDiario.parambyname('id_conceptos').AsString :=
                     DmRef.QParametros.FieldByName('CtoIvaExento').AsString;
               end
               else begin
                  // Factura IVA Normal
                  if (findfield('cuotaRe') <> nil) and
                     (RoundToDecimal(findfield('cuotaRe').AsFloat, 2, True) <> 0) then        // Diarsa
                  begin
                     // Se pone primero la cuenta de iva normal y el tercer apunte sera el
                     // de la 700 y hare un apunte 4 con la subcuenta de Iva Repercutido
                     QDiario.parambyname('subcuenta').AsString    :=
                        DmRef.QParametros.FieldByName('SctaIvaNormal').AsString;
                     QDiario.parambyname('id_conceptos').AsString :=
                        DmRef.QParametros.FieldByName('CtoIvaNormal').AsString;
                  end
                  else begin
                     if FieldByName('iva').AsFloat = nTipo16 then   begin
                        // Factura IVA y Recargo Normal
                        if (FieldByName('recargo').AsFloat = nTipoRec4) then   begin
                           // Si hay recargo, solo puede ser una factura de ventas
                           QDiario.parambyname('subcuenta').AsString    :=
                              DmRef.QParametros.FieldByName('SctaRecNormal').AsString;
                           QDiario.parambyname('id_conceptos').AsString :=
                              DmRef.QParametros.FieldByName('CtoRecNormal').AsString;
                        end
                        else begin
                           if FieldByName('Debehaber').AsString = 'D' then   begin
                              // Ventas
                              QDiario.parambyname('subcuenta').AsString    :=
                                 DmRef.QParametros.FieldByName('SctaIvaNormal').AsString;
                              QDiario.parambyname('id_conceptos').AsString :=
                                 DmRef.QParametros.FieldByName('CtoIvaNormal').AsString;
                           end
                           else begin
                              // Compras
                              QDiario.parambyname('subcuenta').AsString    :=
                                 DmRef.QParametros.FieldByName('SctaIvaCNormal').AsString;
                              QDiario.parambyname('id_conceptos').AsString :=
                                 DmRef.QParametros.FieldByName('CtoIvaCNormal').AsString;
                           end;
                        end;
                     end;
                  end;  // If  nTipo16

                  // Factura IVA Reducido
                  if FieldByName('iva').AsFloat = nTipo7 then   begin
                     if FieldByName('Debehaber').AsString = 'D' then   begin
                        QDiario.parambyname('subcuenta').AsString    :=
                           DmRef.QParametros.FieldByName('SctaIvaReducido').AsString;
                        QDiario.parambyname('id_conceptos').AsString :=
                           DmRef.QParametros.FieldByName('CtoIvaReducido').AsString;
                     end
                     else begin
                        QDiario.parambyname('subcuenta').AsString    :=
                           DmRef.QParametros.FieldByName('SctaIvaCReducido').AsString;
                        QDiario.parambyname('id_conceptos').AsString :=
                           DmRef.QParametros.FieldByName('CtoIvaCReducido').AsString;
                     end;
                  end;  // If nTipo7

                  // Factura IVA y Recargo Reducido
                  if (FieldByName('iva').AsFloat = nTipo7) and
                     (FieldByName('recargo').AsFloat = nTipoRec1) then   begin
                     QDiario.parambyname('subcuenta').AsString    :=
                        DmRef.QParametros.FieldByName('SctaRecReducido').AsString;
                     QDiario.parambyname('id_conceptos').AsString :=
                        DmRef.QParametros.FieldByName('CtoRecReducido').AsString;
                  end;

                  // Factura IVA Super Reducido
                  if FieldByName('iva').AsFloat = nTipo4 then   begin
                     if FieldByName('debehaber').AsString = 'D' then   begin
                        QDiario.parambyname('subcuenta').AsString    :=
                           DmRef.QParametros.FieldByName('SctaIvaSuper').AsString;
                        QDiario.parambyname('id_conceptos').AsString :=
                           DmRef.QParametros.FieldByName('CtoIvaSuper').AsString;
                     end
                     else begin
                        QDiario.parambyname('subcuenta').AsString    :=
                           DmRef.QParametros.FieldByName('SctaIvaCSuper').AsString;
                        QDiario.parambyname('id_conceptos').AsString :=
                           DmRef.QParametros.FieldByName('CtoIvaCSuper').AsString;
                     end;
                  end;

                  // Factura IVA y Recargo SuperReducido
                  if (FieldByName('iva').AsFloat = nTipo4) and
                     (FieldByName('recargo').AsFloat = nTipoRec05) then   begin
                     QDiario.parambyname('subcuenta').AsString    :=
                        DmRef.QParametros.FieldByName('SctaRecSuper').AsString;
                     QDiario.parambyname('id_conceptos').AsString :=
                        DmRef.QParametros.FieldByName('CtoRecSuper').AsString;
                  end;
               end; // iva 0

               // Idea del Enlace si el recargo se incluye junto con el IVA.
               // Base Imponible
               // CuotaIva
               // CuotaRecargo
               // Importe = CuotaIva+CuotaRecargo
               // Iva = el % de iva, cuando lo hay, si no cero
               // Recargo = el % de recargo, cuando lo hay, si no cero
               // Total Factura=BaseImponible+Importe(=CuotaRecargo+CuotaIva)

               // Idea del Enlace si el recargo se pone como un apunte individualizado
               // que es el caso de Diarsa.
               // Base Imponible (solo la propia del recargo)
               // Cuota de Iva e IVA su valor
               // CuotaRecargo, su valor
               // Importe = CuotaRecargo
               // Total Factura, aparte del otro apunte con el IVA, en el caso de este
               // es BaseImponible+Importe(=CuotaRecargo)


               QDiario.parambyname('numerofactura').AsString := cFactura;
               QDiario.parambyname('baseimponible').AsFloat  :=
                  RoundToDecimal(FieldByName('baseimpo').AsFloat, 2, True);

               QDiario.parambyname('iva').AsFloat      := FieldByName('iva').AsFloat;
               // Cuota de IVA
               QDiario.parambyname('cuotaiva').AsFloat :=
                  RoundToDecimal(FieldByName('cuotaiva').AsFloat, 2, True);
               QDiario.parambyname('importe').AsFloat  :=
                  RoundToDecimal(FieldByName('cuotaiva').AsFloat, 2, True);

               // Hacer : Usar en los enlaces de gestión
               // Solo si no es diarsa o parametro recargo independiente
               if (DmRef.QParametros.FieldByName('Recargo').AsString <> 'S') then   begin
                  QDiario.parambyname('cuotaRecargo').AsFloat :=
                     RoundToDecimal(FieldByName('cuotarecargo').AsFloat, 2, True);
                  QDiario.parambyname('recargo').AsFloat      := FieldByName('recargo').AsFloat;
                  if (RoundToDecimal(FieldByName('cuotarecargo').AsFloat, 2, True) = 0) then   begin
                     QDiario.parambyname('recargo').AsFloat := 0;
                  end;
                  QDiario.ParamByName('IMPORTE').AsFloat :=
                     RoundToDecimal(FieldByName('CUOTAIVA').AsFloat, 2, True) +
                     RoundToDecimal(FieldByName('CUOTARECARGO').AsFloat, 2, True);
               end;
  {    else
       QDiario.parambyname('cuotaRecargo').asfloat:=
           RoundToDecimal((fieldbyname('BaseImpo').asfloat*
           fieldbyname('Recargo').asfloat) / 100,2,True);
    }
               QDiario.parambyname('contrapartida').AsString :=
                  Trim(FieldByName('subcta').AsString);
               QDiario.parambyname('comentario').AsString    := Copy(cComentario, 1, 40);
               QDiario.parambyname('nif').AsString           := Copy(cNif, 1, 15);

               if lCondCoste and (FindField('centrocoste') <> nil) and
                  (FieldByName('centrocoste').AsString <> '') then   begin
                  QDiario.parambyname('cuenta_analitica').AsString :=
                     FieldByName('centrocoste').AsString;
               end;
               if lCondCoste and (FindField('ccoste') <> nil) and
                  (FieldByName('ccoste').AsString <> '') then  // centro coste enlace Fact.agudo
               begin
                  QDiario.parambyname('cuenta_analitica').AsString :=
                     FieldByName('ccoste').AsString;
               end;


               // Guardar en tabla en memoria
               QFichero.Insert;
               QFicheroASIENTO.AsInteger     := nAsiento;
               QFicheroMONEDA.AsString       := Dmref.QParametros.FieldByName('Moneda').AsString;
               QFicheroAPUNTE.AsInteger      := 2;
               QFicheroSUBCUENTA.AsString    := QDiario.ParamByName('SUBCUENTA').AsString;
               QFicheroID_CONCEPTOS.AsString := QDiario.ParamByName('ID_CONCEPTOS').AsString;
               QFicheroDEBEHABER.AsString    := QDiario.ParamByName('DEBEHABER').AsString;
               QFicheroIMPORTE.AsFloat       := QDiario.ParamByName('IMPORTE').AsFloat;
               QFicheroNUMEROFACTURA.AsString := QDiario.ParamByName('NUMEROFACTURA').AsString;
               QFicheroFECHA.AsDateTime      := QDiario.ParamByName('FECHA').AsDateTime;
               QFicheroCOMENTARIO.AsString   := QDiario.ParamByName('COMENTARIO').AsString;
               QFicheroCONTRAPARTIDA.AsString := QDiario.ParamByName('CONTRAPARTIDA').AsString;
               QFicheroNIF.AsString          := QDiario.ParamByName('NIF').AsString;
               QFicheroRECARGO.AsFloat       := QDiario.ParamByName('RECARGO').AsFloat;
               QFicheroIVA.AsFloat           := QDiario.ParamByName('IVA').AsFloat;
               QFicheroBASEIMPONIBLE.AsFloat := QDiario.ParamByName('BASEIMPONIBLE').AsFloat;
               QFicheroCUOTAIVA.AsFloat      := QDiario.ParamByName('CUOTAIVA').AsFloat;
               QFicheroCUOTARECARGO.AsFloat  := QDiario.ParamByName('CUOTARECARGO').AsFloat;
               if lSerie then   begin
                  QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
                  QFicheroSerie.AsString      := FieldByName('serie').AsString;
               end;
               if lCondCoste then   begin
                  QFicheroCUENTA_ANALITICA.AsString := QDiario.ParamByName('CUENTA_ANALITICA').AsString;
               end;
               QFicheroFECHAIMPRESION.AsDateTime := Date;
               QFichero.Post;

               QDiario.ExecSql;
               QDiario.Transaction.CommitRetaining;
               // Final Apunte 2

               nApunte := 3;

               if (DmRef.QParametros.FieldByName('recargo').AsString = 'S') and
                  (findfield('cuotaRe') <> nil) and
                  (RoundToDecimal(findfield('cuotaRe').AsFloat, 2, True) <> 0) then   begin
                  // Apunte 3
                  // Apunte Recargo Equivalencia, independiente, Diarsa
                  QDiario.Close;
                  QDiario.Sql.Clear;
                  QDiario.Sql.Add('INSERT INTO DIARIO(TIPOASIENTO, ASIENTO,APUNTE,MONEDA,SUBCUENTA,ID_CONCEPTOS,');
                  QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,FECHA,NUMEROFACTURA,COMENTARIO,');
                  QDiario.Sql.Add(' NIF,RECARGO,BASEIMPONIBLE,CUOTARECARGO');
                  if lSerie then begin
                     QDiario.Sql.Add(',SERIE,EJERCICIO');
                  end;
                  if not lCondCoste then begin
                     QDiario.Sql.Add(')');
                  end
                  else begin
                     QDiario.Sql.Add(',CUENTA_ANALITICA)');
                  end;
                  QDiario.Sql.Add('VALUES (:TIPOASIENTO, :ASIENTO,:APUNTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS,');
                  QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:FECHA,:NUMEROFACTURA,');
                  QDiario.Sql.Add(' :COMENTARIO,:NIF,:RECARGO,:BASEIMPONIBLE,:CUOTARECARGO');
                  if lSerie then begin
                     QDiario.Sql.Add(',:SERIE,:EJERCICIO');
                  end;
                  if not lCondCoste then begin
                     QDiario.Sql.Add(')');
                  end
                  else begin
                     QDiario.Sql.Add(',:CUENTA_ANALITICA)');
                  end;

                  QDiario.parambyname('asiento').AsInteger     := nAsiento;
                  QDiario.parambyname('apunte').AsInteger      := nApunte;
                  QDiario.ParamByName('TIPOASIENTO').AsInteger := TipoAsiento;
                  Inc(nApunte);
                  QDiario.parambyname('moneda').AsString       := Dmref.QParametros.FieldByName('Moneda').AsString;
                  QDiario.parambyname('subcuenta').AsString    :=
                     DmRef.QParametros.FieldByName('SctaRecNormal').AsString;
                  QDiario.parambyname('id_conceptos').AsString :=
                     DmRef.QParametros.FieldByName('CtoRecNormal').AsString;
                  QDiario.parambyname('debehaber').AsString    := 'H';
                  QDiario.parambyname('fecha').AsDateTime      := FieldByName('fecha').AsDateTime;

                  QDiario.parambyname('cuotarecargo').AsFloat :=
                     RoundToDecimal(FieldByName('cuotare').AsFloat, 2, True);
                  QDiario.parambyname('importe').AsFloat      :=
                     RoundToDecimal(FieldByName('cuotare').AsFloat, 2, True);

                  QDiario.parambyname('baseimponible').AsFloat  :=
                     RoundToDecimal(FieldByName('basere').AsFloat, 2, True);
                  QDiario.parambyname('recargo').AsFloat        := FieldByName('recargo').AsFloat;
                  QDiario.parambyname('numerofactura').AsString := cFactura;
                  if lSerie then   begin
                     QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                     QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
                  end;
                  QDiario.parambyname('contrapartida').AsString := Trim(FieldByName('subcta').AsString);
                  QDiario.parambyname('comentario').AsString    := Copy(cComentario, 1, 40);
                  QDiario.parambyname('nif').AsString           := Copy(cNif, 1, 15);

                  if lCondCoste and (FindField('centrocoste') <> nil) and
                     (FieldByName('centrocoste').AsString <> '') then   begin
                     QDiario.parambyname('cuenta_analitica').AsString :=
                        Copy(FieldByName('centrocoste').AsString, 1, 10);
                  end;

                  QDiario.ExecSql;
                  QDiario.Transaction.CommitRetaining;

                  // Guardar en tabla en memoria
                  QFichero.Insert;
                  QFicheroASIENTO.AsInteger      := nAsiento;
                  QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
                  QFicheroAPUNTE.AsInteger       := 3;
                  QFicheroSUBCUENTA.AsString     := DmRef.QParametros.FieldByName('SctaRecNormal').AsString;
                  QFicheroID_CONCEPTOS.AsString  := DmRef.QParametros.FieldByName('CtoRecNormal').AsString;
                  QFicheroDEBEHABER.AsString     := 'H';
                  QFicheroIMPORTE.AsFloat        :=
                     RoundToDecimal(FieldByName('cuotare').AsFloat, 2, True);
                  QFicheroNUMEROFACTURA.AsString := cFactura;
                  QFicheroFECHA.AsDateTime       := FieldByName('fecha').AsDateTime;
                  QFicheroCOMENTARIO.AsString    := Copy(cComentario, 1, 40);
                  QFicheroCONTRAPARTIDA.AsString := Trim(FieldByName('subcta').AsString);
                  QFicheroNIF.AsString           := cNif;
                  QFicheroRECARGO.AsFloat        := FieldByName('recargo').AsFloat;
                  QFicheroBASEIMPONIBLE.AsFloat  :=
                     RoundToDecimal(FieldByName('basere').AsFloat, 2, True);
                  QFicheroCUOTARECARGO.AsFloat   :=
                     RoundToDecimal(FieldByName('cuotare').AsFloat, 2, True);
                  if lSerie then   begin
                     QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
                     QFicheroSerie.AsString      := FieldByName('serie').AsString;
                  end;
                  if lCondCoste and (FindField('centrocoste') <> nil) and
                     (FieldByName('centrocoste').AsString <> '') then   begin
                     QFicheroCUENTA_ANALITICA.AsString := Copy(FieldByName('centrocoste').AsString, 1, 10);
                  end;
                  QFicheroFECHAIMPRESION.AsDateTime := Date;
                  QFichero.Post;
               end;

               // Apunte 3 o 4
               QDiario.Close;
               QDiario.Sql.Clear;
               QDiario.Sql.Add('INSERT INTO DIARIO(TIPOASIENTO, ASIENTO,APUNTE,MONEDA,SUBCUENTA,ID_CONCEPTOS,');
               QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,FECHA,NUMEROFACTURA,COMENTARIO,');
               QDiario.Sql.Add(' NIF,BASEIMPONIBLE');
               if lSerie then begin
                  QDiario.Sql.Add(',SERIE,EJERCICIO');
               end;
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',CUENTA_ANALITICA)');
               end;
               QDiario.Sql.Add('VALUES (:TIPOASIENTO, :ASIENTO,:APUNTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS,');
               QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:FECHA,:NUMEROFACTURA,');
               QDiario.Sql.Add(' :COMENTARIO,:NIF,:BASEIMPONIBLE');
               if lSerie then begin
                  QDiario.Sql.Add(',:SERIE,:EJERCICIO');
               end;
               if not lCondCoste then begin
                  QDiario.Sql.Add(')');
               end
               else begin
                  QDiario.Sql.Add(',:CUENTA_ANALITICA)');
               end;

               QDiario.parambyname('asiento').AsInteger     := nAsiento;
               QDiario.parambyname('apunte').AsInteger      := nApunte;
               QDiario.ParamByName('TIPOASIENTO').AsInteger := TipoAsiento;
               Inc(nApunte);
               QDiario.parambyname('moneda').AsString    := Dmref.QParametros.FieldByName('Moneda').AsString;
               QDiario.parambyname('subcuenta').AsString := cContrapartida;
               if FieldByName('DebeHaber').AsString = 'D' then   begin
                  QDiario.parambyname('debehaber').AsString := 'H';
               end
               else begin
                  QDiario.parambyname('debehaber').AsString := 'D';
               end;
               QDiario.parambyname('fecha').AsDateTime := FieldByName('fecha').AsDateTime;
               // Descuento de Diarsa
               if (FindField('impdescu') <> nil) then   begin
                  QDiario.parambyname('importe').AsFloat :=
                     RoundToDecimal(FieldByName('baseimpo').AsFloat + FieldByName('impdescu').AsFloat, 2, True);
               end
               else begin
                  QDiario.parambyname('importe').AsFloat :=
                     RoundToDecimal(FieldByName('baseimpo').AsFloat, 2, True);
               end;

               QDiario.parambyname('numerofactura').AsString := cFactura;
               if lSerie then   begin
                  QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                  QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
               end;

               if FieldByName('DebeHaber').AsString = 'D' then   begin
                  if (findfield('concepto') <> nil) and (FieldByName('concepto').AsString <> '') then
                  begin
                     QDiario.parambyname('id_conceptos').AsString := FieldByName('Concepto').AsString;
                  end
                  else begin
                     QDiario.parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoVentas').AsString;
                  end;
               end
               else begin
                  QDiario.parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoCompras').AsString;
               end;

               QDiario.parambyname('contrapartida').AsString :=
                  Trim(FieldByName('subcta').AsString);
               QDiario.parambyname('comentario').AsString    := Copy(cComentario, 1, 40);
               QDiario.parambyname('nif').AsString           := Copy(cNif, 1, 15);

               if lCondCoste and (FindField('centrocoste') <> nil) and
                  (FieldByName('centrocoste').AsString <> '') then   begin
                  QDiario.parambyname('cuenta_analitica').AsString :=
                     Copy(FieldByName('centrocoste').AsString, 1, 10);
               end;
               if lCondCoste and (FindField('ccoste') <> nil) and
                  (FieldByName('ccoste').AsString <> '') then  // centro coste enlace Fact.agudo
               begin
                  QDiario.parambyname('cuenta_analitica').AsString := Copy(FieldByName('ccoste').AsString, 1, 10);
               end;

               // Guardar en tabla en memoria
               QFichero.Insert;
               QFicheroASIENTO.AsInteger      := nAsiento;
               QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
               QFicheroAPUNTE.AsInteger       := QDiario.ParamByName('APUNTE').AsInteger;
               QFicheroSUBCUENTA.AsString     := QDiario.ParamByName('SUBCUENTA').AsString;
               QFicheroID_CONCEPTOS.AsString  := QDiario.ParamByName('ID_CONCEPTOS').AsString;
               QFicheroDEBEHABER.AsString     := QDiario.ParamByName('DEBEHABER').AsString;
               QFicheroIMPORTE.AsFloat        := QDiario.ParamByName('IMPORTE').AsFloat;
               QFicheroNUMEROFACTURA.AsString := QDiario.ParamByName('NUMEROFACTURA').AsString;
               QFicheroFECHA.AsDateTime       := QDiario.ParamByName('FECHA').AsDateTime;
               QFicheroCOMENTARIO.AsString    := QDiario.ParamByName('COMENTARIO').AsString;
               QFicheroCONTRAPARTIDA.AsString := QDiario.ParamByName('CONTRAPARTIDA').AsString;
               QFicheroNIF.AsString           := QDiario.ParamByName('NIF').AsString;
               QFicheroBASEIMPONIBLE.AsFloat  := QDiario.ParamByName('BASEIMPONIBLE').AsFloat;
               if lSerie then   begin
                  QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
                  QFicheroSerie.AsString      := FieldByName('serie').AsString;
               end;
               if lCondCoste then   begin
                  QFicheroCUENTA_ANALITICA.AsString := QDiario.ParamByName('CUENTA_ANALITICA').AsString;
               end;
               QFicheroFECHAIMPRESION.AsDateTime := Date;
               QFichero.Post;

               QDiario.ExecSql;
               QDiario.Transaction.CommitRetaining;


               if (FindField('impdescu') <> nil) and (FieldByName('impdescu').AsFloat <> 0) then   begin
                  // Apunte de descuento
                  QDiario.Close;
                  QDiario.Sql.Clear;
                  QDiario.Sql.Add('INSERT INTO DIARIO(TIPOASIENTO, ASIENTO,APUNTE,MONEDA,SUBCUENTA,ID_CONCEPTOS,');
                  QDiario.Sql.Add(' DEBEHABER,IMPORTE,CONTRAPARTIDA,FECHA,NUMEROFACTURA,COMENTARIO,');
                  QDiario.Sql.Add(' NIF,BASEIMPONIBLE');
                  if lSerie then begin
                     QDiario.Sql.Add(',SERIE,EJERCICIO');
                  end;
                  if not lCondCoste then begin
                     QDiario.Sql.Add(')');
                  end
                  else begin
                     QDiario.Sql.Add(',CUENTA_ANALITICA)');
                  end;
                  QDiario.Sql.Add('VALUES (:TIPOASIENTO, :ASIENTO,:APUNTE,:MONEDA,:SUBCUENTA,:ID_CONCEPTOS,');
                  QDiario.Sql.Add(' :DEBEHABER,:IMPORTE,:CONTRAPARTIDA,:FECHA,:NUMEROFACTURA,');
                  QDiario.Sql.Add(' :COMENTARIO,:NIF,:BASEIMPONIBLE');
                  if lSerie then begin
                     QDiario.Sql.Add(',:SERIE,:EJERCICIO');
                  end;
                  if not lCondCoste then begin
                     QDiario.Sql.Add(')');
                  end
                  else begin
                     QDiario.Sql.Add(',:CUENTA_ANALITICA)');
                  end;

                  QDiario.parambyname('asiento').AsInteger      := nAsiento;
                  QDiario.parambyname('apunte').AsInteger       := nApunte;
                  QDiario.ParamByName('TIPOASIENTO').AsInteger  := TipoAsiento;
                  //Inc(nApunte);
                  QDiario.parambyname('moneda').AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
                  // Hacer: Poner en parametros un campo para la subcuenta de descuentos
                  QDiario.parambyname('subcuenta').AsString     := '7090000';
                  QDiario.parambyname('debehaber').AsString     := 'D';
                  QDiario.parambyname('fecha').AsDateTime       := FieldByName('fecha').AsDateTime;
                  QDiario.parambyname('importe').AsFloat        :=
                     RoundToDecimal(FieldByName('impdescu').AsFloat, 2, True);
                  QDiario.parambyname('numerofactura').AsString := cFactura;
                  if lSerie then   begin
                     QDiario.parambyname('ejercicio').AsInteger := FieldByName('ejercicio').AsInteger;
                     QDiario.parambyname('serie').AsString      := FieldByName('serie').AsString;
                  end;
                  QDiario.parambyname('id_conceptos').AsString  :=
                     DmRef.QParametros.FieldByName('CtoVentas').AsString;
                  QDiario.parambyname('comentario').AsString    := Copy(cComentario, 1, 40);
                  QDiario.parambyname('nif').AsString           := cNif;
                  QDiario.parambyname('contrapartida').AsString :=
                     Trim(FieldByName('subcta').AsString);

                  // Guardar en tabla en memoria
                  QFichero.Insert;
                  QFicheroASIENTO.AsInteger      := nAsiento;
                  QFicheroMONEDA.AsString        := Dmref.QParametros.FieldByName('Moneda').AsString;
                  QFicheroAPUNTE.AsInteger       := QDiario.ParamByName('APUNTE').AsInteger;
                  QFicheroSUBCUENTA.AsString     := QDiario.ParamByName('SUBCUENTA').AsString;
                  QFicheroID_CONCEPTOS.AsString  := QDiario.ParamByName('ID_CONCEPTOS').AsString;
                  QFicheroDEBEHABER.AsString     := QDiario.ParamByName('DEBEHABER').AsString;
                  QFicheroIMPORTE.AsFloat        := QDiario.ParamByName('IMPORTE').AsFloat;
                  QFicheroNUMEROFACTURA.AsString := QDiario.ParamByName('NUMEROFACTURA').AsString;
                  QFicheroFECHA.AsDateTime       := QDiario.ParamByName('FECHA').AsDateTime;
                  QFicheroCOMENTARIO.AsString    := QDiario.ParamByName('COMENTARIO').AsString;
                  QFicheroCONTRAPARTIDA.AsString := QDiario.ParamByName('CONTRAPARTIDA').AsString;
                  QFicheroNIF.AsString           := QDiario.ParamByName('NIF').AsString;
                  QFicheroBASEIMPONIBLE.AsFloat  := QDiario.ParamByName('BASEIMPONIBLE').AsFloat;
                  if lSerie then   begin
                     QFicheroEjercicio.AsInteger := FieldByName('ejercicio').AsInteger;
                     QFicheroSerie.AsString      := FieldByName('serie').AsString;
                  end;
                  if lCondCoste then   begin
                     QFicheroCUENTA_ANALITICA.AsString := QDiario.ParamByName('CUENTA_ANALITICA').AsString;
                  end;
                  QFicheroFECHAIMPRESION.AsDateTime := Date;
                  QFichero.Post;

                  QDiario.ExecSql;
                  QDiario.Transaction.CommitRetaining;
               end;
            end;
            // Actualizar pasado
            Edit;
            FieldByName('pasado').AsString := cPasado;
            Post;
         end;
         Next;
      end;
   end;
end;

procedure TWEnlaceContable.BtnEdtImprimirClick(Sender: TObject);
var
   FechaInicial, FechaFinal: TDateTime;
begin
   // Necesarios para el informe
   PonerTipoConta('T');
   gvMonedaListado  := DMRef.QParametros.FieldByName('MONEDA').AsString;
   gvFormatoOficial := False;

   if not QFichero.IsEmpty then  begin
      QFichero.IndexName := 'FECHA';
      QFichero.First;
      FechaInicial := QFicheroFECHA.AsDateTime;
      QFichero.Last;
      FechaFinal := QFicheroFECHA.AsDateTime;
      QFichero.First;
      while not QFichero.EOF do begin
         QFichero.Edit;
         QFicheroFECHAINICIAL.AsDateTime := FechaInicial;
         QFicheroFECHAFINAL.AsDateTime   := FechaFinal;
         QFichero.Post;
         QFichero.Next;
      end;
      if gOrden.ItemIndex = 0 then   begin
         QFichero.IndexName := 'ASIENTO';
      end
      else begin
         QFichero.IndexName := 'FECHA';
      end;
      QFichero.First;
   end;
   FormPrincipal.LanzarListado('LAsientos.rtm', SFichero, DMRef.QParametros.FieldByName('MONEDA').AsString);
end;

procedure TWEnlaceContable.QFicheroCalcFields(DataSet: TDataSet);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInfSubcta, SQL do begin
      Close;
      ParamByName('SUBCUENTA').AsString := QFicheroSUBCUENTA.AsString;
      Open;
      if not EOF then   begin
         QFicheroDESCSUBCUENTA.AsString := FieldByName('DESCRIPCION').AsString;
      end;
   end;

   QFicheroDESCAPUNTE.AsString := QFicheroCOMENTARIO.AsString;

   if QFicheroDEBEHABER.AsString = 'D' then   begin
      QFicheroDEBE.AsFloat := QFicheroIMPORTE.AsFloat;
   end
   else begin
      QFicheroHABER.AsFloat := QFicheroIMPORTE.AsFloat;
   end;
end;

procedure TWEnlaceContable.EnlaceSubcuentas;
var
   lIGest: Boolean;
begin

   lIgest := (TEnlace.findfield('Aplicacion') <> nil) and
      (TEnlace.FieldByName('Aplicacion').AsString = 'I');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaProvincia, SQL do begin
      Close;
      Clear;
      Add('SELECT * FROM PROVINCIAS WHERE PROVINCIA = :PROVINCIA');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsProvincia, SQL do begin
      Close;
      Clear;
      Add('INSERT INTO PROVINCIAS (PROVINCIA, NOMBRE, CODIGO)');
      Add('VALUES (:PROVINCIA, :NOMBRE, :CODIGO)');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('select count(*) as cuantos from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('insert into subctas (subcuenta,descripcion,pais,direccion,nif,codpostal,');
      Add(' poblacion,');
      if not lIGest then begin
         Add(' provincia,');
      end;
      Add('telefono,fax,obsoleto)');
      Add('values(:subcuenta,:descripcion,"ES",:direccion,:nif,:codpostal,');
      Add(' :poblacion,');
      if not lIgest then begin
         Add(' :provincia,');
      end;
      Add(' :telefono,:fax, "N") ');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QModificaSubcuenta, SQL do begin
      Close;
      Clear;
      Add('update subctas set descripcion=:descripcion,direccion=:direccion,nif=:nif,codpostal=:codpostal,');
      Add(' poblacion=:poblacion,telefono=:telefono,fax=:fax, pais="ES" ');
      if not lIgest then begin
         Add(' ,provincia=:provincia');
      end;
      Add('where subcuenta=:subcuenta');
      prepare;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TEnlace do begin
      // if fieldbyname('pasado').asstring<>'S' then
      // begin
      // Buscar provincia
      if (not lIGest) and (not FieldByName('PROVINCIA').IsNull) then   begin
         QBuscaProvincia.Close;
         QBuscaProvincia.ParamByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
         QBuscaProvincia.Open;
         if QBuscaProvincia.EOF then   begin
            QInsProvincia.Close;
            QInsProvincia.ParamByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
            QInsProvincia.ParamByName('NOMBRE').AsString    := 'CREADO EN ENLACE CONTABLE';
            QInsProvincia.ParamByName('CODIGO').AsString    := '';
            QInsProvincia.ExecQuery;
            QInsProvincia.Transaction.CommitRetaining;
         end;
         QBuscaProvincia.Close;
      end;

      // Buscar subcuenta
      QBuscaSubcuenta.Close;
      QBuscaSubcuenta.parambyname('subcuenta').AsString := FieldByName('subcta').AsString;
      QBuscaSubcuenta.ExecQuery;
      if QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0 then   begin
         // Modificar
         QModificaSubcuenta.parambyname('subcuenta').AsString   :=
            Trim(FieldByName('subcta').AsString);
         QModificaSubcuenta.parambyname('descripcion').AsString :=
            Copy(FieldByName('nombre').AsString, 1, 80);
         QModificaSubcuenta.parambyname('direccion').AsString   :=
            Copy(FieldByName('direccion').AsString, 1, 35);
         QModificaSubcuenta.parambyname('nif').AsString         :=
            Copy(FieldByName('nif').AsString, 1, 20);
         QModificaSubcuenta.parambyname('codpostal').AsString   :=
            Copy(FieldByName('codpostal').AsString, 1, 10);
         QModificaSubcuenta.parambyname('poblacion').AsString   :=
            Copy(FieldByName('poblacion').AsString, 1, 60);

         if not lIgest then   begin
            if FieldByName('provincia').IsNull then   begin
               QModificaSubcuenta.parambyname('provincia').AsVariant := null;
            end
            else begin
               QModificaSubcuenta.parambyname('provincia').AsString :=
                  Copy(FieldByName('provincia').AsString, 1, 2);
            end;
         end;

         QModificaSubcuenta.parambyname('telefono').AsString :=
            Copy(FieldByName('telefono').AsString, 1, 16);
         QModificaSubcuenta.parambyname('fax').AsString      :=
            Copy(FieldByName('fax').AsString, 1, 16);
         QModificaSubcuenta.ExecQuery;
         QModificaSubcuenta.Transaction.CommitRetaining;
      end
      else begin
         // Crear
         QInsertaSubcuenta.Close;
         QInsertaSubcuenta.parambyname('subcuenta').AsString   :=
            Trim(FieldByName('subcta').AsString);
         QInsertaSubcuenta.parambyname('descripcion').AsString :=
            Copy(FieldByName('nombre').AsString, 1, 80);
         QInsertaSubcuenta.parambyname('direccion').AsString   :=
            Copy(FieldByName('direccion').AsString, 1, 35);
         QInsertaSubcuenta.parambyname('nif').AsString         :=
            Copy(FieldByName('nif').AsString, 1, 20);
         QInsertaSubcuenta.parambyname('codpostal').AsString   :=
            Copy(FieldByName('codpostal').AsString, 1, 10);
         QInsertaSubcuenta.parambyname('poblacion').AsString   :=
            Copy(FieldByName('poblacion').AsString, 1, 60);

         if not lIgest then   begin
            if FieldByName('provincia').IsNull then   begin
               QInsertaSubcuenta.parambyname('provincia').AsVariant := null;
            end
            else begin
               QInsertaSubcuenta.parambyname('provincia').AsString :=
                  Copy(FieldByName('provincia').AsString, 1, 2);
            end;
         end;

         QInsertaSubcuenta.parambyname('telefono').AsString :=
            Copy(FieldByName('telefono').AsString, 1, 16);
         QInsertaSubcuenta.parambyname('fax').AsString      :=
            Copy(FieldByName('fax').AsString, 1, 16);
         QInsertaSubcuenta.ExecQuery;
         QInsertaSubcuenta.Transaction.CommitRetaining;
      end;
      // Actualizar pasado
 {  Edit;
   fieldbyname('pasado').asstring:='S';
   Post;
  end; }
   end;
end;

end.
