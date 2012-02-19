unit UTitulos;
interface
uses Buttons, Classes, Controls, Dialogs, ExtCtrls, Forms, Graphics, Grids, IBCustomDataSet, IBQuery,
     IBTableSet, Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, DBClient, DB,
     fcButton, fcImgBtn, fcImage, fcimageform, IBDatabase,
     CustomView;

type
   TWTitulos = class(TCustomView)
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
      QFicheroTITULO:  TIBStringField;
      QFicheroDESCRIPCION: TIBStringField;
      QFicheroSUMA1:   TIBStringField;
      QFicheroSUMA2:   TIBStringField;
      QFicheroSUMA3:   TIBStringField;
      QFicheroSUMA4:   TIBStringField;
      QFicheroSUMA5:   TIBStringField;
      QFicheroSUMA6:   TIBStringField;
      QFicheroRESTA1:  TIBStringField;
      QFicheroRESTA2:  TIBStringField;
      QFicheroRESTA3:  TIBStringField;
      QFicheroRESTA4:  TIBStringField;
      QFicheroRESTA5:  TIBStringField;
      QFicheroRESTA6:  TIBStringField;
      eCampoInicial:   TOvcDbPictureField;
      FiltroBTitulo:   TOvcDbPictureField;
      OvcSuma2:        TOvcDbPictureField;
      OvcSuma3:        TOvcDbPictureField;
      OvcSuma4:        TOvcDbPictureField;
      OvcSuma5:        TOvcDbPictureField;
      OvcSuma6:        TOvcDbPictureField;
      OvcResta1:       TOvcDbPictureField;
      OvcResta2:       TOvcDbPictureField;
      OvcResta3:       TOvcDbPictureField;
      OvcResta4:       TOvcDbPictureField;
      OvcResta5:       TOvcDbPictureField;
      OvcResta6:       TOvcDbPictureField;
      OvcSuma1:        TOvcDbPictureField;
      Label6:          TLabel;
      Label7:          TLabel;
      Label8:          TLabel;
      Label9:          TLabel;
      Label10:         TLabel;
      Label11:         TLabel;
      Label12:         TLabel;
      Label13:         TLabel;
      Label14:         TLabel;
      Label15:         TLabel;
      Label16:         TLabel;
      Label17:         TLabel;
      Label18:         TLabel;
      BtnNavModificar: TfcImageBtn;
      QFicheroSUMA7:   TIBStringField;
      QFicheroRESTA8:  TIBStringField;
      QFicheroRESTA7:  TIBStringField;
      QFicheroSUMA8:   TIBStringField;
      Label19:         TLabel;
      OvcSuma7:        TOvcDbPictureField;
      Label20:         TLabel;
      OvcSuma8:        TOvcDbPictureField;
      Label21:         TLabel;
      OvcResta7:       TOvcDbPictureField;
      Label22:         TLabel;
      OvcResta8:       TOvcDbPictureField;
      QFicheroFormula: TStringField;
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
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure SoloSiAniadir(Sender: TObject);
   private
      FCampoOrden: String;
      procedure CrearFiltro;
      procedure PrepararQuery;
      procedure RefrescarBD;
      function ExisteFormula(Formula: String): Boolean;
      procedure ComprobarFormula;
   public
   end;

var WTitulos: TWTitulos;

implementation
uses DM, DMControl, General, Globales, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'El título se utiliza en algún grupo.';

procedure TWTitulos.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro, FieldDefs do begin
      active := False;
      Clear;
      Add('BTitulo', ftString, 2, False);
      Add('BDescripcion', ftstring, 50, False);
      CreateDataSet;
      active := True;
      append;
      FieldByName('BTitulo').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
   end;
end;

procedure TWTitulos.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Add('SELECT * FROM TITULOS');

      if TbFiltro.FieldByName('BTitulo').AsString <> '' then   begin
         add(' WHERE UPPER(Titulo) LIKE UPPER(:Titulo) ');
      end
      else
      if TbFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('where UPPER(Descripcion) like UPPER(:Descripcion)');
      end;

      if FCampoOrden <> '' then begin
         Add('ORDER BY ' + FCampoOrden);
      end;


      if TbFiltro.FieldByName('BTitulo').AsString <> '' then   begin
         Params.byname('Titulo').AsString :=
            Copy(TbFiltro.FieldByName('BTitulo').AsString + '%', 1,
            TbFiltro.FieldByName('BTitulo').Size);
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

procedure TWTitulos.RefrescarBD;
begin
end;

function TWTitulos.ExisteFormula(Formula: String): Boolean;
var
   Existe: Boolean;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Database := DMRef.IBDSiamCont;

      // Comprobar que existe el grupo
      Close;
      Clear;
      Add('SELECT GRUPO FROM GRUPOS WHERE GRUPO = :FORMULA');
      ParamByName('FORMULA').AsString := Formula;
      Open;
      Existe := not EOF;

      if not Existe then   begin
         Close;
         Clear;
         // Comprobar que existe el título
         Add('SELECT TITULO FROM TITULOS WHERE TITULO = :FORMULA');
         ParamByName('FORMULA').AsString := Copy(Formula, 1, 2);
         Open;
         Existe := not EOF;
      end;

      Close;
      Free;
   end;

   Result := Existe;
end;

procedure TWTitulos.ComprobarFormula;
begin
   // Sumas
   if (QFicheroSUMA1.AsString <> '') and not ExisteFormula(QFicheroSUMA1.AsString) then  begin
      OvcSuma1.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA1.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA2.AsString <> '') and not ExisteFormula(QFicheroSUMA2.AsString) then  begin
      OvcSuma2.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA2.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA3.AsString <> '') and not ExisteFormula(QFicheroSUMA3.AsString) then  begin
      OvcSuma3.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA3.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA4.AsString <> '') and not ExisteFormula(QFicheroSUMA4.AsString) then  begin
      OvcSuma4.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA4.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA5.AsString <> '') and not ExisteFormula(QFicheroSUMA5.AsString) then  begin
      OvcSuma5.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA5.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA6.AsString <> '') and not ExisteFormula(QFicheroSUMA6.AsString) then  begin
      OvcSuma6.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA6.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA7.AsString <> '') and not ExisteFormula(QFicheroSUMA7.AsString) then  begin
      OvcSuma7.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA7.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroSUMA8.AsString <> '') and not ExisteFormula(QFicheroSUMA8.AsString) then  begin
      OvcSuma8.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroSUMA8.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;

   // Restas
   if (QFicheroRESTA1.AsString <> '') and not ExisteFormula(QFicheroRESTA1.AsString) then  begin
      OvcResta1.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA1.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA2.AsString <> '') and not ExisteFormula(QFicheroRESTA2.AsString) then  begin
      OvcResta2.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA2.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA3.AsString <> '') and not ExisteFormula(QFicheroRESTA3.AsString) then  begin
      OvcResta3.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA3.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA4.AsString <> '') and not ExisteFormula(QFicheroRESTA4.AsString) then  begin
      OvcResta4.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA4.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA5.AsString <> '') and not ExisteFormula(QFicheroRESTA5.AsString) then  begin
      OvcResta5.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA5.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA6.AsString <> '') and not ExisteFormula(QFicheroRESTA6.AsString) then  begin
      OvcResta6.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA6.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA7.AsString <> '') and not ExisteFormula(QFicheroRESTA7.AsString) then  begin
      OvcResta7.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA7.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
   if (QFicheroRESTA8.AsString <> '') and not ExisteFormula(QFicheroRESTA8.AsString) then  begin
      OvcResta8.SetFocus;
      DatabaseError('El grupo o título ' + QFicheroRESTA8.AsString + ' no existe.' +
         #13 + 'Por favor, revise los datos de entrada.');
   end;
end;

procedure TWTitulos.BtnNavAniadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   Navegador.Visible := False;

   try
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar un nuevo título.' + #13 +
         CADENA_MANUAL);
   end;
   eCampoInicial.SetFocus;
   Modo(Self, Edita);
end;

procedure TWTitulos.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   
   if MessageDlg('¿Desea borrar este título?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      QFichero.Delete;
      QFichero.Transaction.CommitRetaining;
      RefrescarBD;
   end;
end;

procedure TWTitulos.BtnNavImprimirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LTitulos.rtm', SFichero);
end;

procedure TWTitulos.BtnEdtGuardarClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('Titulo').AsString = '' then  begin
      eCampoInicial.SetFocus;
      DatabaseError('No se puede dejar el código del título en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;


   if QFichero.FieldByName('Descripcion').AsString = '' then  begin
      eNombre.SetFocus;
      DatabaseError('No se puede dejar el nombre del título en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   ComprobarFormula;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;

   Navegador.Visible := True;
   Modo(Self, Naveg);
   Rejilla.SetFocus;
   if ha_insertado then  begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BTitulo').AsString := QFicheroTitulo.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;
end;

procedure TWTitulos.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Exit;

   if MessageDlg('¿Quiere anula las modificaciones realizadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Navegador.Visible := True;
      try QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
   end;
end;

procedure TWTitulos.RejillaDblClick(Sender: TObject);
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

procedure TWTitulos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobacion del filtro por codigo de provincia
      if (FiltroBTitulo.Focused) and (FiltroBTitulo.Text <> '') then   begin
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

//------------------------------------------------------------------------------

procedure TWTitulos.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBTitulo.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TWTitulos.FormCreate(Sender: TObject);
begin
   ActivarTransacciones(self);
   CrearFiltro;
   FCampoOrden := 'TITULO';
   PrepararQuery;
   Modo(Self, Naveg);
end;

//------------------------------------------------------------------------------

procedure TWTitulos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         if (ActiveControl <> FiltroBTitulo) and
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

procedure TWTitulos.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'TITULO') or (UpperCase(AFieldName) = 'DESCRIPCION') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWTitulos.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWTitulos.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWTitulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WTitulos   := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWTitulos.fcImageBtnMinimizarClick(Sender: TObject);
begin
   windowState := wsminimized;
end;

procedure TWTitulos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWTitulos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWTitulos.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BTitulo').AsString      := '';
   TbFiltro.FieldByName('BDescripcion').AsString := '';
end;

procedure TWTitulos.VerTabla(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TbFiltro do begin
      Edit;
      FieldByName('BTitulo').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
      Post;
   end;
   PrepararQuery;
end;

procedure TWTitulos.QFicheroCalcFields(DataSet: TDataSet);
begin
   QFicheroFormula.AsString := Trim(QFicheroSuma1.AsString);
   if QficheroSuma2.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma2.AsString);
   end;
   if QficheroSuma3.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma3.AsString);
   end;
   if QficheroSuma4.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma4.AsString);
   end;
   if QficheroSuma5.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma5.AsString);
   end;
   if QficheroSuma6.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma6.AsString);
   end;
   if QficheroSuma7.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma7.AsString);
   end;
   if QficheroSuma8.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '+' + Trim(QFicheroSuma8.AsString);
   end;

   if QficheroResta1.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta1.AsString);
   end;
   if QficheroResta2.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta2.AsString);
   end;
   if QficheroResta3.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta3.AsString);
   end;
   if QficheroResta4.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta4.AsString);
   end;
   if QficheroResta5.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta5.AsString);
   end;
   if QficheroResta6.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta6.AsString);
   end;
   if QficheroResta7.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta7.AsString);
   end;
   if QficheroResta8.AsString <> '' then   begin
      QFicheroFormula.AsString := QFicheroFormula.AsString + '-' + Trim(QFicheroResta8.AsString);
   end;
end;

procedure TWTitulos.SoloSiAniadir(Sender: TObject);
begin
   if (QFichero.State <> dsInsert) then begin
      Perform(wm_NextDlgCtl, 0, 0);
   end;
end;

end.
