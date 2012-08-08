unit DMDelegations;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleDelegations = class(TDataModule)
    NoUse: TCRSQLConnection;
    QDelegations: TSimpleDataSet;
    QDelegationsID_DELEGACION: TStringField;
    QDelegationsNOMBRE: TStringField;
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

{ TDataModuleDelegations }

function TDataModuleDelegations.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleDelegations.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleDelegations.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QDelegations.Connection := ADBController.DBConnection.Connection;
   QDelegations.Open;
end;


end.


