unit UsersController;

interface

uses Classes, CustomController, ComCtrls,
     DBController,
     UsersView,
     EditUserView,
     UserClass,
     UsersModel;
type
  TUsersController = class(TCustomController)
  private
    FView         :TUsersView;
    FModel        :TUsersModel;
    FEditUserView :TEditUserView;
  protected
    procedure AssignDelegatesToEditUserView;
    {Delegate declarations}
    procedure OnClick_NewUser   (Sender : TObject);
    procedure OnClick_ModifyUser(Sender : TObject);
    procedure OnClick_DeleteUser(Sender : TObject);
    procedure OnClick_BtnImageList(Sender :TObject);
    procedure OnClick_BtnImageReport(Sender: TObject);
    procedure OnClick_BtnImageSmallIcons(Sender: TObject);
    procedure OnClick_BtnImageIconos(Sender: TObject);
    procedure OnClick_BtnImageSearch(Sender: TObject);
    procedure OnListViewUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure Delegate_EditUserViewBtnAcceptClick(Sender: TObject);
    procedure Delegate_EditUserViewBtnCancelClick(Sender: TObject);

  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, Controls, SysUtils, Dialogs, 
     CustomView;

constructor TUsersController.Create(ADBController :TDBController);
var  User     :TUser;
     ListItem :TListItem;
begin
   inherited Create(ADBController);
   FView  := TUsersView.Create(Application);
   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];
   FModel := TUsersModel.Create(DBCtlr.DBConnection.Connection);
   FModel.Open;
   while not FModel.EOF do begin
      User := FModel.Current;
      ListItem := FView.ListViewUsers.Items.Add;
      ListItem.Data := User;
      Listitem.Caption := User.CD_USER+' -> '+User.DS_USER;
      ListItem.ImageIndex := 0;
      //FView.ListViewUsers.Add(User);
      FModel.Next;
   end;
end;

destructor TUsersController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

function TUsersController.ShowView;
begin
   {Assignament of Resources}
   FView.Caption     := 'Gestión de Usuarios.';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.BtnImageNew.OnClick        := OnClick_NewUser;
   FView.BtnImageEdit.OnClick       := OnClick_ModifyUser;
   FView.BtnImageDelete.OnClick     := OnClick_DeleteUser;
   FView.ListViewUsers.OnSelectItem := OnListViewUsersSelectItem;
   FView.BtnImageList.Onclick       := OnClick_BtnImageList;
   FView.BtnImageReport.OnClick     := OnClick_BtnImageReport;
   FView.BtnImageSmallIcons.OnClick := OnClick_BtnImageSmallIcons;
   FView.BtnImageIcons.OnClick      := OnClick_BtnImageIconos;
   FView.BtnImageSearch.OnClick     := OnClick_BtnImageSearch;
   //Result :=
   FView.Show;
end;

procedure TUsersController.OnClick_NewUser(Sender :TObject);
var InsertUser    :Boolean;
begin
   FEditUserView := TEditUserView.Create(FView);
   {Configuration of the view....}
   try InsertUser := FEditUserView.ShowModal = mrOK;
   finally FEditUserView.Free;
   end;
end;

procedure TUsersController.OnClick_ModifyUser(Sender :TObject);
var ModifyUser :Boolean;
begin
   if FView.ListViewUsers.Selected <> nil then begin
      FEditUserView := TEditUserView.Create(FView);
      AssignDelegatesToEditUserView;
      {Configuration of the view....}
      FEditUserView.User := TUser(FView.ListViewUsers.Selected.Data);
      try
         if FEditUserView.ShowModal = mrOK then begin
            //TUser(FView.ListViewUsers.Selected.Data).Assign(FEditUserView.User);
         end;
      finally FEditUserView.Free;
      end;
   end
   else FView.ShowMessage('Debe seleccionar un Usuario');
end;

procedure TUsersController.OnClick_DeleteUser(Sender :TObject);
begin

end;

procedure TUsersController.OnClick_BtnImageList(Sender :TObject);
begin
   FView.ListViewUsers.ViewStyle := vsList;
end;

procedure TUsersController.OnClick_BtnImageReport(Sender: TObject);
begin
   FView.ListViewUsers.ViewStyle := vsReport;
end;

procedure TUsersController.OnClick_BtnImageSmallIcons(Sender: TObject);
begin
   FView.ListViewUsers.ViewStyle := vsSmallIcon;
end;

procedure TUsersController.OnClick_BtnImageIconos(Sender: TObject);
begin
   FView.ListViewUsers.ViewStyle := vsIcon;
end;

procedure TUsersController.OnClick_BtnImageSearch(Sender: TObject);
begin
   ShowMessage('Falta de implementar la opción de Búsqueda');
end;


procedure TUsersController.AssignDelegatesToEditUserView;
begin
   FEditUserView.BtnAccept.Onclick := Delegate_EditUserViewBtnAcceptClick;
   FEditUserView.BtnCancel.Onclick := Delegate_EditUserViewBtnCancelClick;
end;

procedure TUsersController.Delegate_EditUserViewBtnAcceptClick(Sender: TObject);
var MessageText :string;
begin
   if FModel.CheckValues(FEditUserView.User, MessageText) <> 0 then begin
      FEditUserView.ShowMessage(MessageText);
   end
   else begin
      ShowMessage('Pulsó Aceptar');
      FEditUserView.ModalResult := mrOK;
   end;
end;

procedure TUsersController.Delegate_EditUserViewBtnCancelClick(Sender: TObject);
begin
   ShowMessage('Pulsó Cancelar');
end;

procedure TUsersController.OnListViewUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var User :TUser;
begin
  User := TUser(Item.Data);
  FView.ShowMessage(User.CD_USER+'   =>  '+User.DS_USER);
end;

end.
