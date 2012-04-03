unit UsersController;

interface

uses Classes, CustomController, ComCtrls, Controls,
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
    procedure InsertListItem(prmUser :TUser);
    procedure AssignDelegatesToEditUserView;
    {Delegate declarations}
    procedure OnClick_NewUser   (Sender : TObject);
    procedure OnClick_ModifyUser(Sender : TObject);
    procedure OnClick_DeleteUser(Sender : TObject);
    procedure OnDragOver_DeleteUser(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OnDragDrop_DeleteUser(Sender, Source: TObject; X,  Y: Integer);
    procedure OnDragOver_EditUser(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OnDragDrop_EditUser(Sender, Source: TObject; X,  Y: Integer);
    procedure OnClick_BtnImageList(Sender :TObject);
    procedure OnClick_BtnImageReport(Sender: TObject);
    procedure OnClick_BtnImageIconos(Sender: TObject);
    procedure OnClick_BtnImageSearch(Sender: TObject);
    procedure OnDblClick_ListUsers(Sender: TObject);
    procedure OnListUsers_InfoTip(Sender: TObject; Item: TListItem; var InfoTip: String);
    procedure OnListViewUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure Delegate_EditUserViewBtnAcceptClick(Sender: TObject);
    procedure Delegate_EditUserViewBtnCancelClick(Sender: TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, SysUtils, Dialogs, DB,
     CustomView,
     HashCriptography;

constructor TUsersController.Create(ADBController :TDBController);
var User :TUser;
begin
   inherited Create(ADBController);
   Application.CreateForm(TUsersView, FView);
   //FView  := TUsersView.Create(Application);
   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];
   FModel := TUsersModel.Create(DBCtlr.DBConnection.Connection);
   FModel.Open;
   while not FModel.EOF do begin
      User := FModel.Current;
      InsertListItem(User);
      FModel.Next;
   end;
end;

destructor TUsersController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

procedure TUsersController.InsertListItem(prmUser: TUser);
var ListItem :TListItem;
begin
   ListItem := FView.ListViewUsers.Items.Add;
   ListItem.Data := prmUser;
   ListItem.Caption := prmUser.CD_USER;//+' -> '+prmUser.DS_USER;
   ListItem.SubItems.Add(prmUser.DS_USER);
   if prmUser.ADMINISTRATOR = 'Y' then ListItem.SubItems.Add('Si')
   else ListItem.SubItems.Add('No');
   ListItem.ImageIndex := 0;
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
   FView.BtnImageDelete.OnDragOver  := OnDragOver_DeleteUser;
   FView.BtnImageDelete.OnDragDrop  := OnDragDrop_DeleteUser;
   FView.BtnImageEdit.OnDragOver    := OnDragOver_EditUser;
   FView.BtnImageEdit.OnDragDrop    := OnDragDrop_EditUser;
   FView.ListViewUsers.OnSelectItem := OnListViewUsersSelectItem;
   FView.BtnImageList.Onclick       := OnClick_BtnImageList;
   FView.BtnImageReport.OnClick     := OnClick_BtnImageReport;
   FView.BtnImageIcons.OnClick      := OnClick_BtnImageIconos;
   FView.BtnImageSearch.OnClick     := OnClick_BtnImageSearch;
   FView.ListViewUsers.OnDblClick   := OnDblClick_ListUsers;
   FView.ListViewUsers.OnInfoTip    := OnListUsers_InfoTip;
   //Result :=
   FView.Show;
end;

procedure TUsersController.OnClick_NewUser(Sender :TObject);
var User :TUser;
begin
   FEditUserView := TEditUserView.Create(FView);
   FEditUserView.State := vsInsert;
   {Configuration of the view....}
   AssignDelegatesToEditUserView;
   FEditUserView.EditOLD_PASSWORD.Visible := False;
   FEditUserView.LabelOldPassword.Visible := False;

   User := FModel.GetNewClass;
   FEditUserView.User := User;
   try
      if FEditUserView.ShowModal = mrOK then begin
         {Call to model with insert instruction. }
         InsertListItem(User);
         FModel.Save(User);
      end;
   finally FEditUserView.Free;
   end;
end;

procedure TUsersController.OnClick_ModifyUser(Sender :TObject);
begin
   if FView.ListViewUsers.Selected <> nil then begin
      FEditUserView := TEditUserView.Create(FView);
      FEditUserView.State := vsEdit;
      AssignDelegatesToEditUserView;
      {Configuration of the view....}
      FEditUserView.User := TUser(FView.ListViewUsers.Selected.Data);
      try
         if FEditUserView.ShowModal = mrOK then begin
            FModel.Update(TUser(FView.ListViewUsers.Selected.Data));
         end;
      finally FEditUserView.Free;
      end;
   end
   else FView.ShowMessage('Debe seleccionar un Usuario');
end;

procedure TUsersController.OnClick_DeleteUser(Sender :TObject);
var User :TUser;
begin
   User := TUser(FView.ListViewUsers.Selected.Data);
   if User <> nil then begin
      if MessageDlg('¿Seguro que desea eliminar el elemento seleccionado?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if FModel.Delete(User) then begin
            FView.ListViewUsers.Selected.Delete;
         end;
      end;
   end;
end;

procedure TUsersController.OnDragOver_DeleteUser(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TUser);
end;

procedure TUsersController.OnDragDrop_DeleteUser(Sender, Source: TObject; X, Y: Integer);
var User :TUser;
begin
   if (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TUser) then begin
       User := TUser(TListView(Source).Selected.Data);
       if User <> nil then begin
          if MessageDlg('¿Seguro que desea eliminar el elemento seleccionado?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
             if FModel.Delete(User) then begin
                TListView(Source).Selected.Delete;
             end;
          end;
       end;
   end;
end;

procedure TUsersController.OnDragOver_EditUser(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TUser);
end;

procedure TUsersController.OnDragDrop_EditUser(Sender, Source: TObject; X, Y: Integer);
var User :TUser;
begin
   if (Source is TListView) and (TObject(TListView(Source).Selected.Data) is TUser) then begin
       User := TUser(TListView(Source).Selected.Data);
       FEditUserView := TEditUserView.Create(FView);
       FEditUserView.State := vsEdit;
       AssignDelegatesToEditUserView;
       {Configuration of the view....}
       FEditUserView.User := TUser(FView.ListViewUsers.Selected.Data);
       try
          if FEditUserView.ShowModal = mrOK then begin
             FModel.Update(User);
          end;
       finally FEditUserView.Free;
       end;
   end;
end;

procedure TUsersController.OnClick_BtnImageList(Sender :TObject);
begin
   FView.ListViewUsers.ViewStyle := vsList;
end;

procedure TUsersController.OnClick_BtnImageReport(Sender: TObject);
begin
   FView.ListViewUsers.ViewStyle := vsReport;
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
    ResultCode  :Integer;
    Continue    :Boolean;
begin
   case FEditUserView.State of
     vsEdit:begin
       Continue := True; {TODO: Hacer las comprobaciones del password }
     end;
     vsInsert:begin
        if Trim(FEditUserView.EditNEW_PASSWORD.Text) = '' then begin
           FEditUserView.ShowMessage('Debe indicar el Password');
           FEditUserView.EditNEW_PASSWORD.SetFocus;
           Continue := False;
        end else
        if Trim(FEditUserView.EditNEW_PASSWORD.Text) <> Trim(FEditUserView.EditNEW_PASSWORD_TWO.Text) then begin
           FEditUserView.ShowMessage('No ha repetido bien el password');
           FEditUserView.EditNEW_PASSWORD_TWO.SetFocus;
           Continue := False;
        end
        else begin
           if not (FEditUserView.HUsers.State in dsEditModes) then FEditUserView.HUsers.Edit;
           FEditUserView.HUsersPASSWORD.AsString := GetSHA1Hash(FEditUserView.EditNEW_PASSWORD.Text);
           FEditUserView.HUsers.Post;
           Continue := True;  
        end;
     end;
   end;

   if not Continue then Exit;
   
   ResultCode := FModel.CheckValues(FEditUserView.User, MessageText);
   if  ResultCode <> 0 then begin
      FEditUserView.ShowMessage(MessageText);
      case ResultCode of
           -1:FEditUserView.EditCD_USER.SetFocus;
           -2:FEditUserView.EditDS_USER.SetFocus;
           -3:FEditUserView.EditOLD_PASSWORD.SetFocus;
      end;
   end
   else begin
      FEditUserView.ModalResult := mrOK;
   end;
end;

procedure TUsersController.Delegate_EditUserViewBtnCancelClick(Sender: TObject);
begin
   FEditUserView.ModalResult := mrCancel;
end;

procedure TUsersController.OnDblClick_ListUsers(Sender: TObject);
begin
   FView.BtnImageEdit.OnClick(Self);
end;

procedure TUsersController.OnListViewUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var User :TUser;
begin
  User := TUser(Item.Data);
  FView.ShowMessage(User.CD_USER+'   =>  '+User.DS_USER);
end;

procedure TUsersController.OnListUsers_InfoTip(Sender: TObject; Item: TListItem; var InfoTip: String);
var TextAdministrator :string;
begin
   if TUser(Item.Data).ADMINISTRATOR = 'Y' then TextAdministrator := 'Es Administrador'
   else TextAdministrator := 'Usuario estandar';

   InfoTip := TUser(Item.Data).CD_USER + #13#10 +
              TUser(Item.Data).DS_USER + #13#10 +
              TextAdministrator;
end;

end.
