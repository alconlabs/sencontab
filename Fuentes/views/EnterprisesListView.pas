unit EnterprisesListView;

interface

uses Forms, CustomView, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls;

type
   TFormEnterprisesListView = class(TCustomView)
    LabelAccountingTitle: TLabel;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    ListView: TListView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   protected
   private
   public
   end;
                  
var FormEnterprisesListView :TFormEnterprisesListView;

implementation
{$R *.DFM}

procedure TFormEnterprisesListView.FormShow(Sender: TObject);
begin
   DoubleBuffered := True;
   ListView.SetFocus;
   ListView.Selected := ListView.Items[0];
end;

procedure TFormEnterprisesListView.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_F1)) then begin
      Application.HelpContext(Self.HelpContext)
   end
end;

end.
