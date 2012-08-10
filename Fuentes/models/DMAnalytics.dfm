object DataModuleAnalytics: TDataModuleAnalytics
  OldCreateOrder = False
  Left = 796
  Top = 385
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
    OnCalcFields = QAnalyticsCalcFields
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
    object QAnalyticsID_DELEGACION: TStringField
      FieldName = 'ID_DELEGACION'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsDS_DELEGACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_DELEGACION'
      Size = 50
      Calculated = True
    end
    object QAnalyticsID_DEPARTAMENTO: TStringField
      FieldName = 'ID_DEPARTAMENTO'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsDS_DEPARTAMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_DEPARTAMENTO'
      Size = 50
      Calculated = True
    end
    object QAnalyticsID_PROYECTO: TStringField
      FieldName = 'ID_PROYECTO'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsDS_PROYECTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_PROYECTO'
      Size = 50
      Calculated = True
    end
    object QAnalyticsID_SECCION: TStringField
      FieldName = 'ID_SECCION'
      FixedChar = True
      Size = 10
    end
    object QAnalyticsDS_SECCION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_SECCION'
      Size = 50
      Calculated = True
    end
  end
  object LDelegacion: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT ID_DELEGACION, '#13#10'               NOMBRE'#13#10'FROM     DELEGACI' +
      'ON'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 64
    object LDelegacionID_DELEGACION: TStringField
      FieldName = 'ID_DELEGACION'
      FixedChar = True
      Size = 10
    end
    object LDelegacionNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
  object LDepartamento: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT ID_DEPARTAMENTO, '#13#10'               NOMBRE'#13#10'FROM     DEPART' +
      'AMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 256
    Top = 64
    object LDepartamentoID_DEPARTAMENTO: TStringField
      FieldName = 'ID_DEPARTAMENTO'
      FixedChar = True
      Size = 10
    end
    object LDepartamentoNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
  object LSeccion: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 'SELECT ID_SECCION, '#13#10'               NOMBRE'#13#10'FROM     SECCION'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 168
    Top = 120
    object LSeccionID_SECCION: TStringField
      FieldName = 'ID_SECCION'
      FixedChar = True
      Size = 10
    end
    object LSeccionNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
  object LProyecto: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 'SELECT ID_PROYECTO, '#13#10'               NOMBRE'#13#10'FROM     PROYECTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 256
    Top = 120
    object LProyectoID_PROYECTO: TStringField
      FieldName = 'ID_PROYECTO'
      FixedChar = True
      Size = 10
    end
    object LProyectoNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
  end
end
