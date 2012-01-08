unit UUsuarios;
interface
uses Buttons, Forms, Windows, Messages, DBClient, IBDatabase, DB, SysUtils, IBCustomDataSet, IBTableSet,
     Wwdatsrc, ovcbase, Grids, Wwdbigrd, Wwdbgrid, fcTreeView, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
     wwdblook, ovcnbk, navegadorNotarios, fcButton, fcImgBtn, Controls, ExtCtrls, Graphics, fcImage,
     fcimageform, Classes, DBCtrls, wwDBComb, wwDBSpin;

type
  TWUsuarios = class(TForm)
    OvcController1: TOvcController;
    SUsuarios:     TwwDataSource;
    QUsuarios:     TIBTableSet;
    TransUsuarios: TIBTransaction;
    Aux: TBitBtn;
    QUsuariosID_USUARIO: TIntegerField;
    QUsuariosID_EMPRESA: TIntegerField;
    QUsuariosCLAVE: TIBStringField;
    QUsuariosNOMBRE: TIBStringField;
    Paginas:       TOvcNotebook;
    DatosProvincias: TGroupBox;
    Label9:        TLabel;
    Label25:       TLabel;
    Label27:       TLabel;
    eUsuario:      TOvcDbPictureField;
    eClave:        TOvcDbPictureField;
    Permisos:      TfcTreeView;
    QModulos:      TIBTableSet;
    SModulos:      TwwDataSource;
    QMantenimientos: TIBTableSet;
    SMantenimientos: TwwDataSource;
    QPermisos:     TIBTableSet;
    TransPermisos: TIBTransaction;
    SPermisos:     TwwDataSource;
    wwDBLookupCombo1: TwwDBLookupCombo;
    QModulosIDMODULO: TIntegerField;
    QModulosDESCRIPCION: TIBStringField;
    QMantenimientosIDMODULO: TIntegerField;
    QMantenimientosIDMANTENIMIENTO: TIntegerField;
    QMantenimientosDESCRIPCION: TIBStringField;
    QMantenimientosWINDOWNAME: TIBStringField;
    QMantenimientosPERMISOSESCRITURA: TIBStringField;
    QMantenimientosPERMISOIMPRESION: TIBStringField;
    QPermisosIDUSUARIO: TIntegerField;
    QPermisosIDMANTENIMIENTO: TIntegerField;
    QPermisosIDMODULO: TIntegerField;
    QPermisosANIADIR: TIBStringField;
    QPermisosMODIFICAR: TIBStringField;
    QPermisosBORRAR: TIBStringField;
    QPermisosIMPRESION: TIBStringField;
    Panel1:        TPanel;
    BtnEdtGuardar: TBitBtn;
    BtnCancel: TBitBtn;
    BtnNavAnadir: TBitBtn;
    BtnEdtDesmarcar: TBitBtn;
    BtnEdtMarcar: TBitBtn;
    BtnNavBorrar: TBitBtn;
    BtnNavModificar: TBitBtn;
    Rejilla: TwwDBGrid;
    procedure BtnNavAniadirClick(Sender: TObject);
    procedure BtnNavBorrarClick(Sender: TObject);
    procedure BtnEdtGuardarClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure RejillaDblClick(Sender: TObject);
    procedure PermisosCalcNodeAttributes(TreeView: TfcCustomTreeView; Node: TfcTreeNode; State: TfcItemStates);
    procedure PermisosToggleCheckbox(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
    procedure PaginasPageChanged(Sender: TObject; Index: Integer);
    procedure QUsuariosAfterScroll(DataSet: TDataSet);
    procedure BtnEdtMarcarClick(Sender: TObject);
    procedure BtnEdtDesmarcarClick(Sender: TObject);
  private
    FCampoOrden: String;
    x:           Integer;
    procedure GuardarPermisos;
    procedure MostrarPermisos;
    procedure PrepararQuery;
    procedure RefrescarBD;
    function Acceso_usuarios(codigo: String): Boolean;
   public
   protected
     procedure CreateParams(var Params: TCreateParams); override;
   end;

var WUsuarios: TWUsuarios;

const TabDatos    = 0;
      TabPermisos = 1;

implementation
uses Dialogs, General, Globales, DMControl, MenuPrincipal;
{$R *.DFM}

function TWUsuarios.Acceso_Usuarios(codigo: String): Boolean;
begin
   Acceso_Usuarios := True;
end;

procedure TWUsuarios.GuardarPermisos;
var
   I: Integer;
begin
   QPermisos.Open;
   QPermisos.First;
   while not QPermisos.EOF do begin
      QPermisos.Delete;
   end;

   QModulos.Open;
   QModulos.First;
   I := 0;
   while not QModulos.EOF do begin
      QMantenimientos.Open;
      QMantenimientos.First;
      while not QMantenimientos.EOF do begin
         if (Permisos.Items[I].Level = 1) then   begin
            if (Permisos.Items[I].Checked) then   begin
               QPermisos.Insert;
               QPermisosIDUSUARIO.AsInteger   := QUsuariosID_USUARIO.AsInteger;
               QPermisosIDMODULO.Value        := QMantenimientosIDMODULO.Value;
               QPermisosIDMANTENIMIENTO.Value := QMantenimientosIDMANTENIMIENTO.Value;
               QPermisosANIADIR.AsString      := 'N';
               QPermisosMODIFICAR.AsString    := 'N';
               QPermisosBORRAR.AsString       := 'N';
               QPermisosIMPRESION.AsString    := 'N';

               if Permisos.Items[I].HasChildren then   begin
                  if Permisos.Items[I].Count >= 3 then   begin
                     // Añadir
                     if Permisos.Items[I + 1].Checked then   begin
                        QPermisosANIADIR.AsString := 'S';
                     end;
                     // Modificar
                     if Permisos.Items[I + 2].Checked then   begin
                        QPermisosMODIFICAR.AsString := 'S';
                     end;
                     // Borrar
                     if Permisos.Items[I + 3].Checked then   begin
                        QPermisosBORRAR.AsString := 'S';
                     end;
                     // Impresión
                     if Permisos.Items[I].Count > 3 then   begin
                        if Permisos.Items[I + 4].Checked then   begin
                           QPermisosIMPRESION.AsString := 'S';
                        end;
                     end;
                  end
                  else begin
                     if Permisos.Items[I + 1].Checked then   begin
                        QPermisosIMPRESION.AsString := 'S';
                     end;
                  end;
               end;

               QPermisos.Post;
               QPermisos.Transaction.CommitRetaining;
            end;

            if Permisos.Items[I].HasChildren then   begin
               I := I + Permisos.Items[I].Count;
            end;

            QMantenimientos.Next;
         end;

         Inc(I);
      end;
      QMantenimientos.Close;
      QModulos.Next;
      Inc(I);
   end;
   QPermisos.Close;
end;

procedure TWUsuarios.MostrarPermisos;
var
   I, J:         Integer;
   TienePermiso: Boolean;
begin
   QPermisos.Open;
   QModulos.Open;
   QModulos.First;

   Permisos.Items.GetFirstNode;

   while Permisos.Items.Count > 0 do begin
      Permisos.Items.GetFirstNode.Delete;
   end;

   while not QModulos.EOF do begin
      Permisos.Items.Add(nil, QModulosDESCRIPCION.AsString);
      I := Permisos.Items.Count - 1;
      QMantenimientos.Open;
      QMantenimientos.First;
      while not QMantenimientos.EOF do begin
         TienePermiso := (not QPermisos.IsEmpty) and (QPermisosIDMODULO.Value =
            QMantenimientosIDMODULO.Value) and (QPermisosIDMANTENIMIENTO.Value =
            QMantenimientosIDMANTENIMIENTO.Value);
         Permisos.Items.AddChild(Permisos.Items[I], QMantenimientosDESCRIPCION.AsString).Checked :=
            TienePermiso;
         J := Permisos.Items.Count - 1;
         if QMantenimientosPERMISOSESCRITURA.AsString = 'S' then   begin
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Permisos.Items.AddChild(Permisos.Items[J], 'Añadir') do begin
               CheckboxType := tvctCheckBox;
               Checked      := TienePermiso and (QPermisosANIADIR.AsString = 'S');
            end;
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Permisos.Items.AddChild(Permisos.Items[J], 'Modificar') do begin
               CheckboxType := tvctCheckBox;
               Checked      := TienePermiso and (QPermisosMODIFICAR.AsString = 'S');
            end;
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Permisos.Items.AddChild(Permisos.Items[J], 'Borrar') do begin
               CheckboxType := tvctCheckBox;
               Checked      := TienePermiso and (QPermisosBORRAR.AsString = 'S');
            end;
         end;
         if QMantenimientosPERMISOIMPRESION.AsString = 'S' then   begin
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Permisos.Items.AddChild(Permisos.Items[J], 'Impresión') do begin
               CheckboxType := tvctCheckBox;
               Checked      := TienePermiso and (QPermisosIMPRESION.AsString = 'S');
            end;
         end;


         if TienePermiso then   begin
            QPermisos.Next;
         end;
         QMantenimientos.Next;
      end;
      QMantenimientos.Close;
      QModulos.Next;
   end;
   QPermisos.Close;
end;

procedure TWUsuarios.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QUsuarios, SelectSQL do begin
      DisableControls;
      Close;
      Transaction.Active := False;
      Transaction.Params.Clear;
      Transaction.Params.Add('Read_committed');
      Transaction.Params.Add('Rec_Version');
      Transaction.Active := True;

      Clear;
      Add('SELECT * FROM USUARIOS');

      Add('ORDER BY NOMBRE');

      Prepare;
      EnableControls;
      Open;
   end;
end;

procedure TWUsuarios.RefrescarBD;
begin
   FIbQueryRefresh(DmControlRef.QUsuarios);
end;

procedure TWUsuarios.CreateParams(var Params: TCreateParams);
begin
   inherited;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with Params do begin
      style          := (style or ws_popup) and not ws_dlgframe and not ws_clipchildren;
      doublebuffered := True;
   end;
end;

procedure TWUsuarios.FormCreate(Sender: TObject);
var
   i: Word;
begin
   x := GetSystemMetrics(SM_CXSCREEN);
   if x = 640 then  begin
      AutoScroll := False;
      Width      := (797 * Screen.Width) div 800;
      Height     := (500 * Screen.Height) div 600;
      ScaleControls(x, 787);
   end;
   DoubleBuffered := True;

   // activar transacciones
   for i := 0 to (ComponentCount - 1) do begin
      if (Components[i] is TibTransaction) then   begin
         TibTransaction(Components[i]).Active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.Add('Read_committed');
         TibTransaction(Components[i]).Params.Add('Rec_version');
         TibTransaction(Components[i]).Params.Add('Write');
         TibTransaction(Components[i]).Active := True;
      end;
   end;

   Modo(Self, Naveg);

   FCampoOrden := 'NOMBRE';
   PrepararQuery;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QModulos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM MODULOS ORDER BY IDMODULO');
      Prepare;
      EnableControls;
      Open;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QMantenimientos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM MANTENIMIENTOS WHERE IDMODULO = :IDMODULO');
      Add('ORDER BY IDMODULO, IDMANTENIMIENTO');
      Prepare;
      EnableControls;
      Open;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QPermisos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM PERMISOS_USUARIOS WHERE IDUSUARIO = :ID_USUARIO');
      Add('ORDER BY IDMODULO, IDMANTENIMIENTO');
      Prepare;
      EnableControls;
      Open;
   end;
end;

procedure TWUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then   begin
      if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TDBMemo) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWUsuarios.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var Anterior :Boolean;
    Salir    :Boolean;
begin
   case Key of
      VK_ESCAPE :begin
         Key := 0;
         if QUsuarios.State in dsEditModes then begin
            BtnCancel.Click;
         end;
      end;
   end;
end;

procedure TWUsuarios.BtnNavAniadirClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   eUsuario.SetFocus;
   try
      QUsuarios.Append;
   except
      DatabaseError('Error al intentar añadir un nuevo Usuario.');
   end;
   Modo(Self, Edita);
   Paginas.PageIndex := TabDatos;
   Paginas.OnPageChanged(nil, TabDatos);
   eUsuario.SetFocus;
end;

procedure TWUsuarios.BtnEdtGuardarClick(Sender: TObject);
var
   Msg: String;
begin
   Perform(wm_NextDlgCtl, 0, 0);
   Msg := '';
   if QUsuariosNombre.Value = '' then   begin
      Msg := Msg + 'No se puede dejar el nombre de usuario en blanco.' + #13;
   end;
   
   if Msg <> '' then begin
      MessageDlg(Msg, mtInformation, [mbOK], 0);
      eUsuario.SetFocus;
      Exit;
   end;


   if QUsuarios.State = dsInsert then   begin
      QUsuariosID_USUARIO.AsInteger := DmControlRef.ObtenerNumeroUsuario;
   end;

   QUsuarios.Post;
   QUsuarios.Transaction.CommitRetaining;
   GuardarPermisos;

   Modo(self, Naveg);

   RefrescarBD;
   Modo(self, Naveg);
   Paginas.PageIndex := TabDatos;
end;

procedure TWUsuarios.BtnNavBorrarClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QUsuarios.IsEmpty then begin
      Exit;
   end;

   if Acceso_Usuarios(QUsuariosNombre.Value) then begin
      if MessageDlg('¿Quiere borrar este usuario?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         try QUsuarios.Delete;
             QUsuarios.Transaction.CommitRetaining;
             RefrescarBD;
             eUsuario.SetFocus;
             eUsuario.Repaint;
         except DatabaseError('Error al borrar el Usuario.' + #13 + 'Puede tener datos asociados');
         end;
      end;
   end;

   eUsuario.Visible := False;
   eUsuario.Visible := True;
end;

procedure TWUsuarios.BtnCancelClick(Sender: TObject);
var Cancelar: Boolean;
begin
   Cancelar := True;
   if MessageDlg('¿Quiere cancelar los cambios realizados?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
      Cancelar := False;
      eUsuario.Repaint;
   end;

   if Cancelar then  begin
      try
         QUsuarios.Cancel;
         MostrarPermisos;
      except
         DatabaseError('Error al cancelar la operación.');
         eUsuario.Repaint;
      end;
      Modo(Self, Naveg);
      Paginas.PageIndex := TabDatos;
      eUsuario.SetFocus;
   end;

end;

procedure TWUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QUsuarios.State = dsBrowse then  begin
      Action := caFree;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWUsuarios.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
end;

procedure TWUsuarios.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'USUARIO') or (UpperCase(AFieldName) = 'NOMBRE') then  begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;
end;

procedure TWUsuarios.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWUsuarios.RejillaDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   if not QUsuarios.IsEmpty then  begin
      try QUsuarios.Edit;
          MostrarPermisos;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + 'Puede estar en uso por otra persona.',
                         mtInformation, [mbOK], 0);
         eUsuario.Repaint;
      end;
      Modo(Self, Edita);
      Paginas.PageIndex := TabDatos;
      Paginas.OnPageChanged(nil, TabDatos);
      eUsuario.SetFocus;
   end;
end;

procedure TWUsuarios.PermisosCalcNodeAttributes(TreeView: TfcCustomTreeView;
   Node: TfcTreeNode; State: TfcItemStates);
begin
   Permisos.MultiSelectAttributes.Enabled := (QUsuarios.State in dsEditModes);

   if not (QUsuarios.State in dsEditModes) then   begin
      if Node.Checked and not Node.Selected then   begin
         Permisos.Canvas.Font.Color := clNavy;
      end;
   end;
end;

procedure TWUsuarios.PermisosToggleCheckbox(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
var
   I: Integer;
begin
   if QUsuarios.State in dsEditModes then  begin
      if Node.HasChildren then   begin
         for I := 0 to Node.Count - 1 do begin
            Node.Item[I].Checked := Node.Checked;
         end;
      end;
   end;
end;

procedure TWUsuarios.PaginasPageChanged(Sender: TObject; Index: Integer);
begin
   BtnEdtMarcar.Visible    := (Index = 1) and (QUsuarios.State in dsEditModes);
   BtnEdtDesmarcar.Visible := BtnEdtMarcar.Visible;
end;

procedure TWUsuarios.QUsuariosAfterScroll(DataSet: TDataSet);
begin
   MostrarPermisos;
end;

procedure TWUsuarios.BtnEdtMarcarClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to Permisos.Items.Count - 1 do begin
      Permisos.Items[I].Checked := True;
   end;
end;

procedure TWUsuarios.BtnEdtDesmarcarClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to Permisos.Items.Count - 1 do begin
      Permisos.Items[I].Checked := False;
   end;
end;

end.
