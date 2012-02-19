object WBalAcumulados: TWBalAcumulados
  Left = 426
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  ClientHeight = 483
  ClientWidth = 592
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Shape1: TShape
    Left = 24
    Top = 33
    Width = 516
    Height = 1
    Pen.Color = 7552051
  end
  object lTitulo: TLabel
    Left = 24
    Top = 13
    Width = 192
    Height = 19
    Caption = 'Balance de Acumulados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Formulario: TfcImageForm
    Left = 10
    Top = 10
    Width = 572
    Height = 463
    Align = alClient
    Picture.Data = {07544269746D617000000000}
    DragTolerance = 5
    RegionData = {00000000}
  end
  object Datos: TGroupBox
    Left = 24
    Top = 37
    Width = 548
    Height = 398
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object GroupBox4: TGroupBox
      Left = 18
      Top = 331
      Width = 516
      Height = 62
      Caption = ' Datos adicionales '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label4: TLabel
        Left = 11
        Top = 42
        Width = 92
        Height = 14
        Caption = 'Fecha a imprimir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 21
        Width = 104
        Height = 14
        Caption = 'Moneda Impresi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lSubtotales1: TLabel
        Left = 251
        Top = 40
        Width = 100
        Height = 14
        Caption = 'Subtotales al nivel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lSubtotales2: TLabel
        Left = 398
        Top = 40
        Width = 18
        Height = 14
        Caption = 'y al'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FechaImprimir: TwwDBDateTimePicker
        Left = 123
        Top = 38
        Width = 89
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'FechaImprimir'
        DataSource = SFiltro
        Epoch = 1950
        ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          80008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FF
          FFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000BFBFBFBFBFBFBFBFBFBFBFBFFF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000}
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object eMoneda: TwwDBComboBox
        Left = 123
        Top = 17
        Width = 89
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        ShowMatchText = True
        DataField = 'Moneda'
        DataSource = SFiltro
        DropDownCount = 8
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 0
        Items.Strings = (
          'PESETA'#9'P'
          'EURO'#9'E')
        ParentFont = False
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object oConSubcuentas: TCheckBox
        Left = 251
        Top = 19
        Width = 117
        Height = 17
        Caption = 'Con subcuentas'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object eNivel1: TOvcDbNumericField
        Left = 363
        Top = 36
        Width = 25
        Height = 21
        DataField = 'Nivel1'
        DataSource = SFiltro
        CaretOvr.Shape = csBlock
        Controller = OvcController1
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [efoCaretToEnd, efoTrimBlanks]
        ParentFont = False
        PictureMask = '##'
        TabOrder = 3
        RangeHigh = {FFFFFF7F000000000000}
        RangeLow = {00000080000000000000}
      end
      object eNivel2: TOvcDbNumericField
        Left = 427
        Top = 36
        Width = 25
        Height = 21
        DataField = 'Nivel2'
        DataSource = SFiltro
        CaretOvr.Shape = csBlock
        Controller = OvcController1
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [efoCaretToEnd, efoTrimBlanks]
        ParentFont = False
        PictureMask = '##'
        TabOrder = 4
        RangeHigh = {FFFFFF7F000000000000}
        RangeLow = {00000080000000000000}
      end
    end
    object GroupBox2: TGroupBox
      Left = 18
      Top = 43
      Width = 516
      Height = 138
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label20: TLabel
        Left = 20
        Top = 30
        Width = 32
        Height = 14
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 139
        Top = 11
        Width = 35
        Height = 14
        Caption = 'Desde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 280
        Top = 10
        Width = 30
        Height = 14
        Caption = 'Hasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 20
        Top = 55
        Width = 96
        Height = 14
        Caption = 'Subcuenta desde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 84
        Top = 80
        Width = 30
        Height = 14
        Caption = 'hasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object eFechaDesde: TwwDBDateTimePicker
        Left = 123
        Top = 26
        Width = 89
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'FechaDesde'
        DataSource = SFiltro
        Epoch = 1950
        ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          80008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FF
          FFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000BFBFBFBFBFBFBFBFBFBFBFBFFF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000}
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object FiltroFechaHasta: TwwDBDateTimePicker
        Left = 259
        Top = 26
        Width = 89
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'FechaHasta'
        DataSource = SFiltro
        Epoch = 1950
        ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          80008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FF
          FFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F00
          00FFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF
          FFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000FFFFFFFF7F7F7F0000FFFFFFFF7F7F
          7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000BFBFBFBFBFBFBFBFBFBFBFBFFF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000}
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object FiltroCBDESCSUBCUENTAHasta: TwwDBLookupCombo
        Left = 222
        Top = 76
        Width = 248
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
        DataField = 'SubcuentaHasta'
        DataSource = SFiltro
        LookupTable = DMContaRef.QSubCuentasDesc
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo
        Left = 222
        Top = 51
        Width = 248
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
        DataField = 'SubcuentaDesde'
        DataSource = SFiltro
        LookupTable = DMContaRef.QSubCuentasDesc
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object FiltroCBSUBCUENTADesde: TwwDBLookupCombo
        Left = 123
        Top = 51
        Width = 100
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
        DataField = 'SubcuentaDesde'
        DataSource = SFiltro
        LookupTable = DMContaRef.QSubCuentas
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
      end
      object FiltroCBSUBCUENTAHasta: TwwDBLookupCombo
        Left = 123
        Top = 76
        Width = 100
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
        DataField = 'SubcuentaHasta'
        DataSource = SFiltro
        LookupTable = DMContaRef.QSubCuentas
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
      end
      object RGConcepto: TDBRadioGroup
        Left = 123
        Top = 99
        Width = 278
        Height = 35
        Caption = ' Clase de Conceptos '
        Columns = 3
        DataField = 'TipoConcepto'
        DataSource = SFiltro
        Items.Strings = (
          'Todos'
          'Normal'
          'Especial')
        TabOrder = 6
        Values.Strings = (
          'T'
          'N'
          'E')
      end
    end
    object RGAcumulacion: TRadioGroup
      Left = 135
      Top = 8
      Width = 272
      Height = 36
      Caption = ' ACUMULACION POR  '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Saldos '
        'Movimientos')
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 181
      Width = 516
      Height = 147
      Caption = ' Anal'#237'tica '
      TabOrder = 2
      object Label6: TLabel
        Left = 20
        Top = 19
        Width = 92
        Height = 13
        Caption = 'Cuenta Anal'#237'tica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 20
        Top = 70
        Width = 62
        Height = 13
        Caption = 'Delegaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 267
        Top = 70
        Width = 83
        Height = 13
        Caption = 'Departamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 20
        Top = 105
        Width = 43
        Height = 13
        Caption = 'Secci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 267
        Top = 105
        Width = 51
        Height = 13
        Caption = 'Proyecto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 123
        Top = 17
        Width = 100
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CUENTA'#9'10'#9'CUENTA'#9'F'
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'CUENTA'
        DataSource = SFiltro
        LookupTable = DMRef.QAnaliticas
        LookupField = 'CUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object eDelegacion: TwwDBLookupCombo
        Left = 19
        Top = 84
        Width = 229
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'ID_DELEGACION'
        DataSource = SFiltro
        LookupTable = DMRef.QDelegacionNom
        LookupField = 'ID_DELEGACION'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object eDepartamento: TwwDBLookupCombo
        Left = 267
        Top = 84
        Width = 229
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'ID_DEPARTAMENTO'
        DataSource = SFiltro
        LookupTable = DMRef.QDepartamentoNom
        LookupField = 'ID_DEPARTAMENTO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object eSeccion: TwwDBLookupCombo
        Left = 20
        Top = 119
        Width = 229
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'ID_SECCION'
        DataSource = SFiltro
        LookupTable = DMRef.QSeccionNom
        LookupField = 'ID_SECCION'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object eProyecto: TwwDBLookupCombo
        Left = 267
        Top = 119
        Width = 229
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'ID_PROYECTO'
        DataSource = SFiltro
        LookupTable = DMRef.QProyectoNom
        LookupField = 'ID_PROYECTO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo2: TwwDBLookupCombo
        Left = 222
        Top = 17
        Width = 274
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F'
          'CUENTA'#9'10'#9'CUENTA'#9'F')
        DataField = 'CUENTA'
        DataSource = SFiltro
        LookupTable = DMRef.QAnaliticasNom
        LookupField = 'CUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo3: TwwDBLookupCombo
        Left = 123
        Top = 37
        Width = 100
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CUENTA'#9'10'#9'CUENTA'#9'F'
          'NOMBRE'#9'30'#9'NOMBRE'#9'F')
        DataField = 'CUENTAH'
        DataSource = SFiltro
        LookupTable = DMRef.QAnaliticas
        LookupField = 'CUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo4: TwwDBLookupCombo
        Left = 222
        Top = 37
        Width = 274
        Height = 20
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMBRE'#9'30'#9'NOMBRE'#9'F'
          'CUENTA'#9'10'#9'CUENTA'#9'F')
        DataField = 'CUENTAH'
        DataSource = SFiltro
        LookupTable = DMRef.QAnaliticasNom
        LookupField = 'CUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  object fcIBCerrar: TfcImageBtn
    Left = 547
    Top = 17
    Width = 24
    Height = 17
    Cursor = crHandPoint
    Color = clNone
    DitherColor = clWhite
    DitherStyle = dsDither
    Image.Data = {
      424DFE0400000000000036000000280000001800000011000000010018000000
      0000C8040000000000000000000000000000000000007F645A62473D42281C35
      1B0F3C2216472D21472F23432B1F331D112D170B342114463326473427382518
      362314442F204A3625453120402C1A3D2C193D2D1C3B2D1B3427172D2214997F
      798369626B50465E42375B3E30593C2E53382A4F35294B3327564035533F3441
      2D22473125523B2C5138285C443254402E533F2D48331E422D18473321412E1F
      34251C352A22C3A7A0B3968D997C6E8365547B5A4A7F5F4C8564548568598D72
      648B7367826A5E745C50846B5B927867886D59836853836B558C765D8C735981
      684E7A5F4A624B3B47342C3F2F28D9B8A8D9B8A5CEAB97BD9981B58F77B69177
      B08C74A4846D82624F8468579B8170B69C8BBA9F8B9A7D687B5C457E60459E80
      63B69778C4A180BC9978A9886E8C6D58674C3E523A2ED5B09AE0BAA2E1B9A0D7
      AF92D5AB8ED3AB8EC39C80A9866C4E2E1743240F735542BDA28DB497825F4128
      391A015E3C1FB48F6DCAA37DD7AE87D2A883C19A7AA782687D5D4A5D4031DBB3
      97E1B99DDDB396CFA483CEA180D4A988CEA787BF9A7E7B594142230C4D301B92
      77628D705B46280F46270E896749D7AD88DDAF86DFAF85D8AA81CA9D7BB1866B
      86614D5F3D2DE0B699E6BC9FE2B697D3A685CA9D7BCEA481D2AB8BD2AD91A586
      6D6346314126124F3524452A16351A056E523ABD9D80DFB590D8A87ED5A379D3
      A27AC69876AD8267845E4C5E3B2DDEB69AE3BB9EE4BB9BDBB08FCFA483CAA180
      CCA688CCAB91BA9D888369584A33232F1A0B250E00452D1B927A66D0B299CDA7
      84C3976EC89A71D2A57FC49879A47C637B5A4A5C3F31E5BEA2E0BA9CDCB295D4
      AB8BCAA180C39C7CC49F83C5A68DD2B4A1927A684631222411022D1809604C3B
      A7917FC3A991CBA684C19871CFA47DDFB590C9A2829E7A627758495B4135E1BA
      9EE2BC9ED8AE91C49B7BC09776CCA585D0AC8EC7A98EB295806F57453C271838
      25163F2A1B4834237B6553BEA48CC4A481C8A47CCDA67FD2AB85C7A181A5846A
      765A49543D2EDDB598E3BB9EE0B797D5AA89D0A683D3AA89CBA585B9997C8266
      4E462E18452F1D796553735D4B3A220E452E188F775BCFB18ED0AC86CDA981CB
      A680BF9C7AA28265785D495A4131DFB696E3BA99E2B895DAAE89D6AB84D3A984
      C49E7BB18E6D694B2E43280E654B33B49C84A98F774F361C3D2207795D3ECBAE
      89CCAC83CBA87DC8A47CBE9A76A381637A5C435C3F2AE4BD9DE1BB99D9B18ECF
      A580CEA37CCEA57EC59F7CB895738D6E4F7E6146957A60C0A78DC0A58A937759
      816445957957BB9D7AC1A17DCAA77FCCA880C59F7CA986657C5B41573821E9C7
      AAE5C1A3DBB595D0AA88CFA784D2AC89D2AE8ACCAB8AC8AA8DC2A58ABFA48AC2
      A98FC9AE93CAAE90C7AB89C5A987BFA385C7AA8BD1B18ED6B28ED0AA88B89274
      8A664E61412AECCDB6EBCCB3E8C7ADE4C2A4E2BF9EE3C09FE2C0A2DEC0A3EDD0
      B5E0C7ADD6BEA6D5BDA5D9C0A6DBC1A3DFC3A4E3C7A9D8C0A8DEC4ACE2C4A9E0
      BEA0DBB799CCA78DA6846D82614DEBD2C2EFD5C4F4D9C5F3D7BFEFD1B8EBCEB3
      EBCDB4EAD0B8F0D8C2E3CEB9E2CCBAE9D4BFE9D2BCE0C8B0E4CCB0EDD6BCE6D2
      C1EBD4C5EDD2BEEACAB3E9C7B0E3C0ACC8A696A98879EBD5C9F2DBCCF8DFCFF6
      DDC9F2D5C0ECD0B8ECD1BCF0D8C2EBD5C3E6D2C0E7D5C4ECDBC8F0DAC8EED7C1
      F1DAC0F7E0CAE2CFC2E9D5CAF0D5C7F2D2BFF6D5C2F5D4C1DEBDAEC0A093}
    ParentClipping = False
    ShadeStyle = fbsNormal
    TabOrder = 1
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clNone
    OnClick = BtnEdtCancelarClick
    RegionData = {
      4000000020000000010000000200000020000000000000000000000018000000
      1100000001000000000000001800000001000000000000000100000018000000
      11000000}
    DownRegionData = {00000000}
  end
  object Panel3: TPanel
    Left = 0
    Top = 10
    Width = 10
    Height = 463
    Align = alLeft
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 473
    Width = 592
    Height = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 3
  end
  object Panel5: TPanel
    Left = 582
    Top = 10
    Width = 10
    Height = 463
    Align = alRight
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 4
  end
  object BtnEdtProcesar: TfcImageBtn
    Left = 398
    Top = 440
    Width = 83
    Height = 25
    Cursor = crHandPoint
    Caption = '&Procesar'
    Color = clNone
    DitherColor = clWhite
    DitherStyle = dsDither
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Image.Data = {
      424D5E1A0000000000003600000028000000520000001B000000010018000000
      0000281A0000000000000000000000000000000000006B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D520000}
    NumGlyphs = 0
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 5
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtProcesarClick
    OnMouseEnter = fcImageBtnMouseEnter
    OnMouseLeave = fcImageBtnMouseLeave
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
    DownRegionData = {00000000}
  end
  object BtnEdtCancelar: TfcImageBtn
    Left = 489
    Top = 440
    Width = 83
    Height = 25
    Cursor = crHandPoint
    Caption = '&Salir'
    Color = clNone
    DitherColor = clWhite
    DitherStyle = dsDither
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Image.Data = {
      424D5E1A0000000000003600000028000000520000001B000000010018000000
      0000281A0000000000000000000000000000000000006B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D52A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A596846B5D
      526B5D5200006B5D526B5D52A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A596846B5D526B5D5200006B5D
      526B5D52A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A596846B5D526B5D5200006B5D526B5D52A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A596
      84A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684A5
      9684A59684A59684A59684A59684A59684A59684A59684A59684A59684A59684
      A59684A596846B5D526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D5200006B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B
      5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D52
      6B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D
      526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D526B5D520000}
    NumGlyphs = 0
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 6
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtCancelarClick
    OnMouseEnter = fcImageBtnMouseEnter
    OnMouseLeave = fcImageBtnMouseLeave
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
    DownRegionData = {00000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 7
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 1900
    Left = 266
    Top = 12
  end
  object QFiltro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 6
  end
  object SFiltro: TDataSource
    DataSet = QFiltro
    Left = 384
    Top = 6
  end
end
