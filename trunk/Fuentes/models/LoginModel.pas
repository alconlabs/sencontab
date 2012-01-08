unit LoginModel;

interface

uses Classes, CRSQLConnection;

type
  TLoginModel = class
  private
    FConnection  :TCRSQLConnection;
    function GetAdminPasswordInitial:Boolean;
  protected
  public
    property Connection            :TCRSQLConnection  read FConnection;
    property AdminPasswordInitial  :Boolean           read GetAdminPasswordInitial;
    function UserCorrect(prmUser, prmPassword :string):Boolean;
    function UserIsAdministrator(prmUser :string):Boolean;
    constructor Create(AConnection :TCRSQLConnection);
  end;

implementation
uses SysUtils, SqlExpr, HashCriptography;

constructor TLoginModel.Create(AConnection: TCRSQLConnection);
begin
   FConnection := AConnection;
end;

function TLoginModel.GetAdminPasswordInitial:Boolean;
var Q :TSQLQuery;
begin
   Q := FConnection.CreateQuery(
        ['SELECT PASSWORD                  ',
         'FROM   USERS                     ',
         'WHERE  CD_USER       = ''ADMIN'' ',
         'AND    ADMINISTRATOR = ''Y''     ']);

   try Q.Open;
      Result := (not Q.FieldByName('PASSWORD').IsNull            ) and        { sencille encripted }
                (    Q.FieldByName('PASSWORD').AsString = 'dba09fef2390af4ea7503ee5ff7c60d65900437f');
   finally Q.Free;
   end;
end;

function TLoginModel.UserIsAdministrator(prmUser: string): Boolean;
var Q :TSQLQuery;
begin
   Q := FConnection.CreateQuery(
        ['SELECT ADMINISTRATOR          ',
         'FROM   USERS                  ',
         'WHERE  CD_USER  = :prmCD_USER ']);
   Q.ParamByName('prmCD_USER').AsString := prmUser;
   try Q.Open;
      Result :=  (not Q.FieldByName('ADMINISTRATOR').IsNULL        ) and
                 (    Q.FieldByName('ADMINISTRATOR').AsString = 'Y');
   finally Q.Free;
   end;
end;

function TLoginModel.UserCorrect(prmUser, prmPassword: string): Boolean;
var Q :TSQLQuery;
begin
   Q := FConnection.CreateQuery(
        ['SELECT PASSWORD               ',
         'FROM   USERS                  ',
         'WHERE  CD_USER  = :prmCD_USER ']);
   Q.ParamByName('prmCD_USER').AsString := prmUser;
   try Q.Open;
       Result := (not Q.FieldByName('PASSWORD').IsNull                             ) and
                 (    Q.FieldByName('PASSWORD').AsString = GetSHA1Hash(prmPassword));
   finally Q.Free;
   end;
end;

end.
