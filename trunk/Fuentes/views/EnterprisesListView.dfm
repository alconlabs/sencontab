object FormEnterprisesListView: TFormEnterprisesListView
  Left = 1103
  Top = 277
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 279
  ClientWidth = 450
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    450
    279)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAccountingTitle: TLabel
    Left = 17
    Top = 13
    Width = 416
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = 'Seleccione una Empresa Contable'
    Font.Charset = ANSI_CHARSET
    Font.Color = 9667443
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object BtnCancel: TBitBtn
    Left = 249
    Top = 240
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
    TabOrder = 0
  end
  object BtnAccept: TBitBtn
    Left = 345
    Top = 240
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
    TabOrder = 1
  end
  object ListView: TListView
    Left = 16
    Top = 48
    Width = 417
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 82109668
    Columns = <>
    Ctl3D = False
    DragMode = dmAutomatic
    FullDrag = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    ViewStyle = vsList
  end
end
