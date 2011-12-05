unit UPaises;
interface
uses Buttons, DBClient, IBDatabase, DB, IBCustomDataSet, IBTableSet, Wwdatsrc, ovcbase, Forms,
     navegadorNotarios, fcButton, fcImgBtn, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls, Grids, Wwdbigrd,
     Wwdbgrid, Controls, windows, ExtCtrls, Graphics, fcImage, fcimageform, Classes, SysUtils, Messages;
     
type
   TWPaises = class(TForm)
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
      Label10:         TLabel;
      Label11:         TLabel;
      FiltroBNombre:   TOvcDbPictureField;
      TbFiltro:        TClientDataSet;
      sFiltro:         TDataSource;
      fcIBCerrar:      TfcImageBtn;
      fcImageBtnMinimizar: TfcImageBtn;
      PanelSombra:     TPanel;
      Navegador:       TDBNavegadorNotarios;
      BtnNavFiltro:    TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnNavImprimir:  TfcImageBtn;
      BtnNavModificar: TfcImageBtn;
      QFicheroPAIS:    TIBStringField;
      QFicheroNOMBRE:  TIBStringField;
      FiltroBPais:     TOvcDbPictureField;
      ePais:           TOvcDbPictureField;
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

var WPaises: TWPaises;
implementation
uses Dialogs, General, Globales, DM, DMControl, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'El País seleccionado se encuentra referenciado en alguna subcuenta.';

procedure TWPaises.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      Active := False;
      Clear;
      Add('BPais', ftString, 2, False);
      Add('BNombre', ftString, 20, False);
      CreateDataSet;
      Active := True;
      Append;
      FieldByName('BPais').AsString   := '';
      FieldByName('BNombre').AsString := '';
   end;
end;

procedure TWPaises.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE PAISES SET NOMBRE=:NOMBRE,PAIS=:PAIS');
      Add('WHERE PAIS=:OLD_PAIS');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM PAISES');

      if TbFiltro.FieldByName('BPais').AsString <> '' then   begin
         Add('WHERE PAIS LIKE :PAIS');
      end
      else
      if TbFiltro.FieldByName('BNombre').AsString <> '' then   begin
         add('WHERE UPPER(NOMBRE) LIKE UPPER(:NOMBRE)');
      end;

      if FCampoOrden <> '' then   begin
         Add('ORDER BY ' + FCampoOrden);
      end;

      // Parámetros
      if TbFiltro.FieldByName('BPais').AsString <> '' then   begin
         Params.byname('PAIS').AsString :=
            Copy(TbFiltro.FieldByName('BPAIS').AsString + '%', 1,
            TbFiltro.FieldByName('BPAIS').Size);
      end
      else
      if TbFiltro.FieldByName('BNombre').AsString <> '' then   begin
         Params.byname('NOMBRE').AsString :=
            Copy(TbFiltro.FieldByName('BNombre').AsString + '%', 1,
            TbFiltro.FieldByName('BNombre').Size);
      end;

      Prepare;
      EnableControls;
      Open;
   end;
end;

procedure TWPaises.RefrescarBD;
begin
   FIbQueryRefresh(DmRef.QPaisNom);
end;

procedure TWPaises.BtnNavAniadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   Rejilla.SetFocus;
   try
      ePais.SetFocus;
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar un nuevo país.' + #13 + CADENA_MANUAL);
   end;
   Modo(Self, Edita);
end;

procedure TWPaises.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar este país?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar el país seleccionado.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWPaises.BtnNavImprimirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LPaises.rtm', SFichero);
end;

procedure TWPaises.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
   Msg:          String;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Msg contendrá la información a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg := '';

   if QFichero.FieldByName('Pais').AsString = '' then   begin
      Msg := Msg + 'No se puede dejar el código del país en blanco.' + #13;
   end;

   if QFichero.FieldByName('Nombre').AsString = '' then   begin
      Msg := Msg + 'No se puede dejar el nombre del país en blanco.' + #13;
   end;

   if Trim(Msg) <> '' then  begin
      Msg := Msg + 'Por favor, revise los datos de entrada.';
      ePais.SetFocus;
      DatabaseError(Msg);
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
      TbFiltro.FieldByName('BPais').AsString := QFicheroPais.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;

end;

procedure TWPaises.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;
   
   if MessageDlg('¿Quiere anular las modificaciones realizadas a este país?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
      Rejilla.SetFocus;
   end;
end;

procedure TWPaises.RejillaDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then  begin
      try QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      Modo(Self, Edita);
      ePais.SetFocus;
   end;
end;

procedure TWPaises.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobación del filtro por código de país
      if (FiltroBPais.Focused) and (FiltroBPais.AsString <> '') then   begin
         key := #0;
         if TbFiltro.State in dsEditModes then   begin
            TbFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobación del filtro por nombre
      else
      if (FiltroBNombre.Focused) and (Trim(FiltroBNombre.Text) <> '') then   begin
         key := #0;
         if TbFiltro.State in dsEditModes then   begin
            TbFiltro.Post;
         end;
         PrepararQuery;
      end

      //Si no es ninguno de los otros, dos pasamos al siguiente control
      else
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWPaises.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBPais.SetFocus;
end;

procedure TWPaises.FormCreate(Sender: TObject);
begin
   ActivarTransacciones(Self);
   CrearFiltro;
   FCampoOrden := 'PAIS';
   PrepararQuery;
   Modo(Self, Naveg);
end;

procedure TWPaises.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then   begin
            BtnEdtCancelar.Click;
         end
         else begin
            BtnNavCerrar.Click;
         end;
      end;
      VK_SPACE: begin
         if (ActiveControl <> FiltroBPais) and (ActiveControl <>
            FiltroBNombre) and not (QFichero.State in dsEditModes) then   begin
            //Anulamos el evento de la tecla
            Key := 0;
            RejillaDblClick(Self);
         end;
      end;
      VK_F2: begin
         if not (QFichero.State in dsEditModes) then   begin
            BtnNavAniadir.Click;
         end;
      end;
      VK_F3: begin
         if QFichero.State in dsEditModes then   begin
            BtnEdtGuardar.Click;
         end;
      end;
      VK_F4: begin
         if not (QFichero.State in dsEditModes) then begin
            RejillaDblClick(Self);
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
         if not (QFichero.State in dsEditModes) then   begin
            VerTabla(Sender);
         end;
      end;
   end;
end;

procedure TWPaises.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'NOMBRE') or (UpperCase(AFieldName) = 'PAIS') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWPaises.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWPaises.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WPaises    := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWPaises.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWPaises.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWPaises.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWPaises.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then   begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BPAIS').AsString   := '';
   TbFiltro.FieldByName('BNombre').AsString := '';
end;

procedure TWPaises.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BPAIS').AsString   := '';
      FieldByName('BNOMBRE').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

end.
