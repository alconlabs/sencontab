unit UTLogin;

interface
uses TestFramework, DBTables, GUITesting,
     DBController,
     LoginController,
     LoginView;

type
  TTCLogin = class(TGUITestCase)
  private
    FDBMainController   :TDBController;
    property DBMain :TDBController read FDBMainController;
  protected
    TestedForm       :TFormLoginView;
    FLoginController :TLoginController;
    procedure Setup;  override;
  public
     procedure TearDown; override;
  published
    procedure InitialFocus;
    procedure InicializacionDB;
  end;

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, GUITestRunner, Math, CommonForAllTests;

procedure TTCLogin.Setup;
begin
   inherited;
   FDBMainController := CommonDBMainController;
   FLoginController := TLoginController.Create(DBMain);
   TestedForm := FLoginController.FView;
   ActionDelay := 10;
   Application.ProcessMessages;
end;

procedure TTCLogin.TearDown;
begin
   FLoginController.Free;
   Application.ProcessMessages;
   inherited;
end;

procedure TTCLogin.InitialFocus;
begin
   TestedForm.Show;
   FFailsOnNoChecksExecuted := False;
   //SetFocus(TestedForm.EditPassword);
   //Assert(not IsFocused(TestedForm.EditUser));
   //Assert(IsFocused(TestedForm.EditUser));
   Check(IsFocused(TestedForm.EditUser), 'The initial component with the focus shall be EditUser field');
end;

procedure TTCLogin.InicializacionDB;
begin

end;

initialization
  TestFramework.RegisterTest(TTCLogin.Suite);
end.


