unit TypesOfJournalController;

interface

uses Classes, Forms, ComCtrls, Controls, ExtCtrls, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMTypesOfJournal,
     TypesOfJournalView;

type
  TTypesOfJournalController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleTypesOfJournal;
    FView          :TTypesOfJournalView;
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

constructor TTypesOfJournalController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'TIPODIARIO';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleTypesOfJournal, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TTypesOfJournalView, FView);

   FView.DataSource.DataSet := DM.QTypesOfJournal;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TTypesOfJournalController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TTypesOfJournalController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Tipos de Diario';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TTypesOfJournalController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TTypesOfJournalController.InitializeView;
begin
   FView.DBGrid.Columns.Clear;
   AddColumnToDBGrid(FView.DBGrid, 'TIPODIARIO' , 'Código'     ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DESCRIPCION', 'Descripcion', 300);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditTIPODIARIO      , fmEdit));
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

procedure TTypesOfJournalController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditTIPODIARIO.SetFocus;
   DM.QTypesOfJournal.Append;
end;

procedure TTypesOfJournalController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QTypesOfJournal.Edit;
end;

procedure TTypesOfJournalController.OnClick_Delete(Sender: TObject);
begin
   if DM.QTypesOfJournal.IsEmpty then Exit;
   if MessageDlg('¿Desea eliminar el elemento seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QTypesOfJournal.Delete;
          DM.QTypesOfJournal.ApplyUpdates(0);
      except DatabaseError('ha sido imposible realizar la eliminación.');
      end;
   end;
end;

procedure TTypesOfJournalController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'create the controller for the reports'}
   //FormPrincipal.LanzarListado('LTiposDiario.rtm', SFichero);
end;

procedure TTypesOfJournalController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QTypesOfJournal.Post;
      DM.QTypesOfJournal.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TTypesOfJournalController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QTypesOfJournal.Cancel;
      DM.QTypesOfJournal.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TTypesOfJournalController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TTypesOfJournalController.OnCalcTitleAttributes_DBGrid(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TTypesOfJournalController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);
begin
   if (UpperCase(AFieldName) = 'TIPODIARIO') or (UpperCase(AFieldName) = 'DESCRIPCION') then begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;

end.

