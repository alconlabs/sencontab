object DataModuleParametersEnterprise: TDataModuleParametersEnterprise
  OldCreateOrder = False
  Left = 801
  Top = 628
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
    Left = 47
    Top = 31
  end
  object QParametros: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT ID_PARAMETROS                  ,'#13#10'       LONGITUD_SUBCUEN' +
      'TAS            ,'#13#10'       FECHA_INICIO_APLICACION        ,'#13#10'     ' +
      '  FECHA_INICIO_EJERCICIO         ,'#13#10'       FECHA_FIN_EJERCICIO  ' +
      '          ,'#13#10'       CTO_REGULARIZACION             ,'#13#10'       SUB' +
      'CUENTA_CIERRE               ,'#13#10'       MONEDA                    ' +
      '     ,'#13#10'       NOMBREFISCAL                   ,'#13#10'       DIRECCIO' +
      'N                      ,'#13#10'       DIRECCION1                     ' +
      ','#13#10'       POBLACION                      ,'#13#10'       CODPOSTAL    ' +
      '                  ,'#13#10'       PROVINCIA                      ,'#13#10'  ' +
      '     NIF                            ,'#13#10'       CONTACTO          ' +
      '             ,'#13#10'       DOCCLIENTE                     ,'#13#10'       ' +
      'DOCPROVEEDOR                   ,'#13#10'       DOC347                 ' +
      '        ,'#13#10'       FECHABLOQUEO                   ,'#13#10'       CTO_A' +
      'PERTURA                   ,'#13#10'       CTO_REGULARIZACION_ESP      ' +
      '   ,'#13#10'       FECHAAMORTIZACION              ,'#13#10'       RECARGO   ' +
      '                     ,'#13#10'       CTO_APERTURA_ESP               ,'#13 +
      #10'       SCTAIVANORMAL                  ,'#13#10'       SCTAIVASUPER   ' +
      '                ,'#13#10'       SCTAIVAREDUCIDO                ,'#13#10'    ' +
      '   SCTAIVAEXENTO                  ,'#13#10'       SCTAIVAINTRADEDUCIBL' +
      'E          ,'#13#10'       SCTAIVAINTRA                   ,'#13#10'       SC' +
      'TAVENTAS                     ,'#13#10'       SCTADEVOLUCION           ' +
      '      ,'#13#10'       SCTARECNORMAL                  ,'#13#10'       SCTAREC' +
      'REDUCIDO                ,'#13#10'       SCTARECSUPER                  ' +
      ' ,'#13#10'       VGENERICA                      ,'#13#10'       SUBCAJA     ' +
      '                   ,'#13#10'       SCTAIVAEXENTOCEE               ,'#13#10' ' +
      '      SCTAINTERESES                  ,'#13#10'       SCTAEXPORTACIONES' +
      '              ,'#13#10'       SCTAIVACNORMAL                 ,'#13#10'      ' +
      ' SCTAIVACREDUCIDO               ,'#13#10'       SCTAIVACSUPER         ' +
      '         ,'#13#10'       SCTAIVACEXENTO                 ,'#13#10'       SCTA' +
      'COMPRAS                    ,'#13#10'       SCTAIVACINTRADEDUCIBLE     ' +
      '    ,'#13#10'       SCTAIVACINTRAREPERCUTIDO       ,'#13#10'       VGENERICA' +
      'C                     ,'#13#10'       SCTAEFECTOSCOMERCIALES         ,' +
      #13#10'       SCTAEFECTDESCONTADOS           ,'#13#10'       SCTADEUDASDESC' +
      'UENTOS           ,'#13#10'       SCTAREMESAEFECTOS              ,'#13#10'   ' +
      '    SCTADTOPPV                     ,'#13#10'       SCTADTOPPC         ' +
      '            ,'#13#10'       SCTARETPROF                    ,'#13#10'       S' +
      'CTARETARRE                    ,'#13#10'       SCTAHACIVA              ' +
      '       ,'#13#10'       SCTAGENINTRACOM                ,'#13#10'       SCTABA' +
      'NCO                      ,'#13#10'       SCTANOMSUELDO                ' +
      '  ,'#13#10'       CTOIVANORMAL                   ,'#13#10'       CTOIVAREDUC' +
      'IDO                 ,'#13#10'       CTOIVASUPER                    ,'#13#10 +
      '       CTOIVAEXENTO                   ,'#13#10'       CTOIVAINTRA     ' +
      '               ,'#13#10'       CTOVENTAS                      ,'#13#10'     ' +
      '  CTODEVOLUCION                  ,'#13#10'       CTOCLIENTES          ' +
      '          ,'#13#10'       CTORECNORMAL                   ,'#13#10'       CTO' +
      'RECREDUCIDO                 ,'#13#10'       CTORECSUPER               ' +
      '     ,'#13#10'       CTOCOBROF                      ,'#13#10'       CTORECIB' +
      'OVENTAS                ,'#13#10'       CTOIVACNORMAL                  ' +
      ','#13#10'       CTOIVACREDUCIDO                ,'#13#10'       CTOIVACSUPER ' +
      '                  ,'#13#10'       CTOIVACEXENTO                  ,'#13#10'  ' +
      '     CTOCOMPRAS                     ,'#13#10'       CTOPROVEEDORES    ' +
      '             ,'#13#10'       CTOPROVINTRA                   ,'#13#10'       ' +
      'CTOPAGOF                       ,'#13#10'       CTOEFECTOSCOMERCIALES  ' +
      '        ,'#13#10'       CTODEUDASDESCUENTOS            ,'#13#10'       CTORE' +
      'MESAEFECTOS               ,'#13#10'       CTODTOPPV                   ' +
      '   ,'#13#10'       CTODTOPPC                      ,'#13#10'       CTORETPROF' +
      '                     ,'#13#10'       CTORETARRE                     ,'#13 +
      #10'       CTOHACIVA                      ,'#13#10'       CTOCOBRO       ' +
      '                ,'#13#10'       CTOPAGO                        ,'#13#10'    ' +
      '   SCTADESCUENTO                  ,'#13#10'       CTODESCUENTO        ' +
      '           ,'#13#10'       CTONOME                        ,'#13#10'       CT' +
      'ONOMT                        ,'#13#10'       SCTANOMIRPF              ' +
      '      ,'#13#10'       SCTANOMPAGO                    ,'#13#10'       SCTANOM' +
      'SSE                     ,'#13#10'       SCTANOMSST                    ' +
      ' ,'#13#10'       SCTANOMCARGO                   ,'#13#10'       TANTORETPROF' +
      '                   ,'#13#10'       TANTORETARRE                   ,'#13#10' ' +
      '      TELEFONO                       ,'#13#10'       FAX              ' +
      '              ,'#13#10'       DOCIMPRIMIR                    ,'#13#10'      ' +
      ' SIGLAVIA                       ,'#13#10'       NUMEROCALLE           ' +
      '         ,'#13#10'       ESCALERA                       ,'#13#10'       PISO' +
      '                           ,'#13#10'       PUERTA                     ' +
      '    ,'#13#10'       CCC                            ,'#13#10'       CODADMON ' +
      '                      ,'#13#10'       GESTIONA_CARTERA_EFECTOS       ,' +
      #13#10'       FILTRO_ASIENTOS_INICIO         ,'#13#10'       INCLUIR_ABREV ' +
      '                 ,'#13#10'       ASIENTOS_INICIO_INTERVALO_BQDA ,'#13#10'   ' +
      '    ASIENTOS_FIN_INTERVALO_BQDA    ,'#13#10'       MOSTRAR_FILTRO_MAYO' +
      'R           ,'#13#10'       ASIENTO_INICIO_INTERVALO_FILTRO,'#13#10'       A' +
      'SIENTO_FIN_INTERVALO_FILTRO   ,'#13#10'       ASIENTO_NOMINA_INDIVIDUA' +
      'L      ,'#13#10'       BUSQUEDA_SUBCTAS               ,'#13#10'       SCTAOT' +
      'RASREMUN                 ,'#13#10'       DESCPROV_CARTERAEFECTOS      ' +
      '  ,'#13#10'       DESCCLI_CARTERAEFECTOS         ,'#13#10'       TIPOEMPRESA' +
      '                    ,'#13#10'       FILTROSUBCTAS                  ,'#13#10 +
      '       OFFICE2003                     ,'#13#10'       TRATASERIE      ' +
      '               ,'#13#10'       ACTCOMENTARIO'#13#10'FROM PARAMETROS'#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = QParametrosCalcFields
    Left = 168
    Top = 16
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
      FieldKind = fkCalculated
      FieldName = 'SCTAIVANORMAL_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVAREDUCIDO: TStringField
      FieldName = 'SCTAIVAREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVAREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVAREDUCIDO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVASUPER: TStringField
      FieldName = 'SCTAIVASUPER'
      Size = 10
    end
    object QParametrosSCTAIVASUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVASUPER_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVAEXENTO: TStringField
      FieldName = 'SCTAIVAEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVAEXENTO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE: TStringField
      FieldName = 'SCTAIVAINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVAINTRADEDUCIBLE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVAINTRADEDUCIBLE_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVAINTRA: TStringField
      FieldName = 'SCTAIVAINTRA'
      Size = 10
    end
    object QParametrosSCTAIVAINTRA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVAINTRA_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAVENTAS: TStringField
      FieldName = 'SCTAVENTAS'
      Size = 10
    end
    object QParametrosSCTAVENTAS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAVENTAS_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTADEVOLUCION: TStringField
      FieldName = 'SCTADEVOLUCION'
      Size = 10
    end
    object QParametrosSCTADEVOLUCION_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTADEVOLUCION_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTARECNORMAL: TStringField
      FieldName = 'SCTARECNORMAL'
      Size = 10
    end
    object QParametrosSCTARECNORMAL_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTARECNORMAL_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTARECREDUCIDO: TStringField
      FieldName = 'SCTARECREDUCIDO'
      Size = 10
    end
    object QParametrosSCTARECREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTARECREDUCIDO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTARECSUPER: TStringField
      FieldName = 'SCTARECSUPER'
      Size = 10
    end
    object QParametrosSCTARECSUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTARECSUPER_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosVGENERICA: TStringField
      FieldName = 'VGENERICA'
      Size = 10
    end
    object QParametrosVGENERICA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'VGENERICA_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSUBCAJA: TStringField
      FieldName = 'SUBCAJA'
      Size = 10
    end
    object QParametrosSUBCAJA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SUBCAJA_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVAEXENTOCEE: TStringField
      FieldName = 'SCTAIVAEXENTOCEE'
      Size = 10
    end
    object QParametrosSCTAIVAEXENTOCEE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVAEXENTOCEE_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAINTERESES: TStringField
      FieldName = 'SCTAINTERESES'
      Size = 10
    end
    object QParametrosSCTAINTERESES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAINTERESES_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAEXPORTACIONES: TStringField
      FieldName = 'SCTAEXPORTACIONES'
      Size = 10
    end
    object QParametrosSCTAEXPORTACIONES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAEXPORTACIONES_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACNORMAL: TStringField
      FieldName = 'SCTAIVACNORMAL'
      Size = 10
    end
    object QParametrosSCTAIVACNORMAL_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACNORMAL_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACREDUCIDO: TStringField
      FieldName = 'SCTAIVACREDUCIDO'
      Size = 10
    end
    object QParametrosSCTAIVACREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACREDUCIDO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACSUPER: TStringField
      FieldName = 'SCTAIVACSUPER'
      Size = 10
    end
    object QParametrosSCTAIVACSUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACSUPER_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACEXENTO: TStringField
      FieldName = 'SCTAIVACEXENTO'
      Size = 10
    end
    object QParametrosSCTAIVACEXENTO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACEXENTO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTACOMPRAS: TStringField
      FieldName = 'SCTACOMPRAS'
      Size = 10
    end
    object QParametrosSCTACOMPRAS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTACOMPRAS_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE: TStringField
      FieldName = 'SCTAIVACINTRADEDUCIBLE'
      Size = 10
    end
    object QParametrosSCTAIVACINTRADEDUCIBLE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACINTRADEDUCIBLE_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO: TStringField
      FieldName = 'SCTAIVACINTRAREPERCUTIDO'
      Size = 10
    end
    object QParametrosSCTAIVACINTRAREPERCUTIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAIVACINTRAREPERCUTIDO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosVGENERICAC: TStringField
      FieldName = 'VGENERICAC'
      Size = 10
    end
    object QParametrosVGENERICAC_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'VGENERICAC_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAEFECTOSCOMERCIALES: TStringField
      FieldName = 'SCTAEFECTOSCOMERCIALES'
      Size = 10
    end
    object QParametrosSCTAEFECTOSCOMERCIALES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAEFECTOSCOMERCIALES_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAEFECTDESCONTADOS: TStringField
      FieldName = 'SCTAEFECTDESCONTADOS'
      Size = 10
    end
    object QParametrosSCTAEFECTDESCONTADOS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAEFECTDESCONTADOS_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTADEUDASDESCUENTOS: TStringField
      FieldName = 'SCTADEUDASDESCUENTOS'
      Size = 10
    end
    object QParametrosSCTADEUDASDESCUENTOS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTADEUDASDESCUENTOS_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAREMESAEFECTOS: TStringField
      FieldName = 'SCTAREMESAEFECTOS'
      Size = 10
    end
    object QParametrosSCTAREMESAEFECTOS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAREMESAEFECTOS_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTADTOPPV: TStringField
      FieldName = 'SCTADTOPPV'
      Size = 10
    end
    object QParametrosSCTADTOPPV_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTADTOPPV_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTADTOPPC: TStringField
      FieldName = 'SCTADTOPPC'
      Size = 10
    end
    object QParametrosSCTADTOPPC_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTADTOPPC_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTARETPROF: TStringField
      FieldName = 'SCTARETPROF'
      Size = 10
    end
    object QParametrosSCTARETPROF_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTARETPROF_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTARETARRE: TStringField
      FieldName = 'SCTARETARRE'
      Size = 10
    end
    object QParametrosSCTARETARRE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTARETARRE_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAHACIVA: TStringField
      FieldName = 'SCTAHACIVA'
      Size = 10
    end
    object QParametrosSCTAHACIVA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAHACIVA_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAGENINTRACOM: TStringField
      FieldName = 'SCTAGENINTRACOM'
      Size = 10
    end
    object QParametrosSCTAGENINTRACOM_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAGENINTRACOM_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTABANCO: TStringField
      FieldName = 'SCTABANCO'
      Size = 10
    end
    object QParametrosSCTABANCO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTABANCO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosCTOIVANORMAL: TStringField
      FieldName = 'CTOIVANORMAL'
      Size = 3
    end
    object QParametrosCTOIVANORMAL_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVANORMAL_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVAREDUCIDO: TStringField
      FieldName = 'CTOIVAREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVAREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVAREDUCIDO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVASUPER: TStringField
      FieldName = 'CTOIVASUPER'
      Size = 3
    end
    object QParametrosCTOIVASUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVASUPER_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVAEXENTO: TStringField
      FieldName = 'CTOIVAEXENTO'
      Size = 3
    end
    object QParametrosCTOIVAEXENTO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVAEXENTO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVAINTRA: TStringField
      FieldName = 'CTOIVAINTRA'
      Size = 3
    end
    object QParametrosCTOIVAINTRA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVAINTRA_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOVENTAS: TStringField
      FieldName = 'CTOVENTAS'
      Size = 3
    end
    object QParametrosCTOVENTAS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOVENTAS_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTODEVOLUCION: TStringField
      FieldName = 'CTODEVOLUCION'
      Size = 3
    end
    object QParametrosCTODEVOLUCION_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTODEVOLUCION_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOCLIENTES: TStringField
      FieldName = 'CTOCLIENTES'
      Size = 3
    end
    object QParametrosCTOCLIENTES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOCLIENTES_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORECNORMAL: TStringField
      FieldName = 'CTORECNORMAL'
      Size = 3
    end
    object QParametrosCTORECNORMAL_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORECNORMAL_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORECREDUCIDO: TStringField
      FieldName = 'CTORECREDUCIDO'
      Size = 3
    end
    object QParametrosCTORECREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORECREDUCIDO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORECSUPER: TStringField
      FieldName = 'CTORECSUPER'
      Size = 3
    end
    object QParametrosCTORECSUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORECSUPER_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOCOBROF: TStringField
      FieldName = 'CTOCOBROF'
      Size = 3
    end
    object QParametrosCTOCOBROF_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOCOBROF_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORECIBOVENTAS: TStringField
      FieldName = 'CTORECIBOVENTAS'
      Size = 3
    end
    object QParametrosCTORECIBOVENTAS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORECIBOVENTAS_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVACNORMAL: TStringField
      FieldName = 'CTOIVACNORMAL'
      Size = 3
    end
    object QParametrosCTOIVACNORMAL_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVACNORMAL_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVACREDUCIDO: TStringField
      FieldName = 'CTOIVACREDUCIDO'
      Size = 3
    end
    object QParametrosCTOIVACREDUCIDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVACREDUCIDO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVACSUPER: TStringField
      FieldName = 'CTOIVACSUPER'
      Size = 3
    end
    object QParametrosCTOIVACSUPER_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVACSUPER_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOIVACEXENTO: TStringField
      FieldName = 'CTOIVACEXENTO'
      Size = 3
    end
    object QParametrosCTOIVACEXENTO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOIVACEXENTO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOCOMPRAS: TStringField
      FieldName = 'CTOCOMPRAS'
      Size = 3
    end
    object QParametrosCTOCOMPRAS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOCOMPRAS_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOPROVEEDORES: TStringField
      FieldName = 'CTOPROVEEDORES'
      Size = 3
    end
    object QParametrosCTOPROVEEDORES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOPROVEEDORES_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOPROVINTRA: TStringField
      FieldName = 'CTOPROVINTRA'
      FixedChar = True
      Size = 3
    end
    object QParametrosCTOPROVINTRA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOPROVINTRA_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOPAGOF: TStringField
      FieldName = 'CTOPAGOF'
      Size = 3
    end
    object QParametrosCTOPAGOF_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOPAGOF_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOEFECTOSCOMERCIALES: TStringField
      FieldName = 'CTOEFECTOSCOMERCIALES'
      Size = 3
    end
    object QParametrosCTOEFECTOSCOMERCIALES_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOEFECTOSCOMERCIALES_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTODEUDASDESCUENTOS: TStringField
      FieldName = 'CTODEUDASDESCUENTOS'
      Size = 3
    end
    object QParametrosCTODEUDASDESCUENTOS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTODEUDASDESCUENTOS_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOREMESAEFECTOS: TStringField
      FieldName = 'CTOREMESAEFECTOS'
      Size = 3
    end
    object QParametrosCTOREMESAEFECTOS_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOREMESAEFECTOS_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTODTOPPV: TStringField
      FieldName = 'CTODTOPPV'
      Size = 3
    end
    object QParametrosCTODTOPPV_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTODTOPPV_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTODTOPPC: TStringField
      FieldName = 'CTODTOPPC'
      Size = 3
    end
    object QParametrosCTODTOPPC_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTODTOPPC_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORETPROF: TStringField
      FieldName = 'CTORETPROF'
      Size = 3
    end
    object QParametrosCTORETPROF_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORETPROF_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTORETARRE: TStringField
      FieldName = 'CTORETARRE'
      Size = 3
    end
    object QParametrosCTORETARRE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTORETARRE_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOHACIVA: TStringField
      FieldName = 'CTOHACIVA'
      Size = 3
    end
    object QParametrosCTOHACIVA_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOHACIVA_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOCOBRO: TStringField
      FieldName = 'CTOCOBRO'
      Size = 3
    end
    object QParametrosCTOCOBRO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOCOBRO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
    end
    object QParametrosCTOPAGO: TStringField
      FieldName = 'CTOPAGO'
      Size = 3
    end
    object QParametrosCTOPAGO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTOPAGO_DS'
      FixedChar = True
      Size = 30
      Calculated = True
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
    object QParametrosSCTANOMSUELDO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMSUELDO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTANOMSST_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMSST_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTANOMPAGO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMPAGO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTAOTRASREMUN_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTAOTRASREMUN_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTANOMCARGO_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMCARGO_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTANOMSSE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMSSE_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSCTANOMIRPF_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCTANOMIRPF_DS'
      Size = 80
      Calculated = True
    end
    object QParametrosSUBCUENTA_CIERRE_DS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SUBCUENTA_CIERRE_DS'
      Size = 80
      Calculated = True
    end
  end
  object LProvincias: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT PROVINCIA, '#13#10'               NOMBRE   , '#13#10'               C' +
      'ODIGO '#13#10'FROM PROVINCIAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 64
    object LProvinciasPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      FixedChar = True
      Size = 2
    end
    object LProvinciasNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 25
    end
    object LProvinciasCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
  end
  object LConceptos: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT ID_CONCEPTOS, '#13#10'               DESCRIPCION, '#13#10'           ' +
      '    TIPOCONTABILIDAD, '#13#10'               TIPOCONCEPTO, '#13#10'         ' +
      '      OBSOLETO, '#13#10'               SUBCUENTA, '#13#10'               CON' +
      'TRAPARTIDA '#13#10'FROM CONCEPTOS'#13#10'WHERE OBSOLETO = '#39'N'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    Top = 64
    object LConceptosID_CONCEPTOS: TStringField
      FieldName = 'ID_CONCEPTOS'
      FixedChar = True
      Size = 3
    end
    object LConceptosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      FixedChar = True
      Size = 30
    end
    object LConceptosTIPOCONTABILIDAD: TStringField
      FieldName = 'TIPOCONTABILIDAD'
      FixedChar = True
      Size = 1
    end
    object LConceptosTIPOCONCEPTO: TStringField
      FieldName = 'TIPOCONCEPTO'
      FixedChar = True
      Size = 1
    end
    object LConceptosOBSOLETO: TStringField
      FieldName = 'OBSOLETO'
      FixedChar = True
      Size = 1
    end
    object LConceptosSUBCUENTA: TStringField
      FieldName = 'SUBCUENTA'
      Size = 10
    end
    object LConceptosCONTRAPARTIDA: TStringField
      FieldName = 'CONTRAPARTIDA'
      Size = 10
    end
  end
end
