unit LabelCaptionForm;

interface
uses Graphics, Classes, StdCtrls;

type
   TLabelStyle = (lsLowered, lsNormal, lsRaised);

   TLabelCaptionForm = class(TLabel)
   private
     FOffset     :Integer;
     FLabelStyle :TLabelStyle;
     FColorOne   :TColor;
     FColorTwo   :TColor;
   protected
     procedure Paint; override;
   protected
     procedure SetLabelStyle(NewLabelStyle: TLabelStyle);
     procedure SetOffset(NewOffset: Integer);
     procedure SetColorOne(Value :TColor);
     procedure SetColorTwo(Value :TColor);
   public
     constructor Create(AOwner: TComponent); override;
     constructor CreateCaption(AOwner: TComponent); 
   published
     property LabelStyle :TLabelStyle read FLabelStyle write SetLabelStyle;
     property Offset     :Integer     read FOffset     write SetOffset;
     property ColorOne   :TColor      read FColorOne   write SetColorOne;
     property ColorTwo   :TColor      read FColorTwo   write SetColorTwo;
   end;

implementation

uses Windows;

constructor TLabelCaptionForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOffset     := 1;
  FLabelStyle := lsLowered;

  FColorOne   := $00D8D8D8;
  FColorTwo   := clGray;

  Transparent := True;
end;

constructor TLabelCaptionForm.CreateCaption(AOwner: TComponent);
begin
   { This constructor is not still used. Can be a good idea for next versions. }
   inherited Create(AOwner);
   FOffset     := 1;
   FLabelStyle := lsLowered;

   FColorOne   := $00D8D8D8;
   FColorTwo   := clGray;

   Transparent := True;
end;

procedure TLabelCaptionForm.SetLabelStyle(NewLabelStyle: TLabelStyle);
begin
   if FLabelStyle <> NewLabelStyle then begin
      FLabelStyle := NewLabelStyle;
      Invalidate;
   end;
end;

procedure TLabelCaptionForm.SetOffset(NewOffset: Integer);
begin
   if FOffset <> NewOffset then begin
      FOffset := NewOffset;
      Invalidate;
   end;
end;

procedure TLabelCaptionForm.Paint;
const
   Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
   CapStr     :string;
   Len        :Integer; { Caption Length }
   CalcOffset :Integer;
   OldColor   :TColor;
   TempRect   :TRect;
begin
   CapStr := Caption;
   Len := Length(CapStr);
   CalcOffset := (Ord(FLabelStyle)-1) * FOffset;
   if CalcOffset <> 0 then begin
      try
         OldColor := Font.Color;
         Canvas.Brush.Style := bsClear;
         Canvas.Font := Self.Font;
         Canvas.Font.Color := FColorOne; // white light
         TempRect := Rect(ClientRect.Left   - CalcOffset,
                          ClientRect.Top    - CalcOffset,
                          ClientRect.Right  - CalcOffset,
                          ClientRect.Bottom - CalcOffset);
         DrawText(Canvas.Handle, PChar(CapStr), Len, TempRect,
                  DT_EXPANDTABS or DT_WORDBREAK or Alignments[Alignment]);

         Canvas.Font.Color := FColorTwo; // black shadow
         TempRect := Rect(ClientRect.Left   + CalcOffset,
                          ClientRect.Top    + CalcOffset,
                          ClientRect.Right  + CalcOffset,
                          ClientRect.Bottom + CalcOffset);
         DrawText(Canvas.Handle, PChar(CapStr), Len, TempRect,
                  DT_EXPANDTABS or DT_WORDBREAK or Alignments[Alignment]);
      finally
         Canvas.Font.Color := OldColor;
      end;
   end;
   { It's stupid write the original Paint over our fantastic work.!!!!!}
   //inherited Paint; // paint original Caption
end;

procedure TLabelCaptionForm.SetColorOne(Value: TColor);
begin
   if FColorOne <> Value then begin
      FColorOne := Value;
      Invalidate;
   end;
end;

procedure TLabelCaptionForm.SetColorTwo(Value: TColor);
begin
   if FColorTwo <> Value then begin
      FColorTwo := Value;
      Invalidate;
   end;
end;

end.
