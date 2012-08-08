object CountysView: TCountysView
  Left = 563
  Top = 237
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Provincias'
  ClientHeight = 421
  ClientWidth = 523
  Color = 14275008
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  DesignSize = (
    523
    421)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 420
    Width = 523
    Height = 1
    Align = alBottom
    Pen.Color = 7552051
  end
  object PanelBackground: TPanel
    Left = 2
    Top = 35
    Width = 519
    Height = 346
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = 14275008
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 0
      Top = 57
      Width = 400
      Height = 289
      Align = alClient
      BorderStyle = bsNone
      Color = 16773322
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PROVINCIA'
          Title.Color = 5064266
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Color = 5064266
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 284
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Color = 5064266
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 39
          Visible = True
        end>
    end
    object PnlBtn: TPanel
      Left = 400
      Top = 57
      Width = 119
      Height = 289
      Align = alRight
      BevelInner = bvLowered
      BorderStyle = bsSingle
      Color = clSilver
      TabOrder = 1
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
      object BtnModify: TSpeedButton
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
      end
      object BtnDelete: TSpeedButton
        Left = 10
        Top = 70
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
      object BtnReport: TSpeedButton
        Left = 10
        Top = 128
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
      object BtnAccept: TSpeedButton
        Left = 10
        Top = 230
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
        Top = 202
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
    end
    object PanelEdit: TPanel
      Left = 0
      Top = 0
      Width = 519
      Height = 57
      Align = alTop
      Color = 14275008
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 13
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object Label2: TLabel
        Left = 84
        Top = 13
        Width = 56
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object Label3: TLabel
        Left = 383
        Top = 13
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object EditPROVINCIA: TDBEdit
        Left = 7
        Top = 27
        Width = 59
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        CharCase = ecUpperCase
        DataField = 'PROVINCIA'
        DataSource = DataSource
        TabOrder = 0
      end
      object EditNOMBRE: TDBEdit
        Left = 88
        Top = 27
        Width = 263
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        CharCase = ecUpperCase
        Color = 14671839
        Ctl3D = False
        DataField = 'NOMBRE'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object EditCODIGO: TDBEdit
        Left = 382
        Top = 27
        Width = 42
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        DataField = 'CODIGO'
        DataSource = DataSource
        TabOrder = 2
      end
    end
  end
  object DataSource: TDataSource
    AutoEdit = False
    Left = 285
    Top = 129
  end
end
