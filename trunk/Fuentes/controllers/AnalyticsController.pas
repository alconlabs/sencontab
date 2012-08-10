unit AnalyticsController;

interface

uses Classes, Forms, ComCtrls, Controls, ExtCtrls, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMAnalytics,
     AnalyticsView;

type
  TAnalyticsController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleAnalytics;
    FView          :TAnalyticsView;
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

constructor TAnalyticsController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'CUENTA';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleAnalytics, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TAnalyticsView, FView);

   FView.DataSource.DataSet    := DM.QAnalytics;
   FView.SDelegacion.DataSet   := DM.LDelegacion;
   FView.SDepartamento.DataSet := DM.LDepartamento;
   FView.SSeccion.DataSet      := DM.LSeccion;
   FView.SProyecto.DataSet     := DM.LProyecto;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TAnalyticsController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TAnalyticsController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Cuentas Analíticas';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TAnalyticsController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TAnalyticsController.InitializeView;
begin
   FView.DBGrid.Columns.Clear;
   AddColumnToDBGrid(FView.DBGrid, 'CUENTA'         , 'Código'      ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'NOMBRE'         , 'Descripcion' , 300);
   AddColumnToDBGrid(FView.DBGrid, 'ID_DELEGACION'  , 'Deleg.'      ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DS_DELEGACION'  , 'Delegación'  , 150);
   AddColumnToDBGrid(FView.DBGrid, 'ID_DEPARTAMENTO', 'Depto.'      ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DS_DEPARTAMENTO', 'Departamento', 150);
   AddColumnToDBGrid(FView.DBGrid, 'ID_SECCION'     , 'Secc.'       ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DS_SECCION'     , 'Sección'     , 150);
   AddColumnToDBGrid(FView.DBGrid, 'ID_PROYECTO'    , 'Proy.'       ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DS_PROYECTO'    , 'Proyecto'    , 150);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew                 , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept              , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditCUENTA             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNOMBRE             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.ComboBoxID_DELEGACION  , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.ComboBoxID_DEPARTAMENTO, fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.ComboBoxID_SECCION     , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.ComboBoxID_PROYECTO    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.DBGrid                 , fmView));

   FView.BtnNew.OnClick          := OnClick_New;
   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnDelete.OnClick       := OnClick_Delete;
   FView.BtnReport.OnClick       := OnClick_Report;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.Mode := fmView;
end;

procedure TAnalyticsController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditCUENTA.SetFocus;
   DM.QAnalytics.Append;
end;

procedure TAnalyticsController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QAnalytics.Edit;
end;

procedure TAnalyticsController.OnClick_Delete(Sender: TObject);
begin
   if DM.QAnalytics.IsEmpty then Exit;
   if MessageDlg('¿Desea eliminar el elemento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QAnalytics.Delete;
          DM.QAnalytics.ApplyUpdates(0);
      except DatabaseError('ha sido imposible realizar la eliminación.');
      end;
   end;
end;

procedure TAnalyticsController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'create the controller for the reports'}
   //FormPrincipal.LanzarListado('LAnaliticas.rtm', SFichero);
end;

procedure TAnalyticsController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QAnalytics.Post;
      DM.QAnalytics.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TAnalyticsController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QAnalytics.Cancel;
      DM.QAnalytics.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TAnalyticsController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TAnalyticsController.OnCalcTitleAttributes_DBGrid(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TAnalyticsController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);
begin
   if (UpperCase(AFieldName) = 'CUENTA'       ) or (UpperCase(AFieldName) = 'NOMBRE'         ) or
      (UpperCase(AFieldName) = 'ID_DELEGACION') or (UpperCase(AFieldName) = 'ID_DEPARTAMENTO') or
      (UpperCase(AFieldName) = 'ID_SECCION'   ) or (UpperCase(AFieldName) = 'ID_PROYECTO'    ) then begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;

end.

