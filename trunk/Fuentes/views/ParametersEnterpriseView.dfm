object ParametersEnterpriseView: TParametersEnterpriseView
  Left = 455
  Top = 301
  BorderStyle = bsNone
  Caption = 'Parametros de la Empresa'
  ClientHeight = 549
  ClientWidth = 921
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
  object PnlBtn: TPanel
    Left = 802
    Top = 0
    Width = 119
    Height = 549
    Align = alRight
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = clSilver
    TabOrder = 0
    object BtnCancel: TSpeedButton
      Left = 16
      Top = 464
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
    object BtnAccept: TSpeedButton
      Left = 16
      Top = 424
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
    object BtnModify: TSpeedButton
      Left = 16
      Top = 72
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
  object PageControl: TPageControl
    Left = 16
    Top = 48
    Width = 769
    Height = 457
    ActivePage = TabSheetNominas
    TabOrder = 1
    OnChanging = PageControlChanging
    object TabSheetGeneral: TTabSheet
      Caption = 'General'
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
      object EditNOMBREFISCAL: TDBEdit
        Left = 18
        Top = 27
        Width = 417
        Height = 20
        AutoSize = False
        DataField = 'NOMBREFISCAL'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EditNIF: TDBEdit
        Left = 451
        Top = 27
        Width = 109
        Height = 20
        AutoSize = False
        DataField = 'NIF'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EditDIRECCION: TDBEdit
        Left = 74
        Top = 65
        Width = 361
        Height = 20
        AutoSize = False
        DataField = 'DIRECCION'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EditCODPOSTAL: TDBEdit
        Left = 18
        Top = 101
        Width = 85
        Height = 20
        AutoSize = False
        DataField = 'CODPOSTAL'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object EditPOBLACION: TDBEdit
        Left = 111
        Top = 101
        Width = 324
        Height = 20
        AutoSize = False
        DataField = 'POBLACION'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object EditPROVINCIA: TDBLookupComboBox
        Left = 451
        Top = 101
        Width = 272
        Height = 22
        DataField = 'PROVINCIA'
        DataSource = DataSource
        DropDownRows = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'NOMBRE'
        ListSource = SProvincias
        NullValueKey = 16462
        ParentFont = False
        TabOrder = 12
      end
      object EditTELEFONO: TDBEdit
        Left = 451
        Top = 140
        Width = 130
        Height = 20
        AutoSize = False
        DataField = 'TELEFONO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object EditCONTACTO: TDBEdit
        Left = 18
        Top = 140
        Width = 417
        Height = 20
        AutoSize = False
        DataField = 'CONTACTO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object EditFAX: TDBEdit
        Left = 610
        Top = 140
        Width = 113
        Height = 20
        AutoSize = False
        DataField = 'FAX'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object EditAsiento: TDBEdit
        Left = 547
        Top = 181
        Width = 82
        Height = 20
        AutoSize = False
        DataField = 'Asiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
      end
      object CheckBoxRECARGO: TDBCheckBox
        Left = 18
        Top = 277
        Width = 209
        Height = 17
        Caption = 'Asiento recargo individualizado'
        DataField = 'RECARGO'
        DataSource = DataSource
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
      object EditLONGITUD_SUBCUENTAS: TDBEdit
        Left = 473
        Top = 181
        Width = 35
        Height = 20
        AutoSize = False
        DataField = 'LONGITUD_SUBCUENTAS'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
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
        object BtnFECHA_INICIO_EJERCICIO: TSpeedButton
          Left = 78
          Top = 30
          Width = 22
          Height = 20
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
            777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
            79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
            777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
            79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
            CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
          NumGlyphs = 2
          ParentFont = False
        end
        object BtnFECHA_FIN_EJERCICIO: TSpeedButton
          Left = 174
          Top = 30
          Width = 22
          Height = 20
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
            777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
            79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
            777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
            79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
            CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
          NumGlyphs = 2
          ParentFont = False
        end
        object BtnFECHAAMORTIZACION: TSpeedButton
          Left = 270
          Top = 30
          Width = 22
          Height = 20
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
            777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
            79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
            777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
            79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
            CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
          NumGlyphs = 2
          ParentFont = False
        end
        object BtnFECHABLOQUEO: TSpeedButton
          Left = 374
          Top = 30
          Width = 22
          Height = 20
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
            777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
            79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
            777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
            79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
            CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
          NumGlyphs = 2
          ParentFont = False
        end
        object EditFECHA_INICIO_EJERCICIO: TDBEdit
          Left = 11
          Top = 30
          Width = 65
          Height = 20
          AutoSize = False
          DataField = 'FECHA_INICIO_EJERCICIO'
          DataSource = DataSource
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EditFECHA_FIN_EJERCICIO: TDBEdit
          Left = 107
          Top = 30
          Width = 65
          Height = 20
          AutoSize = False
          DataField = 'FECHA_FIN_EJERCICIO'
          DataSource = DataSource
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EditFECHAAMORTIZACION: TDBEdit
          Left = 203
          Top = 30
          Width = 66
          Height = 20
          AutoSize = False
          DataField = 'FECHAAMORTIZACION'
          DataSource = DataSource
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object EditFECHABLOQUEO: TDBEdit
          Left = 307
          Top = 30
          Width = 68
          Height = 20
          AutoSize = False
          DataField = 'FECHABLOQUEO'
          DataSource = DataSource
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object EditSIGLAVIA: TDBEdit
        Left = 18
        Top = 65
        Width = 45
        Height = 20
        AutoSize = False
        DataField = 'SIGLAVIA'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EditNUMEROCALLE: TDBEdit
        Left = 451
        Top = 65
        Width = 45
        Height = 20
        AutoSize = False
        DataField = 'NUMEROCALLE'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object EditESCALERA: TDBEdit
        Left = 502
        Top = 65
        Width = 45
        Height = 20
        AutoSize = False
        DataField = 'ESCALERA'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EditPISO: TDBEdit
        Left = 559
        Top = 65
        Width = 27
        Height = 20
        AutoSize = False
        DataField = 'PISO'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EditPUERTA: TDBEdit
        Left = 610
        Top = 65
        Width = 37
        Height = 20
        AutoSize = False
        DataField = 'PUERTA'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object EditCODADMON: TDBEdit
        Left = 15
        Top = 181
        Width = 63
        Height = 20
        AutoSize = False
        DataField = 'CODADMON'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object EditCCC: TDBEdit
        Left = 171
        Top = 181
        Width = 264
        Height = 20
        AutoSize = False
        DataField = 'CCC'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object CheckBoxGESTIONA_CARTERA_EFECTOS: TDBCheckBox
        Left = 18
        Top = 312
        Width = 209
        Height = 17
        Caption = 'Gestiona cartera de efectos'
        DataField = 'GESTIONA_CARTERA_EFECTOS'
        DataSource = DataSource
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
      object CheckBoxINCLUIR_ABREV: TDBCheckBox
        Left = 18
        Top = 347
        Width = 263
        Height = 17
        Caption = 'Incluir abrev. subcta en descripci'#243'n apunte'
        DataField = 'INCLUIR_ABREV'
        DataSource = DataSource
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
        object EditASIENTOS_INICIO_INTERVALO_BQDA: TDBEdit
          Left = 158
          Top = 34
          Width = 47
          Height = 20
          AutoSize = False
          DataField = 'ASIENTOS_INICIO_INTERVALO_BQDA'
          DataSource = DataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EditASIENTOS_FIN_INTERVALO_BQDA: TDBEdit
          Left = 224
          Top = 34
          Width = 47
          Height = 20
          AutoSize = False
          DataField = 'ASIENTOS_FIN_INTERVALO_BQDA'
          DataSource = DataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EditASIENTO_INICIO_INTERVALO_FILTRO: TDBEdit
          Left = 158
          Top = 63
          Width = 47
          Height = 20
          AutoSize = False
          DataField = 'ASIENTO_INICIO_INTERVALO_FILTRO'
          DataSource = DataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object EditASIENTO_FIN_INTERVALO_FILTRO: TDBEdit
          Left = 224
          Top = 63
          Width = 47
          Height = 20
          AutoSize = False
          DataField = 'ASIENTO_FIN_INTERVALO_FILTRO'
          DataSource = DataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object CheckBoxFILTRO_ASIENTOS_INICIO: TDBCheckBox
          Left = 15
          Top = 125
          Width = 209
          Height = 19
          Caption = 'Filtro asientos al inicio de ejercicio'
          DataField = 'FILTRO_ASIENTOS_INICIO'
          DataSource = DataSource
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
        object CheckBoxMOSTRAR_FILTRO_MAYOR: TDBCheckBox
          Left = 15
          Top = 96
          Width = 209
          Height = 17
          Caption = 'Mostrar filtro de mayor'
          DataField = 'MOSTRAR_FILTRO_MAYOR'
          DataSource = DataSource
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
      object RadioGroupBUSQUEDA_SUBCTAS: TDBRadioGroup
        Left = 312
        Top = 274
        Width = 123
        Height = 95
        Caption = ' B'#250'squeda Subctas '
        DataField = 'BUSQUEDA_SUBCTAS'
        DataSource = DataSource
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
      object EditFILTROSUCUENTAS: TDBEdit
        Left = 656
        Top = 181
        Width = 67
        Height = 21
        DataField = 'FILTROSUBCTAS'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
      end
      object CheckBoxACTCOMENTARIO: TDBCheckBox
        Left = 18
        Top = 294
        Width = 255
        Height = 17
        Caption = 'No modifica comentario en carga asientos'
        DataField = 'ACTCOMENTARIO'
        DataSource = DataSource
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
      object CheckBoxTRATASERIE: TDBCheckBox
        Left = 18
        Top = 365
        Width = 209
        Height = 17
        Caption = 'Serie y ejercicio en facturas'
        DataField = 'TRATASERIE'
        DataSource = DataSource
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
      object RadioGroupMONEDA: TDBRadioGroup
        Left = 664
        Top = 1
        Width = 89
        Height = 51
        Caption = ' Moneda '
        DataField = 'MONEDA'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Items.Strings = (
          'PESETA'
          'EURO')
        ParentFont = False
        TabOrder = 3
        Values.Strings = (
          'P'
          'E')
      end
      object RadioGroupTIPOEMPRESA: TDBRadioGroup
        Left = 567
        Top = 1
        Width = 98
        Height = 51
        Caption = ' Tipo Empresa '
        DataField = 'TIPOEMPRESA'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Items.Strings = (
          'F'#205'SICA'
          'JUR'#205'DICA')
        ParentFont = False
        TabOrder = 2
        Values.Strings = (
          'F'
          'J')
      end
    end
    object TabSheetNominas: TTabSheet
      Caption = 'N'#243'minas'
      ImageIndex = 1
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 761
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
        object CheckBoxASIENTO_NOMINA_INDIVIDUAL: TDBCheckBox
          Left = 19
          Top = 174
          Width = 193
          Height = 17
          Caption = 'Asiento n'#243'mina individualizado'
          DataField = 'ASIENTO_NOMINA_INDIVIDUAL'
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
        Top = 263
        Width = 761
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
    object TabSheetCierreEjercicio: TTabSheet
      Caption = 'Cierre Ejercicio'
      ImageIndex = 2
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
            DataSource = DataSource
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
          DataSource = DataSource
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
          DataSource = DataSource
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
    object TabSheetDocumentos: TTabSheet
      Caption = 'Documentos'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 34
        Top = 64
        Width = 688
        Height = 225
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
          Top = 40
          Width = 664
          Height = 161
          Caption = ' NOMBRES DE CARTAS MODELO '
          TabOrder = 0
          object Label17: TLabel
            Left = 12
            Top = 30
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
            Top = 57
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
            Top = 84
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
          object BtnDocCliente: TSpeedButton
            Left = 631
            Top = 27
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
          end
          object BtnDocProveedor: TSpeedButton
            Left = 631
            Top = 54
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
          end
          object BtnDoc347: TSpeedButton
            Left = 631
            Top = 81
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
          end
          object EditDOCCLIENTE: TDBEdit
            Left = 192
            Top = 27
            Width = 442
            Height = 20
            AutoSize = False
            Color = 14275008
            Ctl3D = False
            DataField = 'DOCCLIENTE'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object EditDOCPROVEEDOR: TDBEdit
            Left = 192
            Top = 54
            Width = 442
            Height = 20
            AutoSize = False
            Color = 14275008
            Ctl3D = False
            DataField = 'DOCPROVEEDOR'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object EditDOC347: TDBEdit
            Left = 192
            Top = 81
            Width = 442
            Height = 20
            AutoSize = False
            Color = 14275008
            Ctl3D = False
            DataField = 'DOC347'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object CBImprimir: TDBCheckBox
            Left = 194
            Top = 120
            Width = 281
            Height = 17
            Caption = #191'Previsualizar documento antes de imprimir?'
            DataField = 'DOCIMPRIMIR'
            DataSource = DataSource
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'doc'
    Filter = 'Ficheros DOC (*.doc)|*.doc|Todos              (*.*)|*.*'
    Left = 262
    Top = 4
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = DataModuleParametersEnterprise.QParametros
    Left = 369
    Top = 5
  end
  object SProvincias: TDataSource
    AutoEdit = False
    Left = 441
    Top = 5
  end
end
