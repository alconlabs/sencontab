unit Proyectos;
interface
uses Buttons, Classes, Controls, DB, Forms, Graphics, Messages, SysUtils, WinProcs, WinTypes, DBClient,
     ExtCtrls, Grids, IBCustomDataSet, IBDatabase, IBTableSet,
     NavegadorNotarios, StdCtrls, DBGrids, ComCtrls, DBCtrls, Mask,
     CustomView;

type
   TWProyectos = class(TCustomView)
    SFichero: TDataSource;
    QFichero: TIBTableSet;
    Transaccion: TIBTransaction;
    Datos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditDS_PROYECTO: TDBEdit;
    TbFiltro: TClientDataSet;
    sFiltro: TDataSource;
    EditCD_PROYECTO: TDBEdit;
    QFicheroNOMBRE:  TIBStringField;
    QFicheroID_PROYECTO: TIBStringField;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DataGrid: TDBGrid;
    Panel1: TPanel;
    BtnAppend: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnSave: TSpeedButton;
    BtnCancel: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnModify: TSpeedButton;
    procedure BtnAppendClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure DataGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpiarFiltro(Sender: TObject);
    procedure BtnReportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
    FCampoOrden :string;
    procedure CrearFiltro;
    procedure PrepararQuery;
    procedure RefrescarBD;
   public
   end;

var WProyectos: TWProyectos;
implementation
uses General, Globales, DM, MenuPrincipal, Dialogs;
{$R *.DFM}

const CADENA_MANUAL  = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';
      CADENA_BORRADO = 'El proyecto seleccionado se encuentra referenciado en alguna analítica.';

procedure TWProyectos.CrearFiltro;
begin
   TBFiltro.Active := False;
   TBFiltro.FieldDefs.Clear;
   TBFiltro.FieldDefs.Add('BCODIGO'     , ftString, 10, False);
   TBFiltro.FieldDefs.Add('BDESCRIPCION', ftstring, 50, False);
   TBFiltro.CreateDataSet;
   TBFiltro.Active := True;
   TBFiltro.Append;
   TBFiltro.FieldByName('BCODIGO').AsString      := '';
   TBFiltro.FieldByName('BDESCRIPCION').AsString := '';
end;

procedure TWProyectos.PrepararQuery;
begin
   QFichero.Close;
   QFichero.ModifySQL.Clear;
   QFichero.ModifySQL.Add('UPDATE PROYECTO SET NOMBRE =:NOMBRE, ID_PROYECTO = :ID_PROYECTO');
   QFichero.ModifySQL.Add('WHERE ID_PROYECTO = :old_ID_PROYECTO');

   QFichero.DisableControls;
   QFichero.Close;
   QFichero.SelectSQL.Clear;
   QFichero.SelectSQL.Add('SELECT * FROM PROYECTO');

   if TbFiltro.FieldByName('BCODIGO').AsString <> '' then begin
      QFichero.SelectSQL.Add('WHERE ID_PROYECTO LIKE :ID_PROYECTO');
   end
   else
   if TbFiltro.FieldByName('BDESCRIPCION').AsString <> '' then begin
      QFichero.SelectSQL.Add('WHERE UPPER(NOMBRE) LIKE UPPER(:NOMBRE)');
   end;

   if FCampoOrden <> '' then begin
      QFichero.SelectSQL.Add('ORDER BY ' + FCampoOrden);
   end;

   if TbFiltro.FieldByName('BCODIGO').AsString <> '' then begin
      QFichero.Params.ByName('ID_PROYECTO').AsString :=
         Copy(TbFiltro.FieldByName('BCODIGO').AsString + '%', 1,
         TbFiltro.FieldByName('BCODIGO').Size);
   end
   else
   if TbFiltro.FieldByName('BDESCRIPCION').AsString <> '' then begin
      QFichero.Params.ByName('NOMBRE').AsString :=
         Copy(TbFiltro.FieldByName('BDESCRIPCION').AsString + '%', 1,
         TbFiltro.FieldByName('BDESCRIPCION').Size);
   end;

   QFichero.Prepare;
   QFichero.Open;
   QFichero.EnableControls;
end;

procedure TWProyectos.RefrescarBD;
begin
   DmRef.QProyecto.Close;
   DmRef.QProyectoNom.Close;

   DmRef.QProyecto.Open;
   DmRef.QProyectoNom.Open;
end;

procedure TWProyectos.BtnAppendClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   EditCD_PROYECTO.SetFocus;
   try
      QFichero.Insert;
   except
      DatabaseError('No se ha podido insertar un nuevo proyecto.' + #13 +CADENA_MANUAL);
   end;
   Mode := fmEdit;
end;

procedure TWProyectos.BtnDeleteClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then begin
      if MessageDlg('¿Desea borrar este proyecto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         try QFichero.Delete;
             QFichero.Transaction.CommitRetaining;
             RefrescarBD;
         except DatabaseError('No se ha podido borrar el proyecto seleccionado.' + #13 + CADENA_BORRADO);
         end;
      end;
   end;
end;

procedure TWProyectos.BtnReportClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   FormPrincipal.LanzarListado('LProyectos.rtm', SFichero);
end;

procedure TWProyectos.BtnSaveClick(Sender: TObject);
var
   ha_insertado: Boolean;
begin
   // Comprobamos si el usuario ha insertado un nuevo registro.
   ha_insertado := QFichero.State = dsInsert;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.FieldByName('ID_PROYECTO').AsString = '' then begin
      EditCD_PROYECTO.SetFocus;
      DatabaseError('No se puede dejar el código del proyecto en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   if QFichero.FieldByName('NOMBRE').AsString = '' then begin
      EditDS_PROYECTO.SetFocus;
      DatabaseError('No se puede dejar el nombre del proyecto en blanco.' + #13 +
         'Por favor, revise los datos de entrada.');
   end;

   QFichero.Post;
   QFichero.Transaction.CommitRetaining;

   RefrescarBD;

   Mode := fmView;
   DataGrid.SetFocus;
   if ha_insertado then begin
      if not (TbFiltro.State in dsEditModes) then begin
         TbFiltro.Edit;
      end;
      TbFiltro.FieldByName('BCODIGO').AsString := QFicheroID_PROYECTO.AsString;
      PrepararQuery;
      LimpiarFiltro(Sender);
   end;

end;

procedure TWProyectos.BtnCancelClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);

   if QFichero.Modified then begin
   end;
   if MessageDlg('¿Quiere anular las modificaciones realizadas a este proyecto?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try    QFichero.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Mode := fmView;
   end;
end;

procedure TWProyectos.DataGridDblClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then begin
      try QFichero.Edit;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 + CADENA_MANUAL, mtInformation, [mbOK], 0);
      end;
      Mode := fmView;
      EditCD_PROYECTO.SetFocus;
   end;
end;

procedure TWProyectos.FormCreate(Sender: TObject);
begin
   ModeList.Add(TComponentMode.Create(EditCD_PROYECTO , fmEdit));
   ModeList.Add(TComponentMode.Create(EditDS_PROYECTO , fmEdit));

   ModeList.Add(TComponentMode.Create(DataGrid    , fmView));
   ModeList.Add(TComponentMode.Create(BtnAppend   , fmView));
   ModeList.Add(TComponentMode.Create(BtnModify   , fmView));
   ModeList.Add(TComponentMode.Create(BtnDelete   , fmView));
   ModeList.Add(TComponentMode.Create(BtnReport   , fmView));

   ModeList.Add(TComponentMode.Create(BtnSave     , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnCancel   , fmEdit));

   //ActivarTransacciones(Self);
   CrearFiltro;
   FCampoOrden := 'ID_PROYECTO';
   PrepararQuery;
   Mode := fmView;
end;

procedure TWProyectos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if QFichero.State in dsEditModes then begin
            BtnCancel.Click;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TDBGrid) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TDBGrid) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWProyectos.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'ID_PROYECTO') or (UpperCase(AFieldName) = 'NOMBRE') then begin
      FCampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   DataGrid.SetFocus;
end;

procedure TWProyectos.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FCampoOrden)) then begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWProyectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then begin
      Action := caFree;
      WProyectos := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWProyectos.LimpiarFiltro(Sender: TObject);
begin
   if not (TbFiltro.state in dseditmodes) then begin
      TbFiltro.edit;
   end;
   TbFiltro.FieldByName('BCODIGO').AsString      := '';
   TbFiltro.FieldByName('BDESCRIPCION').AsString := '';
end;

procedure TWProyectos.FormShow(Sender: TObject);
begin
   Mode := fmEdit;
   Mode := fmView;
end;

end.
