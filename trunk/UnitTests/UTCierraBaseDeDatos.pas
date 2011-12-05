unit UTCierraBaseDeDatos;

interface
uses TestFramework, ccDBXDB, DBTables;

type
  TTCCierraDataBase = class(TTestCase)
  published
    procedure CierraBaseDeDatos;
  end;

implementation
uses DataModulo, Forms, Dialogs, Classes, ccUtilesMDIForms, ccBtnPanel, SysUtils,
     TestMainForm;

procedure TTCCierraDataBase.CierraBaseDeDatos;
begin
   DM.DB.Close;
   FormTestMainForm.Hide;
   Check(not DM.DB.Connected, 'La base de datos ha quedado abierta.');
end;

initialization
  TestFramework.RegisterTest(TTCCierraDataBase.Suite);
end.


