unit ApplicationsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, 
     CustomApplicationsModel, ApplicationClass, CRSQLConnection;
type
  TApplicationsModel = class(TCustomApplicationsModel)
  private
    function CheckTextSearched(prmText :TCaption):string;
  public
    function CheckValues(prmValue :TApplication; var prmMessage :string):Integer;
    function GetNewClass :TApplication;
    procedure Search(prmTextSearched :string);
  end;

implementation
//uses ;

{ TApplicationsModel }

function TApplicationsModel.CheckValues(prmValue: TApplication; var prmMessage: string):Integer;
begin
   //if Trim(prmUser.CD_USER) = '' then begin
   //   prmMessage := 'El c�digo de Usuario no puede quedar vacio';
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
   //{ comprobar lo de la clave. }
end;

function TApplicationsModel.GetNewClass: TApplication;
begin
   Result := TApplication.Create;
   //Result.ADMINISTRATOR := 'N';
end;

{$Message Warn 'Llevar este m�todo a la madre de todas las modelos'}
function TApplicationsModel.CheckTextSearched(prmText :TCaption):string;
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

procedure TApplicationsModel.Search(prmTextSearched :string);
var TextSearched :string;
begin
   TextSearched := CheckTextSearched(prmTextSearched);

   SQLSearch.Clear;

   if Length(TextSearched) > 0 then begin
      { We need to know if the query begins with WHERE or with AND }
      //SQLSearch.Add('WHERE   RTRIM(LTRIM(CD_USER)) + ''|''+ ');
      //SQLSearch.Add('        RTRIM(LTRIM(DS_USER))          ');
      //SQLSearch.Add('LIKE  '''+TextSearched+'''             ');
   end;

   Open;
end;

end.
