object DMBlnc: TDMBlnc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 298
  Height = 436
  Width = 491
  object HInfBalTitulos: TTable
    DatabaseName = 'c:\'
    Exclusive = True
    Left = 52
    Top = 80
    object HInfBalTitulosTitulo: TStringField
      FieldName = 'Titulo'
      Size = 2
    end
    object HInfBalTitulosTituloReves: TStringField
      FieldName = 'TituloReves'
      Size = 2
    end
    object HInfBalTitulosDescripcionTitulo: TStringField
      FieldName = 'DescripcionTitulo'
      Size = 50
    end
    object HInfBalTitulosTipoPagina: TStringField
      FieldName = 'TipoPagina'
      Size = 10
    end
    object HInfBalTitulosFormula: TStringField
      FieldName = 'Formula'
      Size = 50
    end
    object HInfBalTitulosSaldoActualTitulo: TFloatField
      FieldName = 'SaldoActualTitulo'
    end
    object HInfBalTitulosSaldoAnteriorTitulo: TFloatField
      FieldName = 'SaldoAnteriorTitulo'
    end
    object HInfBalTitulosSuma1: TStringField
      FieldName = 'Suma1'
      Size = 3
    end
    object HInfBalTitulosSuma2: TStringField
      FieldName = 'Suma2'
      Size = 3
    end
    object HInfBalTitulosSuma3: TStringField
      FieldName = 'Suma3'
      Size = 3
    end
    object HInfBalTitulosSuma4: TStringField
      FieldName = 'Suma4'
      Size = 3
    end
    object HInfBalTitulosSuma5: TStringField
      FieldName = 'Suma5'
      Size = 3
    end
    object HInfBalTitulosSuma6: TStringField
      FieldName = 'Suma6'
      Size = 3
    end
    object HInfBalTitulosSuma7: TStringField
      FieldName = 'Suma7'
      Size = 3
    end
    object HInfBalTitulosSuma8: TStringField
      FieldName = 'Suma8'
      Size = 3
    end
    object HInfBalTitulosResta1: TStringField
      FieldName = 'Resta1'
      Size = 3
    end
    object HInfBalTitulosResta2: TStringField
      FieldName = 'Resta2'
      Size = 3
    end
    object HInfBalTitulosResta3: TStringField
      FieldName = 'Resta3'
      Size = 3
    end
    object HInfBalTitulosResta4: TStringField
      FieldName = 'Resta4'
      Size = 3
    end
    object HInfBalTitulosResta5: TStringField
      FieldName = 'Resta5'
      Size = 3
    end
    object HInfBalTitulosResta6: TStringField
      FieldName = 'Resta6'
      Size = 3
    end
    object HInfBalTitulosResta7: TStringField
      FieldName = 'Resta7'
      Size = 3
    end
    object HInfBalTitulosResta8: TStringField
      FieldName = 'Resta8'
      Size = 3
    end
  end
  object SInfBalTitulos: TDataSource
    DataSet = HInfBalTitulos
    Left = 144
    Top = 80
  end
  object HInfBalGrupos: TTable
    DatabaseName = 'c:\'
    Exclusive = True
    StoreDefs = True
    Left = 52
    Top = 38
    object HInfBalGruposGrupo: TStringField
      FieldName = 'Grupo'
      Size = 3
    end
    object HInfBalGruposDescripcionGrupo: TStringField
      FieldName = 'DescripcionGrupo'
      Size = 50
    end
    object HInfBalGruposSaldoActualGrupo: TFloatField
      FieldName = 'SaldoActualGrupo'
    end
    object HInfBalGruposSaldoAnteriorGrupo: TFloatField
      FieldName = 'SaldoAnteriorGrupo'
    end
    object HInfBalGruposTitulo: TStringField
      FieldName = 'Titulo'
      Size = 2
    end
  end
  object SInfBalGrupos: TDataSource
    DataSet = HInfBalGrupos
    Left = 144
    Top = 38
  end
  object HInfBalCuentas: TTable
    DatabaseName = 'c:\'
    Exclusive = True
    StoreDefs = True
    Left = 52
    Top = 122
    object HInfBalCuentasFechaInicial: TDateTimeField
      FieldName = 'FechaInicial'
    end
    object HInfBalCuentasFechaFinal: TDateTimeField
      FieldName = 'FechaFinal'
    end
    object HInfBalCuentasFechaImpresion: TDateTimeField
      FieldName = 'FechaImpresion'
    end
    object HInfBalCuentasTitulo: TStringField
      FieldName = 'Titulo'
      Size = 2
    end
    object HInfBalCuentasTituloReves: TStringField
      FieldName = 'TituloReves'
      Size = 2
    end
    object HInfBalCuentasDescripcionTitulo: TStringField
      FieldName = 'DescripcionTitulo'
      Size = 50
    end
    object HInfBalCuentasTipoPagina: TStringField
      FieldName = 'TipoPagina'
      Size = 10
    end
    object HInfBalCuentasFormula: TStringField
      FieldName = 'Formula'
      Size = 50
    end
    object HInfBalCuentasSaldoActualTitulo: TFloatField
      FieldName = 'SaldoActualTitulo'
    end
    object HInfBalCuentasSaldoAnteriorTitulo: TFloatField
      FieldName = 'SaldoAnteriorTitulo'
    end
    object HInfBalCuentasSuma1: TStringField
      FieldName = 'Suma1'
      Size = 3
    end
    object HInfBalCuentasSuma2: TStringField
      FieldName = 'Suma2'
      Size = 3
    end
    object HInfBalCuentasSuma3: TStringField
      FieldName = 'Suma3'
      Size = 3
    end
    object HInfBalCuentasSuma4: TStringField
      FieldName = 'Suma4'
      Size = 3
    end
    object HInfBalCuentasSuma5: TStringField
      FieldName = 'Suma5'
      Size = 3
    end
    object HInfBalCuentasSuma6: TStringField
      FieldName = 'Suma6'
      Size = 6
    end
    object HInfBalCuentasSuma7: TStringField
      FieldName = 'Suma7'
      Size = 3
    end
    object HInfBalCuentasSuma8: TStringField
      FieldName = 'Suma8'
      Size = 3
    end
    object HInfBalCuentasResta1: TStringField
      FieldName = 'Resta1'
      Size = 3
    end
    object HInfBalCuentasResta2: TStringField
      FieldName = 'Resta2'
      Size = 3
    end
    object HInfBalCuentasResta3: TStringField
      FieldName = 'Resta3'
      Size = 3
    end
    object HInfBalCuentasResta4: TStringField
      FieldName = 'Resta4'
      Size = 3
    end
    object HInfBalCuentasResta5: TStringField
      FieldName = 'Resta5'
      Size = 3
    end
    object HInfBalCuentasResta6: TStringField
      FieldName = 'Resta6'
      Size = 3
    end
    object HInfBalCuentasResta7: TStringField
      FieldName = 'Resta7'
      Size = 3
    end
    object HInfBalCuentasResta8: TStringField
      FieldName = 'Resta8'
      Size = 3
    end
    object HInfBalCuentasGrupo: TStringField
      FieldName = 'Grupo'
      Size = 3
    end
    object HInfBalCuentasDescripcionGrupo: TStringField
      FieldName = 'DescripcionGrupo'
      Size = 50
    end
    object HInfBalCuentasSaldoActualGrupo: TFloatField
      FieldName = 'SaldoActualGrupo'
    end
    object HInfBalCuentasSaldoAnteriorGrupo: TFloatField
      FieldName = 'SaldoAnteriorGrupo'
    end
    object HInfBalCuentasCuenta: TStringField
      FieldName = 'Cuenta'
      Size = 3
    end
    object HInfBalCuentasDescripcionCuenta: TStringField
      FieldName = 'DescripcionCuenta'
      Size = 50
    end
    object HInfBalCuentasSaldoAnteriorCuenta: TFloatField
      FieldName = 'SaldoAnteriorCuenta'
    end
    object HInfBalCuentasSaldoActualCuenta: TFloatField
      FieldName = 'SaldoActualCuenta'
    end
    object HInfBalCuentasTituloImpreso: TStringField
      FieldName = 'TituloImpreso'
      Size = 2
    end
  end
  object SInfBalCuentas: TDataSource
    DataSet = HInfBalCuentas
    Left = 144
    Top = 122
  end
  object MInfBalGrupos: TccMemoryTable
    Left = 264
    Top = 40
    object MInfBalGruposGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 3
    end
    object MInfBalGruposDS_GRUPO: TStringField
      FieldName = 'DS_GRUPO'
      Size = 50
    end
    object MInfBalGruposSALTO_ACTUAL_GRUPO: TFloatField
      FieldName = 'SALTO_ACTUAL_GRUPO'
    end
    object MInfBalGruposSALDO_ANTERIOR_GRUPO: TFloatField
      FieldName = 'SALDO_ANTERIOR_GRUPO'
    end
    object MInfBalGruposTITULO: TStringField
      FieldName = 'TITULO'
      Size = 2
    end
  end
  object MInfBalTitulos: TccMemoryTable
    Left = 264
    Top = 80
    object MInfBalTitulosTITULO: TStringField
      FieldName = 'TITULO'
      Size = 2
    end
    object MInfBalTitulosTITULO_REVES: TStringField
      FieldName = 'TITULO_REVES'
      Size = 2
    end
    object MInfBalTitulosDS_TITULO: TStringField
      FieldName = 'DS_TITULO'
      Size = 50
    end
    object MInfBalTitulosTIPO_PAGINA: TStringField
      FieldName = 'TIPO_PAGINA'
      Size = 10
    end
    object MInfBalTitulosFORMULA: TStringField
      FieldName = 'FORMULA'
      Size = 50
    end
    object MInfBalTitulosSALDO_ACTUAL_TITULO: TFloatField
      FieldName = 'SALDO_ACTUAL_TITULO'
    end
    object MInfBalTitulosSALDO_ANTERIOR_TITULO: TFloatField
      FieldName = 'SALDO_ANTERIOR_TITULO'
    end
    object MInfBalTitulosSUMA1: TStringField
      FieldName = 'SUMA1'
      Size = 3
    end
    object MInfBalTitulosSUMA2: TStringField
      FieldName = 'SUMA2'
      Size = 3
    end
    object MInfBalTitulosSUMA3: TStringField
      FieldName = 'SUMA3'
      Size = 3
    end
    object MInfBalTitulosSUMA4: TStringField
      FieldName = 'SUMA4'
      Size = 3
    end
    object MInfBalTitulosSUMA5: TStringField
      FieldName = 'SUMA5'
      Size = 3
    end
    object MInfBalTitulosSUMA6: TStringField
      FieldName = 'SUMA6'
      Size = 3
    end
    object MInfBalTitulosSUMA7: TStringField
      FieldName = 'SUMA7'
      Size = 3
    end
    object MInfBalTitulosSUMA8: TStringField
      FieldName = 'SUMA8'
      Size = 3
    end
    object MInfBalTitulosRESTA1: TStringField
      FieldName = 'RESTA1'
      Size = 3
    end
    object MInfBalTitulosRESTA2: TStringField
      FieldName = 'RESTA2'
      Size = 3
    end
    object MInfBalTitulosRESTA3: TStringField
      FieldName = 'RESTA3'
      Size = 3
    end
    object MInfBalTitulosRESTA4: TStringField
      FieldName = 'RESTA4'
      Size = 3
    end
    object MInfBalTitulosRESTA5: TStringField
      FieldName = 'RESTA5'
      Size = 3
    end
    object MInfBalTitulosRESTA6: TStringField
      FieldName = 'RESTA6'
      Size = 3
    end
    object MInfBalTitulosRESTA7: TStringField
      FieldName = 'RESTA7'
      Size = 3
    end
    object MInfBalTitulosRESTA8: TStringField
      FieldName = 'RESTA8'
      Size = 3
    end
  end
  object MInfBalCuentas: TccMemoryTable
    Left = 264
    Top = 128
    object MInfBalCuentasFC_INICIAL: TDateTimeField
      FieldName = 'FC_INICIAL'
    end
    object MInfBalCuentasFC_FINAL: TDateTimeField
      FieldName = 'FC_FINAL'
    end
    object MInfBalCuentasFC_IMPRESION: TDateTimeField
      FieldName = 'FC_IMPRESION'
    end
    object MInfBalCuentasTITULO: TStringField
      FieldName = 'TITULO'
      Size = 2
    end
    object MInfBalCuentasTITULO_REVES: TStringField
      FieldName = 'TITULO_REVES'
      Size = 2
    end
    object MInfBalCuentasDS_TITULO: TStringField
      FieldName = 'DS_TITULO'
      Size = 50
    end
    object MInfBalCuentasTIPO_PAGINA: TStringField
      FieldName = 'TIPO_PAGINA'
      Size = 10
    end
    object MInfBalCuentasFORMULA: TStringField
      FieldName = 'FORMULA'
      Size = 50
    end
    object MInfBalCuentasSALDO_ACTUAL_TITULO: TFloatField
      FieldName = 'SALDO_ACTUAL_TITULO'
    end
    object MInfBalCuentasSALDO_ANTERIOR_TITULO: TFloatField
      FieldName = 'SALDO_ANTERIOR_TITULO'
    end
    object MInfBalCuentasSUMA1: TStringField
      FieldName = 'SUMA1'
      Size = 3
    end
    object MInfBalCuentasSUMA2: TStringField
      FieldName = 'SUMA2'
      Size = 3
    end
    object MInfBalCuentasSUMA3: TStringField
      FieldName = 'SUMA3'
      Size = 3
    end
    object MInfBalCuentasSUMA4: TStringField
      FieldName = 'SUMA4'
      Size = 3
    end
    object MInfBalCuentasSUMA5: TStringField
      FieldName = 'SUMA5'
      Size = 3
    end
    object MInfBalCuentasSUMA6: TStringField
      FieldName = 'SUMA6'
      Size = 3
    end
    object MInfBalCuentasSUMA7: TStringField
      FieldName = 'SUMA7'
      Size = 3
    end
    object MInfBalCuentasSUMA8: TStringField
      FieldName = 'SUMA8'
      Size = 3
    end
    object MInfBalCuentasRESTA1: TStringField
      FieldName = 'RESTA1'
      Size = 3
    end
    object MInfBalCuentasRESTA2: TStringField
      FieldName = 'RESTA2'
      Size = 3
    end
    object MInfBalCuentasRESTA3: TStringField
      FieldName = 'RESTA3'
      Size = 3
    end
    object MInfBalCuentasRESTA4: TStringField
      FieldName = 'RESTA4'
      Size = 3
    end
    object MInfBalCuentasRESTA5: TStringField
      FieldName = 'RESTA5'
      Size = 3
    end
    object MInfBalCuentasRESTA6: TStringField
      FieldName = 'RESTA6'
      Size = 3
    end
    object MInfBalCuentasRESTA7: TStringField
      FieldName = 'RESTA7'
      Size = 3
    end
    object MInfBalCuentasRESTA8: TStringField
      FieldName = 'RESTA8'
      Size = 3
    end
    object MInfBalCuentasGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 3
    end
    object MInfBalCuentasDS_GRUPO: TStringField
      FieldName = 'DS_GRUPO'
      Size = 50
    end
    object MInfBalCuentasSALDO_ACTUAL_GRUPO: TFloatField
      FieldName = 'SALDO_ACTUAL_GRUPO'
    end
    object MInfBalCuentasSALDO_ANTERIOR_GRUPO: TFloatField
      FieldName = 'SALDO_ANTERIOR_GRUPO'
    end
    object MInfBalCuentasCUENTA: TStringField
      FieldName = 'CUENTA'
      Size = 3
    end
    object MInfBalCuentasDS_CUENTA: TStringField
      FieldName = 'DS_CUENTA'
      Size = 50
    end
    object MInfBalCuentasSALDO_ANTERIOR_CUENTA: TFloatField
      FieldName = 'SALDO_ANTERIOR_CUENTA'
    end
    object MInfBalCuentasSALDO_ACTUAL_CUENTA: TFloatField
      FieldName = 'SALDO_ACTUAL_CUENTA'
    end
    object MInfBalCuentasTITULO_IMPRESO: TStringField
      FieldName = 'TITULO_IMPRESO'
      Size = 2
    end
  end
  object SMInfBalGrupos: TDataSource
    AutoEdit = False
    DataSet = MInfBalGrupos
    Left = 352
    Top = 40
  end
  object SMInfBalTitulos: TDataSource
    AutoEdit = False
    DataSet = MInfBalTitulos
    Left = 352
    Top = 80
  end
  object SMInfBalCuentas: TDataSource
    DataSet = MInfBalCuentas
    Left = 352
    Top = 128
  end
end
