unit CustomDataInputView;
interface
uses Forms, Messages, Windows, Graphics, Classes, ImgList, Controls,
     Dialogs, ExtCtrls, Buttons, StdCtrls, CustomView;

type
   TCustomDataInputView = class(TCustomView)
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
   protected
     //procedure DoShow; override;
     //procedure DoClose(var Action: TCloseAction); override;
     procedure OnMoving(var Msg: TWMMoving); message WM_MOVING;
   private
     FActualClientHeight :Integer;
     FCenterForm :TCustomForm;
     FState :TViewState;
   public
     constructor Create(AOwner: TComponent); override;
     property State :TViewState read FState write FState;
   end;

implementation
{$R *.DFM}


//procedure TCustomDataInputView.DoShow;
//begin
//
//end;

//procedure TCustomDataInputView.DoClose(var Action: TCloseAction);
//
//   inherited DoClose(Action);
//end;

(*

begin
     if (ClientHeight = 0) then begin

     end
     else begin

     end;
*)


procedure SetTransparent(hWnd: longint; value: Byte);
// opaque: value=255; fully transparent: value=0
var
   iExStyle: Integer;
begin
   iExStyle := GetWindowLong(hWnd, GWL_EXSTYLE);
   if value < 255 then begin
      iExStyle := iExStyle Or WS_EX_LAYERED;
      SetWindowLong(hWnd, GWL_EXSTYLE, iExStyle);
      SetLayeredWindowAttributes(hWnd, 0, value, LWA_ALPHA);
   end
   else begin
      iExStyle := iExStyle xor WS_EX_LAYERED;
      SetWindowLong(hWnd, GWL_EXSTYLE, iExStyle);
   end;
end;

constructor TCustomDataInputView.Create(AOwner: TComponent);
var X :Integer;
    Y :Integer;
begin
   inherited Create(AOwner);

   FHEIGHT_FROM_BOTTOM := 40;

   SetTransparent(Handle, 244);

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

procedure TCustomDataInputView.FormShow(Sender: TObject);
var H :Integer;
begin
   FActualClientHeight := ClientHeight;
   ClientHeight := 0;

   inherited;

   for H := 0 to FActualClientHeight do begin
      Application.ProcessMessages;
      ClientHeight := H;
      //Sleep(10);
      Repaint;
   end;
end;

procedure TCustomDataInputView.FormClose(Sender: TObject; var Action: TCloseAction);
var H :Integer;
begin
   FActualClientHeight := ClientHeight;
   for h := ClientHeight downto 10 do begin
       ClientHeight := h;
       Sleep(1);
   end;
   Application.ProcessMessages;

   ClientHeight := FActualClientHeight;
end;

end.

