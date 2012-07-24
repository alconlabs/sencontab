unit EnterprisesListController;

interface

uses Classes, DBController, ExtCtrls, CustomController,
     EnterpriseClass,
     EnterprisesListView,
     EnterprisesModel,
     UserClass;

type
  TEnterprisesListController = class(TCustomController)
  private
  {$IFDEF UNIT_TESTING}
  public
  {$ENDIF}
    FView   :TFormEnterprisesListView;
    FModel  :TEnterprisesModel;
    FUserAuthenticated :TUser;
    FCD_ENTERPRISE :string;
    FCD_PROFILE    :string;
  private
    procedure InitializeView;
    procedure InsertListColumns;
  protected
    {Delegate declarations}
    procedure OnClick_BtnOK(Sender : TObject);
    procedure InsertListItem(prmItem :TEnterprise);
    procedure RefreshAllItems;  {Clear all data in the view and reload it from database }
  public
    constructor Create(ADBController :TDBController; AUser :TUser); reintroduce;
    destructor  Destroy; override;
    function ShowView :Boolean;
    property CD_ENTERPRISE :string read FCD_ENTERPRISE;
    property CD_PROFILE    :string read FCD_PROFILE;
  end;

implementation
uses Forms, Controls, SysUtils, ComCtrls, CustomView;

constructor TEnterprisesListController.Create(ADBController :TDBController; AUser :TUser);
begin
   inherited Create(ADBController);

   FUserAuthenticated := AUser;

   Application.CreateForm(TFormEnterprisesListView, FView);
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   InitializeView;
   InsertListColumns;

   FModel := TEnterprisesModel.Create(DBCtlr.DBConnection.Connection);
   FModel.LoadEnterprisesAssignedToUser(AUser.CD_USER); 
   RefreshAllItems;
end;

destructor TEnterprisesListController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

procedure TEnterprisesListController.InitializeView;
begin
   {Assignament of Resources}
   //FView.Caption                      := 'Enterprise List';    //GetTextFor('LoginView_Caption'           );
   FView.BtnCancel.Caption            := 'Cancelar'; //GetTextFor('BtnCancel'                   );
   FView.BtnAccept.Caption            := 'Aceptar';  //GetTextFor('BtnOK'                       );

   {Assignament of the delegates}
   FView.BtnAccept.OnClick            := OnClick_BtnOK;
end;

function TEnterprisesListController.ShowView :Boolean;
begin
   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;
   
   InsertListColumns;

   FView.ListView.ViewStyle := vsReport;
   
   Result := FView.ShowModal = mrOK;
end;

procedure TEnterprisesListController.OnClick_BtnOK(Sender :TObject);
begin
   if FView.ListView.Selected <> nil then begin
      FCD_ENTERPRISE := TEnterprise(FView.ListView.Selected.Data).CD_ENTERPRISE;
      FCD_PROFILE    := FModel.GetProfileCodeForThis('ACCOUNTING', FUserAuthenticated.CD_USER, CD_ENTERPRISE);
      FView.ModalResult := mrOK;
   end
   else FView.ShowMessage('Debe seleccionar una Empresa de la Lista');
end;

procedure TEnterprisesListController.InsertListItem(prmItem: TEnterprise);
var ListItem :TListItem;
begin
   ListItem := FView.ListView.Items.Add;
   ListItem.Data := prmItem;
   ListItem.Caption := prmItem.CD_ENTERPRISE;
   ListItem.ImageIndex := ImageIndex_Profile;
   ListItem.SubItems.Add(prmItem.DS_ENTERPRISE);
   ListItem.SubItems.Add(FModel.GetProfileDescriptionForThis('ACCOUNTING', FUserAuthenticated.CD_USER, prmItem.CD_ENTERPRISE));
end;

procedure TEnterprisesListController.RefreshAllItems;
{Clear all data in the view and reload it from database }
{! I M P O R T A N T  !   This method don't executes the query. It spend the query is open previously.}
var Enterprise :TEnterprise;
begin
   FView.ListView.Items.Clear;
   FModel.First;
   while not FModel.EOF do begin
      Enterprise := FModel.Current;
      InsertListItem(Enterprise);
      FModel.Next;
   end;
end;

procedure TEnterprisesListController.InsertListColumns;
var Column :TccListColumn;
begin
   FView.ListView.Columns.Clear;
   Column := TccListColumn.Create(FView.ListView.Columns);
   Column.Caption    := 'Código';
   Column.ColumnName := 'CD_ENTERPRISE';
   Column.Width      := 80;
   //FView.ListViewUsers.Columns.Add(Column);

   Column := TccListColumn.Create(FView.ListView.Columns);
   Column.Caption    := 'Descripción';
   Column.ColumnName := 'DS_ENTERPRISE';
   Column.Width      := 180;
   //FView.ListViewUsers.Columns.Add(Column);

   Column := TccListColumn.Create(FView.ListView.Columns);
   Column.Caption    := 'Perfil';
   Column.ColumnName := 'PROFILE';
   Column.Width      := 120;
   //FView.ListViewUsers.Columns.Add(Column);
end;


end.
