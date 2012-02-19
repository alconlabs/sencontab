unit EnterprisesController;

interface

uses Classes, CustomController, DBController,
     WizardGestEnterprises, EnterprisesModel;
type
  TEnterprisesController = class(TCustomController)
  private
    FView         :TFormWizardGestEnterprises;
    FModel        :TEnterprisesModel;
  protected
    {Delegate declarations}
    procedure OnClick_BtnOK           (Sender : TObject);
    procedure OnClick_LinkLostPassword(Sender : TObject);
    procedure OnClick_LinkNewAccount  (Sender : TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, Controls, SysUtils;

constructor TEnterprisesController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);
   FView  := TFormWizardGestEnterprises.Create(Application);
   FModel := TEnterprisesModel.Create(DBCtlr.DBConnection.Connection);
end;

destructor TEnterprisesController.Destroy;
begin
   FModel.Free;
   FView.Free;
end;

function TEnterprisesController.ShowView;
begin
   {Assignament of Resources}
   FView.Caption                      := 'Asistente de Gestión de Empresas';
   
   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignament of the delegates}
   //FView.BtnAccept.OnClick             := OnClick_BtnOK;
   //FView.BtnCancel.OnClick             := OnClick_BtnCancel;
   //FView.ClickHandler_LinkLostPassword := OnClick_LinkLostPassword;
   //FView.ClickHandler_LinkNewAccount   := OnClick_LinkNewAccount;

   //FView.LabelPasswordWarn.Visible := FModel.AdminPasswordInitial;

   Result := FView.ShowModal = mrOK;
end;


procedure TEnterprisesController.OnClick_BtnOK(Sender :TObject);
begin
(*   if (Trim(FView.EditUser.Text)     = '') or
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
   end;*)
end;

procedure TEnterprisesController.OnClick_LinkLostPassword(Sender :TObject);
//var LostPassword :TLostPasswordController;
begin
//   LostPassword := new TLostPasswordController;
//   try
//     LostPassword.ShowView;
//   finally
//     
//   end;
end;

procedure TEnterprisesController.OnClick_LinkNewAccount(Sender :TObject);
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
