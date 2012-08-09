unit DepartmentsController;

interface

uses Classes, Forms, ComCtrls, Controls, ExtCtrls, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMDepartments,
     DepartmentsView;

type
  TDepartmentsController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleDepartments;
    FView          :TDepartmentsView;
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

constructor TDepartmentsController.Create(prmConfig :TCurrentConfig);
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'ID_DEPARTAMENTO';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleDepartments, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TDepartmentsView, FView);

   FView.DataSource.DataSet := DM.QDepartments;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TDepartmentsController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TDepartmentsController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Departamentos';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TDepartmentsController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TDepartmentsController.InitializeView;
begin
   FView.DBGrid.Columns.Clear;
   AddColumnToDBGrid(FView.DBGrid, 'ID_DEPARTAMENTO', 'C�digo'     ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'NOMBRE'         , 'Descripcion', 300);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditID_DEPARTAMENTO , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNOMBRE          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.DBGrid              , fmView));

   FView.BtnNew.OnClick          := OnClick_New;
   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnDelete.OnClick       := OnClick_Delete;
   FView.BtnReport.OnClick       := OnClick_Report;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.Mode := fmView;
end;

procedure TDepartmentsController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditID_DEPARTAMENTO.SetFocus;
   DM.QDepartments.Append;
end;

procedure TDepartmentsController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QDepartments.Edit;
end;

procedure TDepartmentsController.OnClick_Delete(Sender: TObject);
begin
   if DM.QDepartments.IsEmpty then Exit;
   if MessageDlg('�Desea eliminar el elemento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QDepartments.Delete;
          DM.QDepartments.ApplyUpdates(0);
      except DatabaseError('ha sido imposible realizar la eliminaci�n.');
      end;
   end;
end;

procedure TDepartmentsController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'create the controller for the reports'}
   //FormPrincipal.LanzarListado('LDepartamentos.rtm', SDataSource);
end;

procedure TDepartmentsController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QDepartments.Post;
      DM.QDepartments.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TDepartmentsController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QDepartments.Cancel;
      DM.QDepartments.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TDepartmentsController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TDepartmentsController.OnCalcTitleAttributes_DBGrid(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TDepartmentsController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);
begin
   if (UpperCase(AFieldName) = 'ID_DEPARTAMENTO') or (UpperCase(AFieldName) = 'NOMBRE') then begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;

end.

