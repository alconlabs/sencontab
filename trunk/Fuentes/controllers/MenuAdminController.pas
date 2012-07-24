unit MenuAdminController;

interface

uses Classes, DBController,
     CustomController, MenuAdminView,
     EnterprisesController,
     UsersController,
     ProfilesController,
     UserClass;


type
  TMenuAdminController = class(TCustomController)
  private
    FView                  :TFormMenuAdmin;
    FEnterprisesController :TEnterprisesController;
    FUsersController       :TUsersController;
    FProfilesController    :TProfilesController;
    FUserAuthenticated     :TUser;
  protected
    procedure LabelEnterprisesClick(Sender: TObject);
    procedure LabelUsersClick(Sender: TObject);
    procedure LabelProfilesClick(Sender: TObject);
  public
    constructor Create(ADBController :TDBController; AUser :TUser); reintroduce;
    destructor  Destroy; override;
    procedure ShowView;
  end;

implementation
uses Forms, Controls, SysUtils, CustomView;

constructor TMenuAdminController.Create(ADBController :TDBController; AUser :TUser);
begin
   inherited Create(ADBController);
   FUserAuthenticated := AUser;
   Application.CreateForm(TFormMenuAdmin, FView);
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   { Delegates Assignation }
   FView.LabelEnterprises.OnClick := LabelEnterprisesClick;
   FView.LabelUsers.OnClick       := LabelUsersClick;
   FView.LabelProfiles.OnClick    := LabelProfilesClick;
end;

destructor TMenuAdminController.Destroy;
begin
   FView.Free;
end;

procedure TMenuAdminController.LabelEnterprisesClick(Sender: TObject);
begin
   FEnterprisesController := TEnterprisesController.Create(DBCtlr);
   try
      FEnterprisesController.ShowView;
   finally
   end;
end;

procedure TMenuAdminController.LabelProfilesClick(Sender: TObject);
begin
   FProfilesController := TProfilesController.Create(DBCtlr);
   try
      FProfilesController.ShowView;
   finally
   end;
end;

procedure TMenuAdminController.LabelUsersClick(Sender: TObject);
begin
   FUsersController := TUsersController.Create(DBCtlr);
   try
      FUsersController.ShowView;
   finally
   end;
end;

procedure TMenuAdminController.ShowView;
begin
   FView.Show;
end;

end.
