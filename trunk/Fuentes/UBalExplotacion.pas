unit UBalExplotacion;
interface
uses Buttons, Classes, comctrls, Controls, CheckLst, DB, DBClient, DBCtrls, DBGrids, Dialogs, ExtCtrls,
     fcButton, fcImage, fcimageform, fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBQuery, IBSQL, jpeg, Mask,
     Messages, OvcBase, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, Wwdbcomb,
     wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot, Wwkeycb, wwSpeedButton, CustomView,
     FMTBcd, SqlExpr;

type
   TWBalExplotacion = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      QFiltro:        TClientDataSet;
      SFiltro:        TDataSource;
      GroupBox4:      TGroupBox;
      Label4:         TLabel;
      Label3:         TLabel;
      FechaImprimir:  TwwDBDateTimePicker;
      eMoneda:        TwwDBComboBox;
      oSaldos:        TCheckBox;
      GroupBox1:      TGroupBox;
      Label20:        TLabel;
      Label24:        TLabel;
      Label25:        TLabel;
      eFechaDesde:    TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      RGConcepto:     TDBRadioGroup;
      GroupBox2:      TGroupBox;
      Label6:         TLabel;
      Label7:         TLabel;
      Label8:         TLabel;
      Label9:         TLabel;
      Label10:        TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      eDelegacion:    TwwDBLookupCombo;
      eDepartamento:  TwwDBLookupCombo;
      eSeccion:       TwwDBLookupCombo;
      eProyecto:      TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Panel1:         TPanel;
      GroupBox5:      TGroupBox;
      lbEmpresas:     TCheckListBox;
      gInforme:       TDBRadioGroup;
      Formulario:     TfcImageForm;
      QAnaliticas:    TClientDataSet;
      wwDBLookupCombo3: TwwDBLookupCombo;
      wwDBLookupCombo4: TwwDBLookupCombo;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
   private
      procedure RellenarEmpresas;
   public
   end;

var WBalExplotacion: TWBalExplotacion;

implementation
uses DM, DMConta, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

const
   CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWBalExplotacion.RellenarEmpresas;
begin
   lbEmpresas.Clear;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      {$Message Warn 'Requiere una adaptación a SQL Server'}
      //Database := DmControlRef.BDControl;
      Close;
      Clear;
      Add('SELECT NOMBRE FROM EMPRESAS');
      Add('WHERE ID_EMPRESA <> :ID_EMPRESA');
      Add('ORDER BY NOMBRE');
      ParamByName('ID_EMPRESA').AsInteger := gvEmpresaActual;
      Open;
      while not EOF do begin
         lbEmpresas.Items.Add(FieldByName('NOMBRE').AsString);
         Next;
      end;
      Close;
      Free;
   end;
end;

procedure TWBalExplotacion.BtnEdtProcesarClick(Sender: TObject);
var
   Empresas         :TStringList;
   Caratula         :TEspere;
   nImportes        :Double;
   i                :Integer;
   aMeses           :array[1..12] of Double;
   CuentaAnalitica  :string;
   cCuenta          :string;
   lPrimero         :Boolean;
   nMesIni          :Integer;
   nMesFin          :Integer;
   nValorDif        :Double;
   QSelAnaliticas   :TSQLQuery;
   QCuentas         :TSQLQuery;
   QDiario          :TSQLQuery;
   nIngresosActual  :Double;
   nIngresosAnterior:Double;
   nGastosActual    :Double;
   nGastosAnterior  :Double;
   nIngresos        :Double;
   nGastos          :Double;
   FechaInicial     :TDateTime;
   FechaFinal       :TDateTime;
   FechaImpresion   :TDateTime;
   IndCons          :Integer;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   Caratula := TEspere.Create(nil);
   Caratula.Mensaje      := 'Generando balance ...';
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

   Empresas := TStringList.Create;
   Empresas.Clear;
   for I := 0 to lbEmpresas.Items.Count - 1 do begin
      if lbEmpresas.Checked[I] then   begin
         Empresas.Add(lbEmpresas.Items[I]);
      end;
   end;

   // Selección de datos de cuenta
   QCuentas := TSQLQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT * FROM CUENTAS');
      Add('WHERE CUENTA>=:CUENTA1 AND CUENTA<=:CUENTA2');
      PrepareStatement;
   end;

   // Selección de datos de cuentas analíticas
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAnaliticas do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Cuenta', ftString, 10, False);
         Add('Nombre', ftString, 50, False);
      end;
      CreateDataSet;
      Active := True;
      append;
      edit;
      FieldByName('cuenta').AsString := '';
      FieldByName('nombre').AsString := '';
      post;
   end;

   QSelAnaliticas := TSQLQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSelAnaliticas, SQL do begin
      Close;
      Clear;
      //TODO: Database := DmRef.IBDSiamCont;
      Add('SELECT cuenta,nombre FROM ANALITICAS');
      Add('ORDER BY 1');
      Open;
      while not EOF do begin
         QAnaliticas.Append;
         QAnaliticas.FieldByName('cuenta').AsString := FieldByName('cuenta').AsString;
         QAnaliticas.FieldByName('nombre').AsString := FieldByName('nombre').AsString;
         QAnaliticas.post;
         Next;
      end;
   end;

   lPrimero          := True;
   nIngresosActual   := 0;
   nIngresosAnterior := 0;
   nGastosActual     := 0;
   nGastosAnterior   := 0;


   FechaInicial   := QFiltro.FieldByName('FECHADESDE').AsDateTime;
   FechaFinal     := QFiltro.FieldByName('FECHAHASTA').AsDateTime;
   FechaImpresion := QFiltro.FieldByName('FECHAIMPRIMIR').AsDateTime;
  {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      PonerTipoConta(FieldByName('TipoConcepto').AsString);
      gvMonedaListado := FieldByName('Moneda').AsString;

      nMesIni := Month(FieldByName('FechaDesde').AsDateTime);
      nMesFin := Month(FieldByName('FechaHasta').AsDateTime);

      // Siempre compara con concepto normal que son los que se ponen al cierre
      if oSaldos.Checked then begin
         FieldByName('tipoconcepto').AsString := 'N';
      end;
   end;


   // Selección de datos de diario
   QDiario := TSQLQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT D.SUBCUENTA,SUM(D.IMPORTE) SUMA,D.DEBEHABER, D.CUENTA_ANALITICA');
      if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
         Add(',T.TIPOCONTABILIDAD');
      end;
      Add(' FROM DIARIO D,CONCEPTOS T');
      Add('WHERE D.SUBCUENTA>=:SUBCUENTA1 AND D.SUBCUENTA<=:SUBCUENTA2');
      Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"C" ');
      Add(' AND D.FECHA>=:FECHA1 AND D.FECHA<=:FECHA2');
      Add('GROUP BY D.SUBCUENTA, D.DEBEHABER, D.CUENTA_ANALITICA');
      if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
         Add(',T.TIPOCONTABILIDAD');
      end;
      PrepareStatement;
   end;

   // Carga de datos a partir de Cuentas
   // 1º Carga de 700
   QCuentas.Close;
   QCuentas.parambyname('Cuenta1').AsString := '700';
   QCuentas.parambyname('Cuenta2').AsString := '799';
   QCuentas.Open;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DMContaRef.QInfBalExplo do begin
      EmptyDataset;
      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         while not QCuentas.EOF do begin
            append;
            edit;
            FieldByName('linea').AsInteger           := 1000 + QCuentas.FieldByName('cuenta').AsInteger;
            FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
            FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            post;
            QCuentas.Next;
         end;
      end
      else begin
         QAnaliticas.First;
         while not QAnaliticas.EOF do begin
            QCuentas.First;
            while not QCuentas.EOF do begin
               append;
               edit;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('linea').AsInteger           := 1000 + QCuentas.FieldByName('cuenta').AsInteger;
               FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
               FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
               // Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               post;
               QCuentas.Next;
            end;
            QAnaliticas.Next;
         end;
      end;

      // 2º Carga de 600
      QCuentas.Close;
      QCuentas.parambyname('Cuenta1').AsString := '600';
      QCuentas.parambyname('Cuenta2').AsString := '699';
      QCuentas.Open;
      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         while not QCuentas.EOF do begin
            append;
            edit;
            FieldByName('linea').AsInteger      := 3000 + QCuentas.FieldByName('cuenta').AsInteger;
            FieldByName('cuenta').AsInteger     := QCuentas.FieldByName('cuenta').AsInteger;
            FieldByName('descripcion').AsString := QCuentas.FieldByName('descripcion').AsString;
            post;
            QCuentas.Next;
         end;
      end
      else begin
         QAnaliticas.First;
         while not QAnaliticas.EOF do begin
            QCuentas.First;
            while not QCuentas.EOF do begin
               append;
               edit;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('linea').AsInteger           := 3000 + QCuentas.FieldByName('cuenta').AsInteger;
               FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
               FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
               post;
               QCuentas.Next;
            end;
            QAnaliticas.Next;
         end;
      end;

      // Cambio de indice para las busquedas
      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         indexfieldnames := 'Cuenta';
      end
      else begin
         indexfieldnames := 'cuenta_analitica;cuenta';
      end;

      // Carga de datos 700
      QDiario.Close;
      //TODO: QDiario.Database    := DMRef.IBDSiamCont;
      //TODO: QDiario.Transaction := DmRef.IBDSiamCont.DefaultTransaction;
      QDiario.parambyname('Subcuenta1').AsString := '7' + Replicate('0', gvLongitudSubcuenta - 1);
      QDiario.parambyname('Subcuenta2').AsString := '7' + Replicate('9', gvLongitudSubcuenta - 1);
      QDiario.parambyname('Fecha1').AsDateTime := QFiltro.FieldByName('FechaDesde').AsDateTime;
      QDiario.parambyname('Fecha2').AsDateTime := QFiltro.FieldByName('FechaHasta').AsDateTime;
      QDiario.Open;
      while not QDiario.EOF do begin
         if (QFiltro.FieldByName('TipoConcepto').AsString <> 'T') and
            (QDiario.FieldByName('TipoContabilidad').AsString <>
            QFiltro.FieldByName('TipoConcepto').AsString) then   begin
            QDiario.Next;
            Continue;
         end;
         if not DMContaRef.Pertenece_Analitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
            QFiltro.FieldByName('CUENTA').AsString,
            QFiltro.FieldByName('CUENTAH').AsString,
            QFiltro.FieldByName('ID_DELEGACION').AsString,
            QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            QFiltro.FieldByName('ID_SECCION').AsString,
            QFiltro.FieldByName('ID_PROYECTO').AsString) then   begin
            QDiario.Next;
            Continue;
         end;

         cCuenta         := copy(QDiario.FieldByName('Subcuenta').AsString, 1, 3);
         CuentaAnalitica := QDiario.FieldByName('CUENTA_ANALITICA').AsString;
         if QFiltro.FieldByName('INFORME').AsString = 'N' then begin
            findkey([StrToInt(cCuenta)]);
         end
         else begin
            findkey([CuentaAnalitica, StrToInt(cCuenta)]);
         end;
         //if QDiario.FieldByName('CUENTA_ANALITICA').AsString <> '' then
     { else
      begin
        QDiario.Next;
        Continue;
      end;}
         edit;
         if QDiario.FieldByName('Debehaber').AsString = 'D' then   begin
            FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat -
               QDiario.FieldByName('SUMA').AsFloat;
            nIngresosActual := nIngresosActual - QDiario.FieldByName('SUMA').AsFloat;
         end
         else begin
            FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat +
               QDiario.FieldByName('SUMA').AsFloat;
            nIngresosActual := nIngresosActual + QDiario.FieldByName('SUMA').AsFloat;
         end;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         FieldByName('FechaInicial').AsDateTime   := FechaInicial;
         FieldByName('FechaFinal').AsDateTime     := FechaFinal;
         FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         Post;
         QDiario.Next;
      end; // QDiario


      // Saldo Anterior para las cuentas de ingresos
      if oSaldos.Checked then   begin
         QCuentas.Close;
         QCuentas.parambyname('Cuenta1').AsString := '700';
         QCuentas.parambyname('Cuenta2').AsString := '799';
         QCuentas.Open;
         while not QCuentas.EOF do begin
            aMeses[1]  := QCuentas.FieldByName('antdb01').AsFloat -
               QCuentas.FieldByName('anthb01').AsFloat;
            aMeses[2]  := QCuentas.FieldByName('antdb02').AsFloat -
               QCuentas.FieldByName('anthb02').AsFloat;
            aMeses[3]  := QCuentas.FieldByName('antdb03').AsFloat -
               QCuentas.FieldByName('anthb03').AsFloat;
            aMeses[4]  := QCuentas.FieldByName('antdb04').AsFloat -
               QCuentas.FieldByName('anthb04').AsFloat;
            aMeses[5]  := QCuentas.FieldByName('antdb05').AsFloat -
               QCuentas.FieldByName('anthb05').AsFloat;
            aMeses[6]  := QCuentas.FieldByName('antdb06').AsFloat -
               QCuentas.FieldByName('anthb06').AsFloat;
            aMeses[7]  := QCuentas.FieldByName('antdb07').AsFloat -
               QCuentas.FieldByName('anthb07').AsFloat;
            aMeses[8]  := QCuentas.FieldByName('antdb08').AsFloat -
               QCuentas.FieldByName('anthb08').AsFloat;
            aMeses[9]  := QCuentas.FieldByName('antdb09').AsFloat -
               QCuentas.FieldByName('anthb09').AsFloat;
            aMeses[10] := QCuentas.FieldByName('antdb10').AsFloat -
               QCuentas.FieldByName('anthb10').AsFloat;
            aMeses[11] := QCuentas.FieldByName('antdb11').AsFloat -
               QCuentas.FieldByName('anthb11').AsFloat;
            aMeses[12] := QCuentas.FieldByName('antdb12').AsFloat -
               QCuentas.FieldByName('anthb12').AsFloat;
            nImportes  := 0;
            for i := nMesIni to nMesFin do begin
               nImportes := nImportes + aMeses[i];
            end;

            findkey([QCuentas.FieldByName('cuenta').AsInteger]);
            Edit;
            FieldByName('SaldoAnterior').AsFloat := Abs(nImportes);
            nIngresosAnterior := nIngresosAnterior + FieldByName('Saldoanterior').AsFloat;

            FieldByName('SaldoDif').AsFloat          :=
               FieldByName('SaldoActual').AsFloat - FieldByName('SaldoAnterior').AsFloat;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            Post;

            Qcuentas.Next;
         end; // QCuentas
      end; // CbAnterior

      // Empresas consolidadas
      for IndCons := 0 to Empresas.Count - 1 do begin
         DMRef.ConectarBDEmpresa(Empresas.Strings[IndCons]);
         if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
            Indexfieldnames := 'Cuenta';
         end
         else begin
            indexfieldnames := 'cuenta_analitica;cuenta';
         end;

         // Carga de datos a partir de Cuentas
         // 1º Carga de 700
         QCuentas.Close;
         //TODO: QCuentas.SQLConnection := DmRef.IBDConsolida;
         //TODO: QCuentas.Transaction := DmRef.IBDConsolida.DefaultTransaction;
         QCuentas.parambyname('Cuenta1').AsString := '700';
         QCuentas.parambyname('Cuenta2').AsString := '799';
         QCuentas.Open;

         if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
            while not QCuentas.EOF do begin
               if not FindKey([QCuentas.FieldByName('CUENTA').AsString]) then   begin
                  append;
                  edit;
                  FieldByName('linea').AsInteger           := 1000 + QCuentas.FieldByName('cuenta').AsInteger;
                  FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
                  FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
                  // Almacenar el intervalo de fechas y la fecha de impresión para
                  //incluirlas en la descripción del listado.
                  FieldByName('FechaInicial').AsDateTime   := FechaInicial;
                  FieldByName('FechaFinal').AsDateTime     := FechaFinal;
                  FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
                  post;
               end;
               QCuentas.Next;
            end;
         end
         else begin
            QAnaliticas.First;
            while not QAnaliticas.EOF do begin
               QCuentas.First;
               while not QCuentas.EOF do begin
                  if not FindKey([QAnaliticas.FieldByName('CUENTA').AsString,
                     QCuentas.FieldByName('CUENTA').AsString]) then   begin
                     append;
                     edit;
                     FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
                     FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
                     FieldByName('linea').AsInteger           := 1000 + QCuentas.FieldByName('cuenta').AsInteger;
                     FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
                     FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
                     // Almacenar el intervalo de fechas y la fecha de impresión para
                     //incluirlas en la descripción del listado.
                     FieldByName('FechaInicial').AsDateTime   := FechaInicial;
                     FieldByName('FechaFinal').AsDateTime     := FechaFinal;
                     FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
                     post;
                  end;
                  QCuentas.Next;
               end;
               QAnaliticas.Next;
            end;
         end;

         // 2º Carga de 600
         QCuentas.Close;
         //TODO: QCuentas.Database    := DmRef.IBDConsolida;
         //TODO: Qcuentas.Transaction := DmRef.IBDConsolida.DefaultTransaction;
         QCuentas.parambyname('Cuenta1').AsString := '600';
         QCuentas.parambyname('Cuenta2').AsString := '699';
         QCuentas.Open;
         if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
            while not QCuentas.EOF do begin
               if not FindKey([QCuentas.FieldByName('CUENTA').AsString]) then   begin
                  append;
                  edit;
                  FieldByName('linea').AsInteger      := 3000 + QCuentas.FieldByName('cuenta').AsInteger;
                  FieldByName('cuenta').AsInteger     := QCuentas.FieldByName('cuenta').AsInteger;
                  FieldByName('descripcion').AsString := QCuentas.FieldByName('descripcion').AsString;
                  post;
               end;
               QCuentas.Next;
            end;
         end
         else begin
            QAnaliticas.First;
            while not QAnaliticas.EOF do begin
               QCuentas.First;
               while not QCuentas.EOF do begin
                  if not FindKey([QAnaliticas.FieldByName('CUENTA').AsString,
                     QCuentas.FieldByName('CUENTA').AsString]) then   begin
                     append;
                     edit;
                     FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
                     FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
                     FieldByName('linea').AsInteger           := 3000 + QCuentas.FieldByName('cuenta').AsInteger;
                     FieldByName('cuenta').AsInteger          := QCuentas.FieldByName('cuenta').AsInteger;
                     FieldByName('descripcion').AsString      := QCuentas.FieldByName('descripcion').AsString;
                     post;
                  end;
                  QCuentas.Next;
               end;
               QAnaliticas.Next;
            end;
         end;

         // Cambio de indice para las busquedas
         if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
            indexfieldnames := 'Cuenta';
         end
         else begin
            indexfieldnames := 'cuenta_analitica;cuenta';
         end;

         // Carga de datos 700
         QDiario.Close;
         //TODO: QDiario.Database    := DmRef.IBDConsolida;
         //TODO: QDiario.Transaction := DmRef.IBDConsolida.DefaultTransaction;
         QDiario.parambyname('Subcuenta1').AsString := '7' + Replicate('0', gvLongitudSubcuenta - 1);
         QDiario.parambyname('Subcuenta2').AsString := '7' + Replicate('9', gvLongitudSubcuenta - 1);
         QDiario.parambyname('Fecha1').AsDateTime := QFiltro.FieldByName('FechaDesde').AsDateTime;
         QDiario.parambyname('Fecha2').AsDateTime := QFiltro.FieldByName('FechaHasta').AsDateTime;
         QDiario.Open;
         while not QDiario.EOF do begin
            if (QFiltro.FieldByName('TipoConcepto').AsString <> 'T') and
               (QDiario.FieldByName('TipoContabilidad').AsString <>
               QFiltro.FieldByName('TipoConcepto').AsString) then   begin
               QDiario.Next;
               Continue;
            end;
            if not DMContaRef.Pertenece_Analitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
               QFiltro.FieldByName('CUENTA').AsString,
               QFiltro.FieldByName('CUENTAH').AsString,
               QFiltro.FieldByName('ID_DELEGACION').AsString,
               QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
               QFiltro.FieldByName('ID_SECCION').AsString,
               QFiltro.FieldByName('ID_PROYECTO').AsString,
               DMRef.IBDConsolida) then   begin
               QDiario.Next;
               Continue;
            end;

            cCuenta         := copy(QDiario.FieldByName('Subcuenta').AsString, 1, 3);
            CuentaAnalitica := QDiario.FieldByName('CUENTA_ANALITICA').AsString;
            if QFiltro.FieldByName('INFORME').AsString = 'N' then begin
               findkey([StrToInt(cCuenta)]);
            end
            else begin
               findkey([CuentaAnalitica, StrToInt(cCuenta)]);
            end;
            //if QDiario.FieldByName('CUENTA_ANALITICA').AsString <> '' then
       { else
        begin
          QDiario.Next;
          Continue;
        end;}
            edit;
            if QDiario.FieldByName('Debehaber').AsString = 'D' then   begin
               FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat -
                  QDiario.FieldByName('SUMA').AsFloat;
               nIngresosActual := nIngresosActual - QDiario.FieldByName('SUMA').AsFloat;
            end
            else begin
               FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat +
                  QDiario.FieldByName('SUMA').AsFloat;
               nIngresosActual := nIngresosActual + QDiario.FieldByName('SUMA').AsFloat;
            end;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            Post;
            QDiario.Next;
         end; // QDiario


         // Saldo Anterior para las cuentas de ingresos
         if oSaldos.Checked then   begin
            QCuentas.Close;
            //TODO: QCuentas.Database    := DmRef.IBDConsolida;
            //TODO: Qcuentas.Transaction := DmRef.IBDConsolida.DefaultTransaction;
            QCuentas.parambyname('Cuenta1').AsString := '700';
            QCuentas.parambyname('Cuenta2').AsString := '799';
            QCuentas.Open;
            while not QCuentas.EOF do begin
               aMeses[1]  := QCuentas.FieldByName('antdb01').AsFloat -
                  QCuentas.FieldByName('anthb01').AsFloat;
               aMeses[2]  := QCuentas.FieldByName('antdb02').AsFloat -
                  QCuentas.FieldByName('anthb02').AsFloat;
               aMeses[3]  := QCuentas.FieldByName('antdb03').AsFloat -
                  QCuentas.FieldByName('anthb03').AsFloat;
               aMeses[4]  := QCuentas.FieldByName('antdb04').AsFloat -
                  QCuentas.FieldByName('anthb04').AsFloat;
               aMeses[5]  := QCuentas.FieldByName('antdb05').AsFloat -
                  QCuentas.FieldByName('anthb05').AsFloat;
               aMeses[6]  := QCuentas.FieldByName('antdb06').AsFloat -
                  QCuentas.FieldByName('anthb06').AsFloat;
               aMeses[7]  := QCuentas.FieldByName('antdb07').AsFloat -
                  QCuentas.FieldByName('anthb07').AsFloat;
               aMeses[8]  := QCuentas.FieldByName('antdb08').AsFloat -
                  QCuentas.FieldByName('anthb08').AsFloat;
               aMeses[9]  := QCuentas.FieldByName('antdb09').AsFloat -
                  QCuentas.FieldByName('anthb09').AsFloat;
               aMeses[10] := QCuentas.FieldByName('antdb10').AsFloat -
                  QCuentas.FieldByName('anthb10').AsFloat;
               aMeses[11] := QCuentas.FieldByName('antdb11').AsFloat -
                  QCuentas.FieldByName('anthb11').AsFloat;
               aMeses[12] := QCuentas.FieldByName('antdb12').AsFloat -
                  QCuentas.FieldByName('anthb12').AsFloat;
               nImportes  := 0;
               for i := nMesIni to nMesFin do begin
                  nImportes := nImportes + aMeses[i];
               end;

               findkey([QCuentas.FieldByName('cuenta').AsInteger]);
               Edit;
               FieldByName('SaldoAnterior').AsFloat := FieldByName('SaldoAnterior').AsFloat + Abs(nImportes);
               nIngresosAnterior := nIngresosAnterior + Abs(nImportes);

               FieldByName('SaldoDif').AsFloat          :=
                  FieldByName('SaldoActual').AsFloat - FieldByName('SaldoAnterior').AsFloat;
               // Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               Post;

               Qcuentas.Next;
            end; // QCuentas
         end; // CbAnterior
      end;


      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 2001;
         FieldByName('Descripcion').AsString := ' ';
         Post;
         // Creacion de Registro Acumulador ingresos
         Append;
         Edit;
         FieldByName('linea').AsInteger := 2002;
         FieldByName('Descripcion').AsString := '  ====  TOTAL INGRESOS ====';
         nIngresosActual := RoundToDecimal(nIngresosActual, 3, True);
         FieldByName('SaldoActual').AsFloat := nIngresosActual;
         if oSaldos.Checked then   begin
            nIngresosAnterior := RoundToDecimal(nIngresosAnterior, 3, True);
            FieldByName('SaldoAnterior').AsFloat := nIngresosAnterior;
            FieldByName('SaldoDif').AsFloat := nIngresosActual - nIngresosAnterior;
         end;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         FieldByName('FechaInicial').AsDateTime   := FechaInicial;
         FieldByName('FechaFinal').AsDateTime     := FechaFinal;
         FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         Post;
         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 2003;
         FieldByName('Descripcion').AsString := ' ';
         Post;
      end;

      // Carga de datos 600
      QDiario.Close;
      //TODO: QDiario.Database    := DMRef.IBDSiamCont;
      //TODO: QDiario.Transaction := DMRef.IBDSiamCont.DefaultTransaction;
      QDiario.parambyname('Subcuenta1').AsString := '6' + Replicate('0', gvLongitudSubcuenta - 1);
      QDiario.parambyname('Subcuenta2').AsString := '6' + Replicate('9', gvLongitudSubcuenta - 1);
      QDiario.parambyname('Fecha1').AsDateTime := QFiltro.FieldByName('FechaDesde').AsDateTime;
      QDiario.parambyname('Fecha2').AsDateTime := QFiltro.FieldByName('FechaHasta').AsDateTime;
      QDiario.Open;
      while not QDiario.EOF do begin
         if (QFiltro.FieldByName('TipoConcepto').AsString <> 'T') and
            (QDiario.FieldByName('TipoContabilidad').AsString <>
            QFiltro.FieldByName('TipoConcepto').AsString) then   begin
            QDiario.Next;
            Continue;
         end;
         if not DMContaRef.Pertenece_Analitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
            QFiltro.FieldByName('CUENTA').AsString,
            QFiltro.FieldByName('CUENTAH').AsString,
            QFiltro.FieldByName('ID_DELEGACION').AsString,
            QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            QFiltro.FieldByName('ID_SECCION').AsString,
            QFiltro.FieldByName('ID_PROYECTO').AsString) then   begin
            QDiario.Next;
            Continue;
         end;

         cCuenta         := copy(QDiario.FieldByName('Subcuenta').AsString, 1, 3);
         CuentaAnalitica := QDiario.FieldByName('CUENTA_ANALITICA').AsString;
         if QFiltro.FieldByName('INFORME').AsString = 'N' then begin
            findkey([StrToInt(cCuenta)]);
         end
         else begin
            findkey([CuentaAnalitica, StrToInt(cCuenta)]);
         end;
         //if QDiario.FieldByName('CUENTA_ANALITICA').AsString <> '' then
{      else
      begin
        QDiario.Next;
        Continue;
      end;   }
         edit;
         if QDiario.FieldByName('Debehaber').AsString = 'D' then   begin
            FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat +
               QDiario.FieldByName('SUMA').AsFloat;
            nGastosActual := nGastosActual + QDiario.FieldByName('SUMA').AsFloat;
         end
         else begin
            FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat -
               QDiario.FieldByName('SUMA').AsFloat;
            nGastosActual := nGastosActual - QDiario.FieldByName('SUMA').AsFloat;
         end;
         if nIngresosActual = 0 then   begin
            FieldByName('TantoActual').AsFloat := 0;
         end
         else begin
            FieldByName('TantoActual').AsFloat :=
               (FieldByName('SaldoActual').AsFloat * 100) / nIngresosActual;
         end;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         FieldByName('FechaInicial').AsDateTime   := FechaInicial;
         FieldByName('FechaFinal').AsDateTime     := FechaFinal;
         FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         QDiario.Next;
      end;

      // Saldo Anterior debo sacarlo de la cuenta
      if oSaldos.Checked then   begin
         QCuentas.Close;
         //TODO: QCuentas.Database    := DmRef.IBDSiamCont;
         //TODO: Qcuentas.Transaction := DmRef.IBDSiamCont.DefaultTransaction;
         QCuentas.parambyname('Cuenta1').AsString := '600';
         QCuentas.parambyname('Cuenta2').AsString := '699';
         QCuentas.Open;
         while (not QCuentas.EOF) do begin
            aMeses[1]  := QCuentas.FieldByName('antdb01').AsFloat -
               QCuentas.FieldByName('anthb01').AsFloat;
            aMeses[2]  := QCuentas.FieldByName('antdb02').AsFloat -
               QCuentas.FieldByName('anthb02').AsFloat;
            aMeses[3]  := QCuentas.FieldByName('antdb03').AsFloat -
               QCuentas.FieldByName('anthb03').AsFloat;
            aMeses[4]  := QCuentas.FieldByName('antdb04').AsFloat -
               QCuentas.FieldByName('anthb04').AsFloat;
            aMeses[5]  := QCuentas.FieldByName('antdb05').AsFloat -
               QCuentas.FieldByName('anthb05').AsFloat;
            aMeses[6]  := QCuentas.FieldByName('antdb06').AsFloat -
               QCuentas.FieldByName('anthb06').AsFloat;
            aMeses[7]  := QCuentas.FieldByName('antdb07').AsFloat -
               QCuentas.FieldByName('anthb07').AsFloat;
            aMeses[8]  := QCuentas.FieldByName('antdb08').AsFloat -
               QCuentas.FieldByName('anthb08').AsFloat;
            aMeses[9]  := QCuentas.FieldByName('antdb09').AsFloat -
               QCuentas.FieldByName('anthb09').AsFloat;
            aMeses[10] := QCuentas.FieldByName('antdb10').AsFloat -
               QCuentas.FieldByName('anthb10').AsFloat;
            aMeses[11] := QCuentas.FieldByName('antdb11').AsFloat -
               QCuentas.FieldByName('anthb11').AsFloat;
            aMeses[12] := QCuentas.FieldByName('antdb12').AsFloat -
               QCuentas.FieldByName('anthb12').AsFloat;

            nImportes := 0;
            for i := nMesIni to nMesFin do begin
               nImportes := nImportes + aMeses[i];
            end;
            findkey([QCuentas.FieldByName('cuenta').AsInteger]);
            Edit;
            FieldByName('SaldoAnterior').AsFloat := nImportes;
            nGastosAnterior := nGastosAnterior + nImportes;

            FieldByName('SaldoDif').AsFloat          :=
               FieldByName('SaldoActual').AsFloat - FieldByName('SaldoAnterior').AsFloat;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            Post;
            QCuentas.Next;
         end; // Qcuentas
              // Poner Tantos por ciento
         findkey([600]);
         while (not EOF) and (FieldByName('cuenta').AsInteger < 700) do begin
            Edit;
            if nIngresosAnterior = 0 then begin
               FieldByName('TantoAnterior').AsFloat := 0;
            end
            else begin
               FieldByName('TantoAnterior').AsFloat :=
                  (FieldByName('SaldoAnterior').AsFloat * 100) / nIngresosAnterior;
            end;

            FieldByName('TantoDif').AsFloat := FieldByName('TantoActual').AsFloat -
               FieldByName('TantoAnterior').AsFloat;

            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            Post;
            Next;
         end;
      end; // Saldo anterior

      // Empresas consolidadas
      for IndCons := 0 to Empresas.Count - 1 do begin
         DMRef.ConectarBDEmpresa(Empresas.Strings[IndCons]);
         if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
            indexfieldnames := 'Cuenta';
         end
         else begin
            indexfieldnames := 'cuenta_analitica;cuenta';
         end;
         // Carga de datos 600
         QDiario.Close;
         //TODO: QDiario.Database    := DMRef.IBDConsolida;
         //TODO: QDiario.Transaction := DMRef.IBDConsolida.DefaultTransaction;
         QDiario.parambyname('Subcuenta1').AsString := '6' + Replicate('0', gvLongitudSubcuenta - 1);
         QDiario.parambyname('Subcuenta2').AsString := '6' + Replicate('9', gvLongitudSubcuenta - 1);
         QDiario.parambyname('Fecha1').AsDateTime := QFiltro.FieldByName('FechaDesde').AsDateTime;
         QDiario.parambyname('Fecha2').AsDateTime := QFiltro.FieldByName('FechaHasta').AsDateTime;
         QDiario.Open;
         while not QDiario.EOF do begin
            if (QFiltro.FieldByName('TipoConcepto').AsString <> 'T') and
               (QDiario.FieldByName('TipoContabilidad').AsString <>
               QFiltro.FieldByName('TipoConcepto').AsString) then   begin
               QDiario.Next;
               Continue;
            end;
            if not DMContaRef.Pertenece_Analitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
               QFiltro.FieldByName('CUENTA').AsString,
               QFiltro.FieldByName('CUENTAH').AsString,
               QFiltro.FieldByName('ID_DELEGACION').AsString,
               QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
               QFiltro.FieldByName('ID_SECCION').AsString,
               QFiltro.FieldByName('ID_PROYECTO').AsString,
               DMRef.IBDConsolida) then   begin
               QDiario.Next;
               Continue;
            end;

            cCuenta         := copy(QDiario.FieldByName('Subcuenta').AsString, 1, 3);
            CuentaAnalitica := QDiario.FieldByName('CUENTA_ANALITICA').AsString;
            if QFiltro.FieldByName('INFORME').AsString = 'N' then begin
               findkey([StrToInt(cCuenta)]);
            end
            else begin
               findkey([CuentaAnalitica, StrToInt(cCuenta)]);
            end;
            //if QDiario.FieldByName('CUENTA_ANALITICA').AsString <> '' then
{        else
        begin
          QDiario.Next;
          Continue;
        end; }
            edit;
            if QDiario.FieldByName('Debehaber').AsString = 'D' then   begin
               FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat +
                  QDiario.FieldByName('SUMA').AsFloat;
               nGastosActual := nGastosActual + QDiario.FieldByName('SUMA').AsFloat;
            end
            else begin
               FieldByName('SaldoActual').AsFloat := FieldByName('SaldoActual').AsFloat -
                  QDiario.FieldByName('SUMA').AsFloat;
               nGastosActual := nGastosActual - QDiario.FieldByName('SUMA').AsFloat;
            end;
            if nIngresosActual = 0 then   begin
               FieldByName('TantoActual').AsFloat := 0;
            end
            else begin
               FieldByName('TantoActual').AsFloat :=
                  (FieldByName('SaldoActual').AsFloat * 100) / nIngresosActual;
            end;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            FieldByName('FechaInicial').AsDateTime   := FechaInicial;
            FieldByName('FechaFinal').AsDateTime     := FechaFinal;
            FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            QDiario.Next;
         end;

         // Saldo Anterior debo sacarlo de la cuenta
         if oSaldos.Checked then   begin
            QCuentas.Close;
            //TODO: QCuentas.Database    := DmRef.IBDConsolida;
            //TODO: Qcuentas.Transaction := DmRef.IBDConsolida.DefaultTransaction;
            QCuentas.parambyname('Cuenta1').AsString := '600';
            QCuentas.parambyname('Cuenta2').AsString := '699';
            QCuentas.Open;
            while (not QCuentas.EOF) do begin
               aMeses[1]  := QCuentas.FieldByName('antdb01').AsFloat -
                  QCuentas.FieldByName('anthb01').AsFloat;
               aMeses[2]  := QCuentas.FieldByName('antdb02').AsFloat -
                  QCuentas.FieldByName('anthb02').AsFloat;
               aMeses[3]  := QCuentas.FieldByName('antdb03').AsFloat -
                  QCuentas.FieldByName('anthb03').AsFloat;
               aMeses[4]  := QCuentas.FieldByName('antdb04').AsFloat -
                  QCuentas.FieldByName('anthb04').AsFloat;
               aMeses[5]  := QCuentas.FieldByName('antdb05').AsFloat -
                  QCuentas.FieldByName('anthb05').AsFloat;
               aMeses[6]  := QCuentas.FieldByName('antdb06').AsFloat -
                  QCuentas.FieldByName('anthb06').AsFloat;
               aMeses[7]  := QCuentas.FieldByName('antdb07').AsFloat -
                  QCuentas.FieldByName('anthb07').AsFloat;
               aMeses[8]  := QCuentas.FieldByName('antdb08').AsFloat -
                  QCuentas.FieldByName('anthb08').AsFloat;
               aMeses[9]  := QCuentas.FieldByName('antdb09').AsFloat -
                  QCuentas.FieldByName('anthb09').AsFloat;
               aMeses[10] := QCuentas.FieldByName('antdb10').AsFloat -
                  QCuentas.FieldByName('anthb10').AsFloat;
               aMeses[11] := QCuentas.FieldByName('antdb11').AsFloat -
                  QCuentas.FieldByName('anthb11').AsFloat;
               aMeses[12] := QCuentas.FieldByName('antdb12').AsFloat -
                  QCuentas.FieldByName('anthb12').AsFloat;

               nImportes := 0;
               for i := nMesIni to nMesFin do begin
                  nImportes := nImportes + aMeses[i];
               end;
               findkey([QCuentas.FieldByName('cuenta').AsInteger]);
               Edit;
               FieldByName('SaldoAnterior').AsFloat := FieldByName('SaldoAnterior').AsFloat + nImportes;
               nGastosAnterior := nGastosAnterior + nImportes;

               FieldByName('SaldoDif').AsFloat          :=
                  FieldByName('SaldoActual').AsFloat - FieldByName('SaldoAnterior').AsFloat;
               // Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               Post;
               QCuentas.Next;
            end; // Qcuentas
                 // Poner Tantos por ciento
            findkey([600]);
            while (not EOF) and (FieldByName('cuenta').AsInteger < 700) do begin
               Edit;
               if nIngresosAnterior = 0 then begin
                  FieldByName('TantoAnterior').AsFloat := 0;
               end
               else begin
                  FieldByName('TantoAnterior').AsFloat :=
                     (FieldByName('SaldoAnterior').AsFloat * 100) / nIngresosAnterior;
               end;

               FieldByName('TantoDif').AsFloat := FieldByName('TantoActual').AsFloat -
                  FieldByName('TantoAnterior').AsFloat;

               // Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               Post;
               Next;
            end;
         end; // Saldo anterior
      end;

      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 4001;
         FieldByName('Descripcion').AsString := ' ';
         Post;
         // Creacion de Registro Acumulador gastos
         Append;
         Edit;
         FieldByName('linea').AsInteger := 4002;
         FieldByName('Descripcion').AsString := '  ====  TOTAL GASTOS ====';
         nGastosActual := RoundToDecimal(nGastosActual, 3, True);
         FieldByName('SaldoActual').AsFloat := nGastosActual;
         if nIngresosActual = 0 then begin
            FieldByName('TantoActual').AsFloat := 0;
         end
         else begin
            FieldByName('TantoActual').AsFloat :=
               (nGastosActual * 100) / nIngresosActual;
         end;
         if oSaldos.Checked then   begin
            nGastosAnterior := RoundToDecimal(nGastosAnterior, 3, True);
            FieldByName('SaldoDif').AsFloat := nGastosActual - nGastosAnterior;
            FieldByName('SaldoAnterior').AsFloat := nGastosAnterior;
            if nIngresosAnterior = 0 then begin
               FieldByName('TantoAnterior').AsFloat := 0;
            end
            else begin
               FieldByName('TantoAnterior').AsFloat :=
                  (nGastosAnterior * 100) / nIngresosAnterior;
            end;

            FieldByName('TantoDif').AsFloat := FieldByName('TantoActual').AsFloat -
               FieldByName('TantoAnterior').AsFloat;
            nValorDif := FieldByName('TantoDif').AsFloat;
         end;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         FieldByName('FechaInicial').AsDateTime   := FechaInicial;
         FieldByName('FechaFinal').AsDateTime     := FechaFinal;
         FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         Post;

         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 4003;
         FieldByName('Descripcion').AsString := ' ';
         Post;
         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 4004;
         FieldByName('Descripcion').AsString := ' ';
         Post;
         // Diferencia beneficios/perdidas
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 4005;
         FieldByName('Descripcion').AsString :=
            '  ==== DIFE. BENEFICIOS/PERDIDAS ====';
         FieldByName('SaldoActual').AsFloat  := nIngresosActual - nGastosActual;
         if nIngresosActual = 0 then begin
            FieldByName('TantoActual').AsFloat := 0;
         end
         else begin
            FieldByName('TantoActual').AsFloat :=
               (FieldByName('SaldoActual').AsFloat * 100) / nIngresosActual;
         end;

         if oSaldos.Checked then   begin
            FieldByName('SaldoAnterior').AsFloat := nIngresosAnterior - nGastosAnterior;
            FieldByName('SaldoDif').AsFloat      :=
               FieldByName('SaldoActual').AsFloat - FieldByName('SaldoAnterior').AsFloat;

            if nIngresosAnterior = 0 then begin
               FieldByName('TantoAnterior').AsFloat := 0;
            end
            else begin
               FieldByName('TantoAnterior').AsFloat :=
                  (FieldByName('SaldoAnterior').AsFloat * 100) / nIngresosAnterior;
            end;

            FieldByName('TantoDif').AsFloat := 100 - nValorDif;
         end;
         Post;
         // Linea en blanco
         Append;
         Edit;
         FieldByName('linea').AsInteger      := 4006;
         FieldByName('Descripcion').AsString := ' ';
         Post;
      end
      else begin
         IndexFieldNames := 'CUENTA_ANALITICA';

         // Borrados de los registros que no tienen datos
         First;
         while not EOF do begin
            if (RoundToDecimal((FieldByName('saldoactual').AsFloat +
               FieldByName('saldoanterior').AsFloat), 3, True) <> 0) or
               ((FieldByName('linea').AsInteger >= 2000) and
               (FieldByName('linea').AsInteger < 3000)) or
               ((FieldByName('linea').AsInteger >= 4000) and
               (FieldByName('linea').AsInteger < 5000)) then begin
               Next;
            end
            else begin
               Delete;
            end;
         end;
         First;

         QAnaliticas.First;
         while not QAnaliticas.EOF do begin
            nIngresos := 0;
            nGastos   := 0;
            if FindKey([QAnaliticas.FieldByName('CUENTA').AsString]) then   begin
               while not EOF and (FieldByName('CUENTA_ANALITICA').AsString =
                     QAnaliticas.FieldByName('CUENTA').AsString) do begin
                  if (FieldByName('CUENTA').AsInteger >= 700) and
                     (FieldByName('CUENTA').AsInteger <= 799) then   begin
                     nIngresos := nIngresos + FieldByName('SALDOACTUAL').AsFloat;
                  end
                  else
                  if (FieldByName('CUENTA').AsInteger >= 600) and
                     (FieldByName('CUENTA').AsInteger <= 699) then   begin
                     nGastos := nGastos + FieldByName('SALDOACTUAL').AsFloat;
                  end;
                  Next;
               end;
               if nIngresos <> 0 then   begin
                  // Linea en blanco
                  Append;
                  Edit;
                  FieldByName('linea').AsInteger           := 2001;
                  FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
                  FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
                  FieldByName('Descripcion').AsString      := ' ';
                  Post;
               end;
               // Creacion de Registro Acumulador ingresos
               Append;
               Edit;
               FieldByName('linea').AsInteger           := 2002;
               FieldByName('Descripcion').AsString      := '  ====  TOTAL INGRESOS ====';
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('SaldoActual').AsFloat       := RoundToDecimal(nIngresos, 3, True);
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               Post;
               // Linea en blanco
               Append;
               Edit;
               FieldByName('linea').AsInteger           := 2003;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('Descripcion').AsString      := ' ';
               Post;
               if nGastos <> 0 then   begin
                  // Linea en blanco
                  Append;
                  Edit;
                  FieldByName('linea').AsInteger           := 4001;
                  FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
                  FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
                  FieldByName('Descripcion').AsString      := ' ';
                  Post;
               end;
               // Creacion de Registro Acumulador gastos
               Append;
               Edit;
               FieldByName('linea').AsInteger           := 4002;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('Descripcion').AsString      := '  ====  TOTAL GASTOS ====';
               FieldByName('SaldoActual').AsFloat       := RoundToDecimal(nGastos, 3, True);
               if nIngresos = 0 then begin
                  FieldByName('TantoActual').AsFloat := 0;
               end
               else begin
                  FieldByName('TantoActual').AsFloat := (nGastos * 100) / nIngresos;
               end;
               FieldByName('FechaInicial').AsDateTime   := FechaInicial;
               FieldByName('FechaFinal').AsDateTime     := FechaFinal;
               FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               Post;
               // Linea en blanco
               Append;
               Edit;
               FieldByName('linea').AsInteger           := 4003;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('Descripcion').AsString      := ' ';
               Post;
               // Diferencia beneficios/perdidas
               Append;
               Edit;
               FieldByName('linea').AsInteger           := 4005;
               FieldByName('CUENTA_ANALITICA').AsString := QAnaliticas.FieldByName('CUENTA').AsString;
               FieldByName('DESC_ANALITICA').AsString   := QAnaliticas.FieldByName('NOMBRE').AsString;
               FieldByName('Descripcion').AsString      :=
                  '  ==== DIFE. BENEFICIOS/PERDIDAS ====';
               FieldByName('SaldoActual').AsFloat       := nIngresos - nGastos;
               if nIngresos = 0 then begin
                  FieldByName('TantoActual').AsFloat := 0;
               end
               else begin
                  FieldByName('TantoActual').AsFloat := (FieldByName('SaldoActual').AsFloat * 100) / nIngresos;
               end;
            end;
            QAnaliticas.Next;
         end;
      end;


      if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
         indexfieldnames := 'linea';
      end
      else begin
         IndexFieldNames := 'cuenta_analitica;linea';
      end;

      // Borrados de los registros que no tienen datos
      First;
      while not EOF do begin
         if (RoundToDecimal((FieldByName('saldoactual').AsFloat +
            FieldByName('saldoanterior').AsFloat), 3, True) <> 0) or
            ((FieldByName('linea').AsInteger >= 2000) and
            (FieldByName('linea').AsInteger < 3000)) or
            ((FieldByName('linea').AsInteger >= 4000) and
            (FieldByName('linea').AsInteger < 5000)) then begin
            Next;
         end
         else begin
            Delete;
         end;
      end;
      First;
   end; // InfBalExplo
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QDiario do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas do begin
      Close;
      Free;
   end;

   QAnaliticas.Close;
   //QAnaliticas.Free;

   Caratula.Cerrar;
   Caratula.Free;

   if QFiltro.FieldByName('INFORME').AsString = 'N' then   begin
      FormPrincipal.LanzarListado('LBALANCEEXPLOTACION.RTM', DMContaRef.sInfBalExplo, gvMonedaListado,
         True, False, False, False, False, False, oSaldos.Checked);
   end
   else begin
      FormPrincipal.LanzarListado('LBALANCEEXPLOTACION_ANALITICA.RTM', DMContaRef.sInfBalExplo, gvMonedaListado,
         True, False, False, False, False, False);
   end;

   DMContaRef.InicializarFicherosInformes;

   Empresas.Free;
end;

procedure TWBalExplotacion.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWBalExplotacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWBalExplotacion.FormShow(Sender: TObject);
var
   nPrimerAsiento, nUltimoAsiento: Integer;
   dPrimeraFecha, dUltimaFecha:    Tdatetime;
begin
   screen.cursor := crHourGlass;
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   DmContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('FechaDesde', ftDate, 0, False);
         Add('FechaHasta', ftDate, 0, False);
         Add('Moneda', ftString, 1, False);
         Add('TipoConcepto', ftString, 1, False);
         Add('FechaImprimir', ftDate, 0, False);
         Add('CUENTA', ftString, 10, False);
         Add('CUENTAH', ftString, 10, False);
         Add('ID_DELEGACION', ftString, 10, False);
         Add('ID_DEPARTAMENTO', ftString, 10, False);
         Add('ID_SECCION', ftString, 10, False);
         Add('ID_PROYECTO', ftString, 10, False);
         Add('INFORME', ftString, 1, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
      FieldByName('FechaDesde').AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta').AsDateTime := dUltimaFecha;
      FieldByName('Moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('TipoConcepto').AsString := 'T';
      FieldByName('FechaImprimir').Value   := Date;
      FieldByName('INFORME').AsString      := 'N';
   end;

   RellenarEmpresas;

   eFechaDesde.SetFocus;
   screen.cursor := crDefault;
end;

procedure TWBalExplotacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
      end;
      VK_DOWN: begin
         SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
      end
   end;
end;

procedure TWBalExplotacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario      := nil;
   WBalExplotacion := nil;
end;

procedure TWBalExplotacion.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWBalExplotacion.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
