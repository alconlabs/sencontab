object EditUserView: TEditUserView
  Left = 533
  Top = 259
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 234
  ClientWidth = 452
  Color = 14933723
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelUser: TLabel
    Left = 24
    Top = 17
    Width = 36
    Height = 13
    Caption = 'Usuario'
    Color = 11003889
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelPassword: TLabel
    Left = 24
    Top = 97
    Width = 81
    Height = 13
    Caption = 'Nuevo Password'
    Color = 11003889
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 24
    Top = 41
    Width = 37
    Height = 13
    Caption = 'Nombre'
    Color = 11003889
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelOldPassword: TLabel
    Left = 24
    Top = 73
    Width = 85
    Height = 13
    Caption = 'Password Anterior'
    Color = 11003889
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 24
    Top = 121
    Width = 80
    Height = 13
    Caption = 'Repita Password'
    Color = 11003889
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object EditCD_USER: TDBEdit
    Left = 80
    Top = 14
    Width = 146
    Height = 20
    Color = 82109668
    Ctl3D = False
    DataField = 'CD_USER'
    DataSource = SUsers
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object EditNEW_PASSWORD: TEdit
    Left = 120
    Top = 94
    Width = 146
    Height = 20
    Color = 82109668
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 3
  end
  object EditDS_USER: TDBEdit
    Left = 80
    Top = 38
    Width = 329
    Height = 20
    Color = 82109668
    Ctl3D = False
    DataField = 'DS_USER'
    DataSource = SUsers
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object EditOLD_PASSWORD: TDBEdit
    Left = 120
    Top = 70
    Width = 146
    Height = 20
    Color = 82109668
    Ctl3D = False
    DataSource = SUsers
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 2
  end
  object EditNEW_PASSWORD_TWO: TEdit
    Left = 120
    Top = 118
    Width = 146
    Height = 20
    Color = 82109668
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 4
  end
  object BtnCancel: TBitBtn
    Left = 257
    Top = 168
    Width = 88
    Height = 25
    Cursor = crHandPoint
    Cancel = True
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 6
  end
  object BtnAccept: TBitBtn
    Left = 353
    Top = 168
    Width = 88
    Height = 25
    Cursor = crHandPoint
    Caption = '&Aceptar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object CheckBoxADMINISTRATOR: TDBCheckBox
    Left = 288
    Top = 120
    Width = 97
    Height = 17
    Caption = 'Administrador'
    DataField = 'ADMINISTRATOR'
    DataSource = SUsers
    TabOrder = 5
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object SUsers: TDataSource
    DataSet = HUsers
    Left = 85
    Top = 158
  end
  object HUsers: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 160
    Data = {
      910000009619E0BD01000000180000000400000000000300000091000743445F
      555345520100490000000100055749445448020002000C000744535F55534552
      01004900000001000557494454480200020050000D41444D494E495354524154
      4F5201004900000001000557494454480200020001000850415353574F524401
      004900000001000557494454480200020028000000}
    object HUsersCD_USER: TStringField
      FieldName = 'CD_USER'
      Size = 12
    end
    object HUsersDS_USER: TStringField
      FieldName = 'DS_USER'
      Size = 80
    end
    object HUsersADMINISTRATOR: TStringField
      FieldName = 'ADMINISTRATOR'
      Size = 1
    end
    object HUsersPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 40
    end
  end
end
