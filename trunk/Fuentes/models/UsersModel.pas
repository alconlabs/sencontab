unit UsersModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, 
     CustomUsersModel, UserClass, CRSQLConnection;
type
  TUsersModel = class(TCustomUsersModel)
  private
  public
    function CheckValues(prmUser :TUser; var prmMessage :string):Integer;
    function GetNewClass:TUser;
  end;

implementation
//uses ;

{ TUsersModel }

function TUsersModel.CheckValues(prmUser: TUser; var prmMessage: string):Integer;
begin
   if Trim(prmUser.CD_USER) = '' then begin
      prmMessage := 'El código de Usuario no puede quedar vacio';
      Result := -1; { CD_USER }
   end else
   if Trim(prmUser.DS_USER) = '' then begin
      prmMessage := 'El Nombre de Usuario no puede quedar vacio';
      Result := -2; { DS_USER }
   end else
   if Trim(prmUser.PASSWORD) = '' then begin
      prmMessage := 'Es Password no puede quedar vacio';
      Result := -3; { PASSWORD }
   end
   else Result := 0;
   { comprobar lo de la clave. }
end;

function TUsersModel.GetNewClass: TUser;
begin
   Result := TUser.Create;
   Result.ADMINISTRATOR := 'N';
end;

end.
