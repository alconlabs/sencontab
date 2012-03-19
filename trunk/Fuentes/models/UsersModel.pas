unit UsersModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, 
     CustomUsersModel, UserClass, CRSQLConnection;
type
  TUsersModel = class(TCustomUsersModel)
  private
  public
    function CheckValues(prmUser :TUser; prmMessage :string):Integer;
  end;

implementation
//uses ;

{ TUsersModel }

function TUsersModel.CheckValues(prmUser: TUser; prmMessage: string): Integer;
begin
   if Trim(prmUser.CD_USER) = '' then begin
      prmMessage := 'El código de Usuario no puede quedar vacio';
      Result := -1; { De Momento }
   end else
   if Trim(prmUser.DS_USER) = '' then begin
      prmMessage := 'El Nombre de Usuario no puede quedar vacio';
      Result := -1; { De Momento }
   end else
   Result := 0;
   { comprobar lo de la clave. }
end;

end.
