unit DMTypesOfJournal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleTypesOfJournal = class(TDataModule)
    NoUse: TCRSQLConnection;
    QTypesOfJournal: TSimpleDataSet;
    QTypesOfJournalTIPODIARIO: TStringField;
    QTypesOfJournalDESCRIPCION: TStringField;
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

{ TDataModuleTypesOfJournal }

function TDataModuleTypesOfJournal.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleTypesOfJournal.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleTypesOfJournal.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QTypesOfJournal.Connection := ADBController.DBConnection.Connection;
   QTypesOfJournal.Open;
end;


end.


