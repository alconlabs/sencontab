object WProyectos: TWProyectos
  Left = 375
  Top = 226
  BorderStyle = bsSingle
  Caption = 'Cat'#225'logo de Proyectos'
  ClientHeight = 483
  ClientWidth = 455
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Datos: TGroupBox
    Left = 0
    Top = 0
    Width = 455
    Height = 60
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 88
      Height = 17
      AutoSize = False
      Caption = 'Proyecto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 111
      Top = 15
      Width = 77
      Height = 16
      AutoSize = False
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditDS_PROYECTO: TDBEdit
      Left = 111
      Top = 29
      Width = 266
      Height = 20
      AutoSize = False
      DataField = 'NOMBRE'
      DataSource = SFichero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditCD_PROYECTO: TDBEdit
      Left = 7
      Top = 29
      Width = 97
      Height = 21
      AutoSize = False
      DataField = 'ID_PROYECTO'
      DataSource = SFichero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 455
    Height = 404
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object DataGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 350
      Height = 404
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
      Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = DataGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PROYECTO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Descripci'#243'n'
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 350
      Top = 0
      Width = 105
      Height = 404
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object BtnAppend: TSpeedButton
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
        OnClick = BtnAppendClick
      end
      object BtnDelete: TSpeedButton
        Left = 10
        Top = 72
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
        OnClick = BtnDeleteClick
      end
      object BtnSave: TSpeedButton
        Left = 10
        Top = 218
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
        OnClick = BtnSaveClick
      end
      object BtnCancel: TSpeedButton
        Left = 10
        Top = 246
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtnCancelClick
      end
      object BtnReport: TSpeedButton
        Left = 10
        Top = 114
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
        OnClick = BtnReportClick
      end
      object BtnModify: TSpeedButton
        Left = 10
        Top = 43
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
        OnClick = DataGridDblClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 464
    Width = 455
    Height = 19
    Panels = <>
  end
  object SFichero: TDataSource
    AutoEdit = False
    DataSet = QFichero
    Left = 112
    Top = 189
  end
  object QFichero: TIBTableSet
    Database = DMRef.IBDSiamCont
    Transaction = Transaccion
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
    TableName = 'PROYECTO'
    Left = 67
    Top = 188
    object QFicheroID_PROYECTO: TIBStringField
      DisplayLabel = 'PROYECTO'
      DisplayWidth = 11
      FieldName = 'ID_PROYECTO'
      Origin = 'PROYECTO.ID_PROYECTO'
      Required = True
      Size = 10
    end
    object QFicheroNOMBRE: TIBStringField
      DisplayWidth = 45
      FieldName = 'NOMBRE'
      Origin = 'PROYECTO.NOMBRE'
      Size = 50
    end
  end
  object Transaccion: TIBTransaction
    Active = False
    DefaultDatabase = DMRef.IBDSiamCont
    AutoStopAction = saNone
    Left = 66
    Top = 141
  end
  object TbFiltro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 237
  end
  object sFiltro: TDataSource
    DataSet = TbFiltro
    Left = 114
    Top = 237
  end
end
