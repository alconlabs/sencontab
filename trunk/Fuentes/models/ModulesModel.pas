unit ModulesModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs,
     CustomModulesModel, ModuleClass, CRSQLConnection;
type
  TModulesModel = class(TCustomModulesModel)
  private
    function CheckTextSearched(prmText :TCaption):string;
  public
    function CheckValues(prmValue :TModule; var prmMessage :string):Integer;
    function GetNewClass :TModule;
    procedure Search(prmTextSearched :string);
  end;

implementation
//uses ;

{ TModulesModel }

function TModulesModel.CheckValues(prmValue: TModule; var prmMessage: string):Integer;
begin
   //if Trim(prmUser.CD_USER) = '' then begin
   //   prmMessage := 'El código de Usuario no puede quedar vacio';
   //   Result := -1; { CD_USER }
   //end else
   //if Trim(prmUser.DS_USER) = '' then begin
   //   prmMessage := 'El Nombre de Usuario no puede quedar vacio';
   //   Result := -2; { DS_USER }
   //end else
   //if Trim(prmUser.PASSWORD) = '' then begin
   //   prmMessage := 'Es Password no puede quedar vacio';
   //   Result := -3; { PASSWORD }
   //end
   //else Result := 0;
   { comprobar lo de la clave. }
end;

function TModulesModel.GetNewClass: TModule;
begin
   Result := TModule.Create;
   //Result.ADMINISTRATOR := 'N';
end;

{$Message Warn 'Llevar este método a la madre de todas las modelos'}
function TModulesModel.CheckTextSearched(prmText :TCaption):string;
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

procedure TModulesModel.Search(prmTextSearched :string);
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
