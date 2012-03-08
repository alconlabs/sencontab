unit LoginController;

interface

uses Classes, DBController, CustomController, LoginView, LoginModel;

   {TODO: Create the model for the login function. This is a classic model.}
   {TODO: Do all the functionality in the Controller instead in the View.  }

type
  TMenuShowed = (msNone, msAdmin, msMain);

  TLoginController = class(TCustomController)
  private
    FView         :TFormLoginView;
    FModel        :TLoginModel;
    FResult       :TMenuShowed;
  protected
    {Delegate declarations}
    procedure OnClick_BtnOK           (Sender : TObject);
    procedure OnClick_LinkLostPassword(Sender : TObject);
    procedure OnClick_LinkNewAccount  (Sender : TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function ShowView:TMenuShowed;
  end;

implementation
uses Forms, Controls, SysUtils, CustomView;

constructor TLoginController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);
   FView  := TFormLoginView.Create(Application);
   FView.AppleIcons := [aiClose];
   FModel := TLoginModel.Create(DBCtlr.DBConnection.Connection);
end;

destructor TLoginController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

function TLoginController.ShowView :TMenuShowed;
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
   FView.BtnAccept.OnClick             := OnClick_BtnOK;
   //FView.BtnCancel.OnClick             := OnClick_BtnCancel;
   //FView.ClickHandler_LinkLostPassword := OnClick_LinkLostPassword;
   //FView.ClickHandler_LinkNewAccount   := OnClick_LinkNewAccount;

   FView.LabelPasswordWarn.Visible := FModel.AdminPasswordInitial;

   if FView.ShowModal = mrOK then begin
      Result := FResult;
   end
   else Result := msNone;
end;

procedure TLoginController.OnClick_BtnOK(Sender :TObject);
begin
   if (Trim(FView.EditUser.Text)     = '') or
      (Trim(FView.EditPassword.Text) = '') then begin
      FView.MuestraMensaje('Ni Usuario ni Password pueden', ' quedar en blanco. ');
      FResult := msNone;
      Exit;
   end;

   if not FModel.UserCorrect(Trim(FView.EditUser.Text), Trim(FView.EditPassword.Text)) then begin
      FView.MuestraMensaje('Usuario o Password no son correctos.', ' Inténtelo de Nuevo. ');
      FResult := msNone;
      Exit;
   end;

   if FModel.UserIsAdministrator(Trim(FView.EditUser.Text)) then begin
      FResult := msAdmin; // Show the administration menu
      FView.ModalResult := mrOK;
   end
   else begin
      FResult := msMain; // Show the main form menu
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

end.
