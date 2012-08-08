unit DMStates;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleStates = class(TDataModule)
    NoUse: TCRSQLConnection;
    QStates: TSimpleDataSet;
    QStatesPAIS: TStringField;
    QStatesNOMBRE: TStringField;
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

{ TDataModuleStates }

function TDataModuleStates.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleStates.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleStates.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QStates.Connection := ADBController.DBConnection.Connection;
   QStates.Open;
end;


end.


