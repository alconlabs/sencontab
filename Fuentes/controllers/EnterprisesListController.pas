unit EnterprisesListController;

interface

uses Classes, DBController, ExtCtrls, CustomController,
     EnterpriseClass,
     EnterprisesListView,
     EnterprisesModel;

type
  TEnterprisesListController = class(TCustomController)
  private
  {$IFDEF UNIT_TESTING}
  public
  {$ENDIF}
    FView   :TFormEnterprisesListView;
    FModel  :TEnterprisesModel;
  private
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnClick_BtnOK(Sender : TObject);
    procedure InsertListItem(prmItem :TEnterprise);
    procedure RefreshAllItems;  {Clear all data in the view and reload it from database }
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function ShowView :string;
  end;

implementation
uses Forms, Controls, SysUtils, ComCtrls, CustomView;

constructor TEnterprisesListController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);

   Application.CreateForm(TFormEnterprisesListView, FView);
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   //InsertListColumns;

   FModel := TEnterprisesModel.Create(DBCtlr.DBConnection.Connection);
   FModel.LoadEnterprisesAssignedToUser('user'); {$Message Warn 'Es necesario pasar el parámetro correcto'}
   RefreshAllItems;
end;

destructor TEnterprisesListController.Destroy;
begin
   //FModel.Free;
   //FView.Free;
end;

procedure TEnterprisesListController.InitializeView;
begin
//   {Assignament of Resources}
//   FView.Caption                      := 'Login';    //GetTextFor('LoginView_Caption'           );
//   FView.LabelUser.Caption            := 'Usuario';  //GetTextFor('LoginView_LabelUser'         );
//   FView.LabelPassword.Caption        := 'Password'; //GetTextFor('LoginView_LabelPassword'     );
//   //FView.LinkLostPassword.Text        := GetTextFor('LoginView_LinkLostPassword'  );
//   //FView.LinkNewAccount.Text          := GetTextFor('LoginView_LinkNewAccount'    );
//   FView.BtnCancel.Caption            := 'Cancelar'; //GetTextFor('BtnCancel'                   );
//   FView.BtnAccept.Caption            := 'Aceptar';  //GetTextFor('BtnOK'                       );
//   //FView.LabelAdminPassword.Text      := GetTextFor('LoginView_LabelAdminPassword');
//   //FView.EditUser.scWaterMarkText     := GetTextFor('LoginView_EditUser'          );
//   //FView.EditPassword.scWaterMarkText := GetTextFor('LoginView_EditPassword'      );
//
//   {Assignament of the delegates}
//   FView.BtnAccept.OnClick                := OnClick_BtnOK;
//   FView.LabelPasswordWarn.OnMouseDown    := FView.CustomViewMouseDown;
//   FView.ImagenAnagrama.OnMouseDown       := FView.CustomViewMouseDown;
//   FView.LabelAccountingTitle.OnMouseDown := FView.CustomViewMouseDown;
//   //FView.BtnCancel.OnClick              := OnClick_BtnCancel;
//   //FView.ClickHandler_LinkLostPassword  := OnClick_LinkLostPassword;
//   //FView.ClickHandler_LinkNewAccount    := OnClick_LinkNewAccount;
//
//   FView.LabelPasswordWarn.Visible := FModel.AdminPasswordInitial;
end;

function TEnterprisesListController.ShowView :string;
begin
   if FView.ShowModal = mrOK then begin
      Result := 'OK'; {$Message Warn 'Change this by the name of the enterprise'}
   end
   else Result := '';
end;

procedure TEnterprisesListController.OnClick_BtnOK(Sender :TObject);
begin
//   if (Trim(FView.EditUser.Text)     = '') or
//      (Trim(FView.EditPassword.Text) = '') then begin
//      FView.ShowMessage('Ni Usuario ni Password pueden quedar en blanco.');
//      FResult := msNone;
//      Exit;
//   end;
//
//   if not FModel.UserCorrect(Trim(FView.EditUser.Text), Trim(FView.EditPassword.Text)) then begin
//      FView.ShowMessage('Usuario o Password no son correctos. Inténtelo de Nuevo.');
//      FResult := msNone;
//      Exit;
//   end;
//
//   if FModel.UserIsAdministrator(Trim(FView.EditUser.Text)) then begin
//      FResult := msAdmin; // Show the administration menu
//      FView.ModalResult := mrOK;
//   end
//   else begin
//      FResult := msMain; // Show the main form menu
//      FView.ModalResult := mrOK;
//   end;
end;

procedure TEnterprisesListController.InsertListItem(prmItem: TEnterprise);
var ListItem :TListItem;
begin
   ListItem := FView.ListView.Items.Add;
   ListItem.Data := prmItem;
   ListItem.Caption := prmItem.DS_ENTERPRISE;
   ListItem.ImageIndex := ImageIndex_Profile;
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

end.
