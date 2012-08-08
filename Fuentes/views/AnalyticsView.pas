unit AnalyticsView;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls,
     SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, wwdblook, Wwkeycb, CustomView;
type
   TAnalyticsView = class(TCustomView)
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
      eCuenta:         TOvcDbPictureField;
      FiltroBcuenta:   TOvcDbPictureField;
      QFicheroID_PROYECTO: TIBStringField;
      QFicheroID_SECCION: TIBStringField;
      QFicheroID_DEPARTAMENTO: TIBStringField;
      QFicheroID_DELEGACION: TIBStringField;
      QFicheroNOMBRE:  TIBStringField;
      QFicheroCUENTA:  TIBStringField;
      eDelegacion:     TwwDBLookupCombo;
      Label6:          TLabel;
      eDepartamento:   TwwDBLookupCombo;
      Label7:          TLabel;
      eSeccion:        TwwDBLookupCombo;
      Label8:          TLabel;
      eProyecto:       TwwDBLookupCombo;
      Label9:          TLabel;
      QFicheroNombreProyecto: TStringField;
      QFicheroNombreSeccion: TStringField;
      QFicheroNombreDepartamento: TStringField;
      QFicheroNombreDelegacion: TStringField;
      Rejilla:         TwwDBGrid;
      Panel2:          TPanel;
      Formulario:      TfcImageForm;
    DataSource: TDataSource;
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
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
      procedure RefrescarBD;
   public
   end;

implementation
uses DM, DMConta, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_BORRADO = 'Tiene asientos en el diario con ese concepto';
      CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TAnalyticsView.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BCuenta', ftString, 10, False);
      Add('BDescripcion', ftstring, 25, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BCuenta').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TAnalyticsView.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE ANALITICAS SET NOMBRE=:NOMBRE,CUENTA=:CUENTA,');
      Add('ID_PROYECTO=:ID_PROYECTO,ID_DELEGACION=:ID_DELEGACION,');
      Add('ID_DEPARTAMENTO=:ID_DEPARTAMENTO,ID_SECCION=:ID_SECCION');
      Add('WHERE CUENTA=:OLD_CUENTA');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM Analiticas');

      if TbFiltro.FieldByName('BCuenta').AsString <> '' then   begin
         Add('WHERE CUENTA LIKE :CUENTA');
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('where UPPER(NOMBRE) like UPPER(:NOMBRE)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BCuenta').AsString <> '' then   begin
         Params.ByName('CUENTA').AsString :=
            Copy(TbFiltro.FieldByName('BCUENTA').AsString + '%', 1,
            TbFiltro.FieldByName('BCUENTA').Size);
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         Params.byname('NOMBRE').AsString :=
            Copy(TbFiltro.FieldByName('BDescripcion').AsString + '%', 1,
            TbFiltro.FieldByName('BDescripcion').Size);
      end;

      Prepare;
      Open;
      EnableControls;
   end;
end;

procedure TAnalyticsView.BtnNavAniadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;
   
   Navegador.Visible := False;
   eCuenta.SetFocus;
   QFichero.Insert;
   Mode := fmEdit;
end;

procedure TAnalyticsView.BtnNavBorrarClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then   begin
      if MessageDlg('¿Desea borrar esta cuenta analítica?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         try QFichero.Delete;
             QFichero.Transaction.CommitRetaining;
             RefrescarBD;
         except DatabaseError('No se ha podido borrar la cuenta seleccionada.' + #13 + CADENA_BORRADO);
         end;
      end;
   end;
end;

procedure TAnalyticsView.BtnNavImprimirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LAnaliticas.rtm', SFichero);
end;

procedure TAnalyticsView.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('cuenta').AsString = '' then  begin
      eCuenta.SetFocus;
      DatabaseError('No se puede dejar la cuenta en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;
   if QFichero.FieldByName('Nombre').AsString = '' then  begin
      eDescripcion.SetFocus;
      DatabaseError('No se puede dejar el nombre de la cuenta en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;

   RefrescarBD;
   Navegador.Visible := True;
   Mode := fmView;
   Rejilla.SetFocus;
   if ha_insertado then  begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BCuenta').AsString := QFicheroCuenta.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;
end;

procedure TAnalyticsView.BtnEdtCancelarClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;
   if MessageDlg('¿Confirma la generación de asientos automáticos?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Mode := fmView;
   end;
end;

procedure TAnalyticsView.RejillaDblClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then  begin
      Navegador.Visible := False;
      try QFichero.Edit;
      except
         MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL,
                    mtInformation, [mbOK], 0);
      end;
      Mode := fmEdit;
      eCuenta.SetFocus;
   end;
end;

procedure TAnalyticsView.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobacion del filtro por codigo de provincia
      if (FiltroBCuenta.Focused) and (FiltroBCuenta.Text <> '') then   begin
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

procedure TAnalyticsView.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBCuenta.SetFocus;
end;

procedure TAnalyticsView.FormCreate(Sender: TObject);
begin
   //ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'CUENTA';
   PrepararQuery;
   Mode := fmView;
end;

procedure TAnalyticsView.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         if (ActiveControl <> FiltroBCuenta) and
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

procedure TAnalyticsView.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'CUENTA') or (UpperCase(AFieldName) = 'NOMBRE') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TAnalyticsView.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TAnalyticsView.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TAnalyticsView.FormClose(Sender: TObject; var action: TCloseaction);
begin
   if QFichero.State = dsBrowse then  begin
      action := caFree;
      Formulario.Free;
      Formulario  := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TAnalyticsView.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TAnalyticsView.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TAnalyticsView.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TAnalyticsView.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BCuenta').AsString      := '';
   TbFiltro.FieldByName('BDescripcion').AsString := '';
end;

procedure TAnalyticsView.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BCuenta').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

procedure TAnalyticsView.QFicheroCalcFields(DataSet: TDataSet);
begin
   // if Dataset.FieldByName('TipoConcepto').AsString = 'I' then
   //   Dataset.FieldByName('TipoConceptoDesc').AsString := 'I.V.A.'
end;

procedure TAnalyticsView.RefrescarBD;
begin
   DMRef.QAnaliticas.Close;
   DMRef.QAnaliticasNom.Close;

   DMRef.QAnaliticas.Open;
   DMRef.QAnaliticasNom.Open;
end;

end.
