unit UTLogin;

interface
uses TestFramework, DBTables,
     DBController;

type
  TTCLogin = class(TTestCase)
  public
     procedure Setup;    override;
     procedure TearDown; override;
  private
    FDBMainController   :TDBController;
    property DBMain :TDBController read FDBMainController;
  protected

  published
    procedure ConnectWithTheServer;
    procedure InicializacionDB;
  end;

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, GUITestRunner, Math, SQLExpr,
     IBQuery, ccBtnPanel, CommonForAllTests;

procedure TTCLogin.Setup;
begin
   FDBMainController := CommonDBMainController;
end;

procedure TTCLogin.TearDown;
begin
   //
end;

procedure TTCLogin.ConnectWithTheServer;
begin
   Check(DBMain.IsConnected, 'There is a problem with the database connection');
   Check(DBMain.ServerDate = Date, 'The date of database is not the same as the system');
end;

procedure TTCLogin.InicializacionDB;
begin
   //
end;

initialization
  TestFramework.RegisterTest(TTCLogin.Suite);
end.


