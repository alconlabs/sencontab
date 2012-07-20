unit UTProfiles;

interface
uses TestFramework, DBTables,
     DBController;

type
  TTCProfiles = class(TTestCase)
  protected
     procedure Setup;    override;
  private
    FDBMainController :TDBController;
    property DBMain :TDBController read FDBMainController;
  public
     procedure TearDown; override;
  published
    procedure FirstTest;
  end;

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, Math, 
     CommonForAllTests;

procedure TTCDataBase.Setup;
begin
   FDBMainController := CommonDBMainController;
end;

procedure TTCDataBase.TearDown;
begin
   //
end;

procedure TTCDataBase.ConnectWithTheServer;
begin
   Check(DBMain.IsConnected, 'There is a problem with the database connection');
   Check(DBMain.ServerDate = Date, 'The date of database is not the same as the system');
end;

initialization
  TestFramework.RegisterTest(TTCDataBase.Suite);
end.


