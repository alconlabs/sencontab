object WUsuarios: TWUsuarios
  Left = 4
  Top = 3
  Width = 638
  Height = 434
  Caption = 'Cat'#225'logo de USUARIOS'
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
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
  TextHeight = 14
  object Panel1: TPanel
    Left = 673
    Top = 40
    Width = 90
    Height = 365
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object BtnEdtGuardar: TBitBtn
      Left = 7
      Top = 117
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
      TabOrder = 0
      OnClick = BtnEdtGuardarClick
    end
    object BtnCancel: TBitBtn
      Left = 7
      Top = 146
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
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object BtnNavAnadir: TBitBtn
      Left = 7
      Top = 2
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = '&A'#241'adir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnNavAniadirClick
    end
    object BtnEdtDesmarcar: TBitBtn
      Left = 7
      Top = 60
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = 'Desmarcar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtnEdtDesmarcarClick
    end
    object BtnEdtMarcar: TBitBtn
      Left = 7
      Top = 31
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = 'Marcar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BtnEdtMarcarClick
    end
    object BtnNavBorrar: TBitBtn
      Left = 7
      Top = 60
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = '&Borrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BtnNavBorrarClick
    end
    object BtnNavModificar: TBitBtn
      Left = 7
      Top = 31
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
      TabOrder = 6
      OnClick = RejillaDblClick
    end
  end
  object Paginas: TOvcNotebook
    Left = 266
    Top = 38
    Width = 400
    Height = 372
    UseActiveTabFont = False
    HighlightColor = clNavy
    PageUsesTabColor = False
    ShadowColor = clNavy
    TextShadowColor = clNavy
    OnPageChanged = PaginasPageChanged
    Controller = OvcController1
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object PDatosCli: TOvcTabPage
      Tag = 1
      Caption = 'Datos'
      TabColor = 14275008
      TextColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = 3570756
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      object DatosProvincias: TGroupBox
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label9: TLabel
          Left = 53
          Top = 114
          Width = 31
          Height = 13
          Caption = 'Clave'
        end
        object Label25: TLabel
          Left = 53
          Top = 58
          Width = 43
          Height = 13
          Caption = 'Usuario'
        end
        object Label27: TLabel
          Left = 53
          Top = 181
          Width = 49
          Height = 13
          Caption = 'Empresa'
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 53
          Top = 199
          Width = 236
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = 2644787
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMBRE'#9'40'#9'NOMBRE'#9'F')
          DataField = 'ID_EMPRESA'
          DataSource = SUsuarios
          LookupTable = DmControlRef.QEmpresas
          LookupField = 'ID_EMPRESA'
          Style = csDropDownList
          Color = clWhite
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object eUsuario: TOvcDbPictureField
          Left = 53
          Top = 74
          Width = 144
          Height = 20
          DataField = 'NOMBRE'
          DataSource = SUsuarios
          FieldType = ftString
          AutoSize = False
          CaretOvr.Shape = csBlock
          Color = clWhite
          Controller = OvcController1
          Ctl3D = True
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Epoch = 1900
          Font.Charset = ANSI_CHARSET
          Font.Color = 3570756
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PictureMask = '!'
          TabOrder = 0
        end
        object eClave: TOvcDbPictureField
          Left = 53
          Top = 130
          Width = 144
          Height = 20
          DataField = 'CLAVE'
          DataSource = SUsuarios
          FieldType = ftString
          AutoSize = False
          CaretOvr.Shape = csBlock
          Color = clWhite
          Controller = OvcController1
          Ctl3D = True
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Epoch = 1900
          Font.Charset = ANSI_CHARSET
          Font.Color = 3570756
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          PictureMask = '!'
          TabOrder = 1
        end
      end
    end
    object OvcTabPage1: TOvcTabPage
      Tag = 1
      Caption = 'Permisos'
      PageVisible = False
      TabColor = 14275008
      TextColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = 3570756
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      object Permisos: TfcTreeView
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        Align = alClient
        Color = 15596540
        Font.Charset = ANSI_CHARSET
        Font.Color = 10657371
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Indent = 19
        MultiSelectAttributes.AutoUnselect = False
        MultiSelectAttributes.Enabled = True
        MultiSelectAttributes.MultiSelectLevel = 1
        Items.StreamVersion = 1
        Items.Data = {00000000}
        ParentFont = False
        TabOrder = 0
        OnToggleCheckbox = PermisosToggleCheckbox
        OnCalcNodeAttributes = PermisosCalcNodeAttributes
      end
    end
  end
  object Aux: TBitBtn
    Left = 578
    Top = 444
    Width = 88
    Height = 25
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object Rejilla: TwwDBGrid
    Left = 0
    Top = 0
    Width = 257
    Height = 419
    TabStop = False
    DittoAttributes.ShortCutDittoField = 0
    DittoAttributes.ShortCutDittoRecord = 0
    DittoAttributes.Options = []
    DisableThemesInTitle = False
    Selected.Strings = (
      'NOMBRE'#9'20'#9'USUARIO'#9'F'
      'CLAVE'#9'18'#9'CLAVE')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10841401
    FixedCols = 0
    ShowHorzScrollBar = False
    BorderStyle = bsNone
    Color = 15596540
    DataSource = SUsuarios
    Font.Charset = ANSI_CHARSET
    Font.Color = 10657371
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 3
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
    Left = 355
    Top = 6
  end
  object SUsuarios: TwwDataSource
    AutoEdit = False
    DataSet = QUsuarios
    Left = 261
    Top = 2
  end
  object QUsuarios: TIBTableSet
    Database = DmControlRef.BDControl
    Transaction = TransUsuarios
    AfterScroll = QUsuariosAfterScroll
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE'
      
        '  ID_USUARIO                     =:old_ID_USUARIO               ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS'
      
        '  (ID_USUARIO                     ,ID_EMPRESA                   ' +
        '  ,CLAVE                          ,NOMBRE                       ' +
        '  )'
      'VALUES'
      
        '  (:ID_USUARIO                     ,:ID_EMPRESA                 ' +
        '    ,:CLAVE                          ,:NOMBRE                   ' +
        '      )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS'
      'WHERE'
      
        '  ID_USUARIO                     =?ID_USUARIO                   ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS')
    ModifySQL.Strings = (
      'UPDATE USUARIOS'
      'SET'
      
        '  ID_EMPRESA                     =:ID_EMPRESA                   ' +
        '   '
      
        '  ,CLAVE                          =:CLAVE                       ' +
        '    '
      
        '  ,NOMBRE                         =:NOMBRE                      ' +
        '    '
      'WHERE'
      
        '  ID_USUARIO                     =:ID_USUARIO                   ' +
        '   ')
    TableName = 'USUARIOS'
    Left = 231
    Top = 2
    object QUsuariosNOMBRE: TIBStringField
      DisplayLabel = 'USUARIO'
      DisplayWidth = 20
      FieldName = 'NOMBRE'
      Origin = 'USUARIOS.NOMBRE'
      Size = 15
    end
    object QUsuariosCLAVE: TIBStringField
      DisplayWidth = 18
      FieldName = 'CLAVE'
      Origin = 'USUARIOS.CLAVE'
      Size = 10
    end
    object QUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'USUARIOS.ID_USUARIO'
      Required = True
      Visible = False
    end
    object QUsuariosID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'USUARIOS.ID_EMPRESA'
      Visible = False
    end
  end
  object TransUsuarios: TIBTransaction
    Active = False
    DefaultDatabase = DmControlRef.BDControl
    AutoStopAction = saNone
    Left = 201
    Top = 2
  end
  object QModulos: TIBTableSet
    Database = DmControlRef.BDControl
    Transaction = DmControlRef.TransaccionControl
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      'FROM MODULOS '
      'ORDER BY IDMODULO')
    Left = 113
    Top = 296
    object QModulosIDMODULO: TIntegerField
      FieldName = 'IDMODULO'
      Origin = 'MODULOS.IDMODULO'
      Required = True
    end
    object QModulosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'MODULOS.DESCRIPCION'
      Size = 25
    end
  end
  object SModulos: TwwDataSource
    DataSet = QModulos
    Left = 144
    Top = 296
  end
  object QMantenimientos: TIBTableSet
    Database = DmControlRef.BDControl
    Transaction = DmControlRef.TransaccionControl
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      'FROM MANTENIMIENTOS'
      'WHERE IDMODULO = :IDMODULO'
      'ORDER BY IDMANTENIMIENTO')
    DataSource = SModulos
    Left = 113
    Top = 325
    object QMantenimientosIDMODULO: TIntegerField
      FieldName = 'IDMODULO'
      Origin = 'MANTENIMIENTOS.IDMODULO'
      Required = True
    end
    object QMantenimientosIDMANTENIMIENTO: TIntegerField
      FieldName = 'IDMANTENIMIENTO'
      Origin = 'MANTENIMIENTOS.IDMANTENIMIENTO'
      Required = True
    end
    object QMantenimientosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'MANTENIMIENTOS.DESCRIPCION'
      Size = 25
    end
    object QMantenimientosWINDOWNAME: TIBStringField
      FieldName = 'WINDOWNAME'
      Origin = 'MANTENIMIENTOS.WINDOWNAME'
      Required = True
      Size = 25
    end
    object QMantenimientosPERMISOSESCRITURA: TIBStringField
      FieldName = 'PERMISOSESCRITURA'
      Origin = 'MANTENIMIENTOS.PERMISOSESCRITURA'
      FixedChar = True
      Size = 1
    end
    object QMantenimientosPERMISOIMPRESION: TIBStringField
      FieldName = 'PERMISOIMPRESION'
      Origin = 'MANTENIMIENTOS.PERMISOIMPRESION'
      FixedChar = True
      Size = 1
    end
  end
  object SMantenimientos: TwwDataSource
    DataSet = QMantenimientos
    Left = 144
    Top = 325
  end
  object QPermisos: TIBTableSet
    Database = DmControlRef.BDControl
    Transaction = TransPermisos
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PERMISOS_USUARIOS'
      'WHERE'
      
        '  IDMANTENIMIENTO                =:old_IDMANTENIMIENTO          ' +
        '       AND '
      
        '  IDMODULO                       =:old_IDMODULO                 ' +
        '       AND '
      
        '  IDUSUARIO                      =:old_IDUSUARIO                ' +
        '       ')
    InsertSQL.Strings = (
      'INSERT INTO PERMISOS_USUARIOS'
      
        '  (IDUSUARIO                      ,IDMANTENIMIENTO              ' +
        '  ,IDMODULO                       ,ANIADIR                      ' +
        '  ,MODIFICAR                      ,BORRAR                       ' +
        '  ,IMPRESION                      )'
      'VALUES'
      
        '  (:IDUSUARIO                      ,:IDMANTENIMIENTO            ' +
        '    ,:IDMODULO                       ,:ANIADIR                  ' +
        '      ,:MODIFICAR                      ,:BORRAR                 ' +
        '        ,:IMPRESION                      )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PERMISOS_USUARIOS'
      'WHERE'
      
        '  IDMANTENIMIENTO                =?IDMANTENIMIENTO              ' +
        '   AND '
      
        '  IDMODULO                       =?IDMODULO                     ' +
        '   AND '
      
        '  IDUSUARIO                      =?IDUSUARIO                    ' +
        '   ')
    SelectSQL.Strings = (
      'SELECT * FROM PERMISOS_USUARIOS')
    ModifySQL.Strings = (
      'UPDATE PERMISOS_USUARIOS'
      'SET'
      
        '  ANIADIR                        =:ANIADIR                      ' +
        '   '
      
        '  ,MODIFICAR                      =:MODIFICAR                   ' +
        '    '
      
        '  ,BORRAR                         =:BORRAR                      ' +
        '    '
      
        '  ,IMPRESION                      =:IMPRESION                   ' +
        '    '
      'WHERE'
      
        '  IDMANTENIMIENTO                =:IDMANTENIMIENTO              ' +
        '   AND '
      
        '  IDMODULO                       =:IDMODULO                     ' +
        '   AND '
      
        '  IDUSUARIO                      =:IDUSUARIO                    ' +
        '   ')
    DataSource = SUsuarios
    TableName = 'PERMISOS_USUARIOS'
    Left = 113
    Top = 354
    object QPermisosIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'PERMISOS_USUARIOS.IDUSUARIO'
      Required = True
    end
    object QPermisosIDMANTENIMIENTO: TIntegerField
      FieldName = 'IDMANTENIMIENTO'
      Origin = 'PERMISOS_USUARIOS.IDMANTENIMIENTO'
      Required = True
    end
    object QPermisosIDMODULO: TIntegerField
      FieldName = 'IDMODULO'
      Origin = 'PERMISOS_USUARIOS.IDMODULO'
      Required = True
    end
    object QPermisosANIADIR: TIBStringField
      FieldName = 'ANIADIR'
      Origin = 'PERMISOS_USUARIOS.ANIADIR'
      FixedChar = True
      Size = 1
    end
    object QPermisosMODIFICAR: TIBStringField
      FieldName = 'MODIFICAR'
      Origin = 'PERMISOS_USUARIOS.MODIFICAR'
      FixedChar = True
      Size = 1
    end
    object QPermisosBORRAR: TIBStringField
      FieldName = 'BORRAR'
      Origin = 'PERMISOS_USUARIOS.BORRAR'
      FixedChar = True
      Size = 1
    end
    object QPermisosIMPRESION: TIBStringField
      FieldName = 'IMPRESION'
      Origin = 'PERMISOS_USUARIOS.IMPRESION'
      FixedChar = True
      Size = 1
    end
  end
  object TransPermisos: TIBTransaction
    Active = False
    DefaultDatabase = DmControlRef.BDControl
    AutoStopAction = saNone
    Left = 142
    Top = 354
  end
  object SPermisos: TwwDataSource
    DataSet = QPermisos
    Left = 173
    Top = 354
  end
end
