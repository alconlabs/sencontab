unit DMSections;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModuleSections = class(TDataModule)
    NoUse: TCRSQLConnection;
    QSections: TSimpleDataSet;
    QSectionsID_SECCION: TStringField;
    QSectionsNOMBRE: TStringField;
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

{ TDataModuleSections }

function TDataModuleSections.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModuleSections.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModuleSections.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QSections.Connection := ADBController.DBConnection.Connection;
   QSections.Open;
end;


end.


