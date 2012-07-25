unit DMBalances;
interface
uses SysUtils, Classes, DB, ccMemTable, DBTables, IBDataBase, 
     DBXpress, SqlExpr, CRSQLConnection;

type
  TWhatConnection = (wcEjAnterior, wcSiamCont, wcConsolida);

  TDMBlnc = class(TDataModule)
    HInfBalTitulos: TTable;
    HInfBalTitulosTitulo: TStringField;
    HInfBalTitulosTituloReves: TStringField;
    HInfBalTitulosDescripcionTitulo: TStringField;
    HInfBalTitulosTipoPagina: TStringField;
    HInfBalTitulosFormula: TStringField;
    HInfBalTitulosSaldoActualTitulo: TFloatField;
    HInfBalTitulosSaldoAnteriorTitulo: TFloatField;
    HInfBalTitulosSuma1: TStringField;
    HInfBalTitulosSuma2: TStringField;
    HInfBalTitulosSuma3: TStringField;
    HInfBalTitulosSuma4: TStringField;
    HInfBalTitulosSuma5: TStringField;
    HInfBalTitulosSuma6: TStringField;
    HInfBalTitulosSuma7: TStringField;
    HInfBalTitulosSuma8: TStringField;
    HInfBalTitulosResta1: TStringField;
    HInfBalTitulosResta2: TStringField;
    HInfBalTitulosResta3: TStringField;
    HInfBalTitulosResta4: TStringField;
    HInfBalTitulosResta5: TStringField;
    HInfBalTitulosResta6: TStringField;
    HInfBalTitulosResta7: TStringField;
    HInfBalTitulosResta8: TStringField;
    SInfBalTitulos: TDataSource;
    HInfBalGrupos: TTable;
    HInfBalGruposGrupo: TStringField;
    HInfBalGruposDescripcionGrupo: TStringField;
    HInfBalGruposSaldoActualGrupo: TFloatField;
    HInfBalGruposSaldoAnteriorGrupo: TFloatField;
    HInfBalGruposTitulo: TStringField;
    SInfBalGrupos: TDataSource;
    HInfBalCuentas: TTable;
    HInfBalCuentasFechaInicial: TDateTimeField;
    HInfBalCuentasFechaFinal: TDateTimeField;
    HInfBalCuentasFechaImpresion: TDateTimeField;
    HInfBalCuentasTitulo: TStringField;
    HInfBalCuentasTituloReves: TStringField;
    HInfBalCuentasDescripcionTitulo: TStringField;
    HInfBalCuentasTipoPagina: TStringField;
    HInfBalCuentasFormula: TStringField;
    HInfBalCuentasSaldoActualTitulo: TFloatField;
    HInfBalCuentasSaldoAnteriorTitulo: TFloatField;
    HInfBalCuentasSuma1: TStringField;
    HInfBalCuentasSuma2: TStringField;
    HInfBalCuentasSuma3: TStringField;
    HInfBalCuentasSuma4: TStringField;
    HInfBalCuentasSuma5: TStringField;
    HInfBalCuentasSuma6: TStringField;
    HInfBalCuentasSuma7: TStringField;
    HInfBalCuentasSuma8: TStringField;
    HInfBalCuentasResta1: TStringField;
    HInfBalCuentasResta2: TStringField;
    HInfBalCuentasResta3: TStringField;
    HInfBalCuentasResta4: TStringField;
    HInfBalCuentasResta5: TStringField;
    HInfBalCuentasResta6: TStringField;
    HInfBalCuentasResta7: TStringField;
    HInfBalCuentasResta8: TStringField;
    HInfBalCuentasGrupo: TStringField;
    HInfBalCuentasDescripcionGrupo: TStringField;
    HInfBalCuentasSaldoActualGrupo: TFloatField;
    HInfBalCuentasSaldoAnteriorGrupo: TFloatField;
    HInfBalCuentasCuenta: TStringField;
    HInfBalCuentasDescripcionCuenta: TStringField;
    HInfBalCuentasSaldoAnteriorCuenta: TFloatField;
    HInfBalCuentasSaldoActualCuenta: TFloatField;
    HInfBalCuentasTituloImpreso: TStringField;
    SInfBalCuentas: TDataSource;
    MInfBalGrupos: TccMemoryTable;
    MInfBalTitulos: TccMemoryTable;
    MInfBalCuentas: TccMemoryTable;
    SMInfBalGrupos: TDataSource;
    SMInfBalTitulos: TDataSource;
    SMInfBalCuentas: TDataSource;
    MInfBalGruposGRUPO: TStringField;
    MInfBalGruposDS_GRUPO: TStringField;
    MInfBalGruposTITULO: TStringField;
    MInfBalTitulosTITULO: TStringField;
    MInfBalTitulosTITULO_REVES: TStringField;
    MInfBalTitulosDS_TITULO: TStringField;
    MInfBalTitulosTIPO_PAGINA: TStringField;
    MInfBalTitulosFORMULA: TStringField;
    MInfBalTitulosSALDO_ACTUAL_TITULO: TFloatField;
    MInfBalTitulosSALDO_ANTERIOR_TITULO: TFloatField;
    MInfBalTitulosSUMA1: TStringField;
    MInfBalTitulosSUMA2: TStringField;
    MInfBalTitulosSUMA3: TStringField;
    MInfBalTitulosSUMA4: TStringField;
    MInfBalTitulosSUMA5: TStringField;
    MInfBalTitulosSUMA6: TStringField;
    MInfBalTitulosSUMA7: TStringField;
    MInfBalTitulosSUMA8: TStringField;
    MInfBalTitulosRESTA1: TStringField;
    MInfBalTitulosRESTA2: TStringField;
    MInfBalTitulosRESTA3: TStringField;
    MInfBalTitulosRESTA4: TStringField;
    MInfBalTitulosRESTA5: TStringField;
    MInfBalTitulosRESTA6: TStringField;
    MInfBalTitulosRESTA7: TStringField;
    MInfBalTitulosRESTA8: TStringField;
    MInfBalGruposSALTO_ACTUAL_GRUPO: TFloatField;
    MInfBalGruposSALDO_ANTERIOR_GRUPO: TFloatField;
    MInfBalCuentasFC_INICIAL: TDateTimeField;
    MInfBalCuentasFC_FINAL: TDateTimeField;
    MInfBalCuentasFC_IMPRESION: TDateTimeField;
    MInfBalCuentasTITULO: TStringField;
    MInfBalCuentasTITULO_REVES: TStringField;
    MInfBalCuentasDS_TITULO: TStringField;
    MInfBalCuentasTIPO_PAGINA: TStringField;
    MInfBalCuentasFORMULA: TStringField;
    MInfBalCuentasSALDO_ACTUAL_TITULO: TFloatField;
    MInfBalCuentasSALDO_ANTERIOR_TITULO: TFloatField;
    MInfBalCuentasSUMA1: TStringField;
    MInfBalCuentasSUMA2: TStringField;
    MInfBalCuentasSUMA3: TStringField;
    MInfBalCuentasSUMA4: TStringField;
    MInfBalCuentasSUMA5: TStringField;
    MInfBalCuentasSUMA6: TStringField;
    MInfBalCuentasSUMA7: TStringField;
    MInfBalCuentasSUMA8: TStringField;
    MInfBalCuentasRESTA1: TStringField;
    MInfBalCuentasRESTA2: TStringField;
    MInfBalCuentasRESTA4: TStringField;
    MInfBalCuentasRESTA5: TStringField;
    MInfBalCuentasRESTA6: TStringField;
    MInfBalCuentasRESTA7: TStringField;
    MInfBalCuentasRESTA8: TStringField;
    MInfBalCuentasGRUPO: TStringField;
    MInfBalCuentasDS_GRUPO: TStringField;
    MInfBalCuentasRESTA3: TStringField;
    MInfBalCuentasSALDO_ACTUAL_GRUPO: TFloatField;
    MInfBalCuentasSALDO_ANTERIOR_GRUPO: TFloatField;
    MInfBalCuentasCUENTA: TStringField;
    MInfBalCuentasDS_CUENTA: TStringField;
    MInfBalCuentasSALDO_ANTERIOR_CUENTA: TFloatField;
    MInfBalCuentasSALDO_ACTUAL_CUENTA: TFloatField;
    MInfBalCuentasTITULO_IMPRESO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CreaTablasParaInformesBalances;
    procedure RellenaDatosDescripcion(prmFechaInicial   :TDateTime;
                                      prmFechaFinal     :TDateTime;
                                      prmFechaImpresion :TDateTime);
    procedure RellenaSaldosCuentas(prmFechaInicial   :TDateTime;
                                   prmFechaFinal     :TDateTime;
                                   prmFechaImpresion :TDateTime);
    procedure FiltraRegistros(prmTipoInforme             :Integer;
                              prmSaldosEjercicioAnterior :Boolean;
                              prmEmpresaAnterior         :Integer);
    procedure InsertaLineasFormulas(prmFechaInicial   :TDateTime;
                                    prmFechaFinal     :TDateTime;
                                    prmFechaImpresion :TDateTime);
    procedure Formula(prmSuma :string; prmSigno :Integer);

    function PerteneceAnalitica(prmCuentaAnalitica :string;
                                FiltroCuenta       :string;
                                FiltroCuentaH      :string;
                                FiltroDelegacion   :string;
                                FiltroDepartamento :string;
                                FiltroSeccion      :string;
                                FiltroProyecto     :string;
                                prmConexion        :TWhatConnection):Boolean;
    procedure InicializarFicherosInformes;

  public
    procedure ProcesaInfBalanceSituacion(prmTipoInforme             :Integer;
                                         prmFechaInicial            :TDateTime;
                                         prmFechaFinal              :TDateTime;
                                         prmFechaImpresion          :TDateTime;
                                         prmSaldosEjercicioAnterior :Boolean;
                                         prmMonedaImpresion         :string;
                                         prmTipoConcepto            :string;
                                         prmCuentaAnalitica         :string;
                                         prmDelegacion              :string;
                                         prmDepartamento            :string;
                                         prmSeccion                 :string;
                                         prmProyecto                :string;
                                         prmEmpresas                :TStrings;
                                         prmEmpresaAnterior         :Integer);
  end;

var
  DMBlnc: TDMBlnc;

implementation

uses DM, General, Globales, IBQuery, MenuPrincipal;

{$R *.dfm}

procedure TDMBlnc.CreaTablasParaInformesBalances;
begin
   // Títulos
   HInfBalTitulos.Active       := False;
   HInfBalTitulos.DatabaseName := 'c:\'; //ExtractFileDir(Application.ExeName);
   HInfBalTitulos.TableName    := 'BTITULO' + '.DB';

   HInfBalTitulos.FieldDefs.Clear;
   HInfBalTitulos.FieldDefs.Add('Titulo'             , ftString,  2, False);
   HInfBalTitulos.FieldDefs.Add('TituloReves'        , ftString,  2, False);
   HInfBalTitulos.FieldDefs.Add('DescripcionTitulo'  , ftString, 50, False);
   HInfBalTitulos.FieldDefs.Add('TipoPagina'         , ftString, 10, False);
   HInfBalTitulos.FieldDefs.Add('Formula'            , ftString, 50, False);
   HInfBalTitulos.FieldDefs.Add('SaldoActualTitulo'  , ftFloat ,  0, False);
   HInfBalTitulos.FieldDefs.Add('SaldoAnteriorTitulo', ftFloat ,  0, False);
   HInfBalTitulos.FieldDefs.Add('Suma1'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma2'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma3'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma4'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma5'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma6'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma7'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Suma8'              , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta1'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta2'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta3'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta4'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta5'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta6'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta7'             , ftString,  3, False);
   HInfBalTitulos.FieldDefs.Add('Resta8'             , ftString,  3, False);

   HInfBalTitulos.IndexDefs.Clear;
   HInfBalTitulos.IndexDefs.Add('', 'Titulo;TituloReves', [ixPrimary]);
   HInfBalTitulos.IndexDefs.Add('TituloReves', 'TituloReves', []);

   HInfBalTitulos.CreateTable;
   HInfBalTitulos.Active := True;

   // Grupos
   HInfBalGrupos.Active       := False;
   HInfBalGrupos.DatabaseName := 'c:\'; //ExtractFileDir(Application.ExeName);
   HInfBalGrupos.TableName    := 'BGRUPO' + '.DB';

   HInfBalGrupos.FieldDefs.Clear;
   HInfBalGrupos.FieldDefs.Add('Grupo'             , ftString,  3, False);
   HInfBalGrupos.FieldDefs.Add('Titulo'            , ftString,  2, False);
   HInfBalGrupos.FieldDefs.Add('DescripcionGrupo'  , ftString, 50, False);
   HInfBalGrupos.FieldDefs.Add('SaldoActualGrupo'  , ftFloat ,  0, False);
   HInfBalGrupos.FieldDefs.Add('SaldoAnteriorGrupo', ftFloat ,  0, False);

   HInfBalGrupos.IndexDefs.Clear;
   HInfBalGrupos.IndexDefs.Add('', 'Grupo;Titulo', [ixPrimary]);
   HInfBalGrupos.IndexDefs.Add('Titulo', 'Titulo;Grupo', []);

   HInfBalGrupos.CreateTable;
   HInfBalGrupos.Active := True;

   // Cuentas
   HInfBalCuentas.Active       := False;
   HInfBalCuentas.DatabaseName := 'c:\'; //ExtractFileDir(Application.ExeName);
   HInfBalCuentas.TableName    := 'BCUENTAS' + '.DB';

   HInfBalCuentas.FieldDefs.Clear;
   HInfBalCuentas.FieldDefs.Add('Cuenta'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Grupo'              , ftString  ,  3, False);
         // Títulos
   HInfBalCuentas.FieldDefs.Add('Titulo'             , ftString  ,  2, False);
   HInfBalCuentas.FieldDefs.Add('TituloReves'        , ftString  ,  2, False);
   HInfBalCuentas.FieldDefs.Add('TituloImpreso'      , ftString  ,  2, False);
   HInfBalCuentas.FieldDefs.Add('SaldoActualTitulo'  , ftFloat   ,  0, False);
   HInfBalCuentas.FieldDefs.Add('SaldoAnteriorTitulo', ftFloat   ,  0, False);
   HInfBalCuentas.FieldDefs.Add('DescripcionTitulo'  , ftString  , 50, False);
   HInfBalCuentas.FieldDefs.Add('TipoPagina'         , ftString  , 10, False);
   HInfBalCuentas.FieldDefs.Add('Formula'            , ftString  , 50, False);
   HInfBalCuentas.FieldDefs.Add('Suma1'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma2'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma3'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma4'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma5'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma6'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma7'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Suma8'              , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta1'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta2'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta3'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta4'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta5'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta6'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta7'             , ftString  ,  3, False);
   HInfBalCuentas.FieldDefs.Add('Resta8'             , ftString  ,  3, False);
            // Grupos
   HInfBalCuentas.FieldDefs.Add('DescripcionGrupo'   , ftString  , 50, False);
   HInfBalCuentas.FieldDefs.Add('SaldoActualGrupo'   , ftFloat   ,  0, False);
   HInfBalCuentas.FieldDefs.Add('SaldoAnteriorGrupo' , ftFloat   ,  0, False);
            // Cuentas
   HInfBalCuentas.FieldDefs.Add('DescripcionCuenta'  , ftString  , 50, False);
   HInfBalCuentas.FieldDefs.Add('SaldoActualCuenta'  , ftFloat   ,  0, False);
   HInfBalCuentas.FieldDefs.Add('SaldoAnteriorCuenta', ftFloat   ,  0, False);

   HInfBalCuentas.FieldDefs.Add('FechaInicial'       , ftDateTime,  0, False);
   HInfBalCuentas.FieldDefs.Add('FechaFinal'         , ftDateTime,  0, False);
   HInfBalCuentas.FieldDefs.Add('FechaImpresion'     , ftDateTime,  0, False);

   HInfBalCuentas.IndexDefs.Clear;
   HInfBalCuentas.IndexDefs.Add('', 'Cuenta;Grupo;Titulo', [ixPrimary]);
   //HInfBalCuentas.IndexDefs.Add('', 'Cuenta;Grupo;Titulo;TituloReves;TituloImpreso;SaldoActualTitulo', [ixPrimary]);
   HInfBalCuentas.IndexDefs.Add('Grupo' , 'Grupo;Cuenta'       , []);
   HInfBalCuentas.IndexDefs.Add('Titulo', 'Titulo;Grupo;Cuenta', []);

   HInfBalCuentas.CreateTable;
   HInfBalCuentas.Active := True;
end;

procedure TDMBlnc.DataModuleCreate(Sender: TObject);
begin
   CreaTablasParaInformesBalances;
end;

procedure TDMBlnc.RellenaDatosDescripcion(prmFechaInicial   :TDateTime;
                                          prmFechaFinal     :TDateTime;
                                          prmFechaImpresion :TDateTime);
begin
   { Indica la fechas del informe para incluirlas en la descripción. }
   HInfBalCuentasFECHAINICIAL.AsDateTime   := prmFechaInicial;
   HInfBalCuentasFECHAFINAL.AsDateTime     := prmFechaFinal;
   HInfBalCuentasFECHAIMPRESION.AsDateTime := prmFechaImpresion;
end;

procedure TDMBlnc.RellenaSaldosCuentas(prmFechaInicial   :TDateTime;
                                       prmFechaFinal     :TDateTime;
                                       prmFechaImpresion :TDateTime);
var j     :Integer;
    Campo :string;
    Letra :string;
begin
   HInfBalCuentas.IndexName := 'Titulo';
   HInfBalGrupos.IndexName  := 'Titulo';
   HInfBalTitulos.IndexName := '';

   HInfBalCuentas.First;
   HInfBalTitulos.First;
   HInfBalGrupos.First;

   while not HInfBalTitulos.EOF do begin
      while not HInfBalGrupos.EOF and
         (HInfBalTitulosTITULO.AsString = HInfBalGruposTITULO.AsString) do begin
         while not HInfBalCuentas.EOF and (HInfBalGruposGRUPO.AsString =
               HInfBalCuentasGRUPO.AsString) do begin
            HInfBalCuentas.Edit;
            RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);

            for j := 0 to HInfBalTitulos.FieldCount - 1 do begin
               Campo := HInfBalTitulos.Fields[j].FieldName;
               HInfBalCuentas.FieldByName(Campo).Value := HInfBalTitulos.FieldByName(Campo).Value;
            end;

            for j := 0 to HInfBalGrupos.FieldCount - 1 do begin
               Campo := HInfBalGrupos.Fields[j].FieldName;
               HInfBalCuentas.FieldByName(Campo).Value := HInfBalGrupos.FieldByName(Campo).Value;
            end;

            Letra := Copy(HInfBalCuentasTITULO.AsString, 1, 1);
            if (Letra = 'P') or (Letra = 'H') then begin
               HInfBalCuentasSALDOACTUALTITULO.AsFloat :=
                  (-1) * HInfBalCuentasSALDOACTUALTITULO.AsFloat;
               HInfBalCuentasSALDOACTUALGRUPO.AsFloat  :=
                  (-1) * HInfBalCuentasSALDOACTUALGRUPO.AsFloat;
               HInfBalCuentasSALDOACTUALCUENTA.AsFloat :=
                  (-1) * HInfBalCuentasSALDOACTUALCUENTA.AsFloat;

               HInfBalCuentasSALDOANTERIORTITULO.AsFloat :=
                  (-1) * HInfBalCuentasSALDOANTERIORTITULO.AsFloat;
               HInfBalCuentasSALDOANTERIORGRUPO.AsFloat  :=
                  (-1) * HInfBalCuentasSALDOANTERIORGRUPO.AsFloat;
               HInfBalCuentasSALDOANTERIORCUENTA.AsFloat :=
                  (-1) * HInfBalCuentasSALDOANTERIORCUENTA.AsFloat;
            end;

            if (Letra = 'D') or (Letra = 'H') then begin
               HInfBalCuentasSALDOACTUALTITULO.AsFloat   := Abs(HInfBalCuentasSALDOACTUALTITULO.AsFloat  );
               HInfBalCuentasSALDOANTERIORTITULO.AsFloat := Abs(HInfBalCuentasSALDOANTERIORTITULO.AsFloat);
            end;

            HInfBalCuentas.Post;
            HInfBalCuentas.Next;
         end;
         HInfBalGrupos.Next;
      end;
      HInfBalTitulos.Next;
   end;
end;

procedure TDMBlnc.FiltraRegistros(prmTipoInforme             :Integer;
                                  prmSaldosEjercicioAnterior :Boolean;
                                  prmEmpresaAnterior         :Integer);
begin
   HInfBalCuentas.IndexName := 'Titulo';
   HInfBalCuentas.First;

   while not HInfBalCuentas.EOF do begin
      if prmTipoInforme = INF_BALANCE_SITUACION then begin
         if (HInfBalCuentasSALDOACTUALCUENTA.AsFloat   = 0) and
            (HInfBalCuentasSALDOANTERIORCUENTA.AsFloat = 0) then begin
            HInfBalCuentas.Delete;
         end else
         if (not prmSaldosEjercicioAnterior) and (prmEmpresaAnterior = 0) and
            (HInfBalCuentasSALDOACTUALCUENTA.AsFloat = 0) then
         begin
            HInfBalCuentas.Delete;
         end
         else HInfBalCuentas.Next;
      end
      else begin
         if (HInfBalCuentasSALDOACTUALCUENTA.AsFloat    = 0) and
            (HInfBalCuentasSALDOANTERIORCUENTA.AsFloat  = 0) and
            (HInfBalCuentasCUENTA.AsString             <> '') then begin
            HInfBalCuentas.Delete;
         end
         else HInfBalCuentas.Next;
      end;
   end;
end;

procedure TDMBlnc.InsertaLineasFormulas(prmFechaInicial   :TDateTime;
                                        prmFechaFinal     :TDateTime;
                                        prmFechaImpresion :TDateTime);
var Campo  :string;
    Letra  :string;
    Titulo :string;
    j      :Integer;
begin
   HInfBalTitulos.IndexName := '';
   HInfBalTitulos.First;

   HInfBalCuentas.IndexName := 'Titulo';

   while not HInfBalTitulos.EOF do begin
      if (HInfBalTitulosSALDOACTUALTITULO.AsFloat +
         HInfBalTitulosSALDOANTERIORTITULO.AsFloat) <> 0 then begin
         HInfBalCuentas.First;
         Titulo := HInfBalTitulosTITULO.AsString;
         if not HInfBalCuentas.Locate('TITULO', Titulo, []) then begin
            HInfBalCuentas.Append;
            HInfBalCuentas.Edit;
            RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
            for J := 0 to HInfBalTitulos.FieldCount - 1 do begin
               Campo := HInfBalTitulos.Fields[J].FieldName;
               HInfBalCuentas.FieldByName(Campo).Value :=
                  HInfBalTitulos.FieldByName(Campo).Value;
            end;

            Letra := Copy(HInfBalCuentasTITULO.AsString, 1, 1);
            if (Letra = 'P') or (Letra = 'H') then begin
               HInfBalCuentasSALDOACTUALTITULO.AsFloat :=
                  (-1) * HInfBalCuentasSALDOACTUALTITULO.AsFloat;
               HInfBalCuentasSALDOANTERIORTITULO.AsFloat :=
                  (-1) * HInfBalCuentasSALDOANTERIORTITULO.AsFloat;
            end;

            if (Letra = 'D') or (Letra = 'H') then begin
               HInfBalCuentasSALDOACTUALTITULO.AsFloat :=
                  Abs(HInfBalCuentasSALDOACTUALTITULO.AsFloat);
               HInfBalCuentasSALDOANTERIORTITULO.AsFloat :=
                  Abs(HInfBalCuentasSALDOANTERIORTITULO.AsFloat);
            end;

            HInfBalCuentas.Post;
         end;
      end;
      HInfBalTitulos.Next;
   end;
end;

procedure TDMBlnc.Formula(prmSuma :string; prmSigno :Integer);
var nPor         :Integer;
    nActual1     :Double;
    nAnterior1   :Double;
    cTituloReves :string;
begin
   cTituloReves := HInfBalTitulosTITULOREVES.AsString;
   if not Empty(prmSuma) then begin
      if Copy(prmSuma, 1, 1) = 'H' then nPor := -1
                                   else nPor :=  1;
      if Length(Trim(prmSuma)) > 2 then begin
         { GRUPO }
         if HInfBalGrupos.Locate('GRUPO', prmSuma, []) then begin
            HInfBalTitulos.Edit;
            if prmSigno = 1 then begin
               HInfBalTitulosSALDOACTUALTITULO.AsFloat   :=
                    HInfBalTitulosSALDOACTUALTITULO.AsFloat +
                    (nPor * HInfBalGruposSALDOACTUALGRUPO.AsFloat);
               HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                    HInfBalTitulosSALDOANTERIORTITULO.AsFloat +
                    (nPor * HInfBalGruposSALDOANTERIORGRUPO.AsFloat);
            end
            else begin
               HInfBalTitulosSALDOACTUALTITULO.AsFloat   :=
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat - (nPor *
                  HInfBalGruposSALDOACTUALGRUPO.AsFloat);
               HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                  HInfBalTitulosSALDOANTERIORTITULO.AsFloat -
                  (nPor * HInfBalGruposSALDOANTERIORGRUPO.AsFloat);
            end;
            HInfBalTitulos.Post;
         end;
      end else
      if HInfBalTitulos.Locate('TITULO', Copy(prmSuma, 2, 1) + Copy(prmSuma, 1, 1), []) then begin { TITULO }
         nActual1   := HInfBalTitulosSALDOACTUALTITULO.AsFloat;
         nAnterior1 := HInfBalTitulosSALDOANTERIORTITULO.AsFloat;

         if HInfBalTitulos.Locate('TITULO', cTituloReves, []) then begin
            HInfBalTitulos.Edit;
            if prmSigno = 1 then begin
               HInfBalTitulosSALDOACTUALTITULO.AsFloat   :=
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat + (nPor * nActual1);
               HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                  HInfBalTitulosSALDOANTERIORTITULO.AsFloat + (nPor * nAnterior1);
            end
            else begin
               HInfBalTitulosSALDOACTUALTITULO.AsFloat   :=
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat - (nPor * nActual1);
               HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                  HInfBalTitulosSALDOANTERIORTITULO.AsFloat - (nPor * nAnterior1);
            end;
            HInfBalTitulos.Post;
         end;
      end;
   end;
end;

function TDMBlnc.PerteneceAnalitica(prmCuentaAnalitica :string;
                                    FiltroCuenta       :string;
                                    FiltroCuentaH      :string;
                                    FiltroDelegacion   :string;
                                    FiltroDepartamento :string;
                                    FiltroSeccion      :string;
                                    FiltroProyecto     :string;
                                    prmConexion        :TWhatConnection):Boolean;
var Q :TSQLQuery;
begin
   if (FiltroCuenta       <> '') or
      (FiltroDelegacion   <> '') or
      (FiltroDepartamento <> '') or
      (FiltroSeccion      <> '') or
      (FiltroProyecto     <> '') then begin

      case prmConexion of
         wcEjAnterior : Q := DMRef.CreateQueryEjAnterior(['']);
         wcSiamCont   : Q := DMRef.CreateQuery          (['']);
         wcConsolida  : Q := DMRef.CreateQueryConsolida (['']);
      end;

      //Q.Transaction := Database.DefaultTransaction;
                                       Q.SQL.Add('SELECT COUNT(*) CUANTAS                                       ');
                                       Q.SQL.Add('FROM   ANALITICAS                                             ');
                                       Q.SQL.Add('WHERE CUENTA          = :prmCUENTA_ANALITICA                  ');
      if FiltroCuentaH      <> '' then Q.SQL.Add('AND   CUENTA         >= :prmCUENTA AND CUENTA <= :prmCUENTA_H ') else
      if FiltroCuenta       <> '' then Q.SQL.Add('AND   CUENTA          = :prmCUENTA                            ');
      if FiltroDelegacion   <> '' then Q.SQL.Add('AND   ID_DELEGACION   = :prmID_DELEGACION                     ');
      if FiltroDepartamento <> '' then Q.SQL.Add('AND   ID_DEPARTAMENTO = :prmID_DEPARTAMENTO                   ');
      if FiltroSeccion      <> '' then Q.SQL.Add('AND   ID_SECCION      = :prmID_SECCION                        ');
      if FiltroProyecto     <> '' then Q.SQL.Add('AND   ID_PROYECTO     = :prmID_PROYECTO                       ');

      Q.ParamByName('prmCUENTA_ANALITICA').AsString := prmCuentaAnalitica;

      if FiltroCuenta       <> '' then Q.ParamByName('prmCUENTA'         ).AsString := FiltroCuenta;
      if FiltroCuentaH      <> '' then Q.ParamByName('prmCUENTA_H'       ).AsString := FiltroCuentaH;
      if FiltroDelegacion   <> '' then Q.ParamByName('prmID_DELEGACION'  ).AsString := FiltroDelegacion;
      if FiltroDepartamento <> '' then Q.ParamByName('prmID_DEPARTAMENTO').AsString := FiltroDepartamento;
      if FiltroSeccion      <> '' then Q.ParamByName('prmID_SECCION'     ).AsString := FiltroSeccion;
      if FiltroProyecto     <> '' then Q.ParamByName('prmID_PROYECTO'    ).AsString := FiltroProyecto;

      try Q.Open;
          Result := Q.FieldByName('CUANTAS').AsInteger > 0;
      finally Q.Free;
      end;
   end
   else Result := True;
end;


{+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-}

procedure TDMBlnc.ProcesaInfBalanceSituacion(prmTipoInforme             :Integer;
                                             prmFechaInicial            :TDateTime;
                                             prmFechaFinal              :TDateTime;
                                             prmFechaImpresion          :TDateTime;
                                             prmSaldosEjercicioAnterior :Boolean;
                                             prmMonedaImpresion         :string;
                                             prmTipoConcepto            :string;
                                             prmCuentaAnalitica         :string;
                                             prmDelegacion              :string;
                                             prmDepartamento            :string;
                                             prmSeccion                 :string;
                                             prmProyecto                :string;
                                             prmEmpresas                :TStrings;
                                             prmEmpresaAnterior         :Integer);
var
   // quita la espera Caratula             :TEspere;
   QCuentas             :TSQLQuery;
   QTitulos             :TSQLQuery;
   QGrupos              :TSQLQuery;
   QDiario              :TSQLQuery;
   QDiarioConsolida     :TSQLQuery;
   QConsolida           :TSQLQuery;
   QSaldoAnteriorCuenta :TSQLQuery;
   
   nIndice              :Integer;
   MesInicio            :Integer;
   MesFinal             :Integer;
   IndCons              :Integer;
   j                    :Integer;
   aFormula             :array [0..8] of string;
   aSaldo               :array [0..8] of Double;
   Cuenta               :string;
   DebeHaber            :string;
   Grupo1               :string;
   Grupo2               :string;
   Grupo                :string;
   Letra1               :string;
   Letra2               :string;
   Letra                :string;
   Titulo               :string;
   TipoPagina           :string;
   nImporteAnt          :Double;
   nImporte             :Double;
   nImporteCons         :Double;
   nTotDb               :Double;
   nTotHb               :Double;
   nTot129              :Double;
   nTotDbEjAnt          :Double;
   nTotHbEjAnt          :Double;
   nTotAnt129           :Double;
   nTotDbAnt129         :Double;
   nTotHbAnt129         :Double;
   nSaldoAux            :Double;
   aMeses               :array[1..12] of Double;
   Campo                :string;
   TextoFormula         :string;
   IncluirEnInforme     :Boolean;
   lBorraAnterior       :Boolean;
   FechaInicialAnterior :TDateTime;
   FechaFinalAnterior   :TDateTime;
   nEjercicio           :Word;
   nMes                 :Word;
   nDia                 :Word;
   ListaQuery           :TStringList;
begin
   //Screen.cursor:= crHourGlass;
   // quita la espera Caratula := TEspere.Create(nil);
   // quita la espera Caratula.Mensaje      := 'Generando informe ...';
   // quita la espera Caratula.Ancho        := 300;
   // quita la espera Caratula.Alto         := 150;
   // quita la espera Caratula.Avi_Left     := 20;
   // quita la espera Caratula.Avi_Top      := 80;
   // quita la espera Caratula.Fuente.Color := clWhite;
   // quita la espera Caratula.Fuente.Name  := 'Arial';
   // quita la espera Caratula.Fuente.Size  := 14;
   // quita la espera Caratula.Mensaje_Left := 14;
   // quita la espera Caratula.Mensaje_Top  := 14;
   // quita la espera Caratula.Avi_Color    := $00A56D39;
   // quita la espera Caratula.ColorFondo   := $00A56D39;
   // quita la espera Caratula.Imagenes.Cancelar_Arriba := gvDirImagenes + gcBtn;
   // quita la espera Caratula.Imagenes.Cancelar_Abajo := gvDirImagenes + gcBtnBlanco;
   // quita la espera Caratula.MostrarMarco := True;
   // quita la espera Caratula.Avi_Predet   := Ninguno;
   // quita la espera Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   // quita la espera Caratula.Mostrar;

   gvProcesoAbortado := False;

   HInfBalTitulos.Open;       MInfBalTitulos.Open;
   HInfBalGrupos.Open;        MInfBalGrupos.Open;
   HInfBalCuentas.Open;       MInfBalCuentas.Open;

   HInfBalTitulos.EmptyTable; MInfBalTitulos.EmptyTable;
   HInfBalGrupos.EmptyTable;  MInfBalGrupos.EmptyTable;
   HInfBalCuentas.EmptyTable; MInfBalCuentas.EmptyTable;

   { Establece índices }
   //HInfBalTitulos.IndexName := '';
   //HInfBalGrupos.IndexName  := '';
   //HInfBalCuentas.IndexName := '';

   { Inicialización de variables }
   for j := 0 to 8 do begin
      aFormula[j] := '';
      aSaldo  [j] := 0;
   end;

   MesInicio := Month(prmFechaInicial);
   MesFinal  := Month(prmFechaFinal  );

   { Consolida empresas }
   QConsolida := DMRef.CreateQueryConsolida(['']);
   
   { Selección de títulos }
   QTitulos := DMRef.CreateQuery(['SELECT * FROM TITULOS ORDER BY TITULO']);
   QTitulos.PrepareStatement;
   QTitulos.Open;

   { Selección de grupos }
   QGrupos := DMRef.CreateQuery(['SELECT * FROM GRUPOS ORDER BY GRUPO']);
   QGrupos.PrepareStatement;
   QGrupos.Open;

   { Selección de cuentas }
   QCuentas := DMRef.CreateQuery(['SELECT * FROM CUENTAS ORDER BY CUENTA']);
   QCuentas.PrepareStatement;
   QCuentas.Open;

   if prmEmpresaAnterior <> 0 then begin
      { Inicializacion de Fechas para la consulta }
      DecodeDate(prmFechaInicial, nEjercicio, nMes, nDia);
      FechaInicialAnterior := EncodeDate(nEjercicio - 1, nMes, nDia);
      DecodeDate(prmFechaFinal, nEjercicio, nMes, nDia);
      FechaFinalAnterior := EncodeDate(nEjercicio - 1, nMes, nDia);

      { Conexion de empresa año anterior }
      DMRef.ConectarBDEmpresaAnterior(prmEmpresaAnterior);

      { Consulta de los importes }
      QSaldoAnteriorCuenta := DMRef.CreateQueryEjAnterior(
          ['SELECT D.IMPORTE         ,                       ',
           '       D.CUENTA_ANALITICA,                       ',
           '       D.DEBEHABER                               ',
           'FROM DIARIO    D,                                ',
           '     CONCEPTOS T                                 ',
           'WHERE D.FECHA                  >= :FECHAINICIAL  ',
           'AND   D.FECHA                  <= :FECHAFINAL    ',
           'AND   D.ID_CONCEPTOS            = T.ID_CONCEPTOS ', {no deben aparecer los apuntes con conceptos de cierre Y sólo }
           'AND   T.TIPOCONCEPTO           <> "C"            ', {los conceptos de tipo de contabilidad/clase normales         }
           'AND   T.TIPOCONTABILIDAD        = "N"            ',
           'AND   SUBSTR(D.SUBCUENTA, 1, 3) = :CUENTA        ']);
   end;

   try
      { Carga de CUENTAS }
      while not QCuentas.EOF do begin
         Grupo1 := QCuentas.FieldByName('GRUPO1').AsString;
         Grupo2 := QCuentas.FieldByName('GRUPO2').AsString;
         Letra1 := Copy(Grupo1, 1, 1);
         Letra2 := Copy(Grupo2, 1, 1);

         if (prmTipoInforme = INF_BALANCE_SITUACION) and ((Empty(Grupo1) and Empty(Grupo2)) or
            (Empty(Grupo1) and ((Letra2 = 'D') or (Letra2 = 'H'))) or
            (Empty(Grupo2) and ((Letra1 = 'D') or (Letra1 = 'H'))) or
            (((Letra1 = 'D') or (Letra1 = 'H')) and ((Letra2 = 'D') or (Letra2 = 'H')))) then
         begin
            QCuentas.Next;
            Continue;
         end;

         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) and
            ((Empty(Grupo1) and Empty(Grupo2)) or (Empty(Grupo1) and
            ((Letra2 = 'A') or (Letra2 = 'P'))) or (Empty(Grupo2) and ((Letra1 = 'A') or (Letra1 = 'P'))) or
            (((Letra1 = 'A') or (Letra1 = 'P')) and ((Letra2 = 'A') or (Letra2 = 'P')))) then
         begin
            QCuentas.Next;
            Continue;
         end;

         { Calcula saldo ejercicio anterior }
         nImporteAnt := 0;
         if prmSaldosEjercicioAnterior then begin
            aMeses[1]  := QCuentas.FieldByName('ANTDB01').AsFloat - QCuentas.FieldByName('ANTHB01').AsFloat;
            aMeses[2]  := QCuentas.FieldByName('ANTDB02').AsFloat - QCuentas.FieldByName('ANTHB02').AsFloat;
            aMeses[3]  := QCuentas.FieldByName('ANTDB03').AsFloat - QCuentas.FieldByName('ANTHB03').AsFloat;
            aMeses[4]  := QCuentas.FieldByName('ANTDB04').AsFloat - QCuentas.FieldByName('ANTHB04').AsFloat;
            aMeses[5]  := QCuentas.FieldByName('ANTDB05').AsFloat - QCuentas.FieldByName('ANTHB05').AsFloat;
            aMeses[6]  := QCuentas.FieldByName('ANTDB06').AsFloat - QCuentas.FieldByName('ANTHB06').AsFloat;
            aMeses[7]  := QCuentas.FieldByName('ANTDB07').AsFloat - QCuentas.FieldByName('ANTHB07').AsFloat;
            aMeses[8]  := QCuentas.FieldByName('ANTDB08').AsFloat - QCuentas.FieldByName('ANTHB08').AsFloat;
            aMeses[9]  := QCuentas.FieldByName('ANTDB09').AsFloat - QCuentas.FieldByName('ANTHB09').AsFloat;
            aMeses[10] := QCuentas.FieldByName('ANTDB10').AsFloat - QCuentas.FieldByName('ANTHB10').AsFloat;
            aMeses[11] := QCuentas.FieldByName('ANTDB11').AsFloat - QCuentas.FieldByName('ANTHB11').AsFloat;
            aMeses[12] := QCuentas.FieldByName('ANTDB12').AsFloat - QCuentas.FieldByName('ANTHB12').AsFloat;

            for j := MesInicio to MesFinal do begin
               nImporteAnt := nImporteAnt + aMeses[j];
            end;
            nImporteAnt := ConversionImporte(nImporteAnt,
                                             DMRef.QParametros.FieldByName('MONEDA').AsString,
                                             prmMonedaImpresion);

            { Empresas consolidadas }
            for IndCons := 0 to prmEmpresas.Count - 1 do begin
               DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);
               QConsolida.Close;
               //TODO: QConsolida.Database    := DMRef.IBDConsolida;
               //TODO: QConsolida.Transaction := DmRef.IBDConsolida.DefaultTransaction;
               QConsolida.SQL.Clear;
               QConsolida.SQL.Add('SELECT * FROM CUENTAS WHERE CUENTA = :prmCUENTA');
               QConsolida.ParamByName('CUENTA').AsString := QCuentas.FieldByName('prmCUENTA').AsString;
               if not QConsolida.EOF then begin
                  nImporteCons := 0;
                  aMeses[1]    := QConsolida.FieldByName('ANTDB01').AsFloat - QConsolida.FieldByName('ANTHB01').AsFloat;
                  aMeses[2]    := QConsolida.FieldByName('ANTDB02').AsFloat - QConsolida.FieldByName('ANTHB02').AsFloat;
                  aMeses[3]    := QConsolida.FieldByName('ANTDB03').AsFloat - QConsolida.FieldByName('ANTHB03').AsFloat;
                  aMeses[4]    := QConsolida.FieldByName('ANTDB04').AsFloat - QConsolida.FieldByName('ANTHB04').AsFloat;
                  aMeses[5]    := QConsolida.FieldByName('ANTDB05').AsFloat - QConsolida.FieldByName('ANTHB05').AsFloat;
                  aMeses[6]    := QConsolida.FieldByName('ANTDB06').AsFloat - QConsolida.FieldByName('ANTHB06').AsFloat;
                  aMeses[7]    := QConsolida.FieldByName('ANTDB07').AsFloat - QConsolida.FieldByName('ANTHB07').AsFloat;
                  aMeses[8]    := QConsolida.FieldByName('ANTDB08').AsFloat - QConsolida.FieldByName('ANTHB08').AsFloat;
                  aMeses[9]    := QConsolida.FieldByName('ANTDB09').AsFloat - QConsolida.FieldByName('ANTHB09').AsFloat;
                  aMeses[10]   := QConsolida.FieldByName('ANTDB10').AsFloat - QConsolida.FieldByName('ANTHB10').AsFloat;
                  aMeses[11]   := QConsolida.FieldByName('ANTDB11').AsFloat - QConsolida.FieldByName('ANTHB11').AsFloat;
                  aMeses[12]   := QConsolida.FieldByName('ANTDB12').AsFloat - QConsolida.FieldByName('ANTHB12').AsFloat;
                  for j := MesInicio to MesFinal do begin
                     nImporteCons := nImporteCons + aMeses[j];
                  end;
                  nImporteCons := ConversionImporte(nImporteCons,
                                                    DMRef.QParametros.FieldByName('MONEDA').AsString,
                                                    prmMonedaImpresion);
                  nImporteAnt  := nImporteAnt + nImporteCons;
               end;
            end;
         end else
         if prmEmpresaAnterior <> 0 then begin
            { No se puede consolidar de esta forma con años anteriores }
            QSaldoAnteriorCuenta.Close;
            QSaldoAnteriorCuenta.ParamByName('FechaInicial').AsDateTime := FechaInicialAnterior;
            QSaldoAnteriorCuenta.ParamByName('FechaFinal'  ).AsDateTime := FechaFinalAnterior;
            QSaldoAnteriorCuenta.ParamByName('Cuenta'      ).AsString   := QCuentas.FieldByName('Cuenta').AsString;
            QSaldoAnteriorCuenta.Open;
            nTotDbEjAnt := 0;
            nTotHbEjAnt := 0;
            while not QSaldoAnteriorCuenta.EOF do begin
               if not PerteneceAnalitica(QSaldoAnteriorCuenta.FieldByName('CUENTA_ANALITICA').AsString,
                                         prmCuentaAnalitica,
                                         '',
                                         prmDelegacion,
                                         prmDepartamento,
                                         prmSeccion,
                                         prmProyecto,
                                         wcEjAnterior) then begin
                  QSaldoAnteriorCuenta.Next;
                  Continue;
               end;
               if QSaldoAnteriorCuenta.FieldByName('DebeHaber').AsString = 'D' then begin
                  nTotDbEjAnt := nTotDbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
               end
               else begin
                  nTotHbEjAnt := nTotHbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
               end;
               QSaldoAnteriorCuenta.Next;
            end;
            nImporteAnt := nTotDbEjAnt - nTotHbEjAnt;
            nImporteAnt := ConversionImporte(nImporteAnt,
                                             DMRef.QParametros.FieldByName('MONEDA').AsString,
                                             prmMonedaImpresion);
         end;

         if not Empty(Grupo1) then begin
            HInfBalCuentas.Append;
            HInfBalCuentas.Edit;

            { Título, Grupo y descripción de cuenta }
            HInfBalCuentasCUENTA.AsString            := QCuentas.FieldByName('CUENTA').AsString;
            HInfBalCuentasDESCRIPCIONCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            HInfBalCuentasGRUPO.AsString             := Grupo1;
            HInfBalCuentasTITULO.AsString            := Copy(Grupo1, 1, 2);

            { Saldo del ejercicio anterior }
            HInfBalCuentasSALDOANTERIORCUENTA.AsFloat := nImporteAnt;

            HInfBalCuentas.Post;

            {=============================}

            MInfBalCuentas.Append;
            MInfBalCuentas.Edit;

            { Título, Grupo y descripción de cuenta }
            MInfBalCuentasCUENTA.AsString    := QCuentas.FieldByName('CUENTA').AsString;
            MInfBalCuentasDS_CUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            MInfBalCuentasGRUPO.AsString     := Grupo1;
            MInfBalCuentasTITULO.AsString    := Copy(Grupo1, 1, 2);

            { Saldo del ejercicio anterior }
            MInfBalCuentasSALDO_ANTERIOR_CUENTA.AsFloat := nImporteAnt;

            MInfBalCuentas.Post;
         end;

         if not Empty(Grupo2) then begin
            HInfBalCuentas.Append;
            HInfBalCuentas.Edit;

            { Título, Grupo y descripción de cuenta }
            HInfBalCuentasCUENTA.AsString             := QCuentas.FieldByName('CUENTA').AsString;
            HInfBalCuentasDESCRIPCIONCUENTA.AsString  := QCuentas.FieldByName('DESCRIPCION').AsString;
            HInfBalCuentasGRUPO.AsString              := Grupo2;
            HInfBalCuentasTITULO.AsString             := Copy(Grupo2, 1, 2);
            { Saldo del ejercicio anterior }
            HInfBalCuentasSALDOANTERIORCUENTA.AsFloat := nImporteAnt;
            HInfBalCuentas.Post;

            {=============================}

            MInfBalCuentas.Append;
            MInfBalCuentas.Edit;

            { Título, Grupo y descripción de cuenta }
            MInfBalCuentasCUENTA.AsString    := QCuentas.FieldByName('CUENTA').AsString;
            MInfBalCuentasDS_CUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
            MInfBalCuentasGRUPO.AsString     := Grupo2;
            MInfBalCuentasTITULO.AsString    := Copy(Grupo2, 1, 2);
            { Saldo del ejercicio anterior }
            MInfBalCuentasSALDO_ANTERIOR_CUENTA.AsFloat := nImporteAnt;
            MInfBalCuentas.Post;
         end;
         QCuentas.Next;
      end;

      { Carga de TITULOS }
      while not QTitulos.EOF do begin
         Titulo := QTitulos.FieldByName('TITULO').AsString;
         Letra  := Copy(Titulo, 1, 1);

         if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
            if ((Letra = 'D') or (Letra = 'H')) then begin
               QTitulos.Next;
               Continue;
            end
            else begin
               if (Letra = 'A') then begin
                  TipoPagina := 'ACTIVO';
               end else
               if (Letra = 'P') then begin
                  TipoPagina := 'PASIVO';
               end;
            end;
         end;

         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) then begin
            if ((Letra = 'A') or (Letra = 'P')) then begin
               QTitulos.Next;
               Continue;
            end
            else begin
               if (Letra = 'D') then begin
                  TipoPagina := 'DEBE';
               end else
               if (Letra = 'H') then begin
                  TipoPagina := 'HABER';
               end;
            end;
         end;

         HInfBalTitulos.Append;
         HInfBalTitulosTIPOPAGINA.AsString        := TipoPagina;
         HInfBalTitulosTITULO.AsString            := QTitulos.FieldByName('TITULO').AsString;
         HInfBalTitulosTITULOREVES.AsString       := Copy(QTitulos.FieldByName('TITULO').AsString, 2, 1) + Letra;
         HInfBalTitulosDESCRIPCIONTITULO.AsString := QTitulos.FieldByName('DESCRIPCION').AsString;
         HInfBalTitulosSUMA1.AsString             := QTitulos.FieldByName('SUMA1' ).AsString;
         HInfBalTitulosSUMA2.AsString             := QTitulos.FieldByName('SUMA2' ).AsString;
         HInfBalTitulosSUMA3.AsString             := QTitulos.FieldByName('SUMA3' ).AsString;
         HInfBalTitulosSUMA4.AsString             := QTitulos.FieldByName('SUMA4' ).AsString;
         HInfBalTitulosSUMA5.AsString             := QTitulos.FieldByName('SUMA5' ).AsString;
         HInfBalTitulosSUMA6.AsString             := QTitulos.FieldByName('SUMA6' ).AsString;
         HInfBalTitulosSUMA7.AsString             := QTitulos.FieldByName('SUMA7' ).AsString;
         HInfBalTitulosSUMA8.AsString             := QTitulos.FieldByName('SUMA8' ).AsString;
         HInfBalTitulosRESTA1.AsString            := QTitulos.FieldByName('RESTA1').AsString;
         HInfBalTitulosRESTA2.AsString            := QTitulos.FieldByName('RESTA2').AsString;
         HInfBalTitulosRESTA3.AsString            := QTitulos.FieldByName('RESTA3').AsString;
         HInfBalTitulosRESTA4.AsString            := QTitulos.FieldByName('RESTA4').AsString;
         HInfBalTitulosRESTA5.AsString            := QTitulos.FieldByName('RESTA5').AsString;
         HInfBalTitulosRESTA6.AsString            := QTitulos.FieldByName('RESTA6').AsString;
         HInfBalTitulosRESTA7.AsString            := QTitulos.FieldByName('RESTA7').AsString;
         HInfBalTitulosRESTA8.AsString            := QTitulos.FieldByName('RESTA8').AsString;

         TextoFormula := '';
         if not Empty(QTitulos.FieldByName('SUMA1' ).AsString) then TextoFormula := QTitulos.FieldByName('SUMA1').AsString;
         if not Empty(QTitulos.FieldByName('SUMA2' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA2' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA3' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA3' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA4' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA4' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA5' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA5' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA6' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA6' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA7' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA7' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA8' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA8' ).AsString;
         if not Empty(QTitulos.FieldByName('RESTA1').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA1').AsString;
         if not Empty(QTitulos.FieldByName('RESTA2').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA2').AsString;
         if not Empty(QTitulos.FieldByName('RESTA3').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA3').AsString;
         if not Empty(QTitulos.FieldByName('RESTA4').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA4').AsString;
         if not Empty(QTitulos.FieldByName('RESTA5').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA5').AsString;
         if not Empty(QTitulos.FieldByName('RESTA6').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA6').AsString;
         if not Empty(QTitulos.FieldByName('RESTA7').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA7').AsString;
         if not Empty(QTitulos.FieldByName('RESTA8').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA8').AsString;

         HInfBalTitulosFORMULA.AsString := TextoFormula;
         HInfBalTitulos.Post;

         {==============================================}

         MInfBalTitulos.Append;
         MInfBalTitulosTIPO_PAGINA.AsString  := TipoPagina;
         MInfBalTitulosTITULO.AsString       := QTitulos.FieldByName('TITULO').AsString;
         MInfBalTitulosTITULO_REVES.AsString := Copy(QTitulos.FieldByName('TITULO').AsString, 2, 1) + Letra;
         MInfBalTitulosDS_TITULO.AsString    := QTitulos.FieldByName('DESCRIPCION').AsString;
         MInfBalTitulosSUMA1.AsString        := QTitulos.FieldByName('SUMA1' ).AsString;
         MInfBalTitulosSUMA2.AsString        := QTitulos.FieldByName('SUMA2' ).AsString;
         MInfBalTitulosSUMA3.AsString        := QTitulos.FieldByName('SUMA3' ).AsString;
         MInfBalTitulosSUMA4.AsString        := QTitulos.FieldByName('SUMA4' ).AsString;
         MInfBalTitulosSUMA5.AsString        := QTitulos.FieldByName('SUMA5' ).AsString;
         MInfBalTitulosSUMA6.AsString        := QTitulos.FieldByName('SUMA6' ).AsString;
         MInfBalTitulosSUMA7.AsString        := QTitulos.FieldByName('SUMA7' ).AsString;
         MInfBalTitulosSUMA8.AsString        := QTitulos.FieldByName('SUMA8' ).AsString;
         MInfBalTitulosRESTA1.AsString       := QTitulos.FieldByName('RESTA1').AsString;
         MInfBalTitulosRESTA2.AsString       := QTitulos.FieldByName('RESTA2').AsString;
         MInfBalTitulosRESTA3.AsString       := QTitulos.FieldByName('RESTA3').AsString;
         MInfBalTitulosRESTA4.AsString       := QTitulos.FieldByName('RESTA4').AsString;
         MInfBalTitulosRESTA5.AsString       := QTitulos.FieldByName('RESTA5').AsString;
         MInfBalTitulosRESTA6.AsString       := QTitulos.FieldByName('RESTA6').AsString;
         MInfBalTitulosRESTA7.AsString       := QTitulos.FieldByName('RESTA7').AsString;
         MInfBalTitulosRESTA8.AsString       := QTitulos.FieldByName('RESTA8').AsString;

         TextoFormula := '';
         if not Empty(QTitulos.FieldByName('SUMA1' ).AsString) then TextoFormula := QTitulos.FieldByName('SUMA1').AsString;
         if not Empty(QTitulos.FieldByName('SUMA2' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA2' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA3' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA3' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA4' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA4' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA5' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA5' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA6' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA6' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA7' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA7' ).AsString;
         if not Empty(QTitulos.FieldByName('SUMA8' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA8' ).AsString;
         if not Empty(QTitulos.FieldByName('RESTA1').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA1').AsString;
         if not Empty(QTitulos.FieldByName('RESTA2').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA2').AsString;
         if not Empty(QTitulos.FieldByName('RESTA3').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA3').AsString;
         if not Empty(QTitulos.FieldByName('RESTA4').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA4').AsString;
         if not Empty(QTitulos.FieldByName('RESTA5').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA5').AsString;
         if not Empty(QTitulos.FieldByName('RESTA6').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA6').AsString;
         if not Empty(QTitulos.FieldByName('RESTA7').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA7').AsString;
         if not Empty(QTitulos.FieldByName('RESTA8').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA8').AsString;

         MInfBalTitulosFORMULA.AsString := TextoFormula;
         MInfBalTitulos.Post;

         QTitulos.Next;
      end;

      { Carga GRUPOS }
      while not QGrupos.EOF do begin
         Grupo := QGrupos.FieldByName('GRUPO').AsString;
         Letra := Copy(Grupo, 1, 1);

         if (prmTipoInforme = INF_BALANCE_SITUACION) and ((Letra = 'D') or (Letra = 'H')) then begin
            QGrupos.Next;
            Continue;
         end;

         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) and ((Letra = 'A') or (Letra = 'P')) then begin
            QGrupos.Next;
            Continue;
         end;

         HInfBalGrupos.Append;
         HInfBalGrupos.Edit;
         HInfBalGruposGRUPO.AsString            :=      QGrupos.FieldByName('GRUPO'      ).AsString;
         HInfBalGruposDESCRIPCIONGRUPO.AsString :=      QGrupos.FieldByName('DESCRIPCION').AsString;
         HInfBalGruposTITULO.AsString           := Copy(QGrupos.FieldByName('GRUPO'      ).AsString, 1, 2);
         HInfBalGrupos.Post;

         {===========================}

         MInfBalGrupos.Append;
         MInfBalGrupos.Edit;
         MInfBalGruposGRUPO.AsString    :=      QGrupos.FieldByName('GRUPO'      ).AsString;
         MInfBalGruposDS_GRUPO.AsString :=      QGrupos.FieldByName('DESCRIPCION').AsString;
         MInfBalGruposTITULO.AsString   := Copy(QGrupos.FieldByName('GRUPO'      ).AsString, 1, 2);
         MInfBalGrupos.Post;

         QGrupos.Next;
      end;

   { Carga de saldos anteriores por acumulados de cuentas
      ya cargados antes, por meses o por seleccion de empresa año anterior }
      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
         HInfBalCuentas.IndexName := 'Titulo';
         HInfBalCuentas.First;
         while not HInfBalCuentas.EOF do begin
            { Carga GRUPOS }
            if HInfBalGrupos.Locate('GRUPO', HInfBalCuentasGRUPO.AsString, []) then begin
               HInfBalGrupos.Edit;
               HInfBalGruposSALDOANTERIORGRUPO.AsFloat := HInfBalGruposSALDOANTERIORGRUPO.AsFloat +
                                                                         HInfBalCuentasSALDOANTERIORCUENTA.AsFloat;
               HInfBalGrupos.Post;
            end;
            { Carga TITULOS }
            if HInfBalTitulos.Locate('TITULO', Copy(HInfBalCuentasGRUPO.AsString, 1, 2), []) then begin
               HInfBalTitulos.Edit;
               HInfBalTitulosSALDOANTERIORTITULO.AsFloat := HInfBalTitulosSALDOANTERIORTITULO.AsFloat +
                                                                           HInfBalCuentasSALDOANTERIORCUENTA.AsFloat;
               HInfBalTitulos.Post;
            end;
            HInfBalCuentas.Next;
         end;
         HInfBalCuentas.IndexName := '';

         {===========================}

         MInfBalCuentas.SortOnFields('TITULO');
         MInfBalCuentas.First;
         while not MInfBalCuentas.EOF do begin
            { Carga GRUPOS }
            if MInfBalGrupos.Locate('GRUPO', MInfBalCuentasGRUPO.AsString, []) then begin
               MInfBalGrupos.Edit;
               MInfBalGruposSALDO_ANTERIOR_GRUPO.AsFloat := MInfBalGruposSALDO_ANTERIOR_GRUPO.AsFloat + MInfBalCuentasSALDO_ANTERIOR_CUENTA.AsFloat;
               MInfBalGrupos.Post;
            end;
            { Carga TITULOS }
            if MInfBalTitulos.Locate('TITULO', Copy(MInfBalCuentasGRUPO.AsString, 1, 2), []) then begin
               MInfBalTitulos.Edit;
               MInfBalTitulosSALDO_ANTERIOR_TITULO.AsFloat := MInfBalTitulosSALDO_ANTERIOR_TITULO.AsFloat + MInfBalCuentasSALDO_ANTERIOR_CUENTA.AsFloat;
               MInfBalTitulos.Post;
            end;
            MInfBalCuentas.Next;
         end;
         //MInfBalCuentas.IndexName := '';
      end;

      { Carga de saldos actuales según fecha }
      nTotDb := 0;
      nTotHb := 0;

      { Selecciona los apuntes de la empresa actual }
      QDiario := TSQLQuery.Create(nil);
      QDiario.Close;
      QDiario.SQL.Clear;
      //TODO: QDiario.SQLConnection := DMRef.IBDSiamCont;
      //TODO: QDiario.Transaction := DMRef.IBDSiamCont.DefaultTransaction;
      QDiario.SQL.Add('SELECT D.IMPORTE, D.MONEDA, D.CUENTA_ANALITICA,');
      if prmTipoConcepto <> 'T' then begin
         QDiario.SQL.Add('T.TIPOCONTABILIDAD,');
      end;
      QDiario.SQL.Add(' D.DEBEHABER, c.CUENTA ');
      QDiario.SQL.Add('FROM DIARIO D, CUENTAS C,CONCEPTOS T');
      QDiario.SQL.Add('WHERE D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL');
      {{ En la query no deben aparecer los apuntes con conceptos de cierre}
      QDiario.SQL.Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"C" ');
      QDiario.SQL.Add(' AND SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');

      if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
         // QDiario.SQL.Add(' AND (SUBSTR(C.GRUPO1,1,1)="A" OR SUBSTR(C.GRUPO2,1,1)="A" OR ');
         // QDiario.SQL.Add(' SUBSTR(C.GRUPO1,1,1)="P" OR SUBSTR(C.GRUPO2,1,1)="P") ');
      end
      else begin
         QDiario.SQL.Add(' AND (SUBSTR(C.GRUPO1, 1, 1) = "D" OR SUBSTR(C.GRUPO2, 1, 1) = "D" OR ');
         QDiario.SQL.Add(' SUBSTR(C.GRUPO1, 1, 1) = "H" OR SUBSTR(C.GRUPO2, 1, 1) = "H") ');
      end;
      //QDiario.SQL.Add('GROUP BY C.CUENTA, D.DEBEHABER, D.CUENTA_ANALITICA, D.MONEDA');
      QDiario.SQL.Add('ORDER BY D.FECHA');

      if prmTipoConcepto <> 'T' then begin
         QDiario.SQL.Add(', T.TIPOCONTABILIDAD');
      end;

      QDiario.ParamByName('FECHAINICIAL').AsDateTime := prmFechaInicial;
      QDiario.ParamByName('FECHAFINAL'  ).AsDateTime := prmFechaFinal;

      QDiario.PrepareStatement;
      QDiario.Open;

      HInfBalCuentas.IndexName := '';
      HInfBalGrupos.IndexName  := '';
      HInfBalTitulos.IndexName := '';

      while not QDiario.EOF do begin
         if (prmTipoConcepto <> 'T') and (QDiario.FieldByName('TipoContabilidad').AsString <> prmTipoConcepto) then begin
            QDiario.Next;
            Continue;
         end;
         if not PerteneceAnalitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
                                   prmCuentaAnalitica,
                                   '',
                                   prmDelegacion,
                                   prmDepartamento,
                                   prmSeccion,
                                   prmProyecto,
                                   wcSiamCont) then begin
            QDiario.Next;
            Continue;
         end;

         Cuenta    := QDiario.FieldByName('CUENTA').AsString;
         DebeHaber := QDiario.FieldByName('DEBEHABER').AsString;
         nImporte  := ConversionImporte(QDiario.FieldByName('IMPORTE').AsFloat,
                                        QDiario.FieldByName('MONEDA').AsString,
                                        prmMonedaImpresion);

         IncluirEnInforme := True;
         if (Cuenta >= '6') and (Cuenta < '8') then begin
            if DebeHaber = 'D' then begin
               nTotDb := nTotDb + nImporte;
            end
            else begin
               nTotHb := nTotHb + nImporte;
            end;
            IncluirEnInforme := prmTipoInforme <> INF_BALANCE_SITUACION;
         end;

         if IncluirEnInforme then begin
            { Incluye CUENTAS }
            if HInfBalCuentas.Locate('CUENTA', QDiario.FieldByName('CUENTA').AsString, []) then begin
               HInfBalCuentas.Edit;
               if DebeHaber = 'D' then begin
                  HInfBalCuentasSALDOACTUALCUENTA.AsFloat :=
                     HInfBalCuentasSALDOACTUALCUENTA.AsFloat + nImporte;
               end
               else begin
                  HInfBalCuentasSALDOACTUALCUENTA.AsFloat :=
                     HInfBalCuentasSALDOACTUALCUENTA.AsFloat - nImporte;
               end;
               HInfBalCuentas.Post;
            end;

{$Message Warn '            Aquí es dónde debo seguir.'} 
            {==============================================}

            { Incluye GRUPOS }
            if HInfBalGrupos.Locate('GRUPO', HInfBalCuentasGRUPO.AsString, []) then begin
               HInfBalGrupos.Edit;
               if DebeHaber = 'D' then begin
                  HInfBalGruposSALDOACTUALGRUPO.AsFloat := HInfBalGruposSALDOACTUALGRUPO.AsFloat + nImporte;
               end
               else begin
                  HInfBalGruposSALDOACTUALGRUPO.AsFloat := HInfBalGruposSALDOACTUALGRUPO.AsFloat - nImporte;
               end;
               HInfBalGrupos.Post;
            end;

            { Incluye TITULOS }
            if HInfBalTitulos.Locate('TITULO', Copy(HInfBalGruposGRUPO.AsString, 1, 2), []) then begin
               HInfBalTitulos.Edit;
               if DebeHaber = 'D' then begin
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat + nImporte;
               end
               else begin
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat - nImporte;
               end;
               HInfBalTitulos.Post;
            end;
         end;
         QDiario.Next;
      end;


      ListaQuery := TStringList.Create;
                                     ListaQuery.Add('SELECT D.IMPORTE         ,                  ');
                                     ListaQuery.Add('       D.MONEDA          ,                  ');
                                     ListaQuery.Add('       D.CUENTA_ANALITICA,                  ');
      if prmTipoConcepto <> 'T' then ListaQuery.Add('       T.TIPOCONTABILIDAD,                  ');
                                     ListaQuery.Add('       D.DEBEHABER       ,                  ');
                                     ListaQuery.Add('       C.CUENTA                             ');
                                     ListaQuery.Add('FROM   DIARIO    D,                         ');
                                     ListaQuery.Add('       CUENTAS   C,                         ');
                                     ListaQuery.Add('       CONCEPTOS T                          ');
                                     ListaQuery.Add('WHERE  D.FECHA >= :FECHAINICIAL             ');
                                     ListaQuery.Add('AND    D.FECHA <= :FECHAFINAL               ');
                                     ListaQuery.Add('AND    D.ID_CONCEPTOS = T.ID_CONCEPTOS      '); { No deben aparecer los apuntes }
                                     ListaQuery.Add('AND    T.TIPOCONCEPTO <> "C"                '); {      con conceptos de cierre  }
                                     ListaQuery.Add('AND    SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');
      if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
         // Add(' AND (SUBSTR(C.GRUPO1,1,1)="A" OR SUBSTR(C.GRUPO2,1,1)="A" OR ');
         // Add(' SUBSTR(C.GRUPO1,1,1)="P" OR SUBSTR(C.GRUPO2,1,1)="P") ');
      end
      else begin
         ListaQuery.Add('AND (   SUBSTR(C.GRUPO1, 1, 1) = "D" ');
         ListaQuery.Add('     OR SUBSTR(C.GRUPO2, 1, 1) = "D" ');
         ListaQuery.Add('     OR SUBSTR(C.GRUPO1, 1, 1) = "H" ');
         ListaQuery.Add('     OR SUBSTR(C.GRUPO2, 1, 1) = "H" ');
         ListaQuery.Add('    )                                ');
      end;
      ListaQuery.Add('ORDER BY D.FECHA ');

      if prmTipoConcepto <> 'T' then begin
         ListaQuery.Add(', T.TIPOCONTABILIDAD');
      end;
      QDiarioConsolida := DMRef.CreateQueryConsolida([ListaQuery.Text]);

      { Empresas consolidadas }
      for IndCons := 0 to prmEmpresas.Count - 1 do begin
         DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);


         QDiarioConsolida.ParamByName('FECHAINICIAL').AsDateTime := prmFechaInicial;
         QDiarioConsolida.ParamByName('FECHAFINAL'  ).AsDateTime := prmFechaFinal;

         QDiarioConsolida.PrepareStatement;
         QDiarioConsolida.Open;

         HInfBalCuentas.IndexName := '';
         HInfBalGrupos.IndexName  := '';
         HInfBalTitulos.IndexName := '';

         while not QDiarioConsolida.EOF do begin
            if (prmTipoConcepto <> 'T') and (QDiarioConsolida.FieldByName('TIPOCONTABILIDAD').AsString <> prmTipoConcepto) then begin
               QDiarioConsolida.Next;
               Continue;
            end;
            if not PerteneceAnalitica(QDiarioConsolida.FieldByName('CUENTA_ANALITICA').AsString,
                                      prmCuentaAnalitica,
                                      '',
                                      prmDelegacion,
                                      prmDepartamento,
                                      prmSeccion,
                                      prmProyecto,
                                      wcConsolida) then begin
               QDiarioConsolida.Next;
               Continue;
            end;

            Cuenta    := QDiarioConsolida.FieldByName('CUENTA').AsString;
            DebeHaber := QDiarioConsolida.FieldByName('DEBEHABER').AsString;
            nImporte  := ConversionImporte(QDiarioConsolida.FieldByName('IMPORTE').AsFloat,
                                           QDiarioConsolida.FieldByName('MONEDA' ).AsString,
                                           prmMonedaImpresion);

            IncluirEnInforme := True;
            if (Cuenta >= '6') and (Cuenta < '8') then begin
               if DebeHaber = 'D' then nTotDb := nTotDb + nImporte
                                  else nTotHb := nTotHb + nImporte;
               IncluirEnInforme := prmTipoInforme <> INF_BALANCE_SITUACION;
            end;

            if IncluirEnInforme then begin
               { Carga CUENTAS }
               if HInfBalCuentas.Locate('CUENTA', QDiarioConsolida.FieldByName('CUENTA').AsString, []) then begin
                  HInfBalCuentas.Edit;
                  if DebeHaber = 'D' then begin
                     HInfBalCuentasSALDOACTUALCUENTA.AsFloat := HInfBalCuentasSALDOACTUALCUENTA.AsFloat + nImporte;
                  end
                  else begin
                     HInfBalCuentasSALDOACTUALCUENTA.AsFloat := HInfBalCuentasSALDOACTUALCUENTA.AsFloat - nImporte;
                  end;
                  HInfBalCuentas.Post;
               end;

               { Carga GRUPOS }
               if HInfBalGrupos.Locate('GRUPO', HInfBalCuentasGRUPO.AsString, []) then begin
                  HInfBalGrupos.Edit;
                  if DebeHaber = 'D' then begin
                     HInfBalGruposSALDOACTUALGRUPO.AsFloat := HInfBalGruposSALDOACTUALGRUPO.AsFloat + nImporte;
                  end
                  else begin
                     HInfBalGruposSALDOACTUALGRUPO.AsFloat := HInfBalGruposSALDOACTUALGRUPO.AsFloat - nImporte;
                  end;
                  HInfBalGrupos.Post;
               end;

               { Carga TITULOS }
               if HInfBalTitulos.Locate('TITULO', Copy(HInfBalGruposGRUPO.AsString, 1, 2), []) then begin 
                  HInfBalTitulos.Edit;
                  if DebeHaber = 'D' then begin
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                        HInfBalTitulosSALDOACTUALTITULO.AsFloat + nImporte;
                  end
                  else begin
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                        HInfBalTitulosSALDOACTUALTITULO.AsFloat - nImporte;
                  end;
                  HInfBalTitulos.Post;
               end;
            end;
            QDiarioConsolida.Next;
         end;
      end;

      

      { CÁLCULO DE PÉRDIDAS Y GANANCIAS PARA BALANCE DE SITUACIÓN }
      if prmTipoInforme = INF_BALANCE_SITUACION then begin
         nTot129 := nTotDb - nTotHb;
         if RoundToDecimal(nTot129, 3, True) <> 0 then begin
            if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
               { Suma todas las 6 y resta todas las 7 }
               QCuentas.Close;
               QCuentas.Open;
               while not QCuentas.EOF and (QCuentas.FieldByName('CUENTA').AsString <> '600') do begin
                  QCuentas.Next;
               end;
               nTotAnt129   := 0;
               nTotDbAnt129 := 0;
               nTotHbAnt129 := 0;

               { Saldo empresa actual }
               while not QCuentas.EOF do begin
                  nImporteAnt := 0;
                  if prmEmpresaAnterior <> 0 then begin
                     QSaldoAnteriorCuenta.Close;
                     QSaldoAnteriorCuenta.ParamByName('FechaInicial').AsDateTime := FechaInicialAnterior;
                     QSaldoAnteriorCuenta.ParamByName('FechaFinal'  ).AsDateTime := FechaFinalAnterior;
                     QSaldoAnteriorCuenta.ParamByName('Cuenta'      ).AsString   := QCuentas.FieldByName('CUENTA').AsString;
                     QSaldoAnteriorCuenta.Open;
                     nTotDbEjAnt := 0;
                     nTotHbEjAnt := 0;
                     while not QSaldoAnteriorCuenta.EOF do begin
                        if not PerteneceAnalitica(QSaldoAnteriorCuenta.FieldByName('CUENTA_ANALITICA').AsString,
                                                  prmCuentaAnalitica,
                                                  '',
                                                  prmDelegacion,
                                                  prmDepartamento,
                                                  prmSeccion,
                                                  prmProyecto,
                                                  wcEjAnterior) then begin
                           QSaldoAnteriorCuenta.Next;
                           Continue;
                        end;
                        if QSaldoAnteriorCuenta.FieldByName('DebeHaber').AsString = 'D' then begin
                           nTotDbEjAnt := nTotDbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
                        end
                        else begin
                           nTotHbEjAnt := nTotHbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
                        end;
                        QSaldoAnteriorCuenta.Next;
                     end;
                     nImporteAnt := nTotDbEjAnt - nTotHbEjAnt;
                  end
                  else begin
                     { Calcular saldo ejercicio anterior }
                     aMeses[1]  := QCuentas.FieldByName('ANTDB01').AsFloat - QCuentas.FieldByName('ANTHB01').AsFloat;
                     aMeses[2]  := QCuentas.FieldByName('ANTDB02').AsFloat - QCuentas.FieldByName('ANTHB02').AsFloat;
                     aMeses[3]  := QCuentas.FieldByName('ANTDB03').AsFloat - QCuentas.FieldByName('ANTHB03').AsFloat;
                     aMeses[4]  := QCuentas.FieldByName('ANTDB04').AsFloat - QCuentas.FieldByName('ANTHB04').AsFloat;
                     aMeses[5]  := QCuentas.FieldByName('ANTDB05').AsFloat - QCuentas.FieldByName('ANTHB05').AsFloat;
                     aMeses[6]  := QCuentas.FieldByName('ANTDB06').AsFloat - QCuentas.FieldByName('ANTHB06').AsFloat;
                     aMeses[7]  := QCuentas.FieldByName('ANTDB07').AsFloat - QCuentas.FieldByName('ANTHB07').AsFloat;
                     aMeses[8]  := QCuentas.FieldByName('ANTDB08').AsFloat - QCuentas.FieldByName('ANTHB08').AsFloat;
                     aMeses[9]  := QCuentas.FieldByName('ANTDB09').AsFloat - QCuentas.FieldByName('ANTHB09').AsFloat;
                     aMeses[10] := QCuentas.FieldByName('ANTDB10').AsFloat - QCuentas.FieldByName('ANTHB10').AsFloat;
                     aMeses[11] := QCuentas.FieldByName('ANTDB11').AsFloat - QCuentas.FieldByName('ANTHB11').AsFloat;
                     aMeses[12] := QCuentas.FieldByName('ANTDB12').AsFloat - QCuentas.FieldByName('ANTHB12').AsFloat;
                     for j := MesInicio to MesFinal do begin
                        nImporteAnt := nImporteAnt + aMeses[j];
                     end;
                  end;

                  nImporteAnt := ConversionImporte(nImporteAnt,
                                                   DMRef.QParametros.FieldByName('MONEDA').AsString,
                                                   prmMonedaImpresion);
                  if (QCuentas.FieldByName('CUENTA').AsString < '700') and
                     (QCuentas.FieldByName('CUENTA').AsString > '599') then begin
                     nTotDbAnt129 := nTotDbAnt129 + nImporteAnt;
                  end;
                  if (QCuentas.FieldByName('CUENTA').AsString < '800') and
                     (QCuentas.FieldByName('CUENTA').AsString > '699') then begin
                     nTotHbAnt129 := nTotHbAnt129 + nImporteAnt;
                  end;

                  { Empresas consolidadas }
                  for IndCons := 0 to prmEmpresas.Count - 1 do begin
                     DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);
                     QConsolida.Close;
                     //TODO: QConsolida.SQLConnection := DmRef.IBDConsolida;
                     //TODO: QConsolida.Transaction := DmRef.IBDConsolida.DefaultTransaction;
                     QConsolida.SQL.Clear;
                     QConsolida.SQL.Add('SELECT * FROM CUENTAS WHERE CUENTA = :CUENTA');
                     QConsolida.ParamByName('CUENTA').AsString := QCuentas.FieldByName('CUENTA').AsString;
                     if not QConsolida.EOF then begin
                        { Calcular saldo ejercicio anterior }
                        aMeses[1]  := QConsolida.FieldByName('ANTDB01').AsFloat - QConsolida.FieldByName('ANTHB01').AsFloat;
                        aMeses[2]  := QConsolida.FieldByName('ANTDB02').AsFloat - QConsolida.FieldByName('ANTHB02').AsFloat;
                        aMeses[3]  := QConsolida.FieldByName('ANTDB03').AsFloat - QConsolida.FieldByName('ANTHB03').AsFloat;
                        aMeses[4]  := QConsolida.FieldByName('ANTDB04').AsFloat - QConsolida.FieldByName('ANTHB04').AsFloat;
                        aMeses[5]  := QConsolida.FieldByName('ANTDB05').AsFloat - QConsolida.FieldByName('ANTHB05').AsFloat;
                        aMeses[6]  := QConsolida.FieldByName('ANTDB06').AsFloat - QConsolida.FieldByName('ANTHB06').AsFloat;
                        aMeses[7]  := QConsolida.FieldByName('ANTDB07').AsFloat - QConsolida.FieldByName('ANTHB07').AsFloat;
                        aMeses[8]  := QConsolida.FieldByName('ANTDB08').AsFloat - QConsolida.FieldByName('ANTHB08').AsFloat;
                        aMeses[9]  := QConsolida.FieldByName('ANTDB09').AsFloat - QConsolida.FieldByName('ANTHB09').AsFloat;
                        aMeses[10] := QConsolida.FieldByName('ANTDB10').AsFloat - QConsolida.FieldByName('ANTHB10').AsFloat;
                        aMeses[11] := QConsolida.FieldByName('ANTDB11').AsFloat - QConsolida.FieldByName('ANTHB11').AsFloat;
                        aMeses[12] := QConsolida.FieldByName('ANTDB12').AsFloat - QConsolida.FieldByName('ANTHB12').AsFloat;

                        nImporteCons := 0;
                        for j := MesInicio to MesFinal do begin
                           nImporteCons := nImporteCons + aMeses[j];
                        end;

                        nImporteCons := ConversionImporte(nImporteCons,
                                                          DMRef.QParametros.FieldByName('MONEDA').AsString,
                                                          prmMonedaImpresion);
                        if (QCuentas.FieldByName('CUENTA').AsString < '700') and
                           (QCuentas.FieldByName('CUENTA').AsString > '599') then begin
                           nTotDbAnt129 := nTotDbAnt129 + nImporteCons;
                        end;
                        if (QCuentas.FieldByName('CUENTA').AsString < '800') and
                           (QCuentas.FieldByName('CUENTA').AsString > '699') then begin
                           nTotHbAnt129 := nTotHbAnt129 + nImporteCons;
                        end;
                     end;
                  end;
                  QCuentas.Next;
               end;  

               nTotAnt129 := nTotDbAnt129 + nTotHbAnt129;

               if HInfBalCuentas.Locate('CUENTA', '129', []) then begin
                  HInfBalCuentas.Edit;
               end
               else begin
                  HInfBalCuentas.Insert;
                  RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
                  HInfBalCuentasCUENTA.AsString := '129';
                  HInfBalCuentasGRUPO.AsString  := 'PA6';
                  HInfBalCuentasTITULO.AsString := 'PA';
                  // HInfBalCuentasTITULOREVES.AsString := 'AP'; 
               end;

               HInfBalCuentasSALDOANTERIORCUENTA.AsFloat := nTotAnt129;
               HInfBalCuentas.Post;
            end;      

            { Cargar CUENTAS }
            if HInfBalCuentas.Locate('CUENTA', '129', []) then begin { PPGG }
               HInfBalCuentas.Edit;
               if RoundToDecimal(nTot129, 3, True) > 0 then begin
                  HInfBalCuentasSALDOACTUALCUENTA.AsFloat := HInfBalCuentasSALDOACTUALCUENTA.AsFloat + nTot129;
               end
               else begin
                  HInfBalCuentasSALDOACTUALCUENTA.AsFloat := HInfBalCuentasSALDOACTUALCUENTA.AsFloat - (-1 * nTot129);
               end;
               HInfBalCuentas.Post;
            end;

            { Cargar GRUPOS }
            if HInfBalGrupos.Locate('GRUPO', HInfBalCuentasGRUPO.AsString, []) then begin
               HInfBalGrupos.Edit;
               if RoundToDecimal(nTot129, 3, True) > 0 then begin
                  HInfBalGruposSALDOACTUALGRUPO.AsFloat := HInfBalGruposSALDOACTUALGRUPO.AsFloat + nTot129;
               end
               else begin
                  HInfBalGruposSALDOACTUALGRUPO.AsFloat :=
                     HInfBalGruposSALDOACTUALGRUPO.AsFloat - (-1 * nTot129);
               end;
               if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
                  if RoundToDecimal(nTotAnt129, 3, True) > 0 then begin
                     HInfBalGruposSALDOANTERIORGRUPO.AsFloat :=
                        HInfBalGruposSALDOANTERIORGRUPO.AsFloat + nTotAnt129;
                  end
                  else begin
                     HInfBalGruposSALDOANTERIORGRUPO.AsFloat :=
                        HInfBalGruposSALDOANTERIORGRUPO.AsFloat - (-1 * nTotAnt129);
                  end;
               end;
               HInfBalGrupos.Post;
            end;

            { Carga TÍTULOS }
            if HInfBalTitulos.Locate('TITULO', Copy(HInfBalGruposGRUPO.AsString, 1, 2), []) then begin
               HInfBalTitulos.Edit;
               if RoundToDecimal(nTot129, 3, True) > 0 then begin
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat + nTot129;
               end
               else begin
                  HInfBalTitulosSALDOACTUALTITULO.AsFloat :=
                     HInfBalTitulosSALDOACTUALTITULO.AsFloat - (-1 * nTot129);
               end;
               if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
                  if RoundToDecimal(nTotAnt129, 3, True) > 0 then begin
                     HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                        HInfBalTitulosSALDOANTERIORTITULO.AsFloat + nTotAnt129;
                  end
                  else begin
                     HInfBalTitulosSALDOANTERIORTITULO.AsFloat :=
                        HInfBalTitulosSALDOANTERIORTITULO.AsFloat - (-1 * nTotAnt129);
                  end;
               end;
               HInfBalTitulos.Post;
            end;
         end;
      end;  

      { CÁLCULO DE FÓRMULAS PARA BALANCE DE PÉRDIDAS Y GANANCIAS }
      if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
         HInfBalCuentas.IndexName := 'Titulo';
         HInfBalGrupos.IndexName  := '';
         HInfBalTitulos.IndexName := 'TituloReves';
         HInfBalTitulos.First;
         while not HInfBalTitulos.EOF do begin
            Titulo := HInfBalTitulosTITULO.AsString;
            Letra  := Copy(Titulo, 1, 1);
            if (Letra = 'A') or (Letra = 'P') or (Empty(HInfBalTitulosSUMA1.AsString) and
               Empty(HInfBalTitulosSUMA2.AsString ) and
               Empty(HInfBalTitulosSUMA3.AsString ) and
               Empty(HInfBalTitulosSUMA4.AsString ) and
               Empty(HInfBalTitulosSUMA5.AsString ) and
               Empty(HInfBalTitulosSUMA6.AsString ) and
               Empty(HInfBalTitulosSUMA7.AsString ) and
               Empty(HInfBalTitulosSUMA8.AsString ) and
               Empty(HInfBalTitulosRESTA1.AsString) and
               Empty(HInfBalTitulosRESTA2.AsString) and
               Empty(HInfBalTitulosRESTA3.AsString) and
               Empty(HInfBalTitulosRESTA4.AsString) and
               Empty(HInfBalTitulosRESTA5.AsString) and
               Empty(HInfBalTitulosRESTA6.AsString) and
               Empty(HInfBalTitulosRESTA7.AsString) and
               Empty(HInfBalTitulosRESTA8.AsString))then begin
               HInfBalTitulos.Next;
               Continue;
            end;

            { Inicializar }
            HInfBalTitulos.Edit;
            HInfBalTitulosSALDOACTUALTITULO.AsFloat   := 0;
            HInfBalTitulosSALDOANTERIORTITULO.AsFloat := 0;
            HInfBalTitulos.Post;
            nIndice := StrToInt(Copy(Titulo, 2, 1));

            { Leer fórmula }
            Formula(HInfBalTitulosSUMA1.AsString ,  1);
            Formula(HInfBalTitulosSUMA2.AsString ,  1);
            Formula(HInfBalTitulosSUMA3.AsString ,  1);
            Formula(HInfBalTitulosSUMA4.AsString ,  1);
            Formula(HInfBalTitulosSUMA5.AsString ,  1);
            Formula(HInfBalTitulosSUMA6.AsString ,  1);
            Formula(HInfBalTitulosSUMA7.AsString ,  1);
            Formula(HInfBalTitulosSUMA8.AsString ,  1);
            Formula(HInfBalTitulosRESTA1.AsString, -1);
            Formula(HInfBalTitulosRESTA2.AsString, -1);
            Formula(HInfBalTitulosRESTA3.AsString, -1);
            Formula(HInfBalTitulosRESTA4.AsString, -1);
            Formula(HInfBalTitulosRESTA5.AsString, -1);
            Formula(HInfBalTitulosRESTA6.AsString, -1);
            Formula(HInfBalTitulosRESTA7.AsString, -1);
            Formula(HInfBalTitulosRESTA8.AsString, -1);

            if Copy(Titulo, 1, 1) = 'D' then begin
               if RoundToDecimal(HInfBalTitulosSALDOACTUALTITULO.AsFloat, 3, True) > 0 then begin
                  aSaldo[nIndice]   := HInfBalTitulosSALDOACTUALTITULO.AsFloat;
                  aFormula[nIndice] := 'D';
               end;
            end else
            if Empty(aFormula[nIndice]) then begin
               aSaldo[nIndice]   := HInfBalTitulosSALDOACTUALTITULO.AsFloat;
               aFormula[nIndice] := 'H';
            end;
            HInfBalTitulos.Next;
         end;
         HInfBalTitulos.IndexName := '';
      end;

      if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
         { Poner en H5 y H6 lo que tenga en D5 y D6 (Saldo actual) }
         if HInfBalTitulos.Locate('TITULO', 'D5', []) then begin
            nSaldoAux := HInfBalTitulosSALDOACTUALTITULO.AsFloat;
            if HInfBalTitulos.Locate('TITULO', 'H5', []) then begin
               HInfBalTitulos.Edit;
               HInfBalTitulosSALDOACTUALTITULO.AsFloat := nSaldoAux;
               HInfBalTitulos.Post;
            end;
         end;

         if HInfBalTitulos.Locate('TITULO', 'D6', []) then begin
            nSaldoAux := HInfBalTitulosSALDOACTUALTITULO.AsFloat;
            if HInfBalTitulos.Locate('TITULO', 'H6', []) then begin
               HInfBalTitulos.Edit;
               HInfBalTitulosSALDOACTUALTITULO.AsFloat := nSaldoAux;
               HInfBalTitulos.Post;
            end;
         end;
      end;
   except
      on E: Exception do begin
         QCuentas.Close;
         QCuentas.Free;
         QTitulos.Close;
         QTitulos.Free;
         QGrupos.Close;
         QGrupos.Free;
         QConsolida.Close;
         QConsolida.Free;
         if prmEmpresaAnterior <> 0 then begin
            QSaldoAnteriorCuenta.Close;
            QSaldoAnteriorCuenta.Free;
         end;

         // quita la espera Caratula.Cerrar;
         // quita la espera Caratula.Free;

         DatabaseError(E.Message);
      end;
   end;

   QCuentas.Close;
   QCuentas.Free;
   QTitulos.Close;
   QTitulos.Free;
   QGrupos.Close;
   QGrupos.Free;
   QConsolida.Close;
   QConsolida.Free;
   if prmEmpresaAnterior <> 0 then begin
      QSaldoAnteriorCuenta.Close;
      QSaldoAnteriorCuenta.Free;
   end;

{+-+-+-    PRIMER BLOQUE DE CÓDIGO  -+-+-+}

   { Rellena saldos de título y grupo }
   RellenaSaldosCuentas(prmFechaInicial, prmFechaFinal, prmFechaImpresion);

   { Filtra registros a imprimir }
   FiltraRegistros(prmTipoInforme, prmSaldosEjercicioAnterior, prmEmpresaAnterior);

   { Añadir registros de fórmulas }
   InsertaLineasFormulas(prmFechaInicial, prmFechaFinal, prmFechaImpresion);

   lBorraAnterior := False;
   HInfBalCuentas.IndexName := 'Titulo';
   if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
      HInfBalCuentas.First;
      while not HInfBalCuentas.EOF do begin
         Letra1  := Copy(HInfBalCuentasTITULO.AsString, 1, 1);
         Letra2  := Copy(HInfBalCuentasTITULO.AsString, 2, 1);
         nIndice := StrToInt(Letra2);

         HInfBalCuentas.Edit;
         HInfBalCuentasTITULOIMPRESO.AsString := HInfBalCuentasTITULO.AsString;
         HInfBalCuentas.Post;

         if ((Trim(HInfBalCuentasTITULO.AsString) = 'H5') or
             (Trim(HInfBalCuentasTITULO.AsString) = 'H6')) and lBorraAnterior then begin
            HInfBalCuentas.Edit;
            HInfBalCuentasSALDOAnteriorTITULO.AsFloat := 0;
            HInfBalCuentas.Post;
            HInfBalCuentas.Next;
            Continue;
         end;

         if (nIndice <> 0) and (Letra1 <> aFormula[nIndice]) then begin
            if HInfBalCuentasSALDOACTUALCUENTA.AsFloat = 0 then begin
               if ((Trim(HInfBalCuentasTITULO.AsString) = 'D5') or
                   (Trim(HInfBalCuentasTITULO.AsString) = 'D6')) then begin
                  lBorraAnterior := True;
               end;
               HInfBalCuentas.Edit;
               HInfBalCuentasSALDOACTUALTITULO.AsFloat := 0;
               HInfBalCuentas.Post;
            end
            else begin
               HInfBalCuentas.Edit;
               HInfBalCuentasTITULOIMPRESO.AsString      := '';
               HInfBalCuentasDESCRIPCIONTITULO.AsString  := '';
               HInfBalCuentasFORMULA.AsString            := '';
               HInfBalCuentasSALDOACTUALTITULO.AsFloat   :=  0;
               HInfBalCuentasSALDOANTERIORTITULO.AsFloat :=  0;
               HInfBalCuentas.Post;
            end;
            HInfBalCuentas.Next;
         end
         else begin
            HInfBalCuentas.Next;
         end;
      end;
   end;

   { Si saca D3,D4,D5 y D6 de anterior, se pone a cero  H5 y H6 de anterior. }
   HInfBalCuentas.Locate('TITULO', 'D3', []);
   if HInfBalCuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
      if HInfBalCuentas.Locate('TITULO', 'H3', []) then begin
         HInfBalCuentas.Edit;
         HInfBalCuentasSALDOANTERIORTITULO.AsFloat := 0;
         HInfBalCuentas.Post;
      end;
   end;

   HInfBalCuentas.Locate('TITULO', 'D4', []);
   if HInfBalCuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
      if HInfBalCuentas.Locate('TITULO', 'H4', []) then begin
         HInfBalCuentas.Edit;
         HInfBalCuentasSALDOANTERIORTITULO.AsFloat := 0;
         HInfBalCuentas.Post;
      end;
   end;

   HInfBalCuentas.Locate('TITULO', 'D5', []);
   if HInfBalCuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
      if HInfBalCuentas.Locate('TITULO', 'H5', []) then begin
         HInfBalCuentas.Edit;
         HInfBalCuentasSALDOANTERIORTITULO.AsFloat := 0;
         HInfBalCuentas.Post;
      end;
   end;

   HInfBalCuentas.Locate('TITULO', 'D6', []);
   if HInfBalCuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
      if HInfBalCuentas.Locate('TITULO', 'H6', []) then begin
         HInfBalCuentas.Edit;
         HInfBalCuentasSALDOANTERIORTITULO.AsFloat := 0;
         HInfBalCuentas.Post;
      end;
   end;

   // quita la espera Caratula.Cerrar;
   // quita la espera Caratula.Free;

   if prmTipoInforme = INF_BALANCE_SITUACION then begin
      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
         FormPrincipal.LanzarListado('LBalanceSituacionAnterior.rtm',
                                     SInfBalCuentas,
                                     prmMonedaImpresion);
      end
      else begin
         FormPrincipal.LanzarListado('LBalanceSituacion.rtm',
                                     SInfBalCuentas,
                                     prmMonedaImpresion);
      end;
   end
   else begin
      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
         FormPrincipal.LanzarListado('LCuentaPPGGAnterior.rtm',
                                     SInfBalCuentas,
                                     prmMonedaImpresion);
      end
      else begin
         FormPrincipal.LanzarListado('LCuentaPPGG.rtm',
                                     SInfBalCuentas,
                                     prmMonedaImpresion);
      end;
   end;
   InicializarFicherosInformes;
end;


procedure TDMBlnc.InicializarFicherosInformes;
begin
   //HInfBalCuentas.EmptyTable;
   //HInfBalGrupos.EmptyTable;
   //HInfBalTitulos.EmptyTable;
end;


end.
