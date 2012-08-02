unit DMSearch;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleSearch = class(TDataModule)
    NoUse: TCRSQLConnection;
    Query: TSimpleDataSet;
  private
    DB :TCRSQLConnection;
  public
    procedure Initialize(ADBController :TDBController);
  end;

implementation

uses DBConnection;

{$R *.dfm}

{ TDataModuleParametersEnterprise }

procedure TDataModuleSearch.Initialize(ADBController: TDBController);
begin
   DB               := ADBController.DBConnection.Connection;
   Query.Connection := DB;
end;

end.
