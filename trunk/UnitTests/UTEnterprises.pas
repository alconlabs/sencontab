unit UTEnterprises;

interface
uses TestFramework, DBTables,
     DBController;

type
  TTCEnterprises = class(TTestCase)
  protected
     procedure Setup;    override;
  private
    FDBMainController :TDBController;
    property DBMain :TDBController read FDBMainController;
  public
     procedure TearDown; override;
  published
    procedure GetEnterprisesOfAContretUser;
  end;

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, Math,
     CommonForAllTests;

procedure TTCEnterprises.Setup;
begin
   FDBMainController := CommonDBMainController;
end;

procedure TTCEnterprises.TearDown;
begin
   //
end;

procedure TTCEnterprises.GetEnterprisesOfAContretUser;
begin
   {$Message Warn 'Do this test'}
end;

initialization
  TestFramework.RegisterTest(TTCEnterprises.Suite);
end.


