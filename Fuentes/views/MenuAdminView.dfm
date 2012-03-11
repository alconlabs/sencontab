object FormMenuAdmin: TFormMenuAdmin
  Left = 533
  Top = 198
  Width = 219
  Height = 384
  HelpType = htKeyword
  HelpKeyword = 'FormMenuAdmin'
  HorzScrollBar.Range = 111
  VertScrollBar.Range = 354
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Administrator -senCille-'
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnPaint = FormShow
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelEnterprises: TLabel
    Left = 56
    Top = 40
    Width = 87
    Height = 22
    Alignment = taCenter
    Caption = 'Empresas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnMouseMove = LabelMouseMove
    OnMouseLeave = LabelEnterprisesMouseLeave
  end
  object LabelUsers: TLabel
    Left = 62
    Top = 77
    Width = 74
    Height = 22
    Caption = 'Usuarios'
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnMouseMove = LabelMouseMove
    OnMouseLeave = LabelEnterprisesMouseLeave
  end
  object LabelProfiles: TLabel
    Left = 67
    Top = 152
    Width = 65
    Height = 22
    BiDiMode = bdLeftToRight
    Caption = 'Perfiles'
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnMouseMove = LabelMouseMove
    OnMouseLeave = LabelEnterprisesMouseLeave
  end
  object LabelUserProfiles: TLabel
    Left = 29
    Top = 114
    Width = 140
    Height = 22
    BiDiMode = bdLeftToRight
    Caption = 'Perfil de Usuario'
    Color = 14275008
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnMouseMove = LabelMouseMove
    OnMouseLeave = LabelEnterprisesMouseLeave
  end
end
