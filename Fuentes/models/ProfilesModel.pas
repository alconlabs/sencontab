unit ProfilesModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, 
     CustomProfilesModel, ProfileClass, CRSQLConnection;
type
  TProfilesModel = class(TCustomProfilesModel)
  private
    function CheckTextSearched(prmText :TCaption):string;
  public
    function CheckValues(prmValue :TProfile; var prmMessage :string):Integer;
    function GetNewClass :TProfile;
    procedure Search(prmTextSearched :string);
  end;

implementation

uses CustomModel;
//uses ;

{ TProfilesModel }

function TProfilesModel.CheckValues(prmValue: TProfile; var prmMessage: string):Integer;
begin
   if Trim(prmValue.CD_PROFILE) = '' then begin
      prmMessage := 'El c�digo de Perfil no puede quedar vacio';
      Result := -1; { CD_PROFILE }
   end
   else Result := 0;
end;

function TProfilesModel.GetNewClass: TProfile;
begin
   Result := TProfile.Create;
   Result.APPLICATION := ApplicationNameConst;
end;

{$Message Warn 'Llevar este m�todo a la madre de todas las modelos'}
function TProfilesModel.CheckTextSearched(prmText :TCaption):string;
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

procedure TProfilesModel.Search(prmTextSearched :string);
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
