object FormEnterprises: TFormEnterprises
  Left = 388
  Top = 263
  BorderStyle = bsDialog
  ClientHeight = 475
  ClientWidth = 777
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 456
    Width = 777
    Height = 19
    Panels = <>
  end
  object Panel4: TPanel
    Left = 0
    Top = 49
    Width = 777
    Height = 350
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 41
      Height = 350
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
    end
    object Rejilla: TDBGrid
      Left = 41
      Top = 0
      Width = 631
      Height = 350
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Color = 15596540
      DataSource = SFichero
      Font.Charset = ANSI_CHARSET
      Font.Color = 10657371
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = RejillaDblClick
    end
    object Panel1: TPanel
      Left = 672
      Top = 0
      Width = 105
      Height = 350
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object BtnNavAniadir: TBitBtn
        Left = 10
        Top = 14
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&A'#241'adir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object BtnNavBorrar: TBitBtn
        Left = 10
        Top = 70
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Borrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BtnNavBorrarClick
      end
      object BtnEdtGuardar: TBitBtn
        Left = 10
        Top = 234
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = 'Ac&eptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnEdtGuardarClick
      end
      object BtnNavImprimir: TBitBtn
        Left = 10
        Top = 98
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnNavImprimirClick
      end
      object BtnNavModificar: TBitBtn
        Left = 10
        Top = 42
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Modificar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = RejillaDblClick
      end
      object BtnNavDuplicar: TBitBtn
        Left = 10
        Top = 138
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Duplicar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = BtnNavDuplicarClick
      end
      object BtnNavCopiar: TBitBtn
        Left = 10
        Top = 166
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Copiar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = BtnNavCopiarClick
      end
      object BtnNavSelecciona: TBitBtn
        Left = 10
        Top = 295
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = 'Se&leccionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
        OnClick = BtnNavSeleccionaClick
      end
      object BtnNavUtilidades: TBitBtn
        Left = 10
        Top = 194
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Utilidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = BtnNavUtilidadesClick
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 399
    Width = 777
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
  end
  object SFichero: TDataSource
    AutoEdit = False
    DataSet = QFichero
    Left = 224
    Top = 117
  end
  object QFichero: TIBTableSet
    Database = DmControlRef.BDControl
    Transaction = Transaccion
    OnNewRecord = QFicheroNewRecord
    BufferChunks = 32
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
    Left = 281
    Top = 116
    object QFicheroNOMBRE: TIBStringField
      DisplayWidth = 27
      FieldName = 'NOMBRE'
      Origin = 'EMPRESAS.NOMBRE'
      Size = 40
    end
    object QFicheroUBICACION: TIBStringField
      DisplayWidth = 76
      FieldName = 'UBICACION'
      Origin = 'EMPRESAS.UBICACION'
      Size = 100
    end
    object QFicheroCERRADA: TIBStringField
      DisplayLabel = 'C'
      DisplayWidth = 1
      FieldName = 'CERRADA'
      Origin = 'EMPRESAS.CERRADA'
      FixedChar = True
      Size = 1
    end
    object QFicheroID_EMPRESA: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'EMPRESA'
      DisplayWidth = 8
      FieldName = 'ID_EMPRESA'
      Origin = 'EMPRESAS.ID_EMPRESA'
      Visible = False
    end
    object QFicheroCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'EMPRESAS.CLAVE'
      Visible = False
      Size = 10
    end
    object QFicheroULTIMA: TIBStringField
      FieldName = 'ULTIMA'
      Origin = 'EMPRESAS.ULTIMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QFicheroSERVIDOR: TIBStringField
      FieldName = 'SERVIDOR'
      Origin = 'EMPRESAS.SERVIDOR'
      Visible = False
      Size = 30
    end
  end
  object Transaccion: TIBTransaction
    Active = False
    DefaultDatabase = DmControlRef.BDControl
    AutoStopAction = saNone
    Left = 258
    Top = 117
  end
  object TbFiltro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 117
  end
  object sFiltro: TDataSource
    DataSet = TbFiltro
    Left = 314
    Top = 85
  end
end
