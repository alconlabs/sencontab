unit UTDataBase;

interface
uses TestFramework, DBTables;

type
  TTCDataBase = class(TTestCase)
  protected
  published
    procedure InicializacionDB;
    procedure InicializacionDataModulos;
    procedure TestFormularioProvincias;
  end;

const ORIG_TESTDB_DIR = 'C:\cviews\Datos\TESTDB';
      TESTDB_DIR      = 'C:\cviews\DatosTest';
      TESTDB_CONTROL  = 'CONTROL_CONT.IB';
      TESTDB_NAME     = 'TESTDB.IB';
      TESTDB_MODELO   = 'BD_MODELO.GDB';

implementation
uses Forms, Dialogs, Classes, SysUtils, Windows, Messages, GUITestRunner, Math, SQLExpr, TestMainForm,
     IBQuery, ccBtnPanel,
     DMControl, DMConta, DM,
     Login, MenuPrincipal, UGrupos, Provincias;

procedure TTCDataBase.InicializacionDB;
    procedure MyCopyFile(prmFileSource, prmFileDest :string);
    begin
       CopyFile(PChar(prmFileSource), PChar(prmFileDest), True);
    end;
begin
   if not(DirectoryExists(TESTDB_DIR)) then CreateDir(TESTDB_DIR);
   Check(DirectoryExists(TESTDB_DIR) = True, TESTDB_DIR+': Debería existir el directorio');

   if FileExists(TESTDB_DIR+'\'+TESTDB_CONTROL) then DeleteFile(TESTDB_DIR+'\'+TESTDB_CONTROL);
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_CONTROL) = False, TESTDB_DIR+'\'+TESTDB_CONTROL+ '. Aun existe el Archivo. No debería existir');

   if FileExists(TESTDB_DIR+'\'+TESTDB_NAME   ) then DeleteFile(TESTDB_DIR+'\'+TESTDB_NAME   );
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_NAME) = False, TESTDB_DIR+'\'+TESTDB_NAME+ '. Aun existe el Archivo. No debería existir');

   if FileExists(TESTDB_DIR+'\'+TESTDB_MODELO ) then DeleteFile(TESTDB_DIR+'\'+TESTDB_MODELO );
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_MODELO) = False, TESTDB_DIR+'\'+TESTDB_MODELO+ '. Aun existe el Archivo. No debería existir');

   MyCopyFile(ORIG_TESTDB_DIR+'\'+TESTDB_CONTROL, TESTDB_DIR+'\'+TESTDB_CONTROL);
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_CONTROL) = True, TESTDB_DIR+'\'+TESTDB_CONTROL+'. NO existe el Archivo. Debería existir');

   MyCopyFile(ORIG_TESTDB_DIR+'\'+TESTDB_NAME, TESTDB_DIR+'\'+TESTDB_NAME);
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_NAME) = True, TESTDB_DIR+'\'+TESTDB_NAME+'. NO existe el Archivo. Debería existir');

   MyCopyFile(ORIG_TESTDB_DIR+'\'+TESTDB_MODELO, TESTDB_DIR+'\'+TESTDB_MODELO);
   Check(FileExists(TESTDB_DIR+'\'+TESTDB_MODELO) = True, TESTDB_DIR+'\'+TESTDB_MODELO+ '. NO existe el Archivo. Debería existir');

   if DMControlRef = nil then Application.CreateForm(TDMControlRef , DMControlRef);
   Check(not(DMControlRef = nil), 'DMControlRef no se a creado correctamente.');

   DMControlRef.BDControl.Params.Clear;
   DMControlRef.BDControl.Params.Add('user_name=SYSDBA'  );
   DMControlRef.BDControl.Params.Add('password=masterkey');
   DMControlRef.BDControl.DatabaseName := 'localhost:'+TESTDB_DIR+'\'+TESTDB_CONTROL;
   DMControlRef.BDControl.Connected    := True;
   DMControlRef.TransaccionControl.Active := True;
   Check(DMControlRef.BDControl.Connected = True, 'La base de datos no está conectada');
end;

procedure TTCDataBase.InicializacionDataModulos;
var Q       :TIBQuery;
    QDelete :TIBQuery;
    QInsert :TIBQuery;
    QExiste :TIBQuery;
begin
   Q := DMControlRef.CreateQuery(['UPDATE EMPRESAS SET ULTIMA = ''N'' ']);
   try     Q.ExecSQL;
   finally Q.Free;
   end;

   QDelete := DMControlRef.CreateQuery(['DELETE FROM EMPRESAS        ',
                                        'WHERE  NOMBRE = ''TEST_DB'' ']);
   try     QDelete.ExecSQL;
   finally QDelete.Free;
   end;

   QInsert := DMControlRef.CreateQuery(['INSERT INTO EMPRESAS                        ',
                                        '       (CERRADA   ,                         ',
                                        '        CLAVE     ,                         ',
                                        '        UBICACION ,                         ',
                                        '        NOMBRE    ,                         ',
                                        '        ID_EMPRESA,                         ',
                                        '        ULTIMA    ,                         ',
                                        '        SERVIDOR)                           ',
                                        'VALUES (''N''        ,                      ',
                                        '        ''''         ,                      ',
                                        '        '''+TESTDB_DIR+'\'+TESTDB_NAME+''', ',
                                        '        ''TEST_DB''  ,                      ',
                                        '        2007         ,                      ',
                                        '        ''S''        ,                      ',
                                        '        ''localhost''                     ) ']);
   try     QInsert.ExecSQL;
   finally QInsert.Free;
   end;

   QExiste := DMControlRef.CreateQuery(['SELECT COUNT(*) EXISTE      ',
                                        'FROM   EMPRESAS             ',
                                        'WHERE  NOMBRE = ''TEST_DB'' ']);
   try     QExiste.Open;
           Check(QExiste.FieldByName('EXISTE').AsInteger > 0, 'No se creó correctamente la entrada de la base de datos de Pruebas.');
   finally QExiste.Free;
   end;

   DMControlRef.AbrirEmpresa(96);
end;

procedure TTCDataBase.TestFormularioProvincias;
var Provincias :TFormProvincias;
    QLimpia    :TIBQuery;
    QExiste    :TIBQuery;
    QNoExiste  :TIBQuery;
begin
   QLimpia := DMRef.CreateQuery(['DELETE FROM PROVINCIAS    ',
                                 'WHERE  PROVINCIA = ''ZZ'' ']);
   QLimpia.ExecSQL;
   QLimpia.Free;

   try Provincias := TFormProvincias.Create(Application);
       with Provincias do begin
          Check(EditPROVINCIA.ReadOnly, 'No cambió de estado correctamente crear la ventana');
          BtnNuevo.Click;
          Check(not EditPROVINCIA.ReadOnly, 'No cambió de estado correctamente al añadir un registro');
          Navegador.BtnClick(nrLast);
          BtnCancelar.Click;
          BtnNuevo.Click;
          EditPROVINCIA.SetFocus; EditPROVINCIA.Text := 'ZZ';
          EditNOMBRE.SetFocus;    EditNOMBRE.Text    := 'ZZZZZZZ';
          EditCODIGO.SetFocus;    EditCODIGO.Text    := 'ZZ';
          BtnAceptar.Click;
          QExiste := DMRef.CreateQuery(['SELECT PROVINCIA FROM PROVINCIAS ',
                                        'WHERE  PROVINCIA = ''ZZ''       ']);
          QExiste.Open;
          Check(QExiste.FieldByName('PROVINCIA').AsString = 'ZZ', 'No se ha insertado correctamente ZZ');
          QExiste.Free;

          BtnEliminar.Click;

          QNoExiste := DMRef.CreateQuery(['SELECT PROVINCIA FROM PROVINCIAS ',
                                          'WHERE  PROVINCIA = ''ZZ''       ']);
          QNoExiste.Open;
          Check(QExiste.IsEmpty, 'No se ha eliminado correctamente ZZ');
          QNoExiste.Free;

          Navegador.BtnClick(nrClose);
          Check(not (Provincias = nil), 'No se ha Liberado correctamente la ventana');
       end;

       //WGrupos := TWGrupos.Create(nil);
       //WGrupos.Show;
       //Check(WGrupos <> nil, 'WGrupos no se creó adecuadamente.');
       //WGrupos.BtnNavCerrar.Click;
       //Check(WGrupos = nil, 'WGrupos no se destruyó adecuadamente.');


       //AForm := ccGetInsertedForm(FormTestMainForm, TFormClientes);
       //TFormClientes(AForm).BtnCerrarClick(TFormClientes(AForm));
       //FreeAndNil(AForm);
       //Check(TFormClientes(AForm) = nil, 'FormClientes no se cerró adecuadamente.');
       
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormObras);
       //TFormObras(AForm).BtnCerrarClick(TFormObras(AForm));
       //FreeAndNil(AForm);
       //Check(TFormObras(AForm) = nil, 'FormObras no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFamilias);
       //TFormFamilias(AForm).BtnCerrarClick(TFormFamilias(AForm));
       //FreeAndNil(AForm);
       //Check(TFormFamilias(AForm) = nil, 'FormFamilias no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormMaderas);
       //TFormMaderas(AForm).NavegadorButtonAction((TFormMaderas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormMaderas(AForm) = nil, 'FormMaderas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConceptosObra);
       //TFormConceptosObra(AForm).NavegadorButtonAction((TFormConceptosObra(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConceptosObra(AForm) = nil, 'FormConceptosObra no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFormaPago);
       //TFormFormaPago(AForm).NavegadorButtonAction((TFormFormaPago(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFormaPago(AForm) = nil, 'FormFormaPago no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormDelegaciones);
       //TFormDelegaciones(AForm).NavegadorButtonAction((TFormDelegaciones(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormDelegaciones(AForm) = nil, 'FormDelegaciones no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormDepartamentos);
       //TFormDepartamentos(AForm).NavegadorButtonAction((TFormDepartamentos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormDepartamentos(AForm) = nil, 'FormDepartamentos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormAplicaciones);
       //TFormAplicaciones(AForm).NavegadorButtonAction((TFormAplicaciones(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormAplicaciones(AForm) = nil, 'FormAplicaciones no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormAplVersiones);
       //TFormAplVersiones(AForm).NavegadorButtonAction((TFormAplVersiones(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormAplVersiones(AForm) = nil, 'FormAplVersiones no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormOpcionesMenu);
       //TFormOpcionesMenu(AForm).NavegadorButtonAction((TFormOpcionesMenu(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormOpcionesMenu(AForm) = nil, 'FormOpcionesMenu no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFormsAplicacion);
       //TFormFormsAplicacion(AForm).NavegadorButtonAction((TFormFormsAplicacion(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFormsAplicacion(AForm) = nil, 'FormFormsAplicacion no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormUsuariosMenus);
       //TFormUsuariosMenus(AForm).BtnCerrar.Click;//NavegadorButtonAction((TFormUsuariosMenus(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormUsuariosMenus(AForm) = nil, 'FormUsuariosMenus no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormUsuariosForms);
       //TFormUsuariosForms(AForm).BtnCerrar.Click;//NavegadorButtonAction((TFormUsuariosForms(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormUsuariosForms(AForm) = nil, 'FormUsuariosForms no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormUsuarios);
       //TFormUsuarios(AForm).BtnPanelButtonAction((TFormUsuarios(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormUsuarios(AForm) = nil, 'FormUsuarios no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormMenusUsuarios);
       //TFormMenusUsuarios(AForm).BtnCerrar.Click;//NavegadorButtonAction((TFormMenusUsuarios(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormMenusUsuarios(AForm) = nil, 'FormMenusUsuarios no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormBugTracking);
       //TFormBugTracking(AForm).NavegadorButtonAction((TFormBugTracking(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormBugTracking(AForm) = nil, 'FormBugTracking no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormDesigner);
       //TFormDesigner(AForm).BtnClose.Click; //NavegadorButtonAction((TFormDesigner(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormDesigner(AForm) = nil, 'FormDesigner no se cerró adecuadamente.');
       //
       //{Hay que poner un $DEFINE que evite que al salir de la ventana, se cierre la aplicación, sólo }
       //{cuando estemos pasando el programa de test                                                   }
       //{AForm := ccGetInsertedForm(FormTestMainForm, TFormSeleccionDelegacion);
       //TFormSeleccionDelegacion(AForm).BtnCancelar.Click;
       //FreeAndNil(AForm);
       //Check(TFormSeleccionDelegacion(AForm) = nil, 'FormSeleccionDelegacion no se cerró adecuadamente.');}
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTipoUsuario);
       //TFormTipoUsuario(AForm).NavegadorButtonAction((TFormTipoUsuario(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTipoUsuario(AForm) = nil, 'FormTipoUsuario no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTipoDocumento);
       //TFormTipoDocumento(AForm).NavegadorButtonAction((TFormTipoDocumento(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTipoDocumento(AForm) = nil, 'FormTipoDocumento no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormVentaPedidos);
       //TFormVentaPedidos(AForm).NavegadorButtonAction((TFormVentaPedidos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormVentaPedidos(AForm) = nil, 'FormVentaPedidos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormContadores);
       //TFormContadores(AForm).NavegadorButtonAction((TFormContadores(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormContadores(AForm) = nil, 'FormContadores no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormAgentes);
       //TFormAgentes(AForm).NavegadorButtonAction((TFormAgentes(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormAgentes(AForm) = nil, 'FormAgentes no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormColocadores);
       //TFormColocadores(AForm).NavegadorButtonAction((TFormColocadores(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormColocadores(AForm) = nil, 'FormColocadores no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormUnidadesEjecucion);
       //TFormUnidadesEjecucion(AForm).BtnCerrar.Click;
       //FreeAndNil(AForm);
       //Check(TFormUnidadesEjecucion(AForm) = nil, 'FormUnidadesEjecucion no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormCertifColocadores);
       //TFormCertifColocadores(AForm).NavegadorButtonAction((TFormCertifColocadores(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormCertifColocadores(AForm) = nil, 'FormCertifColocadores no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormPagares);
       //TFormPagares(AForm).NavegadorButtonAction((TFormPagares(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormPagares(AForm) = nil, 'FormPagares no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTipoEfecto);
       //TFormTipoEfecto(AForm).NavegadorButtonAction((TFormTipoEfecto(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTipoEfecto(AForm) = nil, 'FormTipoEfecto no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormUnidsMedida);
       //TFormUnidsMedida(AForm).NavegadorButtonAction((TFormUnidsMedida(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormUnidsMedida(AForm) = nil, 'FormUnidsMedida no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormAcercaDe);
       //TFormAcercaDe(AForm).BtnCerrar.Click;
       //FreeAndNil(AForm);
       //Check(TFormAcercaDe(AForm) = nil, 'FormAcercaDe no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormNavIntranet);
       //TFormNavIntranet(AForm).Close;
       //FreeAndNil(AForm);
       //Check(TFormNavIntranet(AForm) = nil, 'FormNavIntranet no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormProformasColocacion);
       //TFormProformasColocacion(AForm).NavegadorButtonAction((TFormProformasColocacion(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormProformasColocacion(AForm) = nil, 'FormProformasColocacion no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormCuentasBancarias);
       //TFormCuentasBancarias(AForm).NavegadorButtonAction((TFormCuentasBancarias(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormCuentasBancarias(AForm) = nil, 'FormCuentasBancarias no se cerró adecuadamente.');
       //
       //{Con este hay un problema, debido posiblemente a no peder conectar}
       ////AForm := ccGetInsertedForm(FormTestMainForm, TFormRemoteDesktop);
       ////TFormRemoteDesktop(AForm).Close;
       ////FreeAndNil(AForm);
       ////Check(TFormRemoteDesktop(AForm) = nil, 'FormRemoteDesktop no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaVntPedidos);
       //TFormConsultaVntPedidos(AForm).NavegadorButtonAction((TFormConsultaVntPedidos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaVntPedidos(AForm) = nil, 'FormConsultaVntPedidos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFacturasVenta);
       //TFormFacturasVenta(AForm).NavegadorButtonAction((TFormFacturasVenta(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFacturasVenta(AForm) = nil, 'FormFacturasVenta no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaCertificaciones);
       //TFormConsultaCertificaciones(AForm).NavegadorButtonAction((TFormConsultaCertificaciones(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaCertificaciones(AForm) = nil, 'FormConsultaCertificaciones no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaProformas);
       //TFormConsultaProformas(AForm).NavegadorButtonAction((TFormConsultaProformas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaProformas(AForm) = nil, 'FormConsultaProformas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormContactos);
       //TFormContactos(AForm).NavegadorButtonAction((TFormContactos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormContactos(AForm) = nil, 'FormContactos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormEjecutadorConsultas);
       //TFormEjecutadorConsultas(AForm).BtnCerrar.Click;
       //FreeAndNil(AForm);
       //Check(TFormEjecutadorConsultas(AForm) = nil, 'FormEjecutadorConsultas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormSeguimientoObra);
       //TFormSeguimientoObra(AForm).Close;
       //FreeAndNil(AForm);
       //Check(TFormSeguimientoObra(AForm) = nil, 'FormSeguimientoObra no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFormulas);
       //TFormFormulas(AForm).NavegadorButtonAction((TFormFormulas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFormulas(AForm) = nil, 'FormFormulas no se cerró adecuadamente.');
       //
       //{ Este tiene un problema, pero no se está utilizando, de modo que lo ignoramos }
       ////AForm := ccGetInsertedForm(FormTestMainForm, TFormComponentes);
       ////TFormComponentes(AForm).NavegadorButtonAction((TFormComponentes(AForm)), nrClose);
       ////FreeAndNil(AForm);
       ////Check(TFormComponentes(AForm) = nil, 'FormComponentes no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormProveedores);
       //TFormProveedores(AForm).NavegadorButtonAction((TFormProveedores(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormProveedores(AForm) = nil, 'FormProveedores no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormComprasPedidos);
       //TFormComprasPedidos(AForm).NavegadorButtonAction((TFormComprasPedidos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormComprasPedidos(AForm) = nil, 'FormComprasPedidos no se cerró adecuadamente.');
       //
       ////AForm := ccGetInsertedForm(FormTestMainForm, TFormConfigProducto);
       ////TFormConfigProducto(AForm).NavegadorButtonAction((TFormConfigProducto(AForm)), nrClose);
       ////FreeAndNil(AForm);
       ////Check(TFormConfigProducto(AForm) = nil, 'FormConfigProducto no se cerró adecuadamente.');
       //
       ////AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaComponentes);
       ////TFormConsultaComponentes(AForm).NavegadorButtonAction((TFormConsultaComponentes(AForm)), nrClose);
       ////FreeAndNil(AForm);
       ////Check(TFormConsultaComponentes(AForm) = nil, 'FormConsultaComponentes no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaVntPedidosPremarcos);
       //TFormConsultaVntPedidosPremarcos(AForm).NavegadorButtonAction((TFormConsultaVntPedidosPremarcos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaVntPedidosPremarcos(AForm) = nil, 'FormConsultaVntPedidosPremarcos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormSeriesCompraVenta);
       //TFormSeriesCompraVenta(AForm).NavegadorButtonAction((TFormSeriesCompraVenta(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormSeriesCompraVenta(AForm) = nil, 'FormSeriesCompraVenta no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormPlantillas);
       //TFormPlantillas(AForm).NavegadorButtonAction((TFormPlantillas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormPlantillas(AForm) = nil, 'FormPlantillas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormCompraFacturas);
       //TFormCompraFacturas(AForm).NavegadorButtonAction((TFormCompraFacturas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormCompraFacturas(AForm) = nil, 'FormCompraFacturas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormAlbaranesPremarcos);
       //TFormAlbaranesPremarcos(AForm).NavegadorButtonAction((TFormAlbaranesPremarcos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormAlbaranesPremarcos(AForm) = nil, 'FormAlbaranesPremarcos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaFacturasEmitidas);
       //TFormConsultaFacturasEmitidas(AForm).NavegadorButtonAction((TFormConsultaFacturasEmitidas(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaFacturasEmitidas(AForm) = nil, 'FormConsultaFacturasEmitidas no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormConsultaFacturasCompra);
       //TFormConsultaFacturasCompra(AForm).NavegadorButtonAction((TFormConsultaFacturasCompra(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormConsultaFacturasCompra(AForm) = nil, 'FormConsultaFacturasCompra no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTurnos);
       //TFormTurnos(AForm).NavegadorButtonAction((TFormTurnos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTurnos(AForm) = nil, 'FormTurnos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormPuestosFabrica);
       //TFormPuestosFabrica(AForm).NavegadorButtonAction((TFormPuestosFabrica(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormPuestosFabrica(AForm) = nil, 'FormPuestosFabrica no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTurnosFecha);
       //TFormTurnosFecha(AForm).NavegadorButtonAction((TFormTurnosFecha(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTurnosFecha(AForm) = nil, 'FormTurnosFecha no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFamiliasPedido);
       //TFormFamiliasPedido(AForm).NavegadorButtonAction((TFormFamiliasPedido(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFamiliasPedido(AForm) = nil, 'FormFamiliasPedido no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormSituacionesPago);
       //TFormSituacionesPago(AForm).NavegadorButtonAction((TFormSituacionesPago(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormSituacionesPago(AForm) = nil, 'FormSituacionesPago no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTurnosSemana);
       //TFormTurnosSemana(AForm).NavegadorButtonAction((TFormTurnosSemana(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTurnosSemana(AForm) = nil, 'FormTurnosSemana no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormCargaPorPuesto);
       //TFormCargaPorPuesto(AForm).NavegadorButtonAction((TFormCargaPorPuesto(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormCargaPorPuesto(AForm) = nil, 'FormCargaPorPuesto no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormFamiliaProduccion);
       //TFormFamiliaProduccion(AForm).NavegadorButtonAction((TFormFamiliaProduccion(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormFamiliaProduccion(AForm) = nil, 'FormFamiliaProduccion no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormTipoComponente);
       //TFormTipoComponente(AForm).NavegadorButtonAction((TFormTipoComponente(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormTipoComponente(AForm) = nil, 'FormTipoComponente no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormRutaFabricacion);
       //TFormRutaFabricacion(AForm).NavegadorButtonAction((TFormRutaFabricacion(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormRutaFabricacion(AForm) = nil, 'FormRutaFabricacion no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormLotesDeCompra);
       //TFormLotesDeCompra(AForm).NavegadorButtonAction((TFormLotesDeCompra(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormLotesDeCompra(AForm) = nil, 'FormLotesDeCompra no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormProgramacionFabrica);
       //TFormProgramacionFabrica(AForm).NavegadorButtonAction((TFormProgramacionFabrica(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormProgramacionFabrica(AForm) = nil, 'FormProgramacionFabrica no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormVisadoTecnicoPedidos);
       //TFormProgramacionFabrica(AForm).NavegadorButtonAction((TFormVisadoTecnicoPedidos(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormVisadoTecnicoPedidos(AForm) = nil, 'FormVisadoTecnicoPedidos no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormPartesTrabajoPorPuesto);
       //TFormPartesTrabajoPorPuesto(AForm).NavegadorButtonAction((TFormPartesTrabajoPorPuesto(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormPartesTrabajoPorPuesto(AForm) = nil, 'FormPartesTrabajoPorPuesto no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormRecepcionMateriales);
       //TFormRecepcionMateriales(AForm).NavegadorButtonAction((TFormRecepcionMateriales(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormRecepcionMateriales(AForm) = nil, 'FormRecepcionMateriales no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormPlanCarga);
       //TFormPlanCarga(AForm).NavegadorButtonAction((TFormPlanCarga(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormPlanCarga(AForm) = nil, 'FormPlanCarga no se cerró adecuadamente.');
       //
       //AForm := ccGetInsertedForm(FormTestMainForm, TFormControlFabricacion);
       //TFormControlFabricacion(AForm).NavegadorButtonAction((TFormControlFabricacion(AForm)), nrClose);
       //FreeAndNil(AForm);
       //Check(TFormControlFabricacion(AForm) = nil, 'FormControlFabricacion no se cerró adecuadamente.');
       
       //HojaNecesidades             in 'HojaNecesidades.pas' {FormHojaNecesidades},
       //EstadoFabricPedido          in 'Consultas\EstadoFabricPedido.pas' {FormEstadoFabricPedido},
       //GeneraProformasColocacion   in 'GeneraProformasColocacion.pas' {FormGeneraProformasColocacion},
       //GetFacturaColocador         in 'GetFacturaColocador.pas' {FormGetFacturaColocador},
       //EditarListado               in 'Sistema\EditarListado.pas' {FormEditarListado},
       //EditarCarpeta               in 'Sistema\EditarCarpeta.pas' {FormEditarCarpeta},
       //OrgListados                 in 'Sistema\OrgListados.pas' {FormOrgListados},
       //EditarGrupo                 in 'Sistema\EditarGrupo.pas' {FormEditarGrupo},
       //BuscaObras                  in 'Busquedas\BuscaObras.pas' {FormBuscaObras},
       //BuscaCertifColocador        in 'Busquedas\BuscaCertifColocador.pas' {FormBuscaCertifColocador},
       //BuscaClientes               in 'Busquedas\BuscaClientes.pas' {FormBuscaClientes},
       //BuscaProformaColocacion     in 'Busquedas\BuscaProformaColocacion.pas' {FormBuscaProformaColocacion},
       //LinFichasObra               in 'LinFichasObra.pas' {FormLinFichasObra},
       //LinDocumentosObra           in 'LinDocumentosObra.pas' {FormLinDocumentosObra},
       //LinDocumentosCliente        in 'LinDocumentosCliente.pas' {FormLinDocumentosCliente},
       //LinDocumentosObraCliente    in 'LinDocumentosObraCliente.pas' {FormLinDocumentosObraCliente},
       //LinDocumentosColocador      in 'LinDocumentosColocador.pas' {FormLinDocumentosColocador},
       //LinPlanObra                 in 'LinPlanObra.pas' {FormLinPlanObra},
       //AutoLinPlanObra             in 'AutoLinPlanObra.pas' {FormAutoLinPlanObra},
       //FichaArticulo               in 'FichaArticulo.pas' {FormFichaArticulo},
       //VariablePlantilla           in 'VariablePlantilla.pas' {FormVariablePlantilla},
       //ShowReports                 in 'Sistema\ShowReports.pas' {FormShowReports},
       //PreInformeAdjudicaciones    in 'PreInformes\PreInformeAdjudicaciones.pas' {FormPreInformeAdjudicaciones},
       //ListaJefesdeObraJher        in 'ListaJefesdeObraJher.pas' {FormListaJefesdeObraJher},
       //LinUnidadEjecucion          in 'LinUnidadEjecucion.pas' {FormLinUnidadEjecucion},
       //LinCertifColocador          in 'LinCertifColocador.pas' {FormLinCertifColocador},
       //ReconcError                 in 'ReconcError.pas' {FormReconcileError},
       //GetDatosPagare              in 'GetDatosPagare.pas' {FormGetDatosPagare},
       //ListaPlantillas             in 'ListaPlantillas.pas' {FormListaPlantillas},
       //BuscaObraCliente            in 'Busquedas\BuscaObraCliente.pas' {FormBuscaObraCliente},
       //PideFecha                   in 'PideFecha.pas' {FormPideFecha},
       //LecturaConfirmada           in 'LecturaConfirmada.pas' {FormLecturaConfirmada},
       //LinVentaPedidos             in 'LinVentaPedidos.pas' {FormLinVentaPedidos},
       //BuscaVentaPedidos           in 'Busquedas\BuscaVentaPedidos.pas' {FormBuscaVentaPedidos},
       //ListaSeleccion              in 'ListaSeleccion.pas' {FormListaSeleccion},
       //BuscaVentaFacturas          in 'Busquedas\BuscaVentaFacturas.pas' {FormBuscaVentaFacturas},
       //BuscaColocadores            in 'Busquedas\BuscaColocadores.pas' {FormBuscaColocadores},
       //BuscaComponentes            in 'Busquedas\BuscaComponentes.pas' {FormBuscaComponentes},
       //LinVentaPedidosPremarcos    in 'LinVentaPedidosPremarcos.pas' {FormLinVentaPedidosPremarcos},
       //BuscaProveedores            in 'Busquedas\BuscaProveedores.pas' {FormBuscaProveedores},
       //LinComprasPedidos           in 'LinComprasPedidos.pas' {FormLinComprasPedidos},
       //BuscaConfiguraciones        in 'Busquedas\BuscaConfiguraciones.pas' {FormBuscaConfiguraciones},
       //BuscaUnidadesEjecucion      in 'Busquedas\BuscaUnidadesEjecucion.pas' {FormBuscaUnidadesEjecucion},
       //EditProducto                in 'EditProducto.pas' {FormEditProducto},
       //InformeCalidadColocacion    in 'PreInformes\InformeCalidadColocacion.pas' {FormInformeCalidadColocacion},
       //BuscaContactos              in 'Busquedas\BuscaContactos.pas' {FormBuscaContactos},
       //LinDocumentosRiesgoCliente  in 'LinDocumentosRiesgoCliente.pas' {FormLinDocumentosRiesgoCliente},
       //EditLinComposicion          in 'EditLinComposicion.pas' {FormEditLinComposicion},
       //BuscaTreeViewComponentes    in 'Busquedas\BuscaTreeViewComponentes.pas' {FormTreeViewComponentes},
       //BuscaProductos              in 'Busquedas\BuscaProductos.pas' {FormBuscaProductos},
       //DocCliente                  in 'DocCliente.pas' {FormDocCliente},
       //DocRiesgo                   in 'DocRiesgo.pas' {FormDocRiesgo},
       //DocObraCliente              in 'DocObraCliente.pas' {FormDocObraCliente},
       //DocObraAdjudicada           in 'DocObraAdjudicada.pas' {FormDocObraAdjudicada},
       //DocColocador                in 'DocColocador.pas' {FormDocColocador},
       //BuscaEmpleados              in 'Busquedas\BuscaEmpleados.pas' {FormBuscaEmpleados},
       //LineasPedidosProgram        in 'LineasPedidosProgram.pas' {FormLineasPedidosProgram},
       //LinDespieceProgram          in 'LinDespieceProgram.pas' {FormLinDespieceProgram},
       //BuscaPedidosCompra          in 'Busquedas\BuscaPedidosCompra.pas' {FormBuscaPedidosCompra},
       //BuscaObraVisitadaCliente    in 'Busquedas\BuscaObraVisitadaCliente.pas' {FormBuscaObraVisitadaCliente},
       //LinPagare                   in 'LinPagare.pas' {FormLinPagare},
       //IntroImportesFactura        in 'IntroImportesFactura.pas' {FormIntroImportesFactura},
       //BuscaEntidadBancaria        in 'Busquedas\BuscaEntidadBancaria.pas' {FormBuscaEntidadBancaria},
       //LinVentaFacturas            in 'LinVentaFacturas.pas' {FormLinVentaFacturas},
       //DocUsuario                  in 'DocUsuario.pas' {FormDocUsuario},
       //DocFacturas                 in 'DocFacturas.pas' {FormDocFacturas},
       //GenerarPagaresFacturaCompra in 'GenerarPagaresFacturaCompra.pas' {FormGenerarPagaresFacturasCompra},
       //BuscaCompraFacturas         in 'Busquedas\BuscaCompraFacturas.pas' {FormBuscaCompraFacturas},
       //PreInformePrevisionObrasAdjudicadas in 'PreInformes\PreInformePrevisionObrasAdjudicadas.pas' {FormPreInformePrevisionObrasAdjudicadas},
       //ModificaRuta                in 'ModificaRuta.pas' {FormModificaRuta},
       //LinVPComponente             in 'LinVPComponente.pas' {FormLinVPComponente},
       //PreInformePrevisiones       in 'PreInformes\PreInformePrevisiones.pas' {FormPreInformePrevisiones},
       //BuscaPedidosNoProgramados   in 'Busquedas\BuscaPedidosNoProgramados.pas' {FormBuscaPedidosNoProgramados},
       //InsertaLineasProgramFab     in 'InsertaLineasProgramFab.pas' {FormInsertaLineasProgramFab},
       //BuscaPedidosConformeSi      in 'Busquedas\BuscaPedidosConformeSi.pas' {FormBuscaPedidosConformeSi},
       //AsignaMedidasCercoVisto     in 'VentanasModales\AsignaMedidasCercoVisto.pas' {FormAsignaMedidasCercoVisto},
       //LinVPHojaNecesidades        in 'LinVPHojaNecesidades.pas' {FormLinVPHojaNecesidades},
       //AsignaMedidasJambasCompra   in 'VentanasModales\AsignaMedidasJambasCompra.pas' {FormAsignaMedidasJambasCompra},
       //GestionCompraMatPrima       in 'VentanasModales\GestionCompraMatPrima.pas' {FormGestionCompraMatPrima},
       //PreInformePlanCarga         in 'PreInformes\PreInformePlanCarga.pas' {FormPreInformePlanCarga},
       //DetallePlanCarga            in 'DetallePlanCarga.pas' {FormDetallePlanCarga},
       { Forms Auxiliares. Dependen de otros}
       //BugLinea in 'Sistema\BugLinea.pas' {FormBugLinea},
       //PreInformeAdjudicacionesDelegaciones in 'PreInformes\PreInformeAdjudicacionesDelegaciones.pas' {FormPreInformeAdjudicacionesDelegaciones},

   finally //FormPrincipal.Hide;
   end;
end;

initialization
  TestFramework.RegisterTest(TTCDataBase.Suite);
end.


