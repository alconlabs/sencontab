unit DBController;

interface

uses Classes,
     DBConnection,
     ConfigurationClass;

type
  TDBController = class(TPersistent)
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
     property DBConfig     :TSdaDBConfig  read FDBConfig;
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


The next code is for copy a database to other from SQL Server.
Is a stored Procedure.
This is for a future use of this test.



USE master
GO

-- the original database (use 'SET @DB = NULL' to disable backup)
DECLARE @DB varchar(200)
SET @DB = 'PcTopp'

-- the backup filename
DECLARE @BackupFile varchar(2000)
SET @BackupFile = 'c:\pctopp\sqlserver\backup.dat'

-- the new database name
DECLARE @TestDB varchar(200)
SET @TestDB = 'TestDB'

-- the new database files without .mdf/.ldf
DECLARE @RestoreFile varchar(2000)
SET @RestoreFile = 'c:\pctopp\sqlserver\backup'


-- ****************************************************************
--                    no change below this line
-- ****************************************************************


DECLARE @query varchar(2000)

DECLARE @DataFile varchar(2000)
SET @DataFile = @RestoreFile + '.mdf'

DECLARE @LogFile varchar(2000)
SET @LogFile = @RestoreFile + '.ldf'

IF @DB IS NOT NULL
BEGIN
    SET @query = 'BACKUP DATABASE ' + @DB + ' TO DISK = ' + QUOTENAME(@BackupFile, '''')
    EXEC (@query)
END

-- RESTORE FILELISTONLY FROM DISK = 'C:\temp\backup.dat'
-- RESTORE HEADERONLY FROM DISK = 'C:\temp\backup.dat'
-- RESTORE LABELONLY FROM DISK = 'C:\temp\backup.dat'
-- RESTORE VERIFYONLY FROM DISK = 'C:\temp\backup.dat'

IF EXISTS(SELECT * FROM sysdatabases WHERE name = @TestDB)
BEGIN
    SET @query = 'DROP DATABASE ' + @TestDB
    EXEC (@query)
END

RESTORE HEADERONLY FROM DISK = @BackupFile
DECLARE @File int
SET @File = @@ROWCOUNT

DECLARE @Data varchar(500)
DECLARE @Log varchar(500)

SET @query = 'RESTORE FILELISTONLY FROM DISK = ' + QUOTENAME(@BackupFile , '''')

CREATE TABLE #restoretemp
(
 LogicalName varchar(500),
 PhysicalName varchar(500),
 type varchar(10),
 FilegroupName varchar(200),
 size int,
 maxsize bigint
)
INSERT #restoretemp EXEC (@query)

SELECT @Data = LogicalName FROM #restoretemp WHERE type = 'D'
SELECT @Log = LogicalName FROM #restoretemp WHERE type = 'L'

PRINT @Data
PRINT @Log

TRUNCATE TABLE #restoretemp
DROP TABLE #restoretemp

IF @File > 0
BEGIN
    SET @query = 'RESTORE DATABASE ' + @TestDB + ' FROM DISK = ' + QUOTENAME(@BackupFile, '''') +
        ' WITH MOVE ' + QUOTENAME(@Data, '''') + ' TO ' + QUOTENAME(@DataFile, '''') + ', MOVE ' +
        QUOTENAME(@Log, '''') + ' TO ' + QUOTENAME(@LogFile, '''') + ', FILE = ' + CONVERT(varchar, @File)
    EXEC (@query)
END
GO


