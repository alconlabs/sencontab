object DMRef: TDMRef
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 445
  Top = 209
  Height = 560
  Width = 657
  object QAuxiliar: TIBSQL
    ParamCheck = True
    Left = 280
    Top = 32
  end
  object QProvinciasNom: TIBTableSet
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
    Left = 286
    Top = 184
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
    Left = 154
    Top = 376
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
  object QAnaliticasNom: TIBTableSet
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
    Left = 151
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
    Left = 151
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
    Left = 151
    Top = 314
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
    Left = 151
    Top = 442
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
    Left = 151
    Top = 506
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
    Left = 47
    Top = 314
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
    Left = 47
    Top = 442
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
    Left = 47
    Top = 506
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
    Top = 194
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
    Left = 151
    Top = 194
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
    Left = 47
    Top = 250
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
    Top = 250
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
    Left = 47
    Top = 562
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
    Left = 151
    Top = 562
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
  object DB: TCRSQLConnection
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
  object BDEjAnterior: TCRSQLConnection
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
    Left = 391
    Top = 127
  end
  object IBDConsolida: TCRSQLConnection
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
    Left = 391
    Top = 183
  end
  object QAnaliticas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ANALITICAS')
    SQLConnection = DB
    Left = 48
    Top = 88
    object QAnaliticasCUENTA: TStringField
      FieldName = 'CUENTA'
      FixedChar = True
      Size = 10
    end
    object QAnaliticasNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
    object QAnaliticasID_PROYECTO: TStringField
      FieldName = 'ID_PROYECTO'
      FixedChar = True
      Size = 10
    end
    object QAnaliticasID_SECCION: TStringField
      FieldName = 'ID_SECCION'
      FixedChar = True
      Size = 10
    end
    object QAnaliticasID_DEPARTAMENTO: TStringField
      FieldName = 'ID_DEPARTAMENTO'
      FixedChar = True
      Size = 10
    end
    object QAnaliticasID_DELEGACION: TStringField
      FieldName = 'ID_DELEGACION'
      FixedChar = True
      Size = 10
    end
  end
  object QParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
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
    SQLConnection = DB
    Left = 288
    Top = 136
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
end
