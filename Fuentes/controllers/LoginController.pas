unit LoginController;

interface

uses Classes, DBController, CustomController,
     LoginView,
     LoginModel,
     UserClass;

   {TODO: Create the model for the login function. This is a classic model.}
   {TODO: Do all the functionality in the Controller instead in the View.  }

type
  TMenuShowed = (msNone, msAdmin, msMain);

  TLoginController = class(TCustomController)
  private
  {$IFDEF UNIT_TESTING}
  public
  {$ENDIF}
    FView              :TFormLoginView;
    FModel             :TLoginModel;
    FUserAuthenticated :TUser;
    FResult            :TMenuShowed;
  private
    procedure InitializeView;
    procedure SetResult(Value :TMenuShowed);
    property  prvResult :TMenuShowed read FResult write SetResult;
  protected
    {Delegate declarations}
    procedure OnClick_BtnOK           (Sender : TObject);
    procedure OnClick_LinkLostPassword(Sender : TObject);
    procedure OnClick_LinkNewAccount  (Sender : TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function ShowView :TMenuShowed;
    property UserAuthenticated :TUser read FUserAuthenticated; {read only}
  end;

implementation
uses Forms, Controls, SysUtils, CustomView;

constructor TLoginController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);
   FUserAuthenticated := nil;
   FView  := TFormLoginView.Create(Application);
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   FModel := TLoginModel.Create(DBCtlr.DBConnection.Connection);
   InitializeView;
end;

destructor TLoginController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

procedure TLoginController.InitializeView;
begin
   {Assignament of Resources}
   FView.Caption                      := 'Login';    //GetTextFor('LoginView_Caption'           );
   FView.LabelUser.Caption            := 'Usuario';  //GetTextFor('LoginView_LabelUser'         );
   FView.LabelPassword.Caption        := 'Password'; //GetTextFor('LoginView_LabelPassword'     );
   //FView.LinkLostPassword.Text        := GetTextFor('LoginView_LinkLostPassword'  );
   //FView.LinkNewAccount.Text          := GetTextFor('LoginView_LinkNewAccount'    );
   FView.BtnCancel.Caption            := 'Cancelar'; //GetTextFor('BtnCancel'                   );
   FView.BtnAccept.Caption            := 'Aceptar';  //GetTextFor('BtnOK'                       );
   //FView.LabelAdminPassword.Text      := GetTextFor('LoginView_LabelAdminPassword');
   //FView.EditUser.scWaterMarkText     := GetTextFor('LoginView_EditUser'          );
   //FView.EditPassword.scWaterMarkText := GetTextFor('LoginView_EditPassword'      );

   {Assignament of the delegates}
   FView.BtnAccept.OnClick                := OnClick_BtnOK;
   FView.LabelPasswordWarn.OnMouseDown    := FView.CustomViewMouseDown;
   FView.ImagenAnagrama.OnMouseDown       := FView.CustomViewMouseDown;
   FView.LabelAccountingTitle.OnMouseDown := FView.CustomViewMouseDown;
   //FView.BtnCancel.OnClick              := OnClick_BtnCancel;
   //FView.ClickHandler_LinkLostPassword  := OnClick_LinkLostPassword;
   //FView.ClickHandler_LinkNewAccount    := OnClick_LinkNewAccount;

   FView.LabelPasswordWarn.Visible := FModel.AdminPasswordInitial;
end;

function TLoginController.ShowView :TMenuShowed;
begin
   if FView.ShowModal = mrOK then begin
      Result := prvResult;
   end
   else Result := msNone;
end;

procedure TLoginController.OnClick_BtnOK(Sender :TObject);
begin
   if (Trim(FView.EditUser.Text)     = '') or
      (Trim(FView.EditPassword.Text) = '') then begin
      FView.ShowMessage('Ni Usuario ni Password pueden quedar en blanco.');
      prvResult := msNone;
      Exit;
   end;

   if not FModel.UserCorrect(Trim(FView.EditUser.Text), Trim(FView.EditPassword.Text)) then begin
      FView.ShowMessage('Usuario o Password no son correctos. Inténtelo de Nuevo.');
      prvResult := msNone;
      Exit;
   end;

   if FModel.UserIsAdministrator(Trim(FView.EditUser.Text)) then begin
      prvResult := msAdmin; // Show the administration menu
      FView.ModalResult := mrOK;
   end
   else begin
      prvResult := msMain; // Show the main form menu
      FView.ModalResult := mrOK;
   end;
end;

procedure TLoginController.OnClick_LinkLostPassword(Sender :TObject);
//var LostPassword :TLostPasswordController;
begin
//   LostPassword := new TLostPasswordController;
//   try
//     LostPassword.ShowView;
//   finally
//     
//   end;
end;

procedure TLoginController.OnClick_LinkNewAccount(Sender :TObject);
//var NewUserAccount :TNewUserAccountController;
begin
//  NewUserAccount := new TNewUserAccountController;
//  try
//    NewUserAccount.ShowView;
//  finally
//
//  end;
end;

procedure TLoginController.SetResult(Value: TMenuShowed);
begin
   if FResult <> Value then begin
      FResult := Value;
      case FResult of
         msNone  :if Assigned(FUserAuthenticated) then FreeAndNil(FUserAuthenticated);
         msAdmin :FUserAuthenticated := FModel.GetUserAuthenticated(Trim(FView.EditUser.Text));
         msMain  :FUserAuthenticated := FModel.GetUserAuthenticated(Trim(FView.EditUser.Text));
      end;
   end;
end;

end.
