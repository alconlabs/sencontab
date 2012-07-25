unit UGrupos;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls,
     SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, Wwkeycb, CustomView;
type
   TWGrupos = class(TCustomView)
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
      eCampoInicial:   TOvcDbPictureField;
      FiltroBGrupo:    TOvcDbPictureField;
      QFicheroDESCRIPCION: TIBStringField;
      QFicheroGRUPO:   TIBStringField;
      BtnNavModificar: TfcImageBtn;
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

var WGrupos: TWGrupos;

implementation
uses DM, DMConta, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'El grupo selecccionado esta referenciado en alguna cuenta.';

procedure TWGrupos.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BGrupo', ftString, 3, False);
      Add('BDescripcion', ftstring, 50, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BGrupo').AsString       := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TWGrupos.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE GRUPOS SET DESCRIPCION=:DESCRIPCION,GRUPO=:GRUPO');
      Add('WHERE GRUPO=:OLD_GRUPO');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM Grupos');

      if TbFiltro.FieldByName('BGrupo').AsString <> '' then   begin
         add(' WHERE UPPER(Grupo) LIKE UPPER(:Grupo)');
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('where UPPER(Descripcion) like UPPER(:Descripcion)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BGrupo').AsString <> '' then   begin
         Params.byname('Grupo').AsString :=
            Copy(TbFiltro.FieldByName('BGrupo').AsString + '%', 1,
            TbFiltro.FieldByName('BGrupo').Size);
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         Params.byname('Descripcion').AsString :=
            Copy(TbFiltro.FieldByName('BDescripcion').AsString + '%', 1,
            TbFiltro.FieldByName('BDescripcion').Size);
      end;

      Prepare;
      Open;
      EnableControls;
   end;
end;

procedure TWGrupos.RefrescarBD;
begin
   DmContaRef.QGrupos.Close;
   DmContaRef.QGruposDesc.Close;

   DmContaRef.QGrupos.Open;
   DmContaRef.QGruposDesc.Open;
end;

procedure TWGrupos.BtnNavAniadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   Navegador.Visible := False;

   eCampoInicial.SetFocus;
   try
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar un nuevo grupo.' + #13 + CADENA_MANUAL);
   end;
   Modo(Self, Edita);
end;

procedure TWGrupos.BtnNavBorrarClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar este grupo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar el grupo seleccionado.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWGrupos.BtnNavImprimirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LGrupos.rtm', SFichero);
end;

procedure TWGrupos.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('Grupo').AsString = '' then  begin
      eCampoInicial.SetFocus;
      DatabaseError('No se puede dejar el código del grupo en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   if QFichero.FieldByName('Descripcion').AsString = '' then  begin
      eCampoInicial.SetFocus;
      DatabaseError('No se puede dejar el nombre del grupo en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   if not DMRef.ExistenRegistros('TITULOS', 'TITULO = "' +
      Copy(QFichero.FieldByName('GRUPO').AsString, 1, 2) + '"') then  begin
      eCampoInicial.SetFocus;
      DatabaseError('No existe el título ' + Copy(
         QFichero.FieldByName('GRUPO').AsString, 1, 2) + ' al que pertenece el grupo.' +
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
      TbFiltro.FieldByName('BGrupo').AsString := QFicheroGrupo.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;

end;

procedure TWGrupos.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;

   if MessageDlg('¿Quiere anular las modificaciones realizadas a este grupo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
   end;
end;

procedure TWGrupos.RejillaDblClick(Sender: TObject);
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
      eCampoInicial.SetFocus;
   end;
end;

procedure TWGrupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobacion del filtro por codigo de provincia
      if (FiltroBGrupo.Focused) and (FiltroBGrupo.Text <> '') then   begin
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

procedure TWGrupos.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBGrupo.SetFocus;
end;

procedure TWGrupos.FormCreate(Sender: TObject);
begin
   //ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'Grupo';
   PrepararQuery;
   Modo(Self, Naveg);
end;

procedure TWGrupos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         if (ActiveControl <> FiltroBGrupo) and
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

procedure TWGrupos.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'GRUPO') or (UpperCase(AFieldName) = 'DESCRIPCION') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWGrupos.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWGrupos.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WGrupos    := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWGrupos.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWGrupos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWGrupos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWGrupos.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BGrupo').AsString       := '';
   TbFiltro.FieldByName('BDescripcion').AsString := '';
end;

procedure TWGrupos.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BGrupo').AsString       := '';
      FieldByName('BDescripcion').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

end.
