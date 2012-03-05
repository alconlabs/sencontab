object FormMenuAdmin: TFormMenuAdmin
  Left = 337
  Top = 158
  Width = 221
  Height = 539
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
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 211
    Height = 493
    Align = alLeft
    BevelOuter = bvNone
    Color = 14275008
    Constraints.MinWidth = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    object PanelUserProfiles: TPanel
      Left = 0
      Top = 123
      Width = 211
      Height = 41
      Align = alTop
      Color = 16493981
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LabelUserProfiles: TLabel
        Left = 32
        Top = 8
        Width = 140
        Height = 22
        Caption = 'Perfil de Usuario'
        OnMouseMove = LabelMouseMove
        OnMouseLeave = LabelEnterprisesMouseLeave
      end
    end
    object PanelProfiles: TPanel
      Left = 0
      Top = 82
      Width = 211
      Height = 41
      Align = alTop
      Color = 16493981
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object LabelProfiles: TLabel
        Left = 64
        Top = 8
        Width = 65
        Height = 22
        Caption = 'Perfiles'
        OnMouseMove = LabelMouseMove
        OnMouseLeave = LabelEnterprisesMouseLeave
      end
    end
    object PanelUsers: TPanel
      Left = 0
      Top = 41
      Width = 211
      Height = 41
      Align = alTop
      Color = 16493981
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object LabelUsers: TLabel
        Left = 64
        Top = 8
        Width = 74
        Height = 22
        Caption = 'Usuarios'
        OnMouseMove = LabelMouseMove
        OnMouseLeave = LabelEnterprisesMouseLeave
      end
    end
    object PanelEnterprises: TPanel
      Left = 0
      Top = 0
      Width = 211
      Height = 41
      Align = alTop
      Color = 16493981
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object LabelEnterprises: TLabel
        Left = 56
        Top = 8
        Width = 87
        Height = 22
        Alignment = taCenter
        Caption = 'Empresas'
        OnMouseMove = LabelMouseMove
        OnMouseLeave = LabelEnterprisesMouseLeave
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 164
      Width = 211
      Height = 329
      Align = alLeft
      BevelOuter = bvNone
      Color = 14275008
      Constraints.MinWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 4
      object Panel5: TPanel
        Left = 0
        Top = 123
        Width = 211
        Height = 41
        Align = alTop
        Color = 16493981
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 0
        Top = 82
        Width = 211
        Height = 41
        Align = alTop
        Color = 16493981
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 0
        Top = 41
        Width = 211
        Height = 41
        Align = alTop
        Color = 16493981
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 211
        Height = 41
        Align = alTop
        Color = 16493981
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Panel9: TPanel
        Left = 0
        Top = 164
        Width = 211
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        Color = 14275008
        Constraints.MinWidth = 50
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 4
        object Panel10: TPanel
          Left = 0
          Top = 123
          Width = 211
          Height = 41
          Align = alTop
          Color = 16493981
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel11: TPanel
          Left = 0
          Top = 82
          Width = 211
          Height = 41
          Align = alTop
          Color = 16493981
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel12: TPanel
          Left = 0
          Top = 41
          Width = 211
          Height = 41
          Align = alTop
          Color = 16493981
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object Panel13: TPanel
          Left = 0
          Top = 0
          Width = 211
          Height = 41
          Align = alTop
          Color = 16493981
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 493
    Width = 213
    Height = 19
    Panels = <
      item
        Width = 10
      end
      item
        Width = 50
      end>
  end
  object Timer: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = TimerTimer
    Left = 16
    Top = 8
  end
end
