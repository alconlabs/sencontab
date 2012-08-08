unit DMGroups;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleGroups = class(TDataModule)
    NoUse: TCRSQLConnection;
    QGroups: TSimpleDataSet;
    QGroupsGRUPO: TStringField;
    QGroupsDESCRIPCION: TStringField;
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

{ TDataModuleGroups }

function TDataModuleGroups.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleGroups.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleGroups.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QGroups.Connection := ADBController.DBConnection.Connection;
   QGroups.Open;
end;


end.


