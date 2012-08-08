unit DMSalespersons;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleSalespersons = class(TDataModule)
    NoUse: TCRSQLConnection;
    QSalespersons: TSimpleDataSet;
    QSalespersonsCOMERCIAL: TStringField;
    QSalespersonsNOMBRE: TStringField;
  private
    DB :TCRSQLConnection;
  public
    procedure Initialize(ADBController :TDBController);
    function  IntegrityValidate :Boolean;
    function  BussinesValidate  :Boolean;
  end;

implementation

uses DBConnection;

{$R *.dfm}

{ TDataModuleSalespersons }

function TDataModuleSalespersons.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleSalespersons.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleSalespersons.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QSalespersons.Connection := ADBController.DBConnection.Connection;
   QSalespersons.Open;
end;


end.


