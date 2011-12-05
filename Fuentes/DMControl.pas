unit DMControl;
interface
uses Classes, Controls, Db, Dialogs, Forms, Graphics, Messages, SysUtils, Windows, IBSQL,
     IBCustomDataSet, IBTableSet, IBDatabase, Globales, IBQuery;

type
   TDmControlRef = class(TDataModule)
      BDControl:          TIBDatabase;
      TransaccionControl: TIBTransaction;
      QEmpresas:          TIBTableSet;
      QEmpresasCERRADA:   TIBStringField;
      QEmpresasCLAVE:     TIBStringField;
      QEmpresasUBICACION: TIBStringField;
      QEmpresasNOMBRE:    TIBStringField;
      QEmpresasID_EMPRESA: TIntegerField;
      QEmpresasULTIMA:    TIBStringField;
      QUsuarios:          TIBTableSet;
      QUsuariosID_USUARIO: TIntegerField;
      QUsuariosID_EMPRESA: TIntegerField;
      QUsuariosCLAVE:     TIBStringField;
      QUsuariosNOMBRE:    TIBStringField;
      QControl:           TIBTableSet;
      QControlPEDIR_CLAVE: TIBStringField;
      QControlID_CONTROL: TSmallintField;
      QEmpresasSERVIDOR:  TIBStringField;
      QAuxiliar:          TIBSQL;
      sEmpresas:          TDataSource;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
   protected
      procedure Loaded; override;
   private
      function GetTestRunning:Boolean;
   public
      procedure AbrirDataSets;
      procedure CerrarDataSets;
      procedure AbrirEmpresa(prmEMPRESA :Integer);
      function ObtenerNumeroUsuario: Integer;
      function AccesoUsuario(IDUsuario: Integer; Window: String): Boolean;
      function ExistenRegistros(Tabla, Condicion: String): Boolean;
      function PermisoUsuario(prmIDUsuario :Integer; prmVentana: String; prmPermiso: TPermiso): Boolean;
      property TestRunning :Boolean read GetTestRunning;
      function CreateQuery(const prmSQL :array of string):TIBQuery;
   end;

var DmControlRef: TDmControlRef;

implementation
uses General, IniFiles, DMConta, DM, DMBalances;
{$R *.DFM}

function TDMControlRef.GetTestRunning:Boolean;
begin
   Result := ExtractFileName(LowerCase(ParamStr(0))) = LowerCase('Test_Contabilidad.exe');
end;

function TDMControlRef.CreateQuery(const prmSQL :array of string):TIBQuery;
var Query :TIBQuery;
    i     :Integer;
begin
   Query := TIBQuery.Create(nil);
   Query.DataBase := BDControl;
   for i := Low(prmSQL) to High(prmSQL) do begin
       Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

procedure TDmControlRef.Loaded;
var DirWindows :array[0..255] of Char;
    WinIni     :TIniFile;
    cRegistro  :string;
    cPath      :string;
    Directorio :string;
begin
   inherited;
   BDControl.Connected       := False;
   TransaccionControl.Active := False;

   Directorio    := ExtractFilePath(Application.ExeName);
   gvDirImagenes := Directorio + gcDirImagenes;
   gvDirInformes := Directorio + gcDirInformes;

   GetWindowsDirectory(DirWindows, SizeOf(DirWindows));

   WinIni := TIniFile.Create(Directorio + 'SIAMCONTCONF.INI');
   cPath     := UPPERCASE(WinINI.ReadString('DATABASE', 'PATH'    , '' ));
   cRegistro := UPPERCASE(WinINI.ReadString('REGISTRO', 'REGISTRO', 'S'));
   gvComprobarRegistro := (cRegistro = 'S');
   WinINI.Free;

   if not TestRunning then begin
      BDControl.Params.Clear;
      BDControl.Params.Add('user_name=SYSDBA'  );
      BDControl.Params.Add('password=masterkey');
      BDControl.DatabaseName := cPath;
      BDControl.Connected    := True;
      TransaccionControl.Active := True;
   end;
end;

procedure TDmControlRef.DataModuleCreate(Sender: TObject);
var i :Integer;
begin
   if TestRunning then Exit;
   { activar transacciones }
   for i := 0 to (ComponentCount - 1) do begin
      if (Components[i] is TibTransaction) then begin
         TibTransaction(Components[i]).Active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.Add('Read_committed');
         TibTransaction(Components[i]).Params.Add('Rec_version');
         TibTransaction(Components[i]).Params.Add('Write');
         TibTransaction(Components[i]).Active := True;
      end;
   end;
   AbrirDataSets;
end;

procedure TDmControlRef.AbrirDataSets;
begin
   QueryOpen(QUsuarios, 'SELECT * from usuarios order by nombre     ');
   QueryOpen(QControl , 'SELECT * from control  order by id_control ');
   QueryOpen(QEmpresas, 'SELECT * from empresas order by nombre     ');
end;

procedure TDmControlRef.CerrarDataSets;
var i :Integer;
begin
   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDataSet then begin
         try    TDataSet(Components[i]).Close;
         except ShowMessage('Error datamodulo al cerrar la tabla ' + TDataSet(Components[i]).Name);
         end;
      end;
   end;
end;

procedure TDmControlRef.DataModuleDestroy(Sender: TObject);
begin
   if TestRunning then Exit;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSql.Create(nil), sql do begin
      Close;
      Database := DMControlRef.BDControl;
      // Primero inicializar todas a N
      Add('Update empresas set ultima = "N" ');
      ExecQuery;
      Transaction.CommitRetaining;
      Clear;
      // Grabar ultima empresa
      Add('Update empresas set ultima="S"');
      Add('Where id_empresa=:id_empresa');
      parambyname('id_empresa').AsInteger := gvEmpresaActual;
      ExecQuery;
      Transaction.CommitRetaining;
      if (gvUsuario <> gcUsuarioDesbloqueo) and
         (DMControlRef.QControl.FieldByName('Pedir_Clave').AsString <> 'N') then begin
         // Grabar en usuario la ultima empresa
         Close;
         Clear;
         Add('Update usuarios set id_empresa=:id_empresa');
         Add('Where id_usuario=:id_usuario');
         parambyname('id_empresa').AsInteger := gvEmpresaActual;
         parambyname('id_usuario').AsInteger := gvId_Usuario;
         ExecQuery;
         Transaction.CommitRetaining;
      end;
      Close;
      Free;
   end;
   CerrarDataSets;
end;

procedure TDmControlRef.AbrirEmpresa(prmEMPRESA :Integer);
var Q   :TIBQuery;
    SQL :TStringList;
begin
   { Si empresa vale -1, hay que abrir la empresa que tiene valor de ultima }
   SQL := TStringList.Create;
   SQL.Add('SELECT ID_EMPRESA, ');
   SQL.Add('       NOMBRE    , ');
   SQL.Add('       UBICACION , ');
   SQL.Add('       ULTIMA    , ');
   SQL.Add('       SERVIDOR    ');
   SQL.Add('FROM EMPRESAS      ');

   if prmEMPRESA = -1 then SQL.Add('WHERE ULTIMA = ''S'' ')
   else begin
      SQL.Add('WHERE ID_EMPRESA = :prmID_EMPRESA');
   end;

   Q := DMControlRef.CreateQuery([SQL.Text]);
   if prmEMPRESA <> -1 then Q.ParamByName('prmID_EMPRESA').AsInteger := prmEMPRESA;
   try Q.Open;

       if not Q.IsEmpty then begin
          gvServidor          := Trim(Q.FieldByName('SERVIDOR' ).AsString);
          gvUbicacionEmpresa  := Trim(Q.FieldByName('UBICACION').AsString);
          gvNombreEmpresaMenu := Trim(Q.FieldByName('NOMBRE'   ).AsString);
          if prmEMPRESA = -1 then begin
             gvEmpresaActual := Q.FieldByName('ID_EMPRESA').AsInteger;
          end;
       end                                                                     
       else begin
          raise Exception.Create('Empresa Incorrecta.');
       end;

       //   { No ha encontrado empresa, se abre y toma la primera que tenga }
       //   Close;
       //   Clear;
       //   Add('SELECT ID_EMPRESA, NOMBRE, UBICACION, ULTIMA, SERVIDOR FROM EMPRESAS');
       //   ExecQuery;
       //   if not EOF then begin
       //      gvServidor          := FieldByName('servidor').AsString;
       //      gvEmpresaActual     := FieldByName('id_empresa').AsInteger;
       //      gvUbicacionEmpresa  := FieldByName('ubicacion').AsString;
       //      gvNombreEmpresaMenu := Trim(FieldByName('nombre').AsString);
       //   end
       //   else begin
       //      ShowMessage('No hay empresas definidas. Error');
       //      Application.Terminate;
       //   end;
       //end;
       //Close;
       //Free;
   finally Q.Free;
   end;
   // Abrir data modulos
   Application.CreateForm(TDMRef, DMRef);
   Application.CreateForm(TDMContaRef, DMContaRef);
   Application.CreateForm(TDMBlnc    , DMBlnc    );
end;

function TDmControlRef.ObtenerNumeroUsuario: Integer;
var
   Numero: Integer;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database := DmControlRef.BDControl;
      Clear;
      Add('execute procedure Dame_NumeroUsuario');
      ExecQuery;
      Numero := FieldByName('ID_USUARIO').AsInteger;
      Free;
   end;
   Result := Numero;
end;

function TDmControlRef.AccesoUsuario(IDUsuario: Integer; Window: String): Boolean;
begin
   Result := (IDUsuario = 0) or ExistenRegistros('PERMISOS_USUARIOS P, MANTENIMIENTOS M',
      'P.IDMODULO = M.IDMODULO AND P.IDMANTENIMIENTO = M.IDMANTENIMIENTO AND ' +
      'P.IDUSUARIO = ' + IntToStr(IDUsuario) + ' AND ' + 'M.WINDOWNAME = ' + QuotedStr(Window));
end;

function TDmControlRef.ExistenRegistros(Tabla, Condicion: String): Boolean;
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

function TDmControlRef.PermisoUsuario(prmIDUsuario :Integer; prmVentana :string; prmPermiso :TPermiso):Boolean;
var Q :TIBQuery;
begin
   if gvDemo then begin
      case prmPermiso of
         ANIADIR   :Result := False;
         MODIFICAR :Result := True;
         BORRAR    :Result := True;
         IMPRESION :Result := False;
         else raise Exception.Create('Permiso Usuario prmPermiso incorrecto.');
      end;
      Exit;
   end;

   // Sin permiso en modo DEMO para AÑADIR, MODIFICAR y BORRAR en Usuarios
   //if UpperCase(Ventana) = 'WUSUARIOS' then begin
   //   TienePermiso := TienePermiso and (not gvDemo);
   //end;

   Q := CreateQuery(['SELECT ANIADIR, MODIFICAR, BORRAR, IMPRESION ',
                     'FROM   PERMISOS_USUARIOS P,                  ',
                     '       MANTENIMIENTOS    M                   ',
                     'WHERE  P.IDMODULO        = M.IDMODULO        ',
                     'AND    P.IDMANTENIMIENTO = M.IDMANTENIMIENTO ',
                     'AND    P.IDUSUARIO       = :prmIDUSUARIO     ',
                     'AND    M.WINDOWNAME      = :prmVENTANA       ']);
   Q.ParamByName('prmIDUSUARIO').AsInteger := prmIDUSUARIO;
   Q.ParamByName('prmVENTANA'  ).AsString  := UpperCase(prmVentana);
   Q.Open;
   try case prmPermiso of
          ANIADIR   :Result := Q.FieldByName('ANIADIR'  ).AsString = 'S';
          MODIFICAR :Result := Q.FieldByName('MODIFICAR').AsString = 'S';
          BORRAR    :Result := Q.FieldByName('BORRAR'   ).AsString = 'S';
          IMPRESION :Result := Q.FieldByName('IMPRESION').AsString = 'S';
          else raise Exception.Create('Permiso Usuario prmPermiso incorrecto.');
       end;
   finally Q.Free;
   end;

   Result := (prmIDUsuario = 0) or Result;
end;

end.
