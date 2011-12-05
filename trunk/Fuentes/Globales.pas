unit Globales;
interface
uses OnGuard;

type
   TOWValues         = (OW_WPROVINCIAS, OW_WPAISES);
   TModoArranque     = (INSERCION, MODIFICACION, DUPLICAR, CONSULTA, MODIFICACION_INFORME, COBRO_FACTURA, PAGO_FACTURA);
   TOperacionEfectos = (GENERAR_ASIENTO, IMPRIMIR_CARTA);
   TPermiso          = (ANIADIR, MODIFICAR, BORRAR, IMPRESION);

const
   cClaveApp: TKey = ($30, $8E, $20, $C5, $B9, $6D, $42, $86, $4A, $24, $8C, $3E, $95, $BB, $1D, $B3);

   gcMascaraPorcentajes = '##0.00 %';
   gcFormatoFecha       = 'dd/mm/yyyy';
   gcFormatoDecimales: array [0..3] of String = ('###,###,###', '###,###,###.#',
      '###,###,###.##', '###,###,###.###');
   gcFormatoImportePtas  = '###,###,###';
   gcFormatoImporteEuros = '###,###,##0.#0';

   gcUsuarioDesbloqueo     = 'FORZAR'; //Por si se olvidan todas las claves de entrada para poder entrar
   gcContrasegnaDesbloqueo = '';

   gcMonedaPta     = 'P';
   gcMonedaEuro    = 'E';
   gcValorEuro     = 166.386;
   gcFicheroEnlace = 'Enlace.db';

   gcMinInt        = 0;
   gcMaxInt        = 999999999;
   //------------------------------------------------------------------------------
   gcClNaveg       = $00FFFCEA;
   gcClFondo       = $00A56D39;
   gcClAzul        = $00A56D39;
   gcClRejilla     = $00EDFBFC;
   gcClRejillaDesplegable = $00D9D1C0;
   gcClFocoRejilla = $00F0DFD9;
   gcClAplicacion  = $00D9D1C0;
   gcClFuente      = $00A93F3F;
   gcClListado     = $00D9D1C0;
   //------------------------------------------------------------------------------
   gcDirImagenes   = 'Imagenes\';
   gcDirInformes   = 'Informes\';
   gcSplash        = 'Splash.gif';
   gcFormErrores   = 'FormErrores.bmp';
   gcFondoLogin    = 'FormLogin.bmp';
   gcBMPRegistro   = 'Registro.bmp';
   gcBtnMenuBlanco = 'BotonMenuBlanco.bmp';
   gcBtn           = 'Boton.bmp';
   gcBtnBlanco     = 'BotonBlanco.bmp';
   gcBtnAzul       = 'BotonAzul.bmp';
   gcBtnBlancoConSubMenu = 'BotonBlancoConSubMenu.bmp';
   gcBtnAzulConSubMenu = 'BotonAzulConSubMenu.bmp';
   gcMnsBtnSi_Arriba = 'Boton.bmp';
   gcMnsBtnNo_Arriba = 'Boton.bmp';
   gcMnsBtnOk_Arriba = 'Boton.bmp';
   gcSombraGrid    = 'SombraGrid.jpg';
   gcSombraGridPeque = 'SombraGridPeque.jpg';
   gcBarraProgreso = 'BarrasAzules.avi';
   gcFactCompra    = 'facturacomprapeque.bmp';
   gcFactVenta     = 'facturaventapeque.bmp';
   //------------------------------------------------------------------------------
   //Constantes métricas para una ventana hija estándar
   ANCHO_VENTANA   = 790;
   ALTO_VENTANA    = 525;
   //------------------------------------------------------------------------------
   // Informes
   INF_ASIENTOS    = 9;
   INF_MAYOR       = 10;
   INF_FACTURAS_EMITIDAS = 48;
   INF_FACTURAS_RECIBIDAS = 49;
   INF_FACTURAS_BIENES = 50;
   INF_MOD_300     = 20;
   INF_MOD_347     = 21;
   INF_MOD_349     = 22;
   INF_BALANCE_SUMAS_Y_SALDOS = 23;
   INF_BALANCE_SITUACION = 24;
   INF_BALANCE_PERDIDAS_Y_GANANCIAS = 25;
   INF_GASTOS      = 26;
   INF_BALANCE_INGRESOS_GASTOS = 30;
   //------------------------------------------------------------------------------
   // Constantes para la carga de asientos
   CARGA_ASIENTOS_SIMPLIFICADA = 0;
   CARGA_ASIENTOS_GASTOS = 1;
   CARGA_FACTURAS_COMPRA = 2;
   CARGA_PROVISION = 3;
   CARGA_PAGO      = 4;
   CARGA_COBRO_FACTURA = 5;
   CARGA_DEVOLUCION_PROVISION = 6;
   CARGA_FACTURAS_VENTA = 7;

   // Constantes para el tipo de asiento
   ASIENTO_GENERAL         = 0;
   ASIENTO_FACTURA_COMPRA  = 1;
   ASIENTO_FACTURA_VENTA   = 2;
   ASIENTO_NOMINA          = 3;
   ASIENTO_SSOCIAL_EMPRESA = 4;

   COLOR_ASIENTO1 = $00EDFBFC;
   COLOR_ASIENTO2 = $00D9D1C0;

var
   gvWIndice:        Integer;
   gvDirectorio:     String;
   gvDirInformes:    String;
   gvUsuario:        String;
   gvID_Usuario:     Integer;
   gvPuesto:         String;
   gvCanEdit:        Boolean;
   gvMonedaNueva:    Integer;
   gvLongitudSubcuenta: Integer;
   gvEmpresaActual:  Integer;
   gvUbicacionEmpresa: String;
   gvServidor:       String;
   gvDirImagenes:    String;
   gvDirAyuda:       String;
   gvNombreEmpresa:  String;
   gvNombreEmpresaMenu: String;
   gvTratamientoRecargo: Boolean;
   gvMonedaListado:  String;
   gvTipoConta:      String;
   gvProcesoAbortado: Boolean;
   gvDemo:           Boolean;
   gvFormatoOficial: Boolean;
   gvComprobarRegistro: Boolean;

implementation


end.
