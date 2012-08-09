object TypesOfJournalView: TTypesOfJournalView
  Left = 505
  Top = 287
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Archivo de TIPOS DE DIARIO'
  ClientHeight = 493
  ClientWidth = 399
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = True
  DesignSize = (
    399
    493)
  PixelsPerInch = 96
  TextHeight = 16
  object PanelBackground: TPanel
    Left = 1
    Top = 32
    Width = 395
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 14275008
    TabOrder = 0
    object Panel1: TPanel
      Left = 289
      Top = 61
      Width = 105
      Height = 331
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 0
      object BtnNew: TSpeedButton
        Left = 10
        Top = 14
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Nuevo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnDelete: TSpeedButton
        Left = 10
        Top = 72
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Eliminar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnAccept: TSpeedButton
        Left = 10
        Top = 282
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
      end
      object BtnReport: TSpeedButton
        Left = 10
        Top = 114
        Width = 83
        Height = 25
        Cursor = crHandPoint
        Caption = '&Informe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
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
      end
    end
    object DBGrid: TDBGrid
      Left = 1
      Top = 61
      Width = 288
      Height = 331
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Color = 14275008
      DataSource = DataSource
      FixedColor = 10657371
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
    end
    object Datos: TGroupBox
      Left = 1
      Top = 1
      Width = 393
      Height = 60
      Align = alTop
      TabOrder = 2
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
      object EditDESCRIPCION: TDBEdit
        Left = 111
        Top = 29
        Width = 266
        Height = 20
        AutoSize = False
        DataField = 'DESCRIPCION'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EditTIPODIARIO: TDBEdit
        Left = 7
        Top = 29
        Width = 97
        Height = 21
        AutoSize = False
        DataField = 'TIPODIARIO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object DataSource: TDataSource
    AutoEdit = False
    Left = 104
    Top = 162
  end
end
