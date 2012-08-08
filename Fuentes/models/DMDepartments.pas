unit DMDepartments;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleDepartments = class(TDataModule)
    NoUse: TCRSQLConnection;
    QDepartments: TSimpleDataSet;
    QDepartmentsID_DEPARTAMENTO: TStringField;
    QDepartmentsNOMBRE: TStringField;
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

{ TDataModuleDepartments }

function TDataModuleDepartments.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleDepartments.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleDepartments.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QDepartments.Connection := ADBController.DBConnection.Connection;
   QDepartments.Open;
end;


end.


