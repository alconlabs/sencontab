unit UTOptions;

interface
uses TestFramework, DBTables,
     DBController,
     OptionClass,
     ListOfOptions;

type
  TTCOptions = class(TTestCase)
  protected
     procedure Setup;    override;
  private
    FDBMainController :TDBController;
    property DBMain :TDBController read FDBMainController;
  public
     procedure TearDown; override;
  published
    procedure SaveOptionListToFile;
    procedure LoadOptionListFromFile;
  end;

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, Math,
     CommonForAllTests;

procedure TTCOptions.Setup;
begin
   FDBMainController := CommonDBMainController;
end;

procedure TTCOptions.TearDown;
begin
   //
end;

procedure TTCOptions.SaveOptionListToFile;
var OptionsList :TOptionsList;
    Option      :TOption;
begin
    OptionsList := TOptionsList.Create;
    try
       Option := TOption.Create;
       Option.CD_OPTION           := 'Test Option Code';
       Option.CD_PARENT_OPTION    := 'Test Parent Option Code';
       Option.DS_OPTION           := 'Test Description of Option';
       Option.NAME_IN_FONT_SOURCE := 'Test Name in Source Code for the option';
       Option.HELP_PAGE_LINK      := 'Test Help Page Link';
       Option.APPLICATION         := 'Application';

       OptionsList.Add(Option);

       OptionsList.SaveToFile(CommonConfiguration.RunningDirectory + 'OptionsTest.xml');
    finally
       OptionsList.Free;
    end;
end;

procedure TTCOptions.LoadOptionListFromFile;
var OptionsList :TOptionsList;
begin
    OptionsList := TOptionsList.Create;
    try
      OptionsList.LoadFromFile(CommonConfiguration.RunningDirectory + 'OptionsTest.xml');
      Check(OptionsList.Count = 1, 'LoadFromFile option shall recover one row.');
      Check(OptionsList[0].CD_OPTION           = 'Test Option Code'                       , 'CD_OPTION fails in LoadFromFile method');
      Check(OptionsList[0].CD_PARENT_OPTION    = 'Test Parent Option Code'                , 'CD_PARENT_OPTION fails in LoadFromFile method');
      Check(OptionsList[0].DS_OPTION           = 'Test Description of Option'             , 'DS_OPTION fails in LoadFromFile method');
      Check(OptionsList[0].NAME_IN_FONT_SOURCE = 'Test Name in Source Code for the option', 'NAME_IN_FONT_SOURCE fails in LoadFromFile method');
      Check(OptionsList[0].HELP_PAGE_LINK      = 'Test Help Page Link'                    , 'HELP_PAGE_LINK fails in LoadFromFile method');
      Check(OptionsList[0].APPLICATION         = 'Application'                            , 'APPLICATION fails in LoadFromFile method'); 

    finally
      OptionsList.Free;
    end;
end;

initialization
  TestFramework.RegisterTest(TTCOptions.Suite);
end.


