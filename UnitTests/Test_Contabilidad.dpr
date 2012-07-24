program Test_Contabilidad;

uses
  Forms,
  TestFrameWork,
  GUITestRunner,
  UTDataBase in 'UTDataBase.pas',
  UTLogin in 'UTLogin.pas',
  UTOptions in 'UTOptions.pas',
  UTEnterprises in 'UTEnterprises.pas',
  ___________________________ in '___________________________.pas',
  CustomView in '..\Fuentes\views\CustomView.pas' {CustomView},
  ConfigurationClass in '..\Fuentes\controllers\ConfigurationClass.pas',
  LabelCaptionForm in '..\Fuentes\Tools\LabelCaptionForm.pas',
  CRSQLConnection in '..\Fuentes\models\CRSQLConnection.pas',
  DBController in '..\Fuentes\controllers\DBController.pas',
  DBConnection in '..\Fuentes\models\DBConnection.pas',
  Utilidades in '..\Fuentes\Tools\Utilidades.pas',
  WizardConnectDB in '..\Fuentes\WizardConnectDB.pas' {WizardConnectDB},
  D6OnHelpFix in '..\Fuentes\Tools\D6OnHelpFix.pas',
  General in '..\Fuentes\General.pas',
  Globales in '..\Fuentes\Globales.pas',
  HashCriptography in '..\Fuentes\Tools\HashCriptography.pas',
  CommonForAllTests in 'CommonForAllTests.pas',
  LoginController in '..\Fuentes\controllers\LoginController.pas',
  CustomController in '..\Fuentes\controllers\CustomController.pas',
  LoginView in '..\Fuentes\views\LoginView.pas' {FormLoginView},
  LoginModel in '..\Fuentes\models\LoginModel.pas',
  OptionClass in '..\Fuentes\BusinessObjects\OptionClass.pas',
  OptionsModel in '..\Fuentes\models\OptionsModel.pas',
  CustomOptionsModel in '..\Fuentes\models\CustomOptionsModel.pas',
  CustomModel in '..\Fuentes\models\CustomModel.pas',
  ListOfOptions in '..\Fuentes\BOLists\ListOfOptions.pas';

{$R *.RES}

begin
   CommonConfiguration := TConfiguration.Create();
   {This is the database for tests of enterprise issues}
   CommonConfiguration.DBConfig.DataBase := 'TEST_ENTERPRISES';

   {This method of connection is the same as the main program}

   {After the Creation of DBController we have a FDBMainController instance or an exception -nothing-}
   CommonDBMainController := TDBController.Create(CommonConfiguration.DBConfig);
   try
     {After the construction we try to connect to the server}
     {But first we delete and recreate the database for testing}

     CommonDBMainController.OpenConnection;
   except
       {This try except unhandled is necessary. Don't remove this comment or this empty structure.}
   end;

  Application.Initialize;
  GUITestRunner.RunRegisteredTests;

  CommonConfiguration.Free;
end.




