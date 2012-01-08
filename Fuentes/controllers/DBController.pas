unit DBController;

interface

uses Classes,
     DBConnection,
     ConfigurationClass;

type
  TDBController = class
  private
     FDBConnection :TDBConnection;
     FDBConfig     :TSdaDBConfig; 
  protected
     function GetServerData():TDateTime;
  public
     constructor Create(ADBConfig :TSdaDBConfig);
     procedure OpenConnection;
     function  IsConnected:Boolean;
     function  Disconnect:Boolean;
     property DBConnection :TDBConnection read FDBConnection;
     property ServerDate   :TDateTime     read GetServerData;
  end;

implementation

constructor TDBController.Create(ADBConfig :TSdaDBConfig);
begin
   FDBConfig := ADBConfig;
   FDBConnection := TDBConnection.Create(ADBConfig);
end;

function TDBController.IsConnected:Boolean;
begin
   Result := FDBConnection.Connected;
end;

function TDBController.Disconnect:Boolean;
begin
   FDBConnection.CloseConnection;
   Result := not FDBConnection.Connected;
end;

procedure TDBController.OpenConnection;
begin
   FDBConnection.OpenConnection;
end;

function TDBController.GetServerData():TDateTime;
begin
  Result := FDBConnection.ServerDate;
end;

end.
