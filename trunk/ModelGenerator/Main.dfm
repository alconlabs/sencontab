object Form1: TForm1
  Left = 296
  Top = 76
  Width = 798
  Height = 554
  Caption = 'Creator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 305
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Tables'
    end
    object Label2: TLabel
      Left = 296
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Fields'
    end
    object Label3: TLabel
      Left = 424
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Field Types'
    end
    object Label4: TLabel
      Left = 496
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Field Lengths'
    end
    object Label5: TLabel
      Left = 568
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Allow NULL'
    end
    object LabelSQLServer: TLabel
      Left = 80
      Top = 32
      Width = 72
      Height = 13
      Caption = 'Not Connected'
    end
    object BtnConectarERPSystem: TBitBtn
      Left = 8
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Conectar ERPSystem'
      TabOrder = 0
      OnClick = BtnConectarERPSystemClick
    end
    object BtnConectarEMP_TEST: TBitBtn
      Left = 8
      Top = 72
      Width = 145
      Height = 25
      Caption = 'Conectar EMP_TEST'
      TabOrder = 1
      OnClick = BtnConectarEMP_TESTClick
    end
    object ListBoxTables: TListBox
      Left = 160
      Top = 24
      Width = 121
      Height = 265
      ItemHeight = 13
      TabOrder = 2
      OnClick = ListBoxTablesClick
    end
    object ListBoxFields: TListBox
      Left = 296
      Top = 24
      Width = 121
      Height = 265
      ItemHeight = 13
      TabOrder = 3
    end
    object ListBoxFieldTypes: TListBox
      Left = 424
      Top = 24
      Width = 65
      Height = 265
      ItemHeight = 13
      TabOrder = 4
    end
    object ListBoxFieldLengths: TListBox
      Left = 496
      Top = 24
      Width = 65
      Height = 265
      ItemHeight = 13
      TabOrder = 5
    end
    object ListBoxAllowNULL: TListBox
      Left = 568
      Top = 24
      Width = 65
      Height = 265
      ItemHeight = 13
      TabOrder = 6
    end
    object EditSingular: TLabeledEdit
      Left = 8
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Nombre Singular'
      TabOrder = 7
    end
    object EditPlural: TLabeledEdit
      Left = 8
      Top = 192
      Width = 121
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'Nombre Plural'
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 305
    Width = 790
    Height = 222
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 788
      Height = 220
      ActivePage = TabClass
      Align = alClient
      TabOrder = 0
      object TabClass: TTabSheet
        Caption = 'Class'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 48
          Align = alTop
          TabOrder = 0
          object BtnGeneraClass: TBitBtn
            Left = 8
            Top = 13
            Width = 89
            Height = 25
            Caption = 'Generar Class'
            TabOrder = 0
            OnClick = BtnGeneraClassClick
          end
          object BtnSaveClass: TButton
            Left = 648
            Top = 13
            Width = 121
            Height = 25
            Caption = 'Guarda Class'
            TabOrder = 1
            OnClick = BtnSaveClassClick
          end
        end
        object MemoClass: TMemo
          Left = 0
          Top = 48
          Width = 780
          Height = 144
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TabModel: TTabSheet
        Caption = 'Model'
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 48
          Align = alTop
          TabOrder = 0
          object BtnGeneralModelo: TButton
            Left = 8
            Top = 12
            Width = 121
            Height = 25
            Caption = 'Generar Modelo'
            TabOrder = 0
            OnClick = BtnGeneralModeloClick
          end
          object BtnSaveModel: TButton
            Left = 640
            Top = 15
            Width = 121
            Height = 25
            Caption = 'Guardar Modelo'
            TabOrder = 1
            OnClick = BtnSaveModelClick
          end
        end
        object MemoModel: TMemo
          Left = 0
          Top = 48
          Width = 780
          Height = 144
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
  end
  object sADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=masterkey;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=ERPSystem;Data Source=VM_DELPHI_7\S' +
      'QLExpress'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 104
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 728
    Top = 80
  end
  object SQLServer: TCRSQLConnection
    ConnectionName = 'SQLServerConnection'
    DriverName = 'SQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=.'
      'DataBase=CONTAB01'
      'DriverName=SQLServer'
      'User_Name=sa'
      'Password=MasterKey'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Connected = True
    Left = 16
    Top = 8
  end
end
