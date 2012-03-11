unit CustomView;
interface
uses Forms, Messages, Windows, Graphics, Classes, ImgList, Controls,
     Dialogs, ExtCtrls, Buttons, StdCtrls, LabelCaptionForm;

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
    TimerMessage: TTimer;
    procedure FormResize(Sender: TObject);
    procedure ImageAppleIconMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TimerSystemIconsTimer(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure ImageMinimizeClick(Sender: TObject);
    procedure ImageMaximizeClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerMessageTimer(Sender: TObject);
   private
     FAppleIcons          :TAppleIcons;
     FAppleIconsVisibles  :TAppleIcons;
     FAppleButtonsIconics :Boolean;
     FLabelCaption        :TLabelCaptionForm;
     FLabelMessage        :TLabelCaptionForm;
     procedure SetAppleIcons(Value :TAppleIcons);
     procedure SetAppleIconsVisibles(Value :TAppleIcons);
     procedure SetSystemButtonsIconics;
     procedure SetSystemButtonsColored;
   protected
     procedure Paint; override;
     procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   public
     constructor Create(AOwner: TComponent); override;
     procedure ShowMessage(AErrorMessage :string);
     property AppleIcons         :TAppleIcons read FAppleIcons         write SetAppleIcons;
     property AppleIconsVisibles :TAppleIcons read FAppleIconsVisibles write SetAppleIconsVisibles;
   end;

implementation
{$R *.DFM}

constructor TCustomView.Create(AOwner: TComponent);
begin
   inherited;
   SetSystemButtonsColored;
   { Message label for the caption }
   FLabelCaption := TLabelCaptionForm.Create(Self);
   FLabelCaption.Parent     := Self;
   FLabelCaption.AutoSize   := False;
   FLabelCaption.Left       := 0;
   FLabelCaption.Top        := ImageMaximize.Top;
   FLabelCaption.Width      := Self.Width;
   FLabelCaption.Height     := 20;
   FLabelCaption.Alignment  := taCenter;
   FLabelCaption.Offset     := 1;
   FLabelCaption.LabelStyle := lsRaised;
   //FLabelCaption.Caption    := '';
   FLabelCaption.Font.Charset := ANSI_CHARSET;
   FLabelCaption.Font.Color   := clGray;
   FLabelCaption.Font.Height  := 18;
   FLabelCaption.Font.Name    := 'MS Sans Serif';
   FLabelCaption.ParentFont   := False;
   FLabelCaption.SendToBack;
   FLabelCaption.OnMouseDown := FormMouseDown;

   { Message label for error and warning messages }
   {$Message Warn 'Cambiar el color de la letra al crear los labels'}
   FLabelCaption := TLabelCaptionForm.Create(Self);
   FLabelCaption.Parent     := Self;
   FLabelCaption.AutoSize   := False;
   FLabelCaption.Left       := 0;
   FLabelCaption.Top        := ImageMaximize.Top;
   FLabelCaption.Width      := Self.Width;
   FLabelCaption.Height     := 20;
   FLabelCaption.Alignment  := taCenter;
   FLabelCaption.Offset     := 1;
   FLabelCaption.LabelStyle := lsRaised;
   //FLabelCaption.Caption    := '';
   FLabelCaption.Font.Charset := ANSI_CHARSET;
   FLabelCaption.Font.Color   := clGray;
   FLabelCaption.Font.Height  := 18;
   FLabelCaption.Font.Name    := 'MS Sans Serif';
   FLabelCaption.ParentFont   := False;
   FLabelCaption.SendToBack;
   FLabelCaption.OnMouseDown := FormMouseDown;
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
   { To set the actual caption to the new label caption component }
   FLabelCaption.Caption := Self.Caption;
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
   ImageClose.Visible    := aiClose    in FAppleIconsVisibles;
   ImageMinimize.Visible := aiMinimize in FAppleIconsVisibles;
   ImageMaximize.Visible := aiMaximize in FAppleIconsVisibles;

   if (aiClose in FAppleIcons) and (aiClose in FAppleIconsVisibles) 
      then ImageListAppleWindow.GetBitmap(Ord(abRed   ), ImageClose.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageClose.Picture.Bitmap);

   if (aiMinimize in FAppleIcons) and (aiMinimize in FAppleIconsVisibles)
      then ImageListAppleWindow.GetBitmap(Ord(abYellow), ImageMinimize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageMinimize.Picture.Bitmap);

   if (aiMaximize in FAppleIcons) and (aiMaximize in FAppleIconsVisibles)  
      then ImageListAppleWindow.GetBitmap(Ord(abGreen ), ImageMaximize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray  ), ImageMaximize.Picture.Bitmap);

   FAppleButtonsIconics := False;
   Invalidate;
   TimerSystemIcons.Enabled := False;
end;

procedure TCustomView.SetSystemButtonsIconics;
begin
   if (aiClose in FAppleIcons) and (aiClose in FAppleIconsVisibles)
      then ImageListAppleWindow.GetBitmap(Ord(abRedSignum   ), ImageClose.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageClose.Picture.Bitmap);

   if (aiMinimize in FAppleIcons) and (aiMinimize in FAppleIconsVisibles)
      then ImageListAppleWindow.GetBitmap(Ord(abYellowSignum), ImageMinimize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageMinimize.Picture.Bitmap);

   if (aiMaximize in FAppleIcons) and (aiMaximize in FAppleIconsVisibles)
      then ImageListAppleWindow.GetBitmap(Ord(abGreenSignum ), ImageMaximize.Picture.Bitmap)
      else ImageListAppleWindow.GetBitmap(Ord(abGray        ), ImageMaximize.Picture.Bitmap);
      
   FAppleButtonsIconics := True;
   Invalidate;
   if not TimerSystemIcons.Enabled then TimerSystemIcons.Enabled := True;
end;

procedure TCustomView.ImageAppleIconMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if ((Sender = ImageClose   ) and ((aiClose    in FAppleIcons) and (aiClose    in FAppleIconsVisibles))) or
      ((Sender = ImageMinimize) and ((aiMinimize in FAppleIcons) and (aiMinimize in FAppleIconsVisibles))) or
      ((Sender = ImageMaximize) and ((aiMaximize in FAppleIcons) and (aiMaximize in FAppleIconsVisibles))) then begin
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

procedure TCustomView.SetAppleIconsVisibles(Value: TAppleIcons);
begin
  if FAppleIconsVisibles <> Value then begin
     FAppleIconsVisibles := Value;
     SetSystemButtonsColored;
     if not(csDesigning in ComponentState) then begin
        RecreateWnd;
     end;
  end;
end;

procedure TCustomView.ImageCloseClick(Sender: TObject);
begin
   if (aiClose in FAppleIcons) and (aiClose in FAppleIconsVisibles) then
      SendMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TCustomView.ImageMinimizeClick(Sender: TObject);
begin
   if (aiMinimize in FAppleIcons) and (aiMinimize in FAppleIconsVisibles) then
     PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TCustomView.ImageMaximizeClick(Sender: TObject);
begin
   if (aiMaximize in FAppleIcons) and (aiMaximize in FAppleIconsVisibles) then begin
      { This is the standard behavior. We don't want this. }
      //PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
      {We shall take the MainMenu Window and put this windows accord with his position and dimensions.}
   end;
end;

procedure TCustomView.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{ move the window from any where in the client area.}
const
   sc_DragMove = $F012;
begin
   ReleaseCapture;
   Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TCustomView.TimerMessageTimer(Sender: TObject);
begin
   FLabelMessage.Caption := '';
   TimerMessage.Enabled := False;
end;

procedure TCustomView.ShowMessage(AErrorMessage: string);
begin
   FLabelMessage.Font.Style := [fsBold];
   FLabelMessage.Caption := '      '+AErrorMessage;
   MessageBeep(MB_ICONHAND);
   TimerMessage.Enabled := True;
end;

end.

