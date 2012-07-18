unit LoginView;

interface

uses Forms, CustomView, ExtCtrls, SysUtils, Controls, StdCtrls, Classes, Windows, Buttons, Graphics, Messages,
     ComCtrls;

type
   TFormLoginView = class(TCustomView)
    LabelUser: TLabel;
    LabelPassword: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    LabelAccountingTitle: TLabel;
    ImagenAnagrama: TImage;
    Panel1: TPanel;
    LabelPasswordWarn: TLabel;
    BtnCancel: TBitBtn;
    BtnAccept: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   protected
   private
   public
   end;
                  
var FormLoginView :TFormLoginView;

implementation
{$R *.DFM}

procedure TFormLoginView.FormShow(Sender: TObject);
begin
   DoubleBuffered := True;
   ImagenAnagrama.Transparent := True;
end;

procedure TFormLoginView.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_F1)) then begin
      Application.HelpContext(Self.HelpContext)
   end
end;

end.
