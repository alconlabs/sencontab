object DmControlRef: TDmControlRef
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 623
  Top = 215
  Height = 314
  Width = 515
  object BDControl: TIBDatabase
    DatabaseName = 'LENOVO:c:\cviews\datos\CONTROL_CONT.ib'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TransaccionControl
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 282
    Top = 56
  end
  object TransaccionControl: TIBTransaction
    Active = False
    DefaultDatabase = BDControl
    AutoStopAction = saNone
    Left = 360
    Top = 56
  end
  object QEmpresas: TIBTableSet
    Database = BDControl
    Transaction = TransaccionControl
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMPRESAS'
      'WHERE'
      
        '  ID_EMPRESA                     =:old_ID_EMPRESA               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO EMPRESAS'
      
        '  (CERRADA                        ,CLAVE                        ' +
        '  ,UBICACION                      ,NOMBRE                       ' +
        '  ,ID_EMPRESA                     ,ULTIMA                       ' +
        '  ,SERVIDOR                       )'
      'VALUES'
      
        '  (:CERRADA                        ,:CLAVE                      ' +
        '    ,:UBICACION                      ,:NOMBRE                   ' +
        '      ,:ID_EMPRESA                     ,:ULTIMA                 ' +
        '        ,:SERVIDOR                       )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMPRESAS'
      'WHERE'
      
        '  ID_EMPRESA                     =?ID_EMPRESA                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM EMPRESAS')
    ModifySQL.Strings = (
      'UPDATE EMPRESAS'
      'SET'
      
        '  CERRADA                        =:CERRADA                      ' +
        '   '
      
        '  ,CLAVE                          =:CLAVE                       ' +
        '    '
      
        '  ,UBICACION                      =:UBICACION                   ' +
        '    '
      
        '  ,NOMBRE                         =:NOMBRE                      ' +
        '    '
      
        '  ,ULTIMA                         =:ULTIMA                      ' +
        '    '
      
        '  ,SERVIDOR                       =:SERVIDOR                    ' +
        '    '
      'WHERE'
      
        '  ID_EMPRESA                     =:ID_EMPRESA                   ' +
        '   ')
    TableName = 'empresas'
    Left = 312
    Top = 120
    object QEmpresasNOMBRE: TIBStringField
      DisplayLabel = 'EMPRESA'
      DisplayWidth = 25
      FieldName = 'NOMBRE'
      Origin = 'EMPRESAS.NOMBRE'
      Size = 40
    end
    object QEmpresasCERRADA: TIBStringField
      FieldName = 'CERRADA'
      Origin = 'EMPRESAS.CERRADA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QEmpresasCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'EMPRESAS.CLAVE'
      Visible = False
      Size = 10
    end
    object QEmpresasUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'EMPRESAS.UBICACION'
      Visible = False
      Size = 100
    end
    object QEmpresasID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'EMPRESAS.ID_EMPRESA'
      Required = True
      Visible = False
    end
    object QEmpresasULTIMA: TIBStringField
      FieldName = 'ULTIMA'
      Origin = 'EMPRESAS.ULTIMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QEmpresasSERVIDOR: TIBStringField
      FieldName = 'SERVIDOR'
      Origin = 'EMPRESAS.SERVIDOR'
      Visible = False
      Size = 30
    end
  end
  object QUsuarios: TIBTableSet
    Database = BDControl
    Transaction = TransaccionControl
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE'
      
        '  ID_USUARIO                     =:old_ID_USUARIO               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS'
      
        '  (ID_USUARIO                     ,ID_EMPRESA                   ' +
        '  ,CLAVE                          ,NOMBRE                       ' +
        '  )'
      'VALUES'
      
        '  (:ID_USUARIO                     ,:ID_EMPRESA                 ' +
        '    ,:CLAVE                          ,:NOMBRE                   ' +
        '      )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS'
      'WHERE'
      
        '  ID_USUARIO                     =?ID_USUARIO                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS')
    ModifySQL.Strings = (
      'UPDATE USUARIOS'
      'SET'
      
        '  ID_EMPRESA                     =:ID_EMPRESA                   ' +
        '   '
      
        '  ,CLAVE                          =:CLAVE                       ' +
        '    '
      
        '  ,NOMBRE                         =:NOMBRE                      ' +
        '    '
      'WHERE'
      
        '  ID_USUARIO                     =:ID_USUARIO                   ' +
        '   ')
    TableName = 'usuarios'
    Left = 446
    Top = 123
    object QUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'USUARIOS.ID_USUARIO'
      Required = True
    end
    object QUsuariosID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'USUARIOS.ID_EMPRESA'
    end
    object QUsuariosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'USUARIOS.CLAVE'
      Size = 10
    end
    object QUsuariosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'USUARIOS.NOMBRE'
      Size = 15
    end
  end
  object QControl: TIBTableSet
    Database = BDControl
    Transaction = TransaccionControl
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CONTROL'
      'WHERE'
      
        '  ID_CONTROL                     =:old_ID_CONTROL               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO CONTROL'
      
        '  (PEDIR_CLAVE                    ,ID_CONTROL                   ' +
        '  )'
      'VALUES'
      
        '  (:PEDIR_CLAVE                    ,:ID_CONTROL                 ' +
        '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CONTROL'
      'WHERE'
      
        '  ID_CONTROL                     =?ID_CONTROL                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM CONTROL')
    ModifySQL.Strings = (
      'UPDATE CONTROL'
      'SET'
      
        '  PEDIR_CLAVE                    =:PEDIR_CLAVE                  ' +
        '   '
      'WHERE'
      
        '  ID_CONTROL                     =:ID_CONTROL                   ' +
        '   ')
    TableName = 'control'
    Left = 446
    Top = 179
    object QControlPEDIR_CLAVE: TIBStringField
      FieldName = 'PEDIR_CLAVE'
      Origin = 'CONTROL.PEDIR_CLAVE'
      FixedChar = True
      Size = 1
    end
    object QControlID_CONTROL: TSmallintField
      FieldName = 'ID_CONTROL'
      Origin = 'CONTROL.ID_CONTROL'
      Required = True
    end
  end
  object QAuxiliar: TIBSQL
    Database = BDControl
    ParamCheck = True
    Transaction = TransaccionControl
    Left = 440
    Top = 56
  end
  object sEmpresas: TDataSource
    DataSet = QEmpresas
    Left = 384
    Top = 120
  end
end
