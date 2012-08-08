unit General;
interface
uses Forms;

type TModo        = (Naveg, Edita);
     TTipoMensaje = (UnBoton, DosBotones);

var MascaraImportes, MascaraImportesORPHEUS: string;

procedure PonerTipoConta(TipoConcepto: String);
procedure Moneda(F: TForm; Moneda: String);
function ConversionImporte(Importe: Double; MonedaActual, MonedaFinal: String): Double;
function RoundToDecimal(Value :Extended; Places :Integer; Bankers :Boolean):Extended;
  {-Rounds a real value to the specified number of decimal places}
{--- Funciones de clipper ---}
function Empty(prmCadena :string):Boolean;
function Year (prmDate :TDateTime):Integer;
function Month(prmDate :TDateTime):Integer;
function Day  (prmDate :TDateTime):Integer;
function Replicate(prmChar :Char; prmLength :Integer):string;
function PadR(prmString :string; prmLength :Integer):string;
function Space(prmLength :Integer):string;

function CMonth(prmDate :TDateTime):string;

implementation
uses SysUtils, Math, Globales, ppCtrls;

procedure PonerTipoConta(TipoConcepto: String);
begin
   if TipoConcepto = 'N' then begin
      gvTipoConta := '';
   end
   else
   if TipoConcepto = 'E' then begin
      gvTipoConta := '-';
   end
   else begin
      gvTipoConta := '+';
   end;
end;

function ConversionImporte(Importe: Double;
   MonedaActual, MonedaFinal: String): Double;
begin
   if UpperCase(MonedaActual) = UpperCase(MonedaFinal) then   begin
      Result := Importe;
   end
   else
   if (UpperCase(MonedaActual) = 'P') and (UpperCase(MonedaFinal) = 'E') then   begin
      Result := RoundToDecimal((Importe / gcValorEuro), 3, True);
   end
   else
   if (UpperCase(MonedaActual) = 'E') and (UpperCase(MonedaFinal) = 'P') then   begin
      Result := RoundToDecimal((Importe * gcValorEuro), 0, True);
   end
   else begin
      Result := Importe;
   end;
end;

procedure Moneda(F: TForm; Moneda: String);
var
   i: Integer;
begin
   if F <> nil then begin
      if moneda = 'P' then   begin
         for i := 0 to (F.ComponentCount - 1) do begin
            if (F.Components[i] is TppDBText) then   begin
               if (UpperCase(Copy(TppDBText(F.Components[i]).Name, 3, 7)) = 'IMPORTE') or
                  (UpperCase(Copy(TppDBText(F.Components[i]).UserName, 1, 7)) = 'IMPORTE') then   begin
                  TppDBText(F.Components[i]).DisplayFormat := '###,###,###';
               end
               else
               if (UpperCase(Copy(TppDBText(F.Components[i]).Name, 3, 4)) = 'SUMA') or
                  (UpperCase(Copy(TppDBText(F.Components[i]).UserName, 1, 4)) = 'SUMA') then   begin
                  TppDBText(F.Components[i]).DisplayFormat := '###,###,###,###';
               end;
            end;
         end;
         if F.FindComponent('ppSuma1') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma1')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma2') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma2')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma3') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma3')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma4') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma4')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma5') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma5')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma6') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma6')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma7') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma7')).DisplayFormat := '###,###,###,###';
         end;
         if F.FindComponent('ppSuma8') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma8')).DisplayFormat := '###,###,###,###';
         end;
      end
      else begin
         for i := 0 to (F.ComponentCount - 1) do begin
            if (F.Components[i] is TppDBText) then   begin
               if (UpperCase(Copy(TppDBText(F.Components[i]).Name, 3, 7)) = 'IMPORTE') or
                  (UpperCase(Copy(TppDBText(F.Components[i]).UserName, 1, 7)) = 'IMPORTE') then   begin
                  TppDBText(F.Components[i]).DisplayFormat := '###,###,##0.#0';
               end
               else
               if (UpperCase(Copy(TppDBText(F.Components[i]).Name, 3, 4)) = 'SUMA') or
                  (UpperCase(Copy(TppDBText(F.Components[i]).UserName, 1, 4)) = 'SUMA') then   begin
                  TppDBText(F.Components[i]).DisplayFormat := '###,###,###,##0.#0';
               end;
            end;
         end;
         if F.FindComponent('ppSuma1') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma1')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma2') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma2')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma3') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma3')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma4') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma4')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma5') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma5')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma6') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma6')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma7') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma7')).DisplayFormat := '###,###,###,##0.#0';
         end;
         if F.FindComponent('ppSuma8') <> nil then   begin
            TppDbCalc(F.FindComponent('ppSuma8')).DisplayFormat := '###,###,###,##0.#0';
         end;
      end;
   end;
end;

function RoundToDecimal(Value : Extended;
                        Places : Integer;
                        Bankers : Boolean):Extended;

     function Exp10(Exponent : Extended) : Extended;
       {-Returns 10^Exponent}
     begin
       Result := Power(10.0, Exponent);
     end;

var
  Val, IV, N, F :Extended;
  T             :Integer;
begin
   IV := 0;
   N := Exp10(Places);
   if (Places > 0) then IV := Int(Value);
   Val := (Value - IV) * N;
   T := Trunc(Val);
   F := (Val - T);
   if Bankers then Val := Round(Val) / N        {Delphi's Round does Bankers}
   else begin
      if Abs(Round(10.0 * F)) >= 5 then begin
        if (F > 0) then Val := (T + 1.0) / N
                   else Val := (T - 1.0) / N;
      end
      else Val := T / N;
   end;
   Result := Val + IV;
end;

function Empty(prmCadena :string):Boolean;
begin
   Result := Trim(prmCadena) = '';
end;

function Year(prmDate :TDateTime):Integer;
{returns the year}
var Year, Month, Day: Word;
begin
  DecodeDate(prmDate, Year, Month, Day);
  Result := Year;
end;

function Month(prmDate :TDateTime):Integer;
{returns the month of the year}
var Year, Month, Day: Word;
begin
  DecodeDate(prmDate, Year, Month, Day);
  Result := Month;
end;

function Day(prmDate :TDateTime):Integer;
{returns the day of the month}
var Year, Month, Day :Word;
begin
   DecodeDate(prmDate, Year, Month, Day);
   Result := Day;
end;

function Replicate(prmChar :Char; prmLength :Integer): string;
{return a string containing nLen times the character c}
var i :Integer;
begin
  Result := '';
  for i := 1 to prmLength do begin
      Result := Result + prmChar;
  end;
end;

function Space(prmLength :Integer): string;
{return the number of spaces asked for}
begin
   Result := Replicate(' ', prmLength);
end;

function PadR(prmString :string; prmLength :Integer): string;
{make certain the string is exactly nLen character}
begin
  if (Length(prmString) <> prmLength) then begin
     if Length(prmString) > prmLength then begin
        {length is smaller than string, so cut string to fit}
        Result := Copy(prmString, 1, prmLength);
     end
     else begin
       {length is bigger than string, so add spaces}
       Result := prmString + Space(prmLength - Length(prmString));
     end;
  end
  else Result := prmString;
end;

function CMonth(prmDate :TDateTime): string;
{returns the month as a character string}
begin
  Result := FormatDateTime('mmmm', prmDate);
end;

end.
