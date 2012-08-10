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
    LDelegacion: TSimpleDataSet;
    LDepartamento: TSimpleDataSet;
    LSeccion: TSimpleDataSet;
    LProyecto: TSimpleDataSet;
    LDelegacionID_DELEGACION: TStringField;
    LDelegacionNOMBRE: TStringField;
    LDepartamentoID_DEPARTAMENTO: TStringField;
    LDepartamentoNOMBRE: TStringField;
    LSeccionID_SECCION: TStringField;
    LSeccionNOMBRE: TStringField;
    QAnalyticsDS_PROYECTO: TStringField;
    QAnalyticsDS_SECCION: TStringField;
    QAnalyticsDS_DEPARTAMENTO: TStringField;
    QAnalyticsDS_DELEGACION: TStringField;
    LProyectoID_PROYECTO: TStringField;
    LProyectoNOMBRE: TStringField;
    procedure QAnalyticsCalcFields(DataSet: TDataSet);
  private
    DB :TCRSQLConnection;
    function GetDSDelegacion (prmID_DELEGACION   :string):string;
    function GetDSDepartament(prmID_DEPARTAMENTO :string):string;
    function GetDSSeccion    (prmID_SECCION      :string):string;
    function GetDSProyecto   (prmID_PROYECTO     :string):string;
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

   LDepartamento.Connection := ADBController.DBConnection.Connection;
   LDepartamento.Open;

   LDelegacion.Connection := ADBController.DBConnection.Connection;
   LDelegacion.Open;

   LSeccion.Connection := ADBController.DBConnection.Connection;
   LSeccion.Open;

   LProyecto.Connection := ADBController.DBConnection.Connection;
   LProyecto.Open;
end;


procedure TDataModuleAnalytics.QAnalyticsCalcFields(DataSet: TDataSet);
begin
   QAnalyticsDS_DELEGACION.AsString   := GetDSDelegacion (QAnalyticsID_DELEGACION.AsString);
   QAnalyticsDS_DEPARTAMENTO.AsString := GetDSDepartament(QAnalyticsID_DEPARTAMENTO.AsString);
   QAnalyticsDS_SECCION.AsString      := GetDSSeccion    (QAnalyticsID_SECCION.AsString);
   QAnalyticsDS_PROYECTO.AsString     := GetDSProyecto   (QAnalyticsID_PROYECTO.AsString);
end;

function TDataModuleAnalytics.GetDSDelegacion(prmID_DELEGACION: string): string;
var Q :TSQLQuery;
begin
   Q := TSQLQuery.Create(nil);
   try
      Q.SQLConnection := DB;
      Q.SQL.Add('SELECT NOMBRE                            ');
      Q.SQL.Add('FROM   DELEGACION                        ');
      Q.SQL.Add('WHERE  ID_DELEGACION = :prmID_DELEGACION ');
      Q.ParamCheck := True;
      Q.ParamByName('prmID_DELEGACION').AsString := prmID_DELEGACION;
      Q.Open;
      Result := Q.FieldByName('NOMBRE').AsString;
   finally
      Q.Free;
   end;
end;

function TDataModuleAnalytics.GetDSDepartament(prmID_DEPARTAMENTO: string): string;
var Q :TSQLQuery;
begin
   Q := TSQLQuery.Create(nil);
   try
      Q.SQLConnection := DB;
      Q.SQL.Add('SELECT NOMBRE                                ');
      Q.SQL.Add('FROM   DEPARTAMENTO                          ');
      Q.SQL.Add('WHERE  ID_DEPARTAMENTO = :prmID_DEPARTAMENTO ');
      Q.ParamCheck := True;
      Q.ParamByName('prmID_DEPARTAMENTO').AsString := prmID_DEPARTAMENTO;
      Q.Open;
      Result := Q.FieldByName('NOMBRE').AsString;
   finally
      Q.Free;
   end;
end;

function TDataModuleAnalytics.GetDSSeccion(prmID_SECCION: string): string;
var Q :TSQLQuery;
begin
   Q := TSQLQuery.Create(nil);
   try
      Q.SQLConnection := DB;
      Q.SQL.Add('SELECT NOMBRE                      ');
      Q.SQL.Add('FROM   SECCION                     ');
      Q.SQL.Add('WHERE  ID_SECCION = :prmID_SECCION ');
      Q.ParamCheck := True;
      Q.ParamByName('prmID_SECCION').AsString := prmID_SECCION;
      Q.Open;
      Result := Q.FieldByName('NOMBRE').AsString;
   finally
      Q.Free;
   end;
end;

function TDataModuleAnalytics.GetDSProyecto(prmID_PROYECTO: string): string;
var Q :TSQLQuery;
begin
   Q := TSQLQuery.Create(nil);
   try
      Q.SQLConnection := DB;
      Q.SQL.Add('SELECT NOMBRE                        ');
      Q.SQL.Add('FROM   PROYECTO                      ');
      Q.SQL.Add('WHERE  ID_PROYECTO = :prmID_PROYECTO ');
      Q.ParamCheck := True;
      Q.ParamByName('prmID_PROYECTO').AsString := prmID_PROYECTO;
      Q.Open;
      Result := Q.FieldByName('NOMBRE').AsString;
   finally
      Q.Free;
   end;
end;

end.


