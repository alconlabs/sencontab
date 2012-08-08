unit UNuevaSubcuenta;
interface
uses Buttons, Classes, ComCtrls, Controls, Db, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton,
     fcImage, fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBSQL, IBTableSet,
     jpeg, Mask, Menus, Messages, navegadorNotarios, OvcBase, OvcDbDat, OvcDbNF, OvcDbPF, OvcEdCal,
     OvcEditF, OvcEdPop, OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, ppCache, ppComm, ppDB, ppDBPipe, ppRelatv,
     StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, Wwdbgrid, Wwdbigrd,
     wwdblook, Wwdbspin, Wwdotdot, wwSpeedButton, Wwtable, CustomView;

type
   TWNuevaSubcuenta = class(TCustomView)
      BtnEdtAceptar:  TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      Label2:         TLabel;
      Shape1:         TShape;
      QFichero:       TIBTableSet;
      Transaccion:    TIBTransaction;
      OvcController1: TOvcController;
      Panel5:         TPanel;
      Panel3:         TPanel;
      Panel4:         TPanel;
      fcIBCerrar:     TfcImageBtn;
      DSFichero:      TDataSource;
      QFicheroSaldo:  TFloatField;
      QFicheroACUDB01: TFloatField;
      QFicheroACUDB02: TFloatField;
      QFicheroACUDB03: TFloatField;
      QFicheroACUDB04: TFloatField;
      QFicheroACUDB05: TFloatField;
      QFicheroACUDB06: TFloatField;
      QFicheroACUDB07: TFloatField;
      QFicheroACUDB08: TFloatField;
      QFicheroACUDB09: TFloatField;
      QFicheroACUDB10: TFloatField;
      QFicheroACUDB11: TFloatField;
      QFicheroACUDB12: TFloatField;
      QFicheroACUHB01: TFloatField;
      QFicheroACUHB02: TFloatField;
      QFicheroACUHB03: TFloatField;
      QFicheroACUHB04: TFloatField;
      QFicheroACUHB05: TFloatField;
      QFicheroACUHB06: TFloatField;
      QFicheroACUHB07: TFloatField;
      QFicheroACUHB08: TFloatField;
      QFicheroACUHB09: TFloatField;
      QFicheroACUHB10: TFloatField;
      QFicheroACUHB11: TFloatField;
      QFicheroACUHB12: TFloatField;
      QFicheroANTDB:  TFloatField;
      QFicheroANTDB01: TFloatField;
      QFicheroANTDB02: TFloatField;
      QFicheroANTDB03: TFloatField;
      QFicheroANTDB04: TFloatField;
      QFicheroANTDB05: TFloatField;
      QFicheroANTDB06: TFloatField;
      QFicheroANTDB07: TFloatField;
      QFicheroANTDB08: TFloatField;
      QFicheroANTDB09: TFloatField;
      QFicheroANTDB10: TFloatField;
      QFicheroANTDB11: TFloatField;
      QFicheroANTDB12: TFloatField;
      QFicheroANTHB:  TFloatField;
      QFicheroANTHB01: TFloatField;
      QFicheroANTHB02: TFloatField;
      QFicheroANTHB03: TFloatField;
      QFicheroANTHB04: TFloatField;
      QFicheroANTHB05: TFloatField;
      QFicheroANTHB06: TFloatField;
      QFicheroANTHB07: TFloatField;
      QFicheroANTHB08: TFloatField;
      QFicheroANTHB09: TFloatField;
      QFicheroANTHB10: TFloatField;
      QFicheroANTHB11: TFloatField;
      QFicheroANTHB12: TFloatField;
      QFicheroARRENDADOR: TIBStringField;
      QFicheroCONTRAPARTIDA: TIBStringField;
      QFicheroDESCRIPCION: TIBStringField;
      QFicheroDIRECCION: TIBStringField;
      QFicheroFAX:    TIBStringField;
      QFicheroIVA:    TFloatField;
      QFicheroPROFESIONAL: TIBStringField;
      QFicheroRECARGO: TFloatField;
      QFicheroSUBCUENTA: TIBStringField;
      QFicheroSUMADB: TFloatField;
      QFicheroSUMAHB: TFloatField;
      QFicheroTELEFONO: TIBStringField;
      QFicheroTIPOIVA: TIBStringField;
      QFicheroDIRECCION1: TIBStringField;
      QFicheroNIF:    TIBStringField;
      QFicheroCODPOSTAL: TIBStringField;
      QFicheroPOBLACION: TIBStringField;
      QFicheroPROVINCIA: TIBStringField;
      QFicheroPAIS:   TIBStringField;
      QFicheroNUMERO: TIBStringField;
      QFicheroFORMAPAGO: TIBStringField;
      QFicheroDIAPAGO1: TSmallintField;
      QFicheroDIAPAGO2: TSmallintField;
      QFicheroPRES01: TFloatField;
      QFicheroPRES02: TFloatField;
      QFicheroPRES03: TFloatField;
      QFicheroPRES04: TFloatField;
      QFicheroPRES05: TFloatField;
      QFicheroPRES06: TFloatField;
      QFicheroPRES07: TFloatField;
      QFicheroPRES08: TFloatField;
      QFicheroPRES09: TFloatField;
      QFicheroPRES10: TFloatField;
      QFicheroPRES11: TFloatField;
      QFicheroPRES12: TFloatField;
      QFicheroPRESTOT: TFloatField;
      QFicheroOBSOLETO: TIBStringField;
      QFicheroDESCFORMAPAGO: TStringField;
      GroupBox1:      TGroupBox;
      Label30:        TLabel;
      Label3:         TLabel;
      Label4:         TLabel;
      OvcDescripcion: TOvcDbPictureField;
      OvcSubCuenta:   TOvcDbPictureField;
      ComboContrapartida: TwwDBLookupCombo;
      ComboContrapartidaDesc: TwwDBLookupCombo;
      GroupBox14:     TGroupBox;
      Label37:        TLabel;
      Label38:        TLabel;
      Label36:        TLabel;
      Label40:        TLabel;
      Label41:        TLabel;
      Label42:        TLabel;
      Label43:        TLabel;
      Label44:        TLabel;
      Label5:         TLabel;
      eNIF:           TOvcDbPictureField;
      ComboProvincia: TwwDBLookupCombo;
      OvcDbPictureField1: TOvcDbPictureField;
      OvcDbPictureField5: TOvcDbPictureField;
      OvcDbPictureField6: TOvcDbPictureField;
      OvcDbPictureField7: TOvcDbPictureField;
      DBCheckBox5:    TDBCheckBox;
      DBCheckBox1:    TDBCheckBox;
      OvcDbPictureField4: TOvcDbPictureField;
      OvcDbPictureField8: TOvcDbPictureField;
      ePais:          TwwDBLookupCombo;
      OvcDbPictureField3: TOvcDbPictureField;
      GroupBox25:     TGroupBox;
      Label64:        TLabel;
      Label65:        TLabel;
      Label66:        TLabel;
      OvcDbNumericField62: TOvcDbNumericField;
      wwDBLookupCombo2: TwwDBLookupCombo;
      wwDBLookupCombo3: TwwDBLookupCombo;
      OvcDbNumericField63: TOvcDbNumericField;
      DBCheckBox2:    TDBCheckBox;
      DBCheckBox3:    TDBCheckBox;
      QFicheroDIAPAGO3: TSmallintField;
      QFicheroABREVIATURA: TIBStringField;
      QFicheroINTRACOMUNITARIO: TIBStringField;
      Label1:         TLabel;
      OvcDbNumericField1: TOvcDbNumericField;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      cbSubctaRet:    TCheckBox;
      QFicheroSUBCTARET: TIBStringField;
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure fcIBMinimizarClick(Sender: TObject);
      procedure BtnNavAnadirMouseEnter(Sender: TObject);
      procedure BtnNavAnadirMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CreateParams(var Params: TCreateParams); override;
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure OvcSubCuentaExit(Sender: TObject);
      procedure ePaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure eNIFExit(Sender: TObject);
   private
      x: Integer;
      procedure ActivarTransacciones;
      procedure AniadirSubcuenta;
      procedure PrepararQuery;
   public
      FNuevaSubcuenta, FContrapartidaSubcta: String;
   end;

var WNuevaSubcuenta: TWNuevaSubcuenta;

implementation
uses DM, DMConta, General, Globales, Letras, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWNuevaSubcuenta.ActivarTransacciones;
var
   i: Word;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if (Components[i] is TibTransaction) then   begin
         TibTransaction(Components[i]).active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.add('Read_committed');
         TibTransaction(Components[i]).Params.add('Rec_version');
         TibTransaction(Components[i]).Params.add('Write');
         TibTransaction(Components[i]).active := True;
      end;
   end;
end;

procedure TWNuevaSubcuenta.AniadirSubcuenta;
begin
   QFichero.Insert;
   QFicheroSUBCUENTA.AsString := FNuevaSubcuenta;
   OvcSubCuenta.SetFocus;
   Mode := fmEdit;
end;

procedure TWNuevaSubcuenta.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA');

      Prepare;
      EnableControls;
      Open;
   end;
end;

procedure TWNuevaSubcuenta.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWNuevaSubcuenta.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWNuevaSubcuenta.FormCreate(Sender: TObject);
begin
   if not Assigned(DMContaRef) then   begin
      DMContaRef := TDMContaRef.Create(Application);
   end;

   x := GetSystemMetrics(SM_CXSCREEN);

   ActivarTransacciones;

   PrepararQuery;

   Mode := fmView;
   OvcSubcuenta.MaxLength := DmRef.QParametros.FieldByName('Longitud_Subcuentas').AsInteger;

   //CargaImagenesMensaje(Mensaje);
end;

procedure TWNuevaSubcuenta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWNuevaSubcuenta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Anterior: Boolean;
   Salir:    Boolean;
begin
   case Key of
      VK_ESCAPE: begin
         Salir := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Salir := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Salir := False;
            end;
         end;
         if Salir then   begin
            BtnEdtCancelar.Click;
         end;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
      VK_F5: begin
         if (ActiveControl is TwwDBLookupCombo) then begin
            TwwDBLookupCombo(ActiveControl).DropDown;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            TwwDBComboBox(ActiveControl).DropDown;
         end;
      end;
      VK_UP: begin
         Anterior := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBGrid) then begin
            Anterior := False;
         end;

         if Anterior then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
   end;
end;

procedure TWNuevaSubcuenta.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroPROFESIONAL.AsString      := 'N';
   QFicheroArrendador.AsString       := 'N';
   QFicheroObsoleto.AsString         := 'N';
   QFicheroINTRACOMUNITARIO.AsString := 'N';
end;

procedure TWNuevaSubcuenta.fcIBMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWNuevaSubcuenta.BtnNavAnadirMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWNuevaSubcuenta.BtnNavAnadirMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWNuevaSubcuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      // Liberar formulario desde la ventana que lo llamó,
      // para poder recoger la nueva subcuenta creada.
      //    WNuevaSubcuenta := nil
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWNuevaSubcuenta.BtnEdtAceptarClick(Sender: TObject);
var
   cSubctaRet, cDescripcion, cNif: String;
begin
   Perform(wm_NextDlgCtl, 0, 0);

   // Quitar espacios de subcuenta
   QFicheroSubcuenta.AsString := Trim(QFicheroSubcuenta.AsString);
   cDescripcion := QFicheroDescripcion.AsString;
   cNif         := QFicheroNif.AsString;

   FNuevaSubcuenta      := QFicheroSUBCUENTA.AsString;
   FContrapartidaSubcta := QFicheroCONTRAPARTIDA.AsString;

   if Length(QFicheroSUBCUENTA.AsString) < DMRef.QParametros.FieldByName(
      'LONGITUD_SUBCUENTAS').AsInteger then begin
      MessageDlg('La longitud de subcuenta es menor de ' +
                 DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString + ' caracteres.', mtError, [mbOK], 0);
      OvcSubCuenta.SetFocus;
      Exit;
   end;

   // Comprobar si existe la cuenta a la que pertenece la subcuenta
   if not DMRef.ExistenRegistros('CUENTAS', 'CUENTA = "' +
      Copy(QFicheroSUBCUENTA.AsString, 1, 3) + '"') then begin
      MessageDlg('No existe la cuenta ' + Copy(QFicheroSUBCUENTA.AsString, 1, 3) +' a la que pertenece la subcuenta seleccionada.',
                 mtError, [mbOK], 0);
   end
   else begin
      if cbSubctaRet.Checked then   begin
         QFichero.FieldByName('SubctaRet').AsString := '434' + Copy(QFichero.FieldByName('Subcuenta').AsString, 4, 7);
      end;
      QFichero.DisableControls;
      QFichero.Post;
      QFichero.Transaction.CommitRetaining;
      DMContaRef.RefrescarSubcuentas(QFicheroSUBCUENTA.AsString);
      try
         if cbSubctaRet.Checked then   begin
            cSubctaRet := '434' + Copy(QFichero.FieldByName('Subcuenta').AsString, 4, 7);
            Qfichero.insert;
            QFichero.FieldByName('Subcuenta').AsString   := cSubctaRet;
            QFichero.FieldByName('Descripcion').AsString := cDescripcion;
            QFichero.FieldByName('Nif').AsString         := cNif;
            Qfichero.post;
            QFichero.Transaction.CommitRetaining;
            DMContaRef.RefrescarSubcuentas(QFicheroSUBCUENTA.AsString);
         end;
         QFichero.EnableControls;
      except
         Self.SendToBack;
         DatabaseError('Error al guardar datos de la Subcuenta.' + #13 +
            'Puede estar duplicada');
         QFichero.EnableControls;
      end;

      Mode := fmView;

      Close;
   end;
end;

procedure TWNuevaSubcuenta.BtnEdtCancelarClick(Sender: TObject);
begin
   if MessageDlg('¿Quiere anular los cambios realizados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Cancel;
      except DatabaseError('Error al cancelar la operación');
      end;
      FNuevaSubcuenta      := '';
      FContrapartidaSubcta := '';
      Mode := fmView;
      Close;
   end;
end;

procedure TWNuevaSubcuenta.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   ComboContrapartida.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   OvcSubCuenta.MaxLength       := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   AniadirSubcuenta;
end;

procedure TWNuevaSubcuenta.CreateParams(var Params: TCreateParams);
begin
   inherited;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with params do begin
      style          := (style or ws_popup) and not ws_dlgframe and not ws_clipchildren;
      doublebuffered := True;
   end;
end;

procedure TWNuevaSubcuenta.fcImageBtnMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWNuevaSubcuenta.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWNuevaSubcuenta.OvcSubCuentaExit(Sender: TObject);
begin
   if (QFichero.State in dsEditModes) and
      ((DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'C') or
      (DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'P')) and
      (QFicheroPAIS.AsString = '') then  begin
      QFicheroPAIS.AsString := 'ES';
      eNIF.MaxLength        := 9;
   end
   else begin
      eNIF.MaxLength := 20;
   end;
end;

procedure TWNuevaSubcuenta.ePaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
   modified: Boolean);
begin
   if (QFichero.State in dsEditModes) and (QFicheroPAIS.AsString = 'ES') then   begin
      eNIF.MaxLength := 9;
   end
   else begin
      eNIF.MaxLength := 20;
   end;
end;

procedure TWNuevaSubcuenta.eNIFExit(Sender: TObject);
var
   NIF, Letra: String;
begin
   if QFicheroPAIS.AsString = 'ES' then  begin
      if QFichero.State in dsEditModes then   begin
         NIF := QFicheroNIF.AsString;
         if Empty(NIF) then   begin
            Exit;
         end;
         if NIF[1] in ['A'..'Z'] then   begin
            Exit;
         end;
         // chequeo del nif
         Letra := LetraNif(Copy(NIF, 1, 8));
         if Letra <> NIF[9] then   begin
            QFicheroNIF.AsString := Copy(NIF, 1, 8) + Letra;
         end;
      end;
   end;
end;

end.
