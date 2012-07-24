object WParametrizacion: TWParametrizacion
  Left = 535
  Top = 310
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
  object Label2: TLabel
    Left = 22
    Top = 13
    Width = 134
    Height = 19
    Caption = 'Parametrizaci'#243'n'
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
    object General: TOvcTabPage
      Tag = 1
      Caption = '&General'
      TabColor = 14275008
      TextColor = clNavy
      object GBFiscales: TGroupBox
        Left = 0
        Top = 0
        Width = 746
        Height = 394
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LabelNif: TLabel
          Left = 451
          Top = 14
          Width = 25
          Height = 14
          Caption = 'N.I.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelDireccion: TLabel
          Left = 74
          Top = 52
          Width = 133
          Height = 14
          Caption = 'Nombre de la v'#237'a p'#250'blica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelPostal: TLabel
          Left = 18
          Top = 88
          Width = 48
          Height = 14
          Caption = 'C. Postal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelPoblacion: TLabel
          Left = 111
          Top = 88
          Width = 53
          Height = 14
          Caption = 'Poblaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelProvincia: TLabel
          Left = 451
          Top = 88
          Width = 50
          Height = 14
          Caption = 'Provincia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 451
          Top = 127
          Width = 49
          Height = 14
          Caption = 'Tel'#233'fono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 610
          Top = 127
          Width = 18
          Height = 14
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 18
          Top = 127
          Width = 115
          Height = 14
          Caption = 'Persona de Contacto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 18
          Top = 14
          Width = 412
          Height = 14
          Caption = 
            'Nombre Fiscal (Si es Persona Fisica,  (Apellidos, Nombre) coma o' +
            'bligatoria)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 547
          Top = 167
          Width = 82
          Height = 14
          AutoSize = False
          Caption = 'Asiento actual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object lLongSubcuentas: TLabel
          Left = 451
          Top = 167
          Width = 78
          Height = 14
          Caption = 'Long. Subctas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 656
          Top = 14
          Width = 44
          Height = 14
          Caption = 'Moneda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label74: TLabel
          Left = 18
          Top = 167
          Width = 123
          Height = 14
          Caption = 'Cod. Admon. Hacienda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label84: TLabel
          Left = 171
          Top = 167
          Width = 233
          Height = 14
          Caption = 'C.C.C. para Hacienda, formato con guiones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label85: TLabel
          Left = 18
          Top = 52
          Width = 46
          Height = 14
          Caption = 'Sigla V'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label86: TLabel
          Left = 451
          Top = 52
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
        object Label87: TLabel
          Left = 502
          Top = 52
          Width = 46
          Height = 14
          Caption = 'Escalera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label88: TLabel
          Left = 560
          Top = 52
          Width = 24
          Height = 14
          Caption = 'Piso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label90: TLabel
          Left = 610
          Top = 52
          Width = 36
          Height = 14
          Caption = 'Puerta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 572
          Top = 14
          Width = 76
          Height = 14
          Caption = 'Tipo Empresa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 641
          Top = 167
          Width = 96
          Height = 14
          Caption = 'Filtro Subcuentas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eNombreFiscal: TOvcDbPictureField
          Left = 18
          Top = 27
          Width = 417
          Height = 20
          DataField = 'NOMBREFISCAL'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 80
          ParentFont = False
          PictureMask = '!'
          TabOrder = 0
        end
        object CampoNif: TOvcDbPictureField
          Left = 451
          Top = 27
          Width = 109
          Height = 20
          DataField = 'NIF'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PictureMask = '!'
          TabOrder = 1
        end
        object CampoDireccion: TOvcDbPictureField
          Left = 74
          Top = 65
          Width = 361
          Height = 20
          DataField = 'DIRECCION'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          PictureMask = '!'
          TabOrder = 5
        end
        object CampoCodPostal: TOvcDbPictureField
          Left = 18
          Top = 101
          Width = 85
          Height = 20
          DataField = 'CODPOSTAL'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          PictureMask = '!'
          TabOrder = 10
        end
        object CampoPoblacion: TOvcDbPictureField
          Left = 111
          Top = 101
          Width = 324
          Height = 20
          DataField = 'POBLACION'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          PictureMask = '!'
          TabOrder = 11
        end
        object DBLookupComboProvincia: TwwDBLookupCombo
          Left = 451
          Top = 101
          Width = 272
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
            'NOMBRE'#9'20'#9'NOMBRE')
          DataField = 'PROVINCIA'
          DataSource = DSFichero
          LookupTable = DMRef.QProvinciasNom
          LookupField = 'PROVINCIA'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object OvcDbPictureField2: TOvcDbPictureField
          Left = 451
          Top = 140
          Width = 130
          Height = 20
          DataField = 'TELEFONO'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 16
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 14
        end
        object OvcDbPictureField3: TOvcDbPictureField
          Left = 18
          Top = 140
          Width = 417
          Height = 20
          DataField = 'CONTACTO'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          PictureMask = '!'
          TabOrder = 13
        end
        object OvcDbPictureField6: TOvcDbPictureField
          Left = 610
          Top = 140
          Width = 113
          Height = 20
          DataField = 'FAX'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 16
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 15
        end
        object eAsiento: TOvcDbNumericField
          Left = 547
          Top = 181
          Width = 82
          Height = 20
          DataField = 'Asiento'
          DataSource = DSFiltro
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = '###,###,###'
          TabOrder = 19
          RangeHigh = {E275587FED2AB1ECFE7F}
          RangeLow = {E275587FED2AB1ECFEFF}
        end
        object DBCheckBox3: TDBCheckBox
          Left = 18
          Top = 277
          Width = 209
          Height = 17
          Caption = 'Asiento recargo individualizado'
          DataField = 'RECARGO'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object eLongSubcuenta: TOvcDbNumericField
          Left = 473
          Top = 181
          Width = 35
          Height = 20
          DataField = 'LONGITUD_SUBCUENTAS'
          DataSource = DSFichero
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
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [efoCaretToEnd, efoTrimBlanks]
          ParentFont = False
          PictureMask = '##'
          TabOrder = 18
          RangeHigh = {FF7F0000000000000000}
          RangeLow = {0080FFFF000000000000}
        end
        object eMoneda: TwwDBComboBox
          Left = 656
          Top = 27
          Width = 67
          Height = 20
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          ShowMatchText = True
          AutoSize = False
          DataField = 'MONEDA'
          DataSource = DSFichero
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
          ItemIndex = 1
          ParentFont = False
          Sorted = False
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object GroupBox2: TGroupBox
          Left = 18
          Top = 206
          Width = 417
          Height = 59
          Caption = ' Fecha de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          object Label48: TLabel
            Left = 13
            Top = 16
            Width = 78
            Height = 14
            Caption = 'Inicio Ejercicio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 113
            Top = 16
            Width = 65
            Height = 14
            Caption = 'Fin Ejercicio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 203
            Top = 16
            Width = 93
            Height = 14
            Caption = 'Ult. Amortizaci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 316
            Top = 16
            Width = 79
            Height = 14
            Caption = 'Bloqueo Diario'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object eFechaInicioEjer: TwwDBDateTimePicker
            Left = 11
            Top = 30
            Width = 89
            Height = 20
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FECHA_INICIO_EJERCICIO'
            DataSource = DSFichero
            Date = 37257.000000000000000000
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
          object eFechaFinEjer: TwwDBDateTimePicker
            Left = 107
            Top = 30
            Width = 89
            Height = 20
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FECHA_FIN_EJERCICIO'
            DataSource = DSFichero
            Date = 37621.000000000000000000
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
          object eFechaInicio: TwwDBDateTimePicker
            Left = 203
            Top = 30
            Width = 98
            Height = 20
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FECHAAMORTIZACION'
            DataSource = DSFichero
            Date = 37621.000000000000000000
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
            TabOrder = 2
          end
          object wwDBDateTimePicker1: TwwDBDateTimePicker
            Left = 307
            Top = 30
            Width = 98
            Height = 20
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FECHABLOQUEO'
            DataSource = DSFichero
            Date = 37469.000000000000000000
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
            TabOrder = 3
          end
        end
        object OvcDbPictureField1: TOvcDbPictureField
          Left = 18
          Top = 65
          Width = 45
          Height = 20
          DataField = 'SIGLAVIA'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PictureMask = '!'
          TabOrder = 4
        end
        object OvcDbPictureField4: TOvcDbPictureField
          Left = 451
          Top = 65
          Width = 45
          Height = 20
          DataField = 'NUMEROCALLE'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          PictureMask = '!'
          TabOrder = 6
        end
        object OvcDbPictureField9: TOvcDbPictureField
          Left = 502
          Top = 65
          Width = 45
          Height = 20
          DataField = 'ESCALERA'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PictureMask = '!'
          TabOrder = 7
        end
        object OvcDbPictureField10: TOvcDbPictureField
          Left = 559
          Top = 65
          Width = 27
          Height = 20
          DataField = 'PISO'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PictureMask = '!'
          TabOrder = 8
        end
        object OvcDbPictureField11: TOvcDbPictureField
          Left = 610
          Top = 65
          Width = 37
          Height = 20
          DataField = 'PUERTA'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PictureMask = '!'
          TabOrder = 9
        end
        object OvcDbPictureField12: TOvcDbPictureField
          Left = 39
          Top = 181
          Width = 63
          Height = 20
          DataField = 'CODADMON'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          PictureMask = '!'
          TabOrder = 16
        end
        object OvcDbPictureField13: TOvcDbPictureField
          Left = 171
          Top = 181
          Width = 264
          Height = 20
          DataField = 'CCC'
          DataSource = DSFichero
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 23
          Options = [efoCaretToEnd]
          ParentFont = False
          PictureMask = 'XXXX-XXXX-XX-XXXXXXXXXX'
          TabOrder = 17
        end
        object DBCheckBox2: TDBCheckBox
          Left = 18
          Top = 312
          Width = 209
          Height = 17
          Caption = 'Gestiona cartera de efectos'
          DataField = 'GESTIONA_CARTERA_EFECTOS'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 18
          Top = 347
          Width = 263
          Height = 17
          Caption = 'Incluir abrev. subcta en descripci'#243'n apunte'
          DataField = 'INCLUIR_ABREV'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object GroupBox16: TGroupBox
          Left = 451
          Top = 206
          Width = 287
          Height = 163
          Caption = ' Intervalos Asientos '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 28
          object Label76: TLabel
            Left = 167
            Top = 20
            Width = 29
            Height = 14
            Caption = 'Inicio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label80: TLabel
            Left = 239
            Top = 20
            Width = 16
            Height = 14
            Caption = 'Fin'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label91: TLabel
            Left = 15
            Top = 37
            Width = 101
            Height = 14
            Caption = 'B'#250'squeda Asiento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label92: TLabel
            Left = 15
            Top = 66
            Width = 74
            Height = 14
            Caption = 'Filtro Asiento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object eAsientosInicio: TOvcDbNumericField
            Left = 158
            Top = 34
            Width = 47
            Height = 20
            DataField = 'ASIENTOS_INICIO_INTERVALO_BQDA'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [efoCaretToEnd, efoTrimBlanks]
            ParentFont = False
            PictureMask = 'iiiiii'
            TabOrder = 0
            RangeHigh = {FF7F0000000000000000}
            RangeLow = {0080FFFF000000000000}
          end
          object eAsientosFin: TOvcDbNumericField
            Left = 224
            Top = 34
            Width = 47
            Height = 20
            DataField = 'ASIENTOS_FIN_INTERVALO_BQDA'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [efoCaretToEnd, efoTrimBlanks]
            ParentFont = False
            PictureMask = 'iiiiii'
            TabOrder = 1
            RangeHigh = {FF7F0000000000000000}
            RangeLow = {0080FFFF000000000000}
          end
          object OvcDbNumericField3: TOvcDbNumericField
            Left = 158
            Top = 63
            Width = 47
            Height = 20
            DataField = 'ASIENTO_INICIO_INTERVALO_FILTRO'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [efoCaretToEnd, efoTrimBlanks]
            ParentFont = False
            PictureMask = 'iiiiii'
            TabOrder = 2
            RangeHigh = {FF7F0000000000000000}
            RangeLow = {0080FFFF000000000000}
          end
          object OvcDbNumericField4: TOvcDbNumericField
            Left = 224
            Top = 63
            Width = 47
            Height = 20
            DataField = 'ASIENTO_FIN_INTERVALO_FILTRO'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [efoCaretToEnd, efoTrimBlanks]
            ParentFont = False
            PictureMask = 'iiiiii'
            TabOrder = 3
            RangeHigh = {FF7F0000000000000000}
            RangeLow = {0080FFFF000000000000}
          end
          object DBCheckBox4: TDBCheckBox
            Left = 15
            Top = 125
            Width = 209
            Height = 19
            Caption = 'Filtro asientos al inicio de ejercicio'
            DataField = 'FILTRO_ASIENTOS_INICIO'
            DataSource = DSFichero
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 15
            Top = 96
            Width = 209
            Height = 17
            Caption = 'Mostrar filtro de mayor'
            DataField = 'MOSTRAR_FILTRO_MAYOR'
            DataSource = DSFichero
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 312
          Top = 274
          Width = 123
          Height = 95
          Caption = ' B'#250'squeda Subctas '
          DataField = 'BUSQUEDA_SUBCTAS'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Items.Strings = (
            'Por Subcuenta'
            'Por Descripci'#243'n')
          ParentFont = False
          TabOrder = 27
          Values.Strings = (
            'S'
            'D')
        end
        object eTipoEmpresa: TwwDBComboBox
          Left = 572
          Top = 27
          Width = 76
          Height = 20
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          ShowMatchText = True
          AutoSize = False
          DataField = 'TIPOEMPRESA'
          DataSource = DSFichero
          DropDownCount = 8
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'F'#205'SICA'#9'F'
            'JUR'#205'DICA'#9'J')
          ItemIndex = 1
          ParentFont = False
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object eFiltroSubctas: TOvcDbPictureField
          Left = 656
          Top = 181
          Width = 67
          Height = 21
          DataField = 'FILTROSUBCTAS'
          DataSource = DSFichero
          FieldType = ftString
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
          MaxLength = 3
          ParentFont = False
          PictureMask = '!'
          TabOrder = 20
        end
        object DBCheckBox8: TDBCheckBox
          Left = 18
          Top = 294
          Width = 255
          Height = 17
          Caption = 'No modifica comentario en carga asientos'
          DataField = 'ACTCOMENTARIO'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox9: TDBCheckBox
          Left = 18
          Top = 365
          Width = 209
          Height = 17
          Caption = 'Serie y ejercicio en facturas'
          DataField = 'TRATASERIE'
          DataSource = DSFichero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
    object Nominas: TOvcTabPage
      Tag = 1
      Caption = '&N'#243'minas'
      TabColor = 14275008
      TextColor = clNavy
      object GroupBox13: TGroupBox
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
        object GroupBox7: TGroupBox
          Left = 2
          Top = 15
          Width = 742
          Height = 205
          Align = alTop
          Caption = ' Asiento Trabajador'
          TabOrder = 0
          object Label37: TLabel
            Left = 19
            Top = 26
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
            Left = 19
            Top = 76
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
            Left = 387
            Top = 76
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
          object Label40: TLabel
            Left = 19
            Top = 125
            Width = 176
            Height = 14
            Caption = 'Subcuenta de Pago de N'#243'minas '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 387
            Top = 125
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
          object DBText22: TDBText
            Left = 668
            Top = 125
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTONOMT'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label100: TLabel
            Left = 387
            Top = 26
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
          object CBSUBCUENTA18: TwwDBLookupCombo
            Left = 19
            Top = 40
            Width = 96
            Height = 21
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
            DataSource = DSFichero
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
          object wwDBLookupCombo19: TwwDBLookupCombo
            Left = 114
            Top = 40
            Width = 252
            Height = 21
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
            DataSource = DSFichero
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
          object CBSUBCUENTA19: TwwDBLookupCombo
            Left = 19
            Top = 90
            Width = 96
            Height = 21
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
            DataSource = DSFichero
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
          object wwDBLookupCombo49: TwwDBLookupCombo
            Left = 114
            Top = 90
            Width = 252
            Height = 21
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
            DataSource = DSFichero
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
          object CBSUBCUENTA20: TwwDBLookupCombo
            Left = 387
            Top = 90
            Width = 96
            Height = 21
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
            DataSource = DSFichero
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
          object wwDBLookupCombo51: TwwDBLookupCombo
            Left = 481
            Top = 90
            Width = 252
            Height = 21
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
            DataSource = DSFichero
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
          object CBSUBCUENTA21: TwwDBLookupCombo
            Left = 19
            Top = 139
            Width = 96
            Height = 21
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
            DataField = 'SCTANOMPAGO'
            DataSource = DSFichero
            LookupTable = DMContaRef.QSubCTANominas
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
            Left = 114
            Top = 139
            Width = 252
            Height = 21
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
            DataField = 'SCTANOMPAGO'
            DataSource = DSFichero
            LookupTable = DMContaRef.QSubCTANominasDesc
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
          object wwDBLookupCombo55: TwwDBLookupCombo
            Left = 387
            Top = 139
            Width = 346
            Height = 21
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
            DataField = 'CTONOMT'
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
          object DBCheckBox7: TDBCheckBox
            Left = 19
            Top = 174
            Width = 193
            Height = 17
            Caption = 'Asiento n'#243'mina individualizado'
            DataField = 'ASIENTO_NOMINA_INDIVIDUAL'
            DataSource = DSFichero
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object CBSUBCUENTA39: TwwDBLookupCombo
            Left = 387
            Top = 40
            Width = 96
            Height = 21
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
            DataField = 'SCTAOTRASREMUN'
            DataSource = DSFichero
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
          object wwDBLookupCombo35: TwwDBLookupCombo
            Left = 481
            Top = 40
            Width = 252
            Height = 21
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
            DataField = 'SCTAOTRASREMUN'
            DataSource = DSFichero
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
          Left = 2
          Top = 226
          Width = 742
          Height = 166
          Align = alBottom
          Caption = ' Asiento Empresa '
          TabOrder = 1
          object Label43: TLabel
            Left = 123
            Top = 21
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
            Left = 123
            Top = 66
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
            Left = 123
            Top = 113
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
          object DBText23: TDBText
            Left = 403
            Top = 113
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTONOME'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CBSUBCUENTA22: TwwDBLookupCombo
            Left = 122
            Top = 35
            Width = 96
            Height = 21
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
            DataSource = DSFichero
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
          object wwDBLookupCombo57: TwwDBLookupCombo
            Left = 218
            Top = 35
            Width = 252
            Height = 21
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
            DataSource = DSFichero
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
          object CBSUBCUENTA23: TwwDBLookupCombo
            Left = 122
            Top = 80
            Width = 96
            Height = 21
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
          object wwDBLookupCombo59: TwwDBLookupCombo
            Left = 218
            Top = 80
            Width = 252
            Height = 21
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
          object wwDBLookupCombo61: TwwDBLookupCombo
            Left = 122
            Top = 126
            Width = 348
            Height = 21
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
            DataField = 'CTONOME'
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
        end
      end
    end
    object Cierre: TOvcTabPage
      Tag = 1
      Caption = 'Cierre &Ejercicio'
      TabColor = 14275008
      TextColor = clNavy
      object GroupBox12: TGroupBox
        Left = 40
        Top = 56
        Width = 609
        Height = 208
        Caption = ' DATOS PARA CIERRE DE EJERCICIO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label62: TLabel
          Left = 139
          Top = 147
          Width = 113
          Height = 14
          Caption = 'Subcuenta de Cierre'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox14: TGroupBox
          Left = 9
          Top = 20
          Width = 289
          Height = 113
          Caption = ' Asiento Regularizaci'#243'n '
          TabOrder = 0
          object Label63: TLabel
            Left = 9
            Top = 19
            Width = 176
            Height = 14
            Caption = 'Concepto regularizaci'#243'n Normal'
          end
          object Label77: TLabel
            Left = 9
            Top = 59
            Width = 182
            Height = 14
            Caption = 'Concepto regularizaci'#243'n Especial'
          end
          object DBText29: TDBText
            Left = 201
            Top = 19
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTO_REGULARIZACION'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText30: TDBText
            Left = 201
            Top = 59
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTO_REGULARIZACION_ESP'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object wwDBLookupCombo16: TwwDBLookupCombo
            Left = 9
            Top = 32
            Width = 257
            Height = 21
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
            DataField = 'CTO_REGULARIZACION'
            DataSource = DSFichero
            LookupTable = DMContaRef.QConceptosDesc
            LookupField = 'ID_CONCEPTOS'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object wwDBLookupCombo18: TwwDBLookupCombo
            Left = 9
            Top = 72
            Width = 257
            Height = 21
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
            DataField = 'CTO_REGULARIZACION_ESP'
            DataSource = DSFichero
            LookupTable = DMContaRef.QConceptosDesc
            LookupField = 'ID_CONCEPTOS'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            PreciseEditRegion = False
            AllowClearKey = False
          end
        end
        object GroupBox15: TGroupBox
          Left = 312
          Top = 20
          Width = 289
          Height = 113
          Caption = ' Asiento Apertura '
          TabOrder = 1
          object Label78: TLabel
            Left = 11
            Top = 17
            Width = 145
            Height = 14
            Caption = 'Concepto apertura Normal'
          end
          object Label79: TLabel
            Left = 11
            Top = 60
            Width = 151
            Height = 14
            Caption = 'Concepto apertura Especial'
          end
          object DBText31: TDBText
            Left = 203
            Top = 60
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTO_APERTURA_ESP'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText32: TDBText
            Left = 203
            Top = 17
            Width = 65
            Height = 14
            Alignment = taRightJustify
            DataField = 'CTO_APERTURA'
            DataSource = DSFichero
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object wwDBLookupCombo62: TwwDBLookupCombo
            Left = 11
            Top = 30
            Width = 257
            Height = 21
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
            DataField = 'CTO_APERTURA'
            DataSource = DSFichero
            LookupTable = DMContaRef.QConceptosDesc
            LookupField = 'ID_CONCEPTOS'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object wwDBLookupCombo64: TwwDBLookupCombo
            Left = 11
            Top = 73
            Width = 257
            Height = 21
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
            DataField = 'CTO_APERTURA_ESP'
            DataSource = DSFichero
            LookupTable = DMContaRef.QConceptosDesc
            LookupField = 'ID_CONCEPTOS'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            PreciseEditRegion = False
            AllowClearKey = False
          end
        end
        object CBSUBCUENTA29: TwwDBLookupCombo
          Left = 139
          Top = 161
          Width = 96
          Height = 21
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
          DataField = 'SUBCUENTA_CIERRE'
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
        object wwDBLookupCombo17: TwwDBLookupCombo
          Left = 235
          Top = 161
          Width = 284
          Height = 21
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
          DataField = 'SUBCUENTA_CIERRE'
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
      end
    end
    object Documentos: TOvcTabPage
      Tag = 1
      Caption = '&Documentos'
      TabColor = 14275008
      TextColor = clNavy
      object GroupBox3: TGroupBox
        Left = 34
        Top = 129
        Width = 688
        Height = 176
        Caption = ' ENLACE CON WORD (97 - 2003) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object GroupBox11: TGroupBox
          Left = 9
          Top = 16
          Width = 664
          Height = 104
          Caption = ' NOMBRES DE CARTAS MODELO '
          TabOrder = 0
          object Label17: TLabel
            Left = 12
            Top = 22
            Width = 128
            Height = 14
            Caption = 'Reclamaci'#243'n a clientes '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 12
            Top = 49
            Width = 121
            Height = 14
            Caption = 'Pagos a Proveedores '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 12
            Top = 76
            Width = 173
            Height = 14
            Caption = 'Operaciones con terceros (347)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PermSPClientes: TSpeedButton
            Left = 631
            Top = 19
            Width = 25
            Height = 20
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            Layout = blGlyphRight
            NumGlyphs = 2
            OnClick = PermSPClientesClick
          end
          object PermSPProveedor: TSpeedButton
            Left = 631
            Top = 46
            Width = 25
            Height = 20
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            Layout = blGlyphRight
            NumGlyphs = 2
            OnClick = PermSPProveedorClick
          end
          object PermSP347: TSpeedButton
            Left = 631
            Top = 73
            Width = 25
            Height = 20
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            Layout = blGlyphRight
            NumGlyphs = 2
            OnClick = PermSP347Click
          end
          object OvcDbPictureField5: TOvcDbPictureField
            Left = 192
            Top = 19
            Width = 442
            Height = 20
            DataField = 'DOCCLIENTE'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 100
            ParentFont = False
            PictureMask = 'X'
            TabOrder = 0
          end
          object OvcDbPictureField7: TOvcDbPictureField
            Left = 192
            Top = 46
            Width = 442
            Height = 20
            DataField = 'DOCPROVEEDOR'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 100
            ParentFont = False
            PictureMask = 'X'
            TabOrder = 1
          end
          object OvcDbPictureField8: TOvcDbPictureField
            Left = 192
            Top = 73
            Width = 442
            Height = 20
            DataField = 'DOC347'
            DataSource = DSFichero
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 100
            ParentFont = False
            PictureMask = 'X'
            TabOrder = 2
          end
        end
        object CBImprimir: TDBCheckBox
          Left = 202
          Top = 122
          Width = 281
          Height = 17
          Caption = 'Previsualizar documento antes de imprimir ?'
          DataField = 'DOCIMPRIMIR'
          DataSource = DSFichero
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
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
    Left = 585
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
    Left = 704
    Top = 8
  end
  object CDSFiltro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 474
    Top = 8
  end
  object DSFiltro: TDataSource
    DataSet = CDSFiltro
    Left = 530
    Top = 8
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'doc'
    Filter = 'Ficheros DOC (*.doc)|*.doc|Todos              (*.*)|*.*'
    Left = 550
    Top = 52
  end
  object DSControl: TDataSource
    AutoEdit = False
    Left = 642
    Top = 5
  end
end
