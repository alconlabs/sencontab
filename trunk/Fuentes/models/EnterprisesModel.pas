unit EnterprisesModel;

interface

uses Classes, CRSQLConnection;

type
  TEnterprisesModel = class
  private
    FConnection  :TCRSQLConnection;
  protected
  public
    property Connection :TCRSQLConnection  read FConnection;
    function CreateDBFile(DatabaseName :string):Boolean;
    procedure RecordNewEnterprise(prmCD_Enterprise, prmDS_Enterprise :string);
    function CreateDBSchema(DatabaseName :string):Boolean;
    //function CheckDBSchemaExists(DatabaseName :string):Boolean;
    constructor Create(AConnection :TCRSQLConnection);
  end;

implementation
uses SysUtils, SqlExpr, HashCriptography;

constructor TEnterprisesModel.Create(AConnection: TCRSQLConnection);
begin
   FConnection := AConnection;
end;

function TEnterprisesModel.CreateDBFile(DatabaseName :string):Boolean;
var DB :TCRSQLConnection;
begin
   Result := True;
   DB := TCRSQLConnection.Create(nil);

   DB.ConnectionName := FConnection.ConnectionName; //'SQLServerConnection';
   DB.DriverName     := FConnection.Drivername;     //'SQLServer';
   DB.GetDriverFunc  := FConnection.GetDriverFunc;  //'getSQLDriverSQLServer';
   DB.LibraryName    := FConnection.LibraryName;    //'dbexpsda.dll';
   DB.LoginPrompt    := FConnection.LoginPrompt;    //False;
   DB.KeepConnection := FConnection.KeepConnection; //True;
   DB.VendorLib      := FConnection.VendorLib;      //'sqloledb.dll';
   DB.Params.Assign(FConnection.Params);
   DB.Params.Values['DataBase' ] := 'master';

   //DB.Params.Values['DriverName' ] := 'SQLServer';
   //DB.Params.Values['BlobSize'   ] := '-1'  ;
   //DB.Params.Values['EnableBCD'  ] := 'True';
   //DB.Params.Values['LongStrings'] := 'True';
   //DB.Params.Values['FetchAll'   ] := 'True';
   //
   //DB.Params.Values['HostName' ] := FConfiguration.DBConfig.HostName;
   //
   //DB.Params.Values['User_Name'] := FConfiguration.DBConfig.User_Name;
   //DB.Params.Values['Password' ] := FConfiguration.DBConfig.Password;

   { Conectamos con la base de datos Master                      }
   { Utilizando los parámetros de la base de datos que se recibe }

   try
     DB.Open;
     try
        DB.ExecuteDirect('CREATE DATABASE '+DatabaseName);
        (*,
                             '    ON (NAME     = '''+FConfiguration.DBConfig.DataBase+'_DB'',           ',
                             '        FILENAME = ''D:\'+FConfiguration.DBConfig.DataBase+'_DB.mdf'',    ',
                             '        SIZE     = 30  ,                                                  ',
                             '        FILEGROWTH = 5MB)                                                 ',
                             'LOG ON (NAME     = ''LOG'+FConfiguration.DBConfig.DataBase+'_LOG'',       ',
                             '        FILENAME = ''d:\LOG'+FConfiguration.DBConfig.DataBase+'_LOG.ldf'', ',
                             '        SIZE     =  1,                                                     ',
                             '        FILEGROWTH = 5MB  )                                                ']);
                             *)
     except
        on E: Exception do begin
           Result := False;
           //ShowErrorMessage(E.Message);
        end;
     end;
   finally
      DB.Free;
   end;
end;

function TEnterprisesModel.CreateDBSchema(DatabaseName :string):Boolean;
var DB :TCRSQLConnection;
begin
   Result := True;
   DB := TCRSQLConnection.Create(nil);

   DB.ConnectionName := FConnection.ConnectionName; //'SQLServerConnection';
   DB.DriverName     := FConnection.Drivername;     //'SQLServer';
   DB.GetDriverFunc  := FConnection.GetDriverFunc;  //'getSQLDriverSQLServer';
   DB.LibraryName    := FConnection.LibraryName;    //'dbexpsda.dll';
   DB.LoginPrompt    := FConnection.LoginPrompt;    //False;
   DB.KeepConnection := FConnection.KeepConnection; //True;
   DB.VendorLib      := FConnection.VendorLib;      //'sqloledb.dll';
   DB.Params.Assign(FConnection.Params);
   DB.Params.Values['DataBase' ] := DatabaseName;

   try
     DB.Open;
     try
    {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE SIAM(                                       '+
        '     ID_SIAM                  int           NOT NULL,    '+
        '     FECHAULTACTUALIZACION    datetime      NOT NULL,    '+
        '     ULTIMAACTUALIZACION      int           NOT NULL,    '+
        '     VERSION                  char(5)       NOT NULL,    '+
        '     CONSTRAINT PK_SIAM PRIMARY KEY CLUSTERED (ID_SIAM)  '+
        ')                                                        ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE ASIPRED(                                      '+
        '    ASIENTO        int            NOT NULL,                '+
        '    DESCRIPCION    char(40)       NOT NULL,                '+
        '    CONSTRAINT PK_ASIPRED PRIMARY KEY CLUSTERED (ASIENTO)  '+
        ')                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE LASIPRED(                                               '+
        '    ASIENTO          int            NOT NULL,                        '+
        '    APUNTE           int            NOT NULL,                        '+
        '    SUBCUENTA        varchar(10)    NULL,                            '+
        '    CONCEPTO         varchar(3)     NULL,                            '+
        '    COMENTARIO       varchar(30)    NULL,                            '+
        '    DEBEHABER        varchar(1)     NULL,                            '+
        '    IMPORTE          varchar(15)    NULL,                            '+
        '    CONTRAPARTIDA    varchar(10)    NULL,                            '+
        '    FECHAVTO         varchar(1)     NULL,                            '+
        '    CENTROCOSTE      varchar(10)    NULL,                            '+
        '    NUMEROFACTURA    varchar(1)     NULL,                            '+
        '    CONSTRAINT PK_LASIPRED PRIMARY KEY CLUSTERED (APUNTE, ASIENTO),  '+
        '    CONSTRAINT RefASIPRED25 FOREIGN KEY (ASIENTO)                    '+
        '   REFERENCES ASIPRED(ASIENTO)                                       '+
        ')                                                                    ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE PARAMETROS(                                                 '+
        '    ID_PARAMETROS                      int                 NOT NULL,     '+
        '    LONGITUD_SUBCUENTAS                int                 NULL,         '+
        '    FECHA_INICIO_APLICACION            datetime            NULL,         '+
        '    FECHA_INICIO_EJERCICIO             datetime            NULL,         '+
        '    FECHA_FIN_EJERCICIO                datetime            NULL,         '+
        '    CTO_REGULARIZACION                 char(3)             NULL,         '+
        '    SUBCUENTA_CIERRE                   varchar(10)         NULL,         '+
        '    MONEDA                             varchar(1)          NULL,         '+
        '    NOMBREFISCAL                       varchar(80)         NULL,         '+
        '    DIRECCION                          varchar(40)         NULL,         '+
        '    DIRECCION1                         varchar(40)         NULL,         '+
        '    POBLACION                          varchar(40)         NULL,         '+
        '    CODPOSTAL                          varchar(10)         NULL,         '+
        '    PROVINCIA                          char(2)             NULL,         '+
        '    NIF                                varchar(15)         NULL,         '+
        '    CONTACTO                           varchar(50)         NULL,         '+
        '    DOCCLIENTE                         varchar(100)        NULL,         '+
        '    DOCPROVEEDOR                       varchar(100)        NULL,         '+
        '    DOC347                             varchar(100)        NULL,         '+
        '    FECHABLOQUEO                       datetime            NULL,         '+
        '    CTO_APERTURA                       char(3)             NULL,         '+
        '    CTO_REGULARIZACION_ESP             char(3)             NULL,         '+
        '    FECHAAMORTIZACION                  datetime            NULL,         '+
        '    RECARGO                            char(1)             NULL,         '+
        '    CTO_APERTURA_ESP                   char(3)             NULL,         '+
        '    SCTAIVANORMAL                      varchar(10)         NULL,         '+
        '    SCTAIVAEXENTO                      varchar(10)         NULL,         '+
        '    SCTAIVAINTRA                       varchar(10)         NULL,         '+
        '    SCTAVENTAS                         varchar(10)         NULL,         '+
        '    SCTADEVOLUCION                     varchar(10)         NULL,         '+
        '    CTOIVANORMAL                       varchar(3)          NULL,         '+
        '    CTOIVAEXENTO                       varchar(3)          NULL,         '+
        '    CTOIVAINTRA                        varchar(3)          NULL,         '+
        '    CTOVENTAS                          varchar(3)          NULL,         '+
        '    CTODEVOLUCION                      varchar(3)          NULL,         '+
        '    CTOCLIENTES                        varchar(3)          NULL,         '+
        '    SCTADESCUENTO                      varchar(10)         NULL,         '+
        '    SCTACOMPRAS                        varchar(10)         NULL,         '+
        '    CTODESCUENTO                       varchar(3)          NULL,         '+
        '    CTOCOMPRAS                         varchar(3)          NULL,         '+
        '    SCTAIVAREDUCIDO                    varchar(10)         NULL,         '+
        '    CTOIVAREDUCIDO                     varchar(3)          NULL,         '+
        '    SCTAIVASUPER                       varchar(10)         NULL,         '+
        '    CTOIVASUPER                        varchar(3)          NULL,         '+
        '    CTOPROVEEDORES                     varchar(3)          NULL,         '+
        '    SCTAIVACNORMAL                     varchar(10)         NULL,         '+
        '    CTOIVACNORMAL                      varchar(3)          NULL,         '+
        '    SCTAIVACREDUCIDO                   varchar(10)         NULL,         '+
        '    CTOIVACREDUCIDO                    varchar(3)          NULL,         '+
        '    SCTAIVACSUPER                      varchar(10)         NULL,         '+
        '    CTOIVACSUPER                       varchar(3)          NULL,         '+
        '    SCTARECNORMAL                      varchar(10)         NULL,         '+
        '    CTORECNORMAL                       varchar(3)          NULL,         '+
        '    SCTARECREDUCIDO                    varchar(10)         NULL,         '+
        '    CTORECREDUCIDO                     varchar(3)          NULL,         '+
        '    SCTARECSUPER                       varchar(10)         NULL,         '+
        '    CTORECSUPER                        varchar(3)          NULL,         '+
        '    CTORECIBOVENTAS                    varchar(3)          NULL,         '+
        '    VGENERICA                          varchar(10)         NULL,         '+
        '    SUBCAJA                            varchar(10)         NULL,         '+
        '    CTOCOBROF                          varchar(3)          NULL,         '+
        '    CTONOME                            varchar(3)          NULL,         '+
        '    CTONOMT                            varchar(3)          NULL,         '+
        '    SCTANOMSUELDO                      varchar(10)         NULL,         '+
        '    SCTANOMIRPF                        varchar(10)         NULL,         '+
        '    SCTANOMPAGO                        varchar(10)         NULL,         '+
        '    SCTANOMSSE                         varchar(10)         NULL,         '+
        '    SCTANOMSST                         varchar(10)         NULL,         '+
        '    SCTANOMCARGO                       varchar(10)         NULL,         '+
        '    SCTADTOPPV                         varchar(10)         NULL,         '+
        '    SCTADTOPPC                         varchar(10)         NULL,         '+
        '    CTODTOPPV                          varchar(3)          NULL,         '+
        '    CTODTOPPC                          varchar(3)          NULL,         '+
        '    SCTARETPROF                        varchar(10)         NULL,         '+
        '    SCTARETARRE                        varchar(10)         NULL,         '+
        '    CTORETPROF                         varchar(3)          NULL,         '+
        '    CTORETARRE                         varchar(3)          NULL,         '+
        '    TANTORETPROF                       decimal(14, 3)      NULL,         '+
        '    TANTORETARRE                       decimal(14, 3)      NULL,         '+
        '    SCTAHACIVA                         varchar(10)         NULL,         '+
        '    CTOHACIVA                          varchar(3)          NULL,         '+
        '    SCTAIVACEXENTO                     varchar(10)         NULL,         '+
        '    CTOIVACEXENTO                      varchar(3)          NULL,         '+
        '    CTOPAGOF                           varchar(3)          NULL,         '+
        '    VGENERICAC                         varchar(10)         NULL,         '+
        '    TELEFONO                           varchar(16)         NULL,         '+
        '    FAX                                varchar(16)         NULL,         '+
        '    DOCIMPRIMIR                        char(1)             NULL,         '+
        '    SIGLAVIA                           char(2)             NULL,         '+
        '    NUMEROCALLE                        char(4)             NULL,         '+
        '    ESCALERA                           char(2)             NULL,         '+
        '    PISO                               char(2)             NULL,         '+
        '    PUERTA                             char(2)             NULL,         '+
        '    CCC                                varchar(23)         NULL,         '+
        '    CODADMON                           char(5)             NULL,         '+
        '    GESTIONA_CARTERA_EFECTOS           char(1)             NULL,         '+
        '    FILTRO_ASIENTOS_INICIO             char(1)             NULL,         '+
        '    INCLUIR_ABREV                      char(1)             NULL,         '+
        '    SCTAEFECTDESCONTADOS               varchar(10)         NULL,         '+
        '    SCTADEUDASDESCUENTOS               varchar(10)         NULL,         '+
        '    ASIENTOS_INICIO_INTERVALO_BQDA     int                 NULL,         '+
        '    ASIENTOS_FIN_INTERVALO_BQDA        int                 NULL,         '+
        '    MOSTRAR_FILTRO_MAYOR               char(1)             NULL,         '+
        '    CTOPROVINTRA                       char(3)             NULL,         '+
        '    ASIENTO_INICIO_INTERVALO_FILTRO    int                 NULL,         '+
        '    ASIENTO_FIN_INTERVALO_FILTRO       int                 NULL,         '+
        '    SCTAIVAINTRADEDUCIBLE              varchar(10)         NULL,         '+
        '    SCTAIVACINTRADEDUCIBLE             varchar(10)         NULL,         '+
        '    SCTAIVACINTRAREPERCUTIDO           varchar(10)         NULL,         '+
        '    SCTAGENINTRACOM                    varchar(10)         NULL,         '+
        '    ASIENTO_NOMINA_INDIVIDUAL          char(1)             NULL,         '+
        '    SCTAIVAEXENTOCEE                   varchar(10)         NULL,         '+
        '    SCTAINTERESES                      varchar(10)         NULL,         '+
        '    SCTAEXPORTACIONES                  varchar(10)         NULL,         '+
        '    BUSQUEDA_SUBCTAS                   char(1)             NULL,         '+
        '    SCTAOTRASREMUN                     varchar(10)         NULL,         '+
        '    SCTABANCO                          varchar(10)         NULL,         '+
        '    CTOCOBRO                           varchar(3)          NULL,         '+
        '    CTOPAGO                            varchar(3)          NULL,         '+
        '    SCTAEFECTOSCOMERCIALES             varchar(10)         NULL,         '+
        '    CTOEFECTOSCOMERCIALES              varchar(3)          NULL,         '+
        '    CTODEUDASDESCUENTOS                varchar(3)          NULL,         '+
        '    SCTAREMESAEFECTOS                  varchar(10)         NULL,         '+
        '    CTOREMESAEFECTOS                   varchar(3)          NULL,         '+
        '    DESCPROV_CARTERAEFECTOS            char(1)             NULL,         '+
        '    DESCCLI_CARTERAEFECTOS             char(1)             NULL,         '+
        '    TIPOEMPRESA                        char(1)             NULL,         '+
        '    FILTROSUBCTAS                      char(3)             NULL,         '+
        '    OFFICE2003                         char(1)             NULL,         '+
        '    TRATASERIE                         char(1)             NULL,         '+
        '    ACTCOMENTARIO                      char(1)             NULL,         '+
        '    CONSTRAINT PK_PARAMETROS PRIMARY KEY NONCLUSTERED (ID_PARAMETROS)    '+
        ')                                                                        ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE TITULOS(                                         '+
        '    TITULO         char(2)        NOT NULL,                   '+
        '    DESCRIPCION    char(50)       NOT NULL,                   '+
        '    RESTA1         varchar(3)     NULL,                       '+
        '    RESTA2         varchar(3)     NULL,                       '+
        '    RESTA3         varchar(3)     NULL,                       '+
        '    RESTA4         varchar(3)     NULL,                       '+
        '    RESTA5         varchar(3)     NULL,                       '+
        '    RESTA6         varchar(3)     NULL,                       '+
        '    SUMA1          varchar(3)     NULL,                       '+
        '    SUMA2          varchar(3)     NULL,                       '+
        '    SUMA3          varchar(3)     NULL,                       '+
        '    SUMA4          varchar(3)     NULL,                       '+
        '    SUMA5          varchar(3)     NULL,                       '+
        '    SUMA6          varchar(3)     NULL,                       '+
        '    SUMA7          varchar(3)     NULL,                       '+
        '    RESTA8         varchar(3)     NULL,                       '+
        '    RESTA7         varchar(3)     NULL,                       '+
        '    SUMA8          varchar(3)     NULL,                       '+
        '    CONSTRAINT PK_TITULOS PRIMARY KEY NONCLUSTERED (TITULO)   '+
        ')                                                             ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE IVAR(                                            '+
        '    TIPO           char(1)     NOT NULL,                      '+
        '    DESCRIPCION    char(35)    NOT NULL,                      '+
        '    CONSTRAINT PK_IVAR PRIMARY KEY CLUSTERED (TIPO)           '+
        ')                                                             ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE IVAS(                                            '+
        '    TIPO           char(1)     NOT NULL,                      '+
        '    DESCRIPCION    char(40)    NOT NULL,                      '+
        '    CONSTRAINT PK_IVAS PRIMARY KEY CLUSTERED (TIPO)           '+
        ')                                                             ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE NOMINAS(                                         '+
        '    ID_NOMINA          int                 NOT NULL,          '+
        '    ASIENTO            int                 NOT NULL,          '+
        '    NOMINA             decimal(14, 3)      NULL,              '+
        '    IRPF               decimal(14, 3)      NULL,              '+
        '    SSOCIAL            decimal(14, 3)      NULL,              '+
        '    NETO               decimal(14, 3)      NULL,              '+
        '    SUBCUENTA          char(10)            NULL,              '+
        '    NOMINA_EMPLEADO    char(1)             NULL,              '+
        '    CONSTRAINT PK_NOMINAS PRIMARY KEY NONCLUSTERED (ID_NOMINA)'+
        ')                                                             ');
    {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE GRUPOS(                                          '+
        '    GRUPO          char(3)     NOT NULL,                      '+
        '    DESCRIPCION    char(50)    NOT NULL,                      '+
        '    CONSTRAINT PK_GRUPOS PRIMARY KEY NONCLUSTERED (GRUPO)     '+
        ')                                                             ');
    {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE CUENTAS(                                          '+
        '    CUENTA         char(3)           NOT NULL,                 '+
        '    DESCRIPCION    char(50)          NOT NULL,                 '+
        '    GRUPO1         char(3)           NULL,                     '+
        '    GRUPO2         char(3)           NULL,                     '+
        '    TIPOCUENTA     varchar(1)        NULL,                     '+
        '    ACUDB01        decimal(14, 3)    NULL,                     '+
        '    ACUDB02        decimal(14, 3)    NULL,                     '+
        '    ACUDB03        decimal(14, 3)    NULL,                     '+
        '    ACUDB04        decimal(14, 3)    NULL,                     '+
        '    ACUDB05        decimal(14, 3)    NULL,                     '+
        '    ACUDB06        decimal(14, 3)    NULL,                     '+
        '    ACUDB07        decimal(14, 3)    NULL,                     '+
        '    ACUDB08        decimal(14, 3)    NULL,                     '+
        '    ACUDB09        decimal(14, 3)    NULL,                     '+
        '    ACUDB10        decimal(14, 3)    NULL,                     '+
        '    ACUDB11        decimal(14, 3)    NULL,                     '+
        '    ACUDB12        decimal(14, 3)    NULL,                     '+
        '    ACUHB01        decimal(14, 3)    NULL,                     '+
        '    ACUHB02        decimal(14, 3)    NULL,                     '+
        '    ACUHB03        decimal(14, 3)    NULL,                     '+
        '    ACUHB04        decimal(14, 3)    NULL,                     '+
        '    ACUHB05        decimal(14, 3)    NULL,                     '+
        '    ACUHB06        decimal(14, 3)    NULL,                     '+
        '    ACUHB07        decimal(14, 3)    NULL,                     '+
        '    ACUHB08        decimal(14, 3)    NULL,                     '+
        '    ACUHB09        decimal(14, 3)    NULL,                     '+
        '    ACUHB10        decimal(14, 3)    NULL,                     '+
        '    ACUHB11        decimal(14, 3)    NULL,                     '+
        '    ACUHB12        decimal(14, 3)    NULL,                     '+
        '    ANTDB01        decimal(14, 3)    NULL,                     '+
        '    ANTDB02        decimal(14, 3)    NULL,                     '+
        '    ANTDB03        decimal(14, 3)    NULL,                     '+
        '    ANTDB04        decimal(14, 3)    NULL,                     '+
        '    ANTDB05        decimal(14, 3)    NULL,                     '+
        '    ANTDB06        decimal(14, 3)    NULL,                     '+
        '    ANTDB07        decimal(14, 3)    NULL,                     '+
        '    ANTDB08        decimal(14, 3)    NULL,                     '+
        '    ANTDB09        decimal(14, 3)    NULL,                     '+
        '    ANTDB10        decimal(14, 3)    NULL,                     '+
        '    ANTDB11        decimal(14, 3)    NULL,                     '+
        '    ANTDB12        decimal(14, 3)    NULL,                     '+
        '    ANTHB01        decimal(14, 3)    NULL,                     '+
        '    ANTHB02        decimal(14, 3)    NULL,                     '+
        '    ANTHB03        decimal(14, 3)    NULL,                     '+
        '    ANTHB04        decimal(14, 3)    NULL,                     '+
        '    ANTHB05        decimal(14, 3)    NULL,                     '+
        '    ANTHB06        decimal(14, 3)    NULL,                     '+
        '    ANTHB07        decimal(14, 3)    NULL,                     '+
        '    ANTHB08        decimal(14, 3)    NULL,                     '+
        '    ANTHB09        decimal(14, 3)    NULL,                     '+
        '    ANTHB10        decimal(14, 3)    NULL,                     '+
        '    ANTHB11        decimal(14, 3)    NULL,                     '+
        '    ANTHB12        decimal(14, 3)    NULL,                     '+
        '    ANTHB          decimal(14, 3)    NULL,                     '+
        '    ANTDB          decimal(14, 3)    NULL,                     '+
        '    SUMADB         decimal(14, 3)    NULL,                     '+
        '    SUMAHB         decimal(14, 3)    NULL,                     '+
        '    CONSTRAINT PK_CUENTAS PRIMARY KEY NONCLUSTERED (CUENTA),   '+
        '    CONSTRAINT FK_CUENTAS_GRUPO1 FOREIGN KEY (GRUPO1)          '+
        '    REFERENCES GRUPOS(GRUPO),                                  '+
        '    CONSTRAINT FK_CUENTAS_GRUPO2 FOREIGN KEY (GRUPO2)          '+
        '    REFERENCES GRUPOS(GRUPO)                                   '+
        ')                                                              ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE FORMAS(                                            '+
        '    FORMAPAGO    char(3)        NOT NULL,                       '+
        '    DESCRIBE     char(40)       NOT NULL,                       '+
        '    CLASE        char(1)        NULL,                           '+
        '    INTERVALO    int            NULL,                           '+
        '    NUMVENCI     int            NULL,                           '+
        '    OBSOLETO     char(1)        NULL,                           '+
        '    CONSTRAINT PK_FORMAS PRIMARY KEY NONCLUSTERED (FORMAPAGO)   '+
        ')                                                               ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE PAISES(                                           '+
        '    PAIS      char(2)        NOT NULL,                         '+
        '    NOMBRE    char(30)       NOT NULL,                         '+
        '    CONSTRAINT PK_PAISES PRIMARY KEY NONCLUSTERED (PAIS)       '+
        ')                                                              ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE PROVINCIAS(                                              '+
        '    PROVINCIA    char(2)        NOT NULL,                             '+
        '    NOMBRE       char(25)       NOT NULL,                             '+
        '    CODIGO       char(2)        NOT NULL,                             '+
        '    CONSTRAINT PK_PROVINCIAS PRIMARY KEY NONCLUSTERED (PROVINCIA)     '+
        ')                                                                     ');
   {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE SUBCTAS(                                                 '+
        '    ACUDB01             decimal(14, 3)      NULL,                     '+
        '    ACUDB02             decimal(14, 3)      NULL,                     '+
        '    ACUDB03             decimal(14, 3)      NULL,                     '+
        '    ACUDB04             decimal(14, 3)      NULL,                     '+
        '    ACUDB05             decimal(14, 3)      NULL,                     '+
        '    ACUDB06             decimal(14, 3)      NULL,                     '+
        '    ACUDB07             decimal(14, 3)      NULL,                     '+
        '    ACUDB08             decimal(14, 3)      NULL,                     '+
        '    ACUDB09             decimal(14, 3)      NULL,                     '+
        '    ACUDB10             decimal(14, 3)      NULL,                     '+
        '    ACUDB11             decimal(14, 3)      NULL,                     '+
        '    ACUDB12             decimal(14, 3)      NULL,                     '+
        '    ACUHB01             decimal(14, 3)      NULL,                     '+
        '    ACUHB02             decimal(14, 3)      NULL,                     '+
        '    ACUHB03             decimal(14, 3)      NULL,                     '+
        '    ACUHB04             decimal(14, 3)      NULL,                     '+
        '    ACUHB05             decimal(14, 3)      NULL,                     '+
        '    ACUHB06             decimal(14, 3)      NULL,                     '+
        '    ACUHB07             decimal(14, 3)      NULL,                     '+
        '    ACUHB08             decimal(14, 3)      NULL,                     '+
        '    ACUHB09             decimal(14, 3)      NULL,                     '+
        '    ACUHB10             decimal(14, 3)      NULL,                     '+
        '    ACUHB11             decimal(14, 3)      NULL,                     '+
        '    ACUHB12             decimal(14, 3)      NULL,                     '+
        '    ANTDB               decimal(14, 3)      NULL,                     '+
        '    ANTDB01             decimal(14, 3)      NULL,                     '+
        '    ANTDB02             decimal(14, 3)      NULL,                     '+
        '    ANTDB03             decimal(14, 3)      NULL,                     '+
        '    ANTDB04             decimal(14, 3)      NULL,                     '+
        '    ANTDB05             decimal(14, 3)      NULL,                     '+
        '    ANTDB06             decimal(14, 3)      NULL,                     '+
        '    ANTDB07             decimal(14, 3)      NULL,                     '+
        '    ANTDB08             decimal(14, 3)      NULL,                     '+
        '    ANTDB09             decimal(14, 3)      NULL,                     '+
        '    ANTDB10             decimal(14, 3)      NULL,                     '+
        '    ANTDB11             decimal(14, 3)      NULL,                     '+
        '    ANTDB12             decimal(14, 3)      NULL,                     '+
        '    ANTHB               decimal(14, 3)      NULL,                     '+
        '    ANTHB01             decimal(14, 3)      NULL,                     '+
        '    ANTHB02             decimal(14, 3)      NULL,                     '+
        '    ANTHB03             decimal(14, 3)      NULL,                     '+
        '    ANTHB04             decimal(14, 3)      NULL,                     '+
        '    ANTHB05             decimal(14, 3)      NULL,                     '+
        '    ANTHB06             decimal(14, 3)      NULL,                     '+
        '    ANTHB07             decimal(14, 3)      NULL,                     '+
        '    ANTHB08             decimal(14, 3)      NULL,                     '+
        '    ANTHB09             decimal(14, 3)      NULL,                     '+
        '    ANTHB10             decimal(14, 3)      NULL,                     '+
        '    ANTHB11             decimal(14, 3)      NULL,                     '+
        '    ANTHB12             decimal(14, 3)      NULL,                     '+
        '    ARRENDADOR          varchar(1)          NULL,                     '+
        '    CONTRAPARTIDA       varchar(10)         NULL,                     '+
        '    DESCRIPCION         varchar(80)         NULL,                     '+
        '    DIRECCION           varchar(35)         NULL,                     '+
        '    FAX                 varchar(16)         NULL,                     '+
        '    IVA                 decimal(14, 3)      NULL,                     '+
        '    PROFESIONAL         varchar(1)          NULL,                     '+
        '    RECARGO             decimal(14, 3)      NULL,                     '+
        '    SUBCUENTA           varchar(10)         NOT NULL,                 '+
        '    SUMADB              decimal(14, 3)      NULL,                     '+
        '    SUMAHB              decimal(14, 3)      NULL,                     '+
        '    TELEFONO            varchar(16)         NULL,                     '+
        '    TIPOIVA             varchar(1)          NULL,                     '+
        '    DIRECCION1          varchar(35)         NULL,                     '+
        '    NIF                 varchar(20)         NULL,                     '+
        '    CODPOSTAL           varchar(10)         NULL,                     '+
        '    POBLACION           varchar(60)         NULL,                     '+
        '    PROVINCIA           char(2)             NULL,                     '+
        '    PAIS                char(2)             NULL,                     '+
        '    NUMERO              varchar(10)         NULL,                     '+
        '    FORMAPAGO           char(3)             NULL,                     '+
        '    DIAPAGO1            int                 NULL,                     '+
        '    DIAPAGO2            int                 NULL,                     '+
        '    PRES01              decimal(14, 3)      NULL,                     '+
        '    PRES02              decimal(14, 3)      NULL,                     '+
        '    PRES03              decimal(14, 3)      NULL,                     '+
        '    PRES04              decimal(14, 3)      NULL,                     '+
        '    PRES05              decimal(14, 3)      NULL,                     '+
        '    PRES06              decimal(14, 3)      NULL,                     '+
        '    PRES07              decimal(14, 3)      NULL,                     '+
        '    PRES08              decimal(14, 3)      NULL,                     '+
        '    PRES09              decimal(14, 3)      NULL,                     '+
        '    PRES10              decimal(14, 3)      NULL,                     '+
        '    PRES11              decimal(14, 3)      NULL,                     '+
        '    PRES12              decimal(14, 3)      NULL,                     '+
        '    PRESTOT             decimal(14, 3)      NULL,                     '+
        '    OBSOLETO            char(1)             NULL,                     '+
        '    DIAPAGO3            int                 NULL,                     '+
        '    ABREVIATURA         varchar(10)         NULL,                     '+
        '    INTRACOMUNITARIO    char(1)             NULL,                     '+
        '    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED (SUBCUENTA),             '+
        '    CONSTRAINT FK_SUBCTAS_FORMAPAGO FOREIGN KEY (FORMAPAGO)           '+
        '    REFERENCES FORMAS(FORMAPAGO),                                     '+
        '    CONSTRAINT FK_SUBCTAS_PAIS FOREIGN KEY (PAIS)                     '+
        '    REFERENCES PAISES(PAIS),                                          '+
        '    CONSTRAINT FK_SUBCTAS_PROVINCIA FOREIGN KEY (PROVINCIA)           '+
        '    REFERENCES PROVINCIAS(PROVINCIA),                                 '+
        '    CONSTRAINT FK_SUBCTAS_CONTRAPARTIDA FOREIGN KEY (CONTRAPARTIDA)   '+
        '    REFERENCES SUBCTAS(SUBCUENTA)                                     '+
        ')                                                                     ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE AMORTIZA(                                                '+
        '    SUBCUENTA      varchar(10)         NOT NULL,                      '+
        '    CENTROCOSTE    varchar(10)         NULL,                          '+
        '    FCOMPRA        datetime            NULL,                          '+
        '    FINICIO        datetime            NULL,                          '+
        '    FULTAMOR       datetime            NULL,                          '+
        '    FFINAMOR       datetime            NULL,                          '+
        '    FBAJA          datetime            NULL,                          '+
        '    SUBGASTO       varchar(10)         NULL,                          '+
        '    SUBAMOR        varchar(10)         NULL,                          '+
        '    PERIODO        varchar(1)          NULL,                          '+
        '    ANUAL          decimal(14, 3)      NULL,                          '+
        '    PROVEEDOR      varchar(10)         NULL,                          '+
        '    FACTURA        varchar(15)         NULL,                          '+
        '    VCOMPRA        decimal(14, 3)      NULL,                          '+
        '    VRESIDUAL      decimal(14, 3)      NULL,                          '+
        '    VAMOR          decimal(14, 3)      NULL,                          '+
        '    VEJPINICIO     decimal(14, 3)      NULL,                          '+
        '    VEJAINICIO     decimal(14, 3)      NULL,                          '+
        '    VEJPAMOR       decimal(14, 3)      NULL,                          '+
        '    VEJAAMOR       decimal(14, 3)      NULL,                          '+
        '    CLASE          decimal(14, 3)      NULL,                          '+
        '    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (SUBCUENTA),              '+
        '    CONSTRAINT FK_AMORTIZA_SUBCUENTA FOREIGN KEY (SUBCUENTA)          '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                    '+
        '    CONSTRAINT FK_AMORTIZA_SUBAMOR FOREIGN KEY (SUBAMOR)              '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                    '+
        '    CONSTRAINT FK_AMORTIZA_SUBGASTO FOREIGN KEY (SUBGASTO)            '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                    '+
        '    CONSTRAINT FK_AMORTIZA_PROVEEDOR FOREIGN KEY (PROVEEDOR)          '+
        '    REFERENCES SUBCTAS(SUBCUENTA)                                     '+
        ')                                                                     ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE CONCEPTOS(                                                  '+
        '    ID_CONCEPTOS        char(3)        NOT NULL,                         '+
        '    DESCRIPCION         char(30)       NOT NULL,                         '+
        '    TIPOCONTABILIDAD    char(1)        NULL,                             '+
        '    TIPOCONCEPTO        char(1)        NULL,                             '+
        '    OBSOLETO            char(1)        NULL,                             '+
        '    SUBCUENTA           varchar(10)    NULL,                             '+
        '    CONTRAPARTIDA       varchar(10)    NULL,                             '+
        '    CONSTRAINT PK_CONCEPTOS PRIMARY KEY NONCLUSTERED (ID_CONCEPTOS),     '+
        '    CONSTRAINT FK_CONCEPTOS_CONTRAPARTIDA FOREIGN KEY (CONTRAPARTIDA)    '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                       '+
        '    CONSTRAINT FK_CONCEPTOS_SUBCUENTA FOREIGN KEY (SUBCUENTA)            '+
        '    REFERENCES SUBCTAS(SUBCUENTA)                                        '+
        ')                                                                        ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE COMERCIALES(                                                 '+
        '    COMERCIAL    char(10)    NOT NULL,                                    '+
        '    NOMBRE       char(50)    NOT NULL,                                    '+
        '    CONSTRAINT PK_COMERCIALES PRIMARY KEY NONCLUSTERED (COMERCIAL)        '+
        ')                                                                         ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE TIPODIARIO(                                                   '+
        '    TIPODIARIO     char(2)        NOT NULL,                                '+
        '    DESCRIPCION    char(30)       NOT NULL,                                '+
        '    CONSTRAINT PK_TIPODIARIO PRIMARY KEY NONCLUSTERED (TIPODIARIO)         '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE DELEGACION(                                                   '+
        '    ID_DELEGACION    char(10)    NOT NULL,                                 '+
        '    NOMBRE           char(50)    NOT NULL,                                 '+
        '    CONSTRAINT PK_DELEGACION PRIMARY KEY NONCLUSTERED (ID_DELEGACION)      '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE DEPARTAMENTO(                                                 '+
        '    ID_DEPARTAMENTO    char(10)    NOT NULL,                               '+
        '    NOMBRE             char(50)    NOT NULL,                               '+
        '    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY NONCLUSTERED (ID_DEPARTAMENTO)  '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE SECCION(                                                      '+
        '    ID_SECCION    char(10)    NOT NULL,                                    '+
        '    NOMBRE        char(50)    NOT NULL,                                    '+
        '    CONSTRAINT PK_SECCION PRIMARY KEY NONCLUSTERED (ID_SECCION)            '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE PROYECTO(                                                     '+
        '    ID_PROYECTO    char(10)    NOT NULL,                                   '+
        '    NOMBRE         char(50)    NOT NULL,                                   '+
        '    CONSTRAINT PK_PROYECTO PRIMARY KEY NONCLUSTERED (ID_PROYECTO)          '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE ANALITICAS(                                                   '+
        '    CUENTA             char(10)    NOT NULL,                               '+
        '    NOMBRE             char(50)    NOT NULL,                               '+
        '    ID_PROYECTO        char(10)    NULL,                                   '+
        '    ID_SECCION         char(10)    NULL,                                   '+
        '    ID_DEPARTAMENTO    char(10)    NULL,                                   '+
        '    ID_DELEGACION      char(10)    NULL,                                   '+
        '    CONSTRAINT PK_ANALITICAS PRIMARY KEY NONCLUSTERED (CUENTA),            '+
        '    CONSTRAINT FK_ANALITICAS_DELEGACION FOREIGN KEY (ID_DELEGACION)        '+
        '    REFERENCES DELEGACION(ID_DELEGACION),                                  '+
        '    CONSTRAINT FK_ANALITICAS_DEPARTAMENTO FOREIGN KEY (ID_DEPARTAMENTO)    '+
        '    REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO),                              '+
        '    CONSTRAINT FK_ANALITICAS_PROYECTO FOREIGN KEY (ID_PROYECTO)            '+
        '    REFERENCES PROYECTO(ID_PROYECTO),                                      '+
        '    CONSTRAINT FK_ANALITICAS_SECCION FOREIGN KEY (ID_SECCION)              '+
        '    REFERENCES SECCION(ID_SECCION)                                         '+
        ')                                                                          ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE CARTERAEFECTOS(                                                   '+
        '    ID_CARTERAEFECTOS    int                 NOT NULL,                         '+
        '    SUBCUENTA            varchar(10)         NULL,                             '+
        '    SITUACION            char(1)             NULL,                             '+
        '    SUBCTABANCO          varchar(10)         NULL,                             '+
        '    CONCEPTO             varchar(50)         NULL,                             '+
        '    FEMISION             datetime            NULL,                             '+
        '    FASIENTO             datetime            NULL,                             '+
        '    IMPORTE              decimal(14, 3)      NULL,                             '+
        '    FACTCLIENT           varchar(10)         NULL,                             '+
        '    FACTPROVEEDOR        varchar(15)         NULL,                             '+
        '    FVENCIMIENTO         datetime            NULL,                             '+
        '    COMERCIAL            char(10)            NULL,                             '+
        '    IMPCOMISION          decimal(14, 3)      NULL,                             '+
        '    ASIENTORIESGO        int                 NULL,                             '+
        '    EJERCICIO            int                 NULL,                             '+
        '    SERIE                varchar(5)          NULL,                             '+
        '    CONSTRAINT PK_CARTERAEFECTOS PRIMARY KEY NONCLUSTERED (ID_CARTERAEFECTOS), '+
        '    CONSTRAINT FK_CARTERAEFECTOS_COMERCIAL FOREIGN KEY (COMERCIAL)             '+
        '    REFERENCES COMERCIALES(COMERCIAL),                                         '+
        '    CONSTRAINT FK_CARTERAEFECTOS_SUBCTABAN FOREIGN KEY (SUBCTABANCO)           '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                             '+
        '    CONSTRAINT FK_CARTERAEFECTOS_SUBCUENTA FOREIGN KEY (SUBCUENTA)             '+
        '    REFERENCES SUBCTAS(SUBCUENTA)                                              '+
        ')                                                                              ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE DIARIO(                                                  '+
        '    ID_DIARIO           int                 NOT NULL,                 '+
        '    APUNTE              int                 NULL,                     '+
        '    ASIENTO             int                 NULL,                     '+
        '    BASEIMPONIBLE       decimal(14, 3)      NULL,                     '+
        '    COMENTARIO          varchar(40)         NULL,                     '+
        '    CONTRAPARTIDA       varchar(10)         NULL,                     '+
        '    DEBEHABER           char(1)             NULL,                     '+
        '    FECHA               datetime            NULL,                     '+
        '    IMPORTE             decimal(14, 3)      NULL,                     '+
        '    IVA                 decimal(14, 3)      NULL,                     '+
        '    NIF                 varchar(15)         NULL,                     '+
        '    MONEDA              char(1)             NULL,                     '+
        '    NUMEROFACTURA       varchar(10)         NULL,                     '+
        '    RECARGO             decimal(14, 3)      NULL,                     '+
        '    SUBCUENTA           varchar(10)         NOT NULL,                 '+
        '    PUNTEO              char(1)             NULL,                     '+
        '    ASIENTOPUNTEO       int                 NULL,                     '+
        '    PUNTEOIVA           char(1)             NULL,                     '+
        '    ID_CONCEPTOS        char(3)             NOT NULL,                 '+
        '    TIPODIARIO          char(2)             NULL,                     '+
        '    CUENTA_ANALITICA    char(10)            NULL,                     '+
        '    CUOTAIVA            decimal(14, 3)      NULL,                     '+
        '    CUOTARECARGO        decimal(14, 3)      NULL,                     '+
        '    TIPOASIENTO         int                 NULL,                     '+
        '    ASIENTONOMINA       int                 NULL,                     '+
        '    EJERCICIO           int                 NULL,                     '+
        '    SERIE               varchar(5)          NULL,                     '+
        '    CONSTRAINT PK_DIARIO PRIMARY KEY NONCLUSTERED (ID_DIARIO),        '+
        '    CONSTRAINT FK_DIARIO_ANALITICA FOREIGN KEY (CUENTA_ANALITICA)     '+
        '    REFERENCES ANALITICAS(CUENTA),                                    '+
        '    CONSTRAINT FK_DIARIO FOREIGN KEY (ID_CONCEPTOS)                   '+
        '    REFERENCES CONCEPTOS(ID_CONCEPTOS),                               '+
        '    CONSTRAINT FK_DIARIO_CONTRAPARTIDA FOREIGN KEY (CONTRAPARTIDA)    '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                    '+
        '    CONSTRAINT FK_DIARIO_SUBCUENTA FOREIGN KEY (SUBCUENTA)            '+
        '    REFERENCES SUBCTAS(SUBCUENTA),                                    '+
        '    CONSTRAINT FK_DIARIO_TIPODIARIO FOREIGN KEY (TIPODIARIO)          '+
        '    REFERENCES TIPODIARIO(TIPODIARIO)                                 '+
        ')                                                                     ');
     {***********************************************************************************}


     except
        on E: Exception do begin
           Result := False;
           //ShowErrorMessage(E.Message);
        end;
     end;
   finally
      DB.Free;
   end;
end;

procedure TEnterprisesModel.RecordNewEnterprise(prmCD_Enterprise, prmDS_Enterprise:string);
var Q :TSQLQuery;
begin
   { Comprobamos}
   Q := FConnection.CreateQuery(
        ['INSERT INTO ENTERPRISES(   ',
         '        CD_ENTERPRISE,     ', //CHAR(12)       NOT NULL,
         '        DS_ENTERPRISE,     ', //varchar(80)    NOT NULL,
         '        CLOSED       ,     ', //char(1)        NOT NULL,
         '        BLOCKED          ) ', //char(1)        NOT NULL,
         'VALUES (:prmCD_ENTERPRISE, ',
         '        :prmDS_ENTERPRISE, ',
         '        ''F''            , ',
         '        ''F''            ) ']);
   Q.ParamByName('prmCD_ENTERPRISE').AsString := prmCD_Enterprise;
   Q.ParamByName('prmDS_ENTERPRISE').AsString := prmDS_Enterprise;
   try     Q.ExecSQL;
   finally Q.Free;
   end;
end;

end.
