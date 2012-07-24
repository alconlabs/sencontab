unit ccStr;
{
// Commonly used string manipulation functions
// Copyright (c) 1999 juan.carlos@cilleruelo.com
}

interface
uses Classes, Dialogs;

{$ObjExportAll On}

procedure StrBreakApart         (    s :string; Delimeter :string; Parts :TStrings);
function  StrGetToken           (    s :string; Delimeter :string; var APos :Integer):string;
function  StrCount              (    s :string; Delimeter :Char      ):Integer;
function  StrReplaceCharWithStr (prmStr :string; RemoveChar: Char; ReplaceStr :string):string;
function  ccEqualStr            (S1, S2 :string):Boolean;
function  StrRemoveChar(prmStr: string; RemoveChar: char):string;

implementation

uses SysUtils;

function StrGetToken(s: string; delimeter: string; var APos: integer): string;
var TempStr      :string;
    EndStringPos :Integer;
begin
   Result := '';
   if APos <= 0         then Exit;
   if APos >  Length(s) then Exit;

   TempStr := Copy(S, APos, Length(s)+1 - APos);
     {Converts to Uppercase for check if delimeter more than one character}
   if (Length(Delimeter) = 1) then begin
      EndStringPos := AnsiPos(Delimeter, TempStr);
   end
   else begin
      Delimeter    := ' ' + Delimeter + ' ';
      endStringPos := AnsiPos(UpperCase(Delimeter), UpperCase(TempStr));
   end;

   if EndStringPos <= 0 then begin
      Result := TempStr;
      APos   := -1;
   end
   else begin
      Result := Copy(TempStr, 1, EndStringPos -1);
      APos   := APos + EndStringPos + Length(Delimeter) - 1;
   end
end;

procedure StrBreakApart(s :string; Delimeter :string; Parts :TStrings);
var CurrentPos :Integer;
    CurrentStr :string;
begin
   Parts.Clear;
   CurrentStr := s;
   repeat CurrentPos := AnsiPos(Delimeter, CurrentStr);
          if (CurrentPos > 0) then begin
             Parts.Add(Copy(CurrentStr, 1, CurrentPos -1));
             CurrentStr := Copy(CurrentStr, CurrentPos +1, Length(CurrentStr)-(CurrentPos));
          end
          else Parts.Add(CurrentStr);
   until CurrentPos = 0;
end;

function StrReplaceCharWithStr(prmStr: string; removeChar: char; replaceStr: string): string;
var i :Integer;
begin
   Result := '';
   for i:= 1 to Length(prmStr) do begin
      if (prmStr[i] <> removeChar) then
         Result := Result + prmStr[i]
      else Result:= Result + ReplaceStr;
   end;
end;

function StrRemoveChar(prmStr :string; RemoveChar :Char):string;
var i :Integer;
begin
   Result := '';
   for i := 1 to Length(prmStr) do begin
      if (prmStr[i] <> RemoveChar) then
         Result := Result + prmStr[i];
   end;
end;

function ccEqualStr(s1, s2: string): boolean;
begin
   Result := UpperCase(s1) = UpperCase(s2);
end;

function StrCount(S :string; Delimeter :Char):Integer;
var i     :Integer;
    Count :Integer;
begin
   Count:= 0;
   for i := 1 to Length(S) do
      if S[i] = Delimeter then Inc(Count);
   Result := Count;
end;

end.
