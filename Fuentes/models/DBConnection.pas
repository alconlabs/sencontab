unit DBConnection;

interface

uses Classes, SysUtils, SqlExpr, CRSQLConnection, ConfigurationClass;

type
  TDBConnection = class
  private
    FConnection       :TCRSQLConnection;
    FConnected        :Boolean;
    function GetConnected:Boolean;
  protected
    function GetServerDate():TDateTime;
  public
    constructor Create(ADBConfig :TSdaDBConfig);
    procedure OpenConnection;
    procedure CloseConnection;
    function GetCommand(const SQL :array of string):TSQLQuery;
    property Connection :TCRSQLConnection read FConnection write FConnection;
    property ServerDate :TDateTime        read GetServerDate;
    property Connected  :Boolean          read GetConnected;
  end;

implementation

uses Dialogs;

constructor TDBConnection.Create(ADBConfig :TSdaDBConfig);
begin
   FConnection := TCRSQLConnection.Create(nil);
   try
      FConnection.LoginPrompt    := False;
      FConnection.KeepConnection := True;
      FConnection.ConnectionName := 'SQLServerConnection';
      ADBConfig.AssignValuesTo(FConnection);
   except
   end;
end;

procedure TDBConnection.OpenConnection;
begin
   try
      FConnection.Open();

      FConnected := True;
   except
      //on e : sqlexception do begin
      //   FConnected := False;
      //end;
   end;
end;

procedure TDBConnection.CloseConnection;
begin
  FConnection.Close();
end;

function TDBConnection.GetCommand(const SQL :array of string):TSQLQuery;
var Command :TSQLQuery;
    i       :Integer;
begin
   Command := TSQLQuery.Create(nil);
   for i := Low(SQL) to High(SQL) do begin
      Command.SQL.Add(SQL[i]);
   end;
   Result := Command;
end;

function TDBConnection.GetServerDate():TDateTime;
//var Command :SQLCECommand;
    //Reader  :SQLCEDataReader;
    //ci      :CultureInfo;
begin
   Result := Date;
   {$Message Warn 'This must be corrected' }
   //Command := GetCommand(['SELECT GETDATE() DATE']);
   //Reader  := Command.ExecuteReader();
   //Reader.Read(); { Only read an Item. This table don't have any more rows. }
   //ci := Thread.CurrentThread.CurrentCulture;   
   //Result := Convert.ToDateTime(Reader.GetDateTime(0), ci);
end;

function TDBConnection.GetConnected:Boolean;
begin
   Result := FConnection.Connected;
end;

end.


