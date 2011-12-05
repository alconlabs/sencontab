unit DM;
interface
uses Classes, Controls, Db, Dialogs, Forms, Graphics,IBQuery, Messages, SysUtils, Variants, Windows,
     Globales, IBCustomDataSet, IBDatabase, IBSQL, IBTableSet;
type
   TDMRef = class(TDataModule)
      IBDSiamCont:    TIBDatabase;
      IBT1:           TIBTransaction;
      QAuxiliar:      TIBSQL;
      QProvinciasNom: TIBTableSet;
      QPaisNom:       TIBTableSet;
      QParametros:    TIBTableSet;
      QProvinciasNomPROVINCIA: TIBStringField;
      QProvinciasNomNOMBRE: TIBStringField;
      QProvinciasNomCODIGO: TIBStringField;
      QPaisNomPAIS:   TIBStringField;
      QPaisNomNOMBRE: TIBStringField;
      QAnaliticas:    TIBTableSet;
      QAnaliticasID_PROYECTO: TIBStringField;
      QAnaliticasID_SECCION: TIBStringField;
      QAnaliticasID_DEPARTAMENTO: TIBStringField;
      QAnaliticasID_DELEGACION: TIBStringField;
      QAnaliticasNOMBRE: TIBStringField;
      QAnaliticasCUENTA: TIBStringField;
      QAnaliticasNom: TIBTableSet;
      IBStringField41: TIBStringField;
      IBStringField42: TIBStringField;
      IBStringField43: TIBStringField;
      IBStringField44: TIBStringField;
      IBStringField45: TIBStringField;
      IBStringField46: TIBStringField;
      QDelegacionNom: TIBTableSet;
      QDelegacionNomNOMBRE: TIBStringField;
      QDelegacionNomID_DELEGACION: TIBStringField;
      QDepartamentoNom: TIBTableSet;
      QDepartamentoNomNOMBRE: TIBStringField;
      QDepartamentoNomID_DEPARTAMENTO: TIBStringField;
      QProyectoNom:   TIBTableSet;
      QProyectoNomNOMBRE: TIBStringField;
      QProyectoNomID_PROYECTO: TIBStringField;
      QSeccionNom:    TIBTableSet;
      QSeccionNomNOMBRE: TIBStringField;
      QSeccionNomID_SECCION: TIBStringField;
      QDelegacion:    TIBTableSet;
      IBStringField1: TIBStringField;
      IBStringField2: TIBStringField;
      QDepartamento:  TIBTableSet;
      IBStringField3: TIBStringField;
      IBStringField4: TIBStringField;
      QProyecto:      TIBTableSet;
      IBStringField5: TIBStringField;
      IBStringField6: TIBStringField;
      QSeccion:       TIBTableSet;
      IBStringField7: TIBStringField;
      IBStringField8: TIBStringField;
      QComercial:     TIBTableSet;
      QComercialNOMBRE: TIBStringField;
      QComercialCOMERCIAL: TIBStringField;
      QcomercialNom:  TIBTableSet;
      IBStringField9: TIBStringField;
      IBStringField10: TIBStringField;
      QFormaPago:     TIBTableSet;
      QFormaPagoFORMAPAGO: TIBStringField;
      QFormaPagoCLASE: TIBStringField;
      QFormaPagoDESCRIBE: TIBStringField;
      QFormaPagoINTERVALO: TSmallintField;
      QFormaPagoNUMVENCI: TSmallintField;
      QFormaPagoOBSOLETO: TIBStringField;
      QFormaPagoNom:  TIBTableSet;
      IBStringField11: TIBStringField;
      IBStringField12: TIBStringField;
      IBStringField13: TIBStringField;
      SmallintField1: TSmallintField;
      SmallintField2: TSmallintField;
      IBStringField14: TIBStringField;
      QTipoDiario:    TIBTableSet;
      QTipoDiarioDESCRIPCION: TIBStringField;
      QTipoDiarioTIPODIARIO: TIBStringField;
      QTipodiarioNom: TIBTableSet;
      IBStringField15: TIBStringField;
      IBStringField16: TIBStringField;
      IBDConsolida:   TIBDatabase;
      IBTConsolida:   TIBTransaction;
      TransBdEjanterior: TIBTransaction;
      BDEjAnterior:   TIBDatabase;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
   protected
      procedure Loaded; override;
   private
   public
      procedure AbrirDataSets;
      procedure CerrarDataSets;
      procedure ConectarBDEmpresa(prmCD_EMPRESA :string);
      procedure ConectarBDEmpresaAnterior(prmCD_EMPRESA :Integer);
      procedure EjecutarSQL(Sentencia: String);
      function  ExistenRegistros(Tabla, Condicion: String): Boolean;
      function  ObtenerValor(Campo, Tabla, Condicion: String; Orden: String = ''): Variant;
      function  CreateQuery          (const prmSQL :array of string):TIBQuery;
      function  CreateQueryConsolida (const prmSQL :array of string):TIBQuery;
      function  CreateQueryEjAnterior(const prmSQL :array of string):TIBQuery;
   end;

var DMRef: TDMRef;

implementation
uses General, DMControl;
{$R *.DFM}

function TDMRef.CreateQuery(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := IBDSiamCont;
   Query.Transaction := IBDSiamCont.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryConsolida(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := IBDConsolida;
   Query.Transaction := IBDConsolida.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

function TDMRef.CreateQueryEjAnterior(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase    := BDEjAnterior;
   Query.Transaction := BdEjAnterior.DefaultTransaction;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;


procedure TDMRef.AbrirDataSets;
begin
   QueryOpen(QParametros, 'SELECT * FROM PARAMETROS ORDER BY ID_PARAMETROS DESC');

   QueryOpen(QPaisNom, 'SELECT * FROM PAISES ORDER BY NOMBRE');

   QueryOpen(QProvinciasNom  , 'SELECT * FROM PROVINCIAS   ORDER BY NOMBRE         ');
   QueryOpen(QSeccionNom     , 'SELECT * FROM SECCION      ORDER BY ID_SECCION     ');
   QueryOpen(QSeccionNom     , 'SELECT * FROM SECCION      ORDER BY NOMBRE         ');
   QueryOpen(QProyecto       , 'SELECT * FROM PROYECTO     ORDER BY ID_PROYECTO    ');
   QueryOpen(QProyectoNom    , 'SELECT * FROM PROYECTO     ORDER BY NOMBRE         ');
   QueryOpen(QDepartamento   , 'SELECT * FROM DEPARTAMENTO ORDER BY ID_DEPARTAMENTO');
   QueryOpen(QDepartamentoNom, 'SELECT * FROM DEPARTAMENTO ORDER BY NOMBRE         ');
   QueryOpen(QDelegacion     , 'SELECT * FROM DELEGACION   ORDER BY ID_DELEGACION  ');
   QueryOpen(QDelegacionNom  , 'SELECT * FROM DELEGACION   ORDER BY NOMBRE         ');
   QueryOpen(QAnaliticas     , 'SELECT * FROM ANALITICAS   ORDER BY CUENTA         ');
   QueryOpen(QAnaliticasNom  , 'SELECT * FROM ANALITICAS   ORDER BY NOMBRE         ');
   QueryOpen(QComercial      , 'SELECT * FROM COMERCIALES  ORDER BY COMERCIAL      ');
   QueryOpen(QComercialNom   , 'SELECT * FROM COMERCIALES  ORDER BY NOMBRE         ');
   QueryOpen(QFormaPago      , 'SELECT * FROM FORMAS WHERE OBSOLETO <> "S" ORDER BY FORMAPAGO');
   QueryOpen(QFormaPagoNom   , 'SELECT * FROM FORMAS WHERE OBSOLETO <> "S" ORDER BY DESCRIBE');
   QueryOpen(QTipodiario     , 'SELECT * FROM TIPODIARIO   ORDER BY TIPODIARIO     ');
   QueryOpen(QTipodiarioNom  , 'SELECT * FROM TIPODIARIO   ORDER BY DESCRIPCION    ');

   gvNombreEmpresa := DmRef.QParametros.FieldByName('NombreFiscal').AsString;
end;

procedure TDMRef.CerrarDataSets;
var i: Integer;
begin
   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDataSet then begin
         try
            TDataSet(Components[i]).Close;
         except
            ShowMessage('Error datamodulo al cerrar la tabla ' + TDataSet(Components[i]).Name);
         end;
      end;
   end;
end;

procedure TDMRef.ConectarBDEmpresa(prmCD_EMPRESA :string);
var Q :TIBQuery;
begin
   Q := TIBQuery.Create(nil);
   try Q.Database := DMControlRef.BDControl;
       Q.SQL.Add('SELECT SERVIDOR, UBICACION               ');
       Q.SQL.Add('FROM   EMPRESAS                          ');
       Q.SQL.Add('WHERE  UPPER(NOMBRE) = UPPER(:prmNOMBRE) ');
       Q.ParamByName('prmNOMBRE').AsString := prmCD_EMPRESA;
       Q.Open;
       if not Q.EOF then begin
          try IBDConsolida.Close;
              if Empty(Q.FieldByName('SERVIDOR').AsString) then begin
                 IBDConsolida.DatabaseName := Q.FieldByName('UBICACION').AsString;
              end
              else begin
                IBDConsolida.DatabaseName := Trim(Q.FieldByName('SERVIDOR').AsString) + ':' + Trim(Q.FieldByName('UBICACION').AsString);
              end;
              IBDConsolida.Connected := True;
              IBTConsolida.Active    := True;
          except Q.Close;
                 Q.Free;
                 DatabaseError('Error al conectar base de datos ' + prmCD_EMPRESA);
          end;
       end
       else DatabaseError('Error al conectar base de datos ' + prmCD_EMPRESA);
   finally Q.Close;
           Q.Free;
   end;
end;

procedure TDMRef.ConectarBDEmpresaAnterior(prmCD_EMPRESA :Integer);
var NomEmpresa: string;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      Database := DmControlRef.BDControl;
      Clear;
      Add('SELECT * FROM EMPRESAS WHERE id_Empresa=:Empresa');
      ParamByName('Empresa').AsInteger := prmCD_EMPRESA;
      Open;
      if not EOF then begin
         try
            NomEmpresa := FieldByName('Nombre').AsString;
            BDEjAnterior.Connected := False;
            if Empty(FieldByName('SERVIDOR').AsString) then begin
               BDEjAnterior.DatabaseName := FieldByName('UBICACION').AsString;
            end
            else begin
               BDEjAnterior.DatabaseName := Trim(FieldByName('SERVIDOR').AsString) + ':' +
                  Trim(FieldByName('UBICACION').AsString);
            end;
            BDEjAnterior.Connected   := True;
            TransBdEjAnterior.Active := True;
         except Close;
                Free;
                DatabaseError('Error al conectar base de datos ' + NomEmpresa);
         end;
      end
      else begin
         Close;
         Free;
         DatabaseError('Error al conectar base de datos ' + NomEmpresa);
      end;
      Close;
      Free;
   end;
end;

procedure TDMRef.EjecutarSQL(Sentencia: String);
var Q :TIBSQL;
begin
   Q := TIBSQL.Create(nil);
   Q.DataBase := IBDSiamCont;
   Q.SQL.Add(Sentencia);
   try     Q.ExecQuery;
           Q.Transaction.CommitRetaining;
   finally Q.Free;
   end;
end;

function TDMRef.ExistenRegistros(Tabla, Condicion: String): Boolean;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAuxiliar do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) NUM FROM ' + Tabla);
      if Trim(Condicion) <> '' then begin
         SQL.Add('WHERE ' + Condicion);
      end;
      Prepare;
      ExecQuery;
      Result := (QAuxiliar.FieldByName('NUM').AsInteger <> 0);
   end;
end;

procedure TDMRef.Loaded;
var Directorio :string;
begin
   inherited;
   IBDConsolida.Connected := False;
   IBDSiamCont.Connected  := False;
   Directorio          := ExtractFilePath(Application.ExeName);
   gvDirImagenes       := Directorio + gcDirImagenes;
   gvDirInformes       := Directorio + gcDirInformes;
   IBT1.Active         := False;
   IBTConsolida.Active := False;

   IBDSiamCont.Params.Clear;
   IBDSiamCont.Params.Add('user_name=SYSDBA');
   IBDSiamCont.Params.Add('password=masterkey');
   if Empty(gvServidor) then begin
      IBDSiamCont.DatabaseName := gvUbicacionEmpresa;
   end
   else begin
      IBDSiamCont.DatabaseName := Trim(gvServidor) + ':' + Trim(gvUbicacionEmpresa);
   end;
   IBDSiamCont.Connected := True;
   IBT1.Active           := True;

   IBDConsolida.Params.Clear;
   IBDConsolida.Params.Add('user_name=SYSDBA');
   IBDConsolida.Params.Add('password=masterkey');
end;

function TDMRef.ObtenerValor(Campo, Tabla, Condicion: String; Orden: String): Variant;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAuxiliar do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + Campo + ' VALOR FROM ' + Tabla);
      if Trim(Condicion) <> '' then begin
         SQL.Add('WHERE ' + Condicion);
      end;
      if Trim(Orden) <> '' then begin
         SQL.Add('ORDER BY ' + Orden);
      end;
      Prepare;
      ExecQuery;
      if RecordCount <> 0 then begin
         Result := QAuxiliar.FieldByName('VALOR').AsVariant;
      end
      else begin
         Result := Null;
      end;
   end;
end;

procedure TDMRef.DataModuleCreate(Sender: TObject);
var i :Integer;
begin
   //activar transacciones
   for i := 0 to (ComponentCount - 1) do begin
      if Components[i] is TibTransaction then begin
         TibTransaction(Components[i]).Active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.Add('Read_committed');
         TibTransaction(Components[i]).Params.Add('Rec_version');
         TibTransaction(Components[i]).Params.Add('Write');
         if (TibTransaction(Components[i]) <> IBTConsolida) and
            (TibTransaction(Components[i]) <> TransBdEjAnterior) then begin
            TibTransaction(Components[i]).Active := True;
         end;
      end;
   end;

   AbrirDataSets;

   DMRef.QParametros.Close;
   DMRef.QParametros.Regenerar := True;
   FIbQueryRefresh(DMRef.QParametros);

   gvlongitudsubcuenta  := QParametros.FieldByName('Longitud_subcuentas').AsInteger;
   gvTratamientoRecargo := (QParametros.FieldByName('Recargo').AsString = 'S');
end;

procedure TDMRef.DataModuleDestroy(Sender: TObject);
begin
   CerrarDataSets;
end;

end.
