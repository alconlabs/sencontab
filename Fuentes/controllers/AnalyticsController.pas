unit AnalyticsController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls,
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
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnShowForm        (Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation

uses Forms, SysUtils, Dialogs, DB, Windows, Messages, Buttons, 
     CustomView;

constructor TAnalyticsController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleAnalytics, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TAnalyticsView, FView);

   FView.DataSource.DataSet  := DM.QAnalytics;

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

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
   FView.Caption     := 'Parametros de Facturación';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow                      := OnShowForm;

   Result := True;
   FView.ShowModal;
end;

procedure TAnalyticsController.OnShowForm(Sender: TObject);
begin
   //FView.TabVentas.Show;
   //FView.TabVentasRegimenGeneral.Show;
end;

procedure TAnalyticsController.InitializeView;
begin
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADTOPPV              , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODTOPPV               , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADTOPPC              , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODTOPPC               , fmEdit));
   //
   //FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxDescCliente                 , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxDescProveedor               , fmEdit));
   //
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnModify                           , fmView));
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept                           , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel                           , fmEdit));
   //
   //FView.ModeList.Add(TComponentMode.Create(FView.EditRetencionProfesional            , fmEdit));
   //FView.ModeList.Add(TComponentMode.Create(FView.EditRetencionArrendatario           , fmEdit));
   //
   //FView.BtnModify.OnClick       := OnClick_Modify;
   //FView.BtnAccept.OnClick       := OnClick_Accept;
   //FView.BtnCancel.OnClick       := OnClick_Cancel;
   //
   //FView.BtnCTASearchSCTAIVANORMAL.OnClick            := OnClick_BtnSearchAccount;
   //FView.BtnCTASearchSCTAIVAREDUCIDO.OnClick          := OnClick_BtnSearchAccount;
   //FView.BtnCTASearchSCTAIVASUPER.OnClick             := OnClick_BtnSearchAccount;
   //FView.BtnCTASearchSCTAIVAEXENTO.OnClick            := OnClick_BtnSearchAccount;
   //FView.BtnCTASearchSCTAIVAINTRADEDUCIBLE.OnClick    := OnClick_BtnSearchAccount;
   //FView.BtnCTASearchSCTAIVAINTRA.OnClick             := OnClick_BtnSearchAccount;

   FView.Mode := fmView;
end;

procedure TAnalyticsController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QAnalytics.Edit;
end;

procedure TAnalyticsController.OnClick_Accept(Sender: TObject);
var nPoscoma :Cardinal;
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QAnalytics.Post;
      DM.QAnalytics.ApplyUpdates(0);
      FView.Mode := fmView;
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

end.

