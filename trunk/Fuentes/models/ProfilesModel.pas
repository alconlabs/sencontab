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
    {--------------------------------------------------------------------------------------}
    procedure CreateProfileDetails;
    function  IsProfileUptoday(prmCurrentOptions :TList):Boolean;
    function  UpdateProfileDetails(prmNewOptions :TList):TList; //Return the Items Changed.
    procedure DeleteProfileDetails;
    procedure CopyProfileDetails(prmFromProfile :string; prmNewProfile :string);
    procedure ModifyAProfileDetail(prmNewOptions :TList);
  end;

implementation

uses CustomModel;
//uses ;

{ TProfilesModel }

function TProfilesModel.CheckValues(prmValue: TProfile; var prmMessage: string):Integer;
begin
   if Trim(prmValue.CD_PROFILE) = '' then begin
      prmMessage := 'El código de Perfil no puede quedar vacio';
      Result := -1; { CD_PROFILE }
   end
   else Result := 0;
end;

function TProfilesModel.GetNewClass: TProfile;
begin
   Result := TProfile.Create;
   Result.APPLICATION := ApplicationNameConst;
end;

{$Message Warn 'Llevar este método a la madre de todas las modelos'}
function TProfilesModel.CheckTextSearched(prmText :TCaption):string;
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

procedure TProfilesModel.CopyProfileDetails(prmFromProfile, prmNewProfile: string);
// This method receibes the name of a profile and the name of a new profile that still not exists
// and create a new profile with al the options with the same values.
// Requirements: The new profile shall not exists.
//               The From profile shall be uptoday in the options.
begin
   {$Message Warn 'Still not implemented'}
end;

procedure TProfilesModel.CreateProfileDetails;
begin
   {$Message Warn 'Still not implemented'}
end;

procedure TProfilesModel.DeleteProfileDetails;
begin
   {$Message Warn 'Still not implemented'}
end;

procedure TProfilesModel.ModifyAProfileDetail(prmNewOptions: TList);
begin
   {$Message Warn 'Still not implemented'}
end;

function TProfilesModel.UpdateProfileDetails(prmNewOptions: TList): TList;
begin
   {$Message Warn 'Still not implemented'}
end;

function TProfilesModel.IsProfileUptoday(prmCurrentOptions: TList): Boolean;
begin
   {$Message Warn 'Still not implemented'}
end;

end.
