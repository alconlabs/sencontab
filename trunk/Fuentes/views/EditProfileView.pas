unit EditProfileView;

interface

uses Forms, DB, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     DBClient, SimpleDS, ComCtrls, Contnrs,
     CustomDataInputView,
     CustomView, DBCtrls, Mask,
     ProfileClass;

type
  TEditProfileView = class(TCustomDataInputView)
    LabelCode: TLabel;
    EditCD_PROFILE: TDBEdit;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    Source: TDataSource;
    Table: TClientDataSet;
    TableCD_PROFILE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
  private
    FProfile :TProfile; { Pointer to the current class }
    procedure SetItem(Value :TProfile);
    function  GetItem:TProfile;
  public
    constructor Create(AOwner: TComponent); override;
    property Profile :TProfile read GetItem write SetItem;
  end;

implementation
//uses;
{$R *.DFM}

constructor TEditProfileView.Create(AOwner: TComponent);
begin
   inherited;
   Table.Open;
end;

function TEditProfileView.GetItem: TProfile;
begin
   if Table.State in dsEditModes then Table.Post;
   FProfile.CD_PROFILE := TableCD_PROFILE.AsString;
   Result := FProfile;
end;

procedure TEditProfileView.SetItem(Value: TProfile);
begin
   FProfile := Value;
   Table.EmptyDataSet; {The only row shall be destroyed.}
   Table.Insert;
   TableCD_PROFILE.AsString := Value.CD_PROFILE;
   Table.Post;
end;

procedure TEditProfileView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table.Close;
  inherited;
end;

end.
