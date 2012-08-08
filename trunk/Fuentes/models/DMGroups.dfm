object DataModuleGroups: TDataModuleGroups
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
  object QGroups: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 'SELECT GRUPO, '#13#10'               DESCRIPCION '#13#10'FROM     GRUPOS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
    object QGroupsGRUPO: TStringField
      FieldName = 'GRUPO'
      FixedChar = True
      Size = 3
    end
    object QGroupsDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      FixedChar = True
      Size = 50
    end
  end
end
