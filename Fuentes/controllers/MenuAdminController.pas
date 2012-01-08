unit MenuAdminController;

interface

uses Classes, DBController, MenuAdminView;

type
  TMenuAdminController = class
  private
    FView         :TFormMenuAdmin;
    //FModel        :TLoginModel;
    FDBController :TDBController;
  protected
    {Delegate declarations}
    //procedure OnClick_BtnOK           (Sender : TObject);
    //procedure OnClick_LinkLostPassword(Sender : TObject);
    //procedure OnClick_LinkNewAccount  (Sender : TObject);
  public
    constructor Create(ADBController :TDBController);
    destructor  Destroy; override;
    property DB :TDBController read FDBController;
    procedure ShowView;
  end;

implementation
uses Forms, Controls, SysUtils;

constructor TMenuAdminController.Create(ADBController :TDBController);
begin
   FDBController := ADBController;
   Application.CreateForm(TFormMenuAdmin, FView);
end;

destructor TMenuAdminController.Destroy;
begin
   FView.Free;
end;

procedure TMenuAdminController.ShowView;
begin
   {Assignament of Resources}
   //FView.Caption                      := 'Login';    //GetTextFor('LoginView_Caption'           );
   //FView.LabelUser.Caption            := 'Usuario';  //GetTextFor('LoginView_LabelUser'         );
   //FView.LabelPassword.Caption        := 'Password'; //GetTextFor('LoginView_LabelPassword'     );
   //FView.BtnCancel.Caption            := 'Cancelar'; //GetTextFor('BtnCancel'                   );
   //FView.BtnAccept.Caption            := 'Aceptar';  //GetTextFor('BtnOK'                       );

   {Assignament of the delegates}
   //FView.BtnAccept.OnClick             := OnClick_BtnOK;
   //FView.BtnCancel.OnClick             := OnClick_BtnCancel;
   //FView.ClickHandler_LinkLostPassword := OnClick_LinkLostPassword;
   //FView.ClickHandler_LinkNewAccount   := OnClick_LinkNewAccount;
end;

end.
