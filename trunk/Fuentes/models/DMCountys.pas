unit DMCountys;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleCountys = class(TDataModule)
    NoUse: TCRSQLConnection;
    QCountys: TSimpleDataSet;
    QCountysPROVINCIA: TStringField;
    QCountysNOMBRE: TStringField;
    QCountysCODIGO: TStringField;
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

{ TDataModuleProjects }

function TDataModuleCountys.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleCountys.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleCountys.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QCountys.Connection := ADBController.DBConnection.Connection;
   QCountys.Open;
end;


end.


