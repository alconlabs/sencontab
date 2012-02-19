object WCargaRapidaFacturas: TWCargaRapidaFacturas
  Left = 351
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Carga R'#225'pida de Facturas'
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
    Width = 48
    Height = 19
    Caption = 'Titulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Paginas: TOvcNotebook
    Left = 24
    Top = 41
    Width = 753
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
    TabOrder = 5
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
      object GroupBox2: TGroupBox
        Left = 0
        Top = 355
        Width = 750
        Height = 63
        Align = alBottom
        TabOrder = 3
        object Label11: TLabel
          Left = 10
          Top = 40
          Width = 35
          Height = 14
          Caption = 'Fecha '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 303
          Top = 16
          Width = 68
          Height = 14
          Caption = 'Banco / Caja '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 303
          Top = 40
          Width = 56
          Height = 14
          Caption = 'Concepto '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBRealizar: TCheckBox
          Left = 9
          Top = 15
          Width = 128
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Realizar Pago ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = CBRealizarClick
        end
        object dblBanco: TwwDBLookupCombo
          Left = 373
          Top = 13
          Width = 103
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'Banco'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTABanco
          LookupField = 'subcuenta'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblBancoN: TwwDBLookupCombo
          Left = 475
          Top = 13
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'Banco'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTABancoDesc
          LookupField = 'subcuenta'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object dFechaCobro: TwwDBDateTimePicker
          Left = 59
          Top = 37
          Width = 89
          Height = 20
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'FechaVto'
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 3
        end
        object wwDBLookupCombo8: TwwDBLookupCombo
          Left = 427
          Top = 37
          Width = 305
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
          DataField = 'CtoBanco'
          DataSource = SFichero
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
        object dblCtoBanco: TwwDBLookupCombo
          Left = 373
          Top = 37
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
          DataField = 'CtoBanco'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
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
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 264
        Width = 750
        Height = 91
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label9: TLabel
          Left = 10
          Top = 52
          Width = 65
          Height = 14
          Caption = 'Comentario'
        end
        object Label10: TLabel
          Left = 373
          Top = 52
          Width = 88
          Height = 14
          Caption = 'Cuenta Anal'#237'tica'
        end
        object Label12: TLabel
          Left = 10
          Top = 13
          Width = 151
          Height = 14
          Caption = 'Concepto I.V.A. por Defecto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lCtoIVAIntra: TLabel
          Left = 373
          Top = 13
          Width = 245
          Height = 14
          Caption = 'Concepto I.V.A. Intracomunitario por Defecto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lIntracomunitaria: TLabel
          Left = 663
          Top = 8
          Width = 66
          Height = 28
          Alignment = taCenter
          Caption = 'Factura'#13#10'Intracomun.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object cComentario: TOvcDbPictureField
          Left = 10
          Top = 65
          Width = 340
          Height = 20
          DataField = 'Comentario'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 4
        end
        object wwDBLookupCombo11: TwwDBLookupCombo
          Left = 373
          Top = 65
          Width = 103
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CUENTA'#9'10'#9'CUENTA'#9'F'
            'NOMBRE'#9'30'#9'NOMBRE'#9'F')
          DataField = 'analitica'
          DataSource = SFichero
          LookupTable = DMRef.QAnaliticas
          LookupField = 'CUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          MaxLength = 10
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo12: TwwDBLookupCombo
          Left = 475
          Top = 65
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMBRE'#9'30'#9'NOMBRE'#9'F'
            'CUENTA'#9'10'#9'CUENTA'#9'F')
          DataField = 'analitica'
          DataSource = SFichero
          LookupTable = DMRef.QAnaliticasNom
          LookupField = 'CUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 10
          Top = 27
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
          DataField = 'CtoIva'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
          LookupField = 'ID_CONCEPTOS'
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
        object wwDBLookupCombo4: TwwDBLookupCombo
          Left = 64
          Top = 27
          Width = 286
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
          DataField = 'CtoIva'
          DataSource = SFichero
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
        object eCtoIVAIntra: TwwDBLookupCombo
          Left = 373
          Top = 27
          Width = 55
          Height = 20
          TabStop = False
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
          DataField = 'CTOIVAINTRA'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
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
        object eCtoIVAIntraDesc: TwwDBLookupCombo
          Left = 427
          Top = 27
          Width = 222
          Height = 20
          TabStop = False
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
          DataField = 'CTOIVAINTRA'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object oIntracomunitaria: TCheckBox
          Left = 688
          Top = 33
          Width = 17
          Height = 17
          TabStop = False
          TabOrder = 7
          OnClick = oIntracomunitariaClick
        end
      end
      object Datos: TGroupBox
        Left = 0
        Top = 128
        Width = 750
        Height = 136
        Align = alClient
        Color = 14275008
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object GridEdtSubcuentasIVA: TwwDBGrid
          Left = 10
          Top = 11
          Width = 690
          Height = 117
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
            'DESCRIPCION;CustomEdit;eOperacion'
            'ID_INSTRUMENTOS;CustomEdit;eOperacion'
            'BASE_ARANCEL;CustomEdit;eBaseArancel'
            'CTO_IVA;CustomEdit;eConceptoIVA;F')
          Selected.Strings = (
            'SBCTA_IVA'#9'10'#9'SBCTA_IVA'#9#9
            'SBCTA_IVA_DESC'#9'80'#9'SBCTA_IVA_DESC'#9#9
            'BASE_IMPONIBLE_IVA'#9'10'#9'BASE_IMPONIBLE_IVA'#9#9
            'CONTRAPARTIDA'#9'10'#9'CONTRAPARTIDA'#9#9
            'CONTRAPARTIDA_DESC'#9'80'#9'CONTRAPARTIDA_DESC'#9#9
            'GENERADO'#9'1'#9'GENERADO'#9#9
            'CUOTA_IVA'#9'10'#9'CUOTA_IVA'#9#9
            'CTO_IVA'#9'3'#9'CTO_IVA'#9#9)
          IniAttributes.Delimiter = ';;'
          TitleColor = 10841401
          FixedCols = 0
          ShowHorzScrollBar = False
          BorderStyle = bsNone
          Color = 15596540
          DataSource = SGastos
          Font.Charset = ANSI_CHARSET
          Font.Color = 10657371
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyOptions = [dgEnterToTab, dgAllowInsert]
          Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
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
          OnKeyPress = GridEdtSubcuentasIVAKeyPress
          PadColumnStyle = pcsPlain
        end
        object nImpCuotaIVA: TwwDBEdit
          Left = 239
          Top = 27
          Width = 82
          Height = 20
          AutoSize = False
          DataField = 'CUOTA_IVA'
          DataSource = SGastos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = nImpCuotaIVAExit
        end
        object PermBorrarIVA: TfcShapeBtn
          Left = 706
          Top = 47
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
          TabOrder = 5
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermBorrarIVAClick
        end
        object eSbctaIVADesc: TwwDBLookupCombo
          Left = 20
          Top = 22
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
          DataField = 'SBCTA_IVA'
          DataSource = SGastos
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loRowLines]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = eSbctaIVADescCloseUp
        end
        object eContrapartida: TwwDBLookupCombo
          Left = 337
          Top = 22
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
          DataField = 'CONTRAPARTIDA'
          DataSource = SGastos
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loRowLines]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnNotInList = eContrapartidaNotInList
        end
        object eContrapartidaDesc: TwwDBLookupCombo
          Left = 436
          Top = 22
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
          DataField = 'CONTRAPARTIDA'
          DataSource = SGastos
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loRowLines]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object PermAniadirIVA: TfcShapeBtn
          Left = 706
          Top = 22
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
          NumGlyphs = 0
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 4
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermAniadirIVAClick
        end
        object PermInicializar: TfcShapeBtn
          Left = 706
          Top = 72
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
          TabOrder = 6
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermInicializarClick
        end
        object nImpBaseImponible: TwwDBEdit
          Left = 239
          Top = 75
          Width = 82
          Height = 20
          AutoSize = False
          DataField = 'BASE_IMPONIBLE_IVA'
          DataSource = SGastos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = nImpBaseImponibleExit
        end
        object eConceptoIVA: TwwDBLookupCombo
          Left = 469
          Top = 75
          Width = 55
          Height = 20
          TabStop = False
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
          DataField = 'CTO_IVA'
          DataSource = SGastos
          LookupTable = DMContaRef.QConceptos
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
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 750
        Height = 128
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 187
          Top = 14
          Width = 75
          Height = 14
          Caption = 'Fecha Factura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 10
          Top = 14
          Width = 57
          Height = 14
          Caption = 'N'#186' Factura '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 279
          Top = 14
          Width = 112
          Height = 14
          Caption = 'Importe total factura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PermBtnCalculadora2: TSpeedButton
          Left = 465
          Top = 27
          Width = 21
          Height = 20
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = PermBtnCalculadora2Click
        end
        object Label20: TLabel
          Left = 398
          Top = 14
          Width = 82
          Height = 14
          Caption = 'Imp.Dto.P.Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PermBtnCalculadora: TSpeedButton
          Left = 371
          Top = 27
          Width = 21
          Height = 20
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = PermBtnCalculadoraClick
        end
        object LbSubcuenta: TLabel
          Left = 10
          Top = 52
          Width = 106
          Height = 14
          Caption = 'Cliente / Proveedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbCtoSubcuenta: TLabel
          Left = 422
          Top = 52
          Width = 162
          Height = 14
          Caption = 'Concepto Cliente / Proveedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 655
          Top = 14
          Width = 90
          Height = 14
          Caption = 'N.I.F. si gen'#233'rico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 10
          Top = 88
          Width = 82
          Height = 14
          Caption = 'Forma de Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 239
          Top = 88
          Width = 55
          Height = 14
          Caption = 'D'#237'a Pago 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 299
          Top = 88
          Width = 55
          Height = 14
          Caption = 'D'#237'a Pago 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbProfArre: TLabel
          Left = 494
          Top = 14
          Width = 40
          Height = 14
          Alignment = taRightJustify
          Caption = '% Rete.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbCtoContra: TLabel
          Left = 422
          Top = 88
          Width = 155
          Height = 14
          Caption = 'Concepto Ventas / Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 359
          Top = 88
          Width = 55
          Height = 14
          Caption = 'D'#237'a Pago 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lFacturaIntracom: TLabel
          Left = 98
          Top = 13
          Width = 77
          Height = 14
          Caption = 'Factura Intrac.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object PermBtnRetVentas: TSpeedButton
          Left = 619
          Top = 27
          Width = 21
          Height = 20
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = PermBtnCalculadora2Click
        end
        object lbRetVentas: TLabel
          Left = 546
          Top = 14
          Width = 94
          Height = 14
          Caption = 'Imp.Reteni.Venta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eConcepto: TwwDBLookupCombo
          Left = 422
          Top = 65
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
          DataField = 'CtoSubcuenta'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
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
        object NFactura: TOvcDbPictureField
          Left = 10
          Top = 27
          Width = 86
          Height = 20
          DataField = 'NumeroFactura'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 0
        end
        object nImporte: TOvcDbNumericField
          Left = 279
          Top = 27
          Width = 92
          Height = 20
          DataField = 'Importe'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '###,###,###'
          TabOrder = 3
          OnClick = SeleccionarContenido
          OnExit = nImporteExit
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object nImporteDto: TOvcDbNumericField
          Left = 398
          Top = 27
          Width = 67
          Height = 20
          DataField = 'ImporteProntoPago'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '###,###,###'
          TabOrder = 5
          TabStop = False
          OnClick = SeleccionarContenido
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object dblSubcuenta: TwwDBLookupCombo
          Left = 10
          Top = 65
          Width = 89
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'
            'DESCRIPCION'#9'40'#9'DESCRIPCION')
          DataField = 'Subcuenta'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCtaClientes
          LookupField = 'subcuenta'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          MaxLength = 10
          ParentFont = False
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblSubcuentaCloseUp
          OnExit = dblSubcuentaExit
          OnNotInList = dblSubcuentaNotInList
        end
        object dblSubcuentaN: TwwDBLookupCombo
          Left = 98
          Top = 65
          Width = 315
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIPCION'#9'40'#9'DESCRIPCION'
            'SUBCUENTA'#9'10'#9'SUBCUENTA')
          DataField = 'Subcuenta'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCtaClientesDesc
          LookupField = 'subcuenta'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblSubcuentaCloseUp
          OnExit = dblSubcuentaExit
          OnNotInList = dblSubcuentaNotInList
        end
        object FechaFactura: TwwDBDateTimePicker
          Left = 187
          Top = 27
          Width = 89
          Height = 20
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'Fecha'
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 2
          OnExit = FechaFacturaExit
        end
        object cNif: TOvcDbPictureField
          Left = 655
          Top = 27
          Width = 90
          Height = 20
          DataField = 'NIF'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 7
          TabStop = False
          OnExit = cNifExit
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 10
          Top = 102
          Width = 53
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'FORMAPAGO'#9'3'#9'FORMA'#9'F'
            'DESCRIBE'#9'40'#9'DESCRIPCION'#9'F')
          DataField = 'FORMAPAGO'
          DataSource = SFichero
          LookupTable = DMRef.QFormaPago
          LookupField = 'FORMAPAGO'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 62
          Top = 102
          Width = 174
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRIBE'#9'40'#9'DESCRIPCION'#9'F'
            'FORMAPAGO'#9'3'#9'FORMA'#9'F')
          DataField = 'FORMAPAGO'
          DataSource = SFichero
          LookupTable = DMRef.QFormaPagoNom
          LookupField = 'FORMAPAGO'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 13
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object OvcDbNumericField62: TOvcDbNumericField
          Left = 239
          Top = 102
          Width = 55
          Height = 20
          DataField = 'DIAPAGO1'
          DataSource = SFichero
          FieldType = ftSmallint
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
          Options = [efoCaretToEnd, efoTrimBlanks]
          ParentFont = False
          PictureMask = 'ii'
          TabOrder = 14
          OnClick = SeleccionarContenido
          RangeHigh = {FF7F0000000000000000}
          RangeLow = {0080FFFF000000000000}
        end
        object OvcDbNumericField63: TOvcDbNumericField
          Left = 299
          Top = 102
          Width = 55
          Height = 20
          DataField = 'DIAPAGO2'
          DataSource = SFichero
          FieldType = ftSmallint
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
          Options = [efoCaretToEnd, efoTrimBlanks]
          ParentFont = False
          PictureMask = 'ii'
          TabOrder = 15
          OnClick = SeleccionarContenido
          RangeHigh = {FF7F0000000000000000}
          RangeLow = {0080FFFF000000000000}
        end
        object eDescConcepto: TwwDBLookupCombo
          Left = 476
          Top = 65
          Width = 253
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
          DataField = 'CtoSubcuenta'
          DataSource = SFichero
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
        object OvcDbNumericField2: TOvcDbNumericField
          Left = 494
          Top = 27
          Width = 40
          Height = 20
          DataField = 'TantoRetencion'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '##.##'
          TabOrder = 6
          TabStop = False
          OnClick = SeleccionarContenido
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object eConceptoVentaCompra: TwwDBLookupCombo
          Left = 422
          Top = 102
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
          DataField = 'CtoContra'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptos
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
        object wwDBLookupCombo7: TwwDBLookupCombo
          Left = 476
          Top = 102
          Width = 253
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
          DataField = 'CtoContra'
          DataSource = SFichero
          LookupTable = DMContaRef.QConceptosDesc
          LookupField = 'ID_CONCEPTOS'
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
        object OvcDbNumericField1: TOvcDbNumericField
          Left = 359
          Top = 102
          Width = 55
          Height = 20
          DataField = 'DIAPAGO3'
          DataSource = SFichero
          FieldType = ftSmallint
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
          Options = [efoCaretToEnd, efoTrimBlanks]
          ParentFont = False
          PictureMask = 'ii'
          TabOrder = 16
          OnClick = SeleccionarContenido
          RangeHigh = {FF7F0000000000000000}
          RangeLow = {0080FFFF000000000000}
        end
        object eFacturaIntracom: TOvcDbPictureField
          Left = 98
          Top = 26
          Width = 86
          Height = 20
          DataField = 'NumeroFacturaIntracom'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 1
          Visible = False
        end
        object cImpRetVentas: TOvcDbNumericField
          Left = 546
          Top = 27
          Width = 73
          Height = 20
          DataField = 'ImporteRetVenta'
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
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '###,###,###.##'
          TabOrder = 4
          OnClick = SeleccionarContenido
          OnExit = nImporteExit
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
      end
    end
    object Movimientos: TOvcTabPage
      Tag = 1
      Caption = #218'ltimos Movimientos'
      TabColor = 14275008
      TextColor = clNavy
      object Label5: TLabel
        Left = 292
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
        Left = 366
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
        Top = 3
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
          'ASIENTO'#9'9'#9'ASIENTO'#9'F'#9
          'APUNTE'#9'4'#9'APT'#9'F'#9
          'FECHA'#9'10'#9'FECHA'#9'F'#9
          'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'#9
          'ID_CONCEPTOS'#9'4'#9'CTO'#9'F'#9
          'DescComentario'#9'48'#9'DESCRIPCION DEL APUNTE'#9'F'#9
          'DEBEHABER'#9'2'#9'T'#9'F'#9
          'IMPORTE'#9'14'#9'IMPORTE'#9'F'#9
          'CONTRAPARTIDA'#9'10'#9'CONTRAP'#9'F'#9)
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
        NumGlyphs = 0
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
        NumGlyphs = 0
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
    Left = 593
    Top = 487
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
    Top = 487
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
    ParentClipping = False
    ParentFont = False
    ShadeStyle = fbsNormal
    TabOrder = 4
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
    Top = 487
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
    Left = 650
    Top = 12
  end
  object SFichero: TwwDataSource
    DataSet = QFichero
    Left = 386
    Top = 8
  end
  object Transaccion: TIBTransaction
    Active = False
    DefaultDatabase = DMRef.IBDSiamCont
    AutoStopAction = saNone
    Left = 495
    Top = 7
  end
  object QMovimientos: TIBTableSet
    Database = DMRef.IBDSiamCont
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
    Left = 531
    Top = 7
    object QMovimientosASIENTO: TIntegerField
      DisplayWidth = 9
      FieldName = 'ASIENTO'
      Origin = 'DIARIO.ASIENTO'
      DisplayFormat = '###,###,###'
    end
    object QMovimientosAPUNTE: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'APT'
      DisplayWidth = 4
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
      DisplayWidth = 48
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
      DisplayWidth = 10
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
      FieldName = 'ABREVIATURA'
      Origin = 'SUBCTAS.ABREVIATURA'
      Visible = False
      Size = 10
    end
    object QMovimientosTIPOASIENTO: TIntegerField
      FieldName = 'TIPOASIENTO'
      Origin = 'DIARIO.TIPOASIENTO'
      Visible = False
    end
    object QMovimientosASIENTONOMINA: TIntegerField
      FieldName = 'ASIENTONOMINA'
      Origin = 'DIARIO.ASIENTONOMINA'
      Visible = False
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
  object SMovimientos: TDataSource
    AutoEdit = False
    DataSet = QMovimientos
    Left = 559
    Top = 7
  end
  object QSubcuentas: TIBSQL
    Database = DMRef.IBDSiamCont
    ParamCheck = True
    Transaction = DMRef.IBT1
    Left = 314
    Top = 16
  end
  object SGastos: TwwDataSource
    DataSet = QGastos
    Left = 294
    Top = 280
  end
  object QGastos: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = QGastosNewRecord
    Left = 324
    Top = 280
    object QGastosSBCTA_IVA: TStringField
      DisplayWidth = 10
      FieldName = 'SBCTA_IVA'
      Size = 10
    end
    object QGastosSBCTA_IVA_DESC: TStringField
      DisplayWidth = 80
      FieldKind = fkLookup
      FieldName = 'SBCTA_IVA_DESC'
      LookupDataSet = DMContaRef.QSubCuentas
      LookupKeyFields = 'SUBCUENTA'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'SBCTA_IVA'
      Size = 80
      Lookup = True
    end
    object QGastosBASE_IMPONIBLE_IVA: TFloatField
      DisplayWidth = 10
      FieldName = 'BASE_IMPONIBLE_IVA'
    end
    object QGastosCONTRAPARTIDA: TStringField
      DisplayWidth = 10
      FieldName = 'CONTRAPARTIDA'
      Size = 10
    end
    object QGastosCONTRAPARTIDA_DESC: TStringField
      DisplayWidth = 80
      FieldKind = fkLookup
      FieldName = 'CONTRAPARTIDA_DESC'
      LookupDataSet = DMContaRef.QSubCuentas
      LookupKeyFields = 'SUBCUENTA'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CONTRAPARTIDA'
      Size = 80
      Lookup = True
    end
    object QGastosGENERADO: TStringField
      DisplayWidth = 1
      FieldName = 'GENERADO'
      Size = 1
    end
    object QGastosCUOTA_IVA: TFloatField
      DisplayWidth = 10
      FieldName = 'CUOTA_IVA'
    end
    object QGastosCTO_IVA: TStringField
      DisplayWidth = 3
      FieldName = 'CTO_IVA'
      Size = 3
    end
  end
  object QFichero: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 416
    Top = 8
  end
end
