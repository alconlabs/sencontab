object DataModuleSalespersons: TDataModuleSalespersons
  OldCreateOrder = False
  Left = 801
  Top = 628
  Height = 283
  Width = 400
  object NoUse: TCRSQLConnection
    ConnectionName = 'SQLServerConnection'
    DriverName = 'SQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=.'
      'DataBase=AVEZZO'
      'DriverName=SQLServer'
      'User_Name=sa'
      'Password=masterkey'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'oledb'
    Left = 47
    Top = 31
  end
  object QSalespersons: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 'SELECT COMERCIAL, '#13#10'               NOMBRE '#13#10'FROM     COMERCIALES'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
    object QSalespersonsCOMERCIAL: TStringField
      FieldName = 'COMERCIAL'
      FixedChar = True
      Size = 10
    end
    object QSalespersonsNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
end
