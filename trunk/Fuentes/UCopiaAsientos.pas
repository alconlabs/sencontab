unit UCopiaAsientos;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBSQL, IBTableSet, jpeg,
     Mask, Messages, OvcBase, OvcDbNF, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes,
     wwclearpanel, wwdbdatetimepicker, wwdblook, Wwkeycb, wwSpeedButton, CustomView;

type
   TWCopiaAsientos = class(TCustomView)
      OvcController1:  TOvcController;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      Datos:           TGroupBox;
      Label20:         TLabel;
      Label24:         TLabel;
      Label25:         TLabel;
      eFechaDesde:     TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      Label3:          TLabel;
      Label1:          TLabel;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTAHasta: TwwDBLookupCombo;
      Label2:          TLabel;
      FiltroAsientoDesde: TOvcDbNumericField;
      FiltroAsientoHasta: TOvcDbNumericField;
      GbDestino:       TGroupBox;
      eEmpresa:        TwwDBLookupCombo;
      Label4:          TLabel;
      Label5:          TLabel;
      sFiltro:         TDataSource;
      QFiltro:         TClientDataSet;
      DBEmpresa:       TIBDatabase;
      Transaccion:     TIBTransaction;
      QEmpresas:       TIBTableSet;
      QEmpresasNOMBRE: TIBStringField;
      QEmpresasCERRADA: TIBStringField;
      QEmpresasCLAVE:  TIBStringField;
      QEmpresasUBICACION: TIBStringField;
      QEmpresasID_EMPRESA: TIntegerField;
      QEmpresasULTIMA: TIBStringField;
      QEmpresasSERVIDOR: TIBStringField;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
   private
   public
   end;

var WCopiaAsientos: TWCopiaAsientos;

implementation
uses Cadenas, DM, DMConta, DMControl, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWCopiaAsientos.BtnEdtProcesarClick(Sender: TObject);
var
   Caratula: TEspere;
   QInsertaDiario, QBuscaSubcuenta, QInsertaSubcuenta, QBuscaSubcuentaActual: TIBSql;
   QBuscaAnalitica, QInsertaAnalitica, QBuscaConcepto, QInsertaConcepto: TIbSql;
   QBuscaAnaliticaActual, QBuscaConceptoActual: TIbSql;
   nAsiento, nAsientoEmpresa: Integer;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if Qfiltro.FieldByName('empresa').AsInteger = 0 then begin
      eEmpresa.SetFocus;
      DatabaseError('Debe seleccionar una empresa de destino');
   end;

   Caratula := TEspere.Create(nil);
   Caratula.Mensaje      := 'Copiando asientos ...';
   Caratula.Ancho        := 300;
   Caratula.Alto         := 150;
   Caratula.Avi_Left     := 20;
   Caratula.Avi_Top      := 80;
   Caratula.Fuente.Color := clWhite;
   Caratula.Fuente.Name  := 'Arial';
   Caratula.Fuente.Size  := 14;
   Caratula.Mensaje_Left := 14;
   Caratula.Mensaje_Top  := 14;
   Caratula.Avi_Color    := $00A56D39;
   Caratula.ColorFondo   := $00A56D39;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   // Seleccionar bd de empresa de destino
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSql.Create(nil), sql do begin
      Close;
      Database := DMControlRef.BDControl;
      Add('SELECT ubicacion,servidor From empresas');
      Add('WHERE id_empresa=:id_empresa');
      parambyname('id_empresa').AsInteger := QFiltro.FieldByName('Empresa').AsInteger;
      ExecQuery;
      // Activar BD
      Transaccion.active  := False;
      DBEmpresa.connected := False;

      DbEmpresa.params.Clear;
      Dbempresa.params.add('user_name=SYSDBA');
      DbEmpresa.params.add('password=masterkey');
      if empty(FieldByName('Servidor').AsString) then   begin
         DbEmpresa.DatabaseName := FieldByName('Ubicacion').AsString;
      end
      else begin
         DbEmpresa.DatabaseName := Trim(FieldByName('Servidor').AsString) + ':' +
            Trim(FieldByName('Ubicacion').AsString);
      end;
      DBEmpresa.connected := True;
      Transaccion.active  := True;
      Close;
      Free;
   end;

   QInsertaDiario := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaDiario, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
   end;

   QBuscaSubcuenta := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuenta, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('select count(*) as cuantos from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;

   QBuscaSubcuentaActual := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuentaActual, Sql do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('select descripcion,nif from subctas');
      Add(' where subcuenta=:subcuenta');
      prepare;
   end;

   QInsertaSubcuenta := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaSubcuenta, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('insert into subctas(subcuenta,descripcion,arrendador,profesional,obsoleto,nif)');
      Add('   values(:subcuenta,:descripcion,"N","N","N",:nif)');
      prepare;
   end;

   QBuscaAnalitica := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaAnalitica, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('select count(*) as cuantos from analiticas');
      Add(' where cuenta=:cuenta');
      prepare;
   end;

   QBuscaAnaliticaActual := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaAnaliticaActual, Sql do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('select nombre from analiticas');
      Add(' where cuenta=:cuenta');
      prepare;
   end;

   QInsertaAnalitica := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaAnalitica, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('insert into analiticas(cuenta,nombre)');
      Add('   values(:cuenta,:nombre)');
      prepare;
   end;

   QBuscaConcepto := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaConcepto, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('select count(*) as cuantos from conceptos');
      Add(' where id_conceptos=:id_conceptos');
      prepare;
   end;

   QBuscaConceptoActual := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaConceptoActual, Sql do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('select * from conceptos');
      Add(' where id_conceptos=:id_conceptos');
      prepare;
   end;

   QInsertaConcepto := TIBSql.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaConcepto, Sql do begin
      Close;
      Clear;
      Database := DBEmpresa;
      Add('insert into conceptos(id_conceptos,descripcion,tipocontabilidad,tipoconcepto,obsoleto)');
      Add('   values(:subcuenta,:descripcion,:tipocontabilidad,:tipoconcepto,"N")');
      prepare;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      if not empty(FieldByName('Subcuenta_Desde').AsString) then  begin
         if not (state in dseditmodes) then begin
            edit;
         end;
         if empty(FieldByName('subcuenta_hasta').AsString) then   begin
            FieldByName('Subcuenta_Hasta').AsString := FieldByName('subcuenta_desde').AsString;
         end;
         if length(Trim(FieldByName('subcuenta_desde').AsString)) < gvlongitudsubcuenta then   begin
            FieldByName('subcuenta_desde').AsString :=
               BackChar(FieldByName('subcuenta_desde').AsString, '0', gvlongitudsubcuenta);
         end;
         if length(Trim(FieldByName('subcuenta_hasta').AsString)) < gvlongitudsubcuenta then   begin
            FieldByName('subcuenta_hasta').AsString :=
               BackChar(FieldByName('subcuenta_hasta').AsString, '0', gvlongitudsubcuenta);
         end;
         Post;
      end;
   end;

   nAsientoEmpresa := -99;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('select * from diario where asiento>=:Asiento1 and asiento<=:asiento2 and');
      Add('  Fecha>=:Fecha1 and Fecha<=:Fecha2 ');
      if not empty(QFiltro.FieldByName('Subcuenta_Desde').AsString) then  begin
         Add(' and subcuenta>=:Subcuenta1 and subcuenta<=:Subcuenta2 ');
         Params.ByName('Subcuenta1').AsString :=
            QFiltro.FieldByName('Subcuenta_Desde').AsString;
         Params.ByName('Subcuenta2').AsString :=
            QFiltro.FieldByName('Subcuenta_Hasta').AsString;
      end;
      Params.ByName('Asiento1').AsInteger :=
         QFiltro.FieldByName('AsientoDesde').AsInteger;
      Params.ByName('Asiento2').AsInteger :=
         QFiltro.FieldByName('AsientoHasta').AsInteger;
      Params.ByName('Fecha1').AsDateTime  :=
         QFiltro.FieldByName('FechaDesde').AsDateTime;
      Params.ByName('Fecha2').AsDateTime  :=
         QFiltro.FieldByName('FechaHasta').AsDateTime;
      ExecQuery;
      while not EOF do begin
         // Confirmar existencia Subcuenta en empresa destino
         QBuscaSubcuenta.Close;
         QBuscaSubcuenta.parambyname('subcuenta').AsString := FieldByName('Subcuenta').AsString;
         QBuscaSubcuenta.ExecQuery;
         if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then   begin
            // Buscar subcuenta en empresa actual
            QBuscaSubcuentaActual.Close;
            QBuscaSubcuentaActual.parambyname('subcuenta').AsString := FieldByName('Subcuenta').AsString;
            QBuscaSubcuentaActual.ExecQuery;
            // Insertar subcuenta en empresa destino
            QInsertaSubcuenta.Close;
            QInsertaSubcuenta.parambyname('subcuenta').AsString   := FieldByName('Subcuenta').AsString;
            QInsertaSubcuenta.parambyname('nif').AsString         :=
               QBuscaSubcuentaActual.FieldByName('nif').AsString;
            QInsertaSubcuenta.parambyname('descripcion').AsString :=
               QBuscaSubcuentaActual.FieldByName('descripcion').AsString;
            QInsertaSubcuenta.ExecQuery;
            QInsertaSubcuenta.Transaction.CommitRetaining;
         end;

         // Confirmar existencia Concepto en empresa destino
         QBuscaConcepto.Close;
         QBuscaConcepto.parambyname('id_conceptos').AsString :=
            FieldByName('id_conceptos').AsString;
         QBuscaConcepto.ExecQuery;
         if not (QBuscaConcepto.FieldByName('cuantos').AsInteger > 0) then   begin
            // Buscar concepto en empresa actual
            QBuscaConceptoActual.Close;
            QBuscaConceptoActual.parambyname('id_conceptos').AsString :=
               FieldByName('id_conceptos').AsString;
            QBuscaConceptoActual.ExecQuery;
            // Insertar concepto en empresa destino
            QInsertaConcepto.Close;
            QInsertaConcepto.parambyname('id_conceptos').AsString     :=
               FieldByName('id_conceptos').AsString;
            QInsertaConcepto.parambyname('descripcion').AsString      :=
               QBuscaConceptoActual.FieldByName('descripcion').AsString;
            QInsertaConcepto.parambyname('tipocontabilidad').AsString :=
               QBuscaConceptoActual.FieldByName('tipocontabilidad').AsString;
            QInsertaConcepto.parambyname('tipoconcepto').AsString     :=
               QBuscaConceptoActual.FieldByName('tipoconcepto').AsString;
            QInsertaConcepto.ExecQuery;
            QInsertaConcepto.Transaction.CommitRetaining;
         end;

         if not empty(FieldByName('contrapartida').AsString) then   begin
            // Confirmar existencia Contrapartida en empresa destino
            QBuscaSubcuenta.Close;
            QBuscaSubcuenta.parambyname('subcuenta').AsString :=
               FieldByName('contrapartida').AsString;
            QBuscaSubcuenta.ExecQuery;
            if not (QBuscaSubcuenta.FieldByName('cuantos').AsInteger > 0) then   begin
               // Buscar subcuenta/contrapartida en empresa actual
               QBuscaSubcuentaActual.Close;
               QBuscaSubcuentaActual.parambyname('subcuenta').AsString :=
                  FieldByName('contrapartida').AsString;
               QBuscaSubcuentaActual.ExecQuery;
               // Insertar subcuenta/contrapartida en empresa destino
               QInsertaSubcuenta.Close;
               QInsertaSubcuenta.parambyname('subcuenta').AsString   := FieldByName('Contrapartida').AsString;
               QInsertaSubcuenta.parambyname('descripcion').AsString :=
                  QBuscaSubcuentaActual.FieldByName('descripcion').AsString;
               QInsertaSubcuenta.ExecQuery;
               QInsertaSubcuenta.Transaction.CommitRetaining;
            end;
         end;

         if not empty(FieldByName('cuenta_analitica').AsString) then   begin
            // Confirmar existencia Cuenta Analitica en empresa destino
            QBuscaAnalitica.Close;
            QBuscaAnalitica.parambyname('cuenta').AsString :=
               FieldByName('cuenta_analitica').AsString;
            QBuscaAnalitica.ExecQuery;
            if not (QBuscaAnalitica.FieldByName('cuantos').AsInteger > 0) then   begin
               // Buscar cuenta analitica en empresa actual
               QBuscaAnaliticaActual.Close;
               QBuscaAnaliticaActual.parambyname('cuenta').AsString :=
                  FieldByName('cuenta_analitica').AsString;
               QBuscaAnaliticaActual.ExecQuery;
               // Insertar cuenta analitica en empresa destino
               QInsertaAnalitica.Close;
               QInsertaAnalitica.parambyname('cuenta').AsString :=
                  FieldByName('Cuenta_analitica').AsString;
               QInsertaAnalitica.parambyname('nombre').AsString :=
                  QBuscaAnaliticaActual.FieldByName('nombre').AsString;
               QInsertaAnalitica.ExecQuery;
               QInsertaAnalitica.Transaction.CommitRetaining;
            end;
         end;
         // Insertar diario
         QInsertaDiario.Close;
         QInsertaDiario.Sql.Clear;
         QInsertaDiario.Sql.Add('insert into Diario(APUNTE,ASIENTO,BASEIMPONIBLE,COMENTARIO,');
         QInsertaDiario.Sql.Add(' DEBEHABER,FECHA,IMPORTE,IVA,NIF,MONEDA,NUMEROFACTURA,');
         QInsertaDiario.Sql.Add(' RECARGO,SUBCUENTA,ID_CONCEPTOS,TIPOASIENTO,EJERCICIO,SERIE');
         if not empty(FieldByName('contrapartida').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,CONTRAPARTIDA ');
         end;
         if not empty(FieldByName('tipodiario').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,TIPODIARIO ');
         end;
         if not empty(FieldByName('cuenta_analitica').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,CUENTA_ANALITICA ');
         end;
         QInsertaDiario.Sql.Add(' ,CUOTAIVA,CUOTARECARGO) ');
         QInsertaDiario.Sql.Add('values(:APUNTE,:ASIENTO,:BASEIMPONIBLE,:COMENTARIO,');
         QInsertaDiario.Sql.Add(' :DEBEHABER,:FECHA,:IMPORTE,:IVA,:NIF,:MONEDA,:NUMEROFACTURA,');
         QInsertaDiario.Sql.Add(' :RECARGO,:SUBCUENTA,:ID_CONCEPTOS,:TIPOASIENTO,:EJERCICIO,:SERIE');
         if not empty(FieldByName('contrapartida').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,:CONTRAPARTIDA ');
         end;
         if not empty(FieldByName('tipodiario').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,:TIPODIARIO ');
         end;
         if not empty(FieldByName('cuenta_analitica').AsString) then   begin
            QInsertaDiario.Sql.Add(' ,:CUENTA_ANALITICA ');
         end;
         QInsertaDiario.Sql.Add(' ,:CUOTAIVA,:CUOTARECARGO) ');
         if FieldByName('Asiento').AsInteger <> nAsientoEmpresa then   begin
            nAsientoEmpresa := FieldByName('Asiento').AsInteger;
            nAsiento        := DMContaRef.ObtenerNumeroAsientoOtraBD(dbEmpresa);
         end;
         QInsertaDiario.parambyname('asiento').AsInteger     := nAsiento;
         QInsertaDiario.parambyname('apunte').AsInteger      := FieldByName('apunte').AsInteger;
         QInsertaDiario.parambyname('baseimponible').AsFloat :=
            FieldByName('baseimponible').AsFloat;
         QInsertaDiario.parambyname('tipoasiento').AsInteger := FieldByName('tipoasiento').AsInteger;
         QInsertaDiario.parambyname('ejercicio').AsInteger   := FieldByName('ejercicio').AsInteger;
         QInsertaDiario.parambyname('serie').AsString        := FieldByName('serie').AsString;
         QInsertaDiario.parambyname('comentario').AsString   := FieldByName('comentario').AsString;
         QInsertaDiario.parambyname('debehaber').AsString    := FieldByName('debehaber').AsString;
         QInsertaDiario.parambyname('fecha').AsDateTime      := FieldByName('fecha').AsDateTime;
         QInsertaDiario.parambyname('importe').AsFloat       := FieldByName('importe').AsFloat;
         QInsertaDiario.parambyname('iva').AsFloat           := FieldByName('iva').AsFloat;
         QInsertaDiario.parambyname('nif').AsString          := FieldByName('nif').AsString;
         QInsertaDiario.parambyname('moneda').AsString       := FieldByName('moneda').AsString;
         QInsertaDiario.parambyname('numerofactura').AsString :=
            FieldByName('numerofactura').AsString;
         QInsertaDiario.parambyname('recargo').AsFloat       := FieldByName('recargo').AsFloat;
         QInsertaDiario.parambyname('subcuenta').AsString    :=
            FieldByName('subcuenta').AsString;
         QInsertaDiario.parambyname('id_conceptos').AsString :=
            FieldByName('id_conceptos').AsString;
         QInsertaDiario.parambyname('cuotaiva').AsFloat      := FieldByName('cuotaiva').AsFloat;
         QInsertaDiario.parambyname('cuotarecargo').AsFloat  := FieldByName('cuotarecargo').AsFloat;
         if not empty(FieldByName('contrapartida').AsString) then   begin
            QInsertaDiario.parambyname('contrapartida').AsString :=
               FieldByName('contrapartida').AsString;
         end;
         if not empty(FieldByName('tipodiario').AsString) then   begin
            QInsertaDiario.parambyname('tipodiario').AsString :=
               FieldByName('tipodiario').AsString;
         end;
         if not empty(FieldByName('cuenta_analitica').AsString) then   begin
            QInsertaDiario.parambyname('cuenta_analitica').AsString :=
               FieldByName('cuenta_analitica').AsString;
         end;

         QInsertaDiario.ExecQuery;
         QInsertaDiario.Transaction.CommitRetaining;
         Next;
      end;
      Close;
      Free;
   end;

   // Cerrar ficheros
   Transaccion.active  := False;
   DBEmpresa.connected := False;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaDiario do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaSubcuenta do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuenta do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaSubcuentaActual do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaAnalitica do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaAnaliticaActual do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaAnalitica do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaConceptoActual do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QBuscaConcepto do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsertaConcepto do begin
      Close;
      Free;
   end;

   Caratula.Cerrar;
   Caratula.Free;
   MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
   Close;
end;

procedure TWCopiaAsientos.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCopiaAsientos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWCopiaAsientos.FormShow(Sender: TObject);
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('AsientoDesde', ftInteger, 0, False);
         Add('AsientoHasta', ftInteger, 0, False);
         Add('Empresa', ftInteger, 0, False);
         Add('Subcuenta_Desde', ftString, 10, False);
         Add('Subcuenta_Hasta', ftString, 10, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
      FieldByName('FechaDesde').AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime := dUltimaFecha;
      FieldByName('AsientoDesde').Value    := nPrimerAsiento;
      FieldByName('AsientoHasta').Value    := nUltimoAsiento;
   end;
   eFechaDesde.SetFocus;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QEmpresas, SelectSQL do begin
      Close;
      Clear;
      Add('SELECT * FROM EMPRESAS');
      Add('WHERE ID_EMPRESA <> :ID_EMPRESA');
      Add('ORDER BY NOMBRE');
      ParamByName('ID_EMPRESA').AsInteger := gvEmpresaActual;
      Open;
   end;
end;

procedure TWCopiaAsientos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtCancelar.Click;
      end;
      VK_F3: begin
         BtnEdtProcesar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBDateTimePicker) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBDateTimePicker) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
   end;
end;

procedure TWCopiaAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario     := nil;
   WCopiaAsientos := nil;
end;

procedure TWCopiaAsientos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCopiaAsientos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCopiaAsientos.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
