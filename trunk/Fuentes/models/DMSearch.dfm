object DataModuleSearch: TDataModuleSearch
  OldCreateOrder = False
  Left = 839
  Top = 645
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
  object Query: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 120
    Top = 32
  end
end
