unit DMPaymentMethods;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, CRSQLConnection, DBClient, SimpleDS,
  DBController, FMTBcd;

type
  TDataModulePaymentMethods = class(TDataModule)
    NoUse: TCRSQLConnection;
    QPaymentMethods: TSimpleDataSet;
    QPaymentMethodsFORMAPAGO: TStringField;
    QPaymentMethodsDESCRIBE: TStringField;
    QPaymentMethodsCLASE: TStringField;
    QPaymentMethodsINTERVALO: TIntegerField;
    QPaymentMethodsNUMVENCI: TIntegerField;
    QPaymentMethodsOBSOLETO: TStringField;
    QPaymentMethodsUNIDADES: TStringField;
    procedure QPaymentMethodsCalcFields(DataSet: TDataSet);
    procedure QPaymentMethodsNewRecord(DataSet: TDataSet);
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

{ TDataModulePaymentMethods }

function TDataModulePaymentMethods.BussinesValidate: Boolean;
begin
   Result := True;
end;

function TDataModulePaymentMethods.IntegrityValidate: Boolean;
begin
   Result := True;
end;

procedure TDataModulePaymentMethods.Initialize(ADBController: TDBController);
begin
   DB := ADBController.DBConnection.Connection;

   QPaymentMethods.Connection := ADBController.DBConnection.Connection;
   QPaymentMethods.Open;
end;


procedure TDataModulePaymentMethods.QPaymentMethodsCalcFields(DataSet: TDataSet);
begin
   if QPaymentMethodsCLASE.AsString = 'D' then begin
      QPaymentMethodsUNIDADES.AsString := 'DÍAS';
   end
   else begin
      QPaymentMethodsUNIDADES.AsString := 'MESES';
   end;
end;

procedure TDataModulePaymentMethods.QPaymentMethodsNewRecord(DataSet: TDataSet);
begin
   QPaymentMethodsCLASE.AsString    := 'D';
   QPaymentMethodsOBSOLETO.AsString := 'N';
end;

end.


