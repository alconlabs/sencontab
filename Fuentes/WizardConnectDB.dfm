object WizardConnectDB: TWizardConnectDB
  Left = 463
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Configuraci'#243'n del Sistema en senContab.'
  ClientHeight = 399
  ClientWidth = 675
  Color = 16249839
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 331
    Width = 675
    Height = 68
    Align = alBottom
    Color = 16249839
    TabOrder = 0
    object BtnBack: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '< Atr'#225's'
      TabOrder = 0
      OnClick = BtnBackClick
    end
    object BtnNext: TButton
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente >'
      Default = True
      TabOrder = 1
      OnClick = BtnNextClick
    end
    object BtnEnd: TButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Finalizar >>|'
      TabOrder = 2
      OnClick = BtnEndClick
    end
    object BtnCancel: TButton
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = BtnCancelClick
    end
    object StatusBar: TStatusBar
      Left = 1
      Top = 48
      Width = 673
      Height = 19
      Panels = <
        item
          Width = 50
        end
        item
          Width = 50
        end>
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 675
    Height = 331
    ActivePage = TabDatabase
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = ImageListCaptions
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    OnChanging = PageControlChanging
    object TabDatabase: TTabSheet
      Caption = 'Database'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 65
        Width = 667
        Height = 234
        Align = alClient
        TabOrder = 0
        object Label16: TLabel
          Left = 14
          Top = 56
          Width = 53
          Height = 13
          Caption = 'Host Name'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label18: TLabel
          Left = 14
          Top = 82
          Width = 77
          Height = 13
          Caption = 'Database Name'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label19: TLabel
          Left = 14
          Top = 109
          Width = 53
          Height = 13
          Caption = 'User Name'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label20: TLabel
          Left = 14
          Top = 136
          Width = 46
          Height = 13
          Caption = 'Password'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 14
          Top = 163
          Width = 83
          Height = 13
          Caption = 'Retype Password'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object EditHostName: TEdit
          Tag = 100
          Left = 120
          Top = 52
          Width = 103
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EditDatabaseName: TEdit
          Tag = 100
          Left = 120
          Top = 78
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EditUserName: TEdit
          Tag = 100
          Left = 120
          Top = 105
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object EditPassword: TEdit
          Tag = 100
          Left = 120
          Top = 132
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PasswordChar = '#'
          TabOrder = 4
        end
        object EditRetypePassword: TEdit
          Tag = 100
          Left = 120
          Top = 159
          Width = 257
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PasswordChar = '#'
          TabOrder = 5
        end
        object BtnTestConnection: TButton
          Left = 120
          Top = 184
          Width = 121
          Height = 25
          Caption = 'Test  Connection'
          TabOrder = 6
          OnClick = BtnTestConnectionClick
        end
        object CheckBoxCreateNew: TCheckBox
          Left = 384
          Top = 80
          Width = 137
          Height = 17
          Caption = 'Crear la base de datos'
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object Label26: TLabel
          Left = 8
          Top = 8
          Width = 277
          Height = 16
          Caption = 'Configurar Conexi'#243'n a la Base de Datos'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label27: TLabel
          Left = 32
          Top = 32
          Width = 598
          Height = 13
          Caption = 
            'Los datos de conexi'#243'n hacen referencia tanto a la base de datos ' +
            'principal como a las bases de datos correspondientes a cada'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 32
          Top = 48
          Width = 100
          Height = 13
          Caption = 'una de las empresas.'
          Color = 16249839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
    end
    object TabSeleccionaTipo: TTabSheet
      Caption = 'Selecci'#243'n'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = 16249839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 0
          Width = 185
          Height = 16
          Caption = 'Indique el tipo de Solicitud'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 24
          Top = 40
          Width = 427
          Height = 13
          Caption = 
            'La solicitud de C'#243'digos le permitir'#225' introducirlos manualmente o' +
            ' cargarlos desde un fichero.'
        end
        object Label5: TLabel
          Left = 24
          Top = 24
          Width = 383
          Height = 13
          Caption = 
            'Una solicitud de partidas seleccionar'#225' autom'#225'ticamente los c'#243'dig' +
            'os a desactivar.'
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 65
        Width = 667
        Height = 234
        Align = alClient
        Color = 16249839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object RadioGroupTipoSolicitud: TRadioGroup
          Left = 24
          Top = 24
          Width = 313
          Height = 113
          ItemIndex = 0
          Items.Strings = (
            'Desactivaci'#243'n de Partidas'
            'Desactivaci'#243'n de C'#243'digos')
          TabOrder = 0
        end
      end
    end
    object TabPartidas: TTabSheet
      Caption = 'Partidas'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 255
          Height = 16
          Caption = 'Informar de las partidas a desactivar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 32
          Top = 24
          Width = 339
          Height = 13
          Caption = 
            'Indique de una en una los c'#243'digos de las partidas que desea desa' +
            'ctivar'
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 65
        Width = 667
        Height = 234
        Align = alClient
        TabOrder = 1
        object DBGridPartidas: TDBGrid
          Left = 2
          Top = 89
          Width = 663
          Height = 143
          Align = alClient
          Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CodigoPartida'
              Title.Caption = 'Codigo Partida'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observaciones'
              Width = 274
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalCodigos'
              Title.Caption = 'Totales'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Libres'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EnUso'
              Title.Caption = 'En Uso'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Activos'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Inactivos'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Renovados'
              Width = 61
              Visible = True
            end>
        end
        object PanelUpPartidas: TPanel
          Left = 2
          Top = 15
          Width = 663
          Height = 74
          Align = alTop
          Color = 16249839
          TabOrder = 1
          object Label6: TLabel
            Left = 8
            Top = 20
            Width = 84
            Height = 13
            Caption = 'C'#243'digo de Partida'
          end
          object Label10: TLabel
            Left = 4
            Top = 54
            Width = 181
            Height = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'LISTA DE PARTIDAS'
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object BtnInsertarPartida: TBitBtn
            Left = 232
            Top = 14
            Width = 129
            Height = 25
            Caption = 'Insertar Partida'
            TabOrder = 1
            OnClick = BtnInsertarPartidaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
          end
          object EditCodigoPartida: TEdit
            Left = 96
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object BtnDeletePartida: TBitBtn
            Left = 544
            Top = 38
            Width = 113
            Height = 25
            Caption = 'Quitar Partida'
            TabOrder = 2
            OnClick = BtnDeletePartidaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
              305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
              B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
              B0557777FF577777F7F500000E055550805577777F7555575755500000555555
              05555777775555557F5555000555555505555577755555557555}
            NumGlyphs = 2
          end
        end
      end
    end
    object TabCodigos: TTabSheet
      Caption = 'C'#243'digos'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label7: TLabel
          Left = 32
          Top = 24
          Width = 266
          Height = 13
          Caption = 'Indique los c'#243'digos de activaci'#243'n que desea desactivar.'
        end
        object Label8: TLabel
          Left = 8
          Top = 0
          Width = 254
          Height = 16
          Caption = 'Informar de los c'#243'digos a desactivar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 65
        Width = 667
        Height = 234
        Align = alClient
        TabOrder = 1
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 663
          Height = 74
          Align = alTop
          Color = 16249839
          TabOrder = 0
          object Label9: TLabel
            Left = 8
            Top = 7
            Width = 101
            Height = 13
            Caption = 'C'#243'digo de Activaci'#243'n'
          end
          object Label24: TLabel
            Left = 4
            Top = 54
            Width = 181
            Height = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'LISTA DE C'#211'DIGOS'
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object BtnInsertaCodigo: TBitBtn
            Left = 248
            Top = 1
            Width = 129
            Height = 25
            Caption = 'Insertar C'#243'digo'
            TabOrder = 0
            OnClick = BtnInsertaCodigoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
          end
          object EditNSerie: TEdit
            Left = 120
            Top = 3
            Width = 121
            Height = 21
            MaxLength = 20
            TabOrder = 1
          end
          object BtnEliminaCodigo: TBitBtn
            Left = 544
            Top = 6
            Width = 113
            Height = 25
            Caption = 'Quitar C'#243'digo'
            TabOrder = 2
            OnClick = BtnEliminaCodigoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
              305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
              B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
              B0557777FF577777F7F500000E055550805577777F7555575755500000555555
              05555777775555557F5555000555555505555577755555557555}
            NumGlyphs = 2
          end
          object BtnImportaCodigos: TBitBtn
            Left = 384
            Top = 1
            Width = 129
            Height = 25
            Caption = 'Importar C'#243'digos'
            TabOrder = 3
            OnClick = BtnImportaCodigosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
              FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
              FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
              007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
              7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
              99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
              99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
              99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
              93337FFFF7737777733300000033333333337777773333333333}
            NumGlyphs = 2
          end
          object BtnQuitarTodosCodigos: TBitBtn
            Left = 544
            Top = 38
            Width = 113
            Height = 25
            Caption = 'Quitar Todos'
            TabOrder = 4
            OnClick = BtnQuitarTodosCodigosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object DBGridCodigos: TDBGrid
          Left = 2
          Top = 89
          Width = 663
          Height = 143
          Align = alClient
          Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NSerie'
              Title.Caption = 'C'#243'digo de Activaci'#243'n'
              Width = 157
              Visible = True
            end>
        end
      end
    end
    object TabResumen: TTabSheet
      Caption = 'Resumen'
      ImageIndex = 4
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label11: TLabel
          Left = 8
          Top = 0
          Width = 66
          Height = 16
          Caption = 'Resumen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 32
          Top = 24
          Width = 547
          Height = 13
          Caption = 
            'Verifique que la informaci'#243'n de esta ventana es la correcta. Pue' +
            'de volver atr'#225's o Finalizar para Realizar la Inserci'#243'n.'
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 65
        Width = 667
        Height = 234
        Align = alClient
        TabOrder = 1
        object Panel7: TPanel
          Left = 2
          Top = 15
          Width = 663
          Height = 34
          Align = alTop
          Color = 16249839
          TabOrder = 0
          object Label13: TLabel
            Left = 4
            Top = 3
            Width = 181
            Height = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'RESUMEN DE LA SOLICITUD'
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object Fondo: TPanel
          Left = 2
          Top = 49
          Width = 663
          Height = 183
          Align = alClient
          TabOrder = 1
          object Gauge: TGauge
            Left = 8
            Top = 236
            Width = 649
            Height = 23
            Progress = 0
            Visible = False
          end
          object GroupBoxPartidas: TGroupBox
            Left = 8
            Top = 8
            Width = 329
            Height = 225
            Caption = ' Resumen '
            TabOrder = 0
            object LabelTotalPartidasTexto: TLabel
              Left = 24
              Top = 16
              Width = 65
              Height = 13
              Caption = 'Total Partidas'
            end
            object LabelLibresTexto: TLabel
              Left = 125
              Top = 163
              Width = 35
              Height = 13
              Caption = 'Libres'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelEnUsoTexto: TLabel
              Left = 254
              Top = 120
              Width = 35
              Height = 13
              Caption = 'En Uso'
            end
            object LabelActivosTexto: TLabel
              Left = 254
              Top = 76
              Width = 35
              Height = 13
              Caption = 'Activos'
            end
            object LabelInactivosTexto: TLabel
              Left = 118
              Top = 120
              Width = 43
              Height = 13
              Caption = 'Inactivos'
            end
            object LabelRenovadosTexto: TLabel
              Left = 234
              Top = 163
              Width = 55
              Height = 13
              Caption = 'Renovados'
            end
            object Label25: TLabel
              Left = 24
              Top = 91
              Width = 114
              Height = 20
              Caption = 'C O D I G O S'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object PanelSummaryPartidas: TPanel
              Left = 24
              Top = 32
              Width = 105
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object LabelPartidas: TLabel
                Left = 32
                Top = 1
                Width = 65
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Partidas'
              end
            end
            object PanelSummaryLibres: TPanel
              Left = 24
              Top = 180
              Width = 137
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object LabelLibres: TLabel
                Left = 95
                Top = 1
                Width = 35
                Height = 13
                Caption = 'Libres'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object PanelSummaryEnUso: TPanel
              Left = 168
              Top = 135
              Width = 121
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object LabelEnUso: TLabel
                Left = 80
                Top = 1
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'En Uso'
              end
            end
            object PanelSummaryActivos: TPanel
              Left = 168
              Top = 92
              Width = 121
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object LabelActivos: TLabel
                Left = 80
                Top = 2
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Activos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object PanelSummaryInactivos: TPanel
              Left = 24
              Top = 135
              Width = 137
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object LabelInactivos: TLabel
                Left = 88
                Top = 1
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inactivos'
              end
            end
            object PanelSummaryRenovados: TPanel
              Left = 168
              Top = 180
              Width = 121
              Height = 19
              BorderStyle = bsSingle
              Color = clBtnHighlight
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              object LabelRenovados: TLabel
                Left = 60
                Top = 1
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Renovados'
              end
            end
          end
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerTimer
    Left = 609
    Top = 12
  end
  object OpenFileDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 
      'Archivo de Texto plano (*.txt)|*.txt|Valores separados por comas' +
      ' (*.csv)|*.csv'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing]
    Left = 508
    Top = 12
  end
  object ImageList: TImageList
    Left = 436
    Top = 236
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF0000000000FFFFFF000000FF00FFFFFF000000FF00FFFFFF00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF0000000000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF007F7F7F00FFFF
      FF0000000000000000000000FF0000008000000080000000000000000000FFFF
      FF007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F00FFFF
      FF00000000000000000000FF000000800000008000000000000000000000FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      FF00000000000000FF00000080000000FF000000800000008000000000000000
      FF00000000007F7F7F00000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000BFBFBF000000000000FF
      00000000000000FF00000080000000FF000000800000008000000000000000FF
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000FF000000FF000000FF000000FF000000800000000000FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FF000000FF000000FF000000FF00000080000000000000FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      FF0000000000FFFFFF000000FF000000FF00000080000000FF00000000000000
      FF0000000000BFBFBF00000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF00000000000000000000000000FFFFFF000000000000FF
      000000000000FFFFFF0000FF000000FF00000080000000FF00000000000000FF
      000000000000BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF000000FF000000000000000000FFFF
      FF007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000FF00000000000000000000FFFF
      FF007F7F7F00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000FFFFFF000000FF00FFFFFF000000FF00FFFFFF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000F83FF83FF83F0000
      E00FE00FE00F0000C007C007C007000080038003800300008003800380030000
      0001000100010000000100010001000000010001000100000001000100010000
      000100010001000080038003800300008003800380030000C007C007C0070000
      E00FE00FE00F0000F83FF83FF83F000000000000000000000000000000000000
      000000000000}
  end
  object ImageListCaptions: TImageList
    Left = 436
    Top = 196
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000808000008080000080800000000000000000000000
      00007F7F7F007F7F7F00000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000BFBFBF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000007F7F7F00000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF00000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF00000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF00000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000808000008080000080800000808000000000000000
      000000000000BFBFBF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000080800000000000000000000000
      00007F7F7F00BFBFBF0000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000F83F000000000000
      E00F000000000000C00700000000000080030000000000008003000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      000100000000000080030000000000008003000000000000C007000000000000
      E00F000000000000F83F000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00780038003800380038003800380038003
      0001000100010001000100010001000100010001000100010001000100010001
      000100010001000180038003800380038003800380038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
end
