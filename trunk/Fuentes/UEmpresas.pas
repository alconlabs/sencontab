unit UEmpresas;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids, DB,
     DBTables, OvcBase, OvcPF, OvcDbPF, OvcEF, OvcPB, OvcNF, OvcDbNF, StdCtrls, Buttons, Wwkeycb, ExtCtrls,
     DBCtrls, DBClient, IBDatabase, IBCustomDataSet, IBTableSet, Wwdatsrc, Wwdbigrd, Wwdbgrid,
     navegadorNotarios, fcButton, fcImgBtn, jpeg, Mask, IBSQL, StFileOp, fcImage, fcimageform, SsBase;

type
   TWEmpresas = class(TForm)
      OvcController1:  TOvcController;
      SFichero:        TwwDataSource;
      QFichero:        TIBTableSet;
      Transaccion:     TIBTransaction;
      Datos:           TGroupBox;
      Label2:          TLabel;
      eNombre:         TOvcDbPictureField;
      Shape1:          TShape;
      Label3:          TLabel;
      Panel1:          TPanel;
      BtnNavAniadir:   TfcImageBtn;
      BtnNavBorrar:    TfcImageBtn;
      BtnEdtGuardar:   TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      FiltroBuscar:    TGroupBox;
      FiltroBNombre:   TOvcDbPictureField;
      TbFiltro:        TClientDataSet;
      sFiltro:         TDataSource;
      Panel3:          TPanel;
      Panel5:          TPanel;
      Panel4:          TPanel;
      PanelSombra:     TPanel;
      Navegador:       TDBNavegadorNotarios;
      Label4:          TLabel;
      BtnNavFiltro:    TfcImageBtn;
      BtnNavImprimir:  TfcImageBtn;
      BtnNavModificar: TfcImageBtn;
      QFicheroCERRADA: TIBStringField;
      QFicheroCLAVE:   TIBStringField;
      QFicheroUBICACION: TIBStringField;
      QFicheroNOMBRE:  TIBStringField;
      QFicheroID_EMPRESA: TIntegerField;
      QFicheroULTIMA:  TIBStringField;
      Label5:          TLabel;
      eUbicacion:      TOvcDbPictureField;
      oCerrada:        TDBCheckBox;
      BtnNavDuplicar:  TfcImageBtn;
      BtnNavCopiar:    TfcImageBtn;
      CopiaBD:         TStFileOperation;
      BtnNavSelecciona: TfcImageBtn;
      BtnNavUtilidades: TfcImageBtn;
      QFicheroSERVIDOR: TIBStringField;
      Label1:          TLabel;
      OvcDbPictureField1: TOvcDbPictureField;
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
      procedure FormClose(Sender: TObject; var action: TCloseaction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure LimpiarFiltro(Sender: TObject);
      procedure VerTabla(Sender: TObject);
      procedure BtnNavImprimirClick(Sender: TObject);
      procedure BtnNavCopiarClick(Sender: TObject);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure eNombreExit(Sender: TObject);
      procedure BtnNavSeleccionaClick(Sender: TObject);
      procedure BtnNavDuplicarClick(Sender: TObject);
      procedure BtnNavUtilidadesClick(Sender: TObject);
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
   public
      lDuplicado:          Boolean;
      cUbicacionDuplicado: String;
   end;

var WEmpresas: TWEmpresas;

implementation
uses cadenas, DM, DMConta, DMControl, General, Globales, UEspere, MenuPrincipal, UUtilEmpresas;
{$R *.DFM}

const CADENA_BORRADO = 'Tiene asientos en el diario con ese concepto';
      CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWEmpresas.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BNombre', ftstring, 25, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BNombre').AsString := '';
   end;
end;

procedure TWEmpresas.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM empresas');

      if TbFiltro.FieldByName('BNombre').AsString <> '' then   begin
         add('where UPPER(nombre) like UPPER(:nombre)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BNombre').AsString <> '' then   begin
         Params.byname('nombre').AsString :=
            Copy(TbFiltro.FieldByName('BNombre').AsString + '%', 1,
            TbFiltro.FieldByName('BNombre').Size);
      end;

      Prepare;
      Open;

      while not EOF do begin
         if FieldByName('ID_EMPRESA').AsInteger = gvEmpresaActual then   begin
            Break;
         end
         else begin
            Next;
         end;
      end;

      EnableControls;
   end;
end;

procedure TWEmpresas.BtnNavAniadirClick(Sender: TObject);
var
   cUbicacion: String;
   i:          Word;
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   cUbicacion := Trim(QficheroUbicacion.AsString);
   for i := length(cUbicacion) downto 0 do begin
      if cUbicacion[i] = '\' then begin
         break;
      end;
   end;
   cUbicacion        := Copy(cUbicacion, 1, i);
   Navegador.Visible := False;
   eNombre.SetFocus;
   QFichero.Insert;
   QficheroUbicacion.AsString := cUbicacion;
   Modo(Self, Edita);
end;

procedure TWEmpresas.BtnNavBorrarClick(Sender: TObject);
var
   cUbicacion, cNombreBD: String;
   nLong, i: Integer;
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then begin
      if MessageDlg('¿Desea borrar esta empresa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         try
            cUbicacion := Trim(QFicheroUbicacion.AsString);
            nLong      := Length(cUbicacion);
            for i := nLong downto 0 do begin
               if cUbicacion[i] = '\' then begin
                  break;
               end;
            end;
            cNombreBd := Copy(cUbicacion, i + 1, nLong - i);
            QFichero.Delete;
            QFichero.Transaction.CommitRetaining;
            // Borrar la base de datos actual
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with CopiaBD, SourceFiles do begin
               Operation := fopDelete;
               Clear;
               Add(gvdirectorio + 'datos\' + cNombreBD);
               Execute;
            end;
         except
            DatabaseError('No se ha podido borrar la empresa seleccionada.' + #13 +
               CADENA_BORRADO);
         end;
      end;
   end;
end;

procedure TWEmpresas.BtnNavImprimirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LEmpresas.rtm', SFichero);
end;

procedure TWEmpresas.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
   cUbicacion, cNombreBD, cNombreBDDup: String;
   nLong, i:     Integer;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('Nombre').AsString = '' then  begin
      eNombre.SetFocus;
      DatabaseError('No se puede dejar el nombre de la empresa en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   // Si está añadiendo verificar que no existe otra con el mismo nombre
   if ha_insertado then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSql.Create(nil), sql do begin
         database := DmControlRef.bdcontrol;
         add('select count(*) as cuantos from empresas where upper(nombre)=upper(:nombre)');
         parambyname('nombre').AsString := QFicheroNombre.AsString;
         ExecQuery;
         if (FieldByName('cuantos').AsInteger > 0) then   begin
            Close;
            Free;
            eNombre.SetFocus;
            DatabaseError('El nombre de esta empresa ya existe.' + #13 +
               'Por favor, revise los datos de entrada.');
         end;
         Close;
         Free;
      end;
   end;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;
   if ha_insertado then  begin
      cUbicacion := QFicheroUbicacion.AsString;
      nLong      := Length(cUbicacion);
      for i := nLong downto 0 do begin
         if cUbicacion[i] = '\' then begin
            break;
         end;
      end;
      cNombreBd := Copy(cUbicacion, i + 1, nLong - i);

      if lDuplicado then   begin
         nLong := Length(cUbicacionDuplicado);
         for i := nLong downto 0 do begin
            if cUbicacionDuplicado[i] = '\' then begin
               break;
            end;
         end;
         cNombreBdDup := Copy(cUbicacionDuplicado, i + 1, nLong - i);
      end;

      // Copiar la actual sobre la de copia
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with CopiaBD, SourceFiles do begin
         Operation := fopCopy;
         Clear;
         //Destination:=gvDirectorio+'datos';
         if lDuplicado then   begin
            Add(gvDirectorio + 'datos\' + cNombreBDDup + '=' + gvDirectorio + 'datos\' + cNombreBD);
         end
         //Add(cNombreBDDup+'='+cNombreBD)
         else begin
            Add(gvDirectorio + 'datos\BD_Modelo.ib=' + gvDirectorio + 'datos\' + cNombreBD);
         end;
         Execute;
      end;
   end;

   Navegador.Visible := True;
   Modo(Self, Naveg);
   Rejilla.SetFocus;
   if ha_insertado then  begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BNombre').AsString := QFicheroNombre.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;
   lDuplicado := False;
end;

procedure TWEmpresas.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   if not QFichero.Modified then Exit;
   if MessageDlg('¿Quiere anular las modificaciones realizadas a este concepto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
   end;
end;

procedure TWEmpresas.RejillaDblClick(Sender: TObject);
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
      eNombre.SetFocus;
   end;
end;

procedure TWEmpresas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
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

procedure TWEmpresas.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBNombre.SetFocus;
end;

procedure TWEmpresas.FormCreate(Sender: TObject);
begin
   lDuplicado := False;
   ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'NOMBRE';
   PrepararQuery;
   Modo(Self, Naveg);
end;

procedure TWEmpresas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then begin
            BtnEdtCancelar.Click;
         end;
      end;
      VK_SPACE: begin
         if (ActiveControl <> FiltroBNombre) and not
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

procedure TWEmpresas.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'NOMBRE') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWEmpresas.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWEmpresas.FormClose(Sender: TObject; var action: TCloseaction);
begin
   if QFichero.State = dsBrowse then  begin
      action := caFree;
      Formulario.Free;
      Formulario := nil;
      WEmpresas  := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWEmpresas.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWEmpresas.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWEmpresas.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BNombre').AsString := '';
end;

procedure TWEmpresas.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BNombre').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

procedure TWEmpresas.BtnNavCopiarClick(Sender: TObject);
var
   cNombreEmpresa, cUbicacion, cServidor, cNombreBd: String;
   nLong, i:  Integer;
   lInsertar: Boolean;
begin
   if MessageDlg('¿Quiere hacer una copia de la empresa ' + Trim(QficheroNombre.AsString) + ' ?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      cNombreEmpresa := Trim(QFicheroNombre.AsString) + ' copia ';
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSql.Create(nil), sql do begin
         database := DmControlRef.bdcontrol;
         add('select count(*) as cuantos from empresas where upper(nombre)=upper(:nombre)');
         parambyname('nombre').AsString := cNombreEmpresa;
         ExecQuery;
         lInsertar := not (FieldByName('cuantos').AsInteger > 0);
         Close;
         Free;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Qfichero do begin
         cUbicacion := Trim(FieldByName('ubicacion').AsString);
         cServidor  := Trim(FieldByName('servidor').AsString);
         nLong      := Length(cUbicacion);
         if lInsertar then   begin
            insert;
            edit;
            FieldByName('nombre').AsString    := cNombreEmpresa;
            FieldByName('ubicacion').AsString := Copy(cUbicacion, 1, nLong - 4) + 'copia.ib';
            FieldByName('servidor').AsString  := cServidor;
            post;
            Transaction.CommitRetaining;
         end;
      end;
      for i := nLong downto 0 do begin
         if cUbicacion[i] = '\' then begin
            break;
         end;
      end;
      cNombreBd := Copy(cUbicacion, i + 1, nLong - i);
      nLong     := Length(cNombreBD);
      // Copiar la actual sobre la de copia
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with CopiaBD, SourceFiles do begin
         Operation := fopCopy;
         Clear;
         Destination := gvDirectorio + 'datos';
         //Add(cNombreBD+'='+Copy(cNombreBD,1,nLong-4)+'copia.gdb');
         Add(gvDirectorio + 'datos\' + cNombreBD + '=' + gvDirectorio + 'datos\' + Copy(
            cNombreBD, 1, nLong - 4) + 'copia.ib');
         Execute;
      end;
   end;
end;

procedure TWEmpresas.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroCerrada.AsString := 'N';
end;

procedure TWEmpresas.eNombreExit(Sender: TObject);
var
   cUbicacion: String;
   i:          Word;
begin
   if (QFichero.State = dsInsert) then begin
      cUbicacion := Trim(QficheroUbicacion.AsString);
      for i := length(cUbicacion) downto 0 do begin
         if cUbicacion[i] = '\' then begin
            break;
         end;
      end;
      cUbicacion := Copy(cUbicacion, 1, i);
      QFicheroUbicacion.AsString := cUbicacion + Trim(QFicheroNombre.AsString) + '.ib';
   end;
end;

procedure TWEmpresas.BtnNavSeleccionaClick(Sender: TObject);
begin
   gvEmpresaActual := QFicheroID_EMPRESA.AsInteger;
   DMControlRef.AbrirEmpresa(gvEmpresaActual);
   FormPrincipal.PonerTituloMenu;
   Close;
end;

procedure TWEmpresas.BtnNavDuplicarClick(Sender: TObject);
var
   cUbicacion, cNombre, cServidor: String;
   i: Word;
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   if MessageDlg('¿Quiere hacer un duplicado de la empresa ' + Trim(QficheroNombre.AsString) + ' ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      cNombre    := Trim(QFicheroNombre.AsString);
      cUbicacionDuplicado := Trim(QFicheroUbicacion.AsString);
      lDuplicado := True;
      cServidor  := Trim(QFicheroServidor.AsString);
      cUbicacion := Trim(QficheroUbicacion.AsString);
      cNombre    := Trim(QficheroNombre.AsString);
      for i := length(cUbicacion) downto 0 do begin
         if cUbicacion[i] = '\' then begin
            break;
         end;
      end;
      cUbicacion        := Copy(cUbicacion, 1, i);
      Navegador.Visible := False;
      eNombre.SetFocus;
      QFichero.Insert;
      QficheroNombre.AsString    := cNombre + ' duplicado';
      QficheroServidor.AsString  := cServidor;
      QficheroUbicacion.AsString := cUbicacion + Trim(QficheroNombre.AsString) + '.ib';
      Modo(Self, Edita);
   end;
end;

procedure TWEmpresas.BtnNavUtilidadesClick(Sender: TObject);
begin
   if not Assigned(WUtilEmpresas) then  begin
      WUtilEmpresas := TWUtilEmpresas.Create(nil);
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with WUtilEmpresas do begin
      lbNombreEmpresa.Caption := 'Base de Datos actual: ' + Trim(QFicheroNombre.AsString);
      cUbicacionEmpresa       := Trim(QFicheroUbicacion.AsString);
      cNombreServidor         := Trim(QFicheroServidor.AsString);
      ShowModal;
   end;
end;

end.
