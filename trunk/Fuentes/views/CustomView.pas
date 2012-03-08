unit CustomView;
interface
uses Forms, Messages, Windows, Graphics, Classes, ImgList, Controls,
     Dialogs, ExtCtrls, Buttons;

type
   TAppleButton = (abGray, abRed      , abYellow      , abGreen,
                           abRedSignum, abYellowSignum, abGreenSignum);
   TShowedButtons = (sbClose, sbMinimized, sbMaximized);

   TAppleIcon = (aiClose, aiMinimize, aiMaximize);
   
   TAppleIcons = set of TAppleIcon;

   TCustomView = class(TForm)
    ImageListAppleWindow: TImageList;
    ImageClose: TImage;
    ImageMinimize: TImage;
    ImageMaximize: TImage;
    TimerSystemIcons: TTimer;
    procedure FormResize(Sender: TObject);
    procedure ImageAppleIconMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TimerSystemIconsTimer(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure ImageMinimizeClick(Sender: TObject);
    procedure ImageMaximizeClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   protected
     procedure Paint; override;
     procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   private
     FAppleIcons: TAppleIcons;
     FAppleButtonsIconics :Boolean;
     procedure SetAppleIcons(Value :TAppleIcons);
     procedure SetSystemButtonsIconics;
     procedure SetSystemButtonsColored;
   public
     constructor Create(AOwner: TComponent); override;
     property AppleIcons: TAppleIcons read FAppleIcons write SetAppleIcons;
   end;

implementation
{$R *.DFM}

constructor TCustomView.Create(AOwner: TComponent);
begin
   inherited;
   SetSystemButtonsColored;
end;

procedure TCustomView.WMNCHitTest(var Msg: TWMNCHitTest);
begin
   {move the form by draging anywhere on the client area }
   //if (Msg.Result = htClient) then begin
   //   Msg.Result := htCaption;
   //end;
   inherited;
   //else begin
   //   Msg.Result := htCaption;
   //   inherited;
   //end;
end;

procedure TCustomView.Paint;
var Rect :HRGN;
begin
   {Hide Title Bar}
   SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
   inherited;
   {Make borders rounded }
   Canvas.Pen.Width := 1;
   Canvas.Pen.Color := $003B3B3B;
   case BorderStyle of
      bsSizeable, bsSizeToolWin: begin
         Rect := CreateRoundRectRgn(0+2, 0+2, Width , Height - (Height - ClientHeight){+6}, 10, 10);
         SetWindowRgn(Handle, Rect, True);
         Canvas.RoundRect(0, 0, Width -6, ClientHeight -5{-6}, 10, 10);
      end;
      bsNone, bsSingle, bsToolWindow: begin
         Rect := CreateRoundRectRgn(0, 0, Width , Height - (Height - ClientHeight), 10, 10);
         SetWindowRgn(Handle, Rect, True);
         Canvas.RoundRect(0, 0, Width -2, ClientHeight -2, 10, 10);
      end;
      bsDialog: begin
         Rect := CreateRoundRectRgn(0+2, 0+2, Width , Height - (Height - ClientHeight), 10, 10);
         SetWindowRgn(Handle, Rect, True);
         Canvas.RoundRect(0, 0, Width -6, ClientHeight -5, 10, 10);
      end;
   end;
   Application.ProcessMessages;
end;

procedure TCustomView.FormResize(Sender: TObject);
begin
   Invalidate;
end;

procedure TCustomView.SetSystemButtonsColored;
begin
   if aiClose in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abRed   ), ImageClose.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageClose.Picture.Bitmap);

   if aiMinimize in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abYellow), ImageMinimize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageMinimize.Picture.Bitmap);

   if aiMaximize in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abGreen ), ImageMaximize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageMaximize.Picture.Bitmap);

   FAppleButtonsIconics := False;
   Invalidate;
   TimerSystemIcons.Enabled := False;
end;

procedure TCustomView.SetSystemButtonsIconics;
begin
   if aiClose in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abRedSignum   ), ImageClose.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageClose.Picture.Bitmap);

   if aiMinimize in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abYellowSignum), ImageMinimize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageMinimize.Picture.Bitmap);

   if aiMaximize in FAppleIcons
      then ImageListAppleWindow.GetBitmap(Ord(abGreenSignum ), ImageMaximize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageMaximize.Picture.Bitmap);
      
   FAppleButtonsIconics := True;
   Invalidate;
   if not TimerSystemIcons.Enabled then TimerSystemIcons.Enabled := True;
end;

procedure TCustomView.ImageAppleIconMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if ((Sender = ImageClose   ) and (aiClose    in FAppleIcons)) or
      ((Sender = ImageMinimize) and (aiMinimize in FAppleIcons)) or
      ((Sender = ImageMaximize) and (aiMaximize in FAppleIcons)) then begin
      if not FAppleButtonsIconics then SetSystemButtonsIconics;
   end;
end;

procedure TCustomView.TimerSystemIconsTimer(Sender: TObject);
begin
   if FAppleButtonsIconics then
      SetSystemButtonsColored;
end;

procedure TCustomView.SetAppleIcons(Value: TAppleIcons);
begin
  if FAppleIcons <> Value then begin
     FAppleIcons := Value;
     SetSystemButtonsColored;
     if not(csDesigning in ComponentState) then begin
        RecreateWnd;
     end;
  end;
end;

procedure TCustomView.ImageCloseClick(Sender: TObject);
begin
   if aiClose in FAppleIcons then
      SendMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TCustomView.ImageMinimizeClick(Sender: TObject);
begin
   if aiClose in FAppleIcons then
     PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TCustomView.ImageMaximizeClick(Sender: TObject);
begin
   if aiClose in FAppleIcons then begin
      { This is the standard behavior. We don't want this. }
      //PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
      {We shall take the MainMenu Window and put this windows accord with his position and dimensions.} 
   end;
end;

procedure TCustomView.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $F012;
begin
   ReleaseCapture;
   Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.

