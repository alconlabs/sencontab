object EditUserView: TEditUserView
  Left = 437
  Top = 224
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 216
  ClientWidth = 450
  Color = 11003889
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
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
  object Label1: TLabel
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
  object EditUser: TEdit
    Left = 80
    Top = 14
    Width = 146
    Height = 22
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 120
    Top = 94
    Width = 146
    Height = 22
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 1
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 197
    Width = 450
    Height = 19
    Align = alNone
    Panels = <>
  end
  object Edit1: TEdit
    Left = 80
    Top = 38
    Width = 329
    Height = 22
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 120
    Top = 70
    Width = 146
    Height = 22
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 120
    Top = 118
    Width = 146
    Height = 22
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 5
  end
  object BtnCancel: TBitBtn
    Left = 257
    Top = 160
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
    Top = 160
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
    OnClick = BtnAcceptClick
  end
  object Timer: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = TimerTimer
    Left = 18
    Top = 144
  end
end
