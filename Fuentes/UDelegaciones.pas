unit UDelegaciones;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls,
     SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, Wwkeycb, CustomView;
type
   TWDelegaciones = class(TCustomView)
      OvcController1:  TOvcController;
      SFichero:        TwwDataSource;
      QFichero:        TIBTableSet;
      Transaccion:     TIBTransaction;
      Datos:           TGroupBox;
      Label1:          TLabel;
      Label2:          TLabel;
      eNombre:         TOvcDbPictureField;
      Shape1:          TShape;
      Label3:          TLabel;
      Panel1:          TPanel;
      BtnNavAniadir:   TfcImageBtn;
      BtnNavBorrar:    TfcImageBtn;
      BtnNavCerrar:    TfcImageBtn;
      BtnEdtGuardar:   TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      FiltroBuscar:    TGroupBox;
      FiltroBNombre:   TOvcDbPictureField;
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
      eCodigo:         TOvcDbPictureField;
      FiltroBCodigo:   TOvcDbPictureField;
      QFicheroNOMBRE:  TIBStringField;
      QFicheroID_DELEGACION: TIBStringField;
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
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure LimpiarFiltro(Sender: TObject);
      procedure VerTabla(Sender: TObject);
      procedure BtnNavImprimirClick(Sender: TObject);
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
      procedure RefrescarBD;
   public
   end;

var WDelegaciones: TWDelegaciones;

implementation
uses DM, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener m�s informaci�n sobre el problema surgido';
      CADENA_BORRADO = 'La delegaci�n seleccionada se encuentra referenciada en alguna anal�tica.';

procedure TWDelegaciones.CrearFiltro;
begin
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BCodigo', ftString, 10, False);
      Add('BDescripcion', ftstring, 50, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BCodigo').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TWDelegaciones.PrepararQuery;
begin
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE DELEGACION SET NOMBRE =:NOMBRE, ID_DELEGACION = :ID_DELEGACION');
      Add('WHERE ID_DELEGACION = :old_ID_DELEGACION');
   end;

   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM DELEGACION');

      if TbFiltro.FieldByName('BCODIGO').AsString <> '' then   begin
         Add('WHERE ID_DELEGACION LIKE :ID_DELEGACION');
      end
      else
      if TbFiltro.FieldByName('BDESCRIPCION').AsString <> '' then   begin
         add('WHERE UPPER(NOMBRE) LIKE UPPER(:NOMBRE)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;

      if TbFiltro.FieldByName('BCODIGO').AsString <> '' then   begin
         Params.ByName('ID_DELEGACION').AsString :=
            Copy(TbFiltro.FieldByName('BCODIGO').AsString + '%', 1,
            TbFiltro.FieldByName('BCODIGO').Size);
      end
      else
      if TbFiltro.FieldByName('BDESCRIPCION').AsString <> '' then   begin
         Params.byname('NOMBRE').AsString :=
            Copy(TbFiltro.FieldByName('BDESCRIPCION').AsString + '%', 1,
            TbFiltro.FieldByName('BDESCRIPCION').Size);
      end;

      Prepare;
      Open;
      EnableControls;
   end;
end;

procedure TWDelegaciones.RefrescarBD;
begin
   DmRef.QDelegacion.Close;
   DmRef.QDelegacionNom.Close;

   DmRef.QDelegacion.Open;
   DmRef.QDelegacionNom.Open;
end;

procedure TWDelegaciones.BtnNavAniadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   Navegador.Visible := False;

   eCodigo.SetFocus;
   try
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar una nueva delegaci�n.' + #13 +
         CADENA_MANUAL);
   end;
   Modo(Self, Edita);
end;

procedure TWDelegaciones.BtnNavBorrarClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('�Desea borrar esta delegaci�n?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar la delegaci�n seleccionada.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWDelegaciones.BtnNavImprimirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LDelegaciones.rtm', SFichero);
end;

procedure TWDelegaciones.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('ID_DELEGACION').AsString = '' then  begin
      eCodigo.SetFocus;
      DatabaseError('No se puede dejar el c�digo de la delegaci�n en blanco.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;

   if QFichero.FieldByName('NOMBRE').AsString = '' then  begin
      eNombre.SetFocus;
      DatabaseError('No se puede dejar el nombre de la delegaci�n en blanco.' +
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
      TbFiltro.FieldByName('BCODIGO').AsString := QFicheroID_DELEGACION.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;

end;

procedure TWDelegaciones.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;
   if MessageDlg('�Quiere anular las modificaciones realizadas a esta delegaci�n?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operaci�n.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
   end;
end;

procedure TWDelegaciones.RejillaDblClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then  begin
      Navegador.Visible := False;
      try QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      Modo(Self, Edita);
      eCodigo.SetFocus;
   end;
end;

procedure TWDelegaciones.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then   begin
      // Comprobacion del filtro por c�digo
      if (FiltroBCodigo.Focused) and (FiltroBCodigo.Text <> '') then   begin
         key := #0;
         if tbFiltro.State in dsEditModes then begin
            tbFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobacion del filtro por descripci�n
      else
      if (FiltroBNombre.Focused) and (FiltroBNombre.Text <> '') then   begin
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

procedure TWDelegaciones.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBCodigo.SetFocus;
end;

procedure TWDelegaciones.FormCreate(Sender: TObject);
begin
   //ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'ID_DELEGACION';
   PrepararQuery;
   Modo(Self, Naveg);
end;

procedure TWDelegaciones.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
            (ActiveControl <> FiltroBNombre) and not
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
      VK_F4: begin
         if not (QFichero.State in dsEditModes) then begin
            RejillaDblClick(Self);
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) then begin
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

procedure TWDelegaciones.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'ID_DELEGACION') or (UpperCase(AFieldName) = 'NOMBRE') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWDelegaciones.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWDelegaciones.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWDelegaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario    := nil;
      WDelegaciones := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWDelegaciones.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWDelegaciones.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWDelegaciones.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWDelegaciones.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BCODIGO').AsString      := '';
   TbFiltro.FieldByName('BDESCRIPCION').AsString := '';
end;

procedure TWDelegaciones.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BCODIGO').AsString      := '';
      FieldByName('BDESCRIPCION').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

end.
