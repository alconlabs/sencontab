object DataModuleProjects: TDataModuleProjects
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
    Connected = True
    Left = 47
    Top = 31
  end
  object QProjects: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 'SELECT ID_PROYECTO, '#13#10'               NOMBRE '#13#10'FROM     PROYECTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
    object QProjectsID_PROYECTO: TStringField
      FieldName = 'ID_PROYECTO'
      FixedChar = True
      Size = 10
    end
    object QProjectsNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
end
