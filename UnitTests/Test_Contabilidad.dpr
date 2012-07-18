program Test_Contabilidad;

uses
  Forms,
  TestFrameWork,
  GUITestRunner,
  CustomView in '..\Fuentes\views\CustomView.pas' {CustomView},
  ConfigurationClass in '..\Fuentes\controllers\ConfigurationClass.pas',
  LabelCaptionForm in '..\Fuentes\Tools\LabelCaptionForm.pas',
  CRSQLConnection in '..\Fuentes\models\CRSQLConnection.pas',
  DBController in '..\Fuentes\controllers\DBController.pas',
  DBConnection in '..\Fuentes\models\DBConnection.pas',
  UTDataBase in 'UTDataBase.pas',
  Utilidades in '..\Fuentes\Utilidades.pas',
  WizardConnectDB in '..\Fuentes\WizardConnectDB.pas' {WizardConnectDB},
  D6OnHelpFix in '..\Fuentes\D6OnHelpFix.pas',
  General in '..\Fuentes\General.pas',
  Globales in '..\Fuentes\Globales.pas',
  HashCriptography in '..\Fuentes\HashCriptography.pas',
  UTLogin in 'UTLogin.pas',
  CommonForAllTests in 'CommonForAllTests.pas';

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
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
  
  CommonConfiguration.Free;
end.




