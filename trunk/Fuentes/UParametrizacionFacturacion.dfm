object WParametrizacionFacturacion: TWParametrizacionFacturacion
  Left = 388
  Top = 209
  BorderStyle = bsNone
  Caption = 'Parametrizaci'#243'n'
  ClientHeight = 504
  ClientWidth = 792
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 22
    Top = 13
    Width = 245
    Height = 19
    Caption = 'Parametrizaci'#243'n - Facturaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 22
    Top = 34
    Width = 720
    Height = 1
    Pen.Color = clNavy
  end
  object Label89: TLabel
    Left = 626
    Top = 108
    Width = 44
    Height = 14
    Caption = 'N'#250'mero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Formulario: TfcImageForm
    Left = 10
    Top = 10
    Width = 772
    Height = 484
    Align = alClient
    Picture.Data = {07544269746D617000000000}
    DragTolerance = 5
    RegionData = {00000000}
  end
  object Paginas: TOvcNotebook
    Left = 22
    Top = 37
    Width = 749
    Height = 417
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
    TabOrder = 0
    object Ventas: TOvcTabPage
      Tag = 1
      Caption = '&Ventas'
      TabColor = 14275008
      TextColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      object PaginasVentas: TOvcNotebook
        Left = 0
        Top = 0
        Width = 746
        Height = 394
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clNavy
        ActiveTabFont.Height = -11
        ActiveTabFont.Name = 'Tahoma'
        ActiveTabFont.Style = [fsBold]
        TabOrientation = toBottom
        Align = alClient
        Controller = OvcController1
        Color = 14275008
        TabOrder = 0
        object RegGeneral: TOvcTabPage
          Tag = 1
          Caption = 'R'#233'gimen General'
          TabColor = 14275008
          TextColor = clNavy
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 743
            Height = 371
            Align = alClient
            TabOrder = 0
            object Label7: TLabel
              Left = 452
              Top = 13
              Width = 117
              Height = 14
              Caption = 'Concepto IVA Normal'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 15
              Top = 13
              Width = 122
              Height = 14
              Caption = 'Subcuenta IVA Normal'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 15
              Top = 133
              Width = 120
              Height = 14
              Caption = 'Subcuenta IVA Exento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 452
              Top = 53
              Width = 129
              Height = 14
              Caption = 'Concepto IVA Reducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 15
              Top = 53
              Width = 134
              Height = 14
              Caption = 'Subcuenta IVA Reducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 452
              Top = 93
              Width = 160
              Height = 14
              Caption = 'Concepto IVA Superreducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 15
              Top = 93
              Width = 167
              Height = 14
              Caption = 'Subcuenta IVA SuperReducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 452
              Top = 133
              Width = 115
              Height = 14
              Caption = 'Concepto IVA Exento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 15
              Top = 173
              Width = 234
              Height = 14
              Caption = 'Subcuenta IVA Intracomunitario Soportado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 452
              Top = 173
              Width = 169
              Height = 14
              Caption = 'Concepto IVA Intracomunitario'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 15
              Top = 249
              Width = 117
              Height = 14
              Caption = 'Subcuenta de Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 452
              Top = 249
              Width = 112
              Height = 14
              Caption = 'Concepto de Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label47: TLabel
              Left = 15
              Top = 289
              Width = 180
              Height = 14
              Caption = 'Subcuenta de Devoluci'#243'n Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label51: TLabel
              Left = 452
              Top = 289
              Width = 175
              Height = 14
              Caption = 'Concepto de Devoluci'#243'n Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label52: TLabel
              Left = 452
              Top = 328
              Width = 119
              Height = 14
              Caption = 'Concepto de Clientes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label95: TLabel
              Left = 15
              Top = 212
              Width = 244
              Height = 14
              Caption = 'Subcuenta IVA Intracomunitario Repercutido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 669
              Top = 13
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOIVANORMAL'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 669
              Top = 53
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOIVAREDUCIDO'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 669
              Top = 133
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOIVAEXENTO'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText4: TDBText
              Left = 669
              Top = 93
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOIVASUPER'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText5: TDBText
              Left = 669
              Top = 173
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOIVAINTRA'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText6: TDBText
              Left = 669
              Top = 249
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOVENTAS'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText7: TDBText
              Left = 669
              Top = 289
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTODEVOLUCION'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText8: TDBText
              Left = 669
              Top = 328
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOCLIENTES'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CBDESCSUBCUENTA8: TwwDBLookupCombo
              Left = 114
              Top = 147
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVAEXENTO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBDESCSUBCUENTA7: TwwDBLookupCombo
              Left = 114
              Top = 27
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVANORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object eSubctaVentasCorredorDesc: TwwDBLookupCombo
              Left = 452
              Top = 27
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOIVANORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
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
            object CBSUBCUENTA7: TwwDBLookupCombo
              Left = 15
              Top = 27
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVANORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA8: TwwDBLookupCombo
              Left = 15
              Top = 147
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVAEXENTO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 114
              Top = 67
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVAREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 452
              Top = 67
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOIVAREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
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
            object CBSUBCUENTA1: TwwDBLookupCombo
              Left = 15
              Top = 67
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVAREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 114
              Top = 107
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVASUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 452
              Top = 107
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOIVASUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
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
            object CBSUBCUENTA2: TwwDBLookupCombo
              Left = 15
              Top = 107
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVASUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo7: TwwDBLookupCombo
              Left = 452
              Top = 147
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOIVAEXENTO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 11
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo9: TwwDBLookupCombo
              Left = 114
              Top = 187
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVAINTRADEDUCIBLE'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 13
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA3: TwwDBLookupCombo
              Left = 15
              Top = 187
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVAINTRADEDUCIBLE'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVADeducible
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 12
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo15: TwwDBLookupCombo
              Left = 452
              Top = 187
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOIVAINTRA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 14
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo23: TwwDBLookupCombo
              Left = 114
              Top = 263
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAVENTAS'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAVentasDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 18
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA4: TwwDBLookupCombo
              Left = 15
              Top = 263
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAVENTAS'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAVentas
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 17
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo26: TwwDBLookupCombo
              Left = 452
              Top = 263
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOVENTAS'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 19
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo34: TwwDBLookupCombo
              Left = 114
              Top = 303
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTADEVOLUCION'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCuentasDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 21
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA5: TwwDBLookupCombo
              Left = 15
              Top = 303
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTADEVOLUCION'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCuentas
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 20
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo36: TwwDBLookupCombo
              Left = 452
              Top = 303
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTODEVOLUCION'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 22
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo37: TwwDBLookupCombo
              Left = 452
              Top = 342
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOCLIENTES'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 23
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA32: TwwDBLookupCombo
              Left = 15
              Top = 226
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVAINTRA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 15
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo31: TwwDBLookupCombo
              Left = 114
              Top = 226
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVAINTRA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              AutoSelect = False
              ParentFont = False
              TabOrder = 16
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object RecargoEq: TOvcTabPage
          Tag = 1
          Caption = 'Rec.Equivalencia / Otras'
          TabColor = 14275008
          TextColor = clNavy
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 743
            Height = 144
            Align = alTop
            Caption = ' Recargo de Equivalencia '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label56: TLabel
              Left = 452
              Top = 19
              Width = 117
              Height = 14
              Caption = 'Concepto IVA Normal'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label57: TLabel
              Left = 15
              Top = 19
              Width = 122
              Height = 14
              Caption = 'Subcuenta IVA Normal'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label59: TLabel
              Left = 452
              Top = 59
              Width = 129
              Height = 14
              Caption = 'Concepto IVA Reducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label61: TLabel
              Left = 15
              Top = 59
              Width = 134
              Height = 14
              Caption = 'Subcuenta IVA Reducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label64: TLabel
              Left = 452
              Top = 99
              Width = 160
              Height = 14
              Caption = 'Concepto IVA Superreducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label65: TLabel
              Left = 15
              Top = 99
              Width = 167
              Height = 14
              Caption = 'Subcuenta IVA SuperReducido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText9: TDBText
              Left = 669
              Top = 19
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTORECNORMAL'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText10: TDBText
              Left = 669
              Top = 59
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTORECREDUCIDO'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText11: TDBText
              Left = 669
              Top = 99
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTORECSUPER'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object wwDBLookupCombo39: TwwDBLookupCombo
              Left = 114
              Top = 33
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTARECNORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
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
            object wwDBLookupCombo40: TwwDBLookupCombo
              Left = 452
              Top = 33
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTORECNORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
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
            object CBSUBCUENTA6: TwwDBLookupCombo
              Left = 15
              Top = 33
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTARECNORMAL'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
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
            object wwDBLookupCombo43: TwwDBLookupCombo
              Left = 114
              Top = 73
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTARECREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
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
            object wwDBLookupCombo44: TwwDBLookupCombo
              Left = 452
              Top = 73
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTORECREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
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
            object CBSUBCUENTA9: TwwDBLookupCombo
              Left = 15
              Top = 73
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTARECREDUCIDO'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
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
            object wwDBLookupCombo46: TwwDBLookupCombo
              Left = 114
              Top = 113
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTARECSUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
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
            object wwDBLookupCombo47: TwwDBLookupCombo
              Left = 452
              Top = 113
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTORECSUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
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
            object wwDBLookupCombo48: TwwDBLookupCombo
              Left = 15
              Top = 113
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTARECSUPER'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
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
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 144
            Width = 743
            Height = 227
            Align = alClient
            Caption = ' Otras '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label36: TLabel
              Left = 452
              Top = 60
              Width = 159
              Height = 14
              Caption = 'Concepto Recibos de Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label53: TLabel
              Left = 452
              Top = 17
              Width = 181
              Height = 14
              Caption = 'Concepto de Gen'#233'rica de Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label54: TLabel
              Left = 15
              Top = 17
              Width = 186
              Height = 14
              Caption = 'Subcuenta de Gen'#233'rica de Ventas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label55: TLabel
              Left = 15
              Top = 60
              Width = 101
              Height = 14
              Caption = 'Subcuenta de Caja'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText12: TDBText
              Left = 669
              Top = 17
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTOCOBROF'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText13: TDBText
              Left = 669
              Top = 60
              Width = 65
              Height = 14
              Alignment = taRightJustify
              DataField = 'CTORECIBOVENTAS'
              DataSource = DSFichero
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label97: TLabel
              Left = 15
              Top = 100
              Width = 143
              Height = 14
              Caption = 'Subcuenta IVA Exento CEE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label98: TLabel
              Left = 15
              Top = 140
              Width = 115
              Height = 14
              Caption = 'Subcuenta Intereses'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label99: TLabel
              Left = 15
              Top = 180
              Width = 139
              Height = 14
              Caption = 'Subcuenta Exportaciones'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object wwDBLookupCombo8: TwwDBLookupCombo
              Left = 114
              Top = 32
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'VGENERICA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCtaClientesDesc
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
            object wwDBLookupCombo22: TwwDBLookupCombo
              Left = 452
              Top = 32
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTOCOBROF'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
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
            object wwDBLookupCombo29: TwwDBLookupCombo
              Left = 452
              Top = 74
              Width = 282
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
              DataField = 'CTORECIBOVENTAS'
              DataSource = DSFichero
              LookupTable = DMContaRef.QConceptosDesc
              LookupField = 'ID_CONCEPTOS'
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
            object CBSUBCUENTA10: TwwDBLookupCombo
              Left = 15
              Top = 32
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'VGENERICA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCtaClientes
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
            object wwDBLookupCombo32: TwwDBLookupCombo
              Left = 114
              Top = 74
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SUBCAJA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTABancoDesc
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
            object CBSUBCUENTA16: TwwDBLookupCombo
              Left = 15
              Top = 74
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SUBCAJA'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTABanco
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
            object wwDBLookupCombo14: TwwDBLookupCombo
              Left = 114
              Top = 114
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAIVAEXENTOCEE'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
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
            object CBSUBCUENTA36: TwwDBLookupCombo
              Left = 15
              Top = 114
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAIVAEXENTOCEE'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
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
            object wwDBLookupCombo33: TwwDBLookupCombo
              Left = 114
              Top = 154
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAINTERESES'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
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
            object CBSUBCUENTA37: TwwDBLookupCombo
              Left = 15
              Top = 154
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAINTERESES'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
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
            object wwDBLookupCombo41: TwwDBLookupCombo
              Left = 114
              Top = 194
              Width = 295
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
              DataField = 'SCTAEXPORTACIONES'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object CBSUBCUENTA38: TwwDBLookupCombo
              Left = 15
              Top = 194
              Width = 100
              Height = 21
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
                'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
              DataField = 'SCTAEXPORTACIONES'
              DataSource = DSFichero
              LookupTable = DMContaRef.QSubCTAIVARepercutido
              LookupField = 'SUBCUENTA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 11
              AutoDropDown = True
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
    end
    object Compras: TOvcTabPage
      Tag = 1
      Caption = '&Compras'
      TabColor = 14275008
      TextColor = clNavy
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 746
        Height = 394
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
        object DBText20: TDBText
          Left = 663
          Top = 294
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOPROVINTRA'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 15
          Top = 16
          Width = 148
          Height = 14
          Caption = 'Subcuenta de I.V.A. Normal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 15
          Top = 61
          Width = 160
          Height = 14
          Caption = 'Subcuenta de I.V.A. Reducido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 15
          Top = 108
          Width = 191
          Height = 14
          Caption = 'Subcuenta de I.V.A. Superreducido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 15
          Top = 156
          Width = 146
          Height = 14
          Caption = 'Subcuenta de I.V.A. Exento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 446
          Top = 16
          Width = 126
          Height = 14
          Caption = 'Concepto I.V.A. Normal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 446
          Top = 61
          Width = 138
          Height = 14
          Caption = 'Concepto I.V.A. Reducido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 446
          Top = 108
          Width = 169
          Height = 14
          Caption = 'Concepto I.V.A. Superreducido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 446
          Top = 341
          Width = 193
          Height = 14
          Caption = 'Concepto de Gen'#233'rica de Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 15
          Top = 341
          Width = 198
          Height = 14
          Caption = 'Subcuenta de Gen'#233'rica de Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 446
          Top = 155
          Width = 124
          Height = 14
          Caption = 'Concepto I.V.A. Exento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 446
          Top = 202
          Width = 124
          Height = 14
          Caption = 'Concepto de Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 15
          Top = 202
          Width = 129
          Height = 14
          Caption = 'Subcuenta de Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 446
          Top = 250
          Width = 145
          Height = 14
          Caption = 'Concepto de Proveedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label83: TLabel
          Left = 446
          Top = 294
          Width = 239
          Height = 14
          Caption = 'Concepto de Proveedores Intracomunitario'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label93: TLabel
          Left = 15
          Top = 250
          Width = 234
          Height = 14
          Caption = 'Subcuenta IVA Intracomunitario Soportado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label94: TLabel
          Left = 15
          Top = 294
          Width = 244
          Height = 14
          Caption = 'Subcuenta IVA Intracomunitario Repercutido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText14: TDBText
          Left = 663
          Top = 16
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOIVACNORMAL'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText15: TDBText
          Left = 663
          Top = 61
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOIVACREDUCIDO'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText16: TDBText
          Left = 663
          Top = 108
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOIVACSUPER'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText17: TDBText
          Left = 663
          Top = 155
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOIVACEXENTO'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText18: TDBText
          Left = 663
          Top = 202
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOCOMPRAS'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText19: TDBText
          Left = 663
          Top = 250
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOPROVEEDORES'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText21: TDBText
          Left = 663
          Top = 341
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOPAGOF'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBDESCSUBCUENTA15: TwwDBLookupCombo
          Left = 114
          Top = 355
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'VGENERICAC'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAProveedoresDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 22
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBDESCSUBCUENTA14: TwwDBLookupCombo
          Left = 114
          Top = 171
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACEXENTO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBDESCSUBCUENTA13: TwwDBLookupCombo
          Left = 114
          Top = 122
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACSUPER'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
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
        object CBDESCSUBCUENTA12: TwwDBLookupCombo
          Left = 114
          Top = 76
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACREDUCIDO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
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
        object CBDESCSUBCUENTA11: TwwDBLookupCombo
          Left = 114
          Top = 31
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACNORMAL'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
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
        object CBSUBCUENTA11: TwwDBLookupCombo
          Left = 15
          Top = 31
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACNORMAL'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducible
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
        object CBSUBCUENTA12: TwwDBLookupCombo
          Left = 15
          Top = 76
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACREDUCIDO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducible
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
        object CBSUBCUENTA13: TwwDBLookupCombo
          Left = 15
          Top = 122
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACSUPER'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducible
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
        object CBSUBCUENTA14: TwwDBLookupCombo
          Left = 15
          Top = 171
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACEXENTO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducible
          LookupField = 'SUBCUENTA'
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
        object wwDBLookupCombo28: TwwDBLookupCombo
          Left = 446
          Top = 31
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOIVACNORMAL'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object eDescConcepto: TwwDBLookupCombo
          Left = 446
          Top = 76
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOIVACREDUCIDO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
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
        object wwDBLookupCombo11: TwwDBLookupCombo
          Left = 446
          Top = 122
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOIVACSUPER'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
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
        object wwDBLookupCombo30: TwwDBLookupCombo
          Left = 446
          Top = 355
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOPAGOF'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 23
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBSUBCUENTA15: TwwDBLookupCombo
          Left = 15
          Top = 355
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'VGENERICAC'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAProveedores
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 21
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo13: TwwDBLookupCombo
          Left = 446
          Top = 169
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOIVACEXENTO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo20: TwwDBLookupCombo
          Left = 114
          Top = 216
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTACOMPRAS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTACompraDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 13
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo24: TwwDBLookupCombo
          Left = 446
          Top = 216
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOCOMPRAS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 14
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBSUBCUENTA17: TwwDBLookupCombo
          Left = 15
          Top = 216
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTACOMPRAS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTACompra
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo38: TwwDBLookupCombo
          Left = 446
          Top = 264
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOPROVEEDORES'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 17
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo6: TwwDBLookupCombo
          Left = 446
          Top = 308
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOPROVINTRA'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 20
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo12: TwwDBLookupCombo
          Left = 114
          Top = 264
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACINTRADEDUCIBLE'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducibleDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 16
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBSUBCUENTA33: TwwDBLookupCombo
          Left = 15
          Top = 264
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACINTRADEDUCIBLE'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVADeducible
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 15
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo21: TwwDBLookupCombo
          Left = 114
          Top = 308
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAIVACINTRAREPERCUTIDO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVARepercutidoDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 19
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBSUBCUENTA34: TwwDBLookupCombo
          Left = 15
          Top = 308
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAIVACINTRAREPERCUTIDO'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAIVARepercutido
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 18
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
    object CarteraEfectos: TOvcTabPage
      Tag = 1
      Caption = 'Cartera &Efectos'
      TabColor = 14275008
      TextColor = clNavy
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 746
        Height = 394
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
        object Label9: TLabel
          Left = 15
          Top = 179
          Width = 167
          Height = 14
          Caption = 'Subcuenta Remesa de Efectos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 446
          Top = 126
          Width = 205
          Height = 14
          Caption = 'Concepto de Deudas por Descuentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 446
          Top = 178
          Width = 179
          Height = 14
          Caption = 'Concepto de Remesa de Efectos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText23: TDBText
          Left = 663
          Top = 126
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTODEUDASDESCUENTOS'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText31: TDBText
          Left = 663
          Top = 178
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOREMESAEFECTOS'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 15
          Top = 22
          Width = 175
          Height = 14
          Caption = 'Subcuenta Efectos Comerciales'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 15
          Top = 74
          Width = 250
          Height = 14
          Caption = 'Subcuenta Efectos Comerciales Descontados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 15
          Top = 126
          Width = 193
          Height = 14
          Caption = 'Subcuenta Deudas por Descuentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 446
          Top = 22
          Width = 187
          Height = 14
          Caption = 'Concepto de Efectos Comerciales'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText22: TDBText
          Left = 663
          Top = 22
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTOEFECTOSCOMERCIALES'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwDBLookupCombo17: TwwDBLookupCombo
          Left = 114
          Top = 194
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAREMESAEFECTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTABancoDesc
          LookupField = 'SUBCUENTA'
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
        object CBSUBCUENTA18: TwwDBLookupCombo
          Left = 15
          Top = 194
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAREMESAEFECTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTABanco
          LookupField = 'SUBCUENTA'
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
        object wwDBLookupCombo53: TwwDBLookupCombo
          Left = 446
          Top = 140
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTODEUDASDESCUENTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object wwDBLookupCombo58: TwwDBLookupCombo
          Left = 446
          Top = 192
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOREMESAEFECTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CBSUBCUENTA39: TwwDBLookupCombo
          Left = 15
          Top = 37
          Width = 100
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAEFECTOSCOMERCIALES'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientes
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
        object wwDBLookupCombo35: TwwDBLookupCombo
          Left = 114
          Top = 37
          Width = 295
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAEFECTOSCOMERCIALES'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientesDesc
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
        object CBSUBCUENTA30: TwwDBLookupCombo
          Left = 15
          Top = 89
          Width = 100
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTAEFECTDESCONTADOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientes
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
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 114
          Top = 89
          Width = 295
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTAEFECTDESCONTADOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientesDesc
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
        object CBSUBCUENTA31: TwwDBLookupCombo
          Left = 15
          Top = 140
          Width = 100
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SCTADEUDASDESCUENTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTABanco
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
        object wwDBLookupCombo10: TwwDBLookupCombo
          Left = 114
          Top = 140
          Width = 295
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SCTADEUDASDESCUENTOS'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTABancoDesc
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
        object wwDBLookupCombo16: TwwDBLookupCombo
          Left = 446
          Top = 37
          Width = 282
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTOEFECTOSCOMERCIALES'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object DBCheckBox2: TDBCheckBox
          Left = 15
          Top = 256
          Width = 300
          Height = 17
          Caption = 'Desc. Cliente en Enlace Recibos Ventas'
          DataField = 'DESCCLI_CARTERAEFECTOS'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 15
        Top = 296
        Width = 329
        Height = 17
        Caption = 'Desc. Proveedor en Enlace Recibos Compras'
        DataField = 'DESCPROV_CARTERAEFECTOS'
        DataSource = DSFichero
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object Otras: TOvcTabPage
      Tag = 1
      Caption = '&Otras'
      TabColor = 14275008
      TextColor = clNavy
      object Label73: TLabel
        Left = 22
        Top = 237
        Width = 161
        Height = 14
        Caption = 'Subcuenta de Hacienda I.V.A. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label75: TLabel
        Left = 446
        Top = 237
        Width = 188
        Height = 14
        Caption = 'Concepto Asiento trimestral I.V.A.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label96: TLabel
        Left = 22
        Top = 275
        Width = 203
        Height = 14
        Caption = 'Subcuenta Gen'#233'rica Intracomunitaria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText28: TDBText
        Left = 646
        Top = 237
        Width = 65
        Height = 14
        Alignment = taRightJustify
        DataField = 'CTOHACIVA'
        DataSource = DSFichero
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label101: TLabel
        Left = 22
        Top = 314
        Width = 94
        Height = 14
        Caption = 'Subcuenta Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label102: TLabel
        Left = 446
        Top = 314
        Width = 140
        Height = 14
        Caption = 'Concepto Cobro Facturas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText33: TDBText
        Left = 646
        Top = 314
        Width = 65
        Height = 14
        Alignment = taRightJustify
        DataField = 'CTOCOBRO'
        DataSource = DSFichero
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label103: TLabel
        Left = 446
        Top = 351
        Width = 133
        Height = 14
        Caption = 'Concepto Pago Facturas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText34: TDBText
        Left = 646
        Top = 350
        Width = 65
        Height = 14
        Alignment = taRightJustify
        DataField = 'CTOPAGO'
        DataSource = DSFichero
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 746
        Height = 106
        Align = alTop
        Caption = ' Descuento por Pronto Pago '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label8: TLabel
          Left = 25
          Top = 19
          Width = 103
          Height = 14
          Caption = 'Subcuenta Ventas '
        end
        object Label13: TLabel
          Left = 446
          Top = 19
          Width = 95
          Height = 14
          Caption = 'Concepto Ventas'
        end
        object Label58: TLabel
          Left = 25
          Top = 61
          Width = 115
          Height = 14
          Caption = 'Subcuenta Compras '
        end
        object Label66: TLabel
          Left = 446
          Top = 61
          Width = 107
          Height = 14
          Caption = 'Concepto Compras'
        end
        object DBText24: TDBText
          Left = 647
          Top = 19
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTODTOPPV'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText25: TDBText
          Left = 647
          Top = 61
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTODTOPPC'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBSUBCUENTA24: TwwDBLookupCombo
          Left = 24
          Top = 32
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
          DataField = 'SCTADTOPPV'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientes
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
        object wwDBLookupCombo86: TwwDBLookupCombo
          Left = 120
          Top = 32
          Width = 295
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
          DataField = 'SCTADTOPPV'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCtaClientesDesc
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
        object wwDBLookupCombo88: TwwDBLookupCombo
          Left = 446
          Top = 32
          Width = 266
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
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTODTOPPV'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object CBSUBCUENTA25: TwwDBLookupCombo
          Left = 24
          Top = 74
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
          DataField = 'SCTADTOPPC'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAProveedores
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
        object wwDBLookupCombo90: TwwDBLookupCombo
          Left = 120
          Top = 74
          Width = 295
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
          DataField = 'SCTADTOPPC'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCTAProveedoresDesc
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
        object wwDBLookupCombo92: TwwDBLookupCombo
          Left = 446
          Top = 74
          Width = 266
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
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTODTOPPC'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
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
      object GroupBox10: TGroupBox
        Left = 0
        Top = 106
        Width = 746
        Height = 128
        Align = alTop
        Caption = ' Profesionales / Arrendatarios '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label67: TLabel
          Left = 23
          Top = 16
          Width = 182
          Height = 14
          Caption = 'Subcuenta Retenci'#243'n Profesional'
        end
        object Label68: TLabel
          Left = 446
          Top = 16
          Width = 177
          Height = 14
          Caption = 'Concepto Retenci'#243'n Profesional'
        end
        object Label69: TLabel
          Left = 23
          Top = 85
          Width = 192
          Height = 14
          Caption = 'Subcuenta Retenci'#243'n Arrendatario '
        end
        object Label70: TLabel
          Left = 446
          Top = 85
          Width = 187
          Height = 14
          Caption = 'Concepto Retenci'#243'n Arrendatario '
        end
        object Label71: TLabel
          Left = 23
          Top = 60
          Width = 124
          Height = 14
          Caption = 'Retenci'#243'n Profesional '
        end
        object Label72: TLabel
          Left = 446
          Top = 60
          Width = 128
          Height = 14
          Caption = 'Retenci'#243'n Arrendatario'
        end
        object DBText26: TDBText
          Left = 646
          Top = 85
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTORETARRE'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText27: TDBText
          Left = 646
          Top = 16
          Width = 65
          Height = 14
          Alignment = taRightJustify
          DataField = 'CTORETPROF'
          DataSource = DSFichero
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBSUBCUENTA26: TwwDBLookupCombo
          Left = 22
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
          DataField = 'SCTARETPROF'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCuentas
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
        object wwDBLookupCombo94: TwwDBLookupCombo
          Left = 118
          Top = 29
          Width = 295
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
          DataField = 'SCTARETPROF'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCuentasDesc
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
        object wwDBLookupCombo96: TwwDBLookupCombo
          Left = 446
          Top = 29
          Width = 265
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
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTORETPROF'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object CBSUBCUENTA27: TwwDBLookupCombo
          Left = 22
          Top = 98
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
          DataField = 'SCTARETARRE'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCuentas
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
        object wwDBLookupCombo98: TwwDBLookupCombo
          Left = 118
          Top = 98
          Width = 295
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
          DataField = 'SCTARETARRE'
          DataSource = DSFichero
          LookupTable = DMContaRef.QSubCuentasDesc
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
        object wwDBLookupCombo100: TwwDBLookupCombo
          Left = 446
          Top = 98
          Width = 265
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
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
            'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
          DataField = 'CTORETARRE'
          DataSource = DSFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object OvcDbNumericField1: TOvcDbNumericField
          Left = 152
          Top = 57
          Width = 54
          Height = 20
          DataField = 'TANTORETPROF'
          DataSource = DSFichero
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '##.## %'
          TabOrder = 3
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object OvcDbNumericField2: TOvcDbNumericField
          Left = 584
          Top = 57
          Width = 52
          Height = 20
          DataField = 'TANTORETARRE'
          DataSource = DSFichero
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '##.## %'
          TabOrder = 4
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
      end
      object CBSUBCUENTA28: TwwDBLookupCombo
        Left = 22
        Top = 250
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
        DataField = 'SCTAHACIVA'
        DataSource = DSFichero
        LookupTable = DMContaRef.QSubCuentas
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
      object wwDBLookupCombo118: TwwDBLookupCombo
        Left = 117
        Top = 250
        Width = 295
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
        DataField = 'SCTAHACIVA'
        DataSource = DSFichero
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
      object wwDBLookupCombo124: TwwDBLookupCombo
        Left = 446
        Top = 250
        Width = 265
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
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
        DataField = 'CTOHACIVA'
        DataSource = DSFichero
        LookupTable = DMContaRef.QConceptosDesc
        LookupField = 'ID_CONCEPTOS'
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
      object CBSUBCUENTA35: TwwDBLookupCombo
        Left = 22
        Top = 288
        Width = 96
        Height = 20
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
        DataField = 'SCTAGENINTRACOM'
        DataSource = DSFichero
        LookupTable = DMContaRef.QSubCtaClientes
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        AutoSelect = False
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo25: TwwDBLookupCombo
        Left = 117
        Top = 288
        Width = 295
        Height = 20
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
        DataField = 'SCTAGENINTRACOM'
        DataSource = DSFichero
        LookupTable = DMContaRef.QSubCtaClientesDesc
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        AutoSelect = False
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CBSUBCUENTA40: TwwDBLookupCombo
        Left = 22
        Top = 327
        Width = 96
        Height = 20
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
        DataField = 'SCTABANCO'
        DataSource = DSFichero
        LookupTable = DMContaRef.QSubCTABanco
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        AutoSelect = False
        ParentFont = False
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo42: TwwDBLookupCombo
        Left = 117
        Top = 327
        Width = 295
        Height = 20
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
        DataField = 'SCTABANCO'
        DataSource = DSFichero
        LookupTable = DMContaRef.QSubCTABancoDesc
        LookupField = 'SUBCUENTA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        AutoSelect = False
        ParentFont = False
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo27: TwwDBLookupCombo
        Left = 446
        Top = 327
        Width = 265
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
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
        DataField = 'CTOCOBRO'
        DataSource = DSFichero
        LookupTable = DMContaRef.QConceptosDesc
        LookupField = 'ID_CONCEPTOS'
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
      object wwDBLookupCombo45: TwwDBLookupCombo
        Left = 446
        Top = 364
        Width = 265
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
          'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F'
          'ID_CONCEPTOS'#9'3'#9'CONCEPTO'#9'F')
        DataField = 'CTOPAGO'
        DataSource = DSFichero
        LookupTable = DMContaRef.QConceptosDesc
        LookupField = 'ID_CONCEPTOS'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  object Panel5: TPanel
    Left = 782
    Top = 10
    Width = 10
    Height = 484
    Align = alRight
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 10
    Width = 10
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 494
    Width = 792
    Height = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 3
  end
  object fcIBCerrar: TfcImageBtn
    Left = 749
    Top = 13
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
    NumGlyphs = 0
    ParentClipping = False
    ShadeStyle = fbsNormal
    TabOrder = 4
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clNone
    OnClick = fcIBCerrarClick
    RegionData = {
      4000000020000000010000000200000020000000000000000000000018000000
      1100000001000000000000001800000001000000000000000100000018000000
      11000000}
    DownRegionData = {00000000}
  end
  object BtnEdtAceptar: TfcImageBtn
    Left = 598
    Top = 460
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
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 5
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtAceptarClick
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
    DownRegionData = {00000000}
  end
  object BtnEdtCancelar: TfcImageBtn
    Left = 689
    Top = 460
    Width = 83
    Height = 25
    Cursor = crHandPoint
    Caption = '&Cancelar'
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
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 6
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clLime
    OnClick = BtnEdtCancelarClick
    RegionData = {
      3000000020000000010000000100000010000000000000000000000053000000
      1900000000000000000000005300000019000000}
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
  object DSFichero: TDataSource
    AutoEdit = False
    DataSet = DMRef.QParametros
    Left = 305
    Top = 5
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
    Epoch = 2000
    Left = 504
    Top = 8
  end
end
