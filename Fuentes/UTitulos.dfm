object WTitulos: TWTitulos
  Left = 317
  Top = 234
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Archivo de T'#205'TULOS'
  ClientHeight = 493
  ClientWidth = 789
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Shape1: TShape
    Left = 24
    Top = 34
    Width = 689
    Height = 1
    Pen.Color = 7552051
  end
  object Label3: TLabel
    Left = 24
    Top = 13
    Width = 147
    Height = 19
    Caption = 'Archivo de T'#237'tulos'
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
    Width = 769
    Height = 473
    Align = alClient
    Picture.Data = {07544269746D617000000000}
    DragTolerance = 5
    RegionData = {00000000}
  end
  object PanelSombra: TPanel
    Left = 23
    Top = 84
    Width = 652
    Height = 289
    BevelOuter = bvNone
    TabOrder = 8
    object Rejilla: TwwDBGrid
      Left = 0
      Top = 0
      Width = 652
      Height = 289
      TabStop = False
      DittoAttributes.ShortCutDittoField = 0
      DittoAttributes.ShortCutDittoRecord = 0
      DittoAttributes.Options = []
      DisableThemesInTitle = False
      PictureMaskFromDataSet = False
      Selected.Strings = (
        'TITULO'#9'6'#9'TITULO'
        'DESCRIPCION'#9'50'#9'DESCRIPCION'
        'Formula'#9'48'#9'FORMULA'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10841401
      FixedCols = 0
      ShowHorzScrollBar = False
      Align = alClient
      BorderStyle = bsNone
      Color = 15596540
      DataSource = SFichero
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
      OnCalcTitleAttributes = RejillaCalcTitleAttributes
      OnTitleButtonClick = RejillaTitleButtonClick
      OnDblClick = RejillaDblClick
      PadColumnStyle = pcsPlain
    end
  end
  object Datos: TGroupBox
    Left = 23
    Top = 372
    Width = 652
    Height = 106
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 20
      Width = 35
      Height = 16
      AutoSize = False
      Caption = 'T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 114
      Top = 20
      Width = 66
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
    object Label6: TLabel
      Left = 132
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 198
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 263
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 329
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 394
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 592
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 73
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 135
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 201
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 266
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 332
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 397
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 15
      Top = 52
      Width = 66
      Height = 16
      AutoSize = False
      Caption = 'F'#243'rmula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 458
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 524
      Top = 52
      Width = 13
      Height = 16
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 461
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 527
      Top = 76
      Width = 6
      Height = 16
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eNombre: TOvcDbPictureField
      Left = 185
      Top = 18
      Width = 398
      Height = 20
      DataField = 'DESCRIPCION'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      PictureMask = '!'
      TabOrder = 1
    end
    object eCampoInicial: TOvcDbPictureField
      Left = 55
      Top = 18
      Width = 41
      Height = 20
      DataField = 'TITULO'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      PictureMask = '!'
      TabOrder = 0
      OnEnter = SoloSiAniadir
    end
    object OvcSuma2: TOvcDbPictureField
      Left = 151
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA2'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 3
    end
    object OvcSuma3: TOvcDbPictureField
      Left = 216
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA3'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 4
    end
    object OvcSuma4: TOvcDbPictureField
      Left = 282
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA4'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 5
    end
    object OvcSuma5: TOvcDbPictureField
      Left = 347
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA5'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 6
    end
    object OvcSuma6: TOvcDbPictureField
      Left = 412
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA6'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 7
    end
    object OvcResta1: TOvcDbPictureField
      Left = 86
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA1'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 10
    end
    object OvcResta2: TOvcDbPictureField
      Left = 151
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA2'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 11
    end
    object OvcResta3: TOvcDbPictureField
      Left = 216
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA3'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 12
    end
    object OvcResta4: TOvcDbPictureField
      Left = 282
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA4'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 13
    end
    object OvcResta5: TOvcDbPictureField
      Left = 347
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA5'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 14
    end
    object OvcResta6: TOvcDbPictureField
      Left = 412
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA6'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 15
    end
    object OvcSuma1: TOvcDbPictureField
      Left = 86
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA1'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 2
    end
    object OvcSuma7: TOvcDbPictureField
      Left = 476
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA7'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 8
    end
    object OvcSuma8: TOvcDbPictureField
      Left = 542
      Top = 50
      Width = 41
      Height = 20
      DataField = 'SUMA8'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 9
    end
    object OvcResta7: TOvcDbPictureField
      Left = 476
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA7'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 16
    end
    object OvcResta8: TOvcDbPictureField
      Left = 542
      Top = 74
      Width = 41
      Height = 20
      DataField = 'RESTA8'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      PictureMask = '!'
      TabOrder = 17
    end
  end
  object Panel1: TPanel
    Left = 680
    Top = 39
    Width = 105
    Height = 431
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object BtnNavAniadir: TfcImageBtn
      Left = 10
      Top = 14
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = '&A'#241'adir'
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
      TabOrder = 0
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clLime
      OnClick = BtnNavAniadirClick
      OnMouseEnter = fcImageBtnMouseEnter
      OnMouseLeave = fcImageBtnMouseLeave
      RegionData = {
        3000000020000000010000000100000010000000000000000000000053000000
        1900000000000000000000005300000019000000}
      DownRegionData = {00000000}
    end
    object BtnNavBorrar: TfcImageBtn
      Left = 10
      Top = 74
      Width = 83
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
      TabOrder = 1
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clLime
      OnClick = BtnNavBorrarClick
      OnMouseEnter = fcImageBtnMouseEnter
      OnMouseLeave = fcImageBtnMouseLeave
      RegionData = {
        3000000020000000010000000100000010000000000000000000000053000000
        1900000000000000000000005300000019000000}
      DownRegionData = {00000000}
    end
    object BtnNavCerrar: TfcImageBtn
      Left = 10
      Top = 400
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
      ParentClipping = True
      ParentFont = False
      ShadeStyle = fbsNormal
      TabOrder = 2
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clLime
      OnClick = BtnNavCerrarClick
      OnMouseEnter = fcImageBtnMouseEnter
      OnMouseLeave = fcImageBtnMouseLeave
      RegionData = {
        3000000020000000010000000100000010000000000000000000000053000000
        1900000000000000000000005300000019000000}
      DownRegionData = {00000000}
    end
    object BtnEdtGuardar: TfcImageBtn
      Left = 10
      Top = 227
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
      ParentClipping = True
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
    object BtnEdtCancelar: TfcImageBtn
      Left = 10
      Top = 254
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
      NumGlyphs = 0
      ParentClipping = True
      ParentFont = False
      ShadeStyle = fbsNormal
      TabOrder = 4
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
    object Navegador: TDBNavegadorNotarios
      Left = 6
      Top = 175
      Width = 88
      Height = 43
      TabOrder = 5
      DataSource = SFichero
    end
    object BtnNavFiltro: TfcImageBtn
      Left = 40
      Top = 344
      Width = 28
      Height = 28
      Cursor = crHandPoint
      Color = clNone
      DitherColor = clWhite
      DitherStyle = dsDither
      Image.Data = {
        424D660900000000000036000000280000001C0000001C000000010018000000
        00003009000000000000000000000000000000000000BE0000BE0000BE0000BE
        0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000
        BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE00
        00BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE
        0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000
        BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE00
        00BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBE0000BE0000BE0000BE0000FFFFFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFFFFFFFF3FCFFF3FCFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFF
        BE0000BE0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF3FCFFFFFFFFFFFFFFFFFFFFFFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000
        FFFFFF797E80000000000000000000000000121213FFFFFF1212130000000000
        00C1C8CAFFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFF858A8C000000989FA1
        858A8C858A8C9CA2A4FFFFFF9CA2A4858A8C7C8284DFE7EAF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE
        0000BE0000BE0000FFFFFF797E80000000FFFFFFFFFFFFFFFFFFFFFFFFF3FCFF
        FFFFFFFFFFFFFFFFFFF3FCFFF3FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFFFF
        FFFFF3FCFF0000004E5152E6EFF2F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFF
        E8C8CABE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000D976
        78FFFFFFBE0000BE0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFF757A7BC9
        D2D4FFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFEEE7EADB8385DD8C8EDD8C8E
        DD8C8EDD8C8EDD8C8EDD8C8EDD8C8EDB8385E8C5C8FFFFFFBE0000BE0000BE00
        00BE0000FFFFFF989FA125262637393A1212131E1F1F5D6162FFFFFFF3FCFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFF989FA12526
        2633353637393A2E30305D6162FFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFF
        BE0000BE0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000
        FFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFFF3FCFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE
        0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FCFF
        FFFFFFFFFFFFFFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFF9C
        A2A42E3030333536333536333536626667FFFFFF5D61622D2E2E1E1F1FD0D7DA
        F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFFFFFFFBE0000BE0000BE0000BE0000FFFFFF858A8C0000002D2E2E2D2E2E00
        0000333536FFFFFF5D61622D2E2E1E1F1FD0D7DAF3FCFFF3FCFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE00
        00BE0000FFFFFF7C8284000000FFFFFFFFFFFF333536353738FFFFFFFFFFFFFF
        FFFFFFFFFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFFE6EFF28184
        851E1F1F2D2E2E000000393B3CFFFFFFF3FCFFF3FCFFF3FCFFF3FCFFECD7DACB
        1F1FCE3535CE3535CE3535CE3535CE3535CE3535CE3535CC2626E19FA1FFFFFF
        BE0000BE0000BE0000BE0000FFFFFFFFFFFFFFFFFF2D2E2E4B4E4F0000003335
        36FFFFFFF3FCFFF3FCFFF3FCFFF3FCFFECD7DACB1F1FCE3535CE3535CE3535CE
        3535CE3535CE3535CE3535CC2626E19FA1FFFFFFBE0000BE0000BE0000BE0000
        FFFFFFBEC5C88184859CA2A4A1A7A95B5B5B676869FFFFFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3
        FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFF717678000000000000
        0000005B5B5BF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE
        0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFF3FCFFF3FCFFF3FCFFF3FCFFFFFFFFBE0000BE0000BE0000BE0000FFFFFFF3
        FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFF
        F3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FCFFF3FC
        FFFFFFFFBE0000BE0000BE0000BE0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE0000BE0000BE00
        00BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE
        0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000
        BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE00
        00BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE
        0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000BE0000
        BE0000BE0000}
      NumGlyphs = 0
      ParentClipping = True
      ShadeStyle = fbsNormal
      TabOrder = 6
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clPurple
      OnClick = VerTabla
      RegionData = {
        300000002000000001000000010000001000000000000000000000001C000000
        1C00000000000000000000001C0000001C000000}
      DownRegionData = {00000000}
    end
    object BtnNavImprimir: TfcImageBtn
      Left = 10
      Top = 125
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = '&Imprimir'
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
      TabOrder = 7
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clLime
      OnClick = BtnNavImprimirClick
      OnMouseEnter = fcImageBtnMouseEnter
      OnMouseLeave = fcImageBtnMouseLeave
      RegionData = {
        3000000020000000010000000100000010000000000000000000000053000000
        1900000000000000000000005300000019000000}
      DownRegionData = {00000000}
    end
    object BtnNavModificar: TfcImageBtn
      Left = 10
      Top = 44
      Width = 83
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
      TabOrder = 8
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      TransparentColor = clLime
      OnClick = RejillaDblClick
      OnMouseEnter = fcImageBtnMouseEnter
      OnMouseLeave = fcImageBtnMouseLeave
      RegionData = {
        3000000020000000010000000100000010000000000000000000000053000000
        1900000000000000000000005300000019000000}
      DownRegionData = {00000000}
    end
  end
  object FiltroBuscar: TGroupBox
    Left = 23
    Top = 37
    Width = 652
    Height = 44
    Caption = ' Buscar '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 114
      Top = 21
      Width = 65
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label5: TLabel
      Left = 15
      Top = 21
      Width = 32
      Height = 13
      Caption = 'T'#237'tulo'
    end
    object FiltroBDescripcion: TOvcDbPictureField
      Left = 185
      Top = 18
      Width = 367
      Height = 20
      Cursor = crHandPoint
      DataField = 'BDescripcion'
      DataSource = sFiltro
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
      MaxLength = 30
      ParentFont = False
      PictureMask = '!'
      TabOrder = 0
      OnEnter = LimpiarFiltro
    end
    object FiltroBTitulo: TOvcDbPictureField
      Left = 55
      Top = 18
      Width = 39
      Height = 21
      DataField = 'BTitulo'
      DataSource = sFiltro
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
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      PictureMask = '!'
      TabOrder = 1
    end
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
    TabOrder = 3
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clNone
    OnClick = BtnNavCerrarClick
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
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 779
    Top = 10
    Width = 10
    Height = 473
    Align = alRight
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 5
  end
  object Panel4: TPanel
    Left = 0
    Top = 483
    Width = 789
    Height = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 6
  end
  object fcImageBtnMinimizar: TfcImageBtn
    Left = 723
    Top = 13
    Width = 24
    Height = 17
    Cursor = crHandPoint
    Color = clNone
    DitherColor = clWhite
    DitherStyle = dsDither
    Image.Data = {
      424DFE0400000000000036000000280000001800000011000000010018000000
      0000C8040000000000000000000000000000000000007A59496C4B3B5335243D
      2110381F0B3F2713422D17402B1538260F3828113C2D133F30163D31153B2F13
      392D11352A0E3A30123B30143C31163B301A3A2F1B372A1A322719302418A479
      6A92695A7953415F3E2B5133204F3622563F295B463043321845341A43321840
      2F1548351A5441265542274E3B204D3B1E48371C47361C4736214232213A2B1B
      372A1C392D21C99888BC8E7DA97E6B976D5A8A6551856450866A52886E567A62
      4A7D684D7E694E7D684D7E694D816C50836D51816C4D7F6749816749846C5085
      6D5577624D5D4B3A4738283E3121E7B5A1E1AF9BD7A591CD9B87C4957FBE927B
      BC927BB9947ABA997FB5987DB49A7CB49C7EB09B7CAC9778AC9978B29C79B898
      74BD9975C29F7DC3A183AF9077896F57624F3A4F3E29E6BAA2E5B79FE2B099DE
      AB91D9A68CD5A288D09F85CAA083D1AD8FC2A684BDA482C0AD8AC2B28EBAAD87
      B6A983BCAA81CEAC81D2AA80D7AC85D5AD8AC59F819D7F64755D45604C33DCB9
      98DBB595DAAE8FD8A98AD7A385D5A282D2A181CCA180C8A583B89E79B5A47DC1
      BA8FCBC89CBFC094ADAE82AAA273C7A97ACDA374D2A57AD4A781C79C7BA37E62
      795E44614A30D7BD98D6B994D6B28ED4AA87D5A583D3A37FD1A47FCDA680BDA0
      79B6A57ABBB689CFD3A2DAE5B3CFDBA9B0BF8CA1A571BDA773C7A270CFA276D5
      A680CA9D7CA47D6175573E593F27D1C399D0BE95D0B68ECFAF86CFA881CFA67F
      CAA67EC3A87CBEAE80C2BE8DCBD4A1D8EAB5DFF7C1D7F2BABFDAA2B3C289BDB1
      7BC5A776CAA579D3A782C99D80A57D64765740583D28CDC296CDBD92CEB68CCD
      AF86CCA880C8A57AC3A378BCA578C8BE8FCFD2A0D7E7B2D8F1B9D8F5BDD7F7BE
      CEEBB3CBDCA3C1BB86C3AD7DC6A479CBA380C49A7DA47E667B5C47604531D6C4
      9BD2BE95CFB28BCBAB82CAA37CCBA47DCFAF86D0B98CDBD1A2D8DBA9D9E6B2D9
      EDB8D7EFB9D6EFB7D8EFB8E2EFB9DFD8A6D6C293D0B087D0AA87C79F82A58268
      775B4359412BD7BC97D6B994D6B28ED1A986CFA37ECCA27DCCA781C9AC85DAC9
      9ED1CB9EC9CD9CC3CC9AC0CB99C2CD9BCCD3A0D6D7A5D5CA98CDB688C8A87FCA
      A481C29C7CA38164775C42594129DDB494E0B495E0B192DCA88AD7A183D19D7F
      CD9E7EC6A07ED1B48FC8B38DBEB086B5AC81B2A97EB5A97FBEAE84C4B388CDB6
      88C6A97CC4A176C7A079C19B78A58261785C3D594123E3B39BE7B69CE6B29BDE
      A88FD8A087D49E85CE9D83C89C7FC5A183C0A482C0A583BDA581BBA280BBA17D
      BA9E7BBB9E79CAAC83C8A67BC9A27BCCA57FC59F7CA885637A5E3C594020E8BA
      A8ECBFAAEABAA8DFAD99D8A591D8A692D7A893D1A58ECBA28BCAA78DCCAB91CF
      AF92D1B096CFAF92CDAB8ECCA88AD2AF8DD4B08CD8AF8EDBB291D2AB8BB79171
      876849644728EBC7B7F0CCBCEDC6B7DFB8A9DAB2A0E0B8A6E2BAA8DCB6A4DFBA
      A6DCB9A5DABAA3DCBCA5E0C0A9E2C2ABE3C4ABE4C2AAE1BEA4E5C0A4E8C1A5E8
      C1A5E4BCA0CDA68AA48265826245E6D1C2EED9CAEDD6C7DFC8B9DCC3B3E5CBBB
      EACDBEE5C8B9EDD1C0E9CDBCE6CBB7E6CBB7E7CEBAEAD1BDEAD2BCEAD2BCECCE
      BBEFCFBCF1CDBBF1CCB8F1C9B6E4BDA7C8A18BAB8670E4D7C9EEE1D3EFDFD2E3
      D3C6E2CFC0EAD7C8F0D9CAE9D2C3F3DACAF0D7C7EED6C4EED6C4EED8C6EDD7C5
      E8D5C0E6D0BEF3D9C9F7D7CAF5D4C5F5D1C1F8D1C2F5CDBBE1B9A6CBA390}
    ParentClipping = False
    ShadeStyle = fbsNormal
    TabOrder = 7
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TransparentColor = clNone
    OnClick = fcImageBtnMinimizarClick
    RegionData = {
      4000000020000000010000000200000020000000000000000000000018000000
      1100000001000000000000001800000001000000000000000100000018000000
      11000000}
    DownRegionData = {00000000}
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    Color = 10720647
    TabOrder = 9
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
    Left = 632
    Top = 8
  end
  object SFichero: TwwDataSource
    AutoEdit = False
    DataSet = QFichero
    Left = 488
    Top = 373
  end
  object QFichero: TIBTableSet
    Transaction = Transaccion
    OnCalcFields = QFicheroCalcFields
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TITULOS'
      'WHERE'
      
        '  TITULO                         =:old_TITULO                   ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO TITULOS'
      
        '  (TITULO                         ,DESCRIPCION                  ' +
        '  ,SUMA8                          ,RESTA7                       ' +
        '  ,RESTA8                         ,SUMA7                        ' +
        '  ,RESTA6                         ,RESTA5                       ' +
        '  ,RESTA4                         ,RESTA3                       ' +
        '  ,RESTA2                         ,RESTA1                       ' +
        '  ,SUMA6                          ,SUMA5                        ' +
        '  ,SUMA4                          ,SUMA3                        ' +
        '  ,SUMA2                          ,SUMA1                        ' +
        '  )'
      'VALUES'
      
        '  (:TITULO                         ,:DESCRIPCION                ' +
        '    ,:SUMA8                          ,:RESTA7                   ' +
        '      ,:RESTA8                         ,:SUMA7                  ' +
        '        ,:RESTA6                         ,:RESTA5               ' +
        '          ,:RESTA4                         ,:RESTA3             ' +
        '            ,:RESTA2                         ,:RESTA1           ' +
        '              ,:SUMA6                          ,:SUMA5          ' +
        '                ,:SUMA4                          ,:SUMA3        ' +
        '                  ,:SUMA2                          ,:SUMA1      ' +
        '                    )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TITULOS'
      'WHERE'
      
        '  TITULO                         =?TITULO                       ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM TITULOS')
    ModifySQL.Strings = (
      'UPDATE TITULOS'
      'SET'
      
        '  DESCRIPCION                    =:DESCRIPCION                  ' +
        '   '
      
        '  ,SUMA8                          =:SUMA8                       ' +
        '    '
      
        '  ,RESTA7                         =:RESTA7                      ' +
        '    '
      
        '  ,RESTA8                         =:RESTA8                      ' +
        '    '
      
        '  ,SUMA7                          =:SUMA7                       ' +
        '    '
      
        '  ,RESTA6                         =:RESTA6                      ' +
        '    '
      
        '  ,RESTA5                         =:RESTA5                      ' +
        '    '
      
        '  ,RESTA4                         =:RESTA4                      ' +
        '    '
      
        '  ,RESTA3                         =:RESTA3                      ' +
        '    '
      
        '  ,RESTA2                         =:RESTA2                      ' +
        '    '
      
        '  ,RESTA1                         =:RESTA1                      ' +
        '    '
      
        '  ,SUMA6                          =:SUMA6                       ' +
        '    '
      
        '  ,SUMA5                          =:SUMA5                       ' +
        '    '
      
        '  ,SUMA4                          =:SUMA4                       ' +
        '    '
      
        '  ,SUMA3                          =:SUMA3                       ' +
        '    '
      
        '  ,SUMA2                          =:SUMA2                       ' +
        '    '
      
        '  ,SUMA1                          =:SUMA1                       ' +
        '    '
      'WHERE'
      
        '  TITULO                         =:TITULO                       ' +
        '   ')
    TableName = 'TITULOS'
    Left = 441
    Top = 372
    object QFicheroTITULO: TIBStringField
      Alignment = taCenter
      DisplayWidth = 6
      FieldName = 'TITULO'
      Size = 2
    end
    object QFicheroDESCRIPCION: TIBStringField
      DisplayWidth = 50
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object QFicheroFormula: TStringField
      DisplayLabel = 'FORMULA'
      DisplayWidth = 48
      FieldKind = fkCalculated
      FieldName = 'Formula'
      Size = 40
      Calculated = True
    end
    object QFicheroSUMA1: TIBStringField
      FieldName = 'SUMA1'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA2: TIBStringField
      FieldName = 'SUMA2'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA3: TIBStringField
      FieldName = 'SUMA3'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA4: TIBStringField
      FieldName = 'SUMA4'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA5: TIBStringField
      FieldName = 'SUMA5'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA6: TIBStringField
      FieldName = 'SUMA6'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA1: TIBStringField
      FieldName = 'RESTA1'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA2: TIBStringField
      FieldName = 'RESTA2'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA3: TIBStringField
      FieldName = 'RESTA3'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA4: TIBStringField
      FieldName = 'RESTA4'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA5: TIBStringField
      FieldName = 'RESTA5'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA6: TIBStringField
      FieldName = 'RESTA6'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA7: TIBStringField
      FieldName = 'SUMA7'
      Origin = 'TITULOS.SUMA7'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA8: TIBStringField
      FieldName = 'RESTA8'
      Origin = 'TITULOS.RESTA8'
      Visible = False
      Size = 3
    end
    object QFicheroRESTA7: TIBStringField
      FieldName = 'RESTA7'
      Origin = 'TITULOS.RESTA7'
      Visible = False
      Size = 3
    end
    object QFicheroSUMA8: TIBStringField
      FieldName = 'SUMA8'
      Origin = 'TITULOS.SUMA8'
      Visible = False
      Size = 3
    end
  end
  object Transaccion: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 442
    Top = 325
  end
  object TbFiltro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 688
    Top = 317
  end
  object sFiltro: TDataSource
    DataSet = TbFiltro
    Left = 738
    Top = 317
  end
end
