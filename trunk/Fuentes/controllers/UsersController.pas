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
    procedure InsertListItem(prmUser :TUser);
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
var  User :TUser;
begin
   inherited Create(ADBController);
   FView  := TUsersView.Create(Application);
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
   Listitem.Caption := prmUser.CD_USER+' -> '+prmUser.DS_USER;
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
            {Call to model with update instruction }
            //UpdateItemToDatabase(User);
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
    ResultCode  :Integer;
begin
   case FEditUserView.State of
     vsEdit:;
     vsInsert:begin
        if Trim(FEditUserView.EditNEW_PASSWORD.Text) = '' then begin
           Avisar de que debe indicarse la clave
        end else
        if Trim(FEditUserView.EditNEW_PASSWORD.Text) <> Trim(FEditUserView.EditNEW_PASSWORD_TWO.Text) then begin
           Indicar que deben ser iguales la primera y la segunda
        end
        else Asignar el varlor de la clave a Password con la función de encriptacion.


     end;
   end;

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

procedure TUsersController.OnListViewUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var User :TUser;
begin
  User := TUser(Item.Data);
  FView.ShowMessage(User.CD_USER+'   =>  '+User.DS_USER);
end;


end.
