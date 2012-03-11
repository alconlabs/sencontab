unit UsersController;

interface

uses Classes, CustomController, DBController,
     UsersView,
     UserClass,
     UsersModel;
type
  TUsersController = class(TCustomController)
  private
    FView         :TUsersView;
    FModel        :TUsersModel;
  protected
    {Delegate declarations}
    procedure OnClick_NewUser   (Sender : TObject);
    procedure OnClick_ModifyUser(Sender : TObject);
    procedure OnClick_DeleteUser(Sender : TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, Controls, SysUtils, ComCtrls,
     EditUserView, CustomView;

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
   FView.BtnNewUser.OnClick    := OnClick_NewUser;
   FView.BtnEditUser.OnClick   := OnClick_ModifyUser;
   FView.BtnDeleteUser.OnClick := OnClick_DeleteUser;
   //Result :=
   FView.Show;
end;


procedure TUsersController.OnClick_NewUser(Sender :TObject);
var FEditUserView :TEditUserView;
    InsertUser    :Boolean;
begin
   FEditUserView := TEditUserView.Create(FView);
   {Configuration of the view....}
   try InsertUser := FEditUserView.ShowModal = mrOK;
   finally FEditUserView.Free;
   end;
end;

procedure TUsersController.OnClick_ModifyUser(Sender :TObject);
begin

end;

procedure TUsersController.OnClick_DeleteUser(Sender :TObject);
begin

end;

end.
