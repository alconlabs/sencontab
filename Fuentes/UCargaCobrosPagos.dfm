object WCargaCobrosPagos: TWCargaCobrosPagos
  Left = 386
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Carga R'#225'pida de Cobros / Pagos'
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
    Width = 264
    Height = 19
    Caption = 'Carga R'#225'pida de Cobros / Pagos'
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
      object Datos: TGroupBox
        Left = 0
        Top = 97
        Width = 0
        Height = 218
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
        object PermBorrar: TfcShapeBtn
          Left = 701
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
          TabOrder = 2
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermBorrarClick
        end
        object GridEdtCobrosPagos: TwwDBGrid
          Left = 15
          Top = 8
          Width = 670
          Height = 200
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
            'TRAMITACION;CheckBox;S;N'
            'DESCRIPCION;CustomEdit;eOperacion'
            'ID_INSTRUMENTOS;CustomEdit;eOperacion'
            'BASE_ARANCEL;CustomEdit;eBaseArancel')
          IniAttributes.Delimiter = ';;'
          TitleColor = 10841401
          FixedCols = 0
          ShowHorzScrollBar = False
          BorderStyle = bsNone
          Color = 15596540
          DataSource = SCobrosPagos
          Font.Charset = ANSI_CHARSET
          Font.Color = 10657371
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyOptions = [dgEnterToTab, dgAllowInsert]
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
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
          PadColumnStyle = pcsPlain
        end
        object PermAniadir: TfcShapeBtn
          Left = 701
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
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermAniadirClick
        end
        object PermBqdaDiario: TfcShapeBtn
          Left = 701
          Top = 90
          Width = 23
          Height = 22
          Hint = 'B'#250'squeda en Diario'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 3
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermBqdaDiarioClick
        end
        object PermBqdaCartera: TfcShapeBtn
          Left = 701
          Top = 115
          Width = 23
          Height = 22
          Hint = 'Cartera de Efectos'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF00000000000000FFFFFFFFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFFFFFFFFFFFFFF0F888888888F0FFFFFFFFFFFFFFFFFFF0FFFFFFFFFF
            000FFFFFFFFFFFFFFFFFF0F8888FF000F000FFFFFFFFFFFFFFFFF0FFFFFFF0FF
            00B80FFFFFFFFFFFFFFFF0F00000F0FFF0B70FFFFFFFFFFFFFFFF0FFFFFFF0F0
            FF0B80FFFFFFFFFFFFFFF0000000000FFF0B70FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0B80FFFFFFFFFFFFFFFFFFFFFFFFFFFF0B80FFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0050FFFFFFFFFFFFFFFFFFFFFFFFFFFF0550FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 4
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermBqdaCarteraClick
        end
        object PermMayor: TfcShapeBtn
          Left = 701
          Top = 140
          Width = 23
          Height = 22
          Hint = 'Mayor de Subcuenta'
          Color = 14275008
          DitherColor = clWhite
          Glyph.Data = {
            CA050000424DCA05000000000000360000002800000016000000150000000100
            18000000000094050000120B0000120B00000000000000000000D9D1C0D9D1C0
            D9D1C0D9D1C0D9D1C0D9D1C0D9D1C0D9D1C0DED5C0B3B2BC7078B1797CAB9494
            9F9295A2878DAA9B9EA18D93AB7D86B77A82B5828ABF3A3A3DD5CDBD0000D9D1
            C0D9D1C0D9D1C0D9D1C0D9D1C0D9D1C0D9D1C0D9D1C0DBD2BCD8D5DA7584FF77
            8DFEEFF4ED97A1F05669FEC0C5E2D6D7DF5769F81733FFB8C1FF575557D6CEBD
            0000D9D1C0D9D1C0D9D1C0DAD2C0DBD3C2DBD3C2DBD3C2DBD3C2D9D1BFF5EDD4
            A6ADF87C97E4C1CDBC5464E31632FF7581C4BEBCAA6775E01933FEF4F7FF5A57
            56D6CEBD0000D9D1C0D9D1C0DAD2C1D1C9B8BDB6A6C0B9A9C1B9AAC1B9A9BEB6
            A6D6CFBA949EEE8C96DAABB1D4354CFC5A6BF16D7EF0CCCFD97685F01A34FFF1
            F4FF595655D6CEBD0000D9D1C0DBD3C2CAC2B27770682824243C3D3C343A3936
            3A392D333283857A9AA2F17898E0607EE3253DFF9397BC5F6DD89AA1C16172DF
            1833FDF3F6FF5A5756D6CEBD0000DBD3C2C7BFB07C78704C484AA7B8B493DAD3
            78C6B984C6B980C7B8B4EBD99AA2EA6472EA4156F6586AEBCBCCD5B6B8D48F99
            EC6374F61B36FFEDF0FF5A5756D6CEBD0000CAC2B4817D776F6A6DB1C5C034A5
            921CD4B62AAE7539B17D29A26F8CE3B8A8ADF42F41F2273FFC7D89CFB5B8B3B4
            B39C5F6DD74156EE1731FEECEFFE5C5857D6CEBD000069655F656668918C8D93
            B0AB52B4AD51ADAA66A29465A094629C8C9BCCCC8591FE1733FF445AE9959AB3
            B9BBB5B7B8B19CA4CD3F55F41D37FCC0C8FF585456D6CEBD0000222021797B7B
            6367675D555873575B775B5E6A5F67665D64675C5D8584A89FA9FF8599F295A1
            D39B9C9F9999989FA0A0B3B7B58995D88692E5A5AEFF534F53D6CEBD00007D78
            728E8E8FB6B4B3B9DADA7FD5D580D0D08AD0CE8CCFCF84CDCDBEE4E0FFFFF3E3
            EFE2C8D2CABCBCBAAEAFB0AAACACBABCBCC9C7BBDDDDCEFFFFF6565150D6CEBD
            0000D3CBBB87817A8E8586D0F2F344E5E62AFFFF53FFFF6FFFFF5DFFFFA4FFFF
            FEF5F5D4DBDEB5C0C1B5B5B4AEB0B1999C9CA5A7A8A5A6A7BEC1C2EEECEE514C
            4CD6CEBD0000DBD3C2D1CABA999289877C7B8CA4A579DADB75CCCC8CC9C980C8
            C8B6E1E1FFFFFFE9E8E8D2D7D7CCD1D2C5CACBB9BBBBBBBDBCAAABACC1C3C4FE
            FFFF645F5DD6CEBD0000D9D1C0DED6C4D3CBBA57534E7163657B5C5E795B5E75
            5E626B565CB19A9FFFFFFFFFF8FAFEF3F8FFEDF0FFE3E5F1DCDDE6E4E4E1E2E1
            EAEAEBC5C5C7A8A297D8D0BF0000DAD2C1D9D2C0706D665F5C5C88818188B3AE
            64B1AD70ACA971A1987CB7B192CCC191D7D394CABF91CFC983D3CCA1E4DFADB2
            B2BFBBBB8B8D8D65635FD0C9B8D9D1C00000DCD4C256544B6364619CA4A3439E
            9329D9BD31B6843DA56C40A16735A0683294572A9D6637905323B59301C0B064
            B2ADA4A6A54C494C56544FAEA89AD8D0BFD9D1C0000067655F808180989594A7
            C6C85ABEBF57C2BA65B8A76CC2AE68BEAB69C3AF65B39F62AF9B65B5A26AD2C9
            7EC5C2949A9A413F4055524CB9B2A3DCD3C2D9D1C0D9D1C00000221F1F5A5C5C
            4F4D4D4C4141584041583D3F5741435944465745455744465641445740415642
            435B4244533C3E6E6865AEA99CCAC3B2DAD2C1D9D1C0D9D1C0D9D1C000007C79
            74BDBFBECFC9C9C4E5E5A2E7E7B0E4E4A4E6E6A1E6E6A2E6E6A2E6E6A2E6E6A3
            E6E6A1E6E69FE5E5CEEAEAB8A4A48A807CCBC5B6DBD3C2D9D1C0D9D1C0D9D1C0
            0000CDC6B67D7A738C8284C4FEFE0DE1E00BF5F633E3E342DDDF3ADFE13BDFE1
            3BDFE13BDFE140DDDF2EE8E90EE5E576CBCBB5B2B27C736FC6BEAEDAD2C1D9D1
            C0D9D1C00000D9D1C0D0C9BA96928B8D8081AFCBCA99FFFF8DF7FBA5F3F79FF4
            F99FF4F99FF4F99FF4F9A3F3F79BF8FA61FEFF9EFFFFD6DBDBC7C3C4ACACA9C7
            C0B1D9D1C0D9D1C00000D9D1C0D9D1C0D2CABA8F888063595A706E6F606A6B62
            6B6B636B6B636B6B636B6B636B6B626B6B636A6B666A6A6A6A6C65656270736E
            6A69682B2A27C0B9AAD9D1C00000}
          NumGlyphs = 0
          ParentClipping = True
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 5
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = PermMayorClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 0
        Height = 97
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LbSubcuenta: TLabel
          Left = 15
          Top = 16
          Width = 126
          Height = 14
          Caption = 'Subcuenta Banco / Caja'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbCtoSubcuenta: TLabel
          Left = 406
          Top = 16
          Width = 120
          Height = 14
          Caption = 'Concepto por Defecto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eConceptoDfto: TwwDBLookupCombo
          Left = 406
          Top = 31
          Width = 55
          Height = 21
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
          DataField = 'ID_CONCEPTOS_DFTO'
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
        object eSubcuentaBanco: TwwDBLookupCombo
          Left = 15
          Top = 31
          Width = 91
          Height = 21
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
          DataField = 'SUBCUENTABANCO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTABanco
          LookupField = 'subcuenta'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnNotInList = eSubcuentaBancoNotInList
        end
        object eSubcuentaBancoDesc: TwwDBLookupCombo
          Left = 105
          Top = 31
          Width = 291
          Height = 21
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
          DataField = 'SUBCUENTABANCO'
          DataSource = SFichero
          LookupTable = DMContaRef.QSubCTABancoDesc
          LookupField = 'SUBCUENTA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eConceptoDftoDesc: TwwDBLookupCombo
          Left = 460
          Top = 31
          Width = 269
          Height = 21
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
          DataField = 'ID_CONCEPTOS_DFTO'
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
        object oGenerarUnicoAsiento: TCheckBox
          Left = 15
          Top = 66
          Width = 200
          Height = 17
          TabStop = False
          Caption = 'Generar '#250'nico asiento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = oGenerarUnicoAsientoClick
        end
        object gTotalImporte: TGroupBox
          Left = 584
          Top = 55
          Width = 145
          Height = 36
          Caption = ' TOTAL IMPORTE '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object eTotalImporte: TOvcNumericField
            Left = 17
            Top = 15
            Width = 113
            Height = 17
            Cursor = crIBeam
            DataType = nftDouble
            AutoSize = False
            BorderStyle = bsNone
            CaretOvr.Shape = csBlock
            Color = 14275008
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Options = [efoReadOnly]
            ParentFont = False
            PictureMask = '###,###,###.##'
            TabOrder = 0
            TabStop = False
            RangeHigh = {73B2DBB9838916F2FE43}
            RangeLow = {73B2DBB9838916F2FEC3}
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = -103
        Width = 0
        Height = 103
        Align = alBottom
        Color = 14275008
        ParentColor = False
        TabOrder = 2
        object Label1: TLabel
          Left = 162
          Top = 61
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
        object Label7: TLabel
          Left = 108
          Top = 15
          Width = 109
          Height = 13
          Caption = 'Datos del Concepto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 11
          Top = 61
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
        object lSubcuenta: TLabel
          Left = 445
          Top = 15
          Width = 126
          Height = 13
          Caption = 'Datos de la Subcuenta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 445
          Top = 61
          Width = 158
          Height = 13
          Caption = 'Datos de la Cuenta Anal'#237'tica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 11
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
        object Label16: TLabel
          Left = 345
          Top = 61
          Width = 90
          Height = 13
          Caption = 'N'#250'mero Factura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 119
          Top = 61
          Width = 28
          Height = 13
          Caption = 'D / H'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eDescSubcuentaCBDESCSUBCUENTA: TwwDBLookupCombo
          Left = 536
          Top = 29
          Width = 196
          Height = 21
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
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F')
          DataField = 'SUBCUENTA'
          DataSource = SCobrosPagos
          LookupTable = DMContaRef.QSubCtaCobrosPagosDesc
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
          OnCloseUp = eSubcuentaCBSUBCUENTACloseUp
        end
        object eComentario: TOvcDbPictureField
          Left = 162
          Top = 75
          Width = 175
          Height = 21
          DataField = 'COMENTARIO'
          DataSource = SCobrosPagos
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
          TabOrder = 7
        end
        object eConceptoAsientoDesc: TwwDBLookupCombo
          Left = 162
          Top = 29
          Width = 274
          Height = 21
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
          DataField = 'ID_CONCEPTOS'
          DataSource = SCobrosPagos
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
        object eImporte: TOvcDbNumericField
          Left = 11
          Top = 75
          Width = 90
          Height = 21
          DataField = 'IMPORTE'
          DataSource = SCobrosPagos
          FieldType = ftFloat
          UseTFieldMask = True
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
          TabOrder = 5
          OnClick = ImporteClick
          OnExit = eDebeHaberExit
          OnKeyPress = PonerDecimal
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object eSubcuentaCBSUBCUENTA: TwwDBLookupCombo
          Left = 445
          Top = 29
          Width = 91
          Height = 21
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SUBCUENTA'#9'10'#9'SUBCUENTA'#9'F'
            'DESCRIPCION'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'SUBCUENTA'
          DataSource = SCobrosPagos
          LookupTable = DMContaRef.QSubCtaCobrosPagos
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
          OnCloseUp = eSubcuentaCBSUBCUENTACloseUp
          OnNotInList = eSubcuentaCBSUBCUENTANotInList
        end
        object eConceptoAsiento: TwwDBLookupCombo
          Left = 108
          Top = 29
          Width = 54
          Height = 21
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
          DataField = 'ID_CONCEPTOS'
          DataSource = SCobrosPagos
          LookupTable = DMContaRef.QConceptos
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
        object eAnaliticaNom: TwwDBLookupCombo
          Left = 536
          Top = 75
          Width = 196
          Height = 21
          AutoSize = False
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
          DataSource = SCobrosPagos
          LookupTable = DMRef.QAnaliticasNom
          LookupField = 'CUENTA'
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
        object eAnalitica: TwwDBLookupCombo
          Left = 445
          Top = 75
          Width = 91
          Height = 21
          AutoSize = False
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
          DataSource = SCobrosPagos
          LookupTable = DMRef.QAnaliticas
          LookupField = 'CUENTA'
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
        object eFecha: TwwDBDateTimePicker
          Left = 11
          Top = 29
          Width = 90
          Height = 21
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'FECHA'
          DataSource = SCobrosPagos
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
          DisplayFormat = 'dd/mm/yyyy'
        end
        object eFactura: TOvcDbPictureField
          Left = 345
          Top = 75
          Width = 90
          Height = 21
          DataField = 'NUMEROFACTURA'
          DataSource = SCobrosPagos
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
          MaxLength = 10
          ParentFont = False
          PictureMask = 'X'
          TabOrder = 8
        end
        object eDebeHaber: TOvcDbPictureField
          Left = 125
          Top = 75
          Width = 16
          Height = 21
          DataField = 'DEBEHABER'
          DataSource = SCobrosPagos
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
          MaxLength = 1
          ParentFont = False
          PictureMask = 'A'
          TabOrder = 6
          OnExit = eDebeHaberExit
        end
      end
    end
    object Movimientos: TOvcTabPage
      Tag = 1
      Caption = #218'ltimos Movimientos'
      TabColor = 14275008
      TextColor = clNavy
      object Label5: TLabel
        Left = 291
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
        Left = 365
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
        Left = 4
        Top = 3
        Width = 722
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
          'ASIENTO'#9'9'#9'ASIENTO'
          'APUNTE'#9'4'#9'APT'
          'FECHA'#9'10'#9'FECHA'
          'SUBCUENTA'#9'10'#9'SUBCUENTA'
          'ID_CONCEPTOS'#9'4'#9'CTO'
          'DescComentario'#9'48'#9'DESCRIPCION DEL APUNTE'
          'DEBEHABER'#9'2'#9'T'
          'IMPORTE'#9'14'#9'IMPORTE'
          'CONTRAPARTIDA'#9'10'#9'CONTRAP')
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
    NumGlyphs = 0
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
    Left = 650
    Top = 12
  end
  object Transaccion: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 495
    Top = 7
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
    object QMovimientosTIPOASIENTO: TIntegerField
      DisplayWidth = 10
      FieldName = 'TIPOASIENTO'
      Origin = 'DIARIO.TIPOASIENTO'
      Visible = False
    end
    object QMovimientosASIENTONOMINA: TIntegerField
      DisplayWidth = 10
      FieldName = 'ASIENTONOMINA'
      Origin = 'DIARIO.ASIENTONOMINA'
      Visible = False
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
  object SMovimientos: TDataSource
    AutoEdit = False
    DataSet = QMovimientos
    Left = 559
    Top = 7
  end
  object SCobrosPagos: TwwDataSource
    DataSet = QCobrosPagos
    Left = 230
    Top = 8
  end
  object QCobrosPagos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = QCobrosPagosAfterPost
    OnCalcFields = QCobrosPagosCalcFields
    OnNewRecord = QCobrosPagosNewRecord
    Left = 262
    Top = 12
    object QCobrosPagosFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QCobrosPagosSUBCUENTA: TStringField
      FieldName = 'SUBCUENTA'
      Size = 10
    end
    object QCobrosPagosSUBCUENTADESC: TStringField
      FieldKind = fkLookup
      FieldName = 'SUBCUENTADESC'
      LookupDataSet = DMContaRef.QSubCtaCobrosPagos
      LookupKeyFields = 'SUBCUENTA'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'SUBCUENTA'
      Size = 80
      Lookup = True
    end
    object QCobrosPagosIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QCobrosPagosDESCCONCEPTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCCONCEPTO'
      Size = 30
      Calculated = True
    end
    object QCobrosPagosID_DIARIO: TIntegerField
      FieldName = 'ID_DIARIO'
    end
    object QCobrosPagosID_CARTERAEFECTOS: TIntegerField
      FieldName = 'ID_CARTERAEFECTOS'
    end
    object QCobrosPagosNUMEROFACTURA: TStringField
      FieldName = 'NUMEROFACTURA'
      Size = 10
    end
    object QCobrosPagosCUENTA_ANALITICA: TStringField
      FieldName = 'CUENTA_ANALITICA'
      Size = 10
    end
    object QCobrosPagosSITUACION: TStringField
      FieldName = 'SITUACION'
      Size = 1
    end
    object QCobrosPagosASIENTO_GENERADO: TIntegerField
      FieldName = 'ASIENTO_GENERADO'
    end
    object QCobrosPagosCOMENTARIO: TStringField
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QCobrosPagosID_CONCEPTOS: TVarBytesField
      FieldName = 'ID_CONCEPTOS'
      Size = 3
    end
    object QCobrosPagosDEBEHABER: TStringField
      FieldName = 'DEBEHABER'
      Size = 1
    end
    object QCobrosPagosIMPORTE_PUNTEO: TFloatField
      FieldName = 'IMPORTE_PUNTEO'
    end
  end
  object QFichero: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 342
    Top = 10
    object QFicheroSUBCUENTABANCO: TStringField
      FieldName = 'SUBCUENTABANCO'
      Size = 10
    end
    object QFicheroID_CONCEPTOS_DFTO: TVarBytesField
      FieldName = 'ID_CONCEPTOS_DFTO'
      Size = 3
    end
  end
  object SFichero: TwwDataSource
    DataSet = QFichero
    Left = 312
    Top = 10
  end
  object QDiario: TIBSQL
    ParamCheck = True
    Left = 408
    Top = 10
  end
end
