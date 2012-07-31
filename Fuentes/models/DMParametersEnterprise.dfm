object DataModuleParametersEnterprise: TDataModuleParametersEnterprise
  OldCreateOrder = False
  Left = 975
  Top = 179
  Height = 283
  Width = 400
  object NoUse: TCRSQLConnection
    ConnectionName = 'SQLServerConnection'
    DriverName = 'SQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=.'
      'DataBase=AVEZZO'
      'DriverName=SQLServer'
      'User_Name=sa'
      'Password=masterkey'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'oledb'
    Connected = True
    Left = 47
    Top = 31
  end
  object QParametros: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT PRM.ID_PARAMETROS                          ,'#13#10'       PRM.' +
      'LONGITUD_SUBCUENTAS                    ,'#13#10'       PRM.FECHA_INICI' +
      'O_APLICACION                ,'#13#10'       PRM.FECHA_INICIO_EJERCICIO' +
      '                 ,'#13#10'       PRM.FECHA_FIN_EJERCICIO              ' +
      '      ,'#13#10'       PRM.CTO_REGULARIZACION                     ,'#13#10'  ' +
      '     PRM.SUBCUENTA_CIERRE                       ,'#13#10'       PRM.MO' +
      'NEDA                                 ,'#13#10'       PRM.NOMBREFISCAL ' +
      '                          ,'#13#10'       PRM.DIRECCION               ' +
      '               ,'#13#10'       PRM.DIRECCION1                         ' +
      '    ,'#13#10'       PRM.POBLACION                              ,'#13#10'    ' +
      '   PRM.CODPOSTAL                              ,'#13#10'       PRM.PROV' +
      'INCIA                              ,'#13#10'       PRM.NIF            ' +
      '                        ,'#13#10'       PRM.CONTACTO                  ' +
      '             ,'#13#10'       PRM.DOCCLIENTE                           ' +
      '  ,'#13#10'       PRM.DOCPROVEEDOR                           ,'#13#10'      ' +
      ' PRM.DOC347                                 ,'#13#10'       PRM.FECHAB' +
      'LOQUEO                           ,'#13#10'       PRM.CTO_APERTURA     ' +
      '                      ,'#13#10'       PRM.CTO_REGULARIZACION_ESP      ' +
      '           ,'#13#10'       PRM.FECHAAMORTIZACION                      ' +
      ','#13#10'       PRM.RECARGO                                ,'#13#10'       P' +
      'RM.CTO_APERTURA_ESP                       ,'#13#10'       PRM.SCTAIVAN' +
      'ORMAL                          ,'#13#10'       S01.DESCRIPCION SCTAIVA' +
      'NORMAL_DS           ,'#13#10'       PRM.SCTAIVAREDUCIDO               ' +
      '         ,'#13#10'       S02.DESCRIPCION SCTAIVAREDUCIDO_DS         ,'#13 +
      #10'       PRM.SCTAIVASUPER                           ,'#13#10'       S03' +
      '.DESCRIPCION SCTAIVASUPER_DS            ,'#13#10'       PRM.SCTAIVAEXE' +
      'NTO                          ,'#13#10'       S04.DESCRIPCION SCTAIVAEX' +
      'ENTO_DS           ,'#13#10'       PRM.SCTAIVAINTRADEDUCIBLE           ' +
      '       ,'#13#10'       S05.DESCRIPCION SCTAIVAINTRADEDUCIBLE_DS   ,'#13#10' ' +
      '      PRM.SCTAIVAINTRA                           ,'#13#10'       S06.D' +
      'ESCRIPCION SCTAIVAINTRA_DS            ,'#13#10'       PRM.SCTAVENTAS  ' +
      '                           ,'#13#10'       S07.DESCRIPCION SCTAVENTAS_' +
      'DS              ,'#13#10'       PRM.SCTADEVOLUCION                    ' +
      '     ,'#13#10'       S08.DESCRIPCION SCTADEVOLUCION_DS          ,'#13#10'   ' +
      '    PRM.SCTARECNORMAL                          ,'#13#10'       S09.DES' +
      'CRIPCION SCTARECNORMAL_DS           ,'#13#10'       PRM.SCTARECREDUCID' +
      'O                        ,'#13#10'       S10.DESCRIPCION SCTARECREDUCI' +
      'DO_DS         ,'#13#10'       PRM.SCTARECSUPER                        ' +
      '   ,'#13#10'       S11.DESCRIPCION SCTARECSUPER_DS            ,'#13#10'     ' +
      '  PRM.VGENERICA                              ,'#13#10'       S12.DESCR' +
      'IPCION VGENERICA_DS               ,'#13#10'       PRM.SUBCAJA         ' +
      '                       ,'#13#10'       S13.DESCRIPCION SUBCAJA_DS     ' +
      '            ,'#13#10'       PRM.SCTAIVAEXENTOCEE                      ' +
      ' ,'#13#10'       S14.DESCRIPCION SCTAIVAEXENTOCEE_DS        ,'#13#10'       ' +
      'PRM.SCTAINTERESES                          ,'#13#10'       S15.DESCRIP' +
      'CION SCTAINTERESES_DS           ,'#13#10'       PRM.SCTAEXPORTACIONES ' +
      '                     ,'#13#10'       S16.DESCRIPCION SCTAEXPORTACIONES' +
      '_DS       ,'#13#10'       PRM.SCTAIVACNORMAL                         ,' +
      #13#10'       S17.DESCRIPCION SCTAIVACNORMAL_DS          ,'#13#10'       PR' +
      'M.SCTAIVACREDUCIDO                       ,'#13#10'       S18.DESCRIPCI' +
      'ON SCTAIVACREDUCIDO_DS        ,'#13#10'       PRM.SCTAIVACSUPER       ' +
      '                   ,'#13#10'       S19.DESCRIPCION SCTAIVACSUPER_DS   ' +
      '        ,'#13#10'       PRM.SCTAIVACEXENTO                         ,'#13#10 +
      '       S20.DESCRIPCION SCTAIVACEXENTO_DS          ,'#13#10'       PRM.' +
      'SCTACOMPRAS                            ,'#13#10'       S21.DESCRIPCION' +
      ' SCTACOMPRAS_DS             ,'#13#10'       PRM.SCTAIVACINTRADEDUCIBLE' +
      '                 ,'#13#10'       S22.DESCRIPCION SCTAIVACINTRADEDUCIBL' +
      'E_DS  ,'#13#10'       PRM.SCTAIVACINTRAREPERCUTIDO               ,'#13#10'  ' +
      '     S23.DESCRIPCION SCTAIVACINTRAREPERCUTIDO_DS,'#13#10'       PRM.VG' +
      'ENERICAC                             ,'#13#10'       S24.DESCRIPCION V' +
      'GENERICAC_DS              ,'#13#10'       PRM.SCTAEFECTOSCOMERCIALES  ' +
      '               ,'#13#10'       S25.DESCRIPCION SCTAEFECTOSCOMERCIALES_' +
      'DS  ,'#13#10'       PRM.SCTAEFECTDESCONTADOS                   ,'#13#10'    ' +
      '   S26.DESCRIPCION SCTAEFECTDESCONTADOS_DS    ,'#13#10'       PRM.SCTA' +
      'DEUDASDESCUENTOS                   ,'#13#10'       S27.DESCRIPCION SCT' +
      'ADEUDASDESCUENTOS_DS    ,'#13#10'       PRM.SCTAREMESAEFECTOS         ' +
      '             ,'#13#10'       S28.DESCRIPCION SCTAREMESAEFECTOS_DS     ' +
      '  ,'#13#10'       PRM.SCTADTOPPV                             ,'#13#10'      ' +
      ' S29.DESCRIPCION SCTADTOPPV_DS              ,'#13#10'       PRM.SCTADT' +
      'OPPC                             ,'#13#10'       S30.DESCRIPCION SCTAD' +
      'TOPPC_DS              ,'#13#10'       PRM.SCTARETPROF                 ' +
      '           ,'#13#10'       S31.DESCRIPCION SCTARETPROF_DS             ' +
      ','#13#10'       PRM.SCTARETARRE                            ,'#13#10'       S' +
      '32.DESCRIPCION SCTARETARRE_DS             ,'#13#10'       PRM.SCTAHACI' +
      'VA                             ,'#13#10'       S33.DESCRIPCION SCTAHAC' +
      'IVA_DS              ,'#13#10'       PRM.SCTAGENINTRACOM               ' +
      '         ,'#13#10'       S34.DESCRIPCION SCTAGENINTRACOM_DS         ,'#13 +
      #10'       PRM.SCTABANCO                              ,'#13#10'       S35' +
      '.DESCRIPCION SCTABANCO_DS               ,'#13#10'       PRM.CTOIVANORM' +
      'AL                           ,'#13#10'       C01.DESCRIPCION CTOIVANOR' +
      'MAL_DS            ,'#13#10'       PRM.CTOIVAREDUCIDO                  ' +
      '       ,'#13#10'       C02.DESCRIPCION CTOIVAREDUCIDO_DS          ,'#13#10' ' +
      '      PRM.CTOIVASUPER                            ,'#13#10'       C03.D' +
      'ESCRIPCION CTOIVASUPER_DS             ,'#13#10'       PRM.CTOIVAEXENTO' +
      '                           ,'#13#10'       C04.DESCRIPCION CTOIVAEXENT' +
      'O_DS            ,'#13#10'       PRM.CTOIVAINTRA                       ' +
      '     ,'#13#10'       C05.DESCRIPCION CTOIVAINTRA_DS             ,'#13#10'   ' +
      '    PRM.CTOVENTAS                              ,'#13#10'       C06.DES' +
      'CRIPCION CTOVENTAS_DS               ,'#13#10'       PRM.CTODEVOLUCION ' +
      '                         ,'#13#10'       C07.DESCRIPCION CTODEVOLUCION' +
      '_DS           ,'#13#10'       PRM.CTOCLIENTES                         ' +
      '   ,'#13#10'       C08.DESCRIPCION CTOCLIENTES_DS             ,'#13#10'     ' +
      '  PRM.CTORECNORMAL                           ,'#13#10'       C09.DESCR' +
      'IPCION CTORECNORMAL_DS            ,'#13#10'       PRM.CTORECREDUCIDO  ' +
      '                       ,'#13#10'       C10.DESCRIPCION CTORECREDUCIDO_' +
      'DS          ,'#13#10'       PRM.CTORECSUPER                           ' +
      ' ,'#13#10'       C11.DESCRIPCION CTORECSUPER_DS             ,'#13#10'       ' +
      'PRM.CTOCOBROF                              ,'#13#10'       C12.DESCRIP' +
      'CION CTOCOBROF_DS               ,'#13#10'       PRM.CTORECIBOVENTAS   ' +
      '                     ,'#13#10'       C13.DESCRIPCION CTORECIBOVENTAS_D' +
      'S         ,'#13#10'       PRM.CTOIVACNORMAL                          ,' +
      #13#10'       C14.DESCRIPCION CTOIVACNORMAL_DS           ,'#13#10'       PR' +
      'M.CTOIVACREDUCIDO                        ,'#13#10'       C15.DESCRIPCI' +
      'ON CTOIVACREDUCIDO_DS         ,'#13#10'       PRM.CTOIVACSUPER        ' +
      '                   ,'#13#10'       C16.DESCRIPCION CTOIVACSUPER_DS    ' +
      '        ,'#13#10'       PRM.CTOIVACEXENTO                          ,'#13#10 +
      '       C17.DESCRIPCION CTOIVACEXENTO_DS           ,'#13#10'       PRM.' +
      'CTOCOMPRAS                             ,'#13#10'       C18.DESCRIPCION' +
      ' CTOCOMPRAS_DS              ,'#13#10'       PRM.CTOPROVEEDORES        ' +
      '                 ,'#13#10'       C19.DESCRIPCION CTOPROVEEDORES_DS    ' +
      '      ,'#13#10'       PRM.CTOPROVINTRA                           ,'#13#10'  ' +
      '     C20.DESCRIPCION CTOPROVINTRA_DS            ,'#13#10'       PRM.CT' +
      'OPAGOF                               ,'#13#10'       C21.DESCRIPCION C' +
      'TOPAGOF_DS                ,'#13#10'       PRM.CTOEFECTOSCOMERCIALES   ' +
      '               ,'#13#10'       C22.DESCRIPCION CTOEFECTOSCOMERCIALES_D' +
      'S   ,'#13#10'       PRM.CTODEUDASDESCUENTOS                    ,'#13#10'    ' +
      '   C23.DESCRIPCION CTODEUDASDESCUENTOS_DS     ,'#13#10'       PRM.CTOR' +
      'EMESAEFECTOS                       ,'#13#10'       C24.DESCRIPCION CTO' +
      'REMESAEFECTOS_DS        ,'#13#10'       PRM.CTODTOPPV                 ' +
      '             ,'#13#10'       C25.DESCRIPCION CTODTOPPV_DS             ' +
      '  ,'#13#10'       PRM.CTODTOPPC                              ,'#13#10'      ' +
      ' C26.DESCRIPCION CTODTOPPC_DS               ,'#13#10'       PRM.CTORET' +
      'PROF                             ,'#13#10'       C27.DESCRIPCION CTORE' +
      'TPROF_DS              ,'#13#10'       PRM.CTORETARRE                  ' +
      '           ,'#13#10'       C28.DESCRIPCION CTORETARRE_DS              ' +
      ','#13#10'       PRM.CTOHACIVA                              ,'#13#10'       C' +
      '29.DESCRIPCION CTOHACIVA_DS               ,'#13#10'       PRM.CTOCOBRO' +
      '                               ,'#13#10'       C30.DESCRIPCION CTOCOBR' +
      'O_DS                ,'#13#10'       PRM.CTOPAGO                       ' +
      '         ,'#13#10'       C31.DESCRIPCION CTOPAGO_DS                 ,'#13 +
      #10'       PRM.SCTADESCUENTO                          ,'#13#10'       PRM' +
      '.CTODESCUENTO                           ,'#13#10'       PRM.CTONOME   ' +
      '                             ,'#13#10'       PRM.CTONOMT              ' +
      '                  ,'#13#10'       PRM.SCTANOMSUELDO                   ' +
      '       ,'#13#10'       PRM.SCTANOMIRPF                            ,'#13#10' ' +
      '      PRM.SCTANOMPAGO                            ,'#13#10'       PRM.S' +
      'CTANOMSSE                             ,'#13#10'       PRM.SCTANOMSST  ' +
      '                           ,'#13#10'       PRM.SCTANOMCARGO           ' +
      '                ,'#13#10'       PRM.TANTORETPROF                      ' +
      '     ,'#13#10'       PRM.TANTORETARRE                           ,'#13#10'   ' +
      '    PRM.TELEFONO                               ,'#13#10'       PRM.FAX' +
      '                                    ,'#13#10'       PRM.DOCIMPRIMIR   ' +
      '                         ,'#13#10'       PRM.SIGLAVIA                 ' +
      '              ,'#13#10'       PRM.NUMEROCALLE                         ' +
      '   ,'#13#10'       PRM.ESCALERA                               ,'#13#10'     ' +
      '  PRM.PISO                                   ,'#13#10'       PRM.PUERT' +
      'A                                 ,'#13#10'       PRM.CCC             ' +
      '                       ,'#13#10'       PRM.CODADMON                   ' +
      '            ,'#13#10'       PRM.GESTIONA_CARTERA_EFECTOS              ' +
      ' ,'#13#10'       PRM.FILTRO_ASIENTOS_INICIO                 ,'#13#10'       ' +
      'PRM.INCLUIR_ABREV                          ,'#13#10'       PRM.ASIENTO' +
      'S_INICIO_INTERVALO_BQDA         ,'#13#10'       PRM.ASIENTOS_FIN_INTER' +
      'VALO_BQDA            ,'#13#10'       PRM.MOSTRAR_FILTRO_MAYOR         ' +
      '          ,'#13#10'       PRM.ASIENTO_INICIO_INTERVALO_FILTRO        ,' +
      #13#10'       PRM.ASIENTO_FIN_INTERVALO_FILTRO           ,'#13#10'       PR' +
      'M.ASIENTO_NOMINA_INDIVIDUAL              ,'#13#10'       PRM.BUSQUEDA_' +
      'SUBCTAS                       ,'#13#10'       PRM.SCTAOTRASREMUN      ' +
      '                   ,'#13#10'       PRM.DESCPROV_CARTERAEFECTOS        ' +
      '        ,'#13#10'       PRM.DESCCLI_CARTERAEFECTOS                 ,'#13#10 +
      '       PRM.TIPOEMPRESA                            ,'#13#10'       PRM.' +
      'FILTROSUBCTAS                          ,'#13#10'       PRM.OFFICE2003 ' +
      '                            ,'#13#10'       PRM.TRATASERIE            ' +
      '                 ,'#13#10'       PRM.ACTCOMENTARIO'#13#10'FROM PARAMETROS PR' +
      'M'#13#10'LEFT JOIN SUBCTAS S01 ON S01.SUBCUENTA = PRM.SCTAIVANORMAL'#13#10'L' +
      'EFT JOIN SUBCTAS S02 ON S02.SUBCUENTA = PRM.SCTAIVAREDUCIDO'#13#10'LEF' +
      'T JOIN SUBCTAS S03 ON S03.SUBCUENTA = PRM.SCTAIVASUPER'#13#10'LEFT JOI' +
      'N SUBCTAS S04 ON S04.SUBCUENTA = PRM.SCTAIVAEXENTO'#13#10'LEFT JOIN SU' +
      'BCTAS S05 ON S05.SUBCUENTA = PRM.SCTAIVAINTRADEDUCIBLE'#13#10'LEFT JOI' +
      'N SUBCTAS S06 ON S06.SUBCUENTA = PRM.SCTAIVAINTRA'#13#10'LEFT JOIN SUB' +
      'CTAS S07 ON S07.SUBCUENTA = PRM.SCTAVENTAS'#13#10'LEFT JOIN SUBCTAS S0' +
      '8 ON S08.SUBCUENTA = PRM.SCTADEVOLUCION'#13#10'LEFT JOIN SUBCTAS S09 O' +
      'N S09.SUBCUENTA = PRM.SCTARECNORMAL'#13#10'LEFT JOIN SUBCTAS S10 ON S1' +
      '0.SUBCUENTA = PRM.SCTARECREDUCIDO'#13#10'LEFT JOIN SUBCTAS S11 ON S11.' +
      'SUBCUENTA = PRM.SCTARECSUPER'#13#10'LEFT JOIN SUBCTAS S12 ON S12.SUBCU' +
      'ENTA = PRM.VGENERICA'#13#10'LEFT JOIN SUBCTAS S13 ON S13.SUBCUENTA = P' +
      'RM.SUBCAJA'#13#10'LEFT JOIN SUBCTAS S14 ON S14.SUBCUENTA = PRM.SCTAIVA' +
      'EXENTOCEE'#13#10'LEFT JOIN SUBCTAS S15 ON S15.SUBCUENTA = PRM.SCTAINTE' +
      'RESES'#13#10'LEFT JOIN SUBCTAS S16 ON S16.SUBCUENTA = PRM.SCTAEXPORTAC' +
      'IONES'#13#10'LEFT JOIN SUBCTAS S17 ON S17.SUBCUENTA = PRM.SCTAIVACNORM' +
      'AL'#13#10'LEFT JOIN SUBCTAS S18 ON S18.SUBCUENTA = PRM.SCTAIVACREDUCID' +
      'O'#13#10'LEFT JOIN SUBCTAS S19 ON S19.SUBCUENTA = PRM.SCTAIVACSUPER'#13#10'L' +
      'EFT JOIN SUBCTAS S20 ON S20.SUBCUENTA = PRM.SCTAIVACEXENTO'#13#10'LEFT' +
      ' JOIN SUBCTAS S21 ON S21.SUBCUENTA = PRM.SCTACOMPRAS'#13#10'LEFT JOIN ' +
      'SUBCTAS S22 ON S22.SUBCUENTA = PRM.SCTAIVACINTRADEDUCIBLE'#13#10'LEFT ' +
      'JOIN SUBCTAS S23 ON S23.SUBCUENTA = PRM.SCTAIVACINTRAREPERCUTIDO' +
      #13#10'LEFT JOIN SUBCTAS S24 ON S24.SUBCUENTA = PRM.VGENERICAC'#13#10'LEFT ' +
      'JOIN SUBCTAS S25 ON S25.SUBCUENTA = PRM.SCTAEFECTOSCOMERCIALES'#13#10 +
      'LEFT JOIN SUBCTAS S26 ON S26.SUBCUENTA = PRM.SCTAEFECTDESCONTADO' +
      'S'#13#10'LEFT JOIN SUBCTAS S27 ON S27.SUBCUENTA = PRM.SCTADEUDASDESCUE' +
      'NTOS'#13#10'LEFT JOIN SUBCTAS S28 ON S28.SUBCUENTA = PRM.SCTAREMESAEFE' +
      'CTOS'#13#10'LEFT JOIN SUBCTAS S29 ON S29.SUBCUENTA = PRM.SCTADTOPPV'#13#10'L' +
      'EFT JOIN SUBCTAS S30 ON S30.SUBCUENTA = PRM.SCTADTOPPC'#13#10'LEFT JOI' +
      'N SUBCTAS S31 ON S31.SUBCUENTA = PRM.SCTARETPROF'#13#10'LEFT JOIN SUBC' +
      'TAS S32 ON S32.SUBCUENTA = PRM.SCTARETARRE'#13#10'LEFT JOIN SUBCTAS S3' +
      '3 ON S33.SUBCUENTA = PRM.SCTAHACIVA'#13#10'LEFT JOIN SUBCTAS S34 ON S3' +
      '4.SUBCUENTA = PRM.SCTAGENINTRACOM'#13#10'LEFT JOIN SUBCTAS S35 ON S35.' +
      'SUBCUENTA = PRM.SCTABANCO'#13#10'LEFT JOIN CONCEPTOS C01 ON C01.ID_CON' +
      'CEPTOS = PRM.CTOIVANORMAL'#13#10'LEFT JOIN CONCEPTOS C02 ON C02.ID_CON' +
      'CEPTOS = PRM.CTOIVAREDUCIDO'#13#10'LEFT JOIN CONCEPTOS C03 ON C03.ID_C' +
      'ONCEPTOS = PRM.CTOIVASUPER'#13#10'LEFT JOIN CONCEPTOS C04 ON C04.ID_CO' +
      'NCEPTOS = PRM.CTOIVAEXENTO'#13#10'LEFT JOIN CONCEPTOS C05 ON C05.ID_CO' +
      'NCEPTOS = PRM.CTOIVAINTRA'#13#10'LEFT JOIN CONCEPTOS C06 ON C06.ID_CON' +
      'CEPTOS = PRM.CTOVENTAS'#13#10'LEFT JOIN CONCEPTOS C07 ON C07.ID_CONCEP' +
      'TOS = PRM.CTODEVOLUCION'#13#10'LEFT JOIN CONCEPTOS C08 ON C08.ID_CONCE' +
      'PTOS = PRM.CTOCLIENTES'#13#10'LEFT JOIN CONCEPTOS C09 ON C09.ID_CONCEP' +
      'TOS = PRM.CTORECNORMAL'#13#10'LEFT JOIN CONCEPTOS C10 ON C10.ID_CONCEP' +
      'TOS = PRM.CTORECREDUCIDO'#13#10'LEFT JOIN CONCEPTOS C11 ON C11.ID_CONC' +
      'EPTOS = PRM.CTORECSUPER'#13#10'LEFT JOIN CONCEPTOS C12 ON C12.ID_CONCE' +
      'PTOS = PRM.CTOCOBROF'#13#10'LEFT JOIN CONCEPTOS C13 ON C13.ID_CONCEPTO' +
      'S = PRM.CTORECIBOVENTAS'#13#10'LEFT JOIN CONCEPTOS C14 ON C14.ID_CONCE' +
      'PTOS = PRM.CTOIVACNORMAL'#13#10'LEFT JOIN CONCEPTOS C15 ON C15.ID_CONC' +
      'EPTOS = PRM.CTOIVACREDUCIDO'#13#10'LEFT JOIN CONCEPTOS C16 ON C16.ID_C' +
      'ONCEPTOS = PRM.CTOIVACSUPER'#13#10'LEFT JOIN CONCEPTOS C17 ON C17.ID_C' +
      'ONCEPTOS = PRM.CTOIVACEXENTO'#13#10'LEFT JOIN CONCEPTOS C18 ON C18.ID_' +
      'CONCEPTOS = PRM.CTOCOMPRAS'#13#10'LEFT JOIN CONCEPTOS C19 ON C19.ID_CO' +
      'NCEPTOS = PRM.CTOPROVEEDORES'#13#10'LEFT JOIN CONCEPTOS C20 ON C20.ID_' +
      'CONCEPTOS = PRM.CTOPROVINTRA'#13#10'LEFT JOIN CONCEPTOS C21 ON C21.ID_' +
      'CONCEPTOS = PRM.CTOPAGOF'#13#10'LEFT JOIN CONCEPTOS C22 ON C22.ID_CONC' +
      'EPTOS = PRM.CTOEFECTOSCOMERCIALES'#13#10'LEFT JOIN CONCEPTOS C23 ON C2' +
      '3.ID_CONCEPTOS = PRM.CTODEUDASDESCUENTOS'#13#10'LEFT JOIN CONCEPTOS C2' +
      '4 ON C24.ID_CONCEPTOS = PRM.CTOREMESAEFECTOS'#13#10'LEFT JOIN CONCEPTO' +
      'S C25 ON C25.ID_CONCEPTOS = PRM.CTODTOPPV'#13#10'LEFT JOIN CONCEPTOS C' +
      '26 ON C26.ID_CONCEPTOS = PRM.CTODTOPPC'#13#10'LEFT JOIN CONCEPTOS C27 ' +
      'ON C27.ID_CONCEPTOS = PRM.CTORETPROF'#13#10'LEFT JOIN CONCEPTOS C28 ON' +
      ' C28.ID_CONCEPTOS = PRM.CTORETARRE'#13#10'LEFT JOIN CONCEPTOS C29 ON C' +
      '29.ID_CONCEPTOS = PRM.CTOHACIVA'#13#10'LEFT JOIN CONCEPTOS C30 ON C30.' +
      'ID_CONCEPTOS = PRM.CTOCOBRO'#13#10'LEFT JOIN CONCEPTOS C31 ON C31.ID_C' +
      'ONCEPTOS = PRM.CTOPAGO'#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 176
    Top = 40
    object QParametrosID_PARAMETROS: TIntegerField
      FieldName = 'ID_PARAMETROS'
    end
    object QParametrosLONGITUD_SUBCUENTAS: TIntegerField
      FieldName = 'LONGITUD_SUBCUENTAS'
    end
    object QParametrosFECHA_INICIO_APLICACION: TSQLTimeStampField
      FieldName = 'FECHA_INICIO_APLICACION'
    end
    object QParametrosFECHA_INICIO_EJERCICIO: TSQLTimeStampField
      FieldName = 'FECHA_INICIO_EJERCICIO'
    end
    object QParametrosFECHA_FIN_EJERCICIO: TSQLTimeStampField
      FieldName = 'FECHA_FIN_EJERCICIO'
    end
    object QParametrosCTO_REGULARIZACION: TStringField
      FieldName = 'CTO_REGULARIZACION'
      FixedChar = True
      Size = 3
    end
    object QParametrosSUBCUENTA_CIERRE: TStringField
      FieldName = 'SUBCUENTA_CIERRE'
      Size = 10
    end
    object QParametrosMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 1
    end
    object QParametrosNOMBREFISCAL: TStringField
      FieldName = 'NOMBREFISCAL'
      Size = 80
    end
    object QParametrosDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 40
    end
    object QParametrosDIRECCION1: TStringField
      FieldName = 'DIRECCION1'
      Size = 40
    end
    object QParametrosPOBLACION: TStringField
      FieldName = 'POBLACION'
      Size = 40
    end
    object QParametrosCODPOSTAL: TStringField
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object QParametrosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      FixedChar = True
      Size = 2
    end
    object QParametrosNIF: TStringField
      FieldName = 'NIF'
      Size = 15
    end
    object QParametrosCONTACTO: TStringField
      FieldName = 'CONTACTO'
      Size = 50
    end
    object QParametrosDOCCLIENTE: TStringField
      FieldName = 'DOCCLIENTE'
      Size = 100
    end
    object QParametrosDOCPROVEEDOR: TStringField
      FieldName = 'DOCPROVEEDOR'
      Size = 100
    end
    object QParametrosDOC347: TStringField
      FieldName = 'DOC347'
      Size = 100
    end
    object QParametrosFECHABLOQUEO: TSQLTimeStampField
      FieldName = 'FECHABLOQUEO'
    end
    object QParametrosCTO_APERTURA: TStringField
      FieldName = 'CTO_APERTURA'
      FixedChar = True
      Size = 3
    end
    object QParametrosCTO_REGULARIZACION_ESP: TStringField
      FieldName = 'CTO_REGULARIZACION_ESP'
      FixedChar = True
      Size = 3
    end
    object QParametrosFECHAAMORTIZACION: TSQLTimeStampField
      FieldName = 'FECHAAMORTIZACION'
    end
    object QParametrosRECARGO: TStringField
      FieldName = 'RECARGO'
      FixedChar = True
      Size = 1
    end
    object QParametrosCTO_APERTURA_ESP: TStringField
      FieldName = 'CTO_APERTURA_ESP'
      FixedChar = True
      Size = 3
    end
    object QParametrosSCTAIVANORMAL: TStringField
      FieldName = 'SCTAIVANORMAL'
      Size = 10
    end
    object QParametrosSCTAIVANORMAL_DS: TStringField
      FieldName = 'SCTAIVANORMAL_DS'
      Size = 80
    end
    object QParametrosSCTAIVAREDUCIDO: TStringField
      FieldName = 'SCTAIVAREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVAREDUCIDO_DS: TStringField
      FieldName = 'SCTAIVAREDUCIDO_DS'
      Size = 80
    end
    object QParametrosSCTAIVASUPER: TStringField
      FieldName = 'SCTAIVASUPER'
      Size = 10
    end
    object QParametrosSCTAIVASUPER_DS: TStringField
      FieldName = 'SCTAIVASUPER_DS'
      Size = 80
    end
    object QParametrosSCTAIVAEXENTO: TStringField
      FieldName = 'SCTAIVAEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTO_DS: TStringField
      FieldName = 'SCTAIVAEXENTO_DS'
      Size = 80
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE: TStringField
      FieldName = 'SCTAIVAINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE_DS: TStringField
      FieldName = 'SCTAIVAINTRADEDUCIBLE_DS'
      Size = 80
    end
    object QParametrosSCTAIVAINTRA: TStringField
      FieldName = 'SCTAIVAINTRA'
      Size = 10
    end
    object QParametrosSCTAIVAINTRA_DS: TStringField
      FieldName = 'SCTAIVAINTRA_DS'
      Size = 80
    end
    object QParametrosSCTAVENTAS: TStringField
      FieldName = 'SCTAVENTAS'
      Size = 10
    end
    object QParametrosSCTAVENTAS_DS: TStringField
      FieldName = 'SCTAVENTAS_DS'
      Size = 80
    end
    object QParametrosSCTADEVOLUCION: TStringField
      FieldName = 'SCTADEVOLUCION'
      Size = 10
    end
    object QParametrosSCTADEVOLUCION_DS: TStringField
      FieldName = 'SCTADEVOLUCION_DS'
      Size = 80
    end
    object QParametrosSCTARECNORMAL: TStringField
      FieldName = 'SCTARECNORMAL'
      Size = 10
    end
    object QParametrosSCTARECNORMAL_DS: TStringField
      FieldName = 'SCTARECNORMAL_DS'
      Size = 80
    end
    object QParametrosSCTARECREDUCIDO: TStringField
      FieldName = 'SCTARECREDUCIDO'
      Size = 10
    end
    object QParametrosSCTARECREDUCIDO_DS: TStringField
      FieldName = 'SCTARECREDUCIDO_DS'
      Size = 80
    end
    object QParametrosSCTARECSUPER: TStringField
      FieldName = 'SCTARECSUPER'
      Size = 10
    end
    object QParametrosSCTARECSUPER_DS: TStringField
      FieldName = 'SCTARECSUPER_DS'
      Size = 80
    end
    object QParametrosVGENERICA: TStringField
      FieldName = 'VGENERICA'
      Size = 10
    end
    object QParametrosVGENERICA_DS: TStringField
      FieldName = 'VGENERICA_DS'
      Size = 80
    end
    object QParametrosSUBCAJA: TStringField
      FieldName = 'SUBCAJA'
      Size = 10
    end
    object QParametrosSUBCAJA_DS: TStringField
      FieldName = 'SUBCAJA_DS'
      Size = 80
    end
    object QParametrosSCTAIVAEXENTOCEE: TStringField
      FieldName = 'SCTAIVAEXENTOCEE'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTOCEE_DS: TStringField
      FieldName = 'SCTAIVAEXENTOCEE_DS'
      Size = 80
    end
    object QParametrosSCTAINTERESES: TStringField
      FieldName = 'SCTAINTERESES'
      Size = 10
    end
    object QParametrosSCTAINTERESES_DS: TStringField
      FieldName = 'SCTAINTERESES_DS'
      Size = 80
    end
    object QParametrosSCTAEXPORTACIONES: TStringField
      FieldName = 'SCTAEXPORTACIONES'
      Size = 10
    end
    object QParametrosSCTAEXPORTACIONES_DS: TStringField
      FieldName = 'SCTAEXPORTACIONES_DS'
      Size = 80
    end
    object QParametrosSCTAIVACNORMAL: TStringField
      FieldName = 'SCTAIVACNORMAL'
      Size = 10
    end
    object QParametrosSCTAIVACNORMAL_DS: TStringField
      FieldName = 'SCTAIVACNORMAL_DS'
      Size = 80
    end
    object QParametrosSCTAIVACREDUCIDO: TStringField
      FieldName = 'SCTAIVACREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVACREDUCIDO_DS: TStringField
      FieldName = 'SCTAIVACREDUCIDO_DS'
      Size = 80
    end
    object QParametrosSCTAIVACSUPER: TStringField
      FieldName = 'SCTAIVACSUPER'
      Size = 10
    end
    object QParametrosSCTAIVACSUPER_DS: TStringField
      FieldName = 'SCTAIVACSUPER_DS'
      Size = 80
    end
    object QParametrosSCTAIVACEXENTO: TStringField
      FieldName = 'SCTAIVACEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVACEXENTO_DS: TStringField
      FieldName = 'SCTAIVACEXENTO_DS'
      Size = 80
    end
    object QParametrosSCTACOMPRAS: TStringField
      FieldName = 'SCTACOMPRAS'
      Size = 10
    end
    object QParametrosSCTACOMPRAS_DS: TStringField
      FieldName = 'SCTACOMPRAS_DS'
      Size = 80
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE: TStringField
      FieldName = 'SCTAIVACINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE_DS: TStringField
      FieldName = 'SCTAIVACINTRADEDUCIBLE_DS'
      Size = 80
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO: TStringField
      FieldName = 'SCTAIVACINTRAREPERCUTIDO'
      Size = 10
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO_DS: TStringField
      FieldName = 'SCTAIVACINTRAREPERCUTIDO_DS'
      Size = 80
    end
    object QParametrosVGENERICAC: TStringField
      FieldName = 'VGENERICAC'
      Size = 10
    end
    object QParametrosVGENERICAC_DS: TStringField
      FieldName = 'VGENERICAC_DS'
      Size = 80
    end
    object QParametrosSCTAEFECTOSCOMERCIALES: TStringField
      FieldName = 'SCTAEFECTOSCOMERCIALES'
      Size = 10
    end
    object QParametrosSCTAEFECTOSCOMERCIALES_DS: TStringField
      FieldName = 'SCTAEFECTOSCOMERCIALES_DS'
      Size = 80
    end
    object QParametrosSCTAEFECTDESCONTADOS: TStringField
      FieldName = 'SCTAEFECTDESCONTADOS'
      Size = 10
    end
    object QParametrosSCTAEFECTDESCONTADOS_DS: TStringField
      FieldName = 'SCTAEFECTDESCONTADOS_DS'
      Size = 80
    end
    object QParametrosSCTADEUDASDESCUENTOS: TStringField
      FieldName = 'SCTADEUDASDESCUENTOS'
      Size = 10
    end
    object QParametrosSCTADEUDASDESCUENTOS_DS: TStringField
      FieldName = 'SCTADEUDASDESCUENTOS_DS'
      Size = 80
    end
    object QParametrosSCTAREMESAEFECTOS: TStringField
      FieldName = 'SCTAREMESAEFECTOS'
      Size = 10
    end
    object QParametrosSCTAREMESAEFECTOS_DS: TStringField
      FieldName = 'SCTAREMESAEFECTOS_DS'
      Size = 80
    end
    object QParametrosSCTADTOPPV: TStringField
      FieldName = 'SCTADTOPPV'
      Size = 10
    end
    object QParametrosSCTADTOPPV_DS: TStringField
      FieldName = 'SCTADTOPPV_DS'
      Size = 80
    end
    object QParametrosSCTADTOPPC: TStringField
      FieldName = 'SCTADTOPPC'
      Size = 10
    end
    object QParametrosSCTADTOPPC_DS: TStringField
      FieldName = 'SCTADTOPPC_DS'
      Size = 80
    end
    object QParametrosSCTARETPROF: TStringField
      FieldName = 'SCTARETPROF'
      Size = 10
    end
    object QParametrosSCTARETPROF_DS: TStringField
      FieldName = 'SCTARETPROF_DS'
      Size = 80
    end
    object QParametrosSCTARETARRE: TStringField
      FieldName = 'SCTARETARRE'
      Size = 10
    end
    object QParametrosSCTARETARRE_DS: TStringField
      FieldName = 'SCTARETARRE_DS'
      Size = 80
    end
    object QParametrosSCTAHACIVA: TStringField
      FieldName = 'SCTAHACIVA'
      Size = 10
    end
    object QParametrosSCTAHACIVA_DS: TStringField
      FieldName = 'SCTAHACIVA_DS'
      Size = 80
    end
    object QParametrosSCTAGENINTRACOM: TStringField
      FieldName = 'SCTAGENINTRACOM'
      Size = 10
    end
    object QParametrosSCTAGENINTRACOM_DS: TStringField
      FieldName = 'SCTAGENINTRACOM_DS'
      Size = 80
    end
    object QParametrosSCTABANCO: TStringField
      FieldName = 'SCTABANCO'
      Size = 10
    end
    object QParametrosSCTABANCO_DS: TStringField
      FieldName = 'SCTABANCO_DS'
      Size = 80
    end
    object QParametrosCTOIVANORMAL: TStringField
      FieldName = 'CTOIVANORMAL'
      Size = 3
    end
    object QParametrosCTOIVANORMAL_DS: TStringField
      FieldName = 'CTOIVANORMAL_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVAREDUCIDO: TStringField
      FieldName = 'CTOIVAREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVAREDUCIDO_DS: TStringField
      FieldName = 'CTOIVAREDUCIDO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVASUPER: TStringField
      FieldName = 'CTOIVASUPER'
      Size = 3
    end
    object QParametrosCTOIVASUPER_DS: TStringField
      FieldName = 'CTOIVASUPER_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVAEXENTO: TStringField
      FieldName = 'CTOIVAEXENTO'
      Size = 3
    end
    object QParametrosCTOIVAEXENTO_DS: TStringField
      FieldName = 'CTOIVAEXENTO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVAINTRA: TStringField
      FieldName = 'CTOIVAINTRA'
      Size = 3
    end
    object QParametrosCTOIVAINTRA_DS: TStringField
      FieldName = 'CTOIVAINTRA_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOVENTAS: TStringField
      FieldName = 'CTOVENTAS'
      Size = 3
    end
    object QParametrosCTOVENTAS_DS: TStringField
      FieldName = 'CTOVENTAS_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTODEVOLUCION: TStringField
      FieldName = 'CTODEVOLUCION'
      Size = 3
    end
    object QParametrosCTODEVOLUCION_DS: TStringField
      FieldName = 'CTODEVOLUCION_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOCLIENTES: TStringField
      FieldName = 'CTOCLIENTES'
      Size = 3
    end
    object QParametrosCTOCLIENTES_DS: TStringField
      FieldName = 'CTOCLIENTES_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORECNORMAL: TStringField
      FieldName = 'CTORECNORMAL'
      Size = 3
    end
    object QParametrosCTORECNORMAL_DS: TStringField
      FieldName = 'CTORECNORMAL_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORECREDUCIDO: TStringField
      FieldName = 'CTORECREDUCIDO'
      Size = 3
    end
    object QParametrosCTORECREDUCIDO_DS: TStringField
      FieldName = 'CTORECREDUCIDO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORECSUPER: TStringField
      FieldName = 'CTORECSUPER'
      Size = 3
    end
    object QParametrosCTORECSUPER_DS: TStringField
      FieldName = 'CTORECSUPER_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOCOBROF: TStringField
      FieldName = 'CTOCOBROF'
      Size = 3
    end
    object QParametrosCTOCOBROF_DS: TStringField
      FieldName = 'CTOCOBROF_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORECIBOVENTAS: TStringField
      FieldName = 'CTORECIBOVENTAS'
      Size = 3
    end
    object QParametrosCTORECIBOVENTAS_DS: TStringField
      FieldName = 'CTORECIBOVENTAS_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVACNORMAL: TStringField
      FieldName = 'CTOIVACNORMAL'
      Size = 3
    end
    object QParametrosCTOIVACNORMAL_DS: TStringField
      FieldName = 'CTOIVACNORMAL_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVACREDUCIDO: TStringField
      FieldName = 'CTOIVACREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVACREDUCIDO_DS: TStringField
      FieldName = 'CTOIVACREDUCIDO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVACSUPER: TStringField
      FieldName = 'CTOIVACSUPER'
      Size = 3
    end
    object QParametrosCTOIVACSUPER_DS: TStringField
      FieldName = 'CTOIVACSUPER_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOIVACEXENTO: TStringField
      FieldName = 'CTOIVACEXENTO'
      Size = 3
    end
    object QParametrosCTOIVACEXENTO_DS: TStringField
      FieldName = 'CTOIVACEXENTO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOCOMPRAS: TStringField
      FieldName = 'CTOCOMPRAS'
      Size = 3
    end
    object QParametrosCTOCOMPRAS_DS: TStringField
      FieldName = 'CTOCOMPRAS_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOPROVEEDORES: TStringField
      FieldName = 'CTOPROVEEDORES'
      Size = 3
    end
    object QParametrosCTOPROVEEDORES_DS: TStringField
      FieldName = 'CTOPROVEEDORES_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOPROVINTRA: TStringField
      FieldName = 'CTOPROVINTRA'
      FixedChar = True
      Size = 3
    end
    object QParametrosCTOPROVINTRA_DS: TStringField
      FieldName = 'CTOPROVINTRA_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOPAGOF: TStringField
      FieldName = 'CTOPAGOF'
      Size = 3
    end
    object QParametrosCTOPAGOF_DS: TStringField
      FieldName = 'CTOPAGOF_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOEFECTOSCOMERCIALES: TStringField
      FieldName = 'CTOEFECTOSCOMERCIALES'
      Size = 3
    end
    object QParametrosCTOEFECTOSCOMERCIALES_DS: TStringField
      FieldName = 'CTOEFECTOSCOMERCIALES_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTODEUDASDESCUENTOS: TStringField
      FieldName = 'CTODEUDASDESCUENTOS'
      Size = 3
    end
    object QParametrosCTODEUDASDESCUENTOS_DS: TStringField
      FieldName = 'CTODEUDASDESCUENTOS_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOREMESAEFECTOS: TStringField
      FieldName = 'CTOREMESAEFECTOS'
      Size = 3
    end
    object QParametrosCTOREMESAEFECTOS_DS: TStringField
      FieldName = 'CTOREMESAEFECTOS_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTODTOPPV: TStringField
      FieldName = 'CTODTOPPV'
      Size = 3
    end
    object QParametrosCTODTOPPV_DS: TStringField
      FieldName = 'CTODTOPPV_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTODTOPPC: TStringField
      FieldName = 'CTODTOPPC'
      Size = 3
    end
    object QParametrosCTODTOPPC_DS: TStringField
      FieldName = 'CTODTOPPC_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORETPROF: TStringField
      FieldName = 'CTORETPROF'
      Size = 3
    end
    object QParametrosCTORETPROF_DS: TStringField
      FieldName = 'CTORETPROF_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTORETARRE: TStringField
      FieldName = 'CTORETARRE'
      Size = 3
    end
    object QParametrosCTORETARRE_DS: TStringField
      FieldName = 'CTORETARRE_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOHACIVA: TStringField
      FieldName = 'CTOHACIVA'
      Size = 3
    end
    object QParametrosCTOHACIVA_DS: TStringField
      FieldName = 'CTOHACIVA_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOCOBRO: TStringField
      FieldName = 'CTOCOBRO'
      Size = 3
    end
    object QParametrosCTOCOBRO_DS: TStringField
      FieldName = 'CTOCOBRO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosCTOPAGO: TStringField
      FieldName = 'CTOPAGO'
      Size = 3
    end
    object QParametrosCTOPAGO_DS: TStringField
      FieldName = 'CTOPAGO_DS'
      FixedChar = True
      Size = 30
    end
    object QParametrosSCTADESCUENTO: TStringField
      FieldName = 'SCTADESCUENTO'
      Size = 10
    end
    object QParametrosCTODESCUENTO: TStringField
      FieldName = 'CTODESCUENTO'
      Size = 3
    end
    object QParametrosCTONOME: TStringField
      FieldName = 'CTONOME'
      Size = 3
    end
    object QParametrosCTONOMT: TStringField
      FieldName = 'CTONOMT'
      Size = 3
    end
    object QParametrosSCTANOMSUELDO: TStringField
      FieldName = 'SCTANOMSUELDO'
      Size = 10
    end
    object QParametrosSCTANOMIRPF: TStringField
      FieldName = 'SCTANOMIRPF'
      Size = 10
    end
    object QParametrosSCTANOMPAGO: TStringField
      FieldName = 'SCTANOMPAGO'
      Size = 10
    end
    object QParametrosSCTANOMSSE: TStringField
      FieldName = 'SCTANOMSSE'
      Size = 10
    end
    object QParametrosSCTANOMSST: TStringField
      FieldName = 'SCTANOMSST'
      Size = 10
    end
    object QParametrosSCTANOMCARGO: TStringField
      FieldName = 'SCTANOMCARGO'
      Size = 10
    end
    object QParametrosTANTORETPROF: TBCDField
      FieldName = 'TANTORETPROF'
      Precision = 14
      Size = 3
    end
    object QParametrosTANTORETARRE: TBCDField
      FieldName = 'TANTORETARRE'
      Precision = 14
      Size = 3
    end
    object QParametrosTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 16
    end
    object QParametrosFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object QParametrosDOCIMPRIMIR: TStringField
      FieldName = 'DOCIMPRIMIR'
      FixedChar = True
      Size = 1
    end
    object QParametrosSIGLAVIA: TStringField
      FieldName = 'SIGLAVIA'
      FixedChar = True
      Size = 2
    end
    object QParametrosNUMEROCALLE: TStringField
      FieldName = 'NUMEROCALLE'
      FixedChar = True
      Size = 4
    end
    object QParametrosESCALERA: TStringField
      FieldName = 'ESCALERA'
      FixedChar = True
      Size = 2
    end
    object QParametrosPISO: TStringField
      FieldName = 'PISO'
      FixedChar = True
      Size = 2
    end
    object QParametrosPUERTA: TStringField
      FieldName = 'PUERTA'
      FixedChar = True
      Size = 2
    end
    object QParametrosCCC: TStringField
      FieldName = 'CCC'
      Size = 23
    end
    object QParametrosCODADMON: TStringField
      FieldName = 'CODADMON'
      FixedChar = True
      Size = 5
    end
    object QParametrosGESTIONA_CARTERA_EFECTOS: TStringField
      FieldName = 'GESTIONA_CARTERA_EFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosFILTRO_ASIENTOS_INICIO: TStringField
      FieldName = 'FILTRO_ASIENTOS_INICIO'
      FixedChar = True
      Size = 1
    end
    object QParametrosINCLUIR_ABREV: TStringField
      FieldName = 'INCLUIR_ABREV'
      FixedChar = True
      Size = 1
    end
    object QParametrosASIENTOS_INICIO_INTERVALO_BQDA: TIntegerField
      FieldName = 'ASIENTOS_INICIO_INTERVALO_BQDA'
    end
    object QParametrosASIENTOS_FIN_INTERVALO_BQDA: TIntegerField
      FieldName = 'ASIENTOS_FIN_INTERVALO_BQDA'
    end
    object QParametrosMOSTRAR_FILTRO_MAYOR: TStringField
      FieldName = 'MOSTRAR_FILTRO_MAYOR'
      FixedChar = True
      Size = 1
    end
    object QParametrosASIENTO_INICIO_INTERVALO_FILTRO: TIntegerField
      FieldName = 'ASIENTO_INICIO_INTERVALO_FILTRO'
    end
    object QParametrosASIENTO_FIN_INTERVALO_FILTRO: TIntegerField
      FieldName = 'ASIENTO_FIN_INTERVALO_FILTRO'
    end
    object QParametrosASIENTO_NOMINA_INDIVIDUAL: TStringField
      FieldName = 'ASIENTO_NOMINA_INDIVIDUAL'
      FixedChar = True
      Size = 1
    end
    object QParametrosBUSQUEDA_SUBCTAS: TStringField
      FieldName = 'BUSQUEDA_SUBCTAS'
      FixedChar = True
      Size = 1
    end
    object QParametrosSCTAOTRASREMUN: TStringField
      FieldName = 'SCTAOTRASREMUN'
      Size = 10
    end
    object QParametrosDESCPROV_CARTERAEFECTOS: TStringField
      FieldName = 'DESCPROV_CARTERAEFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosDESCCLI_CARTERAEFECTOS: TStringField
      FieldName = 'DESCCLI_CARTERAEFECTOS'
      FixedChar = True
      Size = 1
    end
    object QParametrosTIPOEMPRESA: TStringField
      FieldName = 'TIPOEMPRESA'
      FixedChar = True
      Size = 1
    end
    object QParametrosFILTROSUBCTAS: TStringField
      FieldName = 'FILTROSUBCTAS'
      FixedChar = True
      Size = 3
    end
    object QParametrosOFFICE2003: TStringField
      FieldName = 'OFFICE2003'
      FixedChar = True
      Size = 1
    end
    object QParametrosTRATASERIE: TStringField
      FieldName = 'TRATASERIE'
      FixedChar = True
      Size = 1
    end
    object QParametrosACTCOMENTARIO: TStringField
      FieldName = 'ACTCOMENTARIO'
      FixedChar = True
      Size = 1
    end
  end
  object QProvinciasNom: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT PROVINCIA, '#13#10'               NOMBRE   , '#13#10'               C' +
      'ODIGO '#13#10'FROM PROVINCIAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 176
    Top = 104
    object QProvinciasNomPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      FixedChar = True
      Size = 2
    end
    object QProvinciasNomNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 25
    end
    object QProvinciasNomCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
  end
end
