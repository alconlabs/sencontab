unit UPaises;
interface
uses Buttons, DBClient, IBDatabase, IBCustomDataSet, IBTableSet, Forms,
     StdCtrls, Grids, Controls, windows, ExtCtrls, Graphics, Classes,
     SysUtils, Messages, DB, Mask, DBCtrls, DBGrids, ComCtrls,
     FormHandler;

type
   TWPaises = class(TForm)
    SFichero: TDataSource;
    QFichero: TIBTableSet;
    Transaccion: TIBTransaction;
    Datos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditDS_PAIS: TDBEdit;
    TbFiltro: TClientDataSet;
    sFiltro: TDataSource;
    QFicheroPAIS: TIBStringField;
    QFicheroNOMBRE: TIBStringField;
    EditCD_PAIS: TDBEdit;
    StatusBar1: TStatusBar;
    PanelFondo: TPanel;
    DataGrid: TDBGrid;
    PanelButtons: TPanel;
    BtnAdd: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnSave: TSpeedButton;
    BtnCancel: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnModify: TSpeedButton;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure DataGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
       AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpiarFiltro(Sender: TObject);
    procedure BtnReportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
    FormManager :TccFormHandler;
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

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener m�s informaci�n sobre el problema surgido';
      CADENA_BORRADO = 'El Pa�s seleccionado se encuentra referenciado en alguna subcuenta.';

procedure TWPaises.CrearFiltro;
begin
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
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
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
   with QFichero, ModifySql do begin
      Close;
      Clear;
      Add('UPDATE PAISES SET NOMBRE=:NOMBRE,PAIS=:PAIS');
      Add('WHERE PAIS=:OLD_PAIS');
   end;
   {$Message Warn 'La instrucci�n WITH es ofuscadora de c�digo`'}
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

      // Par�metros
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

procedure TWPaises.BtnAddClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
      Exit;
   end;

   DataGrid.SetFocus;
   try
      EditCD_PAIS.SetFocus;
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar un nuevo pa�s.' + #13 + CADENA_MANUAL);
   end;
   FormManager.Mode := fmEdit;
end;

procedure TWPaises.BtnDeleteClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
      Exit;
   end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('�Desea borrar este pa�s?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
          RefrescarBD;
      except DatabaseError('No se ha podido borrar el pa�s seleccionado.' + #13 + CADENA_BORRADO);
      end;
   end;
end;

procedure TWPaises.BtnReportClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
      Exit;
   end;

   FormPrincipal.LanzarListado('LPaises.rtm', SFichero);
end;

procedure TWPaises.BtnSaveClick(Sender: TObject);
var
   ha_insertado: Boolean;
   Msg:          String;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Msg contendr� la informaci�n a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg := '';

   if QFichero.FieldByName('Pais').AsString = '' then   begin
      Msg := Msg + 'No se puede dejar el c�digo del pa�s en blanco.' + #13;
   end;

   if QFichero.FieldByName('Nombre').AsString = '' then   begin
      Msg := Msg + 'No se puede dejar el nombre del pa�s en blanco.' + #13;
   end;

   if Trim(Msg) <> '' then  begin
      Msg := Msg + 'Por favor, revise los datos de entrada.';
      EditCD_PAIS.SetFocus;
      DatabaseError(Msg);
   end;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;

   RefrescarBD;

   FormManager.Mode := fmBrowse;
   DataGrid.SetFocus;
   if ha_insertado then  begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BPais').AsString := QFicheroPais.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;

end;

procedure TWPaises.BtnCancelClick(Sender: TObject);
var Canceled :Boolean;
begin
   Perform(WM_NextDlgCtl, 0, 0);

   if not QFichero.Modified then Canceled := True
   else Canceled := MessageDlg('�Quiere anular las modificaciones realizadas a este pa�s?',
                               mtConfirmation, [mbYes, mbNo], 0) = mrYes;

   if Canceled then begin
      try    QFichero.Cancel;
      except Canceled := False;
             DatabaseError('No se ha podido cancelar la operaci�n.' + #13 + CADENA_MANUAL);
      end;
   end
   else Canceled := False;

   if Canceled then begin
      FormManager.Mode := fmBrowse;
      DataGrid.SetFocus;
   end;
end;

procedure TWPaises.DataGridDblClick(Sender: TObject);
begin
   if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
      Exit;
   end;

   if not QFichero.IsEmpty then  begin
      try QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      FormManager.Mode := fmEdit;
      EditCD_PAIS.SetFocus;
   end;
end;

procedure TWPaises.FormCreate(Sender: TObject);
begin
   FormManager := TccFormHandler.Create(Self);

   FormManager.AddComp(EditCD_PAIS.Name , fmEdit );
   FormManager.AddComp(EditDS_PAIS.Name , fmEdit );

   FormManager.AddComp(DataGrid.Name        , fmBrowse);
   //FormManager.AddComp(BtnCopy.Name         , fmBrowse);
   //FormManager.AddComp(BtnPaste.Name        , fmBrowse);

   FormManager.AddComp(BtnAdd.Name          , fmBrowse);
   //FormManager.AddComp(BtnDuplicate.Name    , fmBrowse);
   FormManager.AddComp(BtnModify.Name       , fmBrowse);
   FormManager.AddComp(BtnDelete.Name       , fmBrowse);
   //FormManager.AddComp(BtnReload.Name       , fmBrowse);
   FormManager.AddComp(BtnReport.Name       , fmBrowse);

   FormManager.AddComp(BtnSave.Name         , fmEdit  );
   FormManager.AddComp(BtnCancel.Name       , fmEdit  );


   ActivarTransacciones(Self);
   CrearFiltro;
   FCampoOrden := 'PAIS';
   PrepararQuery;
   FormManager.Mode := fmBrowse;
end;

procedure TWPaises.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then begin
            BtnCancel.Click;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TDBGrid) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TDBGrid) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
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
   DataGrid.SetFocus;
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

procedure TWPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      //Formulario.Free;
      //Formulario := nil;
      FormManager.Free;
      WPaises    := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;

end;

procedure TWPaises.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dsEditModes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BPAIS').AsString   := '';
   TbFiltro.FieldByName('BNombre').AsString := '';
end;

procedure TWPaises.FormShow(Sender: TObject);
begin
   FormManager.Mode := fmEdit;
   FormManager.Mode := fmBrowse;
end;

end.
