unit EditUserView;

interface

uses Forms, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     DBClient, SimpleDS, ComCtrls, Contnrs,
     CustomDataInputView,
     CustomView,
     UserClass, SnapBaseDataset, SnapObjectDataset, Mask, DBCtrls;

type
  TEditUserView = class(TCustomDataInputView)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditCD_USER: TDBEdit;
    EditNEW_PASSWORD: TEdit;
    Label3: TLabel;
    EditDS_USER: TDBEdit;
    LabelOldPassword: TLabel;
    EditOLD_PASSWORD: TDBEdit;
    Label2: TLabel;
    EditNEW_PASSWORD_TWO: TEdit;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    SUsers: TDataSource;
    HUsers: TClientDataSet;
    HUsersCD_USER: TStringField;
    HUsersDS_USER: TStringField;
    CheckBoxADMINISTRATOR: TDBCheckBox;
    HUsersADMINISTRATOR: TStringField;
    HUsersPASSWORD: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
  private
    FUser      :TUser; { Pointer to the current User class }
    procedure SetUser(Value :TUser);
    function  GetUser:TUser;
  public
    constructor Create(AOwner: TComponent); override;
    property User :TUser read GetUser write SetUser;
  end;

implementation
//uses;
{$R *.DFM}

constructor TEditUserView.Create(AOwner: TComponent);
begin
   inherited;
   HUsers.Open;
end;

function TEditUserView.GetUser: TUser;
begin
   if HUsers.State in dsEditModes then HUsers.Post;
   FUser.CD_USER       := HUsersCD_USER.AsString      ;
   FUser.DS_USER       := HUsersDS_USER.AsString      ;
   FUser.ADMINISTRATOR := HUsersADMINISTRATOR.AsString;
   FUser.PASSWORD      := HUsersPASSWORD.AsString     ;
   Result := FUser;
end;

procedure TEditUserView.SetUser(Value: TUser);
begin
   FUser := Value;
   HUsers.EmptyDataSet; {The only row shall be destroyed.}
   HUsers.Insert;
   HUsersCD_USER.AsString       := Value.CD_USER;
   HUsersDS_USER.AsString       := Value.DS_USER;
   HUsersADMINISTRATOR.AsString := Value.ADMINISTRATOR;
   HUsersPASSWORD.AsString      := Value.PASSWORD;
   HUsers.Post;
end;

procedure TEditUserView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  HUsers.Close;
  inherited;
end;

end.
