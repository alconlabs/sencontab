unit GroupsController;

interface

uses Classes, Forms, ComCtrls, Controls, ExtCtrls, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMGroups,
     GroupsView;

type
  TGroupsController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleGroups;
    FView          :TGroupsView;
    FOrderFieldName :string;     {still not used}
    procedure InitializeView;
  protected
    procedure OnShowForm    (Sender :TObject);
    procedure OnFormClose   (Sender: TObject; var Action: TCloseAction);
    procedure OnClick_New   (Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Delete(Sender :TObject);
    procedure OnClick_Report(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
    procedure OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);  {still not assigned}
    procedure OnCalcTitleAttributes_DBGrid(Sender: TObject; AFieldName: string;   {still not assigned}
                                           AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation

uses SysUtils, Dialogs, DB, Windows, Messages, Buttons,
     CustomView;

constructor TGroupsController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'GRUPO';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleGroups, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TGroupsView, FView);

   FView.DataSource.DataSet := DM.QGroups;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TGroupsController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TGroupsController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Grupos';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TGroupsController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TGroupsController.InitializeView;
begin
   FView.DBGrid.Columns.Clear;
   AddColumnToDBGrid(FView.DBGrid, 'GRUPO'       , 'Código'     ,  50);
   AddColumnToDBGrid(FView.DBGrid, 'DESCRIPCION' , 'Descripcion', 400);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditGRUPO           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDESCRIPCION     , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.DBGrid              , fmView));

   FView.BtnNew.OnClick          := OnClick_New;
   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnDelete.OnClick       := OnClick_Delete;
   FView.BtnReport.OnClick       := OnClick_Report;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.Mode := fmView;
end;

procedure TGroupsController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditGRUPO.SetFocus;
   DM.QGroups.Append;
end;

procedure TGroupsController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QGroups.Edit;
end;

procedure TGroupsController.OnClick_Delete(Sender: TObject);
begin
   if DM.QGroups.IsEmpty then Exit;
   if MessageDlg('¿Desea eliminar el elemento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QGroups.Delete;
          DM.QGroups.ApplyUpdates(0);
      except DatabaseError('ha sido imposible realizar la eliminación.');
      end;
   end;
end;

procedure TGroupsController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'create the controller for the reports'}
   //FormPrincipal.LanzarListado('LGrupos.rtm', SFichero);
end;

procedure TGroupsController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QGroups.Post;
      DM.QGroups.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TGroupsController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QGroups.Cancel;
      DM.QGroups.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TGroupsController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TGroupsController.OnCalcTitleAttributes_DBGrid(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TGroupsController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);
begin
   if (UpperCase(AFieldName) = 'GRUPO') or (UpperCase(AFieldName) = 'DESCRIPCION') then begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;

end.

