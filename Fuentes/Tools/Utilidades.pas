unit Utilidades;

interface

uses Windows, dbTables, db, Controls, Graphics, Classes, Menus, ComCtrls, CommCtrl;

type TTipoCampo = (tcString, tcInteger, tcBoolean, tcFloat, tcDate);

     TDelegate = class(TComponent)
     private
        FOnClick :TNotifyEvent;
     public
        property OnClick :TNotifyEvent read FOnClick write FOnClick stored False;
        function Execute :Boolean;
     end;
procedure BoldTreeNode(TreeNode :TTreeNode; Value :Boolean);
procedure ccPlayKeystroke(Handle: HWND; VKChar: word; VKShift: Word);
function  RevisaCadenaSQL(Cadena:string; TipoCampo:TTipoCampo;Conteniendo:Boolean):string;
function  RevisaCadenaFiltro(Cadena:string; TipoCampo:TTipoCampo;Conteniendo:Boolean):string;
function  FechaCCS(Cadena:string):string;
function  ccFillStr(StrData:string; Character :Char; Long:Integer):string;
function  ccFillSpaces(StrData:string; Long:Integer; Align: TAlign):string;
function  ccSpaces(Long:Integer):string;
function  ccFillField(Field :TStringField; Character :Char):string;
function  ccFormatStrToInt(StrData :string):Int64;
function  ccFormatInt(IntData :Int64):string;
function  ccFormatFloat(Data :Real):string;


procedure ccWriteText(      ACanvas :TCanvas; ARect     :TRect;  DX, DY: Integer;
                      const Text    :string;  Alignment :TAlignment; ARightToLeft: Boolean);


implementation
uses SysUtils, Messages, Math;

{ TDelegate }

function TDelegate.Execute:Boolean;
begin
   Result := Assigned(FOnClick);
   
   if Assigned(FOnClick) then begin
      FOnClick(Self);
   end;
end;

procedure BoldTreeNode(TreeNode :TTreeNode; Value :Boolean);
var
   TreeItem :TTVItem;
begin
   if not Assigned(treeNode) then Exit;

   with TreeItem do begin
      hItem := TreeNode.ItemId;
      StateMask := TVIS_BOLD;
      Mask := TVIF_HANDLE or TVIF_STATE;
      if Value then
         State := TVIS_BOLD
      else
         State := 0;
   end;

   TreeView_SetItem(TreeNode.Handle, TreeItem) ;
end;


function ccFillField(Field :TStringField; Character :Char):string;
var Mascara :string;
    i       :Integer;
begin
   for i := 1 to Field.Size  do Mascara := Mascara + Character;
   //if Length(Trim(Campo.Value)) <> 0 then begin
      if Length(Trim(Field.Value)) < Field.Size then begin
         Field.Value := Copy(Mascara,1,Field.Size-Length(Trim(Field.Value))) + Trim(Field.Value);
      end;
   //end;
end;

function ccFormatStrToInt(StrData :string):Int64;
var i :Integer;
begin
     i := 1;
     while not(i >= Length(StrData)) do begin
        if (StrData[i] = ThousandSeparator) then Delete(StrData,i,1);
        inc(i);
     end;
     Result := StrToInt(StrData);
end;

function ccFormatInt(IntData :Int64):string;
begin
     Result := FormatFloat('###,##0',IntData);
end;

function ccFormatFloat(Data :Real):string;
begin
   Result := FormatFloat('0.00',Data);
end;

function ccFillStr(StrData:string; Character :Char; Long:Integer):string;
var Mascara :string;
    i       :Integer;
begin
   Mascara := '';
   for i := 1 to Long do Mascara := Mascara + Character;
   //if Length(Trim(Campo.Value)) <> 0 then begin
      if Length(Trim(StrData)) < Long then begin
         Result := Copy(Mascara,1,Long-Length(StrData)) + StrData;
      end
      else begin
         Result := Copy(StrData,1,Long); 
      end;
   //end;
end;

function ccFillSpaces(StrData:string; Long:Integer; Align: TAlign):string;
var Mascara :string;
    i       :Integer;
begin
   Mascara := '';
   for i := 1 to Long do Mascara := Mascara + ' ';

   if Length(StrData) > 0 then begin
      if Length(StrData) <= Long then begin
         if Align = alRight then Result := Copy(Mascara,1,Long-Length(StrData))+ StrData
                            else Result := StrData + Copy(Mascara,1,Long-Length(StrData));
      end
      else Result := Copy(StrData,1,Long); // Si la cadena es mayor que long, la devuelve cortada.
   end
   else Result := Mascara; // Si la cadena := '' devuelve la máscara;
end;

function ccSpaces(Long:Integer):string;
var Mascara :string;
    i       :Integer;
begin
   Mascara := '';
   for i := 1 to Long do Mascara := Mascara + ' ';
   Result := Mascara;  
end;

function FechaCCS(Cadena:string):string;
begin
     Result := Copy(Cadena,7,2)+'/'+Copy(Cadena,5,2)+'/'+Copy(Cadena,1,4);
end;

procedure ccPlayKeystroke(Handle: HWND; VKChar: word; VKShift: Word);
var KeyState: TKeyboardState;
    NewKeyState: TKeyboardState;
begin
   GetKeyboardState(KeyState);
   NewKeyState           := KeyState;
   NewKeyState [VKShift] := $81;
   NewKeyState [VKChar]  := $81;
   SetKeyboardState(NewKeyState);
   PostMessage(Handle, WM_KEYDOWN, VKChar, 1);
   PostMessage(Handle, WM_KEYUP, VKChar, 1);
   SetKeyboardState(KeyState);
end;

function RevisaCadenaSQL(Cadena:string; TipoCampo:TTipoCampo; Conteniendo:Boolean):string;
var  i:Integer;
begin
   if Length(Trim(Cadena)) <> 0 then begin
      case TipoCampo of
         tcString: begin
            //Se sustituyen '*' por '%', y '?' por '_'
            for i := 1 to Length(Cadena) do begin
               if Cadena[i] = '*' then Cadena[i] := '%';
               if Cadena[i] = '?' then Cadena[i] := '_';
            end;
            //Si no hay % se devuelve '%Cadena%'
            if Pos('%',Cadena) = 0 then begin
               if Conteniendo then Cadena := '%' + Cadena + '%'
                              else Cadena := Cadena + '%';
            end;
         end;
         tcInteger: begin
            //En principio no es necesario hacer ningun tipo de modificación
            //a la cadena dado que el evento OnKeyPress hace que solo se
            //puedan introducir carácteres numéricos.
            //Si el campo es numérico se eliminan los '*' y las '?'
            //for i := 1 to Length(Cadena) do begin
            //    if Cadena[i] = '*' then Cadena[i] := ' ';
            //    if Cadena[i] = '?' then Cadena[i] := ' ';
            //end;
            //Trim(Cadena);
            Result := Cadena;
         end;
         tcBoolean: begin
         end;

         tcFloat: begin
         end;

         tcDate: begin
         end;
      end;
   end;
   Result := Cadena;
end;

function RevisaCadenaFiltro(Cadena:string; TipoCampo:TTipoCampo; Conteniendo:Boolean):string;
var  NumComodines :Integer;
begin
   if Length(Trim(Cadena)) <> 0 then begin
      case TipoCampo of
         tcString: begin
            NumComodines := Pos('*',Cadena);
            if  NumComodines > 1 then begin //Hay más de un '*'
            end else
            if NumComodines = 0 then begin // No hay ningún '*'
               if Conteniendo then Cadena := '*' + Cadena + '*'
                              else Cadena := Cadena + '*';
            end
            else begin // Hay exactamente un '*'
            end;
            // El espacio de entre las primeras comillas es
            // específico para el ODBC de CCS
            Cadena := ''' '+Cadena+'''';
         end;
         tcInteger: begin
            //Se eliminan los '*' y las '?'
            //for i := 1 to Length(Cadena) do begin
            //    if Cadena[i] = '*' then Cadena[i] := ' ';
            //    if Cadena[i] = '?' then Cadena[i] := ' ';
            //end;
            //Trim(Cadena);
            Result := Cadena;
         end;
         tcBoolean: begin
         end;

         tcFloat: begin
         end;

         tcDate: begin
         end;
      end;
   end;
   Result := Cadena;
end;

procedure ccWriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment; ARightToLeft: Boolean);
// Copiada de la Unidad DBGrids de Borland.
// Es necesaria para dibujar de otro color el texto de los grids en unas determinadas circunstancias.
const
  AlignFlags :array [TAlignment] of Integer =
    ( DT_LEFT   or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT  or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );

  RTL :array [Boolean] of Integer = (0, DT_RTLREADING);

var B          :TRect;
    R          :TRect;
    Hold       :Integer;
    Left       :Integer;
    I          :TColorRef;
    DrawBitmap :TBitmap;
begin
  DrawBitmap := TBitmap.Create;
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then begin { Use ExtTextOut for solid colors }
    { In BiDi, because we changed the window origin, the text that does not
      change alignment, actually gets its alignment changed. }
    if (ACanvas.CanvasOrientation = coRightToLeft) and (not ARightToLeft) then ChangeBiDiModeAlignment(Alignment);
    case Alignment of
         taLeftJustify  :Left := ARect.Left  + DX;
         taRightJustify :Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }    Left := ARect.Left  + (ARect.Right - ARect.Left) shr 1 - (ACanvas.TextWidth(Text) shr 1);
    end;
    ACanvas.TextRect(ARect, Left, ARect.Top + DY, Text);
  end
  else begin                  { Use FillRect and Drawtext for dithered colors }
    DrawBitmap.Canvas.Lock;
    try
        with DrawBitmap, ARect do begin { Use offscreen bitmap to eliminate flicker and }
                                        { brush origin tics in painting / scrolling.    }
             Width  := Max (Width , Right  - Left);
             Height := Max (Height, Bottom - Top);
             R      := Rect(DX    , DY          , Right - Left - 1, Bottom - Top - 1);
             B      := Rect(0     , 0           , Right - Left    , Bottom - Top    );
        end;
        with DrawBitmap.Canvas do  begin
             Font        := ACanvas.Font;
             Font.Color  := ACanvas.Font.Color;
             Brush       := ACanvas.Brush;
             Brush.Style := bsSolid;
             FillRect(B);
             SetBkMode(Handle, TRANSPARENT);
             if (ACanvas.CanvasOrientation = coRightToLeft) then ChangeBiDiModeAlignment(Alignment);
             DrawText(Handle, PChar(Text), Length(Text), R, AlignFlags[Alignment] or RTL[ARightToLeft]);
        end;
        if (ACanvas.CanvasOrientation = coRightToLeft) then begin
           Hold        := ARect.Left;
           ARect.Left  := ARect.Right;
           ARect.Right := Hold;
        end;
        ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally DrawBitmap.Canvas.Unlock;
    end;
  end;
  DrawBitmap.Free;
end;


end.
