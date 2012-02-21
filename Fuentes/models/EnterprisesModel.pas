unit EnterprisesModel;

interface

uses Classes, CRSQLConnection;

type
  TEnterprisesModel = class
  private
    FConnection  :TCRSQLConnection;
  protected
  public
    property Connection :TCRSQLConnection  read FConnection;
    function CreateDBFile(DatabaseName :string):Boolean;
    function CreateDBSchema(DatabaseName :string):Boolean;
    //function CheckDBSchemaExists(DatabaseName :string):Boolean;
    constructor Create(AConnection :TCRSQLConnection);
  end;

implementation
uses SysUtils, SqlExpr, HashCriptography;

constructor TEnterprisesModel.Create(AConnection: TCRSQLConnection);
begin
   FConnection := AConnection;
end;

function TEnterprisesModel.CreateDBFile(DatabaseName :string):Boolean;
var //Q  :TSQLQuery;
    DB :TCRSQLConnection;
    //i  :Integer;
begin
   DB := TCRSQLConnection.Create(nil);

   DB.ConnectionName := FConnection.ConnectionName; //'SQLServerConnection';
   DB.DriverName     := FConnection.Drivername;     //'SQLServer';
   DB.GetDriverFunc  := FConnection.GetDriverFunc;  //'getSQLDriverSQLServer';
   DB.LibraryName    := FConnection.LibraryName;    //'dbexpsda.dll';
   DB.LoginPrompt    := FConnection.LoginPrompt;    //False;
   DB.KeepConnection := FConnection.KeepConnection; //True;
   DB.VendorLib      := FConnection.VendorLib;      //'sqloledb.dll';
   DB.Params.Assign(FConnection.Params);
   DB.Params.Values['DataBase' ] := 'master';

   //DB.Params.Values['DriverName' ] := 'SQLServer';
   //DB.Params.Values['BlobSize'   ] := '-1'  ;
   //DB.Params.Values['EnableBCD'  ] := 'True';
   //DB.Params.Values['LongStrings'] := 'True';
   //DB.Params.Values['FetchAll'   ] := 'True';
   //
   //DB.Params.Values['HostName' ] := FConfiguration.DBConfig.HostName;
   //
   //DB.Params.Values['User_Name'] := FConfiguration.DBConfig.User_Name;
   //DB.Params.Values['Password' ] := FConfiguration.DBConfig.Password;

   { Conectamos con la base de datos Master                      }
   { Utilizando los parámetros de la base de datos que se recibe }

   try
     DB.Open;
     try
        DB.ExecuteDirect('CREATE DATABASE '+DatabaseName);
        (*,
                             '    ON (NAME     = '''+FConfiguration.DBConfig.DataBase+'_DB'',           ',
                             '        FILENAME = ''D:\'+FConfiguration.DBConfig.DataBase+'_DB.mdf'',    ',
                             '        SIZE     = 30  ,                                                  ',
                             '        FILEGROWTH = 5MB)                                                 ',
                             'LOG ON (NAME     = ''LOG'+FConfiguration.DBConfig.DataBase+'_LOG'',       ',
                             '        FILENAME = ''d:\LOG'+FConfiguration.DBConfig.DataBase+'_LOG.ldf'', ',
                             '        SIZE     =  1,                                                     ',
                             '        FILEGROWTH = 5MB  )                                                ']);
                             *)
     except
        on E: Exception do begin
           //ShowErrorMessage(E.Message);
        end;
     end;
   finally
      DB.Free;
      DB := nil;
   end;
end;

function TEnterprisesModel.CreateDBSchema(DatabaseName :string):Boolean;
var Q :TSQLQuery;
begin
   { Comprobamos}
   Q := FConnection.CreateQuery(
        ['SELECT PASSWORD               ',
         'FROM   USERS                  ',
         'WHERE  CD_USER  = :prmCD_USER ']);
   //Q.ParamByName('prmCD_USER').AsString := prmUser;
   try Q.Open;
       //Result := (not Q.FieldByName('PASSWORD').IsNull                             ) and
       //          (    Q.FieldByName('PASSWORD').AsString = GetSHA1Hash(prmPassword));
   finally Q.Free;
   end;
end;

end.
