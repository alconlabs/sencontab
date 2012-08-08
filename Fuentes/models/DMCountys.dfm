object DataModuleCountys: TDataModuleCountys
  OldCreateOrder = False
  Left = 662
  Top = 432
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
    Connected = True
    Left = 47
    Top = 31
  end
  object QCountys: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT PROVINCIA,'#13#10'               NOMBRE ,'#13#10'               CODIG' +
      'O'#13#10'FROM     PROVINCIAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
    object QCountysPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      FixedChar = True
      Size = 2
    end
    object QCountysNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 25
    end
    object QCountysCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
  end
end
