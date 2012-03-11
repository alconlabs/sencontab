unit LabelCaptionForm;

interface
uses Graphics, Classes, StdCtrls;

type
   TLabelStyle = (lsLowered, lsNormal, lsRaised);

   TLabelCaptionForm = class(TLabel)
   private
     FOffset: Integer;
     FLabelStyle: TLabelStyle;
   protected
     procedure Paint; override;
   protected
     procedure SetLabelStyle(NewLabelStyle: TLabelStyle);
     procedure SetOffset(NewOffset: Integer);
   public
     constructor Create(AOwner: TComponent); override;
   published
     property LabelStyle: TLabelStyle read FLabelStyle write SetLabelStyle;
     property Offset: Integer read FOffset write SetOffset;
   end;

implementation

uses Windows;

constructor TLabelCaptionForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOffset := 1;
  FLabelStyle := lsLowered;
  Transparent := True
end;

procedure TLabelCaptionForm.SetLabelStyle(NewLabelStyle: TLabelStyle);
begin
  if FLabelStyle <> NewLabelStyle then
  begin
    FLabelStyle := NewLabelStyle;
    Invalidate
  end
end;

procedure TLabelCaptionForm.SetOffset(NewOffset: Integer);
begin
  if FOffset <> NewOffset then
  begin
    FOffset := NewOffset;
    Invalidate
  end
end;

procedure TLabelCaptionForm.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  CapStr: String;
  Len: Integer; { Caption Length }
  CalcOffset: Integer;
  OldColor: TColor;
  TempRect: TRect;
begin
  CapStr := Caption;
  Len := Length(CapStr);
  CalcOffset := (Ord(FLabelStyle)-1) * FOffset;
  if CalcOffset <> 0 then
  try
    OldColor := Font.Color;
    Canvas.Brush.Style := bsClear;
    Canvas.Font := Self.Font;
    Canvas.Font.Color := $00D8D8D8; // white light
    TempRect := Rect(ClientRect.Left - CalcOffset,
                     ClientRect.Top - CalcOffset,
                     ClientRect.Right - CalcOffset,
                     ClientRect.Bottom - CalcOffset);
    DrawText(Canvas.Handle, PChar(CapStr), Len, TempRect,
             DT_EXPANDTABS or DT_WORDBREAK or Alignments[Alignment]);
    Canvas.Font.Color := clGray; // black shadow
    TempRect := Rect(ClientRect.Left + CalcOffset,
                     ClientRect.Top + CalcOffset,
                     ClientRect.Right + CalcOffset,
                     ClientRect.Bottom + CalcOffset);
    DrawText(Canvas.Handle, PChar(CapStr), Len, TempRect,
             DT_EXPANDTABS or DT_WORDBREAK or Alignments[Alignment])
  finally
    Canvas.Font.Color := OldColor
  end;
  inherited Paint // paint original Caption
end;

end.
