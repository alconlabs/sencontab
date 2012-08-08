object DataModuleAnalytics: TDataModuleAnalytics
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
  object QAnalytics: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT CUENTA, '#13#10'               NOMBRE,'#13#10'               ID_PROYE' +
      'CTO,'#13#10'               ID_SECCION,'#13#10'               ID_DEPARTAMENTO' +
      ','#13#10'               ID_DELEGACION '#13#10'FROM     ANALITICAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 16
    object QAnalyticsCUENTA: TStringField
      FieldName = 'CUENTA'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
    object QAnalyticsID_PROYECTO: TStringField
      FieldName = 'ID_PROYECTO'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsID_SECCION: TStringField
      FieldName = 'ID_SECCION'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsID_DEPARTAMENTO: TStringField
      FieldName = 'ID_DEPARTAMENTO'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsID_DELEGACION: TStringField
      FieldName = 'ID_DELEGACION'
      FixedChar = True
      Size = 10
    end
  end
end
