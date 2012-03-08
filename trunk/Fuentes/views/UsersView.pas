unit UsersView;
interface
uses Buttons, Forms, Windows, Messages, DBClient, SysUtils, 
     Grids, StdCtrls, Controls, ExtCtrls, Graphics, Classes, DBCtrls, ComCtrls,
     CustomView, ImgList;

type
  TUsersView = class(TCustomView)
    Panel1: TPanel;
    BtnNewUser: TBitBtn;
    BtnDeleteUser: TBitBtn;
    BtnEditUser: TBitBtn;
    ListViewUsers: TListView;
    ImageListIcons: TImageList;
    BtnIconos: TBitBtn;
    BtnSmallIcons: TBitBtn;
    BtnReport: TBitBtn;
    BtnList: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnListClick(Sender: TObject);
    procedure BtnReportClick(Sender: TObject);
    procedure BtnSmallIconsClick(Sender: TObject);
    procedure BtnIconosClick(Sender: TObject);
  private
  public
  protected
  end;

implementation
uses Dialogs;
{$R *.DFM}

procedure TUsersView.FormCreate(Sender: TObject);
begin
   inherited;
//
end;

procedure TUsersView.FormShow(Sender: TObject);
begin
   inherited;
   //SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
end;

procedure TUsersView.BtnListClick(Sender: TObject);
begin
   ListViewUsers.ViewStyle := vsList;
end;

procedure TUsersView.BtnReportClick(Sender: TObject);
begin
   ListViewUsers.ViewStyle := vsReport;
end;

procedure TUsersView.BtnSmallIconsClick(Sender: TObject);
begin
  ListViewUsers.ViewStyle := vsSmallIcon;
end;

procedure TUsersView.BtnIconosClick(Sender: TObject);
begin
   ListViewUsers.ViewStyle := vsIcon;
end;

end.
