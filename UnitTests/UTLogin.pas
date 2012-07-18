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
    procedure PressESCAPE;
    procedure BadUserLogin;
    procedure AdminUserLogin;
    procedure ContabUserLogin;
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
   Check(IsFocused(TestedForm.EditUser), 'The initial component with the focus shall be EditUser field');
end;

procedure TTCLogin.PressESCAPE;
begin
   TestedForm.Show;
   EnterKey(VK_ESCAPE, []);
   Check(FLoginController.FResult = msNone, 'After press ESC the form shall say that nothing to show is prepared');
end;

procedure TTCLogin.BadUserLogin;
begin
   TestedForm.Show;
   EnterText('UserIncorrect');
   Tab(1);
   EnterText('password');
   Click(TestedForm.BtnAccept);
   Check(FLoginController.FResult = msNone, 'After a bad login entered FResult shall be msNone');
end;

procedure TTCLogin.AdminUserLogin;
begin
   TestedForm.Show;
   EnterText('Admin');
   Tab(1);
   EnterText('sencille');
   Click(TestedForm.BtnAccept);
   Check(FLoginController.FResult = msAdmin, 'After the Admin name and password FResult shall be msAdmin');
end;

procedure TTCLogin.ContabUserLogin;
begin
   TestedForm.Show;
   EnterText('user');
   Tab(1);
   EnterText('contab');
   Click(TestedForm.BtnAccept);
   Check(FLoginController.FResult = msMain, 'After a "Contab User" name and password FResult shall be msMain');
end;

initialization
   TestFramework.RegisterTest(TTCLogin.Suite);
end.


