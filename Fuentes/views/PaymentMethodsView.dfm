object PaymentMethodsView: TPaymentMethodsView
  Left = 392
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Formas de Pago'
  ClientHeight = 467
  ClientWidth = 576
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBackGround: TPanel
    Left = 2
    Top = 30
    Width = 571
    Height = 401
    Color = 14275008
    TabOrder = 0
    object Datos: TGroupBox
      Left = 1
      Top = 1
      Width = 569
      Height = 124
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 113
        Top = 12
        Width = 65
        Height = 13
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 28
        Top = 12
        Width = 67
        Height = 13
        Caption = 'Forma Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 28
        Top = 54
        Width = 53
        Height = 13
        Caption = 'Intervalo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 113
        Top = 54
        Width = 76
        Height = 13
        Caption = 'Vencimientos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditDESCRIBE: TDBEdit
        Left = 113
        Top = 26
        Width = 415
        Height = 21
        DataField = 'DESCRIBE'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EditFORMAPAGO: TDBEdit
        Left = 28
        Top = 26
        Width = 69
        Height = 21
        DataField = 'FORMAPAGO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object RadioGroupCLASE: TDBRadioGroup
        Left = 200
        Top = 56
        Width = 101
        Height = 56
        Caption = ' Unidades'
        DataField = 'CLASE'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          'D'#237'as'
          'Meses')
        ParentFont = False
        TabOrder = 4
        Values.Strings = (
          'D'
          'M')
      end
      object EditINTERVALO: TDBEdit
        Left = 28
        Top = 69
        Width = 45
        Height = 21
        DataField = 'INTERVALO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EditNUMVENCI: TDBEdit
        Left = 113
        Top = 69
        Width = 45
        Height = 21
        DataField = 'NUMVENCI'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object CheckBoxOBSOLETO: TDBCheckBox
        Left = 319
        Top = 70
        Width = 97
        Height = 17
        Caption = 'Obsoleto'
        DataField = 'OBSOLETO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object DBGrid: TDBGrid
      Left = 1
      Top = 125
      Width = 450
      Height = 275
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
    object PnlBtn: TPanel
      Left = 451
      Top = 125
      Width = 119
      Height = 275
      Align = alRight
      BevelInner = bvLowered
      BorderStyle = bsSingle
      Color = clSilver
      TabOrder = 2
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
  end
  object DataSource: TDataSource
    AutoEdit = False
    Left = 200
    Top = 210
  end
end
