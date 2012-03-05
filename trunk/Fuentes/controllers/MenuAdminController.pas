unit MenuAdminController;

interface

uses Classes, DBController,
     CustomController, MenuAdminView,
     EnterprisesController,
     UsersController;

type
  TMenuAdminController = class(TCustomController)
  private
    FView                  :TFormMenuAdmin;
    FEnterprisesController :TEnterprisesController;
    FUsersController       :TUsersController;
  protected
    procedure LabelEnterprisesClick(Sender: TObject);
    procedure LabelUsersClick(Sender: TObject);
  public
    constructor Create(ADBController :TDBController); override;
    destructor  Destroy; override;
    procedure ShowView;
  end;

implementation
uses Forms, Controls, SysUtils;

constructor TMenuAdminController.Create(ADBController :TDBController);
begin
   inherited Create(ADBController);
   Application.CreateForm(TFormMenuAdmin, FView);
   { Delegates Assignation }
   FView.LabelEnterprises.OnClick := LabelEnterprisesClick;
   FView.LabelUsers.OnClick       := LabelUsersClick; 
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
