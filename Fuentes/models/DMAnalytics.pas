unit DMAnalytics;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleAnalytics = class(TDataModule)
    NoUse: TCRSQLConnection;
    QAnalytics: TSimpleDataSet;
    QAnalyticsCUENTA: TStringField;
    QAnalyticsNOMBRE: TStringField;
    QAnalyticsID_PROYECTO: TStringField;
    QAnalyticsID_SECCION: TStringField;
    QAnalyticsID_DEPARTAMENTO: TStringField;
    QAnalyticsID_DELEGACION: TStringField;
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

{ TDataModuleAnalytics }

function TDataModuleAnalytics.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleAnalytics.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleAnalytics.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QAnalytics.Connection := ADBController.DBConnection.Connection;
   QAnalytics.Open;
end;


end.


