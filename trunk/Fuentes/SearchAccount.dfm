object FormSearchAccount: TFormSearchAccount
  Left = 409
  Top = 184
  Width = 762
  Height = 497
  BorderIcons = []
  Caption = 'Formulario de B'#250'squeda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 48
    Width = 754
    Height = 381
    Align = alClient
    BorderStyle = bsNone
    Color = 14275008
    Ctl3D = True
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    OnKeyDown = DBGridKeyDown
    OnTitleClick = DBGridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SUBCUENTA'
        Title.Caption = 'Cuenta'
        Title.Color = clWhite
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Title.Color = clWhite
        Width = 459
        Visible = True
      end>
  end
  object PanelArriba: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 48
    Align = alTop
    Color = 14275008
    TabOrder = 1
    object ccResButton1: TSpeedButton
      Left = 0
      Top = 1
      Width = 50
      Height = 47
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360400002800000040000000200000000100
        0800000000000008000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B0BFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA40707FDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B0B0B0BFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA407070707FDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B1C37260B0BFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA407A4FFA40707FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B1C372E1D0B0BFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA407A4FFFFA40707FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B1C372E1D0B0B5DFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA407A4FFA4A40707A4FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650B1C372E1D0B0B5DFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA407A4FFA4A40707A4FDFDFDFDFDFDFD
        FDFDF5E3D9D09090D0D9E2F5FDFDFDFD0B1C372E1D0B0B5DFDFDFDFDFDFDFDFD
        FDFD07A4A4A4A4A4A4A4A407FDFDFDFD07A4FFA4A40707A4FDFDFDFDFDFDFDFD
        ECD9D1D9E2E2EAEAE2E1D9D1D9ECFD65140B1D1D0B0B5DFDFDFDFDFDFDFDFDFD
        07A4A4A4A4A4A4A4A4A4A4A4A407FDA4A407A4A40707A4FDFDFDFDFDFDFD09E2
        D9E2EBEBEBEBEBEBEBEBEAE2D9D95C14B7370B0B0B5DFDFDFDFDFDFDFDFD07A4
        A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A407FF070707A4FDFDFDFDFDFDFD09DAE2
        EBEBF4F4F4F4F4F4F3F3EBEAEAE2D989372F0C0B5DFDFDFDFDFDFDFDFD07A4A4
        A4A40707070707070707A4A4A4A4A4A4FFFF0707A4FDFDFDFDFDFDFD09DAE2EC
        F4090909090909090909F4EBEBEAEAEA890C5DFDFDFDFDFDFDFDFDFD07A4A407
        0707070707070707070707A4A4A4A4A4A407A4FDFDFDFDFDFDFDFDFDE2E2F409
        0909090909090909090909F4F3EBEAEA9152FDFDFDFDFDFDFDFDFDFDA4A40707
        07070707070707070707070707A4A4A4A4A4FDFDFDFDFDFDFDFDFDECD9EC0909
        09090909090909090909090909F3EBEAE2D9ECFDFDFDFDFDFDFDFD07A4070707
        0707070707070707070707070707A4A4A4A407FDFDFDFDFDFDFDFDDAE3090909
        09090909090909090909090909F4F3EBEAD9D9FDFDFDFDFDFDFDFDA4A4070707
        070707070707070707070707070707A4A4A4A4FDFDFDFDFDFDFD09D9F4090909
        0909090909090909090909090909F4EBEAE2D0F5FDFDFDFDFDFD07A407070707
        070707070707070707070707070707A4A4A4A407FDFDFDFDFDFDE3E209090909
        09F6F6F6F6F6090909090909090909F3EBEAD9E2FDFDFDFDFDFDA4A407070707
        07FFFFFFFFFF07070707070707070707A4A4A4A4FDFDFDFDFDFDDAEB09090909
        F6F6F6F6F6F6F6F6F6F6F6F6090909F4EBEAD9D9FDFDFDFDFDFDA4A407070707
        FFFFFFFFFFFFFFFFFFFFFFFF07070707A4A4A4A4FDFDFDFDFDFDD1EC090909F6
        F6F6FFFFFFF6F6F6F6F6FFFFF6090909EBEAE2D0FDFDFDFDFDFDA407070707FF
        FFFFFFFFFFFFFFFFFFFFFFFFFF070707A4A4A4A4FDFDFDFDFDFD9009090909F6
        FFFFFFFFFFFFFFF6FFFFFFFFFFF60909EBEAE290FDFDFDFDFDFDA407070707FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0707A4A4A4A4FDFDFDFDFDFD90090909F6F6
        FFFFFFFFFFFFFFFFFFFFFFFFF6090909F3EBE290FDFDFDFDFDFDA4070707FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF07070707A4A4A4FDFDFDFDFDFDD1EC0909F6F6
        FFFFFFFFFFFFFFFFF6F6F6F6F6090909F3EAE2D0FDFDFDFDFDFDA4070707FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF07070707A4A4A4FDFDFDFDFDFDDAEB0909F6F6
        FFFFFFFFFFFFFFF6F6F6F6F609090909EBEAE1D9FDFDFDFDFDFDA4A40707FFFF
        FFFFFFFFFFFFFFFFFFFFFFFF07070707A4A4A4A4FDFDFDFDFDFDE3E2090909F6
        FFFFFFFFFFFFFFF6F6F60909090909F4EBEAD9E2FDFDFDFDFDFDA4A4070707FF
        FFFFFFFFFFFFFFFFFFFF070707070707A4A4A4A4FDFDFDFDFDFD09D9090909F6
        F6FFFFFFFFFFFFF6F6090909090909F4EBEAD1F5FDFDFDFDFDFD07A4070707FF
        FFFFFFFFFFFFFFFFFF07070707070707A4A4A407FDFDFDFDFDFDFDDAEB090909
        F6F6FFFFFFFFF6F6F6090909090909F3EBE2D9FDFDFDFDFDFDFDFDA4A4070707
        FFFFFFFFFFFFFFFFFF07070707070707A4A4A4FDFDFDFDFDFDFDFDECDA090909
        09F6F6F6F6F6F6F6090909090909F4EBEAD9ECFDFDFDFDFDFDFDFD07A4070707
        07FFFFFFFFFFFFFF07070707070707A4A4A407FDFDFDFDFDFDFDFDFDE3E30909
        090909F6F6F60909090909090909F3EBD9E2FDFDFDFDFDFDFDFDFDFDA4A40707
        070707FFFFFF070707070707070707A4A4A4FDFDFDFDFDFDFDFDFDFD09DAEB09
        09090909090909090909090909F3EBE2D909FDFDFDFDFDFDFDFDFDFD07A4A407
        0707070707070707070707070707A4A4A407FDFDFDFDFDFDFDFDFDFDFD09DAE3
        090909090909090909090909EBEBDAD909FDFDFDFDFDFDFDFDFDFDFDFD07A4A4
        070707070707070707070707A4A4A4A407FDFDFDFDFDFDFDFDFDFDFDFDFD09E3
        DAEB0909090909090909F4EBE2D9E209FDFDFDFDFDFDFDFDFDFDFDFDFDFD07A4
        A4A4070707070707070707A4A4A4A407FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        ECDAD9E2EBECECECEBE3DAD9D9ECFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        07A4A4A4A4070707A4A4A4A4A407FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFD09E3DAD19090D1D9E3F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFD07A4A4A4A4A4A4A4A407FDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      NumGlyphs = 2
    end
    object LabelTabla: TLabel
      Left = 371
      Top = 9
      Width = 127
      Height = 30
      Caption = 'LabelTabla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditSearchText: TEdit
      Left = 73
      Top = 14
      Width = 274
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      OnKeyDown = EditSearchTextKeyDown
    end
  end
  object MemoQuery: TMemo
    Left = 6
    Top = 105
    Width = 730
    Height = 295
    Lines.Strings = (
      'MemoQuery')
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 429
    Width = 754
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 14275008
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    DesignSize = (
      754
      41)
    object BtnAccept: TSpeedButton
      Left = 662
      Top = 8
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Ac&eptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnAcceptClick
    end
    object BtnCancel: TSpeedButton
      Left = 569
      Top = 8
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnCancelClick
    end
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = Query
    Left = 180
    Top = 142
  end
  object Query: TIBQuery
    Database = DMRef.IBDSiamCont
    Transaction = DMRef.IBT1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SUBCUENTA, DESCRIPCION from SUBCTAS')
    Left = 136
    Top = 144
    object QuerySUBCUENTA: TIBStringField
      FieldName = 'SUBCUENTA'
      Origin = 'SUBCTAS.SUBCUENTA'
      Required = True
      Size = 10
    end
    object QueryDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'SUBCTAS.DESCRIPCION'
      Size = 80
    end
  end
end
