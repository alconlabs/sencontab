unit CustomDataInputView;
interface
uses Forms, Messages, Windows, Graphics, Classes, ImgList, Controls,
     Dialogs, ExtCtrls, Buttons, StdCtrls, CustomView;

type
   TCustomDataInputView = class(TCustomView)
   protected
     procedure OnMoving(var Msg: TWMMoving); message WM_MOVING;
   private
     FCenterForm :TCustomForm;
   public
     constructor Create(AOwner: TComponent); override;
   end;

implementation
{$R *.DFM}

constructor TCustomDataInputView.Create(AOwner: TComponent);
var X :Integer;
    Y :Integer;
begin
   inherited Create(AOwner);
   FCenterForm := TCustomForm(AOwner);
   if Assigned(FCenterForm) then begin
      X := ((FCenterForm.Width - Width ) div 2) + FCenterForm.Left;
      Y := FCenterForm.Top; 
   end
   else begin
     X := (Screen.Width  - Width ) div 2;
     Y := (Screen.Height - Height) div 2;
   end;

   if X < 0 then X := 0;
   if Y < 0 then Y := 0;

   Self.Left := X;
   Self.Top  := Y;
end;

procedure TCustomDataInputView.OnMoving(var Msg: TWMMoving);
{ Avoid the movement of the window with the mouse }
var WorkArea: TRect;
begin
   WorkArea.Left   := Self.Left;
   WorkArea.Top    := Self.Top;
   WorkArea.Right  := Self.Left + Self.Width;
   WorkArea.Bottom := Self.Top  + Self.Height;
   Msg.DragRect^ := WorkArea;
   inherited;
end;

end.

