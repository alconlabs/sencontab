unit CustomView;
interface
uses Forms, Messages, Windows, Graphics, Classes, ImgList, Controls, ComCtrls,
     Dialogs, ExtCtrls, Buttons, StdCtrls, Contnrs, LabelCaptionForm;

const DELAY_SHORT    =        400;
      DELAY_LONG     =       3000;
      DELAY_NEVER    = 2147483647;
      COLOR_ACTIVE   = $04E4E4E4;
      COLOR_INACTIVE = $00D9D1C0;

      ImageIndex_User     = 0;
      ImageIndex_UserPlus = 1;
      ImageIndex_Profile  = 2;

type
   TMode = (fmView, fmEdit, fmFixed);
   
   TAppleButton = (abGray, abRed      , abYellow      , abGreen,
                           abRedSignum, abYellowSignum, abGreenSignum);
   TShowedButtons = (sbClose, sbMinimized, sbMaximized);
   TAppleIcon = (aiClose, aiMinimize, aiMaximize);
   TAppleIcons = set of TAppleIcon;

   TViewState = (vsEdit, vsInsert);

   TBeforeChangeModeEvent = procedure(Value :TMode) of object;
   TAfterChangeModeEvent  = procedure(Value :TMode) of object;

   TccListColumn = class(TListColumn)
   private
     FColumnName :string;
   public
     property ColumnName :string read FColumnName write FColumnName;
   end;

   TComponentMode = class(TPersistent)
   private
     FComponent :TComponent;
     FMode      :TMode;
   public
     constructor Create;                                       overload;
     constructor Create(AComponent :TComponent; AMode :TMode); overload;
     property Component :TComponent read FComponent write FComponent;
     property Mode      :TMode      read FMode      write FMode;
   end;

   TComponentModeList = class(TObjectList)
   private
   protected
     procedure SetObject(Index :Integer; Item: TComponentMode);
     function  GetObject(Index :Integer):TComponentMode;
   public
     constructor Create; overload;
     function  Add(Obj :TComponentMode):Integer;
     procedure Insert(Index :Integer; Obj :TComponentMode);
     property  Components[Index :Integer]:TComponentMode read GetObject write SetObject; default;
   {    ----From TList
     procedure Clear;
     procedure Pack;
     procedure Sort(Compare: TListSortCompare);
     property Capacity: Integer read FCapacity write SetCapacity;
     property Count: Integer read FCount write SetCount;

     ---From TObjectList
     function  Add(AObject: TObject): Integer;
     procedure Insert(Index: Integer; AObject: TObject);
     function  Extract(Item: TObject): TObject;
     function  Remove(AObject: TObject): Integer;

     function  First :TObject;
     function  Last  :TObject;

     function  IndexOf(AObject: TObject): Integer;
     function  FindInstanceOf(AClass: TClass; AExact: Boolean = True; AStartAt: Integer = 0): Integer;
    }
   end;

   {$Message Warn 'avoid the Closing or Minimizing of a form without confirm or cancel the changes'}

   TCustomView = class(TForm)
     ImageListAppleWindow: TImageList;
     ImageClose: TImage;
     ImageMinimize: TImage;
     ImageMaximize: TImage;
     TimerSystemIcons: TTimer;
     TimerMessage: TTimer;
     StateImages: TImageList;
     LargeImages: TImageList;
     SmallImages: TImageList;
     procedure FormResize(Sender: TObject);
     procedure ImageAppleIconMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure TimerSystemIconsTimer(Sender: TObject);
     procedure ImageCloseClick(Sender: TObject);
     procedure ImageMinimizeClick(Sender: TObject);
     procedure ImageMaximizeClick(Sender: TObject);
     procedure TimerMessageTimer(Sender: TObject);
     procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     procedure DoShow; override;
   private
     FComponentModeList   :TComponentModeList;
     FModal               :Boolean;
     FAutoModal           :Boolean;
     FFormMode            :TMode;
     FBeforeChangeMode    :TBeforeChangeModeEvent;
     FAfterChangeMode     :TAfterChangeModeEvent;
     FAppleIcons          :TAppleIcons;
     FAppleIconsVisibles  :TAppleIcons;
     FAppleButtonsIconics :Boolean;
     FLabelCaption        :TLabelCaptionForm;
     FLabelMessage        :TLabelCaptionForm;
     procedure SetFormMode(Value :TMode);
     procedure SetAppleIcons(Value :TAppleIcons);
     procedure SetAppleIconsVisibles(Value :TAppleIcons);
     procedure SetSystemButtonsIconics;
     procedure SetSystemButtonsColored;
     procedure SetModal(Value :Boolean);
     procedure MakeFormModal(Modal :Boolean);
     procedure ChangeMode(Value :TMode); // Change the mode of all the components in the form.
   protected
     FHEIGHT_FROM_BOTTOM :Integer;
     procedure Paint; override;
     procedure DoBeforeChangeMode(Value :TMode); virtual;
     procedure DoAfterChangeMode(Value :TMode); virtual;
     //procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
   public
     constructor Create(AOwner: TComponent); override;
     destructor  Destroy; override;
     procedure ShowMessage(AErrorMessage :string);
     procedure CustomViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     function  Validate :Boolean;
     {properties}
     property Mode               :TMode       read FFormMode           write SetFormMode default fmView;
     property Modal              :Boolean     read FModal              write SetModal    default False;
     property AutoModal          :Boolean     read FAutoModal          write FAutoModal  default True;
     property AppleIcons         :TAppleIcons read FAppleIcons         write SetAppleIcons;
     property AppleIconsVisibles :TAppleIcons read FAppleIconsVisibles write SetAppleIconsVisibles;
     property ModeList           :TComponentModeList read FComponentModeList write FComponentModeList;
     {events}
     property BeforeChangeMode :TBeforeChangeModeEvent read FBeforeChangeMode write FBeforeChangeMode;
     property AfterChangeMode  :TAfterChangeModeEvent  read FAfterChangeMode  write FAfterChangeMode;
   end;

implementation
{$R *.DFM}
uses SysUtils, Menus,
     DBCtrls;

constructor TCustomView.Create(AOwner: TComponent);
begin
   inherited;

   FAutoModal    := True;

   FComponentModeList := TComponentModeList.Create;
   FHEIGHT_FROM_BOTTOM := 30;
   //SetSystemButtonsColored;
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
   FLabelCaption.Font.Style   := [fsBold];
   FLabelCaption.Font.Height  := 18;
   FLabelCaption.Font.Name    := 'MS Sans Serif';
   FLabelCaption.ParentFont   := False;
   FLabelCaption.SendToBack;
   FLabelCaption.OnMouseDown := CustomViewMouseDown;

   { Message label for error and warning messages }
   FLabelMessage := TLabelCaptionForm.Create(Self);
   FLabelMessage.Parent       := Self;
   FLabelMessage.ColorOne     := clMoneyGreen;
   FLabelMessage.ColorTwo     := clMaroon;
   FLabelMessage.AutoSize     := False;
   FLabelMessage.Left         := 0;
   FLabelMessage.Top          := Self.Height - FHEIGHT_FROM_BOTTOM;
   FLabelMessage.Width        := Self.Width;
   FLabelMessage.Height       := 20;
   FLabelMessage.Alignment    := taLeftJustify;
   FLabelMessage.Offset       := 1;
   FLabelMessage.LabelStyle   := lsLowered;
   FLabelMessage.Font.Charset := ANSI_CHARSET;
   //FLabelMessage.Font.Color   := clGray;
   FLabelMessage.Font.Height  := 18;
   FLabelMessage.Font.Style   := [fsBold];
   FLabelMessage.Font.Name    := 'MS Sans Serif';
   FLabelMessage.ParentFont   := False;
   FLabelMessage.Anchors      := [akLeft, akBottom];
   FLabelMessage.SendToBack;
   FLabelMessage.OnMouseDown := CustomViewMouseDown;
end;

destructor TCustomView.Destroy;
begin
   FComponentModeList.Free;
   inherited;
end;

//procedure TCustomView.WMNCHitTest(var Msg: TWMNCHitTest);
//begin
   {move the form by draging anywhere on the client area }
   //if (Msg.Result = htClient) then begin
   //   Msg.Result := htCaption;
   //end;
//   inherited;
   //else begin
   //   Msg.Result := htCaption;
   //   inherited;
   //end;
//end;

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
         AutoScroll := False;  { This is very important. This is the problem of the window offset sizeable. }
         Rect := CreateRoundRectRgn(0+1, 0+1, Width , Height - (Height - ClientHeight)+6, 10, 10);
         SetWindowRgn(Handle, Rect, True);
         Canvas.RoundRect(0, 0, Width -6, ClientHeight -5+6, 10, 10);
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

procedure TCustomView.DoBeforeChangeMode(Value :TMode);
begin
  if Assigned(FBeforeChangeMode) then BeforeChangeMode(Value);
end;

procedure TCustomView.DoAfterChangeMode(Value :TMode);
begin
  if Assigned(FAfterChangeMode) then AfterChangeMode(Value);
end;

procedure TCustomView.MakeFormModal(Modal :Boolean);
var i :Integer;
    j :Integer;
begin
   if Application.MainForm = nil then Exit;
   with Application.MainForm do begin
        for i := 0 to ComponentCount -1 do begin
            if (Components[i] is TMainMenu) then begin {this shall be now a TreeView}
               with TMainMenu(Components[i]) do begin
                    for j  := 0 to Items.Count -1 do begin
                        { Los Menús desactivados por cuestión de usuario llevan un Tag 99}
                        TMenuItem(Items[j]).Enabled := not(Modal) and (TMenuItem(Items[j]).Tag <> 99);
                    end;
               end;
            end else
            if (Components[i] is TToolBar) then begin
                 TToolBar(Components[i]).Enabled := not(Modal);
            end;
        end;
        if Modal then begin
           for i := 0 to MDIChildCount - 1 do begin
               if MDIChildren[i].Active = False then MDIChildren[i].Enabled := not(Modal);
           end;
        end
        else begin
            for i := 0 to MDIChildCount - 1 do MDIChildren[i].Enabled := True;
        end;
   end;
end;

procedure TCustomView.SetModal(Value :Boolean);
begin
   if FModal <> Value then begin
      FModal := Value;
      MakeFormModal(Value);
      //TccForm(Application.MainForm).FccCurrentMode := Value;
   end;
end;



procedure TCustomView.ChangeMode(Value :TMode);
var i :Integer;
begin
  {The Form }
   case FFormMode of
      fmEdit :begin
         for i := 0 to FComponentModeList.Count - 1 do begin
            {The component }
            case FComponentModeList.Components[i].Mode of
               fmEdit   :begin
                 { A C T I V A T E }
                 if FComponentModeList.Components[i].Component is TSpeedButton then begin
                    TSpeedButton(FComponentModeList.Components[i].Component).Enabled := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBEdit then begin
                    TDBEdit(FComponentModeList.Components[i].Component).ReadOnly := False;
                    TDBEdit(FComponentModeList.Components[i].Component).TabStop  := True;
                    TDBEdit(FComponentModeList.Components[i].Component).Ctl3D    := True;
                    TDBEdit(FComponentModeList.Components[i].Component).Color    := COLOR_ACTIVE;
                 end else
                 if FComponentModeList.Components[i].Component is TDBRadioGroup then begin
                    TDBRadioGroup(FComponentModeList.Components[i].Component).ReadOnly := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBCheckBox then begin
                    TDBCheckBox(FComponentModeList.Components[i].Component).ReadOnly := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBLookupComboBox then begin
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).ReadOnly := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).TabStop  := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Ctl3D    := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Color    := COLOR_ACTIVE;
                 end else
               end;
               fmView:begin
                  { D E A C T I V A T E }
                  if FComponentModeList.Components[i].Component is TSpeedButton then begin
                    TSpeedButton(FComponentModeList.Components[i].Component).Enabled := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBEdit then begin
                    TDBEdit(FComponentModeList.Components[i].Component).ReadOnly := True;
                    TDBEdit(FComponentModeList.Components[i].Component).TabStop  := False;
                    TDBEdit(FComponentModeList.Components[i].Component).Ctl3D    := False;
                    TDBEdit(FComponentModeList.Components[i].Component).Color    := COLOR_INACTIVE;
                 end else
                 if FComponentModeList.Components[i].Component is TDBRadioGroup then begin
                    TDBRadioGroup(FComponentModeList.Components[i].Component).ReadOnly := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBCheckBox then begin
                    TDBCheckBox(FComponentModeList.Components[i].Component).ReadOnly := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBLookupComboBox then begin
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).ReadOnly := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).TabStop  := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Ctl3D    := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Color    := COLOR_INACTIVE;
                 end else
               end;
            end;
         end;
      end;
      fmView:begin
         for i := 0 to FComponentModeList.Count - 1 do begin
            {The component }
            case FComponentModeList.Components[i].Mode of
               fmEdit    :begin
                  { D E A C T I V A T E }
                  if FComponentModeList.Components[i].Component is TSpeedButton then begin
                    TSpeedButton(FComponentModeList.Components[i].Component).Enabled := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBEdit then begin
                    TDBEdit(FComponentModeList.Components[i].Component).ReadOnly := True;
                    TDBEdit(FComponentModeList.Components[i].Component).TabStop  := False;
                    TDBEdit(FComponentModeList.Components[i].Component).Ctl3D    := False;
                    TDBEdit(FComponentModeList.Components[i].Component).Color    := COLOR_INACTIVE;
                 end else
                 if FComponentModeList.Components[i].Component is TDBRadioGroup then begin
                    TDBRadioGroup(FComponentModeList.Components[i].Component).ReadOnly := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBCheckBox then begin
                    TDBCheckBox(FComponentModeList.Components[i].Component).ReadOnly := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBLookupComboBox then begin
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).ReadOnly := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).TabStop  := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Ctl3D    := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Color    := COLOR_INACTIVE;
                 end else
               end;
               fmView :begin
                  { A C T I V A T E }
                  if FComponentModeList.Components[i].Component is TSpeedButton then begin
                    TSpeedButton(FComponentModeList.Components[i].Component).Enabled := True;
                 end else
                 if FComponentModeList.Components[i].Component is TDBEdit then begin
                    TDBEdit(FComponentModeList.Components[i].Component).ReadOnly := False;
                    TDBEdit(FComponentModeList.Components[i].Component).TabStop  := True;
                    TDBEdit(FComponentModeList.Components[i].Component).Ctl3D    := True;
                    TDBEdit(FComponentModeList.Components[i].Component).Color    := COLOR_ACTIVE;
                 end else
                 if FComponentModeList.Components[i].Component is TDBRadioGroup then begin
                    TDBRadioGroup(FComponentModeList.Components[i].Component).ReadOnly := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBCheckBox then begin
                    TDBCheckBox(FComponentModeList.Components[i].Component).ReadOnly := False;
                 end else
                 if FComponentModeList.Components[i].Component is TDBLookupComboBox then begin
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).ReadOnly := False;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).TabStop  := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Ctl3D    := True;
                    TDBLookupComboBox(FComponentModeList.Components[i].Component).Color    := COLOR_ACTIVE;
                 end else
               end;
            end;
         end;
      end;
   end;
end;

procedure TCustomView.SetFormMode(Value :TMode);
begin
   //if FFormMode <> Value then begin
      FFormMode := Value;
      DoBeforeChangeMode(Value);
      ChangeMode(Value);
      DoAfterChangeMode(Value);
      if FAutoModal then begin
         case FFormMode of
              fmEdit :Modal := True;
              fmView :Modal := False;
         end;
      end;
      //TccForm(Application.MainForm).FccCurrentMode := Value;
   //end;
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

procedure TCustomView.DoShow;
begin
  inherited;
  if Assigned(Application.MainForm) then begin
     SetBounds(Application.MainForm.Left + Application.MainForm.Width, 10, Width, Height);
  end;
end;


procedure TCustomView.CustomViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FormMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TCustomView.TimerMessageTimer(Sender: TObject);
begin
   FLabelMessage.Caption := '';
   TimerMessage.Enabled := False;
end;

procedure TCustomView.ShowMessage(AErrorMessage: string);
begin
   FLabelMessage.Left         := 0;
   FLabelMessage.Top          := Self.Height - FHEIGHT_FROM_BOTTOM;
   FLabelMessage.Width        := Self.Width;
   FLabelMessage.Height       := 20;
   FLabelMessage.Alignment    := taLeftJustify;
   FLabelMessage.Caption := '      '+AErrorMessage;
   //MessageBeep(MB_ICONHAND);
   TimerMessage.Enabled := True;
end;


{ TComponentMode }

constructor TComponentMode.Create;
begin
   FComponent := nil;
   FMode      := fmFixed;
end;

constructor TComponentMode.Create(AComponent: TComponent; AMode: TMode);
begin
   FComponent := AComponent;
   FMode      := AMode;
end;

{ TComponentModeList }
constructor TComponentModeList.Create;
begin
   inherited Create;
   OwnsObjects := True;
end;

function TComponentModeList.Add(Obj: TComponentMode): Integer;
begin
   Result := inherited Add(Obj);
end;

function TComponentModeList.GetObject(Index: Integer): TComponentMode;
begin
   Result := inherited Items[Index] as TComponentMode;
end;

procedure TComponentModeList.Insert(Index: Integer; Obj: TComponentMode);
begin
   inherited Insert(Index, Obj);
end;

procedure TComponentModeList.SetObject(Index: Integer; Item: TComponentMode);
begin
   inherited Items[Index] := Item;
end;


function TCustomView.Validate: Boolean;
begin
   Result := True;
end;

end.

