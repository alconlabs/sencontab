unit CountysController;

interface

uses Classes, Forms, ComCtrls, Controls, ExtCtrls, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMCountys,
     CountysView;

type
  TCountysController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleCountys;
    FView          :TCountysView;
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

constructor TCountysController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'ID_PROYECTO';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleCountys, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TCountysView, FView);

   FView.DataSource.DataSet := DM.QCountys;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TCountysController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TCountysController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Proyectos';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TCountysController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TCountysController.InitializeView;
begin
   FView.DBGrid.Columns.Clear;
   AddColumnToDBGrid(FView.DBGrid, 'PROVINCIA', 'C�digo'     ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'NOMBRE'   , 'Descripcion', 300);
   AddColumnToDBGrid(FView.DBGrid, 'CODIGO'   , 'C�digo'     ,  40);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditPROVINCIA       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNOMBRE          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCODIGO          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.DBGrid              , fmView));

   FView.BtnNew.OnClick          := OnClick_New;
   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnDelete.OnClick       := OnClick_Delete;
   FView.BtnReport.OnClick       := OnClick_Report;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.Mode := fmView;
end;

procedure TCountysController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditPROVINCIA.SetFocus;
   DM.QCountys.Append;
end;

procedure TCountysController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QCountys.Edit;
end;

procedure TCountysController.OnClick_Delete(Sender: TObject);
begin
   if DM.QCountys.IsEmpty then Exit;
   if MessageDlg('�Desea borrar este proyecto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QCountys.Delete;
          DM.QCountys.ApplyUpdates(0);
      except DatabaseError('No se ha podido borrar la forma de pago seleccionada.');
      end;
   end;
end;

procedure TCountysController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'create the controller for the reports'}
   //FormPrincipal.LanzarListado('LProyectos.rtm', SFichero);
end;

procedure TCountysController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QCountys.Post;
      DM.QCountys.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TCountysController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QCountys.Cancel;
      DM.QCountys.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TCountysController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;


procedure TCountysController.OnCalcTitleAttributes_DBGrid(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;


procedure TCountysController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);
begin
   if (UpperCase(AFieldName) = 'ID_PROYECTO') or (UpperCase(AFieldName) = 'NOMBRE') then begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;


end.

