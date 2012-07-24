unit ProfileOptionsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs,
     CustomProfileOptionsModel, OptionClass;
type
  TProfileOptionsModel = class(TCustomProfileOptionsModel)
  private
    function CheckTextSearched(prmText :TCaption):string;
  public
    function CheckValues(prmValue :TOption; var prmMessage :string):Integer;
    function GetNewClass :TOption;
    procedure Search(prmTextSearched :string);
  end;

implementation

uses CustomModel;
//uses ;

{ TProfileOptionsModel }

function TProfileOptionsModel.CheckValues(prmValue: TOption; var prmMessage: string):Integer;
begin
   if Trim(prmValue.CD_OPTION) = '' then begin
      prmMessage := 'El c�digo de la Opci�n no puede quedar vacio';
      Result := -1; { CD_OPTION }
   end  {$Message Warn 'Faltan todo los dem�s chequeos'}
   else Result := 0;
end;

function TProfileOptionsModel.GetNewClass: TOption;
begin
   Result := TOption.Create;
   Result.APPLICATION := ApplicationNameConst;
end;

{$Message Warn 'Llevar este m�todo a la madre de todas las modelos'}
function TProfileOptionsModel.CheckTextSearched(prmText :TCaption):string;
var i :Integer;
begin
   if Length(Trim(prmText)) <> 0 then begin
      {Si el campo es alfanum�rico se sustituyen '*' por '%', y '?' por '_'}
      for i := 1 to Length(prmText) do begin
         if prmText[i] = '*' then prmText[i] := '%';
         if prmText[i] = '?' then prmText[i] := '_';
      end;
      {Si no hay % se buscar� la cadena exacta y todas las cadenas que la contengan}
      if Pos('%', prmText) = 0 then begin
         prmText := '%' + prmText + '%';
      end;
   end;
   Result := prmText;
end;

procedure TProfileOptionsModel.Search(prmTextSearched :string);
var TextSearched :string;
begin
   TextSearched := CheckTextSearched(prmTextSearched);

   SQLSearch.Clear;

   //if Length(TextSearched) > 0 then begin
   //   { We need to know if the query begins with WHERE or with AND }
   //   SQLSearch.Add('WHERE   RTRIM(LTRIM(CD_USER)) + ''|''+ ');
   //   SQLSearch.Add('        RTRIM(LTRIM(DS_USER))          ');
   //   SQLSearch.Add('LIKE  '''+TextSearched+'''             ');
   //end;

   Open;
end;

end.
