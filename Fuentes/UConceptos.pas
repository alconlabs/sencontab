unit UConceptos;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils,
     WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, wwdblook, Wwkeycb,
     CustomView;

type
   TWConceptos = class(TCustomView)
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
      QFicheroTIPOCONCEPTO: TIBStringField;
      DBRadioGroup1:   TDBRadioGroup;
      QFicheroTipoConceptoDesc: TStringField;
      QFicheroDESCRIPCION: TIBStringField;
      BtnNavModificar: TfcImageBtn;
      QFicheroTIPOCONTABILIDAD: TIBStringField;
      QFicheroTipoContabilidadDesc: TIBStringField;
      QFicheroID_CONCEPTOS: TIBStringField;
      Label1:          TLabel;
      eConcepto:       TOvcDbPictureField;
      DBRadioGroup2:   TDBRadioGroup;
      FiltroBconcepto: TOvcDbPictureField;
      QFicheroOBSOLETO: TIBStringField;
      DBCheckBox2:     TDBCheckBox;
      Rejilla:         TwwDBGrid;
      Panel2:          TPanel;
      Label6:          TLabel;
      eContrapartida:  TwwDBLookupCombo;
      ComboContrapartidaDesc: TwwDBLookupCombo;
      Label7:          TLabel;
      eSubcuenta:      TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      QFicheroSUBCUENTA: TIBStringField;
      QFicheroCONTRAPARTIDA: TIBStringField;
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
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure QFicheroNewRecord(DataSet: TDataSet);
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
      procedure RefrescarBD;
   public
   end;

var WConceptos: TWConceptos;

implementation
uses DM, DMConta, DMControl, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_BORRADO = 'Tiene asientos en el diario con ese concepto';
      CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWConceptos.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BConcepto', ftString, 3, False);
      Add('BDescripcion', ftstring, 25, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BConcepto').AsString    := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TWConceptos.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE CONCEPTOS SET DESCRIPCION=:DESCRIPCION,ID_CONCEPTOS=:ID_CONCEPTOS,');
      Add('TIPOCONTABILIDAD=:TIPOCONTABILIDAD,TIPOCONCEPTO=:TIPOCONCEPTO,OBSOLETO=:OBSOLETO,');
      Add('SUBCUENTA=:SUBCUENTA, CONTRAPARTIDA=:CONTRAPARTIDA');
      Add('WHERE ID_CONCEPTOS=:OLD_ID_CONCEPTOS');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM Conceptos');

      if TbFiltro.FieldByName('BConcepto').AsString <> '' then   begin
         Add('WHERE ID_CONCEPTOS LIKE :IDCONCEPTOS');
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('where UPPER(Descripcion) like UPPER(:Descripcion)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BConcepto').AsString <> '' then   begin
         Params.ByName('IDCONCEPTOS').AsString :=
            Copy(TbFiltro.FieldByName('BCONCEPTO').AsString + '%', 1,
            TbFiltro.FieldByName('BCONCEPTO').Size);
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

procedure TWConceptos.RefrescarBD;
begin
   FIbQueryRefresh(DmContaRef.QConceptos);
   FIbQueryRefresh(DmContaRef.QConceptosDesc);
end;

procedure TWConceptos.BtnNavAniadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   Navegador.Visible := False;
   eConcepto.SetFocus;
   QFichero.Insert;
   Modo(Self, Edita);
end;

procedure TWConceptos.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar este concepto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar el concepto seleccionado.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWConceptos.BtnNavImprimirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LConceptos.rtm', SFichero);
end;

procedure TWConceptos.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('Id_Conceptos').AsString = '' then  begin
      eConcepto.SetFocus;
      DatabaseError('No se puede dejar el concepto en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;
   if QFichero.FieldByName('Descripcion').AsString = '' then  begin
      eDescripcion.SetFocus;
      DatabaseError('No se puede dejar el nombre del concepto en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
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
      TbFiltro.FieldByName('BConcepto').AsString := QFicheroID_conceptos.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;
end;

procedure TWConceptos.BtnEdtCancelarClick(Sender: TObject);
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

procedure TWConceptos.RejillaDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then  begin
      Navegador.Visible := False;
      try
         QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      Modo(Self, Edita);
      eConcepto.SetFocus;
   end;
end;

procedure TWConceptos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobacion del filtro por codigo de provincia
      if (FiltroBConcepto.Focused) and (FiltroBConcepto.Text <> '') then   begin
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

procedure TWConceptos.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBConcepto.SetFocus;
end;

procedure TWConceptos.FormCreate(Sender: TObject);
begin
   ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'ID_CONCEPTOS';
   PrepararQuery;
   Modo(Self, Naveg);

   eSubcuenta.MaxLength     := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   eContrapartida.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
end;

procedure TWConceptos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         if (ActiveControl <> FiltroBConcepto) and
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
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) then
         begin
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

procedure TWConceptos.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'ID_CONCEPTOS') or (UpperCase(AFieldName) = 'DESCRIPCION') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWConceptos.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWConceptos.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWConceptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WConceptos := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWConceptos.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWConceptos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWConceptos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWConceptos.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BConcepto').AsString    := '';
   TbFiltro.FieldByName('BDescripcion').AsString := '';
end;

procedure TWConceptos.VerTabla(Sender: TObject);
begin
  {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BConcepto').AsString    := '';
      FieldByName('BDescripcion').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

procedure TWConceptos.QFicheroCalcFields(DataSet: TDataSet);
begin
   if Dataset.FieldByName('TipoConcepto').AsString = 'I' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := 'I.V.A.';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = '3' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := '347';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = '1' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := '110';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = '9' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := '349';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = '2' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := '216';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = 'O' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := 'Otros';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = 'A' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := 'Apertura';
   end
   else
   if Dataset.FieldByName('TipoConcepto').AsString = 'C' then   begin
      Dataset.FieldByName('TipoConceptoDesc').AsString := 'Cierre';
   end;

   if Dataset.FieldByName('TipoContabilidad').AsString = 'N' then   begin
      Dataset.FieldByName('TipoContabilidadDesc').AsString := 'Normal';
   end
   else
   if Dataset.FieldByName('TipoContabilidad').AsString = 'E' then   begin
      Dataset.FieldByName('TipoContabilidadDesc').AsString := 'Especial';
   end;
end;

procedure TWConceptos.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroTipoContabilidad.AsString := 'N';
   QFicheroObsoleto.AsString         := 'N';
   QFicheroTipoConcepto.AsString     := 'O';
end;

end.
