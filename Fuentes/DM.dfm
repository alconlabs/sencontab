object DMRef: TDMRef
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 439
  Top = 157
  Height = 373
  Width = 583
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
    Active = True
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
  object QParametros: TIBDataSet
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
      
        '  (FECHA_INICIO_APLICACION        ,FECHA_INICIO_EJERCICIO       ' +
        '  ,FECHA_FIN_EJERCICIO            ,TANTORETPROF                 ' +
        '  ,TANTORETARRE                   ,FECHAAMORTIZACION            ' +
        '  ,FECHABLOQUEO                   ,SCTAREMESAEFECTOS            ' +
        '  ,SCTAEFECTOSCOMERCIALES         ,SCTABANCO                    ' +
        '  ,SCTAOTRASREMUN                 ,SCTAIVANORMAL                ' +
        '  ,SCTAIVAEXENTO                  ,SCTAIVAINTRA                 ' +
        '  ,SCTAVENTAS                     ,SCTADEVOLUCION               ' +
        '  ,SCTADESCUENTO                  ,SCTACOMPRAS                  ' +
        '  ,SCTAIVAREDUCIDO                ,SCTAIVASUPER                 ' +
        '  ,SCTAIVACNORMAL                 ,SCTAIVACREDUCIDO             ' +
        '  ,SCTAIVACSUPER                  ,SCTARECNORMAL                ' +
        '  ,SCTARECREDUCIDO                ,SCTARECSUPER                 ' +
        '  ,SUBCUENTA_CIERRE               ,VGENERICA                    ' +
        '  ,SUBCAJA                        ,SCTANOMSUELDO                ' +
        '  ,SCTANOMIRPF                    ,SCTANOMPAGO                  ' +
        '  ,SCTANOMSSE                     ,SCTANOMSST                   ' +
        '  ,SCTANOMCARGO                   ,SCTADTOPPV                   ' +
        '  ,SCTADTOPPC                     ,SCTARETPROF                  ' +
        '  ,SCTARETARRE                    ,SCTAHACIVA                   ' +
        '  ,SCTAIVACEXENTO                 ,VGENERICAC                   ' +
        '  ,CODPOSTAL                      ,CONTACTO                     ' +
        '  ,NUMEROCALLE                    ,SCTAEFECTDESCONTADOS         ' +
        '  ,SCTADEUDASDESCUENTOS           ,SCTAIVAINTRADEDUCIBLE        ' +
        '  ,SCTAIVACINTRADEDUCIBLE         ,SCTAIVACINTRAREPERCUTIDO     ' +
        '  ,SCTAGENINTRACOM                ,SCTAIVAEXENTOCEE             ' +
        '  ,SCTAINTERESES                  ,SCTAEXPORTACIONES            ' +
        '  ,LONGITUD_SUBCUENTAS            ,ID_PARAMETROS                ' +
        '  ,TELEFONO                       ,FAX                          ' +
        '  ,NOMBREFISCAL                   ,DIRECCION                    ' +
        '  ,DIRECCION1                     ,POBLACION                    ' +
        '  ,PROVINCIA                      ,DOCCLIENTE                   ' +
        '  ,DOCPROVEEDOR                   ,DOC347                       ' +
        '  ,SIGLAVIA                       ,ESCALERA                     ' +
        '  ,PISO                           ,PUERTA                       ' +
        '  ,ASIENTOS_INICIO_INTERVALO_BQDA ,ASIENTOS_FIN_INTERVALO_BQDA  ' +
        '  ,ASIENTO_INICIO_INTERVALO_FILTRO,ASIENTO_FIN_INTERVALO_FILTRO ' +
        '  ,ACTCOMENTARIO                  ,TRATASERIE                   ' +
        '  ,OFFICE2003                     ,FILTROSUBCTAS                ' +
        '  ,TIPOEMPRESA                    ,DESCCLI_CARTERAEFECTOS       ' +
        '  ,DESCPROV_CARTERAEFECTOS        ,CTOREMESAEFECTOS             ' +
        '  ,CTODEUDASDESCUENTOS            ,CTOEFECTOSCOMERCIALES        ' +
        '  ,CTOPAGO                        ,CTOCOBRO                     ' +
        '  ,CTOIVANORMAL                   ,CTOIVAEXENTO                 ' +
        '  ,CTOIVAINTRA                    ,CTOVENTAS                    ' +
        '  ,CTODEVOLUCION                  ,CTOCLIENTES                  ' +
        '  ,CTODESCUENTO                   ,CTOCOMPRAS                   ' +
        '  ,CTOIVAREDUCIDO                 ,CTO_REGULARIZACION_ESP       ' +
        '  ,CTO_APERTURA                   ,CTOIVASUPER                  ' +
        '  ,CTOPROVEEDORES                 ,CTOIVACNORMAL                ' +
        '  ,CTOIVACREDUCIDO                ,CTOIVACSUPER                 ' +
        '  ,CTORECNORMAL                   ,CTORECREDUCIDO               ' +
        '  ,CTORECSUPER                    ,CTORECIBOVENTAS              ' +
        '  ,DOCIMPRIMIR                    ,CTO_REGULARIZACION           ' +
        '  ,MONEDA                         ,CTOCOBROF                    ' +
        '  ,CTONOME                        ,CTONOMT                      ' +
        '  ,CTODTOPPV                      ,CTODTOPPC                    ' +
        '  ,CTORETPROF                     ,CTORETARRE                   ' +
        '  ,CTOHACIVA                      ,CTOIVACEXENTO                ' +
        '  ,CTOPAGOF                       ,RECARGO                      ' +
        '  ,CTO_APERTURA_ESP               ,NIF                          ' +
        '  ,CCC                            ,CODADMON                     ' +
        '  ,GESTIONA_CARTERA_EFECTOS       ,FILTRO_ASIENTOS_INICIO       ' +
        '  ,INCLUIR_ABREV                  ,MOSTRAR_FILTRO_MAYOR         ' +
        '  ,CTOPROVINTRA                   ,ASIENTO_NOMINA_INDIVIDUAL    ' +
        '  ,BUSQUEDA_SUBCTAS               )'
      'VALUES'
      
        '  (:FECHA_INICIO_APLICACION        ,:FECHA_INICIO_EJERCICIO     ' +
        '    ,:FECHA_FIN_EJERCICIO            ,:TANTORETPROF             ' +
        '      ,:TANTORETARRE                   ,:FECHAAMORTIZACION      ' +
        '        ,:FECHABLOQUEO                   ,:SCTAREMESAEFECTOS    ' +
        '          ,:SCTAEFECTOSCOMERCIALES         ,:SCTABANCO          ' +
        '            ,:SCTAOTRASREMUN                 ,:SCTAIVANORMAL    ' +
        '              ,:SCTAIVAEXENTO                  ,:SCTAIVAINTRA   ' +
        '                ,:SCTAVENTAS                     ,:SCTADEVOLUCIO' +
        'N                 ,:SCTADESCUENTO                  ,:SCTACOMPRAS' +
        '                    ,:SCTAIVAREDUCIDO                ,:SCTAIVASU' +
        'PER                   ,:SCTAIVACNORMAL                 ,:SCTAIVA' +
        'CREDUCIDO               ,:SCTAIVACSUPER                  ,:SCTAR' +
        'ECNORMAL                  ,:SCTARECREDUCIDO                ,:SCT' +
        'ARECSUPER                   ,:SUBCUENTA_CIERRE               ,:V' +
        'GENERICA                      ,:SUBCAJA                        ,' +
        ':SCTANOMSUELDO                  ,:SCTANOMIRPF                   ' +
        ' ,:SCTANOMPAGO                    ,:SCTANOMSSE                  ' +
        '   ,:SCTANOMSST                     ,:SCTANOMCARGO              ' +
        '     ,:SCTADTOPPV                     ,:SCTADTOPPC              ' +
        '       ,:SCTARETPROF                    ,:SCTARETARRE           ' +
        '         ,:SCTAHACIVA                     ,:SCTAIVACEXENTO      ' +
        '           ,:VGENERICAC                     ,:CODPOSTAL         ' +
        '             ,:CONTACTO                       ,:NUMEROCALLE     ' +
        '               ,:SCTAEFECTDESCONTADOS           ,:SCTADEUDASDESC' +
        'UENTOS           ,:SCTAIVAINTRADEDUCIBLE          ,:SCTAIVACINTR' +
        'ADEDUCIBLE         ,:SCTAIVACINTRAREPERCUTIDO       ,:SCTAGENINT' +
        'RACOM                ,:SCTAIVAEXENTOCEE               ,:SCTAINTE' +
        'RESES                  ,:SCTAEXPORTACIONES              ,:LONGIT' +
        'UD_SUBCUENTAS            ,:ID_PARAMETROS                  ,:TELE' +
        'FONO                       ,:FAX                            ,:NO' +
        'MBREFISCAL                   ,:DIRECCION                      ,:' +
        'DIRECCION1                     ,:POBLACION                      ' +
        ',:PROVINCIA                      ,:DOCCLIENTE                   ' +
        '  ,:DOCPROVEEDOR                   ,:DOC347                     ' +
        '    ,:SIGLAVIA                       ,:ESCALERA                 ' +
        '      ,:PISO                           ,:PUERTA                 ' +
        '        ,:ASIENTOS_INICIO_INTERVALO_BQDA ,:ASIENTOS_FIN_INTERVAL' +
        'O_BQDA    ,:ASIENTO_INICIO_INTERVALO_FILTRO,:ASIENTO_FIN_INTERVA' +
        'LO_FILTRO   ,:ACTCOMENTARIO                  ,:TRATASERIE       ' +
        '              ,:OFFICE2003                     ,:FILTROSUBCTAS  ' +
        '                ,:TIPOEMPRESA                    ,:DESCCLI_CARTE' +
        'RAEFECTOS         ,:DESCPROV_CARTERAEFECTOS        ,:CTOREMESAEF' +
        'ECTOS               ,:CTODEUDASDESCUENTOS            ,:CTOEFECTO' +
        'SCOMERCIALES          ,:CTOPAGO                        ,:CTOCOBR' +
        'O                       ,:CTOIVANORMAL                   ,:CTOIV' +
        'AEXENTO                   ,:CTOIVAINTRA                    ,:CTO' +
        'VENTAS                      ,:CTODEVOLUCION                  ,:C' +
        'TOCLIENTES                    ,:CTODESCUENTO                   ,' +
        ':CTOCOMPRAS                     ,:CTOIVAREDUCIDO                ' +
        ' ,:CTO_REGULARIZACION_ESP         ,:CTO_APERTURA                ' +
        '   ,:CTOIVASUPER                    ,:CTOPROVEEDORES            ' +
        '     ,:CTOIVACNORMAL                  ,:CTOIVACREDUCIDO         ' +
        '       ,:CTOIVACSUPER                   ,:CTORECNORMAL          ' +
        '         ,:CTORECREDUCIDO                 ,:CTORECSUPER         ' +
        '           ,:CTORECIBOVENTAS                ,:DOCIMPRIMIR       ' +
        '             ,:CTO_REGULARIZACION             ,:MONEDA          ' +
        '               ,:CTOCOBROF                      ,:CTONOME       ' +
        '                 ,:CTONOMT                        ,:CTODTOPPV   ' +
        '                   ,:CTODTOPPC                      ,:CTORETPROF' +
        '                     ,:CTORETARRE                     ,:CTOHACIV' +
        'A                      ,:CTOIVACEXENTO                  ,:CTOPAG' +
        'OF                       ,:RECARGO                        ,:CTO_' +
        'APERTURA_ESP               ,:NIF                            ,:CC' +
        'C                            ,:CODADMON                       ,:' +
        'GESTIONA_CARTERA_EFECTOS       ,:FILTRO_ASIENTOS_INICIO         ' +
        ',:INCLUIR_ABREV                  ,:MOSTRAR_FILTRO_MAYOR         ' +
        '  ,:CTOPROVINTRA                   ,:ASIENTO_NOMINA_INDIVIDUAL  ' +
        '    ,:BUSQUEDA_SUBCTAS               )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PARAMETROS'
      'WHERE'
      
        '  ID_PARAMETROS                  =?ID_PARAMETROS                ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT PRM.ID_PARAMETROS                          ,'
      '       PRM.LONGITUD_SUBCUENTAS                    ,'
      '       PRM.FECHA_INICIO_APLICACION                ,'
      '       PRM.FECHA_INICIO_EJERCICIO                 ,'
      '       PRM.FECHA_FIN_EJERCICIO                    ,'
      '       PRM.CTO_REGULARIZACION                     ,'
      '       PRM.SUBCUENTA_CIERRE                       ,'
      '       PRM.MONEDA                                 ,'
      '       PRM.NOMBREFISCAL                           ,'
      '       PRM.DIRECCION                              ,'
      '       PRM.DIRECCION1                             ,'
      '       PRM.POBLACION                              ,'
      '       PRM.CODPOSTAL                              ,'
      '       PRM.PROVINCIA                              ,'
      '       PRM.NIF                                    ,'
      '       PRM.CONTACTO                               ,'
      '       PRM.DOCCLIENTE                             ,'
      '       PRM.DOCPROVEEDOR                           ,'
      '       PRM.DOC347                                 ,'
      '       PRM.FECHABLOQUEO                           ,'
      '       PRM.CTO_APERTURA                           ,'
      '       PRM.CTO_REGULARIZACION_ESP                 ,'
      '       PRM.FECHAAMORTIZACION                      ,'
      '       PRM.RECARGO                                ,'
      '       PRM.CTO_APERTURA_ESP                       ,'
      '       PRM.SCTAIVANORMAL                          ,'
      '       S01.DESCRIPCION SCTAIVANORMAL_DS           ,'
      '       PRM.SCTAIVAREDUCIDO                        ,'
      '       S02.DESCRIPCION SCTAIVAREDUCIDO_DS         ,'
      '       PRM.SCTAIVASUPER                           ,'
      '       S03.DESCRIPCION SCTAIVASUPER_DS            ,'
      '       PRM.SCTAIVAEXENTO                          ,'
      '       S04.DESCRIPCION SCTAIVAEXENTO_DS           ,'
      '       PRM.SCTAIVAINTRADEDUCIBLE                  ,'
      '       S05.DESCRIPCION SCTAIVAINTRADEDUCIBLE_DS   ,'
      '       PRM.SCTAIVAINTRA                           ,'
      '       S06.DESCRIPCION SCTAIVAINTRA_DS            ,'
      '       PRM.SCTAVENTAS                             ,'
      '       S07.DESCRIPCION SCTAVENTAS_DS              ,'
      '       PRM.SCTADEVOLUCION                         ,'
      '       S08.DESCRIPCION SCTADEVOLUCION_DS          ,'
      '       PRM.SCTARECNORMAL                          ,'
      '       S09.DESCRIPCION SCTARECNORMAL_DS           ,'
      '       PRM.SCTARECREDUCIDO                        ,'
      '       S10.DESCRIPCION SCTARECREDUCIDO_DS         ,'
      '       PRM.SCTARECSUPER                           ,'
      '       S11.DESCRIPCION SCTARECSUPER_DS            ,'
      '       PRM.VGENERICA                              ,'
      '       S12.DESCRIPCION VGENERICA_DS               ,'
      '       PRM.SUBCAJA                                ,'
      '       S13.DESCRIPCION SUBCAJA_DS                 ,'
      '       PRM.SCTAIVAEXENTOCEE                       ,'
      '       S14.DESCRIPCION SCTAIVAEXENTOCEE_DS        ,'
      '       PRM.SCTAINTERESES                          ,'
      '       S15.DESCRIPCION SCTAINTERESES_DS           ,'
      '       PRM.SCTAEXPORTACIONES                      ,'
      '       S16.DESCRIPCION SCTAEXPORTACIONES_DS       ,'
      '       PRM.SCTAIVACNORMAL                         ,'
      '       S17.DESCRIPCION SCTAIVACNORMAL_DS          ,'
      '       PRM.SCTAIVACREDUCIDO                       ,'
      '       S18.DESCRIPCION SCTAIVACREDUCIDO_DS        ,'
      '       PRM.SCTAIVACSUPER                          ,'
      '       S19.DESCRIPCION SCTAIVACSUPER_DS           ,'
      '       PRM.SCTAIVACEXENTO                         ,'
      '       S20.DESCRIPCION SCTAIVACEXENTO_DS          ,'
      '       PRM.SCTACOMPRAS                            ,'
      '       S21.DESCRIPCION SCTACOMPRAS_DS             ,'
      '       PRM.SCTAIVACINTRADEDUCIBLE                 ,'
      '       S22.DESCRIPCION SCTAIVACINTRADEDUCIBLE_DS  ,'
      '       PRM.SCTAIVACINTRAREPERCUTIDO               ,'
      '       S23.DESCRIPCION SCTAIVACINTRAREPERCUTIDO_DS,'
      '       PRM.VGENERICAC                             ,'
      '       S24.DESCRIPCION VGENERICAC_DS              ,'
      '       PRM.SCTAEFECTOSCOMERCIALES                 ,'
      '       S25.DESCRIPCION SCTAEFECTOSCOMERCIALES_DS  ,'
      '       PRM.SCTAEFECTDESCONTADOS                   ,'
      '       S26.DESCRIPCION SCTAEFECTDESCONTADOS_DS    ,'
      '       PRM.SCTADEUDASDESCUENTOS                   ,'
      '       S27.DESCRIPCION SCTADEUDASDESCUENTOS_DS    ,'
      '       PRM.SCTAREMESAEFECTOS                      ,'
      '       S28.DESCRIPCION SCTAREMESAEFECTOS_DS       ,'
      '       PRM.SCTADTOPPV                             ,'
      '       S29.DESCRIPCION SCTADTOPPV_DS              ,'
      '       PRM.SCTADTOPPC                             ,'
      '       S30.DESCRIPCION SCTADTOPPC_DS              ,'
      '       PRM.SCTARETPROF                            ,'
      '       S31.DESCRIPCION SCTARETPROF_DS             ,'
      '       PRM.SCTARETARRE                            ,'
      '       S32.DESCRIPCION SCTARETARRE_DS             ,'
      '       PRM.SCTAHACIVA                             ,'
      '       S33.DESCRIPCION SCTAHACIVA_DS              ,'
      '       PRM.SCTAGENINTRACOM                        ,'
      '       S34.DESCRIPCION SCTAGENINTRACOM_DS         ,'
      '       PRM.SCTABANCO                              ,'
      '       S35.DESCRIPCION SCTABANCO_DS               ,'
      '       PRM.CTOIVANORMAL                           ,'
      '       C01.DESCRIPCION CTOIVANORMAL_DS            ,'
      '       PRM.CTOIVAREDUCIDO                         ,'
      '       C02.DESCRIPCION CTOIVAREDUCIDO_DS          ,'
      '       PRM.CTOIVASUPER                            ,'
      '       C03.DESCRIPCION CTOIVASUPER_DS             ,'
      '       PRM.CTOIVAEXENTO                           ,'
      '       C04.DESCRIPCION CTOIVAEXENTO_DS            ,'
      '       PRM.CTOIVAINTRA                            ,'
      '       C05.DESCRIPCION CTOIVAINTRA_DS             ,'
      '       PRM.CTOVENTAS                              ,'
      '       C06.DESCRIPCION CTOVENTAS_DS               ,'
      '       PRM.CTODEVOLUCION                          ,'
      '       C07.DESCRIPCION CTODEVOLUCION_DS           ,'
      '       PRM.CTOCLIENTES                            ,'
      '       C08.DESCRIPCION CTOCLIENTES_DS             ,'
      '       PRM.CTORECNORMAL                           ,'
      '       C09.DESCRIPCION CTORECNORMAL_DS            ,'
      '       PRM.CTORECREDUCIDO                         ,'
      '       C10.DESCRIPCION CTORECREDUCIDO_DS          ,'
      '       PRM.CTORECSUPER                            ,'
      '       C11.DESCRIPCION CTORECSUPER_DS             ,'
      '       PRM.CTOCOBROF                              ,'
      '       C12.DESCRIPCION CTOCOBROF_DS               ,'
      '       PRM.CTORECIBOVENTAS                        ,'
      '       C13.DESCRIPCION CTORECIBOVENTAS_DS         ,'
      '       PRM.CTOIVACNORMAL                          ,'
      '       C14.DESCRIPCION CTOIVACNORMAL_DS           ,'
      '       PRM.CTOIVACREDUCIDO                        ,'
      '       C15.DESCRIPCION CTOIVACREDUCIDO_DS         ,'
      '       PRM.CTOIVACSUPER                           ,'
      '       C16.DESCRIPCION CTOIVACSUPER_DS            ,'
      '       PRM.CTOIVACEXENTO                          ,'
      '       C17.DESCRIPCION CTOIVACEXENTO_DS           ,'
      '       PRM.CTOCOMPRAS                             ,'
      '       C18.DESCRIPCION CTOCOMPRAS_DS              ,'
      '       PRM.CTOPROVEEDORES                         ,'
      '       C19.DESCRIPCION CTOPROVEEDORES_DS          ,'
      '       PRM.CTOPROVINTRA                           ,'
      '       C20.DESCRIPCION CTOPROVINTRA_DS            ,'
      '       PRM.CTOPAGOF                               ,'
      '       C21.DESCRIPCION CTOPAGOF_DS                ,'
      '       PRM.CTOEFECTOSCOMERCIALES                  ,'
      '       C22.DESCRIPCION CTOEFECTOSCOMERCIALES_DS   ,'
      '       PRM.CTODEUDASDESCUENTOS                    ,'
      '       C23.DESCRIPCION CTODEUDASDESCUENTOS_DS     ,'
      '       PRM.CTOREMESAEFECTOS                       ,'
      '       C24.DESCRIPCION CTOREMESAEFECTOS_DS        ,'
      '       PRM.CTODTOPPV                              ,'
      '       C25.DESCRIPCION CTODTOPPV_DS               ,'
      '       PRM.CTODTOPPC                              ,'
      '       C26.DESCRIPCION CTODTOPPC_DS               ,'
      '       PRM.CTORETPROF                             ,'
      '       C27.DESCRIPCION CTORETPROF_DS              ,'
      '       PRM.CTORETARRE                             ,'
      '       C28.DESCRIPCION CTORETARRE_DS              ,'
      '       PRM.CTOHACIVA                              ,'
      '       C29.DESCRIPCION CTOHACIVA_DS               ,'
      '       PRM.CTOCOBRO                               ,'
      '       C30.DESCRIPCION CTOCOBRO_DS                ,'
      '       PRM.CTOPAGO                                ,'
      '       C31.DESCRIPCION CTOPAGO_DS                 ,'
      '       PRM.SCTADESCUENTO                          ,'
      '       PRM.CTODESCUENTO                           ,'
      '       PRM.CTONOME                                ,'
      '       PRM.CTONOMT                                ,'
      '       PRM.SCTANOMSUELDO                          ,'
      '       PRM.SCTANOMIRPF                            ,'
      '       PRM.SCTANOMPAGO                            ,'
      '       PRM.SCTANOMSSE                             ,'
      '       PRM.SCTANOMSST                             ,'
      '       PRM.SCTANOMCARGO                           ,'
      '       PRM.TANTORETPROF                           ,'
      '       PRM.TANTORETARRE                           ,'
      '       PRM.TELEFONO                               ,'
      '       PRM.FAX                                    ,'
      '       PRM.DOCIMPRIMIR                            ,'
      '       PRM.SIGLAVIA                               ,'
      '       PRM.NUMEROCALLE                            ,'
      '       PRM.ESCALERA                               ,'
      '       PRM.PISO                                   ,'
      '       PRM.PUERTA                                 ,'
      '       PRM.CCC                                    ,'
      '       PRM.CODADMON                               ,'
      '       PRM.GESTIONA_CARTERA_EFECTOS               ,'
      '       PRM.FILTRO_ASIENTOS_INICIO                 ,'
      '       PRM.INCLUIR_ABREV                          ,'
      '       PRM.ASIENTOS_INICIO_INTERVALO_BQDA         ,'
      '       PRM.ASIENTOS_FIN_INTERVALO_BQDA            ,'
      '       PRM.MOSTRAR_FILTRO_MAYOR                   ,'
      '       PRM.ASIENTO_INICIO_INTERVALO_FILTRO        ,'
      '       PRM.ASIENTO_FIN_INTERVALO_FILTRO           ,'
      '       PRM.ASIENTO_NOMINA_INDIVIDUAL              ,'
      '       PRM.BUSQUEDA_SUBCTAS                       ,'
      '       PRM.SCTAOTRASREMUN                         ,'
      '       PRM.DESCPROV_CARTERAEFECTOS                ,'
      '       PRM.DESCCLI_CARTERAEFECTOS                 ,'
      '       PRM.TIPOEMPRESA                            ,'
      '       PRM.FILTROSUBCTAS                          ,'
      '       PRM.OFFICE2003                             ,'
      '       PRM.TRATASERIE                             ,'
      '       PRM.ACTCOMENTARIO'
      'FROM PARAMETROS PRM'
      'LEFT JOIN SUBCTAS S01 ON S01.SUBCUENTA = PRM.SCTAIVANORMAL'
      'LEFT JOIN SUBCTAS S02 ON S02.SUBCUENTA = PRM.SCTAIVAREDUCIDO'
      'LEFT JOIN SUBCTAS S03 ON S03.SUBCUENTA = PRM.SCTAIVASUPER'
      'LEFT JOIN SUBCTAS S04 ON S04.SUBCUENTA = PRM.SCTAIVAEXENTO'
      
        'LEFT JOIN SUBCTAS S05 ON S05.SUBCUENTA = PRM.SCTAIVAINTRADEDUCIB' +
        'LE'
      'LEFT JOIN SUBCTAS S06 ON S06.SUBCUENTA = PRM.SCTAIVAINTRA'
      'LEFT JOIN SUBCTAS S07 ON S07.SUBCUENTA = PRM.SCTAVENTAS'
      'LEFT JOIN SUBCTAS S08 ON S08.SUBCUENTA = PRM.SCTADEVOLUCION'
      'LEFT JOIN SUBCTAS S09 ON S09.SUBCUENTA = PRM.SCTARECNORMAL'
      'LEFT JOIN SUBCTAS S10 ON S10.SUBCUENTA = PRM.SCTARECREDUCIDO'
      'LEFT JOIN SUBCTAS S11 ON S11.SUBCUENTA = PRM.SCTARECSUPER'
      'LEFT JOIN SUBCTAS S12 ON S12.SUBCUENTA = PRM.VGENERICA'
      'LEFT JOIN SUBCTAS S13 ON S13.SUBCUENTA = PRM.SUBCAJA'
      'LEFT JOIN SUBCTAS S14 ON S14.SUBCUENTA = PRM.SCTAIVAEXENTOCEE'
      'LEFT JOIN SUBCTAS S15 ON S15.SUBCUENTA = PRM.SCTAINTERESES'
      'LEFT JOIN SUBCTAS S16 ON S16.SUBCUENTA = PRM.SCTAEXPORTACIONES'
      'LEFT JOIN SUBCTAS S17 ON S17.SUBCUENTA = PRM.SCTAIVACNORMAL'
      'LEFT JOIN SUBCTAS S18 ON S18.SUBCUENTA = PRM.SCTAIVACREDUCIDO'
      'LEFT JOIN SUBCTAS S19 ON S19.SUBCUENTA = PRM.SCTAIVACSUPER'
      'LEFT JOIN SUBCTAS S20 ON S20.SUBCUENTA = PRM.SCTAIVACEXENTO'
      'LEFT JOIN SUBCTAS S21 ON S21.SUBCUENTA = PRM.SCTACOMPRAS'
      
        'LEFT JOIN SUBCTAS S22 ON S22.SUBCUENTA = PRM.SCTAIVACINTRADEDUCI' +
        'BLE'
      
        'LEFT JOIN SUBCTAS S23 ON S23.SUBCUENTA = PRM.SCTAIVACINTRAREPERC' +
        'UTIDO'
      'LEFT JOIN SUBCTAS S24 ON S24.SUBCUENTA = PRM.VGENERICAC'
      
        'LEFT JOIN SUBCTAS S25 ON S25.SUBCUENTA = PRM.SCTAEFECTOSCOMERCIA' +
        'LES'
      
        'LEFT JOIN SUBCTAS S26 ON S26.SUBCUENTA = PRM.SCTAEFECTDESCONTADO' +
        'S'
      
        'LEFT JOIN SUBCTAS S27 ON S27.SUBCUENTA = PRM.SCTADEUDASDESCUENTO' +
        'S'
      'LEFT JOIN SUBCTAS S28 ON S28.SUBCUENTA = PRM.SCTAREMESAEFECTOS'
      'LEFT JOIN SUBCTAS S29 ON S29.SUBCUENTA = PRM.SCTADTOPPV'
      'LEFT JOIN SUBCTAS S30 ON S30.SUBCUENTA = PRM.SCTADTOPPC'
      'LEFT JOIN SUBCTAS S31 ON S31.SUBCUENTA = PRM.SCTARETPROF'
      'LEFT JOIN SUBCTAS S32 ON S32.SUBCUENTA = PRM.SCTARETARRE'
      'LEFT JOIN SUBCTAS S33 ON S33.SUBCUENTA = PRM.SCTAHACIVA'
      'LEFT JOIN SUBCTAS S34 ON S34.SUBCUENTA = PRM.SCTAGENINTRACOM'
      'LEFT JOIN SUBCTAS S35 ON S35.SUBCUENTA = PRM.SCTABANCO'
      'LEFT JOIN CONCEPTOS C01 ON C01.ID_CONCEPTOS = PRM.CTOIVANORMAL'
      'LEFT JOIN CONCEPTOS C02 ON C02.ID_CONCEPTOS = PRM.CTOIVAREDUCIDO'
      'LEFT JOIN CONCEPTOS C03 ON C03.ID_CONCEPTOS = PRM.CTOIVASUPER'
      'LEFT JOIN CONCEPTOS C04 ON C04.ID_CONCEPTOS = PRM.CTOIVAEXENTO'
      'LEFT JOIN CONCEPTOS C05 ON C05.ID_CONCEPTOS = PRM.CTOIVAINTRA'
      'LEFT JOIN CONCEPTOS C06 ON C06.ID_CONCEPTOS = PRM.CTOVENTAS'
      'LEFT JOIN CONCEPTOS C07 ON C07.ID_CONCEPTOS = PRM.CTODEVOLUCION'
      'LEFT JOIN CONCEPTOS C08 ON C08.ID_CONCEPTOS = PRM.CTOCLIENTES'
      'LEFT JOIN CONCEPTOS C09 ON C09.ID_CONCEPTOS = PRM.CTORECNORMAL'
      'LEFT JOIN CONCEPTOS C10 ON C10.ID_CONCEPTOS = PRM.CTORECREDUCIDO'
      'LEFT JOIN CONCEPTOS C11 ON C11.ID_CONCEPTOS = PRM.CTORECSUPER'
      'LEFT JOIN CONCEPTOS C12 ON C12.ID_CONCEPTOS = PRM.CTOCOBROF'
      
        'LEFT JOIN CONCEPTOS C13 ON C13.ID_CONCEPTOS = PRM.CTORECIBOVENTA' +
        'S'
      'LEFT JOIN CONCEPTOS C14 ON C14.ID_CONCEPTOS = PRM.CTOIVACNORMAL'
      
        'LEFT JOIN CONCEPTOS C15 ON C15.ID_CONCEPTOS = PRM.CTOIVACREDUCID' +
        'O'
      'LEFT JOIN CONCEPTOS C16 ON C16.ID_CONCEPTOS = PRM.CTOIVACSUPER'
      'LEFT JOIN CONCEPTOS C17 ON C17.ID_CONCEPTOS = PRM.CTOIVACEXENTO'
      'LEFT JOIN CONCEPTOS C18 ON C18.ID_CONCEPTOS = PRM.CTOCOMPRAS'
      'LEFT JOIN CONCEPTOS C19 ON C19.ID_CONCEPTOS = PRM.CTOPROVEEDORES'
      'LEFT JOIN CONCEPTOS C20 ON C20.ID_CONCEPTOS = PRM.CTOPROVINTRA'
      'LEFT JOIN CONCEPTOS C21 ON C21.ID_CONCEPTOS = PRM.CTOPAGOF'
      
        'LEFT JOIN CONCEPTOS C22 ON C22.ID_CONCEPTOS = PRM.CTOEFECTOSCOME' +
        'RCIALES'
      
        'LEFT JOIN CONCEPTOS C23 ON C23.ID_CONCEPTOS = PRM.CTODEUDASDESCU' +
        'ENTOS'
      
        'LEFT JOIN CONCEPTOS C24 ON C24.ID_CONCEPTOS = PRM.CTOREMESAEFECT' +
        'OS'
      'LEFT JOIN CONCEPTOS C25 ON C25.ID_CONCEPTOS = PRM.CTODTOPPV'
      'LEFT JOIN CONCEPTOS C26 ON C26.ID_CONCEPTOS = PRM.CTODTOPPC'
      'LEFT JOIN CONCEPTOS C27 ON C27.ID_CONCEPTOS = PRM.CTORETPROF'
      'LEFT JOIN CONCEPTOS C28 ON C28.ID_CONCEPTOS = PRM.CTORETARRE'
      'LEFT JOIN CONCEPTOS C29 ON C29.ID_CONCEPTOS = PRM.CTOHACIVA'
      'LEFT JOIN CONCEPTOS C30 ON C30.ID_CONCEPTOS = PRM.CTOCOBRO'
      'LEFT JOIN CONCEPTOS C31 ON C31.ID_CONCEPTOS = PRM.CTOPAGO')
    ModifySQL.Strings = (
      'UPDATE PARAMETROS'
      'SET'
      
        '  FECHA_INICIO_APLICACION        =:FECHA_INICIO_APLICACION      ' +
        '   '
      
        '  ,FECHA_INICIO_EJERCICIO         =:FECHA_INICIO_EJERCICIO      ' +
        '    '
      
        '  ,FECHA_FIN_EJERCICIO            =:FECHA_FIN_EJERCICIO         ' +
        '    '
      
        '  ,TANTORETPROF                   =:TANTORETPROF                ' +
        '    '
      
        '  ,TANTORETARRE                   =:TANTORETARRE                ' +
        '    '
      
        '  ,FECHAAMORTIZACION              =:FECHAAMORTIZACION           ' +
        '    '
      
        '  ,FECHABLOQUEO                   =:FECHABLOQUEO                ' +
        '    '
      
        '  ,SCTAREMESAEFECTOS              =:SCTAREMESAEFECTOS           ' +
        '    '
      
        '  ,SCTAEFECTOSCOMERCIALES         =:SCTAEFECTOSCOMERCIALES      ' +
        '    '
      
        '  ,SCTABANCO                      =:SCTABANCO                   ' +
        '    '
      
        '  ,SCTAOTRASREMUN                 =:SCTAOTRASREMUN              ' +
        '    '
      
        '  ,SCTAIVANORMAL                  =:SCTAIVANORMAL               ' +
        '    '
      
        '  ,SCTAIVAEXENTO                  =:SCTAIVAEXENTO               ' +
        '    '
      
        '  ,SCTAIVAINTRA                   =:SCTAIVAINTRA                ' +
        '    '
      
        '  ,SCTAVENTAS                     =:SCTAVENTAS                  ' +
        '    '
      
        '  ,SCTADEVOLUCION                 =:SCTADEVOLUCION              ' +
        '    '
      
        '  ,SCTADESCUENTO                  =:SCTADESCUENTO               ' +
        '    '
      
        '  ,SCTACOMPRAS                    =:SCTACOMPRAS                 ' +
        '    '
      
        '  ,SCTAIVAREDUCIDO                =:SCTAIVAREDUCIDO             ' +
        '    '
      
        '  ,SCTAIVASUPER                   =:SCTAIVASUPER                ' +
        '    '
      
        '  ,SCTAIVACNORMAL                 =:SCTAIVACNORMAL              ' +
        '    '
      
        '  ,SCTAIVACREDUCIDO               =:SCTAIVACREDUCIDO            ' +
        '    '
      
        '  ,SCTAIVACSUPER                  =:SCTAIVACSUPER               ' +
        '    '
      
        '  ,SCTARECNORMAL                  =:SCTARECNORMAL               ' +
        '    '
      
        '  ,SCTARECREDUCIDO                =:SCTARECREDUCIDO             ' +
        '    '
      
        '  ,SCTARECSUPER                   =:SCTARECSUPER                ' +
        '    '
      
        '  ,SUBCUENTA_CIERRE               =:SUBCUENTA_CIERRE            ' +
        '    '
      
        '  ,VGENERICA                      =:VGENERICA                   ' +
        '    '
      
        '  ,SUBCAJA                        =:SUBCAJA                     ' +
        '    '
      
        '  ,SCTANOMSUELDO                  =:SCTANOMSUELDO               ' +
        '    '
      
        '  ,SCTANOMIRPF                    =:SCTANOMIRPF                 ' +
        '    '
      
        '  ,SCTANOMPAGO                    =:SCTANOMPAGO                 ' +
        '    '
      
        '  ,SCTANOMSSE                     =:SCTANOMSSE                  ' +
        '    '
      
        '  ,SCTANOMSST                     =:SCTANOMSST                  ' +
        '    '
      
        '  ,SCTANOMCARGO                   =:SCTANOMCARGO                ' +
        '    '
      
        '  ,SCTADTOPPV                     =:SCTADTOPPV                  ' +
        '    '
      
        '  ,SCTADTOPPC                     =:SCTADTOPPC                  ' +
        '    '
      
        '  ,SCTARETPROF                    =:SCTARETPROF                 ' +
        '    '
      
        '  ,SCTARETARRE                    =:SCTARETARRE                 ' +
        '    '
      
        '  ,SCTAHACIVA                     =:SCTAHACIVA                  ' +
        '    '
      
        '  ,SCTAIVACEXENTO                 =:SCTAIVACEXENTO              ' +
        '    '
      
        '  ,VGENERICAC                     =:VGENERICAC                  ' +
        '    '
      
        '  ,CODPOSTAL                      =:CODPOSTAL                   ' +
        '    '
      
        '  ,CONTACTO                       =:CONTACTO                    ' +
        '    '
      
        '  ,NUMEROCALLE                    =:NUMEROCALLE                 ' +
        '    '
      
        '  ,SCTAEFECTDESCONTADOS           =:SCTAEFECTDESCONTADOS        ' +
        '    '
      
        '  ,SCTADEUDASDESCUENTOS           =:SCTADEUDASDESCUENTOS        ' +
        '    '
      
        '  ,SCTAIVAINTRADEDUCIBLE          =:SCTAIVAINTRADEDUCIBLE       ' +
        '    '
      
        '  ,SCTAIVACINTRADEDUCIBLE         =:SCTAIVACINTRADEDUCIBLE      ' +
        '    '
      
        '  ,SCTAIVACINTRAREPERCUTIDO       =:SCTAIVACINTRAREPERCUTIDO    ' +
        '    '
      
        '  ,SCTAGENINTRACOM                =:SCTAGENINTRACOM             ' +
        '    '
      
        '  ,SCTAIVAEXENTOCEE               =:SCTAIVAEXENTOCEE            ' +
        '    '
      
        '  ,SCTAINTERESES                  =:SCTAINTERESES               ' +
        '    '
      
        '  ,SCTAEXPORTACIONES              =:SCTAEXPORTACIONES           ' +
        '    '
      
        '  ,LONGITUD_SUBCUENTAS            =:LONGITUD_SUBCUENTAS         ' +
        '    '
      
        '  ,TELEFONO                       =:TELEFONO                    ' +
        '    '
      
        '  ,FAX                            =:FAX                         ' +
        '    '
      
        '  ,NOMBREFISCAL                   =:NOMBREFISCAL                ' +
        '    '
      
        '  ,DIRECCION                      =:DIRECCION                   ' +
        '    '
      
        '  ,DIRECCION1                     =:DIRECCION1                  ' +
        '    '
      
        '  ,POBLACION                      =:POBLACION                   ' +
        '    '
      
        '  ,PROVINCIA                      =:PROVINCIA                   ' +
        '    '
      
        '  ,DOCCLIENTE                     =:DOCCLIENTE                  ' +
        '    '
      
        '  ,DOCPROVEEDOR                   =:DOCPROVEEDOR                ' +
        '    '
      
        '  ,DOC347                         =:DOC347                      ' +
        '    '
      
        '  ,SIGLAVIA                       =:SIGLAVIA                    ' +
        '    '
      
        '  ,ESCALERA                       =:ESCALERA                    ' +
        '    '
      
        '  ,PISO                           =:PISO                        ' +
        '    '
      
        '  ,PUERTA                         =:PUERTA                      ' +
        '    '
      
        '  ,ASIENTOS_INICIO_INTERVALO_BQDA =:ASIENTOS_INICIO_INTERVALO_BQ' +
        'DA  '
      
        '  ,ASIENTOS_FIN_INTERVALO_BQDA    =:ASIENTOS_FIN_INTERVALO_BQDA ' +
        '    '
      
        '  ,ASIENTO_INICIO_INTERVALO_FILTRO=:ASIENTO_INICIO_INTERVALO_FIL' +
        'TRO '
      
        '  ,ASIENTO_FIN_INTERVALO_FILTRO   =:ASIENTO_FIN_INTERVALO_FILTRO' +
        '    '
      
        '  ,ACTCOMENTARIO                  =:ACTCOMENTARIO               ' +
        '    '
      
        '  ,TRATASERIE                     =:TRATASERIE                  ' +
        '    '
      
        '  ,OFFICE2003                     =:OFFICE2003                  ' +
        '    '
      
        '  ,FILTROSUBCTAS                  =:FILTROSUBCTAS               ' +
        '    '
      
        '  ,TIPOEMPRESA                    =:TIPOEMPRESA                 ' +
        '    '
      
        '  ,DESCCLI_CARTERAEFECTOS         =:DESCCLI_CARTERAEFECTOS      ' +
        '    '
      
        '  ,DESCPROV_CARTERAEFECTOS        =:DESCPROV_CARTERAEFECTOS     ' +
        '    '
      
        '  ,CTOREMESAEFECTOS               =:CTOREMESAEFECTOS            ' +
        '    '
      
        '  ,CTODEUDASDESCUENTOS            =:CTODEUDASDESCUENTOS         ' +
        '    '
      
        '  ,CTOEFECTOSCOMERCIALES          =:CTOEFECTOSCOMERCIALES       ' +
        '    '
      
        '  ,CTOPAGO                        =:CTOPAGO                     ' +
        '    '
      
        '  ,CTOCOBRO                       =:CTOCOBRO                    ' +
        '    '
      
        '  ,CTOIVANORMAL                   =:CTOIVANORMAL                ' +
        '    '
      
        '  ,CTOIVAEXENTO                   =:CTOIVAEXENTO                ' +
        '    '
      
        '  ,CTOIVAINTRA                    =:CTOIVAINTRA                 ' +
        '    '
      
        '  ,CTOVENTAS                      =:CTOVENTAS                   ' +
        '    '
      
        '  ,CTODEVOLUCION                  =:CTODEVOLUCION               ' +
        '    '
      
        '  ,CTOCLIENTES                    =:CTOCLIENTES                 ' +
        '    '
      
        '  ,CTODESCUENTO                   =:CTODESCUENTO                ' +
        '    '
      
        '  ,CTOCOMPRAS                     =:CTOCOMPRAS                  ' +
        '    '
      
        '  ,CTOIVAREDUCIDO                 =:CTOIVAREDUCIDO              ' +
        '    '
      
        '  ,CTO_REGULARIZACION_ESP         =:CTO_REGULARIZACION_ESP      ' +
        '    '
      
        '  ,CTO_APERTURA                   =:CTO_APERTURA                ' +
        '    '
      
        '  ,CTOIVASUPER                    =:CTOIVASUPER                 ' +
        '    '
      
        '  ,CTOPROVEEDORES                 =:CTOPROVEEDORES              ' +
        '    '
      
        '  ,CTOIVACNORMAL                  =:CTOIVACNORMAL               ' +
        '    '
      
        '  ,CTOIVACREDUCIDO                =:CTOIVACREDUCIDO             ' +
        '    '
      
        '  ,CTOIVACSUPER                   =:CTOIVACSUPER                ' +
        '    '
      
        '  ,CTORECNORMAL                   =:CTORECNORMAL                ' +
        '    '
      
        '  ,CTORECREDUCIDO                 =:CTORECREDUCIDO              ' +
        '    '
      
        '  ,CTORECSUPER                    =:CTORECSUPER                 ' +
        '    '
      
        '  ,CTORECIBOVENTAS                =:CTORECIBOVENTAS             ' +
        '    '
      
        '  ,DOCIMPRIMIR                    =:DOCIMPRIMIR                 ' +
        '    '
      
        '  ,CTO_REGULARIZACION             =:CTO_REGULARIZACION          ' +
        '    '
      
        '  ,MONEDA                         =:MONEDA                      ' +
        '    '
      
        '  ,CTOCOBROF                      =:CTOCOBROF                   ' +
        '    '
      
        '  ,CTONOME                        =:CTONOME                     ' +
        '    '
      
        '  ,CTONOMT                        =:CTONOMT                     ' +
        '    '
      
        '  ,CTODTOPPV                      =:CTODTOPPV                   ' +
        '    '
      
        '  ,CTODTOPPC                      =:CTODTOPPC                   ' +
        '    '
      
        '  ,CTORETPROF                     =:CTORETPROF                  ' +
        '    '
      
        '  ,CTORETARRE                     =:CTORETARRE                  ' +
        '    '
      
        '  ,CTOHACIVA                      =:CTOHACIVA                   ' +
        '    '
      
        '  ,CTOIVACEXENTO                  =:CTOIVACEXENTO               ' +
        '    '
      
        '  ,CTOPAGOF                       =:CTOPAGOF                    ' +
        '    '
      
        '  ,RECARGO                        =:RECARGO                     ' +
        '    '
      
        '  ,CTO_APERTURA_ESP               =:CTO_APERTURA_ESP            ' +
        '    '
      
        '  ,NIF                            =:NIF                         ' +
        '    '
      
        '  ,CCC                            =:CCC                         ' +
        '    '
      
        '  ,CODADMON                       =:CODADMON                    ' +
        '    '
      
        '  ,GESTIONA_CARTERA_EFECTOS       =:GESTIONA_CARTERA_EFECTOS    ' +
        '    '
      
        '  ,FILTRO_ASIENTOS_INICIO         =:FILTRO_ASIENTOS_INICIO      ' +
        '    '
      
        '  ,INCLUIR_ABREV                  =:INCLUIR_ABREV               ' +
        '    '
      
        '  ,MOSTRAR_FILTRO_MAYOR           =:MOSTRAR_FILTRO_MAYOR        ' +
        '    '
      
        '  ,CTOPROVINTRA                   =:CTOPROVINTRA                ' +
        '    '
      
        '  ,ASIENTO_NOMINA_INDIVIDUAL      =:ASIENTO_NOMINA_INDIVIDUAL   ' +
        '    '
      
        '  ,BUSQUEDA_SUBCTAS               =:BUSQUEDA_SUBCTAS            ' +
        '    '
      ','
      
        '  ID_PARAMETROS                  =:ID_PARAMETROS                ' +
        '   '
      'WHERE'
      
        '  ID_PARAMETROS                  =:old_ID_PARAMETROS            ' +
        '       ')
    Left = 484
    Top = 8
    object QParametrosID_PARAMETROS: TSmallintField
      FieldName = 'ID_PARAMETROS'
      Origin = 'PARAMETROS.ID_PARAMETROS'
      Required = True
    end
    object QParametrosLONGITUD_SUBCUENTAS: TSmallintField
      FieldName = 'LONGITUD_SUBCUENTAS'
      Origin = 'PARAMETROS.LONGITUD_SUBCUENTAS'
    end
    object QParametrosFECHA_INICIO_APLICACION: TDateTimeField
      FieldName = 'FECHA_INICIO_APLICACION'
      Origin = 'PARAMETROS.FECHA_INICIO_APLICACION'
    end
    object QParametrosFECHA_INICIO_EJERCICIO: TDateTimeField
      FieldName = 'FECHA_INICIO_EJERCICIO'
      Origin = 'PARAMETROS.FECHA_INICIO_EJERCICIO'
    end
    object QParametrosFECHA_FIN_EJERCICIO: TDateTimeField
      FieldName = 'FECHA_FIN_EJERCICIO'
      Origin = 'PARAMETROS.FECHA_FIN_EJERCICIO'
    end
    object QParametrosCTO_REGULARIZACION: TIBStringField
      FieldName = 'CTO_REGULARIZACION'
      Origin = 'PARAMETROS.CTO_REGULARIZACION'
      FixedChar = True
      Size = 3
    end
    object QParametrosSUBCUENTA_CIERRE: TIBStringField
      FieldName = 'SUBCUENTA_CIERRE'
      Origin = 'PARAMETROS.SUBCUENTA_CIERRE'
      Size = 10
    end
    object QParametrosMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PARAMETROS.MONEDA'
      Size = 1
    end
    object QParametrosNOMBREFISCAL: TIBStringField
      FieldName = 'NOMBREFISCAL'
      Origin = 'PARAMETROS.NOMBREFISCAL'
      Size = 80
    end
    object QParametrosDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'PARAMETROS.DIRECCION'
      Size = 40
    end
    object QParametrosDIRECCION1: TIBStringField
      FieldName = 'DIRECCION1'
      Origin = 'PARAMETROS.DIRECCION1'
      Size = 40
    end
    object QParametrosPOBLACION: TIBStringField
      FieldName = 'POBLACION'
      Origin = 'PARAMETROS.POBLACION'
      Size = 40
    end
    object QParametrosCODPOSTAL: TIBStringField
      FieldName = 'CODPOSTAL'
      Origin = 'PARAMETROS.CODPOSTAL'
      Size = 10
    end
    object QParametrosPROVINCIA: TIBStringField
      FieldName = 'PROVINCIA'
      Origin = 'PARAMETROS.PROVINCIA'
      FixedChar = True
      Size = 2
    end
    object QParametrosNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'PARAMETROS.NIF'
      Size = 15
    end
    object QParametrosCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PARAMETROS.CONTACTO'
      Size = 50
    end
    object QParametrosDOCCLIENTE: TIBStringField
      FieldName = 'DOCCLIENTE'
      Origin = 'PARAMETROS.DOCCLIENTE'
      Size = 100
    end
    object QParametrosDOCPROVEEDOR: TIBStringField
      FieldName = 'DOCPROVEEDOR'
      Origin = 'PARAMETROS.DOCPROVEEDOR'
      Size = 100
    end
    object QParametrosDOC347: TIBStringField
      FieldName = 'DOC347'
      Origin = 'PARAMETROS.DOC347'
      Size = 100
    end
    object QParametrosFECHABLOQUEO: TDateTimeField
      FieldName = 'FECHABLOQUEO'
      Origin = 'PARAMETROS.FECHABLOQUEO'
    end
    object QParametrosCTO_APERTURA: TIBStringField
      FieldName = 'CTO_APERTURA'
      Origin = 'PARAMETROS.CTO_APERTURA'
      FixedChar = True
      Size = 3
    end
    object QParametrosCTO_REGULARIZACION_ESP: TIBStringField
      FieldName = 'CTO_REGULARIZACION_ESP'
      Origin = 'PARAMETROS.CTO_REGULARIZACION_ESP'
      FixedChar = True
      Size = 3
    end
    object QParametrosFECHAAMORTIZACION: TDateTimeField
      FieldName = 'FECHAAMORTIZACION'
      Origin = 'PARAMETROS.FECHAAMORTIZACION'
    end
    object QParametrosRECARGO: TIBStringField
      FieldName = 'RECARGO'
      Origin = 'PARAMETROS.RECARGO'
      FixedChar = True
      Size = 1
    end
    object QParametrosCTO_APERTURA_ESP: TIBStringField
      FieldName = 'CTO_APERTURA_ESP'
      Origin = 'PARAMETROS.CTO_APERTURA_ESP'
      FixedChar = True
      Size = 3
    end
    object QParametrosSCTAIVANORMAL: TIBStringField
      FieldName = 'SCTAIVANORMAL'
      Origin = 'PARAMETROS.SCTAIVANORMAL'
      Size = 10
    end
    object QParametrosSCTAIVANORMAL_DS: TIBStringField
      FieldName = 'SCTAIVANORMAL_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVAREDUCIDO: TIBStringField
      FieldName = 'SCTAIVAREDUCIDO'
      Origin = 'PARAMETROS.SCTAIVAREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVAREDUCIDO_DS: TIBStringField
      FieldName = 'SCTAIVAREDUCIDO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVASUPER: TIBStringField
      FieldName = 'SCTAIVASUPER'
      Origin = 'PARAMETROS.SCTAIVASUPER'
      Size = 10
    end
    object QParametrosSCTAIVASUPER_DS: TIBStringField
      FieldName = 'SCTAIVASUPER_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVAEXENTO: TIBStringField
      FieldName = 'SCTAIVAEXENTO'
      Origin = 'PARAMETROS.SCTAIVAEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTO_DS: TIBStringField
      FieldName = 'SCTAIVAEXENTO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE: TIBStringField
      FieldName = 'SCTAIVAINTRADEDUCIBLE'
      Origin = 'PARAMETROS.SCTAIVAINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE_DS: TIBStringField
      FieldName = 'SCTAIVAINTRADEDUCIBLE_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVAINTRA: TIBStringField
      FieldName = 'SCTAIVAINTRA'
      Origin = 'PARAMETROS.SCTAIVAINTRA'
      Size = 10
    end
    object QParametrosSCTAIVAINTRA_DS: TIBStringField
      FieldName = 'SCTAIVAINTRA_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAVENTAS: TIBStringField
      FieldName = 'SCTAVENTAS'
      Origin = 'PARAMETROS.SCTAVENTAS'
      Size = 10
    end
    object QParametrosSCTAVENTAS_DS: TIBStringField
      FieldName = 'SCTAVENTAS_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTADEVOLUCION: TIBStringField
      FieldName = 'SCTADEVOLUCION'
      Origin = 'PARAMETROS.SCTADEVOLUCION'
      Size = 10
    end
    object QParametrosSCTADEVOLUCION_DS: TIBStringField
      FieldName = 'SCTADEVOLUCION_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTARECNORMAL: TIBStringField
      FieldName = 'SCTARECNORMAL'
      Origin = 'PARAMETROS.SCTARECNORMAL'
      Size = 10
    end
    object QParametrosSCTARECNORMAL_DS: TIBStringField
      FieldName = 'SCTARECNORMAL_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTARECREDUCIDO: TIBStringField
      FieldName = 'SCTARECREDUCIDO'
      Origin = 'PARAMETROS.SCTARECREDUCIDO'
      Size = 10
    end
    object QParametrosSCTARECREDUCIDO_DS: TIBStringField
      FieldName = 'SCTARECREDUCIDO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTARECSUPER: TIBStringField
      FieldName = 'SCTARECSUPER'
      Origin = 'PARAMETROS.SCTARECSUPER'
      Size = 10
    end
    object QParametrosSCTARECSUPER_DS: TIBStringField
      FieldName = 'SCTARECSUPER_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosVGENERICA: TIBStringField
      FieldName = 'VGENERICA'
      Origin = 'PARAMETROS.VGENERICA'
      Size = 10
    end
    object QParametrosVGENERICA_DS: TIBStringField
      FieldName = 'VGENERICA_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSUBCAJA: TIBStringField
      FieldName = 'SUBCAJA'
      Origin = 'PARAMETROS.SUBCAJA'
      Size = 10
    end
    object QParametrosSUBCAJA_DS: TIBStringField
      FieldName = 'SUBCAJA_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVAEXENTOCEE: TIBStringField
      FieldName = 'SCTAIVAEXENTOCEE'
      Origin = 'PARAMETROS.SCTAIVAEXENTOCEE'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTOCEE_DS: TIBStringField
      FieldName = 'SCTAIVAEXENTOCEE_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAINTERESES: TIBStringField
      FieldName = 'SCTAINTERESES'
      Origin = 'PARAMETROS.SCTAINTERESES'
      Size = 10
    end
    object QParametrosSCTAINTERESES_DS: TIBStringField
      FieldName = 'SCTAINTERESES_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAEXPORTACIONES: TIBStringField
      FieldName = 'SCTAEXPORTACIONES'
      Origin = 'PARAMETROS.SCTAEXPORTACIONES'
      Size = 10
    end
    object QParametrosSCTAEXPORTACIONES_DS: TIBStringField
      FieldName = 'SCTAEXPORTACIONES_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACNORMAL: TIBStringField
      FieldName = 'SCTAIVACNORMAL'
      Origin = 'PARAMETROS.SCTAIVACNORMAL'
      Size = 10
    end
    object QParametrosSCTAIVACNORMAL_DS: TIBStringField
      FieldName = 'SCTAIVACNORMAL_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACREDUCIDO: TIBStringField
      FieldName = 'SCTAIVACREDUCIDO'
      Origin = 'PARAMETROS.SCTAIVACREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVACREDUCIDO_DS: TIBStringField
      FieldName = 'SCTAIVACREDUCIDO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACSUPER: TIBStringField
      FieldName = 'SCTAIVACSUPER'
      Origin = 'PARAMETROS.SCTAIVACSUPER'
      Size = 10
    end
    object QParametrosSCTAIVACSUPER_DS: TIBStringField
      FieldName = 'SCTAIVACSUPER_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACEXENTO: TIBStringField
      FieldName = 'SCTAIVACEXENTO'
      Origin = 'PARAMETROS.SCTAIVACEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVACEXENTO_DS: TIBStringField
      FieldName = 'SCTAIVACEXENTO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTACOMPRAS: TIBStringField
      FieldName = 'SCTACOMPRAS'
      Origin = 'PARAMETROS.SCTACOMPRAS'
      Size = 10
    end
    object QParametrosSCTACOMPRAS_DS: TIBStringField
      FieldName = 'SCTACOMPRAS_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE: TIBStringField
      FieldName = 'SCTAIVACINTRADEDUCIBLE'
      Origin = 'PARAMETROS.SCTAIVACINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE_DS: TIBStringField
      FieldName = 'SCTAIVACINTRADEDUCIBLE_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO: TIBStringField
      FieldName = 'SCTAIVACINTRAREPERCUTIDO'
      Origin = 'PARAMETROS.SCTAIVACINTRAREPERCUTIDO'
      Size = 10
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO_DS: TIBStringField
      FieldName = 'SCTAIVACINTRAREPERCUTIDO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosVGENERICAC: TIBStringField
      FieldName = 'VGENERICAC'
      Origin = 'PARAMETROS.VGENERICAC'
      Size = 10
    end
    object QParametrosVGENERICAC_DS: TIBStringField
      FieldName = 'VGENERICAC_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAEFECTOSCOMERCIALES: TIBStringField
      FieldName = 'SCTAEFECTOSCOMERCIALES'
      Origin = 'PARAMETROS.SCTAEFECTOSCOMERCIALES'
      Size = 10
    end
    object QParametrosSCTAEFECTOSCOMERCIALES_DS: TIBStringField
      FieldName = 'SCTAEFECTOSCOMERCIALES_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAEFECTDESCONTADOS: TIBStringField
      FieldName = 'SCTAEFECTDESCONTADOS'
      Origin = 'PARAMETROS.SCTAEFECTDESCONTADOS'
      Size = 10
    end
    object QParametrosSCTAEFECTDESCONTADOS_DS: TIBStringField
      FieldName = 'SCTAEFECTDESCONTADOS_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTADEUDASDESCUENTOS: TIBStringField
      FieldName = 'SCTADEUDASDESCUENTOS'
      Origin = 'PARAMETROS.SCTADEUDASDESCUENTOS'
      Size = 10
    end
    object QParametrosSCTADEUDASDESCUENTOS_DS: TIBStringField
      FieldName = 'SCTADEUDASDESCUENTOS_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAREMESAEFECTOS: TIBStringField
      FieldName = 'SCTAREMESAEFECTOS'
      Origin = 'PARAMETROS.SCTAREMESAEFECTOS'
      Size = 10
    end
    object QParametrosSCTAREMESAEFECTOS_DS: TIBStringField
      FieldName = 'SCTAREMESAEFECTOS_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTADTOPPV: TIBStringField
      FieldName = 'SCTADTOPPV'
      Origin = 'PARAMETROS.SCTADTOPPV'
      Size = 10
    end
    object QParametrosSCTADTOPPV_DS: TIBStringField
      FieldName = 'SCTADTOPPV_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTADTOPPC: TIBStringField
      FieldName = 'SCTADTOPPC'
      Origin = 'PARAMETROS.SCTADTOPPC'
      Size = 10
    end
    object QParametrosSCTADTOPPC_DS: TIBStringField
      FieldName = 'SCTADTOPPC_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTARETPROF: TIBStringField
      FieldName = 'SCTARETPROF'
      Origin = 'PARAMETROS.SCTARETPROF'
      Size = 10
    end
    object QParametrosSCTARETPROF_DS: TIBStringField
      FieldName = 'SCTARETPROF_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTARETARRE: TIBStringField
      FieldName = 'SCTARETARRE'
      Origin = 'PARAMETROS.SCTARETARRE'
      Size = 10
    end
    object QParametrosSCTARETARRE_DS: TIBStringField
      FieldName = 'SCTARETARRE_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAHACIVA: TIBStringField
      FieldName = 'SCTAHACIVA'
      Origin = 'PARAMETROS.SCTAHACIVA'
      Size = 10
    end
    object QParametrosSCTAHACIVA_DS: TIBStringField
      FieldName = 'SCTAHACIVA_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTAGENINTRACOM: TIBStringField
      FieldName = 'SCTAGENINTRACOM'
      Origin = 'PARAMETROS.SCTAGENINTRACOM'
      Size = 10
    end
    object QParametrosSCTAGENINTRACOM_DS: TIBStringField
      FieldName = 'SCTAGENINTRACOM_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosSCTABANCO: TIBStringField
      FieldName = 'SCTABANCO'
      Origin = 'PARAMETROS.SCTABANCO'
      Size = 10
    end
    object QParametrosSCTABANCO_DS: TIBStringField
      FieldName = 'SCTABANCO_DS'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
    object QParametrosCTOIVANORMAL: TIBStringField
      FieldName = 'CTOIVANORMAL'
      Origin = 'PARAMETROS.CTOIVANORMAL'
      Size = 3
    end
    object QParametrosCTOIVANORMAL_DS: TIBStringField
      FieldName = 'CTOIVANORMAL_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVAREDUCIDO: TIBStringField
      FieldName = 'CTOIVAREDUCIDO'
      Origin = 'PARAMETROS.CTOIVAREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVAREDUCIDO_DS: TIBStringField
      FieldName = 'CTOIVAREDUCIDO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVASUPER: TIBStringField
      FieldName = 'CTOIVASUPER'
      Origin = 'PARAMETROS.CTOIVASUPER'
      Size = 3
    end
    object QParametrosCTOIVASUPER_DS: TIBStringField
      FieldName = 'CTOIVASUPER_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVAEXENTO: TIBStringField
      FieldName = 'CTOIVAEXENTO'
      Origin = 'PARAMETROS.CTOIVAEXENTO'
      Size = 3
    end
    object QParametrosCTOIVAEXENTO_DS: TIBStringField
      FieldName = 'CTOIVAEXENTO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVAINTRA: TIBStringField
      FieldName = 'CTOIVAINTRA'
      Origin = 'PARAMETROS.CTOIVAINTRA'
      Size = 3
    end
    object QParametrosCTOIVAINTRA_DS: TIBStringField
      FieldName = 'CTOIVAINTRA_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOVENTAS: TIBStringField
      FieldName = 'CTOVENTAS'
      Origin = 'PARAMETROS.CTOVENTAS'
      Size = 3
    end
    object QParametrosCTOVENTAS_DS: TIBStringField
      FieldName = 'CTOVENTAS_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTODEVOLUCION: TIBStringField
      FieldName = 'CTODEVOLUCION'
      Origin = 'PARAMETROS.CTODEVOLUCION'
      Size = 3
    end
    object QParametrosCTODEVOLUCION_DS: TIBStringField
      FieldName = 'CTODEVOLUCION_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOCLIENTES: TIBStringField
      FieldName = 'CTOCLIENTES'
      Origin = 'PARAMETROS.CTOCLIENTES'
      Size = 3
    end
    object QParametrosCTOCLIENTES_DS: TIBStringField
      FieldName = 'CTOCLIENTES_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORECNORMAL: TIBStringField
      FieldName = 'CTORECNORMAL'
      Origin = 'PARAMETROS.CTORECNORMAL'
      Size = 3
    end
    object QParametrosCTORECNORMAL_DS: TIBStringField
      FieldName = 'CTORECNORMAL_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORECREDUCIDO: TIBStringField
      FieldName = 'CTORECREDUCIDO'
      Origin = 'PARAMETROS.CTORECREDUCIDO'
      Size = 3
    end
    object QParametrosCTORECREDUCIDO_DS: TIBStringField
      FieldName = 'CTORECREDUCIDO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORECSUPER: TIBStringField
      FieldName = 'CTORECSUPER'
      Origin = 'PARAMETROS.CTORECSUPER'
      Size = 3
    end
    object QParametrosCTORECSUPER_DS: TIBStringField
      FieldName = 'CTORECSUPER_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOCOBROF: TIBStringField
      FieldName = 'CTOCOBROF'
      Origin = 'PARAMETROS.CTOCOBROF'
      Size = 3
    end
    object QParametrosCTOCOBROF_DS: TIBStringField
      FieldName = 'CTOCOBROF_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORECIBOVENTAS: TIBStringField
      FieldName = 'CTORECIBOVENTAS'
      Origin = 'PARAMETROS.CTORECIBOVENTAS'
      Size = 3
    end
    object QParametrosCTORECIBOVENTAS_DS: TIBStringField
      FieldName = 'CTORECIBOVENTAS_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVACNORMAL: TIBStringField
      FieldName = 'CTOIVACNORMAL'
      Origin = 'PARAMETROS.CTOIVACNORMAL'
      Size = 3
    end
    object QParametrosCTOIVACNORMAL_DS: TIBStringField
      FieldName = 'CTOIVACNORMAL_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVACREDUCIDO: TIBStringField
      FieldName = 'CTOIVACREDUCIDO'
      Origin = 'PARAMETROS.CTOIVACREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVACREDUCIDO_DS: TIBStringField
      FieldName = 'CTOIVACREDUCIDO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVACSUPER: TIBStringField
      FieldName = 'CTOIVACSUPER'
      Origin = 'PARAMETROS.CTOIVACSUPER'
      Size = 3
    end
    object QParametrosCTOIVACSUPER_DS: TIBStringField
      FieldName = 'CTOIVACSUPER_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOIVACEXENTO: TIBStringField
      FieldName = 'CTOIVACEXENTO'
      Origin = 'PARAMETROS.CTOIVACEXENTO'
      Size = 3
    end
    object QParametrosCTOIVACEXENTO_DS: TIBStringField
      FieldName = 'CTOIVACEXENTO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOCOMPRAS: TIBStringField
      FieldName = 'CTOCOMPRAS'
      Origin = 'PARAMETROS.CTOCOMPRAS'
      Size = 3
    end
    object QParametrosCTOCOMPRAS_DS: TIBStringField
      FieldName = 'CTOCOMPRAS_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOPROVEEDORES: TIBStringField
      FieldName = 'CTOPROVEEDORES'
      Origin = 'PARAMETROS.CTOPROVEEDORES'
      Size = 3
    end
    object QParametrosCTOPROVEEDORES_DS: TIBStringField
      FieldName = 'CTOPROVEEDORES_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOPROVINTRA: TIBStringField
      FieldName = 'CTOPROVINTRA'
      Origin = 'PARAMETROS.CTOPROVINTRA'
      FixedChar = True
      Size = 3
    end
    object QParametrosCTOPROVINTRA_DS: TIBStringField
      FieldName = 'CTOPROVINTRA_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOPAGOF: TIBStringField
      FieldName = 'CTOPAGOF'
      Origin = 'PARAMETROS.CTOPAGOF'
      Size = 3
    end
    object QParametrosCTOPAGOF_DS: TIBStringField
      FieldName = 'CTOPAGOF_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOEFECTOSCOMERCIALES: TIBStringField
      FieldName = 'CTOEFECTOSCOMERCIALES'
      Origin = 'PARAMETROS.CTOEFECTOSCOMERCIALES'
      Size = 3
    end
    object QParametrosCTOEFECTOSCOMERCIALES_DS: TIBStringField
      FieldName = 'CTOEFECTOSCOMERCIALES_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTODEUDASDESCUENTOS: TIBStringField
      FieldName = 'CTODEUDASDESCUENTOS'
      Origin = 'PARAMETROS.CTODEUDASDESCUENTOS'
      Size = 3
    end
    object QParametrosCTODEUDASDESCUENTOS_DS: TIBStringField
      FieldName = 'CTODEUDASDESCUENTOS_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOREMESAEFECTOS: TIBStringField
      FieldName = 'CTOREMESAEFECTOS'
      Origin = 'PARAMETROS.CTOREMESAEFECTOS'
      Size = 3
    end
    object QParametrosCTOREMESAEFECTOS_DS: TIBStringField
      FieldName = 'CTOREMESAEFECTOS_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTODTOPPV: TIBStringField
      FieldName = 'CTODTOPPV'
      Origin = 'PARAMETROS.CTODTOPPV'
      Size = 3
    end
    object QParametrosCTODTOPPV_DS: TIBStringField
      FieldName = 'CTODTOPPV_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTODTOPPC: TIBStringField
      FieldName = 'CTODTOPPC'
      Origin = 'PARAMETROS.CTODTOPPC'
      Size = 3
    end
    object QParametrosCTODTOPPC_DS: TIBStringField
      FieldName = 'CTODTOPPC_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORETPROF: TIBStringField
      FieldName = 'CTORETPROF'
      Origin = 'PARAMETROS.CTORETPROF'
      Size = 3
    end
    object QParametrosCTORETPROF_DS: TIBStringField
      FieldName = 'CTORETPROF_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTORETARRE: TIBStringField
      FieldName = 'CTORETARRE'
      Origin = 'PARAMETROS.CTORETARRE'
      Size = 3
    end
    object QParametrosCTORETARRE_DS: TIBStringField
      FieldName = 'CTORETARRE_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOHACIVA: TIBStringField
      FieldName = 'CTOHACIVA'
      Origin = 'PARAMETROS.CTOHACIVA'
      Size = 3
    end
    object QParametrosCTOHACIVA_DS: TIBStringField
      FieldName = 'CTOHACIVA_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOCOBRO: TIBStringField
      FieldName = 'CTOCOBRO'
      Origin = 'PARAMETROS.CTOCOBRO'
      Size = 3
    end
    object QParametrosCTOCOBRO_DS: TIBStringField
      FieldName = 'CTOCOBRO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosCTOPAGO: TIBStringField
      FieldName = 'CTOPAGO'
      Origin = 'PARAMETROS.CTOPAGO'
      Size = 3
    end
    object QParametrosCTOPAGO_DS: TIBStringField
      FieldName = 'CTOPAGO_DS'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Size = 30
    end
    object QParametrosSCTADESCUENTO: TIBStringField
      FieldName = 'SCTADESCUENTO'
      Origin = 'PARAMETROS.SCTADESCUENTO'
      Size = 10
    end
    object QParametrosCTODESCUENTO: TIBStringField
      FieldName = 'CTODESCUENTO'
      Origin = 'PARAMETROS.CTODESCUENTO'
      Size = 3
    end
    object QParametrosCTONOME: TIBStringField
      FieldName = 'CTONOME'
      Origin = 'PARAMETROS.CTONOME'
      Size = 3
    end
    object QParametrosCTONOMT: TIBStringField
      FieldName = 'CTONOMT'
      Origin = 'PARAMETROS.CTONOMT'
      Size = 3
    end
    object QParametrosSCTANOMSUELDO: TIBStringField
      FieldName = 'SCTANOMSUELDO'
      Origin = 'PARAMETROS.SCTANOMSUELDO'
      Size = 10
    end
    object QParametrosSCTANOMIRPF: TIBStringField
      FieldName = 'SCTANOMIRPF'
      Origin = 'PARAMETROS.SCTANOMIRPF'
      Size = 10
    end
    object QParametrosSCTANOMPAGO: TIBStringField
      FieldName = 'SCTANOMPAGO'
      Origin = 'PARAMETROS.SCTANOMPAGO'
      Size = 10
    end
    object QParametrosSCTANOMSSE: TIBStringField
      FieldName = 'SCTANOMSSE'
      Origin = 'PARAMETROS.SCTANOMSSE'
      Size = 10
    end
    object QParametrosSCTANOMSST: TIBStringField
      FieldName = 'SCTANOMSST'
      Origin = 'PARAMETROS.SCTANOMSST'
      Size = 10
    end
    object QParametrosSCTANOMCARGO: TIBStringField
      FieldName = 'SCTANOMCARGO'
      Origin = 'PARAMETROS.SCTANOMCARGO'
      Size = 10
    end
    object QParametrosTANTORETPROF: TFloatField
      FieldName = 'TANTORETPROF'
      Origin = 'PARAMETROS.TANTORETPROF'
    end
    object QParametrosTANTORETARRE: TFloatField
      FieldName = 'TANTORETARRE'
      Origin = 'PARAMETROS.TANTORETARRE'
    end
    object QParametrosTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PARAMETROS.TELEFONO'
      Size = 16
    end
    object QParametrosFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PARAMETROS.FAX'
      Size = 16
    end
    object QParametrosDOCIMPRIMIR: TIBStringField
      FieldName = 'DOCIMPRIMIR'
      Origin = 'PARAMETROS.DOCIMPRIMIR'
      FixedChar = True
      Size = 1
    end
    object QParametrosSIGLAVIA: TIBStringField
      FieldName = 'SIGLAVIA'
      Origin = 'PARAMETROS.SIGLAVIA'
      FixedChar = True
      Size = 2
    end
    object QParametrosNUMEROCALLE: TIBStringField
      FieldName = 'NUMEROCALLE'
      Origin = 'PARAMETROS.NUMEROCALLE'
      FixedChar = True
      Size = 4
    end
    object QParametrosESCALERA: TIBStringField
      FieldName = 'ESCALERA'
      Origin = 'PARAMETROS.ESCALERA'
      FixedChar = True
      Size = 2
    end
    object QParametrosPISO: TIBStringField
      FieldName = 'PISO'
      Origin = 'PARAMETROS.PISO'
      FixedChar = True
      Size = 2
    end
    object QParametrosPUERTA: TIBStringField
      FieldName = 'PUERTA'
      Origin = 'PARAMETROS.PUERTA'
      FixedChar = True
      Size = 2
    end
    object QParametrosCCC: TIBStringField
      FieldName = 'CCC'
      Origin = 'PARAMETROS.CCC'
      Size = 23
    end
    object QParametrosCODADMON: TIBStringField
      FieldName = 'CODADMON'
      Origin = 'PARAMETROS.CODADMON'
      FixedChar = True
      Size = 5
    end
    object QParametrosGESTIONA_CARTERA_EFECTOS: TIBStringField
      FieldName = 'GESTIONA_CARTERA_EFECTOS'
      Origin = 'PARAMETROS.GESTIONA_CARTERA_EFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosFILTRO_ASIENTOS_INICIO: TIBStringField
      FieldName = 'FILTRO_ASIENTOS_INICIO'
      Origin = 'PARAMETROS.FILTRO_ASIENTOS_INICIO'
      FixedChar = True
      Size = 1
    end
    object QParametrosINCLUIR_ABREV: TIBStringField
      FieldName = 'INCLUIR_ABREV'
      Origin = 'PARAMETROS.INCLUIR_ABREV'
      FixedChar = True
      Size = 1
    end
    object QParametrosASIENTOS_INICIO_INTERVALO_BQDA: TSmallintField
      FieldName = 'ASIENTOS_INICIO_INTERVALO_BQDA'
      Origin = 'PARAMETROS.ASIENTOS_INICIO_INTERVALO_BQDA'
    end
    object QParametrosASIENTOS_FIN_INTERVALO_BQDA: TSmallintField
      FieldName = 'ASIENTOS_FIN_INTERVALO_BQDA'
      Origin = 'PARAMETROS.ASIENTOS_FIN_INTERVALO_BQDA'
    end
    object QParametrosMOSTRAR_FILTRO_MAYOR: TIBStringField
      FieldName = 'MOSTRAR_FILTRO_MAYOR'
      Origin = 'PARAMETROS.MOSTRAR_FILTRO_MAYOR'
      FixedChar = True
      Size = 1
    end
    object QParametrosASIENTO_INICIO_INTERVALO_FILTRO: TSmallintField
      FieldName = 'ASIENTO_INICIO_INTERVALO_FILTRO'
      Origin = 'PARAMETROS.ASIENTO_INICIO_INTERVALO_FILTRO'
    end
    object QParametrosASIENTO_FIN_INTERVALO_FILTRO: TSmallintField
      FieldName = 'ASIENTO_FIN_INTERVALO_FILTRO'
      Origin = 'PARAMETROS.ASIENTO_FIN_INTERVALO_FILTRO'
    end
    object QParametrosASIENTO_NOMINA_INDIVIDUAL: TIBStringField
      FieldName = 'ASIENTO_NOMINA_INDIVIDUAL'
      Origin = 'PARAMETROS.ASIENTO_NOMINA_INDIVIDUAL'
      FixedChar = True
      Size = 1
    end
    object QParametrosBUSQUEDA_SUBCTAS: TIBStringField
      FieldName = 'BUSQUEDA_SUBCTAS'
      Origin = 'PARAMETROS.BUSQUEDA_SUBCTAS'
      FixedChar = True
      Size = 1
    end
    object QParametrosSCTAOTRASREMUN: TIBStringField
      FieldName = 'SCTAOTRASREMUN'
      Origin = 'PARAMETROS.SCTAOTRASREMUN'
      Size = 10
    end
    object QParametrosDESCPROV_CARTERAEFECTOS: TIBStringField
      FieldName = 'DESCPROV_CARTERAEFECTOS'
      Origin = 'PARAMETROS.DESCPROV_CARTERAEFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosDESCCLI_CARTERAEFECTOS: TIBStringField
      FieldName = 'DESCCLI_CARTERAEFECTOS'
      Origin = 'PARAMETROS.DESCCLI_CARTERAEFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosTIPOEMPRESA: TIBStringField
      FieldName = 'TIPOEMPRESA'
      Origin = 'PARAMETROS.TIPOEMPRESA'
      FixedChar = True
      Size = 1
    end
    object QParametrosFILTROSUBCTAS: TIBStringField
      FieldName = 'FILTROSUBCTAS'
      Origin = 'PARAMETROS.FILTROSUBCTAS'
      FixedChar = True
      Size = 3
    end
    object QParametrosOFFICE2003: TIBStringField
      FieldName = 'OFFICE2003'
      Origin = 'PARAMETROS.OFFICE2003'
      FixedChar = True
      Size = 1
    end
    object QParametrosTRATASERIE: TIBStringField
      FieldName = 'TRATASERIE'
      Origin = 'PARAMETROS.TRATASERIE'
      FixedChar = True
      Size = 1
    end
    object QParametrosACTCOMENTARIO: TIBStringField
      FieldName = 'ACTCOMENTARIO'
      Origin = 'PARAMETROS.ACTCOMENTARIO'
      FixedChar = True
      Size = 1
    end
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
