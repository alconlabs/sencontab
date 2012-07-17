unit ProfilesController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls,
     DBController,
     ProfilesView,
     EditProfileView,
     ProfileClass,
     ProfilesModel;
type
  TProfilesController = class(TCustomController)
  private
    FView            :TProfilesView;
    FModel           :TProfilesModel;
    FEditView        :TEditProfileView;
    FTimerInterval   :Integer; {Time of delay after the las key press for go search}
    FTimer           :TTimer;
    FTextSearched    :string; {Timer componente for searchs}
  protected
    procedure InsertListColumns;
    procedure InsertListItem(prmItem :TProfile);
    procedure AssignDelegatesToEditView;
    {Delegate declarations}
    procedure OnShowForm        (Sender :TObject);
    procedure OnClick_New(Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Delete(Sender :TObject);
    procedure OnDragOver_Delete(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OnDragDrop_Delete(Sender, Source: TObject; X,  Y: Integer);
    procedure OnDragOver_Edit(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OnDragDrop_Edit(Sender, Source: TObject; X,  Y: Integer);
    procedure OnKeyDown_EditSearch(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnTimerEvent(Sender: TObject);
    procedure OnClick_BtnImageList(Sender :TObject);
    procedure OnClick_BtnImageReport(Sender: TObject);
    procedure OnClick_BtnImageIconos(Sender: TObject);
    procedure OnClick_BtnImageSearch(Sender: TObject);
    procedure OnDblClick_List(Sender: TObject);
    procedure OnColumnClick_List(Sender: TObject; Column: TListColumn);
    procedure OnList_InfoTip(Sender: TObject; Item: TListItem; var InfoTip: String);
    procedure OnListViewSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure Delegate_EditViewBtnAcceptClick(Sender: TObject);
    procedure Delegate_EditViewBtnCancelClick(Sender: TObject);
    procedure SetTextSearched(Value :string);
    property  TextSearched :string read FTextSearched write SetTextSearched;
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    procedure   RefreshAllItems;  {Clear all data in the view and reload it from database }
    function    ShowView:Boolean;
  end;

implementation
uses Forms, SysUtils, Dialogs, DB, Windows, Messages,
     CustomView,
     HashCriptography;

constructor TProfilesController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);
   Application.CreateForm(TProfilesView, FView);
   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];
   InsertListColumns;

   FModel := TProfilesModel.Create(DBCtlr.DBConnection.Connection);
   FModel.Open;
   RefreshAllItems;

   FTimer := TTimer.Create(FView);
   FTimer.Enabled  := False;
   FTimerInterval  := DELAY_SHORT;
   FTimer.Interval := FTimerInterval;
   FTimer.OnTimer  := OnTimerEvent;
end;

destructor TProfilesController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

procedure TProfilesController.InsertListColumns;
var Column :TccListColumn;
begin
   FView.ListView.Columns.Clear;
   Column := TccListColumn.Create(FView.ListView.Columns);
   Column.Caption    := 'Usuario';
   Column.ColumnName := 'CD_PROFILE';
   Column.Width      := 120;

   //Column := TccListColumn.Create(FView.ListView.Columns);
   //Column.Caption    := 'Nombre';
   //Column.ColumnName := 'DS_USR';
   //Column.Width      := 180;
   ////FView.ListView.Columns.Add(Column);
   //
   //Column := TccListColumn.Create(FView.ListView.Columns);
   //Column.Caption    := 'Administrador';
   //Column.ColumnName := 'ADMINISTRATOR';
   //Column.Width      := 80;
   ////FView.ListView.Columns.Add(Column);
end;

procedure TProfilesController.InsertListItem(prmItem: TProfile);
var ListItem :TListItem;
begin
   ListItem := FView.ListView.Items.Add;
   ListItem.Data := prmItem;
   ListItem.Caption := prmItem.CD_PROFILE;
   ListItem.ImageIndex := ImageIndex_Profile;
end;

function TProfilesController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Gestión de Perfiles.';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow                      := OnShowForm;
   FView.BtnImageNew.OnClick         := OnClick_New;
   FView.BtnImageEdit.OnClick        := OnClick_Modify;
   FView.BtnImageDelete.OnClick      := OnClick_Delete;
   FView.BtnImageDelete.OnDragOver   := OnDragOver_Delete;
   FView.BtnImageDelete.OnDragDrop   := OnDragDrop_Delete;
   FView.BtnImageEdit.OnDragOver     := OnDragOver_Edit;
   FView.BtnImageEdit.OnDragDrop     := OnDragDrop_Edit;
   FView.ListView.OnSelectItem       := OnListViewSelectItem;
   FView.BtnImageList.Onclick        := OnClick_BtnImageList;
   FView.BtnImageReport.OnClick      := OnClick_BtnImageReport;
   FView.BtnImageIcons.OnClick       := OnClick_BtnImageIconos;
   FView.BtnImageSearch.OnClick      := OnClick_BtnImageSearch;
   FView.ListView.OnDblClick         := OnDblClick_List;
   FView.ListView.OnColumnClick      := OnColumnClick_List;
   FView.ListView.OnInfoTip          := OnList_InfoTip;
   FView.EditSearchText.OnKeyDown    := OnKeyDown_EditSearch;
   Result := True;
   FView.Show;
end;

procedure TProfilesController.RefreshAllItems;
{Clear all data in the view and reload it from database }
{! I M P O R T A N T  !   This method don't executes the query. It spend the query is open previously.}
var Profile :TProfile;  
begin
   FView.ListView.Items.Clear;
   FModel.First;
   while not FModel.EOF do begin
      Profile := FModel.Current;
      InsertListItem(Profile);
      FModel.Next;
   end;
end;

procedure TProfilesController.OnShowForm(Sender: TObject);
begin
   FView.EditSearchText.SetFocus;
   FView.EditSearchText.SelectAll;
end;

procedure TProfilesController.OnClick_New(Sender :TObject);
var Profile :TProfile;
begin
   FEditView := TEditProfileView.Create(FView);
   FEditView.State := vsInsert;
   {Configuration of the view....}
   AssignDelegatesToEditView;

   Profile := FModel.GetNewClass;
   FEditView.Profile := Profile;
   try
      if FEditView.ShowModal = mrOK then begin
         {Call to model with insert instruction. }
         InsertListItem(Profile);
         FModel.Save(Profile);
      end;
   finally FEditView.Free;
   end;
end;

procedure TProfilesController.OnClick_Modify(Sender :TObject);
begin
   if FView.ListView.Selected <> nil then begin
      FEditView := TEditProfileView.Create(FView);
      FEditView.State := vsEdit;
      AssignDelegatesToEditView;
      {Configuration of the view....}
      FEditView.Profile := TProfile(FView.ListView.Selected.Data);
      try
         if FEditView.ShowModal = mrOK then begin
            FModel.Update(TProfile(FView.ListView.Selected.Data));
            FModel.Refresh;
            RefreshAllItems;
         end;
      finally FEditView.Free;
      end;
   end
   else FView.ShowMessage('Debe seleccionar un Usuario');
end;

procedure TProfilesController.OnClick_Delete(Sender :TObject);
var Profile :TProfile;
begin
   Profile := TProfile(FView.ListView.Selected.Data);
   if Profile <> nil then begin
      if MessageDlg('¿Seguro que desea eliminar el elemento seleccionado?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if FModel.Delete(Profile) then begin
            FView.ListView.Selected.Delete;
         end;
      end;
   end;
end;

procedure TProfilesController.OnDragOver_Delete(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TProfile);
end;

procedure TProfilesController.OnDragDrop_Delete(Sender, Source: TObject; X, Y: Integer);
var Profile :TProfile;
begin
   if (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TProfile) then begin
       Profile := TProfile(TListView(Source).Selected.Data);
       if Profile <> nil then begin
          if MessageDlg('¿Seguro que desea eliminar el elemento seleccionado?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
             if FModel.Delete(Profile) then begin
                TListView(Source).Selected.Delete;
             end;
          end;
       end;
   end;
end;

procedure TProfilesController.OnDragOver_Edit(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TProfile);
end;

procedure TProfilesController.OnDragDrop_Edit(Sender, Source: TObject; X, Y: Integer);
var Profile :TProfile;
begin
   if (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TProfile) then begin
       Profile := TProfile(TListView(Source).Selected.Data);
       FEditView := TEditProfileView.Create(FView);
       FEditView.State := vsEdit;
       AssignDelegatesToEditView;
       {Configuration of the view....}
       FEditView.Profile := TProfile(FView.ListView.Selected.Data);
       try
          if FEditView.ShowModal = mrOK then begin
             FModel.Update(Profile);
          end;
       finally FEditView.Free;
       end;
   end;
end;

procedure TProfilesController.OnClick_BtnImageList(Sender :TObject);
begin
   FView.ListView.ViewStyle := vsList;
end;

procedure TProfilesController.OnClick_BtnImageReport(Sender: TObject);
begin
   FView.ListView.ViewStyle := vsReport;
end;

procedure TProfilesController.OnClick_BtnImageIconos(Sender: TObject);
begin
   FView.ListView.ViewStyle := vsIcon;
end;

procedure TProfilesController.OnClick_BtnImageSearch(Sender: TObject);
begin
   FModel.Refresh;
   RefreshAllItems;
end;

procedure TProfilesController.AssignDelegatesToEditView;
begin
   FEditView.BtnAccept.Onclick := Delegate_EditViewBtnAcceptClick;
   FEditView.BtnCancel.Onclick := Delegate_EditViewBtnCancelClick;
end;

procedure TProfilesController.Delegate_EditViewBtnAcceptClick(Sender: TObject);
var MessageText :string;
    ResultCode  :Integer;
begin
   ResultCode := FModel.CheckValues(FEditView.Profile, MessageText);
   if  ResultCode <> 0 then begin
      FEditView.ShowMessage(MessageText);
      case ResultCode of
           -1:FEditView.EditCD_PROFILE.SetFocus;
      end;
   end
   else begin
      FEditView.ModalResult := mrOK;
   end;
end;

procedure TProfilesController.Delegate_EditViewBtnCancelClick(Sender: TObject);
begin
   FEditView.ModalResult := mrCancel;
end;

procedure TProfilesController.OnDblClick_List(Sender: TObject);
begin
   FView.BtnImageEdit.OnClick(Self);
end;

procedure TProfilesController.OnColumnClick_List(Sender: TObject; Column: TListColumn);
begin
   FModel.OrderFieldName := TccListColumn(Column).ColumnName;
   FModel.Refresh;
   RefreshAllItems;
end;

procedure TProfilesController.OnListViewSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var Profile :TProfile;
begin
   Profile := TProfile(Item.Data);
   FView.ShowMessage(Profile.CD_PROFILE);
end;

procedure TProfilesController.OnList_InfoTip(Sender: TObject; Item: TListItem; var InfoTip: String);
begin
   InfoTip := TProfile(Item.Data).CD_PROFILE;
end;

procedure TProfilesController.OnKeyDown_EditSearch(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   FTimer.Enabled := False;
   FTimer.Interval := FTimerInterval;
   case Key of
      VK_UP , VK_DOWN , VK_HOME,
      VK_END, VK_PRIOR, VK_NEXT,
      VK_RIGHT, VK_LEFT :SendMessage(FView.ListView.Handle, WM_KEYDOWN, Key, 0);
      {if the componente is a grid, remove the next two from the previus option an remove the coment in two next lines}
      //VK_RIGHT                  :SendMessage(FView.ListView.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
      //VK_LEFT                   :SendMessage(FView.ListView.Handle, WM_HSCROLL, SB_LINELEFT , 0);
   end;
   FTimer.Enabled := True;
end;

procedure TProfilesController.OnTimerEvent(Sender: TObject);
begin
   TextSearched := FView.EditSearchText.Text;
end;

procedure TProfilesController.SetTextSearched(Value: string);
var TempText :string;
begin
   TempText := Trim(Value);
   if FTextSearched <> TempText then begin
      FTextSearched := TempText;
      FTimer.Enabled := False;
      FModel.Search(FTextSearched);
      RefreshAllItems;
   end;
end;



end.
