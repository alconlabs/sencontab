unit CustomView;
interface
uses Forms, Messages, Windows, Graphics;

type
   TCustomView = class(TForm)
   protected
     procedure Paint; override;
     procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   private
   public
   end;

implementation
{$R *.DFM}


procedure TCustomView.WMNCHitTest(var Msg: TWMNCHitTest);
begin
   {move the form by draging anywhere on the client area }
   inherited;
   if Msg.Result = htClient then Msg.Result := htCaption;
end;

procedure TCustomView.Paint;
var Reg :HRGN;
begin
   {Hide Title Bar}
   SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
   {Make borders rounded }
   Reg := CreateRoundRectRgn(0, 0, Width , Height -(Height - ClientHeight), 10, 10);
   SetWindowRgn(Handle, Reg, True);

   Canvas.Pen.Width := 1;
   Canvas.Pen.Color := clGray;
   Canvas.RoundRect(0 ,
                    0 ,
                    Width  -2,
                    ClientHeight -2, 10, 10);
   inherited;
end;

end.
