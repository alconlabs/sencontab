unit OptionsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs,
     CustomOptionsModel, OptionClass;
type
  TOptionsModel = class(TCustomOptionsModel)
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

{ TProfilesModel }

function TOptionsModel.CheckValues(prmValue: TOption; var prmMessage: string):Integer;
begin
   if Trim(prmValue.CD_OPTION) = '' then begin
      prmMessage := 'El código de la Opción no puede quedar vacio';
      Result := -1; { CD_OPTION }
   end  {$Message Warn 'Faltan todo los demás chequeos'}
   else Result := 0;
end;

function TOptionsModel.GetNewClass: TOption;
begin
   Result := TOption.Create;
   Result.APPLICATION := ApplicationNameConst;
end;

{$Message Warn 'Llevar este método a la madre de todas las modelos'}
function TOptionsModel.CheckTextSearched(prmText :TCaption):string;
var i :Integer;
begin
   if Length(Trim(prmText)) <> 0 then begin
      {Si el campo es alfanumérico se sustituyen '*' por '%', y '?' por '_'}
      for i := 1 to Length(prmText) do begin
         if prmText[i] = '*' then prmText[i] := '%';
         if prmText[i] = '?' then prmText[i] := '_';
      end;
      {Si no hay % se buscará la cadena exacta y todas las cadenas que la contengan}
      if Pos('%', prmText) = 0 then begin
         prmText := '%' + prmText + '%';
      end;
   end;
   Result := prmText;
end;

procedure TOptionsModel.Search(prmTextSearched :string);
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
