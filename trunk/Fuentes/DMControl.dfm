object DmControlRef: TDmControlRef
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 579
  Top = 191
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
    Left = 50
    Top = 64
  end
  object TransaccionControl: TIBTransaction
    Active = False
    DefaultDatabase = BDControl
    AutoStopAction = saNone
    Left = 144
    Top = 72
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
    Left = 72
    Top = 128
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
    Left = 70
    Top = 195
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
  object sEmpresas: TDataSource
    DataSet = QEmpresas
    Left = 144
    Top = 128
  end
end
