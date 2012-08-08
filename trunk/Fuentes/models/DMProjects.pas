unit DMProjects;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleProjects = class(TDataModule)
    NoUse: TCRSQLConnection;
    QProjects: TSimpleDataSet;
    QProjectsID_PROYECTO: TStringField;
    QProjectsNOMBRE: TStringField;
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

function TDataModuleProjects.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleProjects.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleProjects.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QProjects.Connection := ADBController.DBConnection.Connection;
   QProjects.Open;
end;


end.


