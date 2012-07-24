unit MenuMainController;

interface

uses Classes, DBController,
     CustomController,
     MenuMainView,
     CurrentConfigClass,
     UsersController,
     ProfilesController,
     UserClass;

type
  TMenuMainController = class(TCustomController)
  private
    FView                  :TFormMenuMain;
    FCurrentConfig         :TCurrentConfig;
    FUsersController       :TUsersController;
  protected
    procedure LabelUsersClick(Sender: TObject);
  public
    constructor Create(ADBController    :TDBController;
                       AUser            :TUser;
                       prmCD_ENTERPRISE :string;
                       prmCD_PROFILE    :string;
                       prmAPPLICATION   :string); reintroduce;
    destructor  Destroy; override;
    procedure ShowView;
  end;

implementation
uses Forms, Controls, SysUtils, CustomView;

constructor TMenuMainController.Create(ADBController    :TDBController;
                                       AUser            :TUser;
                                       prmCD_ENTERPRISE :string;
                                       prmCD_PROFILE    :string;
                                       prmAPPLICATION   :string); 
begin
   inherited Create(ADBController);
   FCurrentConfig := TCurrentConfig.Create();
   FCurrentConfig.CreateUserAuthenticated(AUser);
   FCurrentConfig.CreateDBConfiguration(ADBController.DBConfig);
   FCurrentConfig.APPLICATION   := prmAPPLICATION;
   FCurrentConfig.CD_ENTERPRISE := prmCD_ENTERPRISE;
   FCurrentConfig.CD_PROFILE    := prmCD_PROFILE;
   FCurrentConfig.Initialize;
end;

destructor TMenuMainController.Destroy;
begin
   FView.Free;
end;

procedure TMenuMainController.LabelUsersClick(Sender: TObject);
begin
   FUsersController := TUsersController.Create(DBCtlr);
   try
      FUsersController.ShowView;
   finally
   end;
end;

procedure TMenuMainController.ShowView;
begin
   Application.CreateForm(TFormMenuMain, FView);
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];
   { Delegates Assignation }
   FView.LabelUsers.OnClick       := LabelUsersClick;
   FView.Show;
end;

end.
