unit DumpData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBTableSet, IBDatabase, DBXpress,
  SqlExpr, FMTBcd, IBTable, Gauges, CRSQLConnection, DBClient, SimpleDS;

type
  TFormDumpData = class(TForm)
    BtnSIAM: TButton;
    BtnASIPRED: TButton;
    BtnLASIPRED: TButton;
    BtnPARAMETROS: TButton;
    BtnTITULOS: TButton;
    BtnIVAR: TButton;
    BtnIVAS: TButton;
    BtnNOMINAS: TButton;
    BtnFORMAS: TButton;
    BtnPAISES: TButton;
    BtnPROVINCIAS: TButton;
    BtnSUBCTAS: TButton;
    BtnAMORTIZA: TButton;
    BtnCONCEPTOS: TButton;
    BtnCOMERCIALES: TButton;
    BtnTIPODIARIO: TButton;
    BtnDELEGACION: TButton;
    BtnDEPARTAMENTO: TButton;
    BtnSECCION: TButton;
    BtnPROYECTO: TButton;
    BtnANALITICAS: TButton;
    BtnCARTERAEFECTOS: TButton;
    BtnDIARIO: TButton;
    Interbase: TIBDatabase;
    Transaction: TIBTransaction;
    SQLServer: TCRSQLConnection;
    EditDatabaseName: TEdit;
    Label1: TLabel;
    BtnConnectSQLServer: TButton;
    BtnConnectInterbase: TButton;
    LabelInterbase: TLabel;
    LabelSQLServer: TLabel;
    Origin_SIAM: TIBTable;
    Origin_SIAMID_SIAM: TIntegerField;
    Origin_SIAMFECHAULTACTUALIZACION: TDateTimeField;
    Origin_SIAMULTIMAACTUALIZACION: TIntegerField;
    Origin_SIAMVERSION: TIBStringField;
    Origin_ASIPRED: TIBTable;
    Origin_LASIPRED: TIBTable;
    Origin_PARAMETROS: TIBTable;
    Origin_TITULOS: TIBTable;
    Origin_IVAR: TIBTable;
    Origin_IVAS: TIBTable;
    Origin_NOMINAS: TIBTable;
    Origin_FORMAS: TIBTable;
    Origin_PAISES: TIBTable;
    Origin_PROVINCIAS: TIBTable;
    Origin_SUBCTAS: TIBTable;
    Origin_AMORTIZA: TIBTable;
    Origin_CONCEPTOS: TIBTable;
    Origin_COMERCIALES: TIBTable;
    Origin_TIPODIARIO: TIBTable;
    Origin_DELEGACION: TIBTable;
    Origin_DEPARTAMENTO: TIBTable;
    Origin_SECCION: TIBTable;
    Origin_PROYECTO: TIBTable;
    Origin_ANALITICAS: TIBTable;
    Origin_CARTERAEFECTOS: TIBTable;
    Origin_DIARIO: TIBTable;
    Target_ASIPRED: TSimpleDataSet;
    BtnAll: TButton;
    Target_LASIPRED: TSimpleDataSet;
    Target_PARAMETROS: TSimpleDataSet;
    Target_TITULOS: TSimpleDataSet;
    Target_IVAR: TSimpleDataSet;
    Target_IVAS: TSimpleDataSet;
    Target_NOMINAS: TSimpleDataSet;
    Target_FORMAS: TSimpleDataSet;
    Target_PAISES: TSimpleDataSet;
    Target_PROVINCIAS: TSimpleDataSet;
    Target_SUBCTAS: TSimpleDataSet;
    Target_AMORTIZA: TSimpleDataSet;
    Target_CONCEPTOS: TSimpleDataSet;
    Target_COMERCIALES: TSimpleDataSet;
    Target_TIPODIARIO: TSimpleDataSet;
    Target_DELEGACION: TSimpleDataSet;
    Target_DEPARTAMENTO: TSimpleDataSet;
    Target_SECCION: TSimpleDataSet;
    Target_PROYECTO: TSimpleDataSet;
    Target_ANALITICAS: TSimpleDataSet;
    Target_CARTERAEFECTOS: TSimpleDataSet;
    Target_DIARIO: TSimpleDataSet;
    Origin_ASIPREDASIENTO: TSmallintField;
    Origin_ASIPREDDESCRIPCION: TIBStringField;
    Origin_LASIPREDASIENTO: TSmallintField;
    Origin_LASIPREDAPUNTE: TSmallintField;
    Origin_LASIPREDSUBCUENTA: TIBStringField;
    Origin_LASIPREDCONCEPTO: TIBStringField;
    Origin_LASIPREDCOMENTARIO: TIBStringField;
    Origin_LASIPREDDEBEHABER: TIBStringField;
    Origin_LASIPREDIMPORTE: TIBStringField;
    Origin_LASIPREDCONTRAPARTIDA: TIBStringField;
    Origin_LASIPREDFECHAVTO: TIBStringField;
    Origin_LASIPREDCENTROCOSTE: TIBStringField;
    Origin_LASIPREDNUMEROFACTURA: TIBStringField;
    Origin_PARAMETROSID_PARAMETROS: TSmallintField;
    Origin_PARAMETROSLONGITUD_SUBCUENTAS: TSmallintField;
    Origin_PARAMETROSFECHA_INICIO_APLICACION: TDateTimeField;
    Origin_PARAMETROSFECHA_INICIO_EJERCICIO: TDateTimeField;
    Origin_PARAMETROSFECHA_FIN_EJERCICIO: TDateTimeField;
    Origin_PARAMETROSCTO_REGULARIZACION: TIBStringField;
    Origin_PARAMETROSSUBCUENTA_CIERRE: TIBStringField;
    Origin_PARAMETROSMONEDA: TIBStringField;
    Origin_PARAMETROSNOMBREFISCAL: TIBStringField;
    Origin_PARAMETROSDIRECCION: TIBStringField;
    Origin_PARAMETROSDIRECCION1: TIBStringField;
    Origin_PARAMETROSPOBLACION: TIBStringField;
    Origin_PARAMETROSCODPOSTAL: TIBStringField;
    Origin_PARAMETROSPROVINCIA: TIBStringField;
    Origin_PARAMETROSNIF: TIBStringField;
    Origin_PARAMETROSCONTACTO: TIBStringField;
    Origin_PARAMETROSDOCCLIENTE: TIBStringField;
    Origin_PARAMETROSDOCPROVEEDOR: TIBStringField;
    Origin_PARAMETROSDOC347: TIBStringField;
    Origin_PARAMETROSFECHABLOQUEO: TDateTimeField;
    Origin_PARAMETROSCTO_APERTURA: TIBStringField;
    Origin_PARAMETROSCTO_REGULARIZACION_ESP: TIBStringField;
    Origin_PARAMETROSFECHAAMORTIZACION: TDateTimeField;
    Origin_PARAMETROSRECARGO: TIBStringField;
    Origin_PARAMETROSCTO_APERTURA_ESP: TIBStringField;
    Origin_PARAMETROSSCTAIVANORMAL: TIBStringField;
    Origin_PARAMETROSSCTAIVAEXENTO: TIBStringField;
    Origin_PARAMETROSSCTAIVAINTRA: TIBStringField;
    Origin_PARAMETROSSCTAVENTAS: TIBStringField;
    Origin_PARAMETROSSCTADEVOLUCION: TIBStringField;
    Origin_PARAMETROSCTOIVANORMAL: TIBStringField;
    Origin_PARAMETROSCTOIVAEXENTO: TIBStringField;
    Origin_PARAMETROSCTOIVAINTRA: TIBStringField;
    Origin_PARAMETROSCTOVENTAS: TIBStringField;
    Origin_PARAMETROSCTODEVOLUCION: TIBStringField;
    Origin_PARAMETROSCTOCLIENTES: TIBStringField;
    Origin_PARAMETROSSCTADESCUENTO: TIBStringField;
    Origin_PARAMETROSSCTACOMPRAS: TIBStringField;
    Origin_PARAMETROSCTODESCUENTO: TIBStringField;
    Origin_PARAMETROSCTOCOMPRAS: TIBStringField;
    Origin_PARAMETROSSCTAIVAREDUCIDO: TIBStringField;
    Origin_PARAMETROSCTOIVAREDUCIDO: TIBStringField;
    Origin_PARAMETROSSCTAIVASUPER: TIBStringField;
    Origin_PARAMETROSCTOIVASUPER: TIBStringField;
    Origin_PARAMETROSCTOPROVEEDORES: TIBStringField;
    Origin_PARAMETROSSCTAIVACNORMAL: TIBStringField;
    Origin_PARAMETROSCTOIVACNORMAL: TIBStringField;
    Origin_PARAMETROSSCTAIVACREDUCIDO: TIBStringField;
    Origin_PARAMETROSCTOIVACREDUCIDO: TIBStringField;
    Origin_PARAMETROSSCTAIVACSUPER: TIBStringField;
    Origin_PARAMETROSCTOIVACSUPER: TIBStringField;
    Origin_PARAMETROSSCTARECNORMAL: TIBStringField;
    Origin_PARAMETROSCTORECNORMAL: TIBStringField;
    Origin_PARAMETROSSCTARECREDUCIDO: TIBStringField;
    Origin_PARAMETROSCTORECREDUCIDO: TIBStringField;
    Origin_PARAMETROSSCTARECSUPER: TIBStringField;
    Origin_PARAMETROSCTORECSUPER: TIBStringField;
    Origin_PARAMETROSCTORECIBOVENTAS: TIBStringField;
    Origin_PARAMETROSVGENERICA: TIBStringField;
    Origin_PARAMETROSSUBCAJA: TIBStringField;
    Origin_PARAMETROSCTOCOBROF: TIBStringField;
    Origin_PARAMETROSCTONOME: TIBStringField;
    Origin_PARAMETROSCTONOMT: TIBStringField;
    Origin_PARAMETROSSCTANOMSUELDO: TIBStringField;
    Origin_PARAMETROSSCTANOMIRPF: TIBStringField;
    Origin_PARAMETROSSCTANOMPAGO: TIBStringField;
    Origin_PARAMETROSSCTANOMSSE: TIBStringField;
    Origin_PARAMETROSSCTANOMSST: TIBStringField;
    Origin_PARAMETROSSCTANOMCARGO: TIBStringField;
    Origin_PARAMETROSSCTADTOPPV: TIBStringField;
    Origin_PARAMETROSSCTADTOPPC: TIBStringField;
    Origin_PARAMETROSCTODTOPPV: TIBStringField;
    Origin_PARAMETROSCTODTOPPC: TIBStringField;
    Origin_PARAMETROSSCTARETPROF: TIBStringField;
    Origin_PARAMETROSSCTARETARRE: TIBStringField;
    Origin_PARAMETROSCTORETPROF: TIBStringField;
    Origin_PARAMETROSCTORETARRE: TIBStringField;
    Origin_PARAMETROSTANTORETPROF: TFloatField;
    Origin_PARAMETROSTANTORETARRE: TFloatField;
    Origin_PARAMETROSSCTAHACIVA: TIBStringField;
    Origin_PARAMETROSCTOHACIVA: TIBStringField;
    Origin_PARAMETROSSCTAIVACEXENTO: TIBStringField;
    Origin_PARAMETROSCTOIVACEXENTO: TIBStringField;
    Origin_PARAMETROSCTOPAGOF: TIBStringField;
    Origin_PARAMETROSVGENERICAC: TIBStringField;
    Origin_PARAMETROSTELEFONO: TIBStringField;
    Origin_PARAMETROSFAX: TIBStringField;
    Origin_PARAMETROSDOCIMPRIMIR: TIBStringField;
    Origin_PARAMETROSSIGLAVIA: TIBStringField;
    Origin_PARAMETROSNUMEROCALLE: TIBStringField;
    Origin_PARAMETROSESCALERA: TIBStringField;
    Origin_PARAMETROSPISO: TIBStringField;
    Origin_PARAMETROSPUERTA: TIBStringField;
    Origin_PARAMETROSCCC: TIBStringField;
    Origin_PARAMETROSCODADMON: TIBStringField;
    Origin_PARAMETROSGESTIONA_CARTERA_EFECTOS: TIBStringField;
    Origin_PARAMETROSFILTRO_ASIENTOS_INICIO: TIBStringField;
    Origin_PARAMETROSINCLUIR_ABREV: TIBStringField;
    Origin_PARAMETROSSCTAEFECTDESCONTADOS: TIBStringField;
    Origin_PARAMETROSSCTADEUDASDESCUENTOS: TIBStringField;
    Origin_PARAMETROSASIENTOS_INICIO_INTERVALO_BQDA: TSmallintField;
    Origin_PARAMETROSASIENTOS_FIN_INTERVALO_BQDA: TSmallintField;
    Origin_PARAMETROSMOSTRAR_FILTRO_MAYOR: TIBStringField;
    Origin_PARAMETROSCTOPROVINTRA: TIBStringField;
    Origin_PARAMETROSASIENTO_INICIO_INTERVALO_FILTRO: TSmallintField;
    Origin_PARAMETROSASIENTO_FIN_INTERVALO_FILTRO: TSmallintField;
    Origin_PARAMETROSSCTAIVAINTRADEDUCIBLE: TIBStringField;
    Origin_PARAMETROSSCTAIVACINTRADEDUCIBLE: TIBStringField;
    Origin_PARAMETROSSCTAIVACINTRAREPERCUTIDO: TIBStringField;
    Origin_PARAMETROSSCTAGENINTRACOM: TIBStringField;
    Origin_PARAMETROSASIENTO_NOMINA_INDIVIDUAL: TIBStringField;
    Origin_PARAMETROSSCTAIVAEXENTOCEE: TIBStringField;
    Origin_PARAMETROSSCTAINTERESES: TIBStringField;
    Origin_PARAMETROSSCTAEXPORTACIONES: TIBStringField;
    Origin_PARAMETROSBUSQUEDA_SUBCTAS: TIBStringField;
    Origin_PARAMETROSSCTAOTRASREMUN: TIBStringField;
    Origin_PARAMETROSSCTABANCO: TIBStringField;
    Origin_PARAMETROSCTOCOBRO: TIBStringField;
    Origin_PARAMETROSCTOPAGO: TIBStringField;
    Origin_PARAMETROSSCTAEFECTOSCOMERCIALES: TIBStringField;
    Origin_PARAMETROSCTOEFECTOSCOMERCIALES: TIBStringField;
    Origin_PARAMETROSCTODEUDASDESCUENTOS: TIBStringField;
    Origin_PARAMETROSSCTAREMESAEFECTOS: TIBStringField;
    Origin_PARAMETROSCTOREMESAEFECTOS: TIBStringField;
    Origin_PARAMETROSDESCPROV_CARTERAEFECTOS: TIBStringField;
    Origin_PARAMETROSDESCCLI_CARTERAEFECTOS: TIBStringField;
    Origin_PARAMETROSTIPOEMPRESA: TIBStringField;
    Origin_PARAMETROSFILTROSUBCTAS: TIBStringField;
    Origin_PARAMETROSOFFICE2003: TIBStringField;
    Origin_PARAMETROSTRATASERIE: TIBStringField;
    Origin_PARAMETROSACTCOMENTARIO: TIBStringField;
    Origin_TITULOSTITULO: TIBStringField;
    Origin_TITULOSDESCRIPCION: TIBStringField;
    Origin_TITULOSRESTA1: TIBStringField;
    Origin_TITULOSRESTA2: TIBStringField;
    Origin_TITULOSRESTA3: TIBStringField;
    Origin_TITULOSRESTA4: TIBStringField;
    Origin_TITULOSRESTA5: TIBStringField;
    Origin_TITULOSRESTA6: TIBStringField;
    Origin_TITULOSSUMA1: TIBStringField;
    Origin_TITULOSSUMA2: TIBStringField;
    Origin_TITULOSSUMA3: TIBStringField;
    Origin_TITULOSSUMA4: TIBStringField;
    Origin_TITULOSSUMA5: TIBStringField;
    Origin_TITULOSSUMA6: TIBStringField;
    Origin_TITULOSSUMA7: TIBStringField;
    Origin_TITULOSRESTA8: TIBStringField;
    Origin_TITULOSRESTA7: TIBStringField;
    Origin_TITULOSSUMA8: TIBStringField;
    Origin_IVARDESCRIPCION: TIBStringField;
    Origin_IVARTIPO: TIBStringField;
    Origin_IVASDESCRIPCION: TIBStringField;
    Origin_IVASTIPO: TIBStringField;
    Origin_NOMINASID_NOMINA: TIntegerField;
    Origin_NOMINASASIENTO: TIntegerField;
    Origin_NOMINASNOMINA: TFloatField;
    Origin_NOMINASIRPF: TFloatField;
    Origin_NOMINASSSOCIAL: TFloatField;
    Origin_NOMINASNETO: TFloatField;
    Origin_NOMINASSUBCUENTA: TIBStringField;
    Origin_NOMINASNOMINA_EMPLEADO: TIBStringField;
    Origin_FORMASFORMAPAGO: TIBStringField;
    Origin_FORMASCLASE: TIBStringField;
    Origin_FORMASDESCRIBE: TIBStringField;
    Origin_FORMASINTERVALO: TSmallintField;
    Origin_FORMASNUMVENCI: TSmallintField;
    Origin_FORMASOBSOLETO: TIBStringField;
    Origin_PAISESPAIS: TIBStringField;
    Origin_PAISESNOMBRE: TIBStringField;
    Origin_PROVINCIASPROVINCIA: TIBStringField;
    Origin_PROVINCIASNOMBRE: TIBStringField;
    Origin_PROVINCIASCODIGO: TIBStringField;
    Origin_SUBCTASACUDB01: TFloatField;
    Origin_SUBCTASACUDB02: TFloatField;
    Origin_SUBCTASACUDB03: TFloatField;
    Origin_SUBCTASACUDB04: TFloatField;
    Origin_SUBCTASACUDB05: TFloatField;
    Origin_SUBCTASACUDB06: TFloatField;
    Origin_SUBCTASACUDB07: TFloatField;
    Origin_SUBCTASACUDB08: TFloatField;
    Origin_SUBCTASACUDB09: TFloatField;
    Origin_SUBCTASACUDB10: TFloatField;
    Origin_SUBCTASACUDB11: TFloatField;
    Origin_SUBCTASACUDB12: TFloatField;
    Origin_SUBCTASACUHB01: TFloatField;
    Origin_SUBCTASACUHB02: TFloatField;
    Origin_SUBCTASACUHB03: TFloatField;
    Origin_SUBCTASACUHB04: TFloatField;
    Origin_SUBCTASACUHB05: TFloatField;
    Origin_SUBCTASACUHB06: TFloatField;
    Origin_SUBCTASACUHB07: TFloatField;
    Origin_SUBCTASACUHB08: TFloatField;
    Origin_SUBCTASACUHB09: TFloatField;
    Origin_SUBCTASACUHB10: TFloatField;
    Origin_SUBCTASACUHB11: TFloatField;
    Origin_SUBCTASACUHB12: TFloatField;
    Origin_SUBCTASANTDB: TFloatField;
    Origin_SUBCTASANTDB01: TFloatField;
    Origin_SUBCTASANTDB02: TFloatField;
    Origin_SUBCTASANTDB03: TFloatField;
    Origin_SUBCTASANTDB04: TFloatField;
    Origin_SUBCTASANTDB05: TFloatField;
    Origin_SUBCTASANTDB06: TFloatField;
    Origin_SUBCTASANTDB07: TFloatField;
    Origin_SUBCTASANTDB08: TFloatField;
    Origin_SUBCTASANTDB09: TFloatField;
    Origin_SUBCTASANTDB10: TFloatField;
    Origin_SUBCTASANTDB11: TFloatField;
    Origin_SUBCTASANTDB12: TFloatField;
    Origin_SUBCTASANTHB: TFloatField;
    Origin_SUBCTASANTHB01: TFloatField;
    Origin_SUBCTASANTHB02: TFloatField;
    Origin_SUBCTASANTHB03: TFloatField;
    Origin_SUBCTASANTHB04: TFloatField;
    Origin_SUBCTASANTHB05: TFloatField;
    Origin_SUBCTASANTHB06: TFloatField;
    Origin_SUBCTASANTHB07: TFloatField;
    Origin_SUBCTASANTHB08: TFloatField;
    Origin_SUBCTASANTHB09: TFloatField;
    Origin_SUBCTASANTHB10: TFloatField;
    Origin_SUBCTASANTHB11: TFloatField;
    Origin_SUBCTASANTHB12: TFloatField;
    Origin_SUBCTASARRENDADOR: TIBStringField;
    Origin_SUBCTASCONTRAPARTIDA: TIBStringField;
    Origin_SUBCTASDESCRIPCION: TIBStringField;
    Origin_SUBCTASDIRECCION: TIBStringField;
    Origin_SUBCTASFAX: TIBStringField;
    Origin_SUBCTASIVA: TFloatField;
    Origin_SUBCTASPROFESIONAL: TIBStringField;
    Origin_SUBCTASRECARGO: TFloatField;
    Origin_SUBCTASSUBCUENTA: TIBStringField;
    Origin_SUBCTASSUMADB: TFloatField;
    Origin_SUBCTASSUMAHB: TFloatField;
    Origin_SUBCTASTELEFONO: TIBStringField;
    Origin_SUBCTASTIPOIVA: TIBStringField;
    Origin_SUBCTASDIRECCION1: TIBStringField;
    Origin_SUBCTASNIF: TIBStringField;
    Origin_SUBCTASCODPOSTAL: TIBStringField;
    Origin_SUBCTASPOBLACION: TIBStringField;
    Origin_SUBCTASPROVINCIA: TIBStringField;
    Origin_SUBCTASPAIS: TIBStringField;
    Origin_SUBCTASNUMERO: TIBStringField;
    Origin_SUBCTASFORMAPAGO: TIBStringField;
    Origin_SUBCTASDIAPAGO1: TSmallintField;
    Origin_SUBCTASDIAPAGO2: TSmallintField;
    Origin_SUBCTASPRES01: TFloatField;
    Origin_SUBCTASPRES02: TFloatField;
    Origin_SUBCTASPRES03: TFloatField;
    Origin_SUBCTASPRES04: TFloatField;
    Origin_SUBCTASPRES05: TFloatField;
    Origin_SUBCTASPRES06: TFloatField;
    Origin_SUBCTASPRES07: TFloatField;
    Origin_SUBCTASPRES08: TFloatField;
    Origin_SUBCTASPRES09: TFloatField;
    Origin_SUBCTASPRES10: TFloatField;
    Origin_SUBCTASPRES11: TFloatField;
    Origin_SUBCTASPRES12: TFloatField;
    Origin_SUBCTASPRESTOT: TFloatField;
    Origin_SUBCTASOBSOLETO: TIBStringField;
    Origin_SUBCTASDIAPAGO3: TSmallintField;
    Origin_SUBCTASABREVIATURA: TIBStringField;
    Origin_SUBCTASINTRACOMUNITARIO: TIBStringField;
    Origin_SUBCTASSUBCTARET: TIBStringField;
    Origin_AMORTIZASUBCUENTA: TIBStringField;
    Origin_AMORTIZACENTROCOSTE: TIBStringField;
    Origin_AMORTIZAFCOMPRA: TDateTimeField;
    Origin_AMORTIZAFINICIO: TDateTimeField;
    Origin_AMORTIZAFULTAMOR: TDateTimeField;
    Origin_AMORTIZAFFINAMOR: TDateTimeField;
    Origin_AMORTIZAFBAJA: TDateTimeField;
    Origin_AMORTIZASUBGASTO: TIBStringField;
    Origin_AMORTIZASUBAMOR: TIBStringField;
    Origin_AMORTIZAPERIODO: TIBStringField;
    Origin_AMORTIZAANUAL: TFloatField;
    Origin_AMORTIZAPROVEEDOR: TIBStringField;
    Origin_AMORTIZAFACTURA: TIBStringField;
    Origin_AMORTIZAVCOMPRA: TFloatField;
    Origin_AMORTIZAVRESIDUAL: TFloatField;
    Origin_AMORTIZAVAMOR: TFloatField;
    Origin_AMORTIZAVEJPINICIO: TFloatField;
    Origin_AMORTIZAVEJAINICIO: TFloatField;
    Origin_AMORTIZAVEJPAMOR: TFloatField;
    Origin_AMORTIZAVEJAAMOR: TFloatField;
    Origin_AMORTIZACLASE: TFloatField;
    Origin_CONCEPTOSID_CONCEPTOS: TIBStringField;
    Origin_CONCEPTOSDESCRIPCION: TIBStringField;
    Origin_CONCEPTOSTIPOCONTABILIDAD: TIBStringField;
    Origin_CONCEPTOSTIPOCONCEPTO: TIBStringField;
    Origin_CONCEPTOSOBSOLETO: TIBStringField;
    Origin_CONCEPTOSSUBCUENTA: TIBStringField;
    Origin_CONCEPTOSCONTRAPARTIDA: TIBStringField;
    Origin_COMERCIALESNOMBRE: TIBStringField;
    Origin_COMERCIALESCOMERCIAL: TIBStringField;
    Origin_TIPODIARIODESCRIPCION: TIBStringField;
    Origin_TIPODIARIOTIPODIARIO: TIBStringField;
    Origin_DELEGACIONNOMBRE: TIBStringField;
    Origin_DELEGACIONID_DELEGACION: TIBStringField;
    Origin_DEPARTAMENTONOMBRE: TIBStringField;
    Origin_DEPARTAMENTOID_DEPARTAMENTO: TIBStringField;
    Origin_SECCIONNOMBRE: TIBStringField;
    Origin_SECCIONID_SECCION: TIBStringField;
    Origin_PROYECTONOMBRE: TIBStringField;
    Origin_PROYECTOID_PROYECTO: TIBStringField;
    Origin_ANALITICASID_PROYECTO: TIBStringField;
    Origin_ANALITICASID_SECCION: TIBStringField;
    Origin_ANALITICASID_DEPARTAMENTO: TIBStringField;
    Origin_ANALITICASID_DELEGACION: TIBStringField;
    Origin_ANALITICASNOMBRE: TIBStringField;
    Origin_ANALITICASCUENTA: TIBStringField;
    Origin_CARTERAEFECTOSID_CARTERAEFECTOS: TIntegerField;
    Origin_CARTERAEFECTOSSUBCUENTA: TIBStringField;
    Origin_CARTERAEFECTOSSITUACION: TIBStringField;
    Origin_CARTERAEFECTOSSUBCTABANCO: TIBStringField;
    Origin_CARTERAEFECTOSCONCEPTO: TIBStringField;
    Origin_CARTERAEFECTOSFEMISION: TDateTimeField;
    Origin_CARTERAEFECTOSFASIENTO: TDateTimeField;
    Origin_CARTERAEFECTOSIMPORTE: TFloatField;
    Origin_CARTERAEFECTOSFACTCLIENT: TIBStringField;
    Origin_CARTERAEFECTOSFACTPROVEEDOR: TIBStringField;
    Origin_CARTERAEFECTOSFVENCIMIENTO: TDateTimeField;
    Origin_CARTERAEFECTOSCOMERCIAL: TIBStringField;
    Origin_CARTERAEFECTOSIMPCOMISION: TFloatField;
    Origin_CARTERAEFECTOSASIENTORIESGO: TIntegerField;
    Origin_CARTERAEFECTOSEJERCICIO: TIntegerField;
    Origin_CARTERAEFECTOSSERIE: TIBStringField;
    Origin_DIARIOID_DIARIO: TIntegerField;
    Origin_DIARIOAPUNTE: TSmallintField;
    Origin_DIARIOASIENTO: TIntegerField;
    Origin_DIARIOBASEIMPONIBLE: TFloatField;
    Origin_DIARIOCOMENTARIO: TIBStringField;
    Origin_DIARIOCONTRAPARTIDA: TIBStringField;
    Origin_DIARIODEBEHABER: TIBStringField;
    Origin_DIARIOFECHA: TDateTimeField;
    Origin_DIARIOIMPORTE: TFloatField;
    Origin_DIARIOIVA: TFloatField;
    Origin_DIARIONIF: TIBStringField;
    Origin_DIARIOMONEDA: TIBStringField;
    Origin_DIARIONUMEROFACTURA: TIBStringField;
    Origin_DIARIORECARGO: TFloatField;
    Origin_DIARIOSUBCUENTA: TIBStringField;
    Origin_DIARIOPUNTEO: TIBStringField;
    Origin_DIARIOASIENTOPUNTEO: TIntegerField;
    Origin_DIARIOPUNTEOIVA: TIBStringField;
    Origin_DIARIOID_CONCEPTOS: TIBStringField;
    Origin_DIARIOTIPODIARIO: TIBStringField;
    Origin_DIARIOCUENTA_ANALITICA: TIBStringField;
    Origin_DIARIOCUOTAIVA: TFloatField;
    Origin_DIARIOCUOTARECARGO: TFloatField;
    Origin_DIARIOTIPOASIENTO: TIntegerField;
    Origin_DIARIOASIENTONOMINA: TIntegerField;
    Origin_DIARIOEJERCICIO: TIntegerField;
    Origin_DIARIOSERIE: TIBStringField;
    Gauge: TGauge;
    LabelO_SIAM: TLabel;
    LabelO_ASIPRED: TLabel;
    LabelO_LASIPRED: TLabel;
    LabelO_PARAMETROS: TLabel;
    LabelO_TITULOS: TLabel;
    LabelO_IVAR: TLabel;
    LabelO_IVAS: TLabel;
    LabelO_NOMINAS: TLabel;
    LabelO_FORMAS: TLabel;
    LabelO_PAISES: TLabel;
    LabelO_PROVINCIAS: TLabel;
    LabelO_SUBCTAS: TLabel;
    LabelO_AMORTIZA: TLabel;
    LabelO_CONCEPTOS: TLabel;
    LabelO_COMERCIALES: TLabel;
    LabelO_TIPODIARIO: TLabel;
    LabelO_DELEGACION: TLabel;
    LabelO_DEPARTAMENTO: TLabel;
    LabelO_SECCION: TLabel;
    LabelO_PROYECTO: TLabel;
    LabelO_ANALITICAS: TLabel;
    LabelO_CARTERAEFECTOS: TLabel;
    LabelO_DIARIO: TLabel;
    LabelT_SIAM: TLabel;
    LabelT_ASIPRED: TLabel;
    LabelT_LASIPRED: TLabel;
    LabelT_PARAMETROS: TLabel;
    LabelT_TITULOS: TLabel;
    LabelT_IVAR: TLabel;
    LabelT_IVAS: TLabel;
    LabelT_NOMINAS: TLabel;
    LabelT_FORMAS: TLabel;
    LabelT_PAISES: TLabel;
    LabelT_PROVINCIAS: TLabel;
    LabelT_SUBCTAS: TLabel;
    LabelT_AMORTIZA: TLabel;
    LabelT_CONCEPTOS: TLabel;
    LabelT_COMERCIALES: TLabel;
    LabelT_TIPODIARIO: TLabel;
    LabelT_DELEGACION: TLabel;
    LabelT_DEPARTAMENTO: TLabel;
    LabelT_SECCION: TLabel;
    LabelT_PROYECTO: TLabel;
    LabelT_ANALITICAS: TLabel;
    LabelT_CARTERAEFECTOS: TLabel;
    LabelT_DIARIO: TLabel;
    Target_SIAM: TSimpleDataSet;
    Origin_GRUPOS: TIBTable;
    Origin_GRUPOSDESCRIPCION: TIBStringField;
    Origin_GRUPOSGRUPO: TIBStringField;
    Origin_CUENTAS: TIBTable;
    Origin_CUENTASCUENTA: TIBStringField;
    Origin_CUENTASACUDB01: TFloatField;
    Origin_CUENTASACUDB02: TFloatField;
    Origin_CUENTASACUDB03: TFloatField;
    Origin_CUENTASACUDB04: TFloatField;
    Origin_CUENTASACUDB05: TFloatField;
    Origin_CUENTASACUDB06: TFloatField;
    Origin_CUENTASACUDB07: TFloatField;
    Origin_CUENTASACUDB08: TFloatField;
    Origin_CUENTASACUDB09: TFloatField;
    Origin_CUENTASACUDB10: TFloatField;
    Origin_CUENTASACUDB11: TFloatField;
    Origin_CUENTASACUDB12: TFloatField;
    Origin_CUENTASACUHB01: TFloatField;
    Origin_CUENTASACUHB02: TFloatField;
    Origin_CUENTASACUHB03: TFloatField;
    Origin_CUENTASACUHB04: TFloatField;
    Origin_CUENTASACUHB05: TFloatField;
    Origin_CUENTASACUHB06: TFloatField;
    Origin_CUENTASACUHB07: TFloatField;
    Origin_CUENTASACUHB08: TFloatField;
    Origin_CUENTASACUHB09: TFloatField;
    Origin_CUENTASACUHB10: TFloatField;
    Origin_CUENTASACUHB11: TFloatField;
    Origin_CUENTASACUHB12: TFloatField;
    Origin_CUENTASANTDB01: TFloatField;
    Origin_CUENTASANTDB02: TFloatField;
    Origin_CUENTASANTDB03: TFloatField;
    Origin_CUENTASANTDB04: TFloatField;
    Origin_CUENTASANTDB05: TFloatField;
    Origin_CUENTASANTDB06: TFloatField;
    Origin_CUENTASANTDB07: TFloatField;
    Origin_CUENTASANTDB08: TFloatField;
    Origin_CUENTASANTDB09: TFloatField;
    Origin_CUENTASANTDB10: TFloatField;
    Origin_CUENTASANTDB11: TFloatField;
    Origin_CUENTASANTDB12: TFloatField;
    Origin_CUENTASANTHB01: TFloatField;
    Origin_CUENTASANTHB02: TFloatField;
    Origin_CUENTASANTHB03: TFloatField;
    Origin_CUENTASANTHB04: TFloatField;
    Origin_CUENTASANTHB05: TFloatField;
    Origin_CUENTASANTHB06: TFloatField;
    Origin_CUENTASANTHB07: TFloatField;
    Origin_CUENTASANTHB08: TFloatField;
    Origin_CUENTASANTHB09: TFloatField;
    Origin_CUENTASANTHB10: TFloatField;
    Origin_CUENTASANTHB11: TFloatField;
    Origin_CUENTASANTHB12: TFloatField;
    Origin_CUENTASANTHB: TFloatField;
    Origin_CUENTASANTDB: TFloatField;
    Origin_CUENTASDESCRIPCION: TIBStringField;
    Origin_CUENTASGRUPO1: TIBStringField;
    Origin_CUENTASGRUPO2: TIBStringField;
    Origin_CUENTASSUMADB: TFloatField;
    Origin_CUENTASSUMAHB: TFloatField;
    Origin_CUENTASTIPOCUENTA: TIBStringField;
    Target_GRUPOS: TSimpleDataSet;
    Target_CUENTAS: TSimpleDataSet;
    LabelO_GRUPOS: TLabel;
    LabelT_GRUPOS: TLabel;
    BtnGRUPOS: TButton;
    LabelO_CUENTAS: TLabel;
    LabelT_CUENTAS: TLabel;
    BtnCUENTAS: TButton;
    Target_CARTERAEFECTOSID_CARTERAEFECTOS: TIntegerField;
    Target_CARTERAEFECTOSSUBCUENTA: TStringField;
    Target_CARTERAEFECTOSSITUACION: TStringField;
    Target_CARTERAEFECTOSSUBCTABANCO: TStringField;
    Target_CARTERAEFECTOSCONCEPTO: TStringField;
    Target_CARTERAEFECTOSFEMISION: TSQLTimeStampField;
    Target_CARTERAEFECTOSFASIENTO: TSQLTimeStampField;
    Target_CARTERAEFECTOSIMPORTE: TBCDField;
    Target_CARTERAEFECTOSFACTCLIENT: TStringField;
    Target_CARTERAEFECTOSFACTPROVEEDOR: TStringField;
    Target_CARTERAEFECTOSFVENCIMIENTO: TSQLTimeStampField;
    Target_CARTERAEFECTOSCOMERCIAL: TStringField;
    Target_CARTERAEFECTOSIMPCOMISION: TBCDField;
    Target_CARTERAEFECTOSASIENTORIESGO: TIntegerField;
    Target_CARTERAEFECTOSEJERCICIO: TIntegerField;
    Target_CARTERAEFECTOSSERIE: TStringField;
    Target_ANALITICASCUENTA: TStringField;
    Target_ANALITICASNOMBRE: TStringField;
    Target_ANALITICASID_PROYECTO: TStringField;
    Target_ANALITICASID_SECCION: TStringField;
    Target_ANALITICASID_DEPARTAMENTO: TStringField;
    Target_ANALITICASID_DELEGACION: TStringField;
    Target_PROYECTOID_PROYECTO: TStringField;
    Target_PROYECTONOMBRE: TStringField;
    Target_SECCIONID_SECCION: TStringField;
    Target_SECCIONNOMBRE: TStringField;
    Target_DEPARTAMENTOID_DEPARTAMENTO: TStringField;
    Target_DEPARTAMENTONOMBRE: TStringField;
    Target_DELEGACIONID_DELEGACION: TStringField;
    Target_DELEGACIONNOMBRE: TStringField;
    Target_TIPODIARIOTIPODIARIO: TStringField;
    Target_TIPODIARIODESCRIPCION: TStringField;
    Target_COMERCIALESCOMERCIAL: TStringField;
    Target_COMERCIALESNOMBRE: TStringField;
    Target_CONCEPTOSID_CONCEPTOS: TStringField;
    Target_CONCEPTOSDESCRIPCION: TStringField;
    Target_CONCEPTOSTIPOCONTABILIDAD: TStringField;
    Target_CONCEPTOSTIPOCONCEPTO: TStringField;
    Target_CONCEPTOSOBSOLETO: TStringField;
    Target_CONCEPTOSSUBCUENTA: TStringField;
    Target_CONCEPTOSCONTRAPARTIDA: TStringField;
    Target_AMORTIZASUBCUENTA: TStringField;
    Target_AMORTIZACENTROCOSTE: TStringField;
    Target_AMORTIZAFCOMPRA: TSQLTimeStampField;
    Target_AMORTIZAFINICIO: TSQLTimeStampField;
    Target_AMORTIZAFULTAMOR: TSQLTimeStampField;
    Target_AMORTIZAFFINAMOR: TSQLTimeStampField;
    Target_AMORTIZAFBAJA: TSQLTimeStampField;
    Target_AMORTIZASUBGASTO: TStringField;
    Target_AMORTIZASUBAMOR: TStringField;
    Target_AMORTIZAPERIODO: TStringField;
    Target_AMORTIZAANUAL: TBCDField;
    Target_AMORTIZAPROVEEDOR: TStringField;
    Target_AMORTIZAFACTURA: TStringField;
    Target_AMORTIZAVCOMPRA: TBCDField;
    Target_AMORTIZAVRESIDUAL: TBCDField;
    Target_AMORTIZAVAMOR: TBCDField;
    Target_AMORTIZAVEJPINICIO: TBCDField;
    Target_AMORTIZAVEJAINICIO: TBCDField;
    Target_AMORTIZAVEJPAMOR: TBCDField;
    Target_AMORTIZAVEJAAMOR: TBCDField;
    Target_AMORTIZACLASE: TBCDField;
    Target_SUBCTASACUDB01: TBCDField;
    Target_SUBCTASACUDB02: TBCDField;
    Target_SUBCTASACUDB03: TBCDField;
    Target_SUBCTASACUDB04: TBCDField;
    Target_SUBCTASACUDB05: TBCDField;
    Target_SUBCTASACUDB06: TBCDField;
    Target_SUBCTASACUDB07: TBCDField;
    Target_SUBCTASACUDB08: TBCDField;
    Target_SUBCTASACUDB09: TBCDField;
    Target_SUBCTASACUDB10: TBCDField;
    Target_SUBCTASACUDB11: TBCDField;
    Target_SUBCTASACUDB12: TBCDField;
    Target_SUBCTASACUHB01: TBCDField;
    Target_SUBCTASACUHB02: TBCDField;
    Target_SUBCTASACUHB03: TBCDField;
    Target_SUBCTASACUHB04: TBCDField;
    Target_SUBCTASACUHB05: TBCDField;
    Target_SUBCTASACUHB06: TBCDField;
    Target_SUBCTASACUHB07: TBCDField;
    Target_SUBCTASACUHB08: TBCDField;
    Target_SUBCTASACUHB09: TBCDField;
    Target_SUBCTASACUHB10: TBCDField;
    Target_SUBCTASACUHB11: TBCDField;
    Target_SUBCTASACUHB12: TBCDField;
    Target_SUBCTASANTDB: TBCDField;
    Target_SUBCTASANTDB01: TBCDField;
    Target_SUBCTASANTDB02: TBCDField;
    Target_SUBCTASANTDB03: TBCDField;
    Target_SUBCTASANTDB04: TBCDField;
    Target_SUBCTASANTDB05: TBCDField;
    Target_SUBCTASANTDB06: TBCDField;
    Target_SUBCTASANTDB07: TBCDField;
    Target_SUBCTASANTDB08: TBCDField;
    Target_SUBCTASANTDB09: TBCDField;
    Target_SUBCTASANTDB10: TBCDField;
    Target_SUBCTASANTDB11: TBCDField;
    Target_SUBCTASANTDB12: TBCDField;
    Target_SUBCTASANTHB: TBCDField;
    Target_SUBCTASANTHB01: TBCDField;
    Target_SUBCTASANTHB02: TBCDField;
    Target_SUBCTASANTHB03: TBCDField;
    Target_SUBCTASANTHB04: TBCDField;
    Target_SUBCTASANTHB05: TBCDField;
    Target_SUBCTASANTHB06: TBCDField;
    Target_SUBCTASANTHB07: TBCDField;
    Target_SUBCTASANTHB08: TBCDField;
    Target_SUBCTASANTHB09: TBCDField;
    Target_SUBCTASANTHB10: TBCDField;
    Target_SUBCTASANTHB11: TBCDField;
    Target_SUBCTASANTHB12: TBCDField;
    Target_SUBCTASARRENDADOR: TStringField;
    Target_SUBCTASCONTRAPARTIDA: TStringField;
    Target_SUBCTASDESCRIPCION: TStringField;
    Target_SUBCTASDIRECCION: TStringField;
    Target_SUBCTASFAX: TStringField;
    Target_SUBCTASIVA: TBCDField;
    Target_SUBCTASPROFESIONAL: TStringField;
    Target_SUBCTASRECARGO: TBCDField;
    Target_SUBCTASSUBCUENTA: TStringField;
    Target_SUBCTASSUMADB: TBCDField;
    Target_SUBCTASSUMAHB: TBCDField;
    Target_SUBCTASTELEFONO: TStringField;
    Target_SUBCTASTIPOIVA: TStringField;
    Target_SUBCTASDIRECCION1: TStringField;
    Target_SUBCTASNIF: TStringField;
    Target_SUBCTASCODPOSTAL: TStringField;
    Target_SUBCTASPOBLACION: TStringField;
    Target_SUBCTASPROVINCIA: TStringField;
    Target_SUBCTASPAIS: TStringField;
    Target_SUBCTASNUMERO: TStringField;
    Target_SUBCTASFORMAPAGO: TStringField;
    Target_SUBCTASDIAPAGO1: TIntegerField;
    Target_SUBCTASDIAPAGO2: TIntegerField;
    Target_SUBCTASPRES01: TBCDField;
    Target_SUBCTASPRES02: TBCDField;
    Target_SUBCTASPRES03: TBCDField;
    Target_SUBCTASPRES04: TBCDField;
    Target_SUBCTASPRES05: TBCDField;
    Target_SUBCTASPRES06: TBCDField;
    Target_SUBCTASPRES07: TBCDField;
    Target_SUBCTASPRES08: TBCDField;
    Target_SUBCTASPRES09: TBCDField;
    Target_SUBCTASPRES10: TBCDField;
    Target_SUBCTASPRES11: TBCDField;
    Target_SUBCTASPRES12: TBCDField;
    Target_SUBCTASPRESTOT: TBCDField;
    Target_SUBCTASOBSOLETO: TStringField;
    Target_SUBCTASDIAPAGO3: TIntegerField;
    Target_SUBCTASABREVIATURA: TStringField;
    Target_SUBCTASINTRACOMUNITARIO: TStringField;
    Target_CUENTASCUENTA: TStringField;
    Target_CUENTASDESCRIPCION: TStringField;
    Target_CUENTASGRUPO1: TStringField;
    Target_CUENTASGRUPO2: TStringField;
    Target_CUENTASTIPOCUENTA: TStringField;
    Target_CUENTASACUDB01: TBCDField;
    Target_CUENTASACUDB02: TBCDField;
    Target_CUENTASACUDB03: TBCDField;
    Target_CUENTASACUDB04: TBCDField;
    Target_CUENTASACUDB05: TBCDField;
    Target_CUENTASACUDB06: TBCDField;
    Target_CUENTASACUDB07: TBCDField;
    Target_CUENTASACUDB08: TBCDField;
    Target_CUENTASACUDB09: TBCDField;
    Target_CUENTASACUDB10: TBCDField;
    Target_CUENTASACUDB11: TBCDField;
    Target_CUENTASACUDB12: TBCDField;
    Target_CUENTASACUHB01: TBCDField;
    Target_CUENTASACUHB02: TBCDField;
    Target_CUENTASACUHB03: TBCDField;
    Target_CUENTASACUHB04: TBCDField;
    Target_CUENTASACUHB05: TBCDField;
    Target_CUENTASACUHB06: TBCDField;
    Target_CUENTASACUHB07: TBCDField;
    Target_CUENTASACUHB08: TBCDField;
    Target_CUENTASACUHB09: TBCDField;
    Target_CUENTASACUHB10: TBCDField;
    Target_CUENTASACUHB11: TBCDField;
    Target_CUENTASACUHB12: TBCDField;
    Target_CUENTASANTDB01: TBCDField;
    Target_CUENTASANTDB02: TBCDField;
    Target_CUENTASANTDB03: TBCDField;
    Target_CUENTASANTDB04: TBCDField;
    Target_CUENTASANTDB05: TBCDField;
    Target_CUENTASANTDB06: TBCDField;
    Target_CUENTASANTDB07: TBCDField;
    Target_CUENTASANTDB08: TBCDField;
    Target_CUENTASANTDB09: TBCDField;
    Target_CUENTASANTDB10: TBCDField;
    Target_CUENTASANTDB11: TBCDField;
    Target_CUENTASANTDB12: TBCDField;
    Target_CUENTASANTHB01: TBCDField;
    Target_CUENTASANTHB02: TBCDField;
    Target_CUENTASANTHB03: TBCDField;
    Target_CUENTASANTHB04: TBCDField;
    Target_CUENTASANTHB05: TBCDField;
    Target_CUENTASANTHB06: TBCDField;
    Target_CUENTASANTHB07: TBCDField;
    Target_CUENTASANTHB08: TBCDField;
    Target_CUENTASANTHB09: TBCDField;
    Target_CUENTASANTHB10: TBCDField;
    Target_CUENTASANTHB11: TBCDField;
    Target_CUENTASANTHB12: TBCDField;
    Target_CUENTASANTHB: TBCDField;
    Target_CUENTASANTDB: TBCDField;
    Target_CUENTASSUMADB: TBCDField;
    Target_CUENTASSUMAHB: TBCDField;
    Target_GRUPOSGRUPO: TStringField;
    Target_GRUPOSDESCRIPCION: TStringField;
    Target_PROVINCIASPROVINCIA: TStringField;
    Target_PROVINCIASNOMBRE: TStringField;
    Target_PROVINCIASCODIGO: TStringField;
    Target_PAISESPAIS: TStringField;
    Target_PAISESNOMBRE: TStringField;
    Target_FORMASFORMAPAGO: TStringField;
    Target_FORMASDESCRIBE: TStringField;
    Target_FORMASCLASE: TStringField;
    Target_FORMASINTERVALO: TIntegerField;
    Target_FORMASNUMVENCI: TIntegerField;
    Target_FORMASOBSOLETO: TStringField;
    Target_NOMINASID_NOMINA: TIntegerField;
    Target_NOMINASASIENTO: TIntegerField;
    Target_NOMINASNOMINA: TBCDField;
    Target_NOMINASIRPF: TBCDField;
    Target_NOMINASSSOCIAL: TBCDField;
    Target_NOMINASNETO: TBCDField;
    Target_NOMINASSUBCUENTA: TStringField;
    Target_NOMINASNOMINA_EMPLEADO: TStringField;
    Target_IVASTIPO: TStringField;
    Target_IVASDESCRIPCION: TStringField;
    Target_IVARTIPO: TStringField;
    Target_IVARDESCRIPCION: TStringField;
    Target_TITULOSTITULO: TStringField;
    Target_TITULOSDESCRIPCION: TStringField;
    Target_TITULOSRESTA1: TStringField;
    Target_TITULOSRESTA2: TStringField;
    Target_TITULOSRESTA3: TStringField;
    Target_TITULOSRESTA4: TStringField;
    Target_TITULOSRESTA5: TStringField;
    Target_TITULOSRESTA6: TStringField;
    Target_TITULOSSUMA1: TStringField;
    Target_TITULOSSUMA2: TStringField;
    Target_TITULOSSUMA3: TStringField;
    Target_TITULOSSUMA4: TStringField;
    Target_TITULOSSUMA5: TStringField;
    Target_TITULOSSUMA6: TStringField;
    Target_TITULOSSUMA7: TStringField;
    Target_TITULOSRESTA8: TStringField;
    Target_TITULOSRESTA7: TStringField;
    Target_TITULOSSUMA8: TStringField;
    Target_PARAMETROSID_PARAMETROS: TIntegerField;
    Target_PARAMETROSLONGITUD_SUBCUENTAS: TIntegerField;
    Target_PARAMETROSFECHA_INICIO_APLICACION: TSQLTimeStampField;
    Target_PARAMETROSFECHA_INICIO_EJERCICIO: TSQLTimeStampField;
    Target_PARAMETROSFECHA_FIN_EJERCICIO: TSQLTimeStampField;
    Target_PARAMETROSCTO_REGULARIZACION: TStringField;
    Target_PARAMETROSSUBCUENTA_CIERRE: TStringField;
    Target_PARAMETROSMONEDA: TStringField;
    Target_PARAMETROSNOMBREFISCAL: TStringField;
    Target_PARAMETROSDIRECCION: TStringField;
    Target_PARAMETROSDIRECCION1: TStringField;
    Target_PARAMETROSPOBLACION: TStringField;
    Target_PARAMETROSCODPOSTAL: TStringField;
    Target_PARAMETROSPROVINCIA: TStringField;
    Target_PARAMETROSNIF: TStringField;
    Target_PARAMETROSCONTACTO: TStringField;
    Target_PARAMETROSDOCCLIENTE: TStringField;
    Target_PARAMETROSDOCPROVEEDOR: TStringField;
    Target_PARAMETROSDOC347: TStringField;
    Target_PARAMETROSFECHABLOQUEO: TSQLTimeStampField;
    Target_PARAMETROSCTO_APERTURA: TStringField;
    Target_PARAMETROSCTO_REGULARIZACION_ESP: TStringField;
    Target_PARAMETROSFECHAAMORTIZACION: TSQLTimeStampField;
    Target_PARAMETROSRECARGO: TStringField;
    Target_PARAMETROSCTO_APERTURA_ESP: TStringField;
    Target_PARAMETROSSCTAIVANORMAL: TStringField;
    Target_PARAMETROSSCTAIVAEXENTO: TStringField;
    Target_PARAMETROSSCTAIVAINTRA: TStringField;
    Target_PARAMETROSSCTAVENTAS: TStringField;
    Target_PARAMETROSSCTADEVOLUCION: TStringField;
    Target_PARAMETROSCTOIVANORMAL: TStringField;
    Target_PARAMETROSCTOIVAEXENTO: TStringField;
    Target_PARAMETROSCTOIVAINTRA: TStringField;
    Target_PARAMETROSCTOVENTAS: TStringField;
    Target_PARAMETROSCTODEVOLUCION: TStringField;
    Target_PARAMETROSCTOCLIENTES: TStringField;
    Target_PARAMETROSSCTADESCUENTO: TStringField;
    Target_PARAMETROSSCTACOMPRAS: TStringField;
    Target_PARAMETROSCTODESCUENTO: TStringField;
    Target_PARAMETROSCTOCOMPRAS: TStringField;
    Target_PARAMETROSSCTAIVAREDUCIDO: TStringField;
    Target_PARAMETROSCTOIVAREDUCIDO: TStringField;
    Target_PARAMETROSSCTAIVASUPER: TStringField;
    Target_PARAMETROSCTOIVASUPER: TStringField;
    Target_PARAMETROSCTOPROVEEDORES: TStringField;
    Target_PARAMETROSSCTAIVACNORMAL: TStringField;
    Target_PARAMETROSCTOIVACNORMAL: TStringField;
    Target_PARAMETROSSCTAIVACREDUCIDO: TStringField;
    Target_PARAMETROSCTOIVACREDUCIDO: TStringField;
    Target_PARAMETROSSCTAIVACSUPER: TStringField;
    Target_PARAMETROSCTOIVACSUPER: TStringField;
    Target_PARAMETROSSCTARECNORMAL: TStringField;
    Target_PARAMETROSCTORECNORMAL: TStringField;
    Target_PARAMETROSSCTARECREDUCIDO: TStringField;
    Target_PARAMETROSCTORECREDUCIDO: TStringField;
    Target_PARAMETROSSCTARECSUPER: TStringField;
    Target_PARAMETROSCTORECSUPER: TStringField;
    Target_PARAMETROSCTORECIBOVENTAS: TStringField;
    Target_PARAMETROSVGENERICA: TStringField;
    Target_PARAMETROSSUBCAJA: TStringField;
    Target_PARAMETROSCTOCOBROF: TStringField;
    Target_PARAMETROSCTONOME: TStringField;
    Target_PARAMETROSCTONOMT: TStringField;
    Target_PARAMETROSSCTANOMSUELDO: TStringField;
    Target_PARAMETROSSCTANOMIRPF: TStringField;
    Target_PARAMETROSSCTANOMPAGO: TStringField;
    Target_PARAMETROSSCTANOMSSE: TStringField;
    Target_PARAMETROSSCTANOMSST: TStringField;
    Target_PARAMETROSSCTANOMCARGO: TStringField;
    Target_PARAMETROSSCTADTOPPV: TStringField;
    Target_PARAMETROSSCTADTOPPC: TStringField;
    Target_PARAMETROSCTODTOPPV: TStringField;
    Target_PARAMETROSCTODTOPPC: TStringField;
    Target_PARAMETROSSCTARETPROF: TStringField;
    Target_PARAMETROSSCTARETARRE: TStringField;
    Target_PARAMETROSCTORETPROF: TStringField;
    Target_PARAMETROSCTORETARRE: TStringField;
    Target_PARAMETROSTANTORETPROF: TBCDField;
    Target_PARAMETROSTANTORETARRE: TBCDField;
    Target_PARAMETROSSCTAHACIVA: TStringField;
    Target_PARAMETROSCTOHACIVA: TStringField;
    Target_PARAMETROSSCTAIVACEXENTO: TStringField;
    Target_PARAMETROSCTOIVACEXENTO: TStringField;
    Target_PARAMETROSCTOPAGOF: TStringField;
    Target_PARAMETROSVGENERICAC: TStringField;
    Target_PARAMETROSTELEFONO: TStringField;
    Target_PARAMETROSFAX: TStringField;
    Target_PARAMETROSDOCIMPRIMIR: TStringField;
    Target_PARAMETROSSIGLAVIA: TStringField;
    Target_PARAMETROSNUMEROCALLE: TStringField;
    Target_PARAMETROSESCALERA: TStringField;
    Target_PARAMETROSPISO: TStringField;
    Target_PARAMETROSPUERTA: TStringField;
    Target_PARAMETROSCCC: TStringField;
    Target_PARAMETROSCODADMON: TStringField;
    Target_PARAMETROSGESTIONA_CARTERA_EFECTOS: TStringField;
    Target_PARAMETROSFILTRO_ASIENTOS_INICIO: TStringField;
    Target_PARAMETROSINCLUIR_ABREV: TStringField;
    Target_PARAMETROSSCTAEFECTDESCONTADOS: TStringField;
    Target_PARAMETROSSCTADEUDASDESCUENTOS: TStringField;
    Target_PARAMETROSASIENTOS_INICIO_INTERVALO_BQDA: TIntegerField;
    Target_PARAMETROSASIENTOS_FIN_INTERVALO_BQDA: TIntegerField;
    Target_PARAMETROSMOSTRAR_FILTRO_MAYOR: TStringField;
    Target_PARAMETROSCTOPROVINTRA: TStringField;
    Target_PARAMETROSASIENTO_INICIO_INTERVALO_FILTRO: TIntegerField;
    Target_PARAMETROSASIENTO_FIN_INTERVALO_FILTRO: TIntegerField;
    Target_PARAMETROSSCTAIVAINTRADEDUCIBLE: TStringField;
    Target_PARAMETROSSCTAIVACINTRADEDUCIBLE: TStringField;
    Target_PARAMETROSSCTAIVACINTRAREPERCUTIDO: TStringField;
    Target_PARAMETROSSCTAGENINTRACOM: TStringField;
    Target_PARAMETROSASIENTO_NOMINA_INDIVIDUAL: TStringField;
    Target_PARAMETROSSCTAIVAEXENTOCEE: TStringField;
    Target_PARAMETROSSCTAINTERESES: TStringField;
    Target_PARAMETROSSCTAEXPORTACIONES: TStringField;
    Target_PARAMETROSBUSQUEDA_SUBCTAS: TStringField;
    Target_PARAMETROSSCTAOTRASREMUN: TStringField;
    Target_PARAMETROSSCTABANCO: TStringField;
    Target_PARAMETROSCTOCOBRO: TStringField;
    Target_PARAMETROSCTOPAGO: TStringField;
    Target_PARAMETROSSCTAEFECTOSCOMERCIALES: TStringField;
    Target_PARAMETROSCTOEFECTOSCOMERCIALES: TStringField;
    Target_PARAMETROSCTODEUDASDESCUENTOS: TStringField;
    Target_PARAMETROSSCTAREMESAEFECTOS: TStringField;
    Target_PARAMETROSCTOREMESAEFECTOS: TStringField;
    Target_PARAMETROSDESCPROV_CARTERAEFECTOS: TStringField;
    Target_PARAMETROSDESCCLI_CARTERAEFECTOS: TStringField;
    Target_PARAMETROSTIPOEMPRESA: TStringField;
    Target_PARAMETROSFILTROSUBCTAS: TStringField;
    Target_PARAMETROSOFFICE2003: TStringField;
    Target_PARAMETROSTRATASERIE: TStringField;
    Target_PARAMETROSACTCOMENTARIO: TStringField;
    Target_LASIPREDASIENTO: TIntegerField;
    Target_LASIPREDAPUNTE: TIntegerField;
    Target_LASIPREDSUBCUENTA: TStringField;
    Target_LASIPREDCONCEPTO: TStringField;
    Target_LASIPREDCOMENTARIO: TStringField;
    Target_LASIPREDDEBEHABER: TStringField;
    Target_LASIPREDIMPORTE: TStringField;
    Target_LASIPREDCONTRAPARTIDA: TStringField;
    Target_LASIPREDFECHAVTO: TStringField;
    Target_LASIPREDCENTROCOSTE: TStringField;
    Target_LASIPREDNUMEROFACTURA: TStringField;
    Target_ASIPREDASIENTO: TIntegerField;
    Target_ASIPREDDESCRIPCION: TStringField;
    Target_SIAMID_SIAM: TIntegerField;
    Target_SIAMFECHAULTACTUALIZACION: TSQLTimeStampField;
    Target_SIAMULTIMAACTUALIZACION: TIntegerField;
    Target_SIAMVERSION: TStringField;
    Target_DIARIOID_DIARIO: TIntegerField;
    Target_DIARIOAPUNTE: TIntegerField;
    Target_DIARIOASIENTO: TIntegerField;
    Target_DIARIOBASEIMPONIBLE: TBCDField;
    Target_DIARIOCOMENTARIO: TStringField;
    Target_DIARIOCONTRAPARTIDA: TStringField;
    Target_DIARIODEBEHABER: TStringField;
    Target_DIARIOFECHA: TSQLTimeStampField;
    Target_DIARIOIMPORTE: TBCDField;
    Target_DIARIOIVA: TBCDField;
    Target_DIARIONIF: TStringField;
    Target_DIARIOMONEDA: TStringField;
    Target_DIARIONUMEROFACTURA: TStringField;
    Target_DIARIORECARGO: TBCDField;
    Target_DIARIOSUBCUENTA: TStringField;
    Target_DIARIOPUNTEO: TStringField;
    Target_DIARIOASIENTOPUNTEO: TIntegerField;
    Target_DIARIOPUNTEOIVA: TStringField;
    Target_DIARIOID_CONCEPTOS: TStringField;
    Target_DIARIOTIPODIARIO: TStringField;
    Target_DIARIOCUENTA_ANALITICA: TStringField;
    Target_DIARIOCUOTAIVA: TBCDField;
    Target_DIARIOCUOTARECARGO: TBCDField;
    Target_DIARIOTIPOASIENTO: TIntegerField;
    Target_DIARIOASIENTONOMINA: TIntegerField;
    Target_DIARIOEJERCICIO: TIntegerField;
    Target_DIARIOSERIE: TStringField;
    procedure BtnSIAMClick(Sender: TObject);
    procedure BtnConnectInterbaseClick(Sender: TObject);
    procedure BtnConnectSQLServerClick(Sender: TObject);
    procedure BtnASIPREDClick(Sender: TObject);
    procedure BtnLASIPREDClick(Sender: TObject);
    procedure BtnPARAMETROSClick(Sender: TObject);
    procedure BtnTITULOSClick(Sender: TObject);
    procedure BtnIVARClick(Sender: TObject);
    procedure BtnIVASClick(Sender: TObject);
    procedure BtnNOMINASClick(Sender: TObject);
    procedure BtnFORMASClick(Sender: TObject);
    procedure BtnPAISESClick(Sender: TObject);
    procedure BtnPROVINCIASClick(Sender: TObject);
    procedure BtnGRUPOSClick(Sender: TObject);
    procedure BtnCUENTASClick(Sender: TObject);
    procedure BtnSUBCTASClick(Sender: TObject);
    procedure BtnAMORTIZAClick(Sender: TObject);
    procedure BtnCONCEPTOSClick(Sender: TObject);
    procedure BtnCOMERCIALESClick(Sender: TObject);
    procedure BtnTIPODIARIOClick(Sender: TObject);
    procedure BtnDELEGACIONClick(Sender: TObject);
    procedure BtnDEPARTAMENTOClick(Sender: TObject);
    procedure BtnSECCIONClick(Sender: TObject);
    procedure BtnPROYECTOClick(Sender: TObject);
    procedure BtnANALITICASClick(Sender: TObject);
    procedure BtnCARTERAEFECTOSClick(Sender: TObject);
    procedure BtnDIARIOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDumpData: TFormDumpData;

implementation

{$R *.dfm}

procedure TFormDumpData.BtnConnectInterbaseClick(Sender: TObject);
begin
   try
      Interbase.Open;
      LabelInterbase.Caption := 'CONNECTED';
   except
      LabelInterbase.Caption := 'Not Connected';
   end;
end;

procedure TFormDumpData.BtnConnectSQLServerClick(Sender: TObject);
begin
   try
      SQLServer.Params.Values['Database'] := Trim(EditDatabaseName.Text);
      SQLServer.Open;
      LabelSQLServer.Caption := 'CONNECTED';
   except
      LabelSQLServer.Caption := 'Not Connected';
   end;
end;

procedure TFormDumpData.BtnSIAMClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_SIAM.Open;
   Target_SIAM.Open;
   try
     Count := Origin_SIAM.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_SIAM.Caption := IntToStr(Count);
     while not Origin_SIAM.EOF do begin
        Target_SIAM.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_SIAMID_SIAM.AsInteger                := Origin_SIAMID_SIAM.AsInteger;
        Target_SIAMFECHAULTACTUALIZACION.AsDateTime := Origin_SIAMFECHAULTACTUALIZACION.AsDateTime;
        Target_SIAMULTIMAACTUALIZACION.AsInteger    := Origin_SIAMULTIMAACTUALIZACION.AsInteger;
        Target_SIAMVERSION.AsString                 := Origin_SIAMVERSION.AsString;
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_SIAM.Post;
           Target_SIAM.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_SIAM.Caption := IntToStr(Passed);
        except

        end;
        Origin_SIAM.Next;
     end;
   finally
     Origin_SIAM.Close;
   end;
end;

procedure TFormDumpData.BtnASIPREDClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_ASIPRED.Open;
   Target_ASIPRED.Open;
   try
     Count := Origin_ASIPRED.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_ASIPRED.Caption := IntToStr(Count);
     while not Origin_ASIPRED.EOF do begin
        Target_ASIPRED.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_ASIPREDASIENTO.AsInteger    := Origin_ASIPREDASIENTO.AsInteger;
        Target_ASIPREDDESCRIPCION.AsString := Origin_ASIPREDDESCRIPCION.AsString;
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_ASIPRED.Post;
           Target_ASIPRED.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_ASIPRED.Caption := IntToStr(Passed);
        except

        end;
        Origin_ASIPRED.Next;
     end;
   finally
     Origin_ASIPRED.Close;
   end;
end;

procedure TFormDumpData.BtnLASIPREDClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_LASIPRED.Open;
   Target_LASIPRED.Open;
   try
     Count := Origin_LASIPRED.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_LASIPRED.Caption := IntToStr(Count);
     while not Origin_LASIPRED.EOF do begin
        Target_LASIPRED.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_LASIPREDASIENTO.AsInteger      := Origin_LASIPREDASIENTO.AsInteger;       //int            NOT NULL,
        if Origin_LASIPREDAPUNTE.IsNULL     //int            NOT NULL,
           then Target_LASIPREDAPUNTE.Clear
           else Target_LASIPREDAPUNTE.AsInteger       := Origin_LASIPREDAPUNTE.AsInteger;

        if Origin_LASIPREDSUBCUENTA.IsNull //varchar(10)    NULL,
           then Target_LASIPREDSUBCUENTA.Clear
           else Target_LASIPREDSUBCUENTA.AsString := Origin_LASIPREDSUBCUENTA.AsString;

        if Origin_LASIPREDCONCEPTO.IsNull //varchar(3)     NULL,
           then Target_LASIPREDCONCEPTO.Clear
           else Target_LASIPREDCONCEPTO.AsString := Origin_LASIPREDCONCEPTO.AsString;

        if Origin_LASIPREDCOMENTARIO.IsNull //varchar(30)    NULL,
           then Target_LASIPREDCOMENTARIO.Clear
           else Target_LASIPREDCOMENTARIO.AsString := Origin_LASIPREDCOMENTARIO.AsString;

        if Origin_LASIPREDDEBEHABER.IsNull //varchar(1)     NULL,
           then Target_LASIPREDDEBEHABER.Clear
           else Target_LASIPREDDEBEHABER.AsString := Origin_LASIPREDDEBEHABER.AsString;

        if Origin_LASIPREDIMPORTE.IsNull //varchar(15)    NULL,
           then Target_LASIPREDIMPORTE.Clear
           else Target_LASIPREDIMPORTE.AsString := Origin_LASIPREDIMPORTE.AsString;

        if Origin_LASIPREDCONTRAPARTIDA.IsNull //varchar(10)    NULL,
           then Target_LASIPREDCONTRAPARTIDA.Clear
           else Target_LASIPREDCONTRAPARTIDA.AsString := Origin_LASIPREDCONTRAPARTIDA.AsString;

        if Origin_LASIPREDFECHAVTO.IsNull //varchar(1)     NULL,
           then Target_LASIPREDFECHAVTO.Clear
           else Target_LASIPREDFECHAVTO.AsString := Origin_LASIPREDFECHAVTO.AsString;

        if Origin_LASIPREDCENTROCOSTE.IsNull //varchar(10)    NULL,
           then Target_LASIPREDCENTROCOSTE.Clear
           else Target_LASIPREDCENTROCOSTE.AsString := Origin_LASIPREDCENTROCOSTE.AsString;

        if Origin_LASIPREDNUMEROFACTURA.IsNull //varchar(1)     NULL,
           then Target_LASIPREDNUMEROFACTURA.Clear
           else Target_LASIPREDNUMEROFACTURA.AsString := Origin_LASIPREDNUMEROFACTURA.AsString;
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_LASIPRED.Post;
           Target_LASIPRED.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_LASIPRED.Caption := IntToStr(Passed);
        except

        end;
        Origin_LASIPRED.Next;
     end;
   finally
     Origin_LASIPRED.Close;
   end;
end;

procedure TFormDumpData.BtnPARAMETROSClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_PARAMETROS.Open;
   Target_PARAMETROS.Open;
   try
     Count := Origin_PARAMETROS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_PARAMETROS.Caption := IntToStr(Count);
     while not Origin_PARAMETROS.EOF do begin
        Target_PARAMETROS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_PARAMETROSID_PARAMETROS.AsInteger                   := Origin_PARAMETROSID_PARAMETROS.AsInteger; //                       int               NOT NULL,
        if not Origin_PARAMETROSLONGITUD_SUBCUENTAS.IsNull then
        Target_PARAMETROSLONGITUD_SUBCUENTAS.AsInteger             := Origin_PARAMETROSLONGITUD_SUBCUENTAS.AsInteger            ;    //int               NULL,

        if not Origin_PARAMETROSFECHA_INICIO_APLICACION.IsNull then
        Target_PARAMETROSFECHA_INICIO_APLICACION.AsDateTime        := Origin_PARAMETROSFECHA_INICIO_APLICACION.AsDateTime       ;    //datetime          NULL,

        if not Origin_PARAMETROSFECHA_INICIO_EJERCICIO.IsNull then
        Target_PARAMETROSFECHA_INICIO_EJERCICIO.AsDateTime         := Origin_PARAMETROSFECHA_INICIO_EJERCICIO.AsDateTime        ;    //datetime          NULL,

        if not Origin_PARAMETROSFECHA_FIN_EJERCICIO.IsNull then
        Target_PARAMETROSFECHA_FIN_EJERCICIO.AsDateTime            := Origin_PARAMETROSFECHA_FIN_EJERCICIO.AsDateTime           ;    //datetime          NULL,

        if not Origin_PARAMETROSCTO_REGULARIZACION.IsNull then
        Target_PARAMETROSCTO_REGULARIZACION.AsString               := Origin_PARAMETROSCTO_REGULARIZACION.AsString              ;    //char(3)           NULL,

        if not Origin_PARAMETROSSUBCUENTA_CIERRE.IsNull then
        Target_PARAMETROSSUBCUENTA_CIERRE.AsString                 := Origin_PARAMETROSSUBCUENTA_CIERRE.AsString                ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSMONEDA.IsNull then
        Target_PARAMETROSMONEDA.AsString                           := Origin_PARAMETROSMONEDA.AsString                          ;    //varchar(1)        NULL,

        if not Origin_PARAMETROSNOMBREFISCAL.IsNull then
        Target_PARAMETROSNOMBREFISCAL.AsString                     := Origin_PARAMETROSNOMBREFISCAL.AsString                    ;    //varchar(80)       NULL,

        if not Origin_PARAMETROSDIRECCION.IsNull then
        Target_PARAMETROSDIRECCION.AsString                        := Origin_PARAMETROSDIRECCION.AsString                       ;    //varchar(40)       NULL,

        if not Origin_PARAMETROSDIRECCION1.IsNull then
        Target_PARAMETROSDIRECCION1.AsString                       := Origin_PARAMETROSDIRECCION1.AsString                      ;    //varchar(40)       NULL,

        if not Origin_PARAMETROSPOBLACION.IsNull then
        Target_PARAMETROSPOBLACION.AsString                        := Origin_PARAMETROSPOBLACION.AsString                       ;    //varchar(40)       NULL,

        if not Origin_PARAMETROSCODPOSTAL.IsNull then
        Target_PARAMETROSCODPOSTAL.AsString                        := Origin_PARAMETROSCODPOSTAL.AsString                       ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSPROVINCIA.IsNull then
        Target_PARAMETROSPROVINCIA.AsString                        := Origin_PARAMETROSPROVINCIA.AsString                       ;    //char(2)           NULL,

        if not Origin_PARAMETROSNIF.IsNull then
        Target_PARAMETROSNIF.AsString                              := Origin_PARAMETROSNIF.AsString                             ;    //varchar(15)       NULL,

        if not Origin_PARAMETROSCONTACTO.IsNull then
        Target_PARAMETROSCONTACTO.AsString                         := Origin_PARAMETROSCONTACTO.AsString                        ;    //varchar(50)       NULL,

        if not Origin_PARAMETROSDOCCLIENTE.IsNull then
        Target_PARAMETROSDOCCLIENTE.AsString                       := Origin_PARAMETROSDOCCLIENTE.AsString                      ;    //varchar(100)      NULL,

        if not Origin_PARAMETROSDOCPROVEEDOR.IsNull then
        Target_PARAMETROSDOCPROVEEDOR.AsString                     := Origin_PARAMETROSDOCPROVEEDOR.AsString                    ;    //varchar(100)      NULL,

        if not Origin_PARAMETROSDOC347.IsNull then
        Target_PARAMETROSDOC347.AsString                           := Origin_PARAMETROSDOC347.AsString                          ;    //varchar(100)      NULL,

        if not Origin_PARAMETROSFECHABLOQUEO.IsNull then
        Target_PARAMETROSFECHABLOQUEO.AsDateTime                   := Origin_PARAMETROSFECHABLOQUEO.AsDateTime                  ;    //datetime          NULL,

        if not Origin_PARAMETROSCTO_APERTURA.IsNull then
        Target_PARAMETROSCTO_APERTURA.AsString                     := Origin_PARAMETROSCTO_APERTURA.AsString                    ;    //char(3)           NULL,

        if not Origin_PARAMETROSCTO_REGULARIZACION_ESP.IsNull then
        Target_PARAMETROSCTO_REGULARIZACION_ESP.AsString           := Origin_PARAMETROSCTO_REGULARIZACION_ESP.AsString          ;    //char(3)           NULL,

        if not Origin_PARAMETROSFECHAAMORTIZACION.IsNull then
        Target_PARAMETROSFECHAAMORTIZACION.AsDateTime              := Origin_PARAMETROSFECHAAMORTIZACION.AsDateTime             ;    //datetime          NULL,

        if not Origin_PARAMETROSRECARGO.IsNull then
        Target_PARAMETROSRECARGO.AsString                          := Origin_PARAMETROSRECARGO.AsString                         ;    //char(1)           NULL,

        if not Origin_PARAMETROSCTO_APERTURA_ESP.IsNull then
        Target_PARAMETROSCTO_APERTURA_ESP.AsString                 := Origin_PARAMETROSCTO_APERTURA_ESP.AsString                ;    //char(3)           NULL,

        if not Origin_PARAMETROSSCTAIVANORMAL.IsNull then
        Target_PARAMETROSSCTAIVANORMAL.AsString                    := Origin_PARAMETROSSCTAIVANORMAL.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAIVAEXENTO.IsNull then
        Target_PARAMETROSSCTAIVAEXENTO.AsString                    := Origin_PARAMETROSSCTAIVAEXENTO.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAIVAINTRA.IsNull then
        Target_PARAMETROSSCTAIVAINTRA.AsString                     := Origin_PARAMETROSSCTAIVAINTRA.AsString                    ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAVENTAS.IsNull then
        Target_PARAMETROSSCTAVENTAS.AsString                       := Origin_PARAMETROSSCTAVENTAS.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTADEVOLUCION.IsNull then
        Target_PARAMETROSSCTADEVOLUCION.AsString                   := Origin_PARAMETROSSCTADEVOLUCION.AsString                  ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVANORMAL.IsNull then
        Target_PARAMETROSCTOIVANORMAL.AsString                     := Origin_PARAMETROSCTOIVANORMAL.AsString                    ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOIVAEXENTO.IsNull then
        Target_PARAMETROSCTOIVAEXENTO.AsString                     := Origin_PARAMETROSCTOIVAEXENTO.AsString                    ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOIVAINTRA.IsNull then
        Target_PARAMETROSCTOIVAINTRA.AsString                      := Origin_PARAMETROSCTOIVAINTRA.AsString                     ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOVENTAS.IsNull then
        Target_PARAMETROSCTOVENTAS.AsString                        := Origin_PARAMETROSCTOVENTAS.AsString                       ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTODEVOLUCION.IsNull then
        Target_PARAMETROSCTODEVOLUCION.AsString                    := Origin_PARAMETROSCTODEVOLUCION.AsString                   ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOCLIENTES.IsNull then
        Target_PARAMETROSCTOCLIENTES.AsString                      := Origin_PARAMETROSCTOCLIENTES.AsString                     ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTADESCUENTO.IsNull then
        Target_PARAMETROSSCTADESCUENTO.AsString                    := Origin_PARAMETROSSCTADESCUENTO.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTACOMPRAS.IsNull then
        Target_PARAMETROSSCTACOMPRAS.AsString                      := Origin_PARAMETROSSCTACOMPRAS.AsString                     ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTODESCUENTO.IsNull then
        Target_PARAMETROSCTODESCUENTO.AsString                     := Origin_PARAMETROSCTODESCUENTO.AsString                    ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOCOMPRAS.IsNull then
        Target_PARAMETROSCTOCOMPRAS.AsString                       := Origin_PARAMETROSCTOCOMPRAS.AsString                      ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVAREDUCIDO.IsNull then
        Target_PARAMETROSSCTAIVAREDUCIDO.AsString                  := Origin_PARAMETROSSCTAIVAREDUCIDO.AsString                 ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVAREDUCIDO.IsNull then
        Target_PARAMETROSCTOIVAREDUCIDO.AsString                   := Origin_PARAMETROSCTOIVAREDUCIDO.AsString                  ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVASUPER.IsNull then
        Target_PARAMETROSSCTAIVASUPER.AsString                     := Origin_PARAMETROSSCTAIVASUPER.AsString                    ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVASUPER.IsNull then
        Target_PARAMETROSCTOIVASUPER.AsString                      := Origin_PARAMETROSCTOIVASUPER.AsString                     ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOPROVEEDORES.IsNull then
        Target_PARAMETROSCTOPROVEEDORES.AsString                   := Origin_PARAMETROSCTOPROVEEDORES.AsString                  ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVACNORMAL.IsNull then
        Target_PARAMETROSSCTAIVACNORMAL.AsString                   := Origin_PARAMETROSSCTAIVACNORMAL.AsString                  ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVACNORMAL.IsNull then
        Target_PARAMETROSCTOIVACNORMAL.AsString                    := Origin_PARAMETROSCTOIVACNORMAL.AsString                   ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVACREDUCIDO.IsNull then
        Target_PARAMETROSSCTAIVACREDUCIDO.AsString                 := Origin_PARAMETROSSCTAIVACREDUCIDO.AsString                ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVACREDUCIDO.IsNull then
        Target_PARAMETROSCTOIVACREDUCIDO.AsString                  := Origin_PARAMETROSCTOIVACREDUCIDO.AsString                 ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVACSUPER.IsNull then
        Target_PARAMETROSSCTAIVACSUPER.AsString                    := Origin_PARAMETROSSCTAIVACSUPER.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVACSUPER.IsNull then
        Target_PARAMETROSCTOIVACSUPER.AsString                     := Origin_PARAMETROSCTOIVACSUPER.AsString                    ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTARECNORMAL.IsNull then
        Target_PARAMETROSSCTARECNORMAL.AsString                    := Origin_PARAMETROSSCTARECNORMAL.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTORECNORMAL.IsNull then
        Target_PARAMETROSCTORECNORMAL.AsString                     := Origin_PARAMETROSCTORECNORMAL.AsString                    ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTARECREDUCIDO.IsNull then
        Target_PARAMETROSSCTARECREDUCIDO.AsString                  := Origin_PARAMETROSSCTARECREDUCIDO.AsString                 ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTORECREDUCIDO.IsNull then
        Target_PARAMETROSCTORECREDUCIDO.AsString                   := Origin_PARAMETROSCTORECREDUCIDO.AsString                  ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTARECSUPER.IsNull then
        Target_PARAMETROSSCTARECSUPER.AsString                     := Origin_PARAMETROSSCTARECSUPER.AsString                    ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTORECSUPER.IsNull then
        Target_PARAMETROSCTORECSUPER.AsString                      := Origin_PARAMETROSCTORECSUPER.AsString                     ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTORECIBOVENTAS.IsNull then
        Target_PARAMETROSCTORECIBOVENTAS.AsString                  := Origin_PARAMETROSCTORECIBOVENTAS.AsString                 ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSVGENERICA.IsNull then
        Target_PARAMETROSVGENERICA.AsString                        := Origin_PARAMETROSVGENERICA.AsString                       ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSUBCAJA.IsNull then
        Target_PARAMETROSSUBCAJA.AsString                          := Origin_PARAMETROSSUBCAJA.AsString                         ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOCOBROF.IsNull then
        Target_PARAMETROSCTOCOBROF.AsString                        := Origin_PARAMETROSCTOCOBROF.AsString                       ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTONOME.IsNull then
        Target_PARAMETROSCTONOME.AsString                          := Origin_PARAMETROSCTONOME.AsString                         ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTONOMT.IsNull then
        Target_PARAMETROSCTONOMT.AsString                          := Origin_PARAMETROSCTONOMT.AsString                         ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTANOMSUELDO.IsNull then
        Target_PARAMETROSSCTANOMSUELDO.AsString                    := Origin_PARAMETROSSCTANOMSUELDO.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTANOMIRPF.IsNull then
        Target_PARAMETROSSCTANOMIRPF.AsString                      := Origin_PARAMETROSSCTANOMIRPF.AsString                     ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTANOMPAGO.IsNull then
        Target_PARAMETROSSCTANOMPAGO.AsString                      := Origin_PARAMETROSSCTANOMPAGO.AsString                     ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTANOMSSE.IsNull then
        Target_PARAMETROSSCTANOMSSE.AsString                       := Origin_PARAMETROSSCTANOMSSE.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTANOMSST.IsNull then
        Target_PARAMETROSSCTANOMSST.AsString                       := Origin_PARAMETROSSCTANOMSST.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTANOMCARGO.IsNull then
        Target_PARAMETROSSCTANOMCARGO.AsString                     := Origin_PARAMETROSSCTANOMCARGO.AsString                    ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTADTOPPV.IsNull then
        Target_PARAMETROSSCTADTOPPV.AsString                       := Origin_PARAMETROSSCTADTOPPV.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTADTOPPC.IsNull then
        Target_PARAMETROSSCTADTOPPC.AsString                       := Origin_PARAMETROSSCTADTOPPC.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTODTOPPV.IsNull then
        Target_PARAMETROSCTODTOPPV.AsString                        := Origin_PARAMETROSCTODTOPPV.AsString                       ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTODTOPPC.IsNull then
        Target_PARAMETROSCTODTOPPC.AsString                        := Origin_PARAMETROSCTODTOPPC.AsString                       ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTARETPROF.IsNull then
        Target_PARAMETROSSCTARETPROF.AsString                      := Origin_PARAMETROSSCTARETPROF.AsString                     ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTARETARRE.IsNull then
        Target_PARAMETROSSCTARETARRE.AsString                      := Origin_PARAMETROSSCTARETARRE.AsString                     ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTORETPROF.IsNull then
        Target_PARAMETROSCTORETPROF.AsString                       := Origin_PARAMETROSCTORETPROF.AsString                      ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTORETARRE.IsNull then
        Target_PARAMETROSCTORETARRE.AsString                       := Origin_PARAMETROSCTORETARRE.AsString                      ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSTANTORETPROF.IsNull then
        Target_PARAMETROSTANTORETPROF.AsFloat                      := Origin_PARAMETROSTANTORETPROF.AsFloat                     ;    //decimal(14, 3)    NULL,

        if not Origin_PARAMETROSTANTORETARRE.IsNull then
        Target_PARAMETROSTANTORETARRE.AsFloat                      := Origin_PARAMETROSTANTORETARRE.AsFloat                     ;    //decimal(14, 3)    NULL,

        if not Origin_PARAMETROSSCTAHACIVA.IsNull then
        Target_PARAMETROSSCTAHACIVA.AsString                       := Origin_PARAMETROSSCTAHACIVA.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOHACIVA.IsNull then
        Target_PARAMETROSCTOHACIVA.AsString                        := Origin_PARAMETROSCTOHACIVA.AsString                       ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAIVACEXENTO.IsNull then
        Target_PARAMETROSSCTAIVACEXENTO.AsString                   := Origin_PARAMETROSSCTAIVACEXENTO.AsString                  ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOIVACEXENTO.IsNull then
        Target_PARAMETROSCTOIVACEXENTO.AsString                    := Origin_PARAMETROSCTOIVACEXENTO.AsString                   ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOPAGOF.IsNull then
        Target_PARAMETROSCTOPAGOF.AsString                         := Origin_PARAMETROSCTOPAGOF.AsString                        ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSVGENERICAC.IsNull then
        Target_PARAMETROSVGENERICAC.AsString                       := Origin_PARAMETROSVGENERICAC.AsString                      ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSTELEFONO.IsNull then
        Target_PARAMETROSTELEFONO.AsString                         := Origin_PARAMETROSTELEFONO.AsString                        ;    //varchar(16)       NULL,

        if not Origin_PARAMETROSFAX.IsNull then
        Target_PARAMETROSFAX.AsString                              := Origin_PARAMETROSFAX.AsString                             ;    //varchar(16)       NULL,

        if not Origin_PARAMETROSDOCIMPRIMIR.IsNull then
        Target_PARAMETROSDOCIMPRIMIR.AsString                      := Origin_PARAMETROSDOCIMPRIMIR.AsString                     ;    //char(1)           NULL,

        if not Origin_PARAMETROSSIGLAVIA.IsNull then
        Target_PARAMETROSSIGLAVIA.AsString                         := Origin_PARAMETROSSIGLAVIA.AsString                        ;    //char(2)           NULL,

        if not Origin_PARAMETROSNUMEROCALLE.IsNull then
        Target_PARAMETROSNUMEROCALLE.AsString                      := Origin_PARAMETROSNUMEROCALLE.AsString                     ;    //char(4)           NULL,

        if not Origin_PARAMETROSESCALERA.IsNull then
        Target_PARAMETROSESCALERA.AsString                         := Origin_PARAMETROSESCALERA.AsString                        ;    //char(2)           NULL,

        if not Origin_PARAMETROSPISO.IsNull then
        Target_PARAMETROSPISO.AsString                             := Origin_PARAMETROSPISO.AsString                            ;    //char(2)           NULL,

        if not Origin_PARAMETROSPUERTA.IsNull then
        Target_PARAMETROSPUERTA.AsString                           := Origin_PARAMETROSPUERTA.AsString                          ;    //char(2)           NULL,

        if not Origin_PARAMETROSCCC.IsNull then
        Target_PARAMETROSCCC.AsString                              := Origin_PARAMETROSCCC.AsString                             ;    //varchar(23)       NULL,

        if not Origin_PARAMETROSCODADMON.IsNull then
        Target_PARAMETROSCODADMON.AsString                         := Origin_PARAMETROSCODADMON.AsString                        ;    //char(5)           NULL,

        if not Origin_PARAMETROSGESTIONA_CARTERA_EFECTOS.IsNull then
        Target_PARAMETROSGESTIONA_CARTERA_EFECTOS.AsString         := Origin_PARAMETROSGESTIONA_CARTERA_EFECTOS.AsString        ;    //char(1)           NULL,

        if not Origin_PARAMETROSFILTRO_ASIENTOS_INICIO.IsNull then
        Target_PARAMETROSFILTRO_ASIENTOS_INICIO.AsString           := Origin_PARAMETROSFILTRO_ASIENTOS_INICIO.AsString          ;    //char(1)           NULL,

        if not Origin_PARAMETROSINCLUIR_ABREV.IsNull then
        Target_PARAMETROSINCLUIR_ABREV.AsString                    := Origin_PARAMETROSINCLUIR_ABREV.AsString                   ;    //char(1)           NULL,

        if not Origin_PARAMETROSSCTAEFECTDESCONTADOS.IsNull then
        Target_PARAMETROSSCTAEFECTDESCONTADOS.AsString             := Origin_PARAMETROSSCTAEFECTDESCONTADOS.AsString            ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTADEUDASDESCUENTOS.IsNull then
        Target_PARAMETROSSCTADEUDASDESCUENTOS.AsString             := Origin_PARAMETROSSCTADEUDASDESCUENTOS.AsString            ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSASIENTOS_INICIO_INTERVALO_BQDA.IsNull then
        Target_PARAMETROSASIENTOS_INICIO_INTERVALO_BQDA.AsInteger  := Origin_PARAMETROSASIENTOS_INICIO_INTERVALO_BQDA.AsInteger ;    //int               NULL,

        if not Origin_PARAMETROSASIENTOS_FIN_INTERVALO_BQDA.IsNull then
        Target_PARAMETROSASIENTOS_FIN_INTERVALO_BQDA.AsInteger     := Origin_PARAMETROSASIENTOS_FIN_INTERVALO_BQDA.AsInteger    ;    //int               NULL,

        if not Origin_PARAMETROSMOSTRAR_FILTRO_MAYOR.IsNull then
        Target_PARAMETROSMOSTRAR_FILTRO_MAYOR.AsString             := Origin_PARAMETROSMOSTRAR_FILTRO_MAYOR.AsString            ;    //char(1)           NULL,

        if not Origin_PARAMETROSCTOPROVINTRA.IsNull then
        Target_PARAMETROSCTOPROVINTRA.AsString                     := Origin_PARAMETROSCTOPROVINTRA.AsString                    ;    //char(3)           NULL,

        if not Origin_PARAMETROSASIENTO_INICIO_INTERVALO_FILTRO.IsNull then
        Target_PARAMETROSASIENTO_INICIO_INTERVALO_FILTRO.AsInteger := Origin_PARAMETROSASIENTO_INICIO_INTERVALO_FILTRO.AsInteger;    //int               NULL,

        if not Origin_PARAMETROSASIENTO_FIN_INTERVALO_FILTRO.IsNull then
        Target_PARAMETROSASIENTO_FIN_INTERVALO_FILTRO.AsInteger    := Origin_PARAMETROSASIENTO_FIN_INTERVALO_FILTRO.AsInteger   ;    //int               NULL,

        if not Origin_PARAMETROSSCTAIVAINTRADEDUCIBLE.IsNull then
        Target_PARAMETROSSCTAIVAINTRADEDUCIBLE.AsString            := Origin_PARAMETROSSCTAIVAINTRADEDUCIBLE.AsString           ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAIVACINTRADEDUCIBLE.IsNull then
        Target_PARAMETROSSCTAIVACINTRADEDUCIBLE.AsString           := Origin_PARAMETROSSCTAIVACINTRADEDUCIBLE.AsString          ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAIVACINTRAREPERCUTIDO.IsNull then
        Target_PARAMETROSSCTAIVACINTRAREPERCUTIDO.AsString         := Origin_PARAMETROSSCTAIVACINTRAREPERCUTIDO.AsString        ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAGENINTRACOM.IsNull then
        Target_PARAMETROSSCTAGENINTRACOM.AsString                  := Origin_PARAMETROSSCTAGENINTRACOM.AsString                 ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSASIENTO_NOMINA_INDIVIDUAL.IsNull then
        Target_PARAMETROSASIENTO_NOMINA_INDIVIDUAL.AsString        := Origin_PARAMETROSASIENTO_NOMINA_INDIVIDUAL.AsString       ;    //char(1)           NULL,

        if not Origin_PARAMETROSSCTAIVAEXENTOCEE.IsNull then
        Target_PARAMETROSSCTAIVAEXENTOCEE.AsString                 := Origin_PARAMETROSSCTAIVAEXENTOCEE.AsString                ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAINTERESES.IsNull then
        Target_PARAMETROSSCTAINTERESES.AsString                    := Origin_PARAMETROSSCTAINTERESES.AsString                   ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTAEXPORTACIONES.IsNull then
        Target_PARAMETROSSCTAEXPORTACIONES.AsString                := Origin_PARAMETROSSCTAEXPORTACIONES.AsString               ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSBUSQUEDA_SUBCTAS.IsNull then
        Target_PARAMETROSBUSQUEDA_SUBCTAS.AsString                 := Origin_PARAMETROSBUSQUEDA_SUBCTAS.AsString                ;    //char(1)           NULL,

        if not Origin_PARAMETROSSCTAOTRASREMUN.IsNull then
        Target_PARAMETROSSCTAOTRASREMUN.AsString                   := Origin_PARAMETROSSCTAOTRASREMUN.AsString                  ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSSCTABANCO.IsNull then
        Target_PARAMETROSSCTABANCO.AsString                        := Origin_PARAMETROSSCTABANCO.AsString                       ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOCOBRO.IsNull then
        Target_PARAMETROSCTOCOBRO.AsString                         := Origin_PARAMETROSCTOCOBRO.AsString                        ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTOPAGO.IsNull then
        Target_PARAMETROSCTOPAGO.AsString                          := Origin_PARAMETROSCTOPAGO.AsString                         ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAEFECTOSCOMERCIALES.IsNull then
        Target_PARAMETROSSCTAEFECTOSCOMERCIALES.AsString           := Origin_PARAMETROSSCTAEFECTOSCOMERCIALES.AsString          ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOEFECTOSCOMERCIALES.IsNull then
        Target_PARAMETROSCTOEFECTOSCOMERCIALES.AsString            := Origin_PARAMETROSCTOEFECTOSCOMERCIALES.AsString           ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSCTODEUDASDESCUENTOS.IsNull then
        Target_PARAMETROSCTODEUDASDESCUENTOS.AsString              := Origin_PARAMETROSCTODEUDASDESCUENTOS.AsString             ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSSCTAREMESAEFECTOS.IsNull then
        Target_PARAMETROSSCTAREMESAEFECTOS.AsString                := Origin_PARAMETROSSCTAREMESAEFECTOS.AsString               ;    //varchar(10)       NULL,

        if not Origin_PARAMETROSCTOREMESAEFECTOS.IsNull then
        Target_PARAMETROSCTOREMESAEFECTOS.AsString                 := Origin_PARAMETROSCTOREMESAEFECTOS.AsString                ;    //varchar(3)        NULL,

        if not Origin_PARAMETROSDESCPROV_CARTERAEFECTOS.IsNull then
        Target_PARAMETROSDESCPROV_CARTERAEFECTOS.AsString          := Origin_PARAMETROSDESCPROV_CARTERAEFECTOS.AsString         ;    //char(1)           NULL,

        if not Origin_PARAMETROSDESCCLI_CARTERAEFECTOS.IsNull then
        Target_PARAMETROSDESCCLI_CARTERAEFECTOS.AsString           := Origin_PARAMETROSDESCCLI_CARTERAEFECTOS.AsString          ;    //char(1)           NULL,

        if not Origin_PARAMETROSTIPOEMPRESA.IsNull then
        Target_PARAMETROSTIPOEMPRESA.AsString                      := Origin_PARAMETROSTIPOEMPRESA.AsString                     ;    //char(1)           NULL,

        if not Origin_PARAMETROSFILTROSUBCTAS.IsNull then
        Target_PARAMETROSFILTROSUBCTAS.AsString                    := Origin_PARAMETROSFILTROSUBCTAS.AsString                   ;    //char(3)           NULL,

        if not Origin_PARAMETROSOFFICE2003.IsNull then
        Target_PARAMETROSOFFICE2003.AsString                       := Origin_PARAMETROSOFFICE2003.AsString                      ;    //char(1)           NULL,

        if not Origin_PARAMETROSTRATASERIE.IsNull then
        Target_PARAMETROSTRATASERIE.AsString                       := Origin_PARAMETROSTRATASERIE.AsString                      ;    //char(1)           NULL,

        if not Origin_PARAMETROSACTCOMENTARIO.IsNull then
        Target_PARAMETROSACTCOMENTARIO.AsString                    := Origin_PARAMETROSACTCOMENTARIO.AsString                   ;    //char(1)           NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_PARAMETROS.Post;
           Target_PARAMETROS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_PARAMETROS.Caption := IntToStr(Passed);
        except

        end;
        Origin_PARAMETROS.Next;
     end;
   finally
     Origin_PARAMETROS.Close;
   end;
end;

procedure TFormDumpData.BtnTITULOSClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_TITULOS.Open;
   Target_TITULOS.Open;
   try
     Count := Origin_TITULOS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_TITULOS.Caption := IntToStr(Count);
     while not Origin_TITULOS.EOF do begin
        Target_TITULOS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        if not Origin_TITULOSTITULO.IsNull then
        Target_TITULOSTITULO.AsString      := Origin_TITULOSTITULO.AsString     ;   //char(2)       NOT NULL,

        if not Origin_TITULOSDESCRIPCION.IsNull then
        Target_TITULOSDESCRIPCION.AsString := Origin_TITULOSDESCRIPCION.AsString;   //char(50)      NOT NULL,

        if not Origin_TITULOSRESTA1.IsNull then
        Target_TITULOSRESTA1.AsString      := Origin_TITULOSRESTA1.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA2.IsNull then
        Target_TITULOSRESTA2.AsString      := Origin_TITULOSRESTA2.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA3.IsNull then
        Target_TITULOSRESTA3.AsString      := Origin_TITULOSRESTA3.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA4.IsNull then
        Target_TITULOSRESTA4.AsString      := Origin_TITULOSRESTA4.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA5.IsNull then
        Target_TITULOSRESTA5.AsString      := Origin_TITULOSRESTA5.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA6.IsNull then
        Target_TITULOSRESTA6.AsString      := Origin_TITULOSRESTA6.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA1.IsNull then
        Target_TITULOSSUMA1.AsString       := Origin_TITULOSSUMA1.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA2.IsNull then
        Target_TITULOSSUMA2.AsString       := Origin_TITULOSSUMA2.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA3.IsNull then
        Target_TITULOSSUMA3.AsString       := Origin_TITULOSSUMA3.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA4.IsNull then
        Target_TITULOSSUMA4.AsString       := Origin_TITULOSSUMA4.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA5.IsNull then
        Target_TITULOSSUMA5.AsString       := Origin_TITULOSSUMA5.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA6.IsNull then
        Target_TITULOSSUMA6.AsString       := Origin_TITULOSSUMA6.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA7.IsNull then
        Target_TITULOSSUMA7.AsString       := Origin_TITULOSSUMA7.AsString      ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA8.IsNull then
        Target_TITULOSRESTA8.AsString      := Origin_TITULOSRESTA8.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSRESTA7.IsNull then
        Target_TITULOSRESTA7.AsString      := Origin_TITULOSRESTA7.AsString     ;   //varchar(3)    NULL,

        if not Origin_TITULOSSUMA8.IsNull then
        Target_TITULOSSUMA8.AsString       := Origin_TITULOSSUMA8.AsString      ;   //varchar(3)    NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_TITULOS.Post;
           Target_TITULOS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_TITULOS.Caption := IntToStr(Passed);
        except

        end;
        Origin_TITULOS.Next;
     end;
   finally
     Origin_TITULOS.Close;
   end;
end;

procedure TFormDumpData.BtnIVARClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_IVAR.Open;
   Target_IVAR.Open;
   try
     Count := Origin_IVAR.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_IVAR.Caption := IntToStr(Count);
     while not Origin_IVAR.EOF do begin
        Target_IVAR.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_IVARTIPO.AsString        := Origin_IVARTIPO.AsString       ;    //char(1)     NOT NULL,
        Target_IVARDESCRIPCION.AsString := Origin_IVARDESCRIPCION.AsString;    //char(35)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_IVAR.Post;
           Target_IVAR.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_IVAR.Caption := IntToStr(Passed);
        except

        end;
        Origin_IVAR.Next;
     end;
   finally
     Origin_IVAR.Close;
   end;
end;

procedure TFormDumpData.BtnIVASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_IVAS.Open;
   Target_IVAS.Open;
   try
     Count := Origin_IVAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_IVAS.Caption := IntToStr(Count);
     while not Origin_IVAS.EOF do begin
        Target_IVAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_IVASTIPO.AsString        := Origin_IVASTIPO.AsString       ;    //char(1)     NOT NULL,
        Target_IVASDESCRIPCION.AsString := Origin_IVASDESCRIPCION.AsString;    //char(35)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_IVAS.Post;
           Target_IVAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_IVAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_IVAS.Next;
     end;
   finally
     Origin_IVAS.Close;
   end;
end;

procedure TFormDumpData.BtnNOMINASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_NOMINAS.Open;
   Target_NOMINAS.Open;
   try
     Count := Origin_NOMINAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_NOMINAS.Caption := IntToStr(Count);
     while not Origin_NOMINAS.EOF do begin
        Target_NOMINAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_NOMINASID_NOMINA.AsInteger      := Origin_NOMINASID_NOMINA.AsInteger     ;  //int               NOT NULL,
        Target_NOMINASASIENTO.AsInteger        := Origin_NOMINASASIENTO.AsInteger       ;  //int               NOT NULL,

        if not Origin_NOMINASNOMINA.IsNull then
        Target_NOMINASNOMINA.AsFloat           := Origin_NOMINASNOMINA.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_NOMINASIRPF.IsNull then
        Target_NOMINASIRPF.AsFloat             := Origin_NOMINASIRPF.AsFloat            ;  //decimal(14, 3)    NULL,

        if not Origin_NOMINASSSOCIAL.IsNull then
        Target_NOMINASSSOCIAL.AsFloat          := Origin_NOMINASSSOCIAL.AsFloat         ;  //decimal(14, 3)    NULL,

        if not Origin_NOMINASNETO.IsNull then
        Target_NOMINASNETO.AsFloat             := Origin_NOMINASNETO.AsFloat            ;  //decimal(14, 3)    NULL,

        if not Origin_NOMINASSUBCUENTA.IsNull then
        Target_NOMINASSUBCUENTA.AsString       := Origin_NOMINASSUBCUENTA.AsString      ;  //char(10)          NULL,

        if not Origin_NOMINASNOMINA_EMPLEADO.IsNull then
        Target_NOMINASNOMINA_EMPLEADO.AsString := Origin_NOMINASNOMINA_EMPLEADO.AsString;  //char(1)           NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_NOMINAS.Post;
           Target_NOMINAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_NOMINAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_NOMINAS.Next;
     end;
   finally
     Origin_NOMINAS.Close;
   end;

end;

procedure TFormDumpData.BtnFORMASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_FORMAS.Open;
   Target_FORMAS.Open;
   try
     Count := Origin_FORMAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_FORMAS.Caption := IntToStr(Count);
     while not Origin_FORMAS.EOF do begin
        Target_FORMAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_FORMASFORMAPAGO.AsString  := Origin_FORMASFORMAPAGO.AsString ;  //char(3)     NOT NULL,
        Target_FORMASDESCRIBE.AsString   := Origin_FORMASDESCRIBE.AsString  ;  //char(40)    NOT NULL,

        if not Origin_FORMASCLASE.IsNull then
        Target_FORMASCLASE.AsString      := Origin_FORMASCLASE.AsString     ;  //char(1)     NULL,

        if not Origin_FORMASINTERVALO.IsNull then
        Target_FORMASINTERVALO.AsInteger := Origin_FORMASINTERVALO.AsInteger;  //int         NULL,

        if not Origin_FORMASNUMVENCI.IsNull then
        Target_FORMASNUMVENCI.AsInteger  := Origin_FORMASNUMVENCI.AsInteger ;  //int         NULL,

        if not Origin_FORMASOBSOLETO.IsNull then
        Target_FORMASOBSOLETO.AsString   := Origin_FORMASOBSOLETO.AsString  ;  //char(1)     NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_FORMAS.Post;
           Target_FORMAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_FORMAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_FORMAS.Next;
     end;
   finally
     Origin_FORMAS.Close;
   end;
end;

procedure TFormDumpData.BtnPAISESClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_PAISES.Open;
   Target_PAISES.Open;
   try
     Count := Origin_PAISES.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_PAISES.Caption := IntToStr(Count);
     while not Origin_PAISES.EOF do begin
        Target_PAISES.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_PAISESPAIS.AsString   := Origin_PAISESPAIS.AsString  ;    //char(2)     NOT NULL,
        Target_PAISESNOMBRE.AsString := Origin_PAISESNOMBRE.AsString;    //char(30)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_PAISES.Post;
           Target_PAISES.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_PAISES.Caption := IntToStr(Passed);
        except

        end;
        Origin_PAISES.Next;
     end;
   finally
     Origin_PAISES.Close;
   end;
end;

procedure TFormDumpData.BtnPROVINCIASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_PROVINCIAS.Open;
   Target_PROVINCIAS.Open;
   try
     Count := Origin_PROVINCIAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_PROVINCIAS.Caption := IntToStr(Count);
     while not Origin_PROVINCIAS.EOF do begin
        Target_PROVINCIAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_PROVINCIASPROVINCIA.AsString := Origin_PROVINCIASPROVINCIA.AsString;   //char(2)     NOT NULL,
        Target_PROVINCIASNOMBRE.AsString    := Origin_PROVINCIASNOMBRE.AsString   ;   //char(25)    NOT NULL,

        if (not Origin_PROVINCIASCODIGO.IsNull) and (Trim(Origin_PROVINCIASCODIGO.AsString) <> '') then
           Target_PROVINCIASCODIGO.AsString    := Origin_PROVINCIASCODIGO.AsString       //char(2)     NOT NULL,
        else Target_PROVINCIASCODIGO.AsString    := 'XX';
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_PROVINCIAS.Post;
           Target_PROVINCIAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_PROVINCIAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_PROVINCIAS.Next;
     end;
   finally
     Origin_PROVINCIAS.Close;
   end;

end;

procedure TFormDumpData.BtnGRUPOSClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_GRUPOS.Open;
   Target_GRUPOS.Open;
   try
     Count := Origin_GRUPOS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_GRUPOS.Caption := IntToStr(Count);
     while not Origin_GRUPOS.EOF do begin
        Target_GRUPOS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_GRUPOSGRUPO.AsString       := Origin_GRUPOSGRUPO.AsString      ;    //char(3)     NOT NULL,
        Target_GRUPOSDESCRIPCION.AsString := Origin_GRUPOSDESCRIPCION.AsString;    //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_GRUPOS.Post;
           Target_GRUPOS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_GRUPOS.Caption := IntToStr(Passed);
        except

        end;
        Origin_GRUPOS.Next;
     end;
   finally
     Origin_GRUPOS.Close;
   end;
end;

procedure TFormDumpData.BtnCUENTASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_CUENTAS.Open;
   Target_CUENTAS.Open;
   try
     Count := Origin_CUENTAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_CUENTAS.Caption := IntToStr(Count);
     while not Origin_CUENTAS.EOF do begin
        Target_CUENTAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_CUENTASCUENTA.AsString      := Origin_CUENTASCUENTA.AsString     ;  //char(3)           NOT NULL,
        Target_CUENTASDESCRIPCION.AsString := Origin_CUENTASDESCRIPCION.AsString;  //char(50)          NOT NULL,

        if not Origin_CUENTASGRUPO1.IsNull then
        Target_CUENTASGRUPO1.AsString      := Origin_CUENTASGRUPO1.AsString     ;  //char(3)           NULL,

        if not Origin_CUENTASGRUPO2.IsNull then
        Target_CUENTASGRUPO2.AsString      := Origin_CUENTASGRUPO2.AsString     ;  //char(3)           NULL,

        if not Origin_CUENTASTIPOCUENTA.IsNull then
        Target_CUENTASTIPOCUENTA.AsString  := Origin_CUENTASTIPOCUENTA.AsString ;  //varchar(1)        NULL,

        if not Origin_CUENTASACUDB01.IsNull then
        Target_CUENTASACUDB01.AsFloat      := Origin_CUENTASACUDB01.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB02.IsNull then
        Target_CUENTASACUDB02.AsFloat      := Origin_CUENTASACUDB02.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB03.IsNull then
        Target_CUENTASACUDB03.AsFloat      := Origin_CUENTASACUDB03.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB04.IsNull then
        Target_CUENTASACUDB04.AsFloat      := Origin_CUENTASACUDB04.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB05.IsNull then
        Target_CUENTASACUDB05.AsFloat      := Origin_CUENTASACUDB05.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB06.IsNull then
        Target_CUENTASACUDB06.AsFloat      := Origin_CUENTASACUDB06.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB07.IsNull then
        Target_CUENTASACUDB07.AsFloat      := Origin_CUENTASACUDB07.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB08.IsNull then
        Target_CUENTASACUDB08.AsFloat      := Origin_CUENTASACUDB08.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB09.IsNull then
        Target_CUENTASACUDB09.AsFloat      := Origin_CUENTASACUDB09.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB10.IsNull then
        Target_CUENTASACUDB10.AsFloat      := Origin_CUENTASACUDB10.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB11.IsNull then
        Target_CUENTASACUDB11.AsFloat      := Origin_CUENTASACUDB11.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUDB12.IsNull then
        Target_CUENTASACUDB12.AsFloat      := Origin_CUENTASACUDB12.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB01.IsNull then
        Target_CUENTASACUHB01.AsFloat      := Origin_CUENTASACUHB01.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB02.IsNull then
        Target_CUENTASACUHB02.AsFloat      := Origin_CUENTASACUHB02.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB03.IsNull then
        Target_CUENTASACUHB03.AsFloat      := Origin_CUENTASACUHB03.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB04.IsNull then
        Target_CUENTASACUHB04.AsFloat      := Origin_CUENTASACUHB04.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB05.IsNull then
        Target_CUENTASACUHB05.AsFloat      := Origin_CUENTASACUHB05.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB06.IsNull then
        Target_CUENTASACUHB06.AsFloat      := Origin_CUENTASACUHB06.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB07.IsNull then
        Target_CUENTASACUHB07.AsFloat      := Origin_CUENTASACUHB07.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB08.IsNull then
        Target_CUENTASACUHB08.AsFloat      := Origin_CUENTASACUHB08.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB09.IsNull then
        Target_CUENTASACUHB09.AsFloat      := Origin_CUENTASACUHB09.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB10.IsNull then
        Target_CUENTASACUHB10.AsFloat      := Origin_CUENTASACUHB10.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB11.IsNull then
        Target_CUENTASACUHB11.AsFloat      := Origin_CUENTASACUHB11.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASACUHB12.IsNull then
        Target_CUENTASACUHB12.AsFloat      := Origin_CUENTASACUHB12.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB01.IsNull then
        Target_CUENTASANTDB01.AsFloat      := Origin_CUENTASANTDB01.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB02.IsNull then
        Target_CUENTASANTDB02.AsFloat      := Origin_CUENTASANTDB02.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB03.IsNull then
        Target_CUENTASANTDB03.AsFloat      := Origin_CUENTASANTDB03.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB04.IsNull then
        Target_CUENTASANTDB04.AsFloat      := Origin_CUENTASANTDB04.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB05.IsNull then
        Target_CUENTASANTDB05.AsFloat      := Origin_CUENTASANTDB05.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB06.IsNull then
        Target_CUENTASANTDB06.AsFloat      := Origin_CUENTASANTDB06.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB07.IsNull then
        Target_CUENTASANTDB07.AsFloat      := Origin_CUENTASANTDB07.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB08.IsNull then
        Target_CUENTASANTDB08.AsFloat      := Origin_CUENTASANTDB08.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB09.IsNull then
        Target_CUENTASANTDB09.AsFloat      := Origin_CUENTASANTDB09.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB10.IsNull then
        Target_CUENTASANTDB10.AsFloat      := Origin_CUENTASANTDB10.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB11.IsNull then
        Target_CUENTASANTDB11.AsFloat      := Origin_CUENTASANTDB11.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB12.IsNull then
        Target_CUENTASANTDB12.AsFloat      := Origin_CUENTASANTDB12.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB01.IsNull then
        Target_CUENTASANTHB01.AsFloat      := Origin_CUENTASANTHB01.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB02.IsNull then
        Target_CUENTASANTHB02.AsFloat      := Origin_CUENTASANTHB02.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB03.IsNull then
        Target_CUENTASANTHB03.AsFloat      := Origin_CUENTASANTHB03.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB04.IsNull then
        Target_CUENTASANTHB04.AsFloat      := Origin_CUENTASANTHB04.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB05.IsNull then
        Target_CUENTASANTHB05.AsFloat      := Origin_CUENTASANTHB05.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB06.IsNull then
        Target_CUENTASANTHB06.AsFloat      := Origin_CUENTASANTHB06.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB07.IsNull then
        Target_CUENTASANTHB07.AsFloat      := Origin_CUENTASANTHB07.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB08.IsNull then
        Target_CUENTASANTHB08.AsFloat      := Origin_CUENTASANTHB08.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB09.IsNull then
        Target_CUENTASANTHB09.AsFloat      := Origin_CUENTASANTHB09.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB10.IsNull then
        Target_CUENTASANTHB10.AsFloat      := Origin_CUENTASANTHB10.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB11.IsNull then
        Target_CUENTASANTHB11.AsFloat      := Origin_CUENTASANTHB11.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB12.IsNull then
        Target_CUENTASANTHB12.AsFloat      := Origin_CUENTASANTHB12.AsFloat     ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTHB.IsNull then
        Target_CUENTASANTHB.AsFloat        := Origin_CUENTASANTHB.AsFloat       ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASANTDB.IsNull then
        Target_CUENTASANTDB.AsFloat        := Origin_CUENTASANTDB.AsFloat       ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASSUMADB.IsNull then
        Target_CUENTASSUMADB.AsFloat       := Origin_CUENTASSUMADB.AsFloat      ;  //decimal(14, 3)    NULL,

        if not Origin_CUENTASSUMAHB.IsNull then
        Target_CUENTASSUMAHB.AsFloat       := Origin_CUENTASSUMAHB.AsFloat      ;  //decimal(14, 3)    NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_CUENTAS.Post;
           Target_CUENTAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_CUENTAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_CUENTAS.Next;
     end;
   finally
     Origin_CUENTAS.Close;
   end;
end;

procedure TFormDumpData.BtnSUBCTASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
    i      :Integer;
begin
   Passed := 0;
   for i := 1 to 2 do begin   { We make this in two loops}


   Origin_SUBCTAS.Open;
   Target_SUBCTAS.Open;
   try
     Count := Origin_SUBCTAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_SUBCTAS.Caption := IntToStr(Count);
     while not Origin_SUBCTAS.EOF do begin
        if i = 1 then begin {the first loop insert the subaccounts that haven't contrapartida}
           if not Origin_SUBCTASCONTRAPARTIDA.IsNull then begin
              Origin_SUBCTAS.Next;
              Continue;
           end;
        end
        else begin   {the second loop insert the subaccounts that have contrapartida, inserted of course in the first loop.}
           if Origin_SUBCTASCONTRAPARTIDA.IsNull then begin
              Origin_SUBCTAS.Next;
              Continue;
           end;
        end;
        Target_SUBCTAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_SUBCTASSUBCUENTA.AsString         := Origin_SUBCTASSUBCUENTA.AsString       ;  //varchar(10)       NOT NULL,

        if not Origin_SUBCTASDESCRIPCION.IsNull then
        Target_SUBCTASDESCRIPCION.AsString       := Origin_SUBCTASDESCRIPCION.AsString     ;  //varchar(80)       NULL,

        if not Origin_SUBCTASCONTRAPARTIDA.IsNull then
        Target_SUBCTASCONTRAPARTIDA.AsString     := Origin_SUBCTASCONTRAPARTIDA.AsString   ;  //varchar(10)       NULL,

        if not Origin_SUBCTASABREVIATURA.IsNull then
        Target_SUBCTASABREVIATURA.AsString       := Origin_SUBCTASABREVIATURA.AsString     ;  //varchar(10)       NULL,

        if not Origin_SUBCTASOBSOLETO.IsNull then
        Target_SUBCTASOBSOLETO.AsString          := Origin_SUBCTASOBSOLETO.AsString        ;  //char(1)           NULL,

        if not Origin_SUBCTASPROFESIONAL.IsNull then
        Target_SUBCTASPROFESIONAL.AsString       := Origin_SUBCTASPROFESIONAL.AsString     ;  //varchar(1)        NULL,

        if not Origin_SUBCTASARRENDADOR.IsNull then
        Target_SUBCTASARRENDADOR.AsString        := Origin_SUBCTASARRENDADOR.AsString      ;  //varchar(1)        NULL,

        if not Origin_SUBCTASINTRACOMUNITARIO.IsNull then
        Target_SUBCTASINTRACOMUNITARIO.AsString  := Origin_SUBCTASINTRACOMUNITARIO.AsString;  //char(1)           NULL,

        if not Origin_SUBCTASSUMADB.IsNull then
        Target_SUBCTASSUMADB.AsFloat             := Origin_SUBCTASSUMADB.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASSUMAHB.IsNull then
        Target_SUBCTASSUMAHB.AsFloat             := Origin_SUBCTASSUMAHB.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASNIF.IsNull then
        Target_SUBCTASNIF.AsString               := Origin_SUBCTASNIF.AsString             ;  //varchar(20)       NULL,

        if not Origin_SUBCTASDIRECCION.IsNull then
        Target_SUBCTASDIRECCION.AsString         := Origin_SUBCTASDIRECCION.AsString       ;  //varchar(35)       NULL,

        if not Origin_SUBCTASDIRECCION1.IsNull then
        Target_SUBCTASDIRECCION1.AsString        := Origin_SUBCTASDIRECCION1.AsString      ;  //varchar(35)       NULL,

        if not Origin_SUBCTASNUMERO.IsNull then
        Target_SUBCTASNUMERO.AsString            := Origin_SUBCTASNUMERO.AsString          ;  //varchar(10)       NULL,

        if not Origin_SUBCTASCODPOSTAL.IsNull then
        Target_SUBCTASCODPOSTAL.AsString         := Origin_SUBCTASCODPOSTAL.AsString       ;  //varchar(10)       NULL,

        if not Origin_SUBCTASPOBLACION.IsNull then
        Target_SUBCTASPOBLACION.AsString         := Origin_SUBCTASPOBLACION.AsString       ;  //varchar(60)       NULL,

        if not Origin_SUBCTASPROVINCIA.IsNull then
        Target_SUBCTASPROVINCIA.AsString         := Origin_SUBCTASPROVINCIA.AsString       ;  //char(2)           NULL,

        if not Origin_SUBCTASPAIS.IsNull then
        Target_SUBCTASPAIS.AsString              := Origin_SUBCTASPAIS.AsString            ;  //char(2)           NULL,

        if not Origin_SUBCTASTELEFONO.IsNull then
        Target_SUBCTASTELEFONO.AsString          := Origin_SUBCTASTELEFONO.AsString        ;  //varchar(16)       NULL,

        if not Origin_SUBCTASFAX.IsNull then
        Target_SUBCTASFAX.AsString               := Origin_SUBCTASFAX.AsString             ;  //varchar(16)       NULL,

        if not Origin_SUBCTASFORMAPAGO.IsNull then
        Target_SUBCTASFORMAPAGO.AsString         := Origin_SUBCTASFORMAPAGO.AsString       ;  //char(3)           NULL,

        if not Origin_SUBCTASTIPOIVA.IsNull then
        Target_SUBCTASTIPOIVA.AsString           := Origin_SUBCTASTIPOIVA.AsString         ;  //varchar(1)        NULL,

        if not Origin_SUBCTASIVA.IsNull then
        Target_SUBCTASIVA.AsFloat                := Origin_SUBCTASIVA.AsFloat              ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASRECARGO.IsNull then
        Target_SUBCTASRECARGO.AsFloat            := Origin_SUBCTASRECARGO.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASDIAPAGO1.IsNull then
        Target_SUBCTASDIAPAGO1.AsInteger         := Origin_SUBCTASDIAPAGO1.AsInteger       ;  //int               NULL,

        if not Origin_SUBCTASDIAPAGO2.IsNull then
        Target_SUBCTASDIAPAGO2.AsInteger         := Origin_SUBCTASDIAPAGO2.AsInteger       ;  //int               NULL,

        if not Origin_SUBCTASDIAPAGO3.IsNull then
        Target_SUBCTASDIAPAGO3.AsInteger         := Origin_SUBCTASDIAPAGO3.AsInteger       ;  //int               NULL,

        if not Origin_SUBCTASPRES01.IsNull then
        Target_SUBCTASPRES01.AsFloat             := Origin_SUBCTASPRES01.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES02.IsNull then
        Target_SUBCTASPRES02.AsFloat             := Origin_SUBCTASPRES02.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES03.IsNull then
        Target_SUBCTASPRES03.AsFloat             := Origin_SUBCTASPRES03.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES04.IsNull then
        Target_SUBCTASPRES04.AsFloat             := Origin_SUBCTASPRES04.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES05.IsNull then
        Target_SUBCTASPRES05.AsFloat             := Origin_SUBCTASPRES05.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES06.IsNull then
        Target_SUBCTASPRES06.AsFloat             := Origin_SUBCTASPRES06.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES07.IsNull then
        Target_SUBCTASPRES07.AsFloat             := Origin_SUBCTASPRES07.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES08.IsNull then
        Target_SUBCTASPRES08.AsFloat             := Origin_SUBCTASPRES08.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES09.IsNull then
        Target_SUBCTASPRES09.AsFloat             := Origin_SUBCTASPRES09.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES10.IsNull then
        Target_SUBCTASPRES10.AsFloat             := Origin_SUBCTASPRES10.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES11.IsNull then
        Target_SUBCTASPRES11.AsFloat             := Origin_SUBCTASPRES11.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRES12.IsNull then
        Target_SUBCTASPRES12.AsFloat             := Origin_SUBCTASPRES12.AsFloat           ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASPRESTOT.IsNull then
        Target_SUBCTASPRESTOT.AsFloat            := Origin_SUBCTASPRESTOT.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB01.IsNull then
        Target_SUBCTASACUDB01.AsFloat            := Origin_SUBCTASACUDB01.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB02.IsNull then
        Target_SUBCTASACUDB02.AsFloat            := Origin_SUBCTASACUDB02.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB03.IsNull then
        Target_SUBCTASACUDB03.AsFloat            := Origin_SUBCTASACUDB03.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB04.IsNull then
        Target_SUBCTASACUDB04.AsFloat            := Origin_SUBCTASACUDB04.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB05.IsNull then
        Target_SUBCTASACUDB05.AsFloat            := Origin_SUBCTASACUDB05.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB06.IsNull then
        Target_SUBCTASACUDB06.AsFloat            := Origin_SUBCTASACUDB06.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB07.IsNull then
        Target_SUBCTASACUDB07.AsFloat            := Origin_SUBCTASACUDB07.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB08.IsNull then
        Target_SUBCTASACUDB08.AsFloat            := Origin_SUBCTASACUDB08.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB09.IsNull then
        Target_SUBCTASACUDB09.AsFloat            := Origin_SUBCTASACUDB09.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB10.IsNull then
        Target_SUBCTASACUDB10.AsFloat            := Origin_SUBCTASACUDB10.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB11.IsNull then
        Target_SUBCTASACUDB11.AsFloat            := Origin_SUBCTASACUDB11.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUDB12.IsNull then
        Target_SUBCTASACUDB12.AsFloat            := Origin_SUBCTASACUDB12.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB01.IsNull then
        Target_SUBCTASACUHB01.AsFloat            := Origin_SUBCTASACUHB01.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB02.IsNull then
        Target_SUBCTASACUHB02.AsFloat            := Origin_SUBCTASACUHB02.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB03.IsNull then
        Target_SUBCTASACUHB03.AsFloat            := Origin_SUBCTASACUHB03.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB04.IsNull then
        Target_SUBCTASACUHB04.AsFloat            := Origin_SUBCTASACUHB04.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB05.IsNull then
        Target_SUBCTASACUHB05.AsFloat            := Origin_SUBCTASACUHB05.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB06.IsNull then
        Target_SUBCTASACUHB06.AsFloat            := Origin_SUBCTASACUHB06.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB07.IsNull then
        Target_SUBCTASACUHB07.AsFloat            := Origin_SUBCTASACUHB07.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB08.IsNull then
        Target_SUBCTASACUHB08.AsFloat            := Origin_SUBCTASACUHB08.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB09.IsNull then
        Target_SUBCTASACUHB09.AsFloat            := Origin_SUBCTASACUHB09.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB10.IsNull then
        Target_SUBCTASACUHB10.AsFloat            := Origin_SUBCTASACUHB10.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB11.IsNull then
        Target_SUBCTASACUHB11.AsFloat            := Origin_SUBCTASACUHB11.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASACUHB12.IsNull then
        Target_SUBCTASACUHB12.AsFloat            := Origin_SUBCTASACUHB12.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB.IsNull then
        Target_SUBCTASANTDB.AsFloat              := Origin_SUBCTASANTDB.AsFloat            ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB01.IsNull then
        Target_SUBCTASANTDB01.AsFloat            := Origin_SUBCTASANTDB01.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB02.IsNull then
        Target_SUBCTASANTDB02.AsFloat            := Origin_SUBCTASANTDB02.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB03.IsNull then
        Target_SUBCTASANTDB03.AsFloat            := Origin_SUBCTASANTDB03.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB04.IsNull then
        Target_SUBCTASANTDB04.AsFloat            := Origin_SUBCTASANTDB04.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB05.IsNull then
        Target_SUBCTASANTDB05.AsFloat            := Origin_SUBCTASANTDB05.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB06.IsNull then
        Target_SUBCTASANTDB06.AsFloat            := Origin_SUBCTASANTDB06.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB07.IsNull then
        Target_SUBCTASANTDB07.AsFloat            := Origin_SUBCTASANTDB07.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB08.IsNull then
        Target_SUBCTASANTDB08.AsFloat            := Origin_SUBCTASANTDB08.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB09.IsNull then
        Target_SUBCTASANTDB09.AsFloat            := Origin_SUBCTASANTDB09.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB10.IsNull then
        Target_SUBCTASANTDB10.AsFloat            := Origin_SUBCTASANTDB10.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB11.IsNull then
        Target_SUBCTASANTDB11.AsFloat            := Origin_SUBCTASANTDB11.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTDB12.IsNull then
        Target_SUBCTASANTDB12.AsFloat            := Origin_SUBCTASANTDB12.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB.IsNull then
        Target_SUBCTASANTHB.AsFloat              := Origin_SUBCTASANTHB.AsFloat            ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB01.IsNull then
        Target_SUBCTASANTHB01.AsFloat            := Origin_SUBCTASANTHB01.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB02.IsNull then
        Target_SUBCTASANTHB02.AsFloat            := Origin_SUBCTASANTHB02.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB03.IsNull then
        Target_SUBCTASANTHB03.AsFloat            := Origin_SUBCTASANTHB03.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB04.IsNull then
        Target_SUBCTASANTHB04.AsFloat            := Origin_SUBCTASANTHB04.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB05.IsNull then
        Target_SUBCTASANTHB05.AsFloat            := Origin_SUBCTASANTHB05.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB06.IsNull then
        Target_SUBCTASANTHB06.AsFloat            := Origin_SUBCTASANTHB06.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB07.IsNull then
        Target_SUBCTASANTHB07.AsFloat            := Origin_SUBCTASANTHB07.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB08.IsNull then
        Target_SUBCTASANTHB08.AsFloat            := Origin_SUBCTASANTHB08.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB09.IsNull then
        Target_SUBCTASANTHB09.AsFloat            := Origin_SUBCTASANTHB09.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB10.IsNull then
        Target_SUBCTASANTHB10.AsFloat            := Origin_SUBCTASANTHB10.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB11.IsNull then
        Target_SUBCTASANTHB11.AsFloat            := Origin_SUBCTASANTHB11.AsFloat          ;  //decimal(14, 3)    NULL,

        if not Origin_SUBCTASANTHB12.IsNull then
        Target_SUBCTASANTHB12.AsFloat            := Origin_SUBCTASANTHB12.AsFloat          ;  //decimal(14, 3)    NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_SUBCTAS.Post;
           Target_SUBCTAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_SUBCTAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_SUBCTAS.Next;
     end;
   finally
     Origin_SUBCTAS.Close;
   end;

   end; // for i := 1 to 2 do begin
end;

procedure TFormDumpData.BtnAMORTIZAClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_AMORTIZA.Open;
   Target_AMORTIZA.Open;
   try
     Count := Origin_AMORTIZA.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_AMORTIZA.Caption := IntToStr(Count);
     while not Origin_AMORTIZA.EOF do begin
        Target_AMORTIZA.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_AMORTIZASUBCUENTA.AsString   := Origin_AMORTIZASUBCUENTA.AsString  ;   //varchar(10)       NOT NULL,

        if not Origin_AMORTIZACENTROCOSTE.IsNull then
        Target_AMORTIZACENTROCOSTE.AsString := Origin_AMORTIZACENTROCOSTE.AsString;   //varchar(10)       NULL,

        if not Origin_AMORTIZAFCOMPRA.IsNull then
        Target_AMORTIZAFCOMPRA.AsDatetime   := Origin_AMORTIZAFCOMPRA.AsDatetime  ;   //datetime          NULL,

        if not Origin_AMORTIZAFINICIO.IsNull then
        Target_AMORTIZAFINICIO.AsDatetime   := Origin_AMORTIZAFINICIO.AsDatetime  ;   //datetime          NULL,

        if not Origin_AMORTIZAFULTAMOR.IsNull then
        Target_AMORTIZAFULTAMOR.AsDatetime  := Origin_AMORTIZAFULTAMOR.AsDatetime ;   //datetime          NULL,

        if not Origin_AMORTIZAFFINAMOR.IsNull then
        Target_AMORTIZAFFINAMOR.AsDatetime  := Origin_AMORTIZAFFINAMOR.AsDatetime ;   //datetime          NULL,

        if not Origin_AMORTIZAFBAJA.IsNull then
        Target_AMORTIZAFBAJA.AsDatetime     := Origin_AMORTIZAFBAJA.AsDatetime    ;   //datetime          NULL,

        if not Origin_AMORTIZASUBGASTO.IsNull then
        Target_AMORTIZASUBGASTO.AsString    := Origin_AMORTIZASUBGASTO.AsString   ;   //varchar(10)       NULL,

        if not Origin_AMORTIZASUBAMOR.IsNull then
        Target_AMORTIZASUBAMOR.AsString     := Origin_AMORTIZASUBAMOR.AsString    ;   //varchar(10)       NULL,

        if not Origin_AMORTIZAPERIODO.IsNull then
        Target_AMORTIZAPERIODO.AsString     := Origin_AMORTIZAPERIODO.AsString    ;   //varchar(1)        NULL,

        if not Origin_AMORTIZAANUAL.IsNull then
        Target_AMORTIZAANUAL.AsFloat        := Origin_AMORTIZAANUAL.AsFloat       ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAPROVEEDOR.IsNull then
        Target_AMORTIZAPROVEEDOR.AsString   := Origin_AMORTIZAPROVEEDOR.AsString  ;   //varchar(10)       NULL,

        if not Origin_AMORTIZAFACTURA.IsNull then
        Target_AMORTIZAFACTURA.AsString     := Origin_AMORTIZAFACTURA.AsString    ;   //varchar(15)       NULL,

        if not Origin_AMORTIZAVCOMPRA.IsNull then
        Target_AMORTIZAVCOMPRA.AsFloat      := Origin_AMORTIZAVCOMPRA.AsFloat     ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVRESIDUAL.IsNull then
        Target_AMORTIZAVRESIDUAL.AsFloat    := Origin_AMORTIZAVRESIDUAL.AsFloat   ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVAMOR.IsNull then
        Target_AMORTIZAVAMOR.AsFloat        := Origin_AMORTIZAVAMOR.AsFloat       ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVEJPINICIO.IsNull then
        Target_AMORTIZAVEJPINICIO.AsFloat   := Origin_AMORTIZAVEJPINICIO.AsFloat  ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVEJAINICIO.IsNull then
        Target_AMORTIZAVEJAINICIO.AsFloat   := Origin_AMORTIZAVEJAINICIO.AsFloat  ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVEJPAMOR.IsNull then
        Target_AMORTIZAVEJPAMOR.AsFloat     := Origin_AMORTIZAVEJPAMOR.AsFloat    ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZAVEJAAMOR.IsNull then
        Target_AMORTIZAVEJAAMOR.AsFloat     := Origin_AMORTIZAVEJAAMOR.AsFloat    ;   //decimal(14, 3)    NULL,

        if not Origin_AMORTIZACLASE.IsNull then
        Target_AMORTIZACLASE.AsFloat        := Origin_AMORTIZACLASE.AsFloat       ;   //decimal(14, 3)    NULL,

        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_AMORTIZA.Post;
           Target_AMORTIZA.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_AMORTIZA.Caption := IntToStr(Passed);
        except

        end;
        Origin_AMORTIZA.Next;
     end;
   finally
     Origin_AMORTIZA.Close;
   end;
end;

procedure TFormDumpData.BtnCONCEPTOSClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_CONCEPTOS.Open;
   Target_CONCEPTOS.Open;
   try
     Count := Origin_CONCEPTOS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_CONCEPTOS.Caption := IntToStr(Count);
     while not Origin_CONCEPTOS.EOF do begin
        Target_CONCEPTOS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_CONCEPTOSID_CONCEPTOS.AsString     := Origin_CONCEPTOSID_CONCEPTOS.AsString    ;   //char(3)        NOT NULL,
        Target_CONCEPTOSDESCRIPCION.AsString      := Origin_CONCEPTOSDESCRIPCION.AsString     ;   //char(30)       NOT NULL,

        if not Origin_CONCEPTOSTIPOCONTABILIDAD.IsNull then
        Target_CONCEPTOSTIPOCONTABILIDAD.AsString := Origin_CONCEPTOSTIPOCONTABILIDAD.AsString;   //char(1)        NULL,

        if not Origin_CONCEPTOSTIPOCONCEPTO.IsNull then
        Target_CONCEPTOSTIPOCONCEPTO.AsString     := Origin_CONCEPTOSTIPOCONCEPTO.AsString    ;   //char(1)        NULL,

        if not Origin_CONCEPTOSOBSOLETO.IsNull then
        Target_CONCEPTOSOBSOLETO.AsString         := Origin_CONCEPTOSOBSOLETO.AsString        ;   //char(1)        NULL,

        if not Origin_CONCEPTOSSUBCUENTA.IsNull then
        Target_CONCEPTOSSUBCUENTA.AsString        := Origin_CONCEPTOSSUBCUENTA.AsString       ;   //varchar(10)    NULL,

        if not Origin_CONCEPTOSCONTRAPARTIDA.IsNull then
        Target_CONCEPTOSCONTRAPARTIDA.AsString    := Origin_CONCEPTOSCONTRAPARTIDA.AsString   ;   //varchar(10)    NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_CONCEPTOS.Post;
           Target_CONCEPTOS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_CONCEPTOS.Caption := IntToStr(Passed);
        except

        end;
        Origin_CONCEPTOS.Next;
     end;
   finally
     Origin_CONCEPTOS.Close;
   end;
end;

procedure TFormDumpData.BtnCOMERCIALESClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_COMERCIALES.Open;
   Target_COMERCIALES.Open;
   try
     Count := Origin_COMERCIALES.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_COMERCIALES.Caption := IntToStr(Count);
     while not Origin_COMERCIALES.EOF do begin
        Target_COMERCIALES.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_COMERCIALESCOMERCIAL.AsString := Origin_COMERCIALESCOMERCIAL.AsString;    //char(10)    NOT NULL,
        Target_COMERCIALESNOMBRE.AsString    := Origin_COMERCIALESNOMBRE.AsString;       //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_COMERCIALES.Post;
           Target_COMERCIALES.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_COMERCIALES.Caption := IntToStr(Passed);
        except

        end;
        Origin_COMERCIALES.Next;
     end;
   finally
     Origin_COMERCIALES.Close;
   end;
end;

procedure TFormDumpData.BtnTIPODIARIOClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_TIPODIARIO.Open;
   Target_TIPODIARIO.Open;
   try
     Count := Origin_TIPODIARIO.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_TIPODIARIO.Caption := IntToStr(Count);
     while not Origin_TIPODIARIO.EOF do begin
        Target_TIPODIARIO.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_TIPODIARIOTIPODIARIO.AsString  := Origin_TIPODIARIOTIPODIARIO.AsString;    //char(2)     NOT NULL,
        Target_TIPODIARIODESCRIPCION.AsString := Origin_TIPODIARIODESCRIPCION.AsString;   //char(30)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_TIPODIARIO.Post;
           Target_TIPODIARIO.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_TIPODIARIO.Caption := IntToStr(Passed);
        except

        end;
        Origin_TIPODIARIO.Next;
     end;
   finally
     Origin_TIPODIARIO.Close;
   end;
end;

procedure TFormDumpData.BtnDELEGACIONClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_DELEGACION.Open;
   Target_DELEGACION.Open;
   try
     Count := Origin_DELEGACION.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_DELEGACION.Caption := IntToStr(Count);
     while not Origin_DELEGACION.EOF do begin
        Target_DELEGACION.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_DELEGACIONID_DELEGACION.AsString := Origin_DELEGACIONID_DELEGACION.AsString;  //char(10)    NOT NULL,
        Target_DELEGACIONNOMBRE.AsString        := Origin_DELEGACIONNOMBRE.AsString;         //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_DELEGACION.Post;
           Target_DELEGACION.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_DELEGACION.Caption := IntToStr(Passed);
        except

        end;
        Origin_DELEGACION.Next;
     end;
   finally
     Origin_DELEGACION.Close;
   end;
end;

procedure TFormDumpData.BtnDEPARTAMENTOClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_DEPARTAMENTO.Open;
   Target_DEPARTAMENTO.Open;
   try
     Count := Origin_DEPARTAMENTO.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_DEPARTAMENTO.Caption := IntToStr(Count);
     while not Origin_DEPARTAMENTO.EOF do begin
        Target_DEPARTAMENTO.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_DEPARTAMENTOID_DEPARTAMENTO.AsString := Origin_DEPARTAMENTOID_DEPARTAMENTO.AsString;  //char(10)    NOT NULL,
        Target_DEPARTAMENTONOMBRE.AsString          := Origin_DEPARTAMENTONOMBRE.AsString;           //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_DEPARTAMENTO.Post;
           Target_DEPARTAMENTO.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_DEPARTAMENTO.Caption := IntToStr(Passed);
        except

        end;
        Origin_DEPARTAMENTO.Next;
     end;
   finally
     Origin_DEPARTAMENTO.Close;
   end;
end;

procedure TFormDumpData.BtnSECCIONClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_SECCION.Open;
   Target_SECCION.Open;
   try
     Count := Origin_SECCION.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_SECCION.Caption := IntToStr(Count);
     while not Origin_SECCION.EOF do begin
        Target_SECCION.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_SECCIONID_SECCION.AsString := Origin_SECCIONID_SECCION.AsString;    //char(10)    NOT NULL,
        Target_SECCIONNOMBRE.AsString     := Origin_SECCIONNOMBRE.AsString;        //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_SECCION.Post;
           Target_SECCION.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_SECCION.Caption := IntToStr(Passed);
        except

        end;
        Origin_SECCION.Next;
     end;
   finally
     Origin_SECCION.Close;
   end;
end;

procedure TFormDumpData.BtnPROYECTOClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_PROYECTO.Open;
   Target_PROYECTO.Open;
   try
     Count := Origin_PROYECTO.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_PROYECTO.Caption := IntToStr(Count);
     while not Origin_PROYECTO.EOF do begin
        Target_PROYECTO.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_PROYECTOID_PROYECTO.AsString := Origin_PROYECTOID_PROYECTO.AsString;  //char(10)    NOT NULL,
        Target_PROYECTONOMBRE.AsString      := Origin_PROYECTONOMBRE.AsString;       //char(50)    NOT NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_PROYECTO.Post;
           Target_PROYECTO.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_PROYECTO.Caption := IntToStr(Passed);
        except

        end;
        Origin_PROYECTO.Next;
     end;
   finally
     Origin_PROYECTO.Close;
   end;
end;

procedure TFormDumpData.BtnANALITICASClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_ANALITICAS.Open;
   Target_ANALITICAS.Open;
   try
     Count := Origin_ANALITICAS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_ANALITICAS.Caption := IntToStr(Count);
     while not Origin_ANALITICAS.EOF do begin
        Target_ANALITICAS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_ANALITICASCUENTA.AsString          := Origin_ANALITICASCUENTA.AsString         ;   //char(10)    NOT NULL,
        Target_ANALITICASNOMBRE.AsString          := Origin_ANALITICASNOMBRE.AsString         ;   //char(50)    NOT NULL,

        if not Origin_ANALITICASID_PROYECTO.IsNull then
        Target_ANALITICASID_PROYECTO.AsString     := Origin_ANALITICASID_PROYECTO.AsString    ;   //char(10)    NULL,

        if not Origin_ANALITICASID_SECCION.IsNull then
        Target_ANALITICASID_SECCION.AsString      := Origin_ANALITICASID_SECCION.AsString     ;   //char(10)    NULL,

        if not Origin_ANALITICASID_DEPARTAMENTO.IsNull then
        Target_ANALITICASID_DEPARTAMENTO.AsString := Origin_ANALITICASID_DEPARTAMENTO.AsString;   //char(10)    NULL,

        if not Origin_ANALITICASID_DELEGACION.IsNull then
        Target_ANALITICASID_DELEGACION.AsString   := Origin_ANALITICASID_DELEGACION.AsString  ;   //char(10)    NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_ANALITICAS.Post;
           Target_ANALITICAS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_ANALITICAS.Caption := IntToStr(Passed);
        except

        end;
        Origin_ANALITICAS.Next;
     end;
   finally
     Origin_ANALITICAS.Close;
   end;
end;

procedure TFormDumpData.BtnCARTERAEFECTOSClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_CARTERAEFECTOS.Open;
   Target_CARTERAEFECTOS.Open;
   try
     Count := Origin_CARTERAEFECTOS.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_CARTERAEFECTOS.Caption := IntToStr(Count);
     while not Origin_CARTERAEFECTOS.EOF do begin
        Target_CARTERAEFECTOS.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
        Target_CARTERAEFECTOSID_CARTERAEFECTOS.AsInteger := Origin_CARTERAEFECTOSID_CARTERAEFECTOS.AsInteger;  //int               NOT NULL,

        if not Origin_CARTERAEFECTOSSUBCUENTA.IsNull then
        Target_CARTERAEFECTOSSUBCUENTA.AsString          := Origin_CARTERAEFECTOSSUBCUENTA.AsString         ;  //varchar(10)       NULL,

        if not Origin_CARTERAEFECTOSSITUACION.IsNull then
        Target_CARTERAEFECTOSSITUACION.AsString          := Origin_CARTERAEFECTOSSITUACION.AsString         ;  //char(1)           NULL,

        if not Origin_CARTERAEFECTOSSUBCTABANCO.IsNull then
        Target_CARTERAEFECTOSSUBCTABANCO.AsString        := Origin_CARTERAEFECTOSSUBCTABANCO.AsString       ;  //varchar(10)       NULL,

        if not Origin_CARTERAEFECTOSCONCEPTO.IsNull then
        Target_CARTERAEFECTOSCONCEPTO.AsString           := Origin_CARTERAEFECTOSCONCEPTO.AsString          ;  //varchar(50)       NULL,

        if not Origin_CARTERAEFECTOSFEMISION.IsNull then
        Target_CARTERAEFECTOSFEMISION.AsDateTime         := Origin_CARTERAEFECTOSFEMISION.AsDateTime        ;  //datetime          NULL,

        if not Origin_CARTERAEFECTOSFASIENTO.IsNull then
        Target_CARTERAEFECTOSFASIENTO.AsDatetime         := Origin_CARTERAEFECTOSFASIENTO.AsDatetime        ;  //datetime          NULL,

        if not Origin_CARTERAEFECTOSIMPORTE.IsNull then
        Target_CARTERAEFECTOSIMPORTE.AsString            := Origin_CARTERAEFECTOSIMPORTE.AsString           ;  //decimal(14, 3)    NULL,

        if not Origin_CARTERAEFECTOSFACTCLIENT.IsNull then
        Target_CARTERAEFECTOSFACTCLIENT.AsString         := Origin_CARTERAEFECTOSFACTCLIENT.AsString        ;  //varchar(10)       NULL,

        if not Origin_CARTERAEFECTOSFACTPROVEEDOR.IsNull then
        Target_CARTERAEFECTOSFACTPROVEEDOR.AsString      := Origin_CARTERAEFECTOSFACTPROVEEDOR.AsString     ;  //varchar(15)       NULL,

        if not Origin_CARTERAEFECTOSFVENCIMIENTO.IsNull then
        Target_CARTERAEFECTOSFVENCIMIENTO.AsDateTime     := Origin_CARTERAEFECTOSFVENCIMIENTO.AsDateTime    ;  //datetime          NULL,

        if not Origin_CARTERAEFECTOSCOMERCIAL.IsNull then
        Target_CARTERAEFECTOSCOMERCIAL.AsString          := Origin_CARTERAEFECTOSCOMERCIAL.AsString         ;  //char(10)          NULL,

        if not Origin_CARTERAEFECTOSIMPCOMISION.IsNull then
        Target_CARTERAEFECTOSIMPCOMISION.AsFloat         := Origin_CARTERAEFECTOSIMPCOMISION.AsFloat        ;  //decimal(14, 3)    NULL,

        if not Origin_CARTERAEFECTOSASIENTORIESGO.IsNull then
        Target_CARTERAEFECTOSASIENTORIESGO.AsInteger     := Origin_CARTERAEFECTOSASIENTORIESGO.AsInteger    ;  //int               NULL,

        if not Origin_CARTERAEFECTOSEJERCICIO.IsNull then
        Target_CARTERAEFECTOSEJERCICIO.AsInteger         := Origin_CARTERAEFECTOSEJERCICIO.AsInteger        ;  //int               NULL,

        if not Origin_CARTERAEFECTOSSERIE.IsNull then
        Target_CARTERAEFECTOSSERIE.AsString              := Origin_CARTERAEFECTOSSERIE.AsString             ;  //varchar(5)        NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_CARTERAEFECTOS.Post;
           Target_CARTERAEFECTOS.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_CARTERAEFECTOS.Caption := IntToStr(Passed);
        except

        end;
        Origin_CARTERAEFECTOS.Next;
     end;
   finally
     Origin_CARTERAEFECTOS.Close;
   end;
end;

procedure TFormDumpData.BtnDIARIOClick(Sender: TObject);
var Count  :Integer;
    Passed :Integer;
begin
   Passed := 0;

   Origin_DIARIO.Open;
   Target_DIARIO.Open;
   try
     Count := Origin_DIARIO.RecordCount;
     Gauge.MaxValue := Count;
     Gauge.Progress := 0;
     LabelO_DIARIO.Caption := IntToStr(Count);
     while not Origin_DIARIO.EOF do begin
        Target_DIARIO.Insert;
        {-------------------------------------------------------------------------------------------------------------------}
         Target_DIARIOID_DIARIO.AsInteger       := Origin_DIARIOID_DIARIO.AsInteger      ;    //int               NOT NULL,

         if not Origin_DIARIOAPUNTE.IsNull then
         Target_DIARIOAPUNTE.AsInteger          := Origin_DIARIOAPUNTE.AsInteger         ;    //int               NULL,

         if not Origin_DIARIOASIENTO.IsNull then
         Target_DIARIOASIENTO.AsInteger         := Origin_DIARIOASIENTO.AsInteger        ;    //int               NULL,

         if not Origin_DIARIOBASEIMPONIBLE.IsNull then
         Target_DIARIOBASEIMPONIBLE.AsFloat     := Origin_DIARIOBASEIMPONIBLE.AsFloat    ;    //decimal(14, 3)    NULL,

         if not Origin_DIARIOCOMENTARIO.IsNull then
         Target_DIARIOCOMENTARIO.AsString       := Origin_DIARIOCOMENTARIO.AsString      ;    //varchar(40)       NULL,

         if not Origin_DIARIOCONTRAPARTIDA.IsNull then
         Target_DIARIOCONTRAPARTIDA.AsString    := Origin_DIARIOCONTRAPARTIDA.AsString   ;    //varchar(10)       NULL,

         if not Origin_DIARIODEBEHABER.IsNull then
         Target_DIARIODEBEHABER.AsString        := Origin_DIARIODEBEHABER.AsString       ;    //char(1)           NULL,

         if not Origin_DIARIOFECHA.IsNull then
         Target_DIARIOFECHA.AsDateTime          := Origin_DIARIOFECHA.AsDateTime         ;    //datetime          NULL,

         if not Origin_DIARIOIMPORTE.IsNull then
         Target_DIARIOIMPORTE.AsFloat           := Origin_DIARIOIMPORTE.AsFloat          ;    //decimal(14, 3)    NULL,

         if not Origin_DIARIOIVA.IsNull then
         Target_DIARIOIVA.AsFloat               := Origin_DIARIOIVA.AsFloat              ;    //decimal(14, 3)    NULL,

         if not Origin_DIARIONIF.IsNull then
         Target_DIARIONIF.AsString              := Origin_DIARIONIF.AsString             ;    //varchar(15)       NULL,

         if not Origin_DIARIOMONEDA.IsNull then
         Target_DIARIOMONEDA.AsString           := Origin_DIARIOMONEDA.AsString          ;    //char(1)           NULL,

         if not Origin_DIARIONUMEROFACTURA.IsNull then
         Target_DIARIONUMEROFACTURA.AsString    := Origin_DIARIONUMEROFACTURA.AsString   ;    //varchar(10)       NULL,

         if not Origin_DIARIORECARGO.IsNull then
         Target_DIARIORECARGO.AsFloat           := Origin_DIARIORECARGO.AsFloat          ;    //decimal(14, 3)    NULL,

         Target_DIARIOSUBCUENTA.AsString        := Origin_DIARIOSUBCUENTA.AsString       ;    //varchar(10)       NOT NULL,

         if not Origin_DIARIOPUNTEO.IsNull then
         Target_DIARIOPUNTEO.AsString           := Origin_DIARIOPUNTEO.AsString          ;    //char(1)           NULL,

         if not Origin_DIARIOASIENTOPUNTEO.IsNull then
         Target_DIARIOASIENTOPUNTEO.AsInteger   := Origin_DIARIOASIENTOPUNTEO.AsInteger  ;    //int               NULL,

         if not Origin_DIARIOPUNTEOIVA.IsNull then
         Target_DIARIOPUNTEOIVA.AsString        := Origin_DIARIOPUNTEOIVA.AsString       ;    //char(1)           NULL,

         Target_DIARIOID_CONCEPTOS.AsString     := Origin_DIARIOID_CONCEPTOS.AsString    ;    //char(3)           NOT NULL,

         if not Origin_DIARIOTIPODIARIO.IsNull then
         Target_DIARIOTIPODIARIO.AsString       := Origin_DIARIOTIPODIARIO.AsString      ;    //char(2)           NULL,

         if not Origin_DIARIOCUENTA_ANALITICA.IsNull then
         Target_DIARIOCUENTA_ANALITICA.AsString := Origin_DIARIOCUENTA_ANALITICA.AsString;    //char(10)          NULL,

         if not Origin_DIARIOCUOTAIVA.IsNull then
         Target_DIARIOCUOTAIVA.AsFloat          := Origin_DIARIOCUOTAIVA.AsFloat         ;    //decimal(14, 3)    NULL,

         if not Origin_DIARIOCUOTARECARGO.IsNull then
         Target_DIARIOCUOTARECARGO.AsFloat      := Origin_DIARIOCUOTARECARGO.AsFloat     ;    //decimal(14, 3)    NULL,

         if not Origin_DIARIOTIPOASIENTO.IsNull then
         Target_DIARIOTIPOASIENTO.AsInteger     := Origin_DIARIOTIPOASIENTO.AsInteger    ;    //int               NULL,

         if not Origin_DIARIOASIENTONOMINA.IsNull then
         Target_DIARIOASIENTONOMINA.AsInteger   := Origin_DIARIOASIENTONOMINA.AsInteger  ;    //int               NULL,

         if not Origin_DIARIOEJERCICIO.IsNull then
         Target_DIARIOEJERCICIO.AsInteger       := Origin_DIARIOEJERCICIO.AsInteger      ;    //int               NULL,

         if not Origin_DIARIOSERIE.IsNull then
         Target_DIARIOSERIE.AsString            := Origin_DIARIOSERIE.AsString           ;    //varchar(5)        NULL,
        {-------------------------------------------------------------------------------------------------------------------}
        try
           Target_DIARIO.Post;
           Target_DIARIO.ApplyUpdates(0);
           Gauge.Progress := Gauge.Progress + 1;
           Inc(Passed);
           LabelT_DIARIO.Caption := IntToStr(Passed);
        except

        end;
        Origin_DIARIO.Next;
     end;
   finally
     Origin_DIARIO.Close;
   end;
end;

end.
