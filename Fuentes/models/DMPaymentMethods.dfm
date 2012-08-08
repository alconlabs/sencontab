object DataModulePaymentMethods: TDataModulePaymentMethods
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
  object QPaymentMethods: TSimpleDataSet
    Aggregates = <>
    Connection = NoUse
    DataSet.CommandText = 
      'SELECT FORMAPAGO, '#13#10'               DESCRIBE,'#13#10'               CLA' +
      'SE,'#13#10'               INTERVALO,'#13#10'               NUMVENCI,'#13#10'      ' +
      '         OBSOLETO'#13#10'FROM     FORMAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = QPaymentMethodsCalcFields
    OnNewRecord = QPaymentMethodsNewRecord
    Left = 168
    Top = 16
    object QPaymentMethodsFORMAPAGO: TStringField
      FieldName = 'FORMAPAGO'
      FixedChar = True
      Size = 3
    end
    object QPaymentMethodsDESCRIBE: TStringField
      FieldName = 'DESCRIBE'
      FixedChar = True
      Size = 40
    end
    object QPaymentMethodsCLASE: TStringField
      FieldName = 'CLASE'
      FixedChar = True
      Size = 1
    end
    object QPaymentMethodsINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object QPaymentMethodsNUMVENCI: TIntegerField
      FieldName = 'NUMVENCI'
    end
    object QPaymentMethodsOBSOLETO: TStringField
      FieldName = 'OBSOLETO'
      FixedChar = True
      Size = 1
    end
    object QPaymentMethodsUNIDADES: TStringField
      FieldKind = fkCalculated
      FieldName = 'UNIDADES'
      Size = 5
      Calculated = True
    end
  end
end
