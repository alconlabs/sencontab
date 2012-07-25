object WCargaRapidaNominas: TWCargaRapidaNominas
  Left = 453
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Carga de Apuntes'
  ClientHeight = 530
  ClientWidth = 792
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Shape1: TShape
    Left = 24
    Top = 34
    Width = 741
    Height = 1
    Pen.Color = 7552051
  end
  object lTitulo: TLabel
    Left = 24
    Top = 13
    Width = 205
    Height = 19
    Caption = 'Carga r'#225'pida de N'#243'minas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 531
    Top = 189
    Width = 47
    Height = 13
    Caption = 'Importe'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Formulario: TfcImageForm
    Left = 10
    Top = 10
    Width = 772
    Height = 510
    Align = alClient
    Picture.Data = {07544269746D617000000000}
    DragTolerance = 5
    RegionData = {00000000}
  end
  object Paginas: TOvcNotebook
    Left = 24
    Top = 40
    Width = 742
    Height = 441
    ActiveTabFont.Charset = ANSI_CHARSET
    ActiveTabFont.Color = clNavy
    ActiveTabFont.Height = -11
    ActiveTabFont.Name = 'Tahoma'
    ActiveTabFont.Style = [fsBold]
    PageUsesTabColor = False
    Controller = OvcController1
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Asientos: TOvcTabPage
      Tag = 1
      Caption = 'Asientos'
      TabColor = 14275008
      TextColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      object GroupBox7: TGroupBox
        Left = 0
        Top = -227
        Width = 0
        Height = 135
        Align = alBottom
        Caption = ' AsientoTrabajador '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label37: TLabel
          Left = 10
          Top = 16
          Width = 182
          Height = 14
          Caption = 'Subcuenta de Sueldos y salarios '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 10
          Top = 54
          Width = 140
          Height = 14
          Caption = 'Subcuenta de Seg. Social '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 372
          Top = 54
          Width = 168
          Height = 14
          Caption = 'Subcuenta de Hacienda I.R.P.F. '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 10
          Top = 93
          Width = 119
          Height = 14
          Caption = 'Concepto de Asiento '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 372
          Top = 16
          Width = 202
          Height = 14
          Caption = 'Subcuenta de otras remuneraciones'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eSubctaSueldosSalarios: TwwDBLookupCombo
          Left = 10
          Top = 29
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTANOMSUELDO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastos
          LookupField = 'SUBCUENTA'
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
        object eDescSubctaSueldosSalarios: TwwDBLookupCombo
          Left = 105
          Top = 29
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTANOMSUELDO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastosDesc
          LookupField = 'SUBCUENTA'
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
        object eSubctaSS: TwwDBLookupCombo
          Left = 10
          Top = 67
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTANOMSST'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCuentas
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eDescSubctaSS: TwwDBLookupCombo
          Left = 105
          Top = 67
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTANOMSST'
          DataSource = SFichero
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
        object eSubctaIRPF: TwwDBLookupCombo
          Left = 372
          Top = 67
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTANOMIRPF'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCuentas
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eDescSubctaIRPF: TwwDBLookupCombo
          Left = 467
          Top = 67
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTANOMIRPF'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCuentasDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo9: TwwDBLookupCombo
          Left = 10
          Top = 106
          Width = 55
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'CTONOMT'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo8: TwwDBLookupCombo
          Left = 64
          Top = 106
          Width = 295
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTONOMT'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eSubctaOtras: TwwDBLookupCombo
          Left = 372
          Top = 29
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTAOTRAS'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastos
          LookupField = 'SUBCUENTA'
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
        object eDescSubctaOtras: TwwDBLookupCombo
          Left = 467
          Top = 29
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTAOTRAS'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastosDesc
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
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = -92
        Width = 0
        Height = 92
        Align = alBottom
        Caption = ' Asiento Empresa '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label43: TLabel
          Left = 10
          Top = 15
          Width = 230
          Height = 14
          Caption = 'Subcuenta de Gasto Seg. Social Empresa  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 10
          Top = 53
          Width = 146
          Height = 14
          Caption = 'Subcuenta de Seg. Social   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 372
          Top = 53
          Width = 119
          Height = 14
          Caption = 'Concepto de Asiento '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 372
          Top = 15
          Width = 47
          Height = 13
          Caption = 'Importe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 426
          Top = 66
          Width = 295
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CtoNomE'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eSubctaGastoSSEmpresa: TwwDBLookupCombo
          Left = 10
          Top = 28
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTANOMCARGO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastos
          LookupField = 'SUBCUENTA'
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
        object eDescSubctaGastoSSEmpresa: TwwDBLookupCombo
          Left = 105
          Top = 28
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTANOMCARGO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTAGastosDesc
          LookupField = 'SUBCUENTA'
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
        object eSubctaSSEmpresa: TwwDBLookupCombo
          Left = 10
          Top = 66
          Width = 96
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'SCTANOMSSE'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCuentas
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
        object eDescSubctaSSEmpresa: TwwDBLookupCombo
          Left = 105
          Top = 66
          Width = 254
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'SCTANOMSSE'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCuentasDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eEmpresa: TOvcDbNumericField
          Left = 372
          Top = 28
          Width = 102
          Height = 20
          DataField = 'IMPEMPRESA'
          DataSource = SFichero
          FieldType = ftFloat
          AutoSize = False
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
          Options = [efoForceOvertype]
          ParentFont = False
          PictureMask = '###,###,###.##'
          TabOrder = 2
          OnClick = ImporteClick
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 372
          Top = 66
          Width = 55
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'CtoNomE'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
          LookupField = 'ID_CONCEPTOS'
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
      end
      object Datos: TGroupBox
        Left = 0
        Top = 0
        Width = 0
        Height = 191
        Align = alClient
        Color = 14275008
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 120
          Top = 15
          Width = 66
          Height = 13
          Caption = 'Comentario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 9
          Top = 15
          Width = 33
          Height = 13
          Caption = 'Fecha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 378
          Top = 15
          Width = 92
          Height = 13
          Caption = 'Cuenta Anal'#237'tica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eFecha: TwwDBDateTimePicker
          Left = 9
          Top = 29
          Width = 89
          Height = 20
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'FECHA'
          DataSource = SFichero
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
        object GridEdtEmpleados: TwwDBGrid
          Left = 9
          Top = 58
          Width = 680
          Height = 121
          DittoAttributes.ShortCutDittoField = 0
          DittoAttributes.ShortCutDittoRecord = 0
          DittoAttributes.Options = []
          DisableThemesInTitle = False
          ControlType.Strings = (
            'SUJETO_IVA;CheckBox;S;N'
            'NO_PROTOCOLO;CheckBox;S;N'
            'COTIZA_POR_COEFICIENTES;CheckBox;S;N'
            'DEFINE_PARTICIPES;CheckBox;S;N'
            'TRAMITACION;CheckBox;S;N'
            'DESCRIPCION;CustomEdit;eOperacion;F'
            'ID_INSTRUMENTOS;CustomEdit;eOperacion'
            'BASE_ARANCEL;CustomEdit;eBaseArancel'
            'N;CheckBox;S;N')
          Selected.Strings = (
            'NOMINA'#9'10'#9'IMP. N'#211'MINA'#9'F'#9
            'IRPF'#9'10'#9'IRPF'#9#9
            'SSOCIAL'#9'10'#9'SSOCIAL'#9#9
            'NETO'#9'10'#9'NETO'#9#9
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9#9
            'DESCRIPCION'#9'30'#9'DESCRIPCION'#9'F'#9
            'N'#9'7'#9'N'#211'MINA'#9'F'#9)
          IniAttributes.Delimiter = ';;'
          TitleColor = 10841401
          OnCellChanged = GridEdtEmpleadosCellChanged
          FixedCols = 0
          ShowHorzScrollBar = False
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          BorderStyle = bsNone
          Color = 15596540
          DataSource = SEmpleados
          Font.Charset = ANSI_CHARSET
          Font.Color = 10657371
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyOptions = [dgEnterToTab, dgAllowInsert]
          Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
          ParentFont = False
          TabOrder = 4
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnKeyPress = GridEdtEmpleadosKeyPress
          PadColumnStyle = pcsPlain
        end
        object eComentario: TOvcDbPictureField
          Left = 120
          Top = 29
          Width = 240
          Height = 20
          DataField = 'COMENTARIO'
          DataSource = SFichero
          FieldType = ftString
          AutoSize = False
          CaretOvr.Shape = csBlock
          Controller = OvcController1
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Epoch = 1900
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 1
        end
        object eSubcuenta: TwwDBLookupCombo
          Left = 21
          Top = 114
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
          DataField = 'SUBCUENTA'
          DataSource = SEmpleados
          LookupTable = DMContaRef.QSubCTANominas
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loRowLines]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnNotInList = eSubcuentaNotInList
        end
        object eSubcuentaDesc: TwwDBLookupCombo
          Left = 120
          Top = 114
          Width = 217
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
          DataField = 'SUBCUENTA'
          DataSource = SEmpleados
          LookupTable = DMContaRef.QSubCTANominasDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loRowLines]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object PermAniadir: TfcShapeBtn
          Left = 701
          Top = 78
          Width = 23
          Height = 22
          Hint = 'A'#241'adir'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333300033333300333330F03333
            3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
            3300333330F033333300333330F0333333003333300033333300333333333333
            33003333333333333300}
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 7
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = BtnEdtAniadirClick
        end
        object PermBorrar: TfcShapeBtn
          Left = 701
          Top = 103
          Width = 23
          Height = 22
          Hint = 'Borrar'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333888888888F3333330F888888033333338F3F3F3F8F3333330F0707080
            33333338F8F8F8F8F3333330F070808033333338F8F8F8F8F3333330F0707080
            33333338F8F8F8F8F3333330F070808033333338F8F8F8F8F3333330F0707080
            333333F8F8F8F8F8F3F33030F070808030333838F8F8F8F8F8333300F0707080
            03333388F8F8F8F883333330F070808033333338F8F8F8F8F333333080808080
            33333338F8F8F8F8FF3333000000000003333388888888888F33330F77788888
            0333338FFFFFFFFF8F3333000000000003333388888888888333333330888033
            3333333338FFF8F3333333333000003333333333388888333333}
          NumGlyphs = 2
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 8
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = BtnEdtBorrarEmpleadoClick
        end
        object PermInicializar: TfcShapeBtn
          Left = 701
          Top = 128
          Width = 23
          Height = 22
          Hint = 'Inicializar'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F88888FFF333333999999999
            3333333888333888FF33339993808399933333883338F3888FF3399933000339
            9933388333888F3388F3399333808333993338833338333338FF993333333333
            399388F33333F333388F993333303333399388F33338FF333383993333808333
            333388F333888F333333993333101333333388F333888F3FFFFF993333000399
            999388FF33888F88888F3993330003399993383FF3888F38888F399933000333
            99933883FF888F3F888F339993808399999333883F383F88888F333999999999
            3393333888333888338333333999993333333333388888333333}
          NumGlyphs = 2
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 9
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = BtnEdtRestablecerClick
        end
        object eAnalitica: TwwDBLookupCombo
          Left = 378
          Top = 29
          Width = 100
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CUENTA'#9'10'#9'CUENTA'#9'F'
            'NOMBRE'#9'50'#9'NOMBRE'#9'F')
          DataField = 'CUENTA_ANALITICA'
          DataSource = SFichero
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
        object eAnaliticaNom: TwwDBLookupCombo
          Left = 478
          Top = 29
          Width = 245
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMBRE'#9'50'#9'NOMBRE'#9'F'
            'CUENTA'#9'10'#9'CUENTA'#9'F')
          DataField = 'CUENTA_ANALITICA'
          DataSource = SFichero
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
    object Movimientos: TOvcTabPage
      Tag = 1
      Caption = #218'ltimos Movimientos'
      TabColor = 14275008
      TextColor = clNavy
      object Label1: TLabel
        Left = 288
        Top = 381
        Width = 70
        Height = 14
        Caption = 'Subcuenta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBText1: TDBText
        Left = 362
        Top = 381
        Width = 362
        Height = 14
        DataField = 'DESCSUBCUENTA'
        DataSource = SMovimientos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GridEdtMovimientos: TwwDBGrid
        Left = 2
        Top = 8
        Width = 721
        Height = 341
        TabStop = False
        DittoAttributes.ShortCutDittoField = 0
        DittoAttributes.ShortCutDittoRecord = 0
        DittoAttributes.Options = []
        DisableThemesInTitle = False
        ControlType.Strings = (
          'SUJETO_IVA;CheckBox;S;N'
          'NO_PROTOCOLO;CheckBox;S;N'
          'COTIZA_POR_COEFICIENTES;CheckBox;S;N'
          'DEFINE_PARTICIPES;CheckBox;S;N'
          'TRAMITACION;CheckBox;S;N')
        PictureMasks.Strings = (
          'GASTO'#9'#'#9'T'#9'T')
        Selected.Strings = (
          'ASIENTO'#9'8'#9'ASIENTO'
          'APUNTE'#9'5'#9'APTE'
          'FECHA'#9'10'#9'FECHA'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'
          'ID_CONCEPTOS'#9'4'#9'CTO'
          'DescComentario'#9'47'#9'DESCRIPCION DEL APUNTE'
          'DEBEHABER'#9'2'#9'T'
          'IMPORTE'#9'14'#9'IMPORTE'
          'CONTRAPARTIDA'#9'11'#9'CONTRAP'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 10841401
        FixedCols = 1
        ShowHorzScrollBar = False
        BorderStyle = bsNone
        Color = 15596540
        DataSource = SMovimientos
        Font.Charset = ANSI_CHARSET
        Font.Color = 10657371
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnCalcCellColors = GridEdtMovimientosCalcCellColors
        OnDblClick = BtnEdtModificarClick
        OnMouseDown = GridEdtMovimientosMouseDown
        PadColumnStyle = pcsPlain
      end
      object BtnEdtModificar: TfcImageBtn
        Left = 8
        Top = 376
        Width = 88
        Height = 25
        Cursor = crHandPoint
        Caption = '&Modificar'
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
        ParentClipping = True
        ParentFont = False
        ShadeStyle = fbsNormal
        TabOrder = 1
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        TransparentColor = clLime
        OnClick = BtnEdtModificarClick
        OnMouseEnter = fcImageBtnMouseEnter
        OnMouseLeave = fcImageBtnMouseLeave
        RegionData = {
          3000000020000000010000000100000010000000000000000000000058000000
          1900000000000000000000005800000019000000}
        DownRegionData = {00000000}
      end
      object BtnEdtBorrarMovim: TfcImageBtn
        Left = 102
        Top = 376
        Width = 88
        Height = 25
        Cursor = crHandPoint
        Caption = '&Borrar'
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
        ParentClipping = True
        ParentFont = False
        ShadeStyle = fbsNormal
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        TransparentColor = clLime
        OnClick = BtnEdtBorrarMovimClick
        OnMouseEnter = fcImageBtnMouseEnter
        OnMouseLeave = fcImageBtnMouseLeave
        RegionData = {
          3000000020000000010000000100000010000000000000000000000058000000
          1900000000000000000000005800000019000000}
        DownRegionData = {00000000}
      end
      object BtnEdtMayor: TfcImageBtn
        Left = 195
        Top = 376
        Width = 88
        Height = 25
        Cursor = crHandPoint
        Caption = 'Ma&yor'
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
        ParentClipping = True
        ParentFont = False
        ShadeStyle = fbsNormal
        TabOrder = 3
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        TransparentColor = clLime
        OnClick = BtnEdtMayorClick
        OnMouseEnter = fcImageBtnMouseEnter
        OnMouseLeave = fcImageBtnMouseLeave
        RegionData = {
          3000000020000000010000000100000010000000000000000000000058000000
          1900000000000000000000005800000019000000}
        DownRegionData = {00000000}
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 10
    Width = 10
    Height = 510
    Align = alLeft
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 520
    Width = 792
    Height = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 1
  end
  object Panel5: TPanel
    Left = 782
    Top = 10
    Width = 10
    Height = 510
    Align = alRight
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 2
  end
  object BtnEdtGuardar: TfcImageBtn
    Left = 591
    Top = 488
    Width = 83
    Height = 25
    Cursor = crHandPoint
    Caption = 'Ac&eptar'
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
    TabOrder = 3
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtGuardarClick
    OnMouseEnter = fcImageBtnMouseEnter
    OnMouseLeave = fcImageBtnMouseLeave
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
    DownRegionData = {00000000}
  end
  object BtnEdtSalir: TfcImageBtn
    Left = 682
    Top = 488
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
    TabOrder = 5
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtSalirClick
    OnMouseEnter = fcImageBtnMouseEnter
    OnMouseLeave = fcImageBtnMouseLeave
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
    DownRegionData = {00000000}
  end
  object BtnEdtSubcuenta: TfcImageBtn
    Left = 33
    Top = 488
    Width = 88
    Height = 25
    Cursor = crHandPoint
    Caption = 'A'#241'adir S&ubcta'
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
      0000281A0000000000000000000000000000000000006F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F5000006F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F50A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A097806F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F50A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A097806F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F50A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A097806F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F50A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A097806F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F50A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A097806F5F
      506F5F5000006F5F506F5F50A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A097806F5F506F5F5000006F5F
      506F5F50A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A097806F5F506F5F5000006F5F506F5F50A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A097
      80A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780A0
      9780A09780A09780A09780A09780A09780A09780A09780A09780A09780A09780
      A09780A097806F5F506F5F5000006F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F5000006F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F
      5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F50
      6F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F
      506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F506F5F500000}
    NumGlyphs = 0
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 6
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtSubcuentaClick
    OnMouseEnter = fcImageBtnMouseEnter
    OnMouseLeave = fcImageBtnMouseLeave
    RegionData = {
      3000000020000000010000000100000010000000000000000000000058000000
      1900000000000000000000005800000019000000}
    DownRegionData = {00000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
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
    Left = 570
    Top = 5
  end
  object SFichero: TwwDataSource
    DataSet = QFichero
    Left = 386
    Top = 8
  end
  object QFichero: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 418
    Top = 8
  end
  object Transaccion: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 467
    Top = 5
  end
  object SMovimientos: TDataSource
    AutoEdit = False
    DataSet = QMovimientos
    Left = 531
    Top = 5
  end
  object QMovimientos: TIBTableSet
    Transaction = Transaccion
    OnCalcFields = QMovimientosCalcFields
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIARIO'
      'WHERE'
      
        '  ID_DIARIO                      =:old_ID_DIARIO                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO DIARIO'
      
        '  (RECARGO                        ,IVA                          ' +
        '  ,BASEIMPONIBLE                  ,IMPORTE                      ' +
        '  ,FECHA                          ,CUOTAIVA                     ' +
        '  ,CUOTARECARGO                   ,ASIENTONOMINA                ' +
        '  ,TIPOASIENTO                    ,CUENTA_ANALITICA             ' +
        '  ,ASIENTOPUNTEO                  ,ID_DIARIO                    ' +
        '  ,NUMEROFACTURA                  ,CONTRAPARTIDA                ' +
        '  ,SUBCUENTA                      ,ASIENTO                      ' +
        '  ,TIPODIARIO                     ,APUNTE                       ' +
        '  ,COMENTARIO                     ,ID_CONCEPTOS                 ' +
        '  ,PUNTEOIVA                      ,PUNTEO                       ' +
        '  ,DEBEHABER                      ,NIF                          ' +
        '  ,MONEDA                         ,EJERCICIO                    ' +
        '  ,SERIE                          )'
      'VALUES'
      
        '  (:RECARGO                        ,:IVA                        ' +
        '    ,:BASEIMPONIBLE                  ,:IMPORTE                  ' +
        '      ,:FECHA                          ,:CUOTAIVA               ' +
        '        ,:CUOTARECARGO                   ,:ASIENTONOMINA        ' +
        '          ,:TIPOASIENTO                    ,:CUENTA_ANALITICA   ' +
        '            ,:ASIENTOPUNTEO                  ,:ID_DIARIO        ' +
        '              ,:NUMEROFACTURA                  ,:CONTRAPARTIDA  ' +
        '                ,:SUBCUENTA                      ,:ASIENTO      ' +
        '                  ,:TIPODIARIO                     ,:APUNTE     ' +
        '                    ,:COMENTARIO                     ,:ID_CONCEP' +
        'TOS                   ,:PUNTEOIVA                      ,:PUNTEO ' +
        '                        ,:DEBEHABER                      ,:NIF  ' +
        '                          ,:MONEDA                         ,:EJE' +
        'RCICIO                      ,:SERIE                          )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIARIO'
      'WHERE'
      
        '  ID_DIARIO                      =?ID_DIARIO                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM DIARIO')
    ModifySQL.Strings = (
      'UPDATE DIARIO'
      'SET'
      
        '  RECARGO                        =:RECARGO                      ' +
        '   '
      
        '  ,IVA                            =:IVA                         ' +
        '    '
      
        '  ,BASEIMPONIBLE                  =:BASEIMPONIBLE               ' +
        '    '
      
        '  ,IMPORTE                        =:IMPORTE                     ' +
        '    '
      
        '  ,FECHA                          =:FECHA                       ' +
        '    '
      
        '  ,CUOTAIVA                       =:CUOTAIVA                    ' +
        '    '
      
        '  ,CUOTARECARGO                   =:CUOTARECARGO                ' +
        '    '
      
        '  ,ASIENTONOMINA                  =:ASIENTONOMINA               ' +
        '    '
      
        '  ,TIPOASIENTO                    =:TIPOASIENTO                 ' +
        '    '
      
        '  ,CUENTA_ANALITICA               =:CUENTA_ANALITICA            ' +
        '    '
      
        '  ,ASIENTOPUNTEO                  =:ASIENTOPUNTEO               ' +
        '    '
      
        '  ,NUMEROFACTURA                  =:NUMEROFACTURA               ' +
        '    '
      
        '  ,CONTRAPARTIDA                  =:CONTRAPARTIDA               ' +
        '    '
      
        '  ,SUBCUENTA                      =:SUBCUENTA                   ' +
        '    '
      
        '  ,ASIENTO                        =:ASIENTO                     ' +
        '    '
      
        '  ,TIPODIARIO                     =:TIPODIARIO                  ' +
        '    '
      
        '  ,APUNTE                         =:APUNTE                      ' +
        '    '
      
        '  ,COMENTARIO                     =:COMENTARIO                  ' +
        '    '
      
        '  ,ID_CONCEPTOS                   =:ID_CONCEPTOS                ' +
        '    '
      
        '  ,PUNTEOIVA                      =:PUNTEOIVA                   ' +
        '    '
      
        '  ,PUNTEO                         =:PUNTEO                      ' +
        '    '
      
        '  ,DEBEHABER                      =:DEBEHABER                   ' +
        '    '
      
        '  ,NIF                            =:NIF                         ' +
        '    '
      
        '  ,MONEDA                         =:MONEDA                      ' +
        '    '
      
        '  ,EJERCICIO                      =:EJERCICIO                   ' +
        '    '
      
        '  ,SERIE                          =:SERIE                       ' +
        '    '
      'WHERE'
      
        '  ID_DIARIO                      =:ID_DIARIO                    ' +
        '   ')
    TableName = 'DIARIO'
    Left = 499
    Top = 5
    object QMovimientosASIENTO: TIntegerField
      DisplayWidth = 8
      FieldName = 'ASIENTO'
      Origin = 'DIARIO.ASIENTO'
      DisplayFormat = '###,###,###'
    end
    object QMovimientosAPUNTE: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'APTE'
      DisplayWidth = 5
      FieldName = 'APUNTE'
      Origin = 'DIARIO.APUNTE'
    end
    object QMovimientosFECHA: TDateTimeField
      DisplayWidth = 10
      FieldName = 'FECHA'
      Origin = 'DIARIO.FECHA'
    end
    object QMovimientosSUBCUENTA: TIBStringField
      DisplayWidth = 10
      FieldName = 'SUBCUENTA'
      Origin = 'DIARIO.SUBCUENTA'
      Required = True
      Size = 10
    end
    object QMovimientosID_CONCEPTOS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'CTO'
      DisplayWidth = 4
      FieldName = 'ID_CONCEPTOS'
      Origin = 'DIARIO.ID_CONCEPTOS'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QMovimientosDescComentario: TStringField
      DisplayLabel = 'DESCRIPCION DEL APUNTE'
      DisplayWidth = 47
      FieldKind = fkCalculated
      FieldName = 'DescComentario'
      Size = 60
      Calculated = True
    end
    object QMovimientosDEBEHABER: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'T'
      DisplayWidth = 2
      FieldName = 'DEBEHABER'
      Origin = 'DIARIO.DEBEHABER'
      FixedChar = True
      Size = 1
    end
    object QMovimientosIMPORTE: TFloatField
      DisplayWidth = 14
      FieldName = 'IMPORTE'
      Origin = 'DIARIO.IMPORTE'
      DisplayFormat = '###,###,##0.#0'
    end
    object QMovimientosCONTRAPARTIDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'CONTRAP'
      DisplayWidth = 11
      FieldName = 'CONTRAPARTIDA'
      Origin = 'DIARIO.CONTRAPARTIDA'
      Size = 10
    end
    object QMovimientosCOMENTARIO: TIBStringField
      DisplayWidth = 40
      FieldName = 'COMENTARIO'
      Origin = 'DIARIO.COMENTARIO'
      Visible = False
      Size = 40
    end
    object QMovimientosNUMEROFACTURA: TIBStringField
      DisplayWidth = 10
      FieldName = 'NUMEROFACTURA'
      Origin = 'DIARIO.NUMEROFACTURA'
      Visible = False
      Size = 10
    end
    object QMovimientosCUENTA_ANALITICA: TIBStringField
      DisplayWidth = 10
      FieldName = 'CUENTA_ANALITICA'
      Origin = 'DIARIO.CUENTA_ANALITICA'
      Visible = False
      Size = 10
    end
    object QMovimientosDESCCONCEPTO: TIBStringField
      DisplayWidth = 30
      FieldName = 'DESCCONCEPTO'
      Origin = 'CONCEPTOS.DESCRIPCION'
      Visible = False
      Size = 30
    end
    object QMovimientosDESCSUBCUENTA: TIBStringField
      DisplayWidth = 80
      FieldName = 'DESCSUBCUENTA'
      Origin = 'SUBCTAS.DESCRIPCION'
      Visible = False
      Size = 80
    end
    object QMovimientosABREVIATURA: TIBStringField
      DisplayWidth = 10
      FieldName = 'ABREVIATURA'
      Origin = 'SUBCTAS.ABREVIATURA'
      Visible = False
      Size = 10
    end
    object QMovimientosEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
      Origin = 'DIARIO.EJERCICIO'
    end
    object QMovimientosSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'DIARIO.SERIE'
      Size = 5
    end
  end
  object SEmpleados: TwwDataSource
    DataSet = QEmpleados
    Left = 626
    Top = 14
  end
  object QEmpleados: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = QEmpleadosCalcFields
    Left = 656
    Top = 14
    object QEmpleadosNOMINA: TFloatField
      DisplayLabel = 'IMP. N'#211'MINA'
      DisplayWidth = 10
      FieldName = 'NOMINA'
    end
    object QEmpleadosIRPF: TFloatField
      DisplayWidth = 10
      FieldName = 'IRPF'
    end
    object QEmpleadosSSOCIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'SSOCIAL'
    end
    object QEmpleadosNETO: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'NETO'
      Calculated = True
    end
    object QEmpleadosSUBCUENTA: TStringField
      DisplayWidth = 10
      FieldName = 'SUBCUENTA'
      Size = 10
    end
    object QEmpleadosDESCRIPCION: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCRIPCION'
      LookupDataSet = DMContaRef.QSubCTANominas
      LookupKeyFields = 'SUBCUENTA'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'SUBCUENTA'
      Size = 80
      Lookup = True
    end
    object QEmpleadosN: TStringField
      DisplayLabel = 'N'#211'MINA'
      DisplayWidth = 7
      FieldName = 'N'
      Size = 1
    end
  end
end
