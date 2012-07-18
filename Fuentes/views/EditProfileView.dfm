object EditProfileView: TEditProfileView
  Left = 537
  Top = 272
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 170
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
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
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
    Top = 41
    Width = 56
    Height = 13
    Caption = 'Descripci'#243'n'
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
    Left = 241
    Top = 80
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
    TabOrder = 2
  end
  object BtnAccept: TBitBtn
    Left = 337
    Top = 80
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
    TabOrder = 3
  end
  object EditDS_PROFILE: TDBEdit
    Left = 120
    Top = 38
    Width = 305
    Height = 20
    Color = 82109668
    Ctl3D = False
    DataField = 'DS_PROFILE'
    DataSource = Source
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object Source: TDataSource
    DataSet = Table
    Left = 77
    Top = 94
  end
  object Table: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_PROFILE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DS_PROFILE'
        DataType = ftString
        Size = 80
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 96
    Data = {
      580000009619E0BD01000000180000000200000000000300000058000A43445F
      50524F46494C450100490000000100055749445448020002000F000A44535F50
      524F46494C4501004900000001000557494454480200020050000000}
    object TableCD_PROFILE: TStringField
      FieldName = 'CD_PROFILE'
      Size = 15
    end
    object TableDS_PROFILE: TStringField
      FieldName = 'DS_PROFILE'
      Size = 80
    end
  end
end
