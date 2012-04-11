object EditProfileView: TEditProfileView
  Left = 556
  Top = 295
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 125
  ClientWidth = 444
  Color = 14933723
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCode: TLabel
    Left = 24
    Top = 17
    Width = 76
    Height = 13
    Caption = 'C'#243'digo del Perfil'
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
  object EditCD_PROFILE: TDBEdit
    Left = 120
    Top = 14
    Width = 146
    Height = 20
    Color = 82109668
    Ctl3D = False
    DataField = 'CD_PROFILE'
    DataSource = Source
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object BtnCancel: TBitBtn
    Left = 225
    Top = 48
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
    TabOrder = 1
  end
  object BtnAccept: TBitBtn
    Left = 321
    Top = 48
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
    TabOrder = 2
  end
  object Source: TDataSource
    DataSet = Table
    Left = 77
    Top = 46
  end
  object Table: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_PROFILE'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 48
    Data = {
      390000009619E0BD01000000180000000100000000000300000039000A43445F
      50524F46494C450100490000000100055749445448020002000F000000}
    object TableCD_PROFILE: TStringField
      FieldName = 'CD_PROFILE'
      Size = 15
    end
  end
end
