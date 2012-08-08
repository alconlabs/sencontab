unit UVencimientos;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImgBtn,
     Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSQL, IBTableSet, jpeg, Mask, Messages,
     navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, 
     WinProcs, WinTypes, Wwdatsrc, wwdbdatetimepicker, Wwdbgrid, Wwdbigrd, wwdblook, Wwkeycb, CustomView;

type
   TWVencimientos = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      Label3:         TLabel;
      Panel1:         TPanel;
      BtnPermAniadir: TfcImageBtn;
      BtnPermBorrar:  TfcImageBtn;
      BtnPermGuardar: TfcImageBtn;
      BtnPermCancelar: TfcImageBtn;
      QFichero:       TClientDataSet;
      SFichero:       TDataSource;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel5:         TPanel;
      Panel4:         TPanel;
      Navegador:      TDBNavegadorNotarios;
      PanelSombra:    TPanel;
      Grid:           TwwDBGrid;
      eImporte:       TOvcDbNumericField;
      Label6:         TLabel;
      QFicheroIMPORTEFACTURA: TFloatField;
      QFicheroNUMERO: TSmallintField;
      QFicheroFVENCIMIENTO: TDateTimeField;
      QFicheroIMPORTE: TFloatField;
      eDescripcion:   TOvcDbPictureField;
      eSubCuenta:     TOvcDbPictureField;
      Label2:         TLabel;
      QFicheroSUBCUENTA: TStringField;
      QFicheroDESCRIPCION: TStringField;
      Label1:         TLabel;
      eFormaPago:     TOvcDbPictureField;
      eFormaPagoDesc: TOvcDbPictureField;
      QFicheroFORMAPAGO: TStringField;
      QFicheroDESCFORMAPAGO: TStringField;
      Label4:         TLabel;
      FiltroFechaDesde: TwwDBDateTimePicker;
      QFicheroFEmision: TDateField;
      Panel2:         TPanel;
      Panel6:         TPanel;
      Panel7:         TPanel;
      procedure BtnPermAniadirClick(Sender: TObject);
      procedure BtnPermBorrarClick(Sender: TObject);
      procedure BtnPermGuardarClick(Sender: TObject);
      procedure BtnPermCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var action: TCloseaction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure QFicheroAfterPost(DataSet: TDataSet);
      procedure QFicheroBeforeInsert(DataSet: TDataSet);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure QFicheroBeforePost(DataSet: TDataSet);
      procedure eImporteClick(Sender: TObject);
   private
      FNumVencim:        Integer;
      FImporteAcumulado: Double;
      FDescFormaPago, FDescSubcuenta: String;
      procedure CrearFichero;
      procedure GenerarVencimientos;
   public
      FFormaPago, FClase, FSubcuenta, FFactura: String;
      FAsiento, FDiaPago1, FDiaPago2, FDiaPago3, FIntervalo: Integer;
      FEsFacturaCompra: Boolean;
      FImporteFactura:  Double;
      FFechaFactura, FFechaUltimo, FFechaEmision: TDateTime;
   end;

var WVencimientos: TWVencimientos;
implementation
uses DM, DMConta, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWVencimientos.CrearFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      active := False;
      Clear;
      Add('IMPORTEFACTURA', ftFloat, 0, False);
      Add('NUMERO', ftSmallint, 0, False);
      Add('FVENCIMIENTO', ftDateTime, 0, False);
      Add('FEMISION', ftDateTime, 0, False);
      Add('IMPORTE', ftFloat, 0, False);
      Add('SUBCUENTA', ftString, 10, False);
      Add('DESCRIPCION', ftString, 80, False);
      Add('FORMAPAGO', ftString, 3, False);
      Add('DESCFORMAPAGO', ftString, 40, False);
      Add('SUBCTA_EFECTOS', ftString, 10, False);

      CreateDataSet;
      active := True;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with Grid, Selected do begin
      Clear;
      Add('NUMERO' + #9 + '10' + #9 + 'VENCIM.');
      Add('FVENCIMIENTO' + #9 + '20' + #9 + 'FECHA VENCIMIENTO');
      Add('IMPORTE' + #9 + '20' + #9 + 'IMPORTE');
      ApplySelected;
      Grid.Fields[0].Alignment := taRightJustify;
      Grid.Fields[1].Alignment := taCenter;
      Grid.Fields[2].Alignment := taRightJustify;
   end;
end;

procedure TWVencimientos.GenerarVencimientos;
var
   NumVencim, I: Integer;
   Fecha, FechaPago1, FechaPago2, FechaPago3: TDateTime;
begin
   FechaPago1 := 0;
   FechaPago2 := 0;
   FechaPago3 := 0;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      //TODO: Database := DmRef.IBDSiamCont;
      Clear;
      Add('SELECT * FROM FORMAS WHERE FORMAPAGO = :FORMAPAGO');
      ParamByName('FORMAPAGO').AsString := FFormaPago;
      Open;

      FClase         := FieldByName('CLASE').AsString;
      FIntervalo     := FieldByName('INTERVALO').AsInteger;
      NumVencim      := FieldByName('NUMVENCI').AsInteger;
      FDescFormaPago := FieldByName('DESCRIBE').AsString;

      Close;
      Clear;
      Add('SELECT DIAPAGO1, DIAPAGO2, DIAPAGO3, DESCRIPCION FROM SUBCTAS');
      Add('WHERE SUBCUENTA = :SUBCUENTA');
      ParamByName('SUBCUENTA').AsString := FSubcuenta;
      Open;

      FDescSubcuenta := FieldByName('DESCRIPCION').AsString;

      Free;
   end;

   QFichero.EmptyDataSet;
   Fecha := FFechaFactura;
   for I := 1 to NumVencim do begin
      QFichero.Append;
      QFicheroNUMERO.AsInteger       := I;
      QFicheroIMPORTEFACTURA.AsFloat := RoundToDecimal(FImporteFactura, 2, True);
      QFicheroIMPORTE.AsFloat        := RoundToDecimal(FImporteFactura / NumVencim, 2, True);

      if FClase = 'D' then   begin
         Fecha := Fecha + FIntervalo;
      end
      else begin
         Fecha := IncMonth(Fecha, FIntervalo);
      end;

      if (FDiaPago1 > 0) then   begin
         try
            FechaPago1 := StrToDateTime(IntToStr(FDiaPago1) + '/' +
               IntToStr(Month(Fecha)) + '/' +
               IntToStr(Year(Fecha)));
         except
            FechaPago1 := 0;
         end;
      end;
      if (FDiaPago2 > 0) then   begin
         try
            FechaPago2 := StrToDateTime(IntToStr(FDiaPago2) + '/' +
               IntToStr(Month(Fecha)) + '/' +
               IntToStr(Year(Fecha)));
         except
            FechaPago2 := 0;
         end;
      end;
      if (FDiaPago3 > 0) then   begin
         try
            FechaPago3 := StrToDateTime(IntToStr(FDiaPago3) + '/' +
               IntToStr(Month(Fecha)) + '/' +
               IntToStr(Year(Fecha)));
         except
            FechaPago3 := 0;
         end;
      end;

      if (FechaPago1 <> 0) or (FechaPago2 <> 0) or (FechaPago3 <> 0) then   begin
         if (FechaPago1 <> 0) and (FechaPago1 - Fecha >= 0) then   begin
            Fecha := FechaPago1;
         end
         else
         if (FechaPago2 <> 0) and (FechaPago2 - Fecha >= 0) then   begin
            Fecha := FechaPago2;
         end
         else
         if (FechaPago3 <> 0) and (FechaPago3 - Fecha >= 0) then   begin
            Fecha := FechaPago3;
         end
         else
         if (FechaPago1 <> 0) and (IncMonth(FechaPago1, 1) - Fecha >= 0) then   begin
            Fecha := IncMonth(FechaPago1, 1);
         end
         else
         if (FechaPago2 <> 0) and (IncMonth(FechaPago2, 1) - Fecha >= 0) then   begin
            Fecha := IncMonth(FechaPago2, 1);
         end
         else
         if (FechaPago3 <> 0) and (IncMonth(FechaPago3, 1) - Fecha >= 0) then   begin
            Fecha := IncMonth(FechaPago3, 1);
         end;
      end;


      QFicheroFVENCIMIENTO.AsDateTime := Fecha;
      QFichero.Post;

      FFechaUltimo := QFicheroFVENCIMIENTO.AsDateTime;
   end;
end;

procedure TWVencimientos.BtnPermAniadirClick(Sender: TObject);
begin
   Grid.SetFocus;

   if QFichero.State in dsEditModes then begin
      QFichero.Post;
   end;

   QFichero.Append;
end;

procedure TWVencimientos.BtnPermBorrarClick(Sender: TObject);
var
   Num: Integer;
begin
   if not QFichero.IsEmpty then begin
      if MessageDlg('¿Desea borrar este vencimiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         QFichero.Delete;
         QFichero.First;
         Num := 0;
         while not QFichero.EOF do begin
            Inc(Num);
            QFichero.Edit;
            QFicheroNUMERO.AsInteger := Num;
            QFichero.Post;
            QFichero.Next;
         end;
         QFichero.First;
      end;
   end;
end;

procedure TWVencimientos.BtnPermGuardarClick(Sender: TObject);
var
   Importe: Double;
begin
   if QFichero.IsEmpty then   begin
      DatabaseError('No existen vencimientos asociados a la factura.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.State in dsEditModes then   begin
      QFichero.Post;
   end;
   Importe := 0;
   QFichero.First;
   while not QFichero.EOF do begin
      Importe := Importe + QFicheroIMPORTE.AsFloat;
      QFichero.Next;
   end;
   QFichero.First;
   if RoundToDecimal(Importe, 2, True) <> RoundToDecimal(QFicheroIMPORTEFACTURA.AsFloat, 2, True) then
   begin
      DatabaseError('El importe de factura no coincide con el total de vencimientos.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Close;
      //TODO: Database := DmRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO CARTERAEFECTOS');
      Add('(SUBCUENTA, SITUACION, FEMISION, IMPORTE, FACTCLIENT,');
      Add(' FACTPROVEEDOR, FVENCIMIENTO, CONCEPTO)');
      Add('VALUES');
      Add('(:SUBCUENTA, :SITUACION, :FEMISION, :IMPORTE, :FACTCLIENT,');
      Add(' :FACTPROVEEDOR, :FVENCIMIENTO, :CONCEPTO)');

      FNumVencim := 0;
      QFichero.First;
      while not QFichero.EOF do begin
         Inc(FNumVencim);
         ParamByName('SUBCUENTA').AsString     := FSubcuenta;
         ParamByName('SITUACION').AsString     := 'N';
         ParamByName('FEMISION').AsDateTime    := QFicheroFEmision.AsDateTime;
         ParamByName('IMPORTE').AsFloat        := RoundToDecimal(QFicheroIMPORTE.AsFloat, 2, True);
         ParamByName('FACTCLIENT').AsString    := '';
         ParamByName('FACTPROVEEDOR').AsString := '';
         if FEsFacturaCompra then   begin
            ParamByName('FACTPROVEEDOR').AsString := FFactura;
         end
         else begin
            ParamByName('FACTCLIENT').AsString := FFactura;
         end;
         ParamByName('FVENCIMIENTO').AsDateTime := QFicheroFVENCIMIENTO.AsDateTime;
         if FEsFacturaCompra then   begin
            ParamByName('CONCEPTO').AsString :=
               'PAGO VTO. ' + QFicheroFVENCIMIENTO.AsString +
               ' FACT. ' + FFactura;
         end
         else begin
            ParamByName('CONCEPTO').AsString :=
               'COBRO VTO. ' + QFicheroFVENCIMIENTO.AsString +
               ' FACT. ' + FFactura;
         end;
         ExecQuery;
         Transaction.CommitRetaining;
         QFichero.Next;
      end;

      Close;
      Free;

      QFichero.First;

      if FNumVencim = 1 then begin
         MessageDlg('Generados el vencimiento correspondiente a la factura ' + FFactura, mtInformation, [mbOK], 0);
      end
      else begin
         MessageDlg('Generados los ' + IntToStr(FNumVencim) + ' vencimientos correspondientes ' +
                    'a la factura ' + FFactura, mtInformation, [mbOK], 0);
      end;
   end;

   Close;
end;

procedure TWVencimientos.BtnPermCancelarClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.IsEmpty then Exit;
   
   if MessageDlg('¿Quiere anular las vencimientos generados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try    QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Close;
   end;
end;

procedure TWVencimientos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWVencimientos.FormShow(Sender: TObject);
begin
   CrearFichero;
   Grid.SetFocus;

   GenerarVencimientos;
end;

procedure TWVencimientos.FormCreate(Sender: TObject);
begin
   //ActivarTransacciones(self);
   Mode := fmView;
   Navegador.Visible := True;
end;

procedure TWVencimientos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then begin
            BtnPermCancelar.Click;
         end
         else begin
            BtnPermCancelar.Click;
         end;
      end;
      VK_F2: begin
         if not (QFichero.State in dsEditModes) then begin
            BtnPermAniadir.Click;
         end;
      end;
      VK_F3: begin
         if QFichero.State in dsEditModes then begin
            BtnPermGuardar.Click;
         end;
      end;
   end;
end;

procedure TWVencimientos.FormClose(Sender: TObject; var action: TCloseaction);
begin
   if QFichero.State = dsBrowse then  begin
      action        := caFree;
      WVencimientos := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWVencimientos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWVencimientos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWVencimientos.QFicheroAfterPost(DataSet: TDataSet);
begin
   if (QFicheroIMPORTE.AsFloat = 0) and (QFicheroFVENCIMIENTO.IsNull) then   begin
      QFichero.Delete;
   end;
end;

procedure TWVencimientos.QFicheroBeforePost(DataSet: TDataSet);
begin
   if (QFicheroIMPORTE.AsFloat <> 0) and (QFicheroFVENCIMIENTO.IsNull) then   begin
      DatabaseError('No se puede dejar la fecha de vencimiento en blanco.');
   end;
end;

procedure TWVencimientos.QFicheroBeforeInsert(DataSet: TDataSet);
begin
   FNumVencim        := 0;
   FImporteAcumulado := 0;

   if QFichero.State in dsEditModes then   begin
      QFichero.Post;
   end;

   QFichero.DisableControls;
   QFichero.First;
   while not QFichero.EOF do begin
      Inc(FNumVencim);
      FImporteAcumulado := FImporteAcumulado + QFicheroIMPORTE.AsFloat;
      QFichero.Next;
   end;
   QFichero.EnableControls;
end;

procedure TWVencimientos.QFicheroNewRecord(DataSet: TDataSet);
var
   Fecha, FechaPago1, FechaPago2, FechaPago3: TDateTime;
begin
   FechaPago1 := 0;
   FechaPago2 := 0;
   FechaPago3 := 0;

   QFicheroIMPORTEFACTURA.AsFloat := FImporteFactura;
   QFicheroFEMISION.AsDateTime    := FFechaEmision;
   QFicheroNUMERO.AsInteger       := FNumVencim + 1;
   QFicheroIMPORTE.AsFloat        := RoundToDecimal(FImporteFactura - FImporteAcumulado, 2, True);
   QFicheroSUBCUENTA.AsString     := FSubcuenta;
   QFicheroDESCRIPCION.AsString   := FDescSubcuenta;
   QFicheroFORMAPAGO.AsString     := FFormaPago;
   QFicheroDESCFORMAPAGO.AsString := FDescFormaPago;

   Fecha := FFechaUltimo;
   if FClase = 'D' then   begin
      Fecha := Fecha + FIntervalo;
   end
   else begin
      Fecha := IncMonth(Fecha, FIntervalo);
   end;


   if FDiaPago1 > 0 then   begin
      try
         FechaPago1 := StrToDateTime(IntToStr(FDiaPago1) + '/' +
            IntToStr(Month(Fecha)) + '/' +
            IntToStr(Year(Fecha)));
      except
         FechaPago1 := 0;
      end;
   end;

   if FDiaPago2 > 0 then   begin
      try
         FechaPago2 := StrToDateTime(IntToStr(FDiaPago2) + '/' +
            IntToStr(Month(Fecha)) + '/' +
            IntToStr(Year(Fecha)));
      except
         FechaPago2 := 0;
      end;
   end;

   if FDiaPago3 > 0 then   begin
      try
         FechaPago3 := StrToDateTime(IntToStr(FDiaPago3) + '/' +
            IntToStr(Month(Fecha)) + '/' +
            IntToStr(Year(Fecha)));
      except
         FechaPago3 := 0;
      end;
   end;

   if (FechaPago1 <> 0) and (FechaPago1 - Fecha >= 0) then   begin
      QFicheroFVENCIMIENTO.AsDateTime := FechaPago1;
   end
   else
   if (FechaPago2 <> 0) and (FechaPago2 - Fecha >= 0) then   begin
      QFicheroFVENCIMIENTO.AsDateTime := FechaPago2;
   end
   else
   if (FechaPago3 <> 0) and (FechaPago3 - Fecha >= 0) then   begin
      QFicheroFVENCIMIENTO.AsDateTime := FechaPago3;
   end
   else begin
      QFicheroFVENCIMIENTO.AsDateTime := Fecha;
   end;

   FFechaUltimo := QFicheroFVENCIMIENTO.AsDateTime;
end;

procedure TWVencimientos.eImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
