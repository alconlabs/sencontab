object DMRef: TDMRef
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 240
  Top = 183
  Height = 239
  Width = 405
  object IBDSiamCont: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:c:\cviews\datos\SIAMCONT.ib'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 42
    Top = 8
  end
  object IBT1: TIBTransaction
    Active = False
    DefaultDatabase = IBDSiamCont
    AutoStopAction = saNone
    Left = 112
    Top = 8
  end
  object QAuxiliar: TIBSQL
    Database = IBDSiamCont
    ParamCheck = True
    Transaction = IBT1
    Left = 200
    Top = 8
  end
  object QProvinciasNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PROVINCIAS'
      'WHERE'
      
        '  PROVINCIA                      =:old_PROVINCIA                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PROVINCIAS'
      
        '  (PROVINCIA                      ,NOMBRE                       ' +
        '  ,CODIGO                         )'
      'VALUES'
      
        '  (:PROVINCIA                      ,:NOMBRE                     ' +
        '    ,:CODIGO                         )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PROVINCIAS'
      'WHERE'
      
        '  PROVINCIA                      =?PROVINCIA                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PROVINCIAS')
    ModifySQL.Strings = (
      'UPDATE PROVINCIAS'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      
        '  ,CODIGO                         =:CODIGO                      ' +
        '    '
      'WHERE'
      
        '  PROVINCIA                      =:PROVINCIA                    ' +
        '   ')
    TableName = 'provincias'
    Left = 398
    Top = 8
    object QProvinciasNomPROVINCIA: TIBStringField
      FieldName = 'PROVINCIA'
      Origin = 'PROVINCIAS.PROVINCIA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QProvinciasNomNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROVINCIAS.NOMBRE'
      Size = 25
    end
    object QProvinciasNomCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'PROVINCIAS.CODIGO'
      FixedChar = True
      Size = 2
    end
  end
  object QPaisNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PAISES'
      'WHERE'
      
        '  PAIS                           =:old_PAIS                     ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PAISES'
      
        '  (NOMBRE                         ,PAIS                         ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:PAIS                       ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PAISES'
      'WHERE'
      
        '  PAIS                           =?PAIS                         ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PAISES')
    ModifySQL.Strings = (
      'UPDATE PAISES'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  PAIS                           =:PAIS                         ' +
        '   ')
    TableName = 'PAISES'
    Left = 306
    Top = 8
    object QPaisNomPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PAISES.PAIS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QPaisNomNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PAISES.NOMBRE'
      Size = 30
    end
  end
  object QParametros: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PARAMETROS'
      'WHERE'
      
        '  ID_PARAMETROS                  =:old_ID_PARAMETROS            ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PARAMETROS'
      
        '  (FECHABLOQUEO                   ,FECHAAMORTIZACION            ' +
        '  ,TANTORETARRE                   ,TANTORETPROF                 ' +
        '  ,FECHA_FIN_EJERCICIO            ,FECHA_INICIO_EJERCICIO       ' +
        '  ,FECHA_INICIO_APLICACION        ,SCTAEXPORTACIONES            ' +
        '  ,SCTAINTERESES                  ,SCTAIVAEXENTOCEE             ' +
        '  ,SCTAGENINTRACOM                ,SCTAIVACINTRAREPERCUTIDO     ' +
        '  ,SCTAIVACINTRADEDUCIBLE         ,SCTAIVAINTRADEDUCIBLE        ' +
        '  ,SCTADEUDASDESCUENTOS           ,SCTAEFECTDESCONTADOS         ' +
        '  ,NUMEROCALLE                    ,CONTACTO                     ' +
        '  ,CODPOSTAL                      ,VGENERICAC                   ' +
        '  ,SCTAIVACEXENTO                 ,SCTAHACIVA                   ' +
        '  ,SCTARETARRE                    ,SCTARETPROF                  ' +
        '  ,SCTADTOPPC                     ,SCTADTOPPV                   ' +
        '  ,SCTANOMCARGO                   ,SCTANOMSST                   ' +
        '  ,SCTANOMSSE                     ,SCTANOMPAGO                  ' +
        '  ,SCTANOMIRPF                    ,SCTANOMSUELDO                ' +
        '  ,SUBCAJA                        ,VGENERICA                    ' +
        '  ,SUBCUENTA_CIERRE               ,SCTARECSUPER                 ' +
        '  ,SCTARECREDUCIDO                ,SCTARECNORMAL                ' +
        '  ,SCTAIVACSUPER                  ,SCTAIVACREDUCIDO             ' +
        '  ,SCTAIVACNORMAL                 ,SCTAIVASUPER                 ' +
        '  ,SCTAIVAREDUCIDO                ,SCTACOMPRAS                  ' +
        '  ,SCTADESCUENTO                  ,SCTADEVOLUCION               ' +
        '  ,SCTAVENTAS                     ,SCTAIVAINTRA                 ' +
        '  ,SCTAIVAEXENTO                  ,SCTAIVANORMAL                ' +
        '  ,ASIENTO_FIN_INTERVALO_FILTRO   ,ASIENTO_INICIO_INTERVALO_FILT' +
        'RO,ASIENTOS_FIN_INTERVALO_BQDA    ,ASIENTOS_INICIO_INTERVALO_BQD' +
        'A ,PUERTA                         ,PISO                         ' +
        '  ,ESCALERA                       ,SIGLAVIA                     ' +
        '  ,DOC347                         ,DOCPROVEEDOR                 ' +
        '  ,DOCCLIENTE                     ,PROVINCIA                    ' +
        '  ,POBLACION                      ,DIRECCION1                   ' +
        '  ,DIRECCION                      ,NOMBREFISCAL                 ' +
        '  ,FAX                            ,TELEFONO                     ' +
        '  ,ID_PARAMETROS                  ,LONGITUD_SUBCUENTAS          ' +
        '  ,BUSQUEDA_SUBCTAS               ,ASIENTO_NOMINA_INDIVIDUAL    ' +
        '  ,CTOPROVINTRA                   ,MOSTRAR_FILTRO_MAYOR         ' +
        '  ,INCLUIR_ABREV                  ,FILTRO_ASIENTOS_INICIO       ' +
        '  ,GESTIONA_CARTERA_EFECTOS       ,CODADMON                     ' +
        '  ,CCC                            ,NIF                          ' +
        '  ,CTO_APERTURA_ESP               ,RECARGO                      ' +
        '  ,CTOPAGOF                       ,CTOIVACEXENTO                ' +
        '  ,CTOHACIVA                      ,CTORETARRE                   ' +
        '  ,CTORETPROF                     ,CTODTOPPC                    ' +
        '  ,CTODTOPPV                      ,CTONOMT                      ' +
        '  ,CTONOME                        ,CTOCOBROF                    ' +
        '  ,MONEDA                         ,CTO_REGULARIZACION           ' +
        '  ,DOCIMPRIMIR                    ,CTORECIBOVENTAS              ' +
        '  ,CTORECSUPER                    ,CTORECREDUCIDO               ' +
        '  ,CTORECNORMAL                   ,CTOIVACSUPER                 ' +
        '  ,CTOIVACREDUCIDO                ,CTOIVACNORMAL                ' +
        '  ,CTOPROVEEDORES                 ,CTOIVASUPER                  ' +
        '  ,CTO_APERTURA                   ,CTO_REGULARIZACION_ESP       ' +
        '  ,CTOIVAREDUCIDO                 ,CTOCOMPRAS                   ' +
        '  ,CTODESCUENTO                   ,CTOCLIENTES                  ' +
        '  ,CTODEVOLUCION                  ,CTOVENTAS                    ' +
        '  ,CTOIVAINTRA                    ,CTOIVAEXENTO                 ' +
        '  ,CTOIVANORMAL                   ,SCTAOTRASREMUN               ' +
        '  ,SCTABANCO                      ,CTOCOBRO                     ' +
        '  ,CTOPAGO                        ,SCTAEFECTOSCOMERCIALES       ' +
        '  ,CTOEFECTOSCOMERCIALES          ,CTODEUDASDESCUENTOS          ' +
        '  ,SCTAREMESAEFECTOS              ,CTOREMESAEFECTOS             ' +
        '  ,DESCPROV_CARTERAEFECTOS        ,DESCCLI_CARTERAEFECTOS       ' +
        '  ,TIPOEMPRESA                    ,FILTROSUBCTAS                ' +
        '  )'
      'VALUES'
      
        '  (:FECHABLOQUEO                   ,:FECHAAMORTIZACION          ' +
        '    ,:TANTORETARRE                   ,:TANTORETPROF             ' +
        '      ,:FECHA_FIN_EJERCICIO            ,:FECHA_INICIO_EJERCICIO ' +
        '        ,:FECHA_INICIO_APLICACION        ,:SCTAEXPORTACIONES    ' +
        '          ,:SCTAINTERESES                  ,:SCTAIVAEXENTOCEE   ' +
        '            ,:SCTAGENINTRACOM                ,:SCTAIVACINTRAREPE' +
        'RCUTIDO       ,:SCTAIVACINTRADEDUCIBLE         ,:SCTAIVAINTRADED' +
        'UCIBLE          ,:SCTADEUDASDESCUENTOS           ,:SCTAEFECTDESC' +
        'ONTADOS           ,:NUMEROCALLE                    ,:CONTACTO   ' +
        '                    ,:CODPOSTAL                      ,:VGENERICA' +
        'C                     ,:SCTAIVACEXENTO                 ,:SCTAHAC' +
        'IVA                     ,:SCTARETARRE                    ,:SCTAR' +
        'ETPROF                    ,:SCTADTOPPC                     ,:SCT' +
        'ADTOPPV                     ,:SCTANOMCARGO                   ,:S' +
        'CTANOMSST                     ,:SCTANOMSSE                     ,' +
        ':SCTANOMPAGO                    ,:SCTANOMIRPF                   ' +
        ' ,:SCTANOMSUELDO                  ,:SUBCAJA                     ' +
        '   ,:VGENERICA                      ,:SUBCUENTA_CIERRE          ' +
        '     ,:SCTARECSUPER                   ,:SCTARECREDUCIDO         ' +
        '       ,:SCTARECNORMAL                  ,:SCTAIVACSUPER         ' +
        '         ,:SCTAIVACREDUCIDO               ,:SCTAIVACNORMAL      ' +
        '           ,:SCTAIVASUPER                   ,:SCTAIVAREDUCIDO   ' +
        '             ,:SCTACOMPRAS                    ,:SCTADESCUENTO   ' +
        '               ,:SCTADEVOLUCION                 ,:SCTAVENTAS    ' +
        '                 ,:SCTAIVAINTRA                   ,:SCTAIVAEXENT' +
        'O                  ,:SCTAIVANORMAL                  ,:ASIENTO_FI' +
        'N_INTERVALO_FILTRO   ,:ASIENTO_INICIO_INTERVALO_FILTRO,:ASIENTOS' +
        '_FIN_INTERVALO_BQDA    ,:ASIENTOS_INICIO_INTERVALO_BQDA ,:PUERTA' +
        '                         ,:PISO                           ,:ESCA' +
        'LERA                       ,:SIGLAVIA                       ,:DO' +
        'C347                         ,:DOCPROVEEDOR                   ,:' +
        'DOCCLIENTE                     ,:PROVINCIA                      ' +
        ',:POBLACION                      ,:DIRECCION1                   ' +
        '  ,:DIRECCION                      ,:NOMBREFISCAL               ' +
        '    ,:FAX                            ,:TELEFONO                 ' +
        '      ,:ID_PARAMETROS                  ,:LONGITUD_SUBCUENTAS    ' +
        '        ,:BUSQUEDA_SUBCTAS               ,:ASIENTO_NOMINA_INDIVI' +
        'DUAL      ,:CTOPROVINTRA                   ,:MOSTRAR_FILTRO_MAYO' +
        'R           ,:INCLUIR_ABREV                  ,:FILTRO_ASIENTOS_I' +
        'NICIO         ,:GESTIONA_CARTERA_EFECTOS       ,:CODADMON       ' +
        '                ,:CCC                            ,:NIF          ' +
        '                  ,:CTO_APERTURA_ESP               ,:RECARGO    ' +
        '                    ,:CTOPAGOF                       ,:CTOIVACEX' +
        'ENTO                  ,:CTOHACIVA                      ,:CTORETA' +
        'RRE                     ,:CTORETPROF                     ,:CTODT' +
        'OPPC                      ,:CTODTOPPV                      ,:CTO' +
        'NOMT                        ,:CTONOME                        ,:C' +
        'TOCOBROF                      ,:MONEDA                         ,' +
        ':CTO_REGULARIZACION             ,:DOCIMPRIMIR                   ' +
        ' ,:CTORECIBOVENTAS                ,:CTORECSUPER                 ' +
        '   ,:CTORECREDUCIDO                 ,:CTORECNORMAL              ' +
        '     ,:CTOIVACSUPER                   ,:CTOIVACREDUCIDO         ' +
        '       ,:CTOIVACNORMAL                  ,:CTOPROVEEDORES        ' +
        '         ,:CTOIVASUPER                    ,:CTO_APERTURA        ' +
        '           ,:CTO_REGULARIZACION_ESP         ,:CTOIVAREDUCIDO    ' +
        '             ,:CTOCOMPRAS                     ,:CTODESCUENTO    ' +
        '               ,:CTOCLIENTES                    ,:CTODEVOLUCION ' +
        '                 ,:CTOVENTAS                      ,:CTOIVAINTRA ' +
        '                   ,:CTOIVAEXENTO                   ,:CTOIVANORM' +
        'AL                   ,:SCTAOTRASREMUN                 ,:SCTABANC' +
        'O                      ,:CTOCOBRO                       ,:CTOPAG' +
        'O                        ,:SCTAEFECTOSCOMERCIALES         ,:CTOE' +
        'FECTOSCOMERCIALES          ,:CTODEUDASDESCUENTOS            ,:SC' +
        'TAREMESAEFECTOS              ,:CTOREMESAEFECTOS               ,:' +
        'DESCPROV_CARTERAEFECTOS        ,:DESCCLI_CARTERAEFECTOS         ' +
        ',:TIPOEMPRESA                    ,:FILTROSUBCTAS                ' +
        '  )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PARAMETROS'
      'WHERE'
      
        '  ID_PARAMETROS                  =?ID_PARAMETROS                ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PARAMETROS')
    ModifySQL.Strings = (
      'UPDATE PARAMETROS'
      'SET'
      
        '  FECHABLOQUEO                   =:FECHABLOQUEO                 ' +
        '   '
      
        '  ,FECHAAMORTIZACION              =:FECHAAMORTIZACION           ' +
        '    '
      
        '  ,TANTORETARRE                   =:TANTORETARRE                ' +
        '    '
      
        '  ,TANTORETPROF                   =:TANTORETPROF                ' +
        '    '
      
        '  ,FECHA_FIN_EJERCICIO            =:FECHA_FIN_EJERCICIO         ' +
        '    '
      
        '  ,FECHA_INICIO_EJERCICIO         =:FECHA_INICIO_EJERCICIO      ' +
        '    '
      
        '  ,FECHA_INICIO_APLICACION        =:FECHA_INICIO_APLICACION     ' +
        '    '
      
        '  ,SCTAEXPORTACIONES              =:SCTAEXPORTACIONES           ' +
        '    '
      
        '  ,SCTAINTERESES                  =:SCTAINTERESES               ' +
        '    '
      
        '  ,SCTAIVAEXENTOCEE               =:SCTAIVAEXENTOCEE            ' +
        '    '
      
        '  ,SCTAGENINTRACOM                =:SCTAGENINTRACOM             ' +
        '    '
      
        '  ,SCTAIVACINTRAREPERCUTIDO       =:SCTAIVACINTRAREPERCUTIDO    ' +
        '    '
      
        '  ,SCTAIVACINTRADEDUCIBLE         =:SCTAIVACINTRADEDUCIBLE      ' +
        '    '
      
        '  ,SCTAIVAINTRADEDUCIBLE          =:SCTAIVAINTRADEDUCIBLE       ' +
        '    '
      
        '  ,SCTADEUDASDESCUENTOS           =:SCTADEUDASDESCUENTOS        ' +
        '    '
      
        '  ,SCTAEFECTDESCONTADOS           =:SCTAEFECTDESCONTADOS        ' +
        '    '
      
        '  ,NUMEROCALLE                    =:NUMEROCALLE                 ' +
        '    '
      
        '  ,CONTACTO                       =:CONTACTO                    ' +
        '    '
      
        '  ,CODPOSTAL                      =:CODPOSTAL                   ' +
        '    '
      
        '  ,VGENERICAC                     =:VGENERICAC                  ' +
        '    '
      
        '  ,SCTAIVACEXENTO                 =:SCTAIVACEXENTO              ' +
        '    '
      
        '  ,SCTAHACIVA                     =:SCTAHACIVA                  ' +
        '    '
      
        '  ,SCTARETARRE                    =:SCTARETARRE                 ' +
        '    '
      
        '  ,SCTARETPROF                    =:SCTARETPROF                 ' +
        '    '
      
        '  ,SCTADTOPPC                     =:SCTADTOPPC                  ' +
        '    '
      
        '  ,SCTADTOPPV                     =:SCTADTOPPV                  ' +
        '    '
      
        '  ,SCTANOMCARGO                   =:SCTANOMCARGO                ' +
        '    '
      
        '  ,SCTANOMSST                     =:SCTANOMSST                  ' +
        '    '
      
        '  ,SCTANOMSSE                     =:SCTANOMSSE                  ' +
        '    '
      
        '  ,SCTANOMPAGO                    =:SCTANOMPAGO                 ' +
        '    '
      
        '  ,SCTANOMIRPF                    =:SCTANOMIRPF                 ' +
        '    '
      
        '  ,SCTANOMSUELDO                  =:SCTANOMSUELDO               ' +
        '    '
      
        '  ,SUBCAJA                        =:SUBCAJA                     ' +
        '    '
      
        '  ,VGENERICA                      =:VGENERICA                   ' +
        '    '
      
        '  ,SUBCUENTA_CIERRE               =:SUBCUENTA_CIERRE            ' +
        '    '
      
        '  ,SCTARECSUPER                   =:SCTARECSUPER                ' +
        '    '
      
        '  ,SCTARECREDUCIDO                =:SCTARECREDUCIDO             ' +
        '    '
      
        '  ,SCTARECNORMAL                  =:SCTARECNORMAL               ' +
        '    '
      
        '  ,SCTAIVACSUPER                  =:SCTAIVACSUPER               ' +
        '    '
      
        '  ,SCTAIVACREDUCIDO               =:SCTAIVACREDUCIDO            ' +
        '    '
      
        '  ,SCTAIVACNORMAL                 =:SCTAIVACNORMAL              ' +
        '    '
      
        '  ,SCTAIVASUPER                   =:SCTAIVASUPER                ' +
        '    '
      
        '  ,SCTAIVAREDUCIDO                =:SCTAIVAREDUCIDO             ' +
        '    '
      
        '  ,SCTACOMPRAS                    =:SCTACOMPRAS                 ' +
        '    '
      
        '  ,SCTADESCUENTO                  =:SCTADESCUENTO               ' +
        '    '
      
        '  ,SCTADEVOLUCION                 =:SCTADEVOLUCION              ' +
        '    '
      
        '  ,SCTAVENTAS                     =:SCTAVENTAS                  ' +
        '    '
      
        '  ,SCTAIVAINTRA                   =:SCTAIVAINTRA                ' +
        '    '
      
        '  ,SCTAIVAEXENTO                  =:SCTAIVAEXENTO               ' +
        '    '
      
        '  ,SCTAIVANORMAL                  =:SCTAIVANORMAL               ' +
        '    '
      
        '  ,ASIENTO_FIN_INTERVALO_FILTRO   =:ASIENTO_FIN_INTERVALO_FILTRO' +
        '    '
      
        '  ,ASIENTO_INICIO_INTERVALO_FILTRO=:ASIENTO_INICIO_INTERVALO_FIL' +
        'TRO '
      
        '  ,ASIENTOS_FIN_INTERVALO_BQDA    =:ASIENTOS_FIN_INTERVALO_BQDA ' +
        '    '
      
        '  ,ASIENTOS_INICIO_INTERVALO_BQDA =:ASIENTOS_INICIO_INTERVALO_BQ' +
        'DA  '
      
        '  ,PUERTA                         =:PUERTA                      ' +
        '    '
      
        '  ,PISO                           =:PISO                        ' +
        '    '
      
        '  ,ESCALERA                       =:ESCALERA                    ' +
        '    '
      
        '  ,SIGLAVIA                       =:SIGLAVIA                    ' +
        '    '
      
        '  ,DOC347                         =:DOC347                      ' +
        '    '
      
        '  ,DOCPROVEEDOR                   =:DOCPROVEEDOR                ' +
        '    '
      
        '  ,DOCCLIENTE                     =:DOCCLIENTE                  ' +
        '    '
      
        '  ,PROVINCIA                      =:PROVINCIA                   ' +
        '    '
      
        '  ,POBLACION                      =:POBLACION                   ' +
        '    '
      
        '  ,DIRECCION1                     =:DIRECCION1                  ' +
        '    '
      
        '  ,DIRECCION                      =:DIRECCION                   ' +
        '    '
      
        '  ,NOMBREFISCAL                   =:NOMBREFISCAL                ' +
        '    '
      
        '  ,FAX                            =:FAX                         ' +
        '    '
      
        '  ,TELEFONO                       =:TELEFONO                    ' +
        '    '
      
        '  ,LONGITUD_SUBCUENTAS            =:LONGITUD_SUBCUENTAS         ' +
        '    '
      
        '  ,BUSQUEDA_SUBCTAS               =:BUSQUEDA_SUBCTAS            ' +
        '    '
      
        '  ,ASIENTO_NOMINA_INDIVIDUAL      =:ASIENTO_NOMINA_INDIVIDUAL   ' +
        '    '
      
        '  ,CTOPROVINTRA                   =:CTOPROVINTRA                ' +
        '    '
      
        '  ,MOSTRAR_FILTRO_MAYOR           =:MOSTRAR_FILTRO_MAYOR        ' +
        '    '
      
        '  ,INCLUIR_ABREV                  =:INCLUIR_ABREV               ' +
        '    '
      
        '  ,FILTRO_ASIENTOS_INICIO         =:FILTRO_ASIENTOS_INICIO      ' +
        '    '
      
        '  ,GESTIONA_CARTERA_EFECTOS       =:GESTIONA_CARTERA_EFECTOS    ' +
        '    '
      
        '  ,CODADMON                       =:CODADMON                    ' +
        '    '
      
        '  ,CCC                            =:CCC                         ' +
        '    '
      
        '  ,NIF                            =:NIF                         ' +
        '    '
      
        '  ,CTO_APERTURA_ESP               =:CTO_APERTURA_ESP            ' +
        '    '
      
        '  ,RECARGO                        =:RECARGO                     ' +
        '    '
      
        '  ,CTOPAGOF                       =:CTOPAGOF                    ' +
        '    '
      
        '  ,CTOIVACEXENTO                  =:CTOIVACEXENTO               ' +
        '    '
      
        '  ,CTOHACIVA                      =:CTOHACIVA                   ' +
        '    '
      
        '  ,CTORETARRE                     =:CTORETARRE                  ' +
        '    '
      
        '  ,CTORETPROF                     =:CTORETPROF                  ' +
        '    '
      
        '  ,CTODTOPPC                      =:CTODTOPPC                   ' +
        '    '
      
        '  ,CTODTOPPV                      =:CTODTOPPV                   ' +
        '    '
      
        '  ,CTONOMT                        =:CTONOMT                     ' +
        '    '
      
        '  ,CTONOME                        =:CTONOME                     ' +
        '    '
      
        '  ,CTOCOBROF                      =:CTOCOBROF                   ' +
        '    '
      
        '  ,MONEDA                         =:MONEDA                      ' +
        '    '
      
        '  ,CTO_REGULARIZACION             =:CTO_REGULARIZACION          ' +
        '    '
      
        '  ,DOCIMPRIMIR                    =:DOCIMPRIMIR                 ' +
        '    '
      
        '  ,CTORECIBOVENTAS                =:CTORECIBOVENTAS             ' +
        '    '
      
        '  ,CTORECSUPER                    =:CTORECSUPER                 ' +
        '    '
      
        '  ,CTORECREDUCIDO                 =:CTORECREDUCIDO              ' +
        '    '
      
        '  ,CTORECNORMAL                   =:CTORECNORMAL                ' +
        '    '
      
        '  ,CTOIVACSUPER                   =:CTOIVACSUPER                ' +
        '    '
      
        '  ,CTOIVACREDUCIDO                =:CTOIVACREDUCIDO             ' +
        '    '
      
        '  ,CTOIVACNORMAL                  =:CTOIVACNORMAL               ' +
        '    '
      
        '  ,CTOPROVEEDORES                 =:CTOPROVEEDORES              ' +
        '    '
      
        '  ,CTOIVASUPER                    =:CTOIVASUPER                 ' +
        '    '
      
        '  ,CTO_APERTURA                   =:CTO_APERTURA                ' +
        '    '
      
        '  ,CTO_REGULARIZACION_ESP         =:CTO_REGULARIZACION_ESP      ' +
        '    '
      
        '  ,CTOIVAREDUCIDO                 =:CTOIVAREDUCIDO              ' +
        '    '
      
        '  ,CTOCOMPRAS                     =:CTOCOMPRAS                  ' +
        '    '
      
        '  ,CTODESCUENTO                   =:CTODESCUENTO                ' +
        '    '
      
        '  ,CTOCLIENTES                    =:CTOCLIENTES                 ' +
        '    '
      
        '  ,CTODEVOLUCION                  =:CTODEVOLUCION               ' +
        '    '
      
        '  ,CTOVENTAS                      =:CTOVENTAS                   ' +
        '    '
      
        '  ,CTOIVAINTRA                    =:CTOIVAINTRA                 ' +
        '    '
      
        '  ,CTOIVAEXENTO                   =:CTOIVAEXENTO                ' +
        '    '
      
        '  ,CTOIVANORMAL                   =:CTOIVANORMAL                ' +
        '    '
      
        '  ,SCTAOTRASREMUN                 =:SCTAOTRASREMUN              ' +
        '    '
      
        '  ,SCTABANCO                      =:SCTABANCO                   ' +
        '    '
      
        '  ,CTOCOBRO                       =:CTOCOBRO                    ' +
        '    '
      
        '  ,CTOPAGO                        =:CTOPAGO                     ' +
        '    '
      
        '  ,SCTAEFECTOSCOMERCIALES         =:SCTAEFECTOSCOMERCIALES      ' +
        '    '
      
        '  ,CTOEFECTOSCOMERCIALES          =:CTOEFECTOSCOMERCIALES       ' +
        '    '
      
        '  ,CTODEUDASDESCUENTOS            =:CTODEUDASDESCUENTOS         ' +
        '    '
      
        '  ,SCTAREMESAEFECTOS              =:SCTAREMESAEFECTOS           ' +
        '    '
      
        '  ,CTOREMESAEFECTOS               =:CTOREMESAEFECTOS            ' +
        '    '
      
        '  ,DESCPROV_CARTERAEFECTOS        =:DESCPROV_CARTERAEFECTOS     ' +
        '    '
      
        '  ,DESCCLI_CARTERAEFECTOS         =:DESCCLI_CARTERAEFECTOS      ' +
        '    '
      
        '  ,TIPOEMPRESA                    =:TIPOEMPRESA                 ' +
        '    '
      
        '  ,FILTROSUBCTAS                  =:FILTROSUBCTAS               ' +
        '    '
      'WHERE'
      
        '  ID_PARAMETROS                  =:ID_PARAMETROS                ' +
        '   ')
    TableName = 'parametros'
    Left = 484
    Top = 8
  end
  object QAnaliticas: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANALITICAS'
      'WHERE'
      
        '  CUENTA                         =:old_CUENTA                   ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO ANALITICAS'
      
        '  (ID_PROYECTO                    ,ID_SECCION                   ' +
        '  ,ID_DEPARTAMENTO                ,ID_DELEGACION                ' +
        '  ,NOMBRE                         ,CUENTA                       ' +
        '  )'
      'VALUES'
      
        '  (:ID_PROYECTO                    ,:ID_SECCION                 ' +
        '    ,:ID_DEPARTAMENTO                ,:ID_DELEGACION            ' +
        '      ,:NOMBRE                         ,:CUENTA                 ' +
        '        )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANALITICAS'
      'WHERE'
      
        '  CUENTA                         =?CUENTA                       ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM ANALITICAS')
    ModifySQL.Strings = (
      'UPDATE ANALITICAS'
      'SET'
      
        '  ID_PROYECTO                    =:ID_PROYECTO                  ' +
        '   '
      
        '  ,ID_SECCION                     =:ID_SECCION                  ' +
        '    '
      
        '  ,ID_DEPARTAMENTO                =:ID_DEPARTAMENTO             ' +
        '    '
      
        '  ,ID_DELEGACION                  =:ID_DELEGACION               ' +
        '    '
      
        '  ,NOMBRE                         =:NOMBRE                      ' +
        '    '
      'WHERE'
      
        '  CUENTA                         =:CUENTA                       ' +
        '   ')
    TableName = 'analiticas'
    Left = 39
    Top = 82
    object QAnaliticasCUENTA: TIBStringField
      DisplayWidth = 10
      FieldName = 'CUENTA'
      Origin = 'ANALITICAS.CUENTA'
      Required = True
      Size = 10
    end
    object QAnaliticasNOMBRE: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'ANALITICAS.NOMBRE'
      Size = 50
    end
    object QAnaliticasID_PROYECTO: TIBStringField
      FieldName = 'ID_PROYECTO'
      Origin = 'ANALITICAS.ID_PROYECTO'
      Visible = False
      Size = 10
    end
    object QAnaliticasID_SECCION: TIBStringField
      FieldName = 'ID_SECCION'
      Origin = 'ANALITICAS.ID_SECCION'
      Visible = False
      Size = 10
    end
    object QAnaliticasID_DEPARTAMENTO: TIBStringField
      FieldName = 'ID_DEPARTAMENTO'
      Origin = 'ANALITICAS.ID_DEPARTAMENTO'
      Visible = False
      Size = 10
    end
    object QAnaliticasID_DELEGACION: TIBStringField
      FieldName = 'ID_DELEGACION'
      Origin = 'ANALITICAS.ID_DELEGACION'
      Visible = False
      Size = 10
    end
  end
  object QAnaliticasNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANALITICAS'
      'WHERE'
      
        '  CUENTA                         =:old_CUENTA                   ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO ANALITICAS'
      
        '  (ID_PROYECTO                    ,ID_SECCION                   ' +
        '  ,ID_DEPARTAMENTO                ,ID_DELEGACION                ' +
        '  ,NOMBRE                         ,CUENTA                       ' +
        '  )'
      'VALUES'
      
        '  (:ID_PROYECTO                    ,:ID_SECCION                 ' +
        '    ,:ID_DEPARTAMENTO                ,:ID_DELEGACION            ' +
        '      ,:NOMBRE                         ,:CUENTA                 ' +
        '        )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANALITICAS'
      'WHERE'
      
        '  CUENTA                         =?CUENTA                       ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM ANALITICAS')
    ModifySQL.Strings = (
      'UPDATE ANALITICAS'
      'SET'
      
        '  ID_PROYECTO                    =:ID_PROYECTO                  ' +
        '   '
      
        '  ,ID_SECCION                     =:ID_SECCION                  ' +
        '    '
      
        '  ,ID_DEPARTAMENTO                =:ID_DEPARTAMENTO             ' +
        '    '
      
        '  ,ID_DELEGACION                  =:ID_DELEGACION               ' +
        '    '
      
        '  ,NOMBRE                         =:NOMBRE                      ' +
        '    '
      'WHERE'
      
        '  CUENTA                         =:CUENTA                       ' +
        '   ')
    TableName = 'analiticas'
    Left = 111
    Top = 82
    object IBStringField45: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'ANALITICAS.NOMBRE'
      Size = 50
    end
    object IBStringField46: TIBStringField
      DisplayWidth = 10
      FieldName = 'CUENTA'
      Origin = 'ANALITICAS.CUENTA'
      Required = True
      Size = 10
    end
    object IBStringField41: TIBStringField
      FieldName = 'ID_PROYECTO'
      Origin = 'ANALITICAS.ID_PROYECTO'
      Visible = False
      Size = 10
    end
    object IBStringField42: TIBStringField
      FieldName = 'ID_SECCION'
      Origin = 'ANALITICAS.ID_SECCION'
      Visible = False
      Size = 10
    end
    object IBStringField43: TIBStringField
      FieldName = 'ID_DEPARTAMENTO'
      Origin = 'ANALITICAS.ID_DEPARTAMENTO'
      Visible = False
      Size = 10
    end
    object IBStringField44: TIBStringField
      FieldName = 'ID_DELEGACION'
      Origin = 'ANALITICAS.ID_DELEGACION'
      Visible = False
      Size = 10
    end
  end
  object QDelegacionNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DELEGACION'
      'WHERE'
      
        '  ID_DELEGACION                  =:old_ID_DELEGACION            ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO DELEGACION'
      
        '  (NOMBRE                         ,ID_DELEGACION                ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_DELEGACION              ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DELEGACION'
      'WHERE'
      
        '  ID_DELEGACION                  =?ID_DELEGACION                ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM DELEGACION')
    ModifySQL.Strings = (
      'UPDATE DELEGACION'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_DELEGACION                  =:ID_DELEGACION                ' +
        '   ')
    TableName = 'delegacion'
    Left = 135
    Top = 138
    object QDelegacionNomNOMBRE: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'DELEGACION.NOMBRE'
      Size = 50
    end
    object QDelegacionNomID_DELEGACION: TIBStringField
      DisplayLabel = 'DELEGACION'
      DisplayWidth = 10
      FieldName = 'ID_DELEGACION'
      Origin = 'DELEGACION.ID_DELEGACION'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QDepartamentoNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DEPARTAMENTO'
      'WHERE'
      
        '  ID_DEPARTAMENTO                =:old_ID_DEPARTAMENTO          ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO DEPARTAMENTO'
      
        '  (NOMBRE                         ,ID_DEPARTAMENTO              ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_DEPARTAMENTO            ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DEPARTAMENTO'
      'WHERE'
      
        '  ID_DEPARTAMENTO                =?ID_DEPARTAMENTO              ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM DEPARTAMENTO')
    ModifySQL.Strings = (
      'UPDATE DEPARTAMENTO'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_DEPARTAMENTO                =:ID_DEPARTAMENTO              ' +
        '   ')
    TableName = 'departamento'
    Left = 311
    Top = 82
    object QDepartamentoNomNOMBRE: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'DEPARTAMENTO.NOMBRE'
      Size = 50
    end
    object QDepartamentoNomID_DEPARTAMENTO: TIBStringField
      DisplayLabel = 'DEPARTAMENTO'
      DisplayWidth = 10
      FieldName = 'ID_DEPARTAMENTO'
      Origin = 'DEPARTAMENTO.ID_DEPARTAMENTO'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QProyectoNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PROYECTO'
      'WHERE'
      
        '  ID_PROYECTO                    =:old_ID_PROYECTO              ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PROYECTO'
      
        '  (NOMBRE                         ,ID_PROYECTO                  ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_PROYECTO                ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PROYECTO'
      'WHERE'
      
        '  ID_PROYECTO                    =?ID_PROYECTO                  ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PROYECTO')
    ModifySQL.Strings = (
      'UPDATE PROYECTO'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_PROYECTO                    =:ID_PROYECTO                  ' +
        '   ')
    TableName = 'proyecto'
    Left = 407
    Top = 82
    object QProyectoNomNOMBRE: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'PROYECTO.NOMBRE'
      Size = 50
    end
    object QProyectoNomID_PROYECTO: TIBStringField
      FieldName = 'ID_PROYECTO'
      Origin = 'PROYECTO.ID_PROYECTO'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QSeccionNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SECCION'
      'WHERE'
      
        '  ID_SECCION                     =:old_ID_SECCION               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO SECCION'
      
        '  (NOMBRE                         ,ID_SECCION                   ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_SECCION                 ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SECCION'
      'WHERE'
      
        '  ID_SECCION                     =?ID_SECCION                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM SECCION')
    ModifySQL.Strings = (
      'UPDATE SECCION'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_SECCION                     =:ID_SECCION                   ' +
        '   ')
    TableName = 'seccion'
    Left = 487
    Top = 82
    object QSeccionNomNOMBRE: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOMBRE'
      Origin = 'SECCION.NOMBRE'
      Size = 50
    end
    object QSeccionNomID_SECCION: TIBStringField
      FieldName = 'ID_SECCION'
      Origin = 'SECCION.ID_SECCION'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QDelegacion: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DELEGACION'
      'WHERE'
      
        '  ID_DELEGACION                  =:old_ID_DELEGACION            ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO DELEGACION'
      
        '  (NOMBRE                         ,ID_DELEGACION                ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_DELEGACION              ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DELEGACION'
      'WHERE'
      
        '  ID_DELEGACION                  =?ID_DELEGACION                ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM DELEGACION')
    ModifySQL.Strings = (
      'UPDATE DELEGACION'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_DELEGACION                  =:ID_DELEGACION                ' +
        '   ')
    TableName = 'delegacion'
    Left = 47
    Top = 138
    object IBStringField1: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DELEGACION.NOMBRE'
      Size = 50
    end
    object IBStringField2: TIBStringField
      FieldName = 'ID_DELEGACION'
      Origin = 'DELEGACION.ID_DELEGACION'
      Required = True
      Size = 10
    end
  end
  object QDepartamento: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DEPARTAMENTO'
      'WHERE'
      
        '  ID_DEPARTAMENTO                =:old_ID_DEPARTAMENTO          ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO DEPARTAMENTO'
      
        '  (NOMBRE                         ,ID_DEPARTAMENTO              ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_DEPARTAMENTO            ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DEPARTAMENTO'
      'WHERE'
      
        '  ID_DEPARTAMENTO                =?ID_DEPARTAMENTO              ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM DEPARTAMENTO')
    ModifySQL.Strings = (
      'UPDATE DEPARTAMENTO'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_DEPARTAMENTO                =:ID_DEPARTAMENTO              ' +
        '   ')
    TableName = 'departamento'
    Left = 311
    Top = 138
    object IBStringField3: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPARTAMENTO.NOMBRE'
      Size = 50
    end
    object IBStringField4: TIBStringField
      FieldName = 'ID_DEPARTAMENTO'
      Origin = 'DEPARTAMENTO.ID_DEPARTAMENTO'
      Required = True
      Size = 10
    end
  end
  object QProyecto: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PROYECTO'
      'WHERE'
      
        '  ID_PROYECTO                    =:old_ID_PROYECTO              ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PROYECTO'
      
        '  (NOMBRE                         ,ID_PROYECTO                  ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_PROYECTO                ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PROYECTO'
      'WHERE'
      
        '  ID_PROYECTO                    =?ID_PROYECTO                  ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PROYECTO')
    ModifySQL.Strings = (
      'UPDATE PROYECTO'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_PROYECTO                    =:ID_PROYECTO                  ' +
        '   ')
    TableName = 'proyecto'
    Left = 407
    Top = 138
    object IBStringField5: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROYECTO.NOMBRE'
      Size = 50
    end
    object IBStringField6: TIBStringField
      FieldName = 'ID_PROYECTO'
      Origin = 'PROYECTO.ID_PROYECTO'
      Required = True
      Size = 10
    end
  end
  object QSeccion: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SECCION'
      'WHERE'
      
        '  ID_SECCION                     =:old_ID_SECCION               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO SECCION'
      
        '  (NOMBRE                         ,ID_SECCION                   ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:ID_SECCION                 ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SECCION'
      'WHERE'
      
        '  ID_SECCION                     =?ID_SECCION                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM SECCION')
    ModifySQL.Strings = (
      'UPDATE SECCION'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  ID_SECCION                     =:ID_SECCION                   ' +
        '   ')
    TableName = 'seccion'
    Left = 487
    Top = 146
    object IBStringField7: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'SECCION.NOMBRE'
      Size = 50
    end
    object IBStringField8: TIBStringField
      FieldName = 'ID_SECCION'
      Origin = 'SECCION.ID_SECCION'
      Required = True
      Size = 10
    end
  end
  object QComercial: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM COMERCIALES'
      'WHERE'
      
        '  COMERCIAL                      =:old_COMERCIAL                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO COMERCIALES'
      
        '  (NOMBRE                         ,COMERCIAL                    ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:COMERCIAL                  ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM COMERCIALES'
      'WHERE'
      
        '  COMERCIAL                      =?COMERCIAL                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM COMERCIALES')
    ModifySQL.Strings = (
      'UPDATE COMERCIALES'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  COMERCIAL                      =:COMERCIAL                    ' +
        '   ')
    TableName = 'comerciales'
    Left = 47
    Top = 210
    object QComercialNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COMERCIALES.NOMBRE'
      Size = 50
    end
    object QComercialCOMERCIAL: TIBStringField
      FieldName = 'COMERCIAL'
      Origin = 'COMERCIALES.COMERCIAL'
      Required = True
      Size = 10
    end
  end
  object QcomercialNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM COMERCIALES'
      'WHERE'
      
        '  COMERCIAL                      =:old_COMERCIAL                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO COMERCIALES'
      
        '  (NOMBRE                         ,COMERCIAL                    ' +
        '  )'
      'VALUES'
      
        '  (:NOMBRE                         ,:COMERCIAL                  ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM COMERCIALES'
      'WHERE'
      
        '  COMERCIAL                      =?COMERCIAL                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM COMERCIALES')
    ModifySQL.Strings = (
      'UPDATE COMERCIALES'
      'SET'
      
        '  NOMBRE                         =:NOMBRE                       ' +
        '   '
      'WHERE'
      
        '  COMERCIAL                      =:COMERCIAL                    ' +
        '   ')
    TableName = 'comerciales'
    Left = 47
    Top = 266
    object IBStringField9: TIBStringField
      DisplayWidth = 50
      FieldName = 'NOMBRE'
      Origin = 'COMERCIALES.NOMBRE'
      Size = 50
    end
    object IBStringField10: TIBStringField
      FieldName = 'COMERCIAL'
      Origin = 'COMERCIALES.COMERCIAL'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QFormaPago: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM FORMAS'
      'WHERE'
      
        '  FORMAPAGO                      =:old_FORMAPAGO                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO FORMAS'
      
        '  (DESCRIBE                       ,INTERVALO                    ' +
        '  ,NUMVENCI                       ,FORMAPAGO                    ' +
        '  ,CLASE                          ,OBSOLETO                     ' +
        '  )'
      'VALUES'
      
        '  (:DESCRIBE                       ,:INTERVALO                  ' +
        '    ,:NUMVENCI                       ,:FORMAPAGO                ' +
        '      ,:CLASE                          ,:OBSOLETO               ' +
        '        )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM FORMAS'
      'WHERE'
      
        '  FORMAPAGO                      =?FORMAPAGO                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM FORMAS')
    ModifySQL.Strings = (
      'UPDATE FORMAS'
      'SET'
      
        '  DESCRIBE                       =:DESCRIBE                     ' +
        '   '
      
        '  ,INTERVALO                      =:INTERVALO                   ' +
        '    '
      
        '  ,NUMVENCI                       =:NUMVENCI                    ' +
        '    '
      
        '  ,CLASE                          =:CLASE                       ' +
        '    '
      
        '  ,OBSOLETO                       =:OBSOLETO                    ' +
        '    '
      'WHERE'
      
        '  FORMAPAGO                      =:FORMAPAGO                    ' +
        '   ')
    TableName = 'formas'
    Left = 151
    Top = 210
    object QFormaPagoFORMAPAGO: TIBStringField
      FieldName = 'FORMAPAGO'
      Origin = 'FORMAS.FORMAPAGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QFormaPagoCLASE: TIBStringField
      FieldName = 'CLASE'
      Origin = 'FORMAS.CLASE'
      FixedChar = True
      Size = 1
    end
    object QFormaPagoDESCRIBE: TIBStringField
      FieldName = 'DESCRIBE'
      Origin = 'FORMAS.DESCRIBE'
      Size = 40
    end
    object QFormaPagoINTERVALO: TSmallintField
      FieldName = 'INTERVALO'
      Origin = 'FORMAS.INTERVALO'
    end
    object QFormaPagoNUMVENCI: TSmallintField
      FieldName = 'NUMVENCI'
      Origin = 'FORMAS.NUMVENCI'
    end
    object QFormaPagoOBSOLETO: TIBStringField
      FieldName = 'OBSOLETO'
      Origin = 'FORMAS.OBSOLETO'
      FixedChar = True
      Size = 1
    end
  end
  object QFormaPagoNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM FORMAS'
      'WHERE'
      
        '  FORMAPAGO                      =:old_FORMAPAGO                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO FORMAS'
      
        '  (DESCRIBE                       ,INTERVALO                    ' +
        '  ,NUMVENCI                       ,FORMAPAGO                    ' +
        '  ,CLASE                          ,OBSOLETO                     ' +
        '  )'
      'VALUES'
      
        '  (:DESCRIBE                       ,:INTERVALO                  ' +
        '    ,:NUMVENCI                       ,:FORMAPAGO                ' +
        '      ,:CLASE                          ,:OBSOLETO               ' +
        '        )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM FORMAS'
      'WHERE'
      
        '  FORMAPAGO                      =?FORMAPAGO                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM FORMAS')
    ModifySQL.Strings = (
      'UPDATE FORMAS'
      'SET'
      
        '  DESCRIBE                       =:DESCRIBE                     ' +
        '   '
      
        '  ,INTERVALO                      =:INTERVALO                   ' +
        '    '
      
        '  ,NUMVENCI                       =:NUMVENCI                    ' +
        '    '
      
        '  ,CLASE                          =:CLASE                       ' +
        '    '
      
        '  ,OBSOLETO                       =:OBSOLETO                    ' +
        '    '
      'WHERE'
      
        '  FORMAPAGO                      =:FORMAPAGO                    ' +
        '   ')
    TableName = 'formas'
    Left = 151
    Top = 266
    object IBStringField11: TIBStringField
      FieldName = 'FORMAPAGO'
      Origin = 'FORMAS.FORMAPAGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object IBStringField12: TIBStringField
      FieldName = 'CLASE'
      Origin = 'FORMAS.CLASE'
      FixedChar = True
      Size = 1
    end
    object IBStringField13: TIBStringField
      FieldName = 'DESCRIBE'
      Origin = 'FORMAS.DESCRIBE'
      Size = 40
    end
    object SmallintField1: TSmallintField
      FieldName = 'INTERVALO'
      Origin = 'FORMAS.INTERVALO'
    end
    object SmallintField2: TSmallintField
      FieldName = 'NUMVENCI'
      Origin = 'FORMAS.NUMVENCI'
    end
    object IBStringField14: TIBStringField
      FieldName = 'OBSOLETO'
      Origin = 'FORMAS.OBSOLETO'
      FixedChar = True
      Size = 1
    end
  end
  object QTipoDiario: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TIPODIARIO'
      'WHERE'
      
        '  TIPODIARIO                     =:old_TIPODIARIO               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO TIPODIARIO'
      
        '  (DESCRIPCION                    ,TIPODIARIO                   ' +
        '  )'
      'VALUES'
      
        '  (:DESCRIPCION                    ,:TIPODIARIO                 ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TIPODIARIO'
      'WHERE'
      
        '  TIPODIARIO                     =?TIPODIARIO                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM TIPODIARIO')
    ModifySQL.Strings = (
      'UPDATE TIPODIARIO'
      'SET'
      
        '  DESCRIPCION                    =:DESCRIPCION                  ' +
        '   '
      'WHERE'
      
        '  TIPODIARIO                     =:TIPODIARIO                   ' +
        '   ')
    TableName = 'tipodiario'
    Left = 247
    Top = 202
    object QTipoDiarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPODIARIO.DESCRIPCION'
      Size = 30
    end
    object QTipoDiarioTIPODIARIO: TIBStringField
      FieldName = 'TIPODIARIO'
      Origin = 'TIPODIARIO.TIPODIARIO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QTipodiarioNom: TIBTableSet
    Database = IBDSiamCont
    Transaction = IBT1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TIPODIARIO'
      'WHERE'
      
        '  TIPODIARIO                     =:old_TIPODIARIO               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO TIPODIARIO'
      
        '  (DESCRIPCION                    ,TIPODIARIO                   ' +
        '  )'
      'VALUES'
      
        '  (:DESCRIPCION                    ,:TIPODIARIO                 ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TIPODIARIO'
      'WHERE'
      
        '  TIPODIARIO                     =?TIPODIARIO                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM TIPODIARIO')
    ModifySQL.Strings = (
      'UPDATE TIPODIARIO'
      'SET'
      
        '  DESCRIPCION                    =:DESCRIPCION                  ' +
        '   '
      'WHERE'
      
        '  TIPODIARIO                     =:TIPODIARIO                   ' +
        '   ')
    TableName = 'tipodiario'
    Left = 255
    Top = 266
    object IBStringField15: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPODIARIO.DESCRIPCION'
      Size = 30
    end
    object IBStringField16: TIBStringField
      FieldName = 'TIPODIARIO'
      Origin = 'TIPODIARIO.TIPODIARIO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object IBDConsolida: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTConsolida
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 360
    Top = 272
  end
  object IBTConsolida: TIBTransaction
    Active = False
    DefaultDatabase = IBDConsolida
    AutoStopAction = saNone
    Left = 458
    Top = 272
  end
  object TransBdEjanterior: TIBTransaction
    Active = False
    DefaultDatabase = BDEjAnterior
    AutoStopAction = saNone
    Left = 458
    Top = 224
  end
  object BDEjAnterior: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TransBdEjanterior
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 360
    Top = 224
  end
end
