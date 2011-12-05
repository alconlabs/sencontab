unit UFormasPago;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls,
     SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, wwdblook, Wwkeycb;
type
   TWFormasPago = class(TForm)
      OvcController1:  TOvcController;
      SFichero:        TwwDataSource;
      QFichero:        TIBTableSet;
      Transaccion:     TIBTransaction;
      Datos:           TGroupBox;
      Label2:          TLabel;
      eDescripcion:    TOvcDbPictureField;
      Shape1:          TShape;
      Label3:          TLabel;
      Panel1:          TPanel;
      BtnNavAniadir:   TfcImageBtn;
      BtnNavBorrar:    TfcImageBtn;
      BtnNavCerrar:    TfcImageBtn;
      BtnEdtGuardar:   TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      FiltroBuscar:    TGroupBox;
      FiltroBDescripcion: TOvcDbPictureField;
      TbFiltro:        TClientDataSet;
      sFiltro:         TDataSource;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel5:          TPanel;
      Panel4:          TPanel;
      fcImageBtnMinimizar: TfcImageBtn;
      PanelSombra:     TPanel;
      Navegador:       TDBNavegadorNotarios;
      Label4:          TLabel;
      Label5:          TLabel;
      BtnNavFiltro:    TfcImageBtn;
      BtnNavImprimir:  TfcImageBtn;
      BtnNavModificar: TfcImageBtn;
      Label1:          TLabel;
      eFormaPago:      TOvcDbPictureField;
      FiltroBCodigo:   TOvcDbPictureField;
      QFicheroFORMAPAGO: TIBStringField;
      QFicheroCLASE:   TIBStringField;
      QFicheroDESCRIBE: TIBStringField;
      QFicheroINTERVALO: TSmallintField;
      QFicheroNUMVENCI: TSmallintField;
      QFicheroOBSOLETO: TIBStringField;
      gUnidades:       TDBRadioGroup;
      eIntervalo:      TOvcDbNumericField;
      Label6:          TLabel;
      Label7:          TLabel;
      eVencimiento:    TOvcDbNumericField;
      oObsoleto:       TDBCheckBox;
      QFicheroUnidades: TStringField;
      Rejilla:         TwwDBGrid;
      Panel2:          TPanel;
      Formulario:      TfcImageForm;
      procedure BtnNavAniadirClick(Sender: TObject);
      procedure BtnNavBorrarClick(Sender: TObject);
      procedure BtnEdtGuardarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure RejillaDblClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
         AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var action: TCloseaction);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure LimpiarFiltro(Sender: TObject);
      procedure VerTabla(Sender: TObject);
      procedure BtnNavImprimirClick(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure SeleccionarContenido(Sender: TObject);
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
      procedure RefrescarBD;
   public
   end;

var WFormasPago: TWFormasPago;

implementation
uses DM, DMConta, DMControl, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'La forma de pago seleccionada se encuentra referenciada en alguna subcuenta.';

procedure TWFormasPago.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BCodigo', ftString, 3, False);
      Add('BDescripcion', ftstring, 40, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BCodigo').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TWFormasPago.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE FORMAS SET FORMAPAGO = :FORMAPAGO, CLASE = :CLASE,');
      Add('DESCRIBE = :DESCRIBE, INTERVALO = :INTERVALO, NUMVENCI = :NUMVENCI,');
      Add('OBSOLETO = :OBSOLETO');
      Add('WHERE FORMAPAGO = :old_FORMAPAGO');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM FORMAS');

      if TbFiltro.FieldByName('BCODIGO').AsString <> '' then   begin
         add(' WHERE FORMAPAGO LIKE :FORMAPAGO');
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('WHERE UPPER(DESCRIBE) LIKE UPPER(:DESCRIBE)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BCODIGO').AsString <> '' then   begin
         params.byname('FORMAPAGO').AsString :=
            Copy(TbFiltro.FieldByName('BCODIGO').AsString + '%', 1,
            TbFiltro.FieldByName('BCODIGO').Size);
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         Params.byname('DESCRIBE').AsString :=
            Copy(TbFiltro.FieldByName('BDescripcion').AsString + '%', 1,
            TbFiltro.FieldByName('BDescripcion').Size);
      end;

      Prepare;
      Open;
      EnableControls;
   end;
end;

procedure TWFormasPago.BtnNavAniadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   Navegador.Visible := False;
   eFormaPago.SetFocus;
   QFichero.Insert;
   Modo(Self, Edita);
end;

procedure TWFormasPago.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar esta forma de pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar la forma de pago seleccionada.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWFormasPago.BtnNavImprimirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LFormasPago.rtm', SFichero);
end;

procedure TWFormasPago.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('FORMAPAGO').AsString = '' then  begin
      eFormaPago.SetFocus;
      DatabaseError('No se puede dejar el código de la forma de pago en blanco.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if QFichero.FieldByName('DESCRIBE').AsString = '' then  begin
      eDescripcion.SetFocus;
      DatabaseError('No se puede dejar la descripción de la forma de pago en blanco.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;

   RefrescarBD;
   Navegador.Visible := True;
   Modo(Self, Naveg);
   Rejilla.SetFocus;
   if ha_insertado then  begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BCODIGO').AsString := QFicheroFORMAPAGO.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;
end;

procedure TWFormasPago.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;

   if MessageDlg('¿Quiere anular las modificaciones realizadas a esta forma de pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
   end;
end;

procedure TWFormasPago.RejillaDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then  begin
      Navegador.Visible := False;
      try QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      Modo(Self, Edita);
      eFormaPago.SetFocus;
   end;
end;

procedure TWFormasPago.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobacion del filtro por código
      if (FiltroBCodigo.Focused) and (FiltroBCodigo.Text <> '') then   begin
         key := #0;
         if tbFiltro.State in dsEditModes then begin
            tbFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobacion del filtro por nombre
      else
      if (FiltroBDescripcion.Focused) and (FiltroBDescripcion.Text <> '') then   begin
         key := #0;
         if tbFiltro.State in dsEditModes then begin
            tbFiltro.Post;
         end;
         PrepararQuery;
      end

      //Si no es ninguno de los otros dos pasamos al siguiente control
      else
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWFormasPago.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBCodigo.SetFocus;
end;

procedure TWFormasPago.FormCreate(Sender: TObject);
begin
   ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'FORMAPAGO';
   PrepararQuery;
   Modo(Self, Naveg);
end;

procedure TWFormasPago.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then begin
            BtnEdtCancelar.Click;
         end
         else begin
            BtnNavCerrar.Click;
         end;
      end;
      VK_SPACE: begin
         if (ActiveControl <> FiltroBCodigo) and
            (ActiveControl <> FiltroBDescripcion) and not
            (QFichero.State in dsEditModes) then   begin
            //Anulamos el evento de la tecla
            Key := 0;
            RejillaDblClick(Self);
         end;
      end;
      VK_F2: begin
         if not (QFichero.State in dsEditModes) then begin
            BtnNavAniadir.Click;
         end;
      end;
      VK_F3: begin
         if QFichero.State in dsEditModes then begin
            BtnEdtGuardar.Click;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
      VK_F12: begin
         if not (QFichero.State in dsEditModes) then begin
            VerTabla(Sender);
         end;
      end;
   end;
end;

procedure TWFormasPago.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'FORMAPAGO') or (UpperCase(AFieldName) = 'DESCRIBE') or
      (UpperCase(AFieldName) = 'INTERVALO') or (UpperCase(AFieldName) = 'NUMVENCI') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWFormasPago.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWFormasPago.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWFormasPago.FormClose(Sender: TObject; var action: TCloseaction);
begin
   if QFichero.State = dsBrowse then  begin
      action := caFree;
      Formulario.Free;
      Formulario  := nil;
      WFormasPago := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWFormasPago.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWFormasPago.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWFormasPago.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWFormasPago.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BCodigo').AsString      := '';
   TbFiltro.FieldByName('BDescripcion').AsString := '';
end;

procedure TWFormasPago.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BCodigo').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

procedure TWFormasPago.QFicheroCalcFields(DataSet: TDataSet);
begin
   if QFicheroCLASE.AsString = 'D' then   begin
      QFicheroUnidades.AsString := 'DÍAS';
   end
   else begin
      QFicheroUnidades.AsString := 'MESES';
   end;
end;

procedure TWFormasPago.RefrescarBD;
begin
   FIbQueryRefresh(DMRef.QFormaPago);
   FIbQueryRefresh(DMRef.QFormaPagoNom);
end;

procedure TWFormasPago.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroCLASE.AsString    := 'D';
   QFicheroOBSOLETO.AsString := 'N';
end;

procedure TWFormasPago.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
