unit UBalAcumulados;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform,  fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages, OvcBase,
     OvcDbNF, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, Wwdbcomb,
     wwdbdatetimepicker, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, Wwkeycb, wwSpeedButton, CustomView;
type
   TWBalAcumulados = class(TCustomView)
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
      GroupBox4:      TGroupBox;
      Label4:         TLabel;
      Label3:         TLabel;
      lSubtotales1:   TLabel;
      lSubtotales2:   TLabel;
      FechaImprimir:  TwwDBDateTimePicker;
      eMoneda:        TwwDBComboBox;
      oConSubcuentas: TCheckBox;
      eNivel1:        TOvcDbNumericField;
      eNivel2:        TOvcDbNumericField;
      GroupBox2:      TGroupBox;
      Label20:        TLabel;
      Label24:        TLabel;
      Label25:        TLabel;
      Label5:         TLabel;
      Label1:         TLabel;
      eFechaDesde:    TwwDBDateTimePicker;
      FiltroFechaHasta: TwwDBDateTimePicker;
      FiltroCBDESCSUBCUENTAHasta: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta: TwwDBLookupCombo;
      RGConcepto:     TDBRadioGroup;
      RGAcumulacion:  TRadioGroup;
      QFiltro:        TClientDataSet;
      SFiltro:        TDataSource;
      GroupBox1:      TGroupBox;
      Label6:         TLabel;
      Label7:         TLabel;
      Label8:         TLabel;
      Label9:         TLabel;
      Label10:        TLabel;
      eDelegacion:    TwwDBLookupCombo;
      eDepartamento:  TwwDBLookupCombo;
      eSeccion:       TwwDBLookupCombo;
      eProyecto:      TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
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
   public
   end;

var WBalAcumulados: TWBalAcumulados;

implementation
uses cadenas, DM, DMConta, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWBalAcumulados.BtnEdtProcesarClick(Sender: TObject);
var Caratula:      TEspere;
    aMeses:        array[1..12] of Double;
    aMeses1:       array[1..12] of Double;
    aMeses2:       array[1..12] of Double;
    i, nMes, nPor: Integer;
    lPrimero:      Boolean;
    cCuenta, cCuenta1, cCuenta2: String;
    cDescripcion:  String;
    nAuxiliar:     Integer;
    nAuxImporte:   Double;
    QCuentas, QSubcuentas: TIbsql;
    FechaInicial, FechaFinal, FechaImpresion: TDateTime;
    TituloBalance: String;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   PonerTipoConta(QFiltro.FieldByName('TipoConcepto').AsString);
   gvMonedaListado := QFiltro.FieldByName('Moneda').AsString;

   FechaInicial   := QFiltro.FieldByName('FECHADESDE').AsDateTime;
   FechaFinal     := QFiltro.FieldByName('FECHAHASTA').AsDateTime;
   FechaImpresion := QFiltro.FieldByName('FECHAIMPRIMIR').AsDateTime;

   if RGAcumulacion.ItemIndex = 0 then  begin
      TituloBalance := 'BALANCE DE ACUMULADOS POR SALDOS';
   end
   else begin
      TituloBalance := 'BALANCE DE ACUMULADOS POR MOVIMIENTOS';
   end;

   // Selección de datos de subcuenta
   QSubcuentas := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT DESCRIPCION FROM SUBCTAS');
      Add('WHERE SUBCUENTA = :SUBCUENTA');
      Prepare;
   end;

   // Selección de datos de cuenta
   QCuentas := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT DESCRIPCION FROM CUENTAS');
      Add('WHERE CUENTA = :CUENTA');
      Prepare;
   end;

   Caratula := TEspere.Create(nil);
   Caratula.Mensaje      := 'Generando informe ...';
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

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      if FieldByName('nivel2').AsInteger > FieldByName('nivel1').AsInteger then  begin
         if not (state in dseditmodes) then begin
            edit;
         end;
         nAuxiliar := FieldByName('nivel1').AsInteger;
         FieldByName('nivel1').AsInteger := FieldByName('nivel2').AsInteger;
         FieldByName('nivel2').AsInteger := nAuxiliar;
      end;
   end;

   // Primero vaciar el fichero
   DMContaRef.QInfBalAcum.EmptyDataset;

   // Inicializar arrays
   for i := 1 to 12 do begin
      aMeses[i]  := 0;
      aMeses1[i] := 0;
      aMeses2[i] := 0;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFiltro do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      if FieldByName('subcuentahasta').AsString = '' then   begin
         FieldByName('subcuentahasta').AsString := FieldByName('subcuentadesde').AsString;
      end;

      if length(FieldByName('subcuentadesde').AsString) < gvlongitudsubcuenta then   begin
         FieldByName('subcuentadesde').AsString :=
            BackChar(FieldByName('subcuentadesde').AsString, '0', gvlongitudsubcuenta);
      end;
      if length(FieldByName('subcuentahasta').AsString) < gvlongitudsubcuenta then   begin
         FieldByName('subcuentahasta').AsString :=
            Backchar(FieldByName('subcuentahasta').AsString, '9', gvlongitudsubcuenta);
      end;
      post;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT D.IMPORTE,D.MONEDA,D.DEBEHABER,D.FECHA,D.SUBCUENTA');
      if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
         Add(',T.TIPOCONTABILIDAD');
      end;
      Add('   , D.CUENTA_ANALITICA');
      Add('FROM DIARIO D, CUENTAS C');
      if Qfiltro.FieldByName('TipoConcepto').AsString <> 'T' then begin
         Add(',CONCEPTOS T');
      end;
      Add('WHERE D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL');
      Add(' and  D.SUBCUENTA >= :SUBCUENTAINICIAL AND D.SUBCUENTA <= :SUBCUENTAFINAL');
      if QFiltro.FieldByName('TipoConcepto').AsString <> 'T' then   begin
         Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS ');
      end;
      Add(' AND SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');
      Add('ORDER BY D.SUBCUENTA, D.FECHA');
      parambyname('FechaInicial').AsDateTime   := QFiltro.FieldByName('FechaDesde').AsDateTime;
      parambyname('FechaFinal').AsDateTime     := QFiltro.FieldByName('FechaHasta').AsDateTime;
      parambyname('SubcuentaInicial').AsString := QFiltro.FieldByName('SubcuentaDesde').AsString;
      parambyname('SubcuentaFinal').AsString   := QFiltro.FieldByName('SubcuentaHasta').AsString;
      ExecQuery;
      while not EOF do begin
         if (QFiltro.FieldByName('TipoConcepto').AsString <> 'T') and
            (FieldByName('TipoContabilidad').AsString <> QFiltro.FieldByName('TipoConcepto').AsString) then
         begin
            Next;
            Continue;
         end;
         if not DMContaRef.Pertenece_Analitica(FieldByName('CUENTA_ANALITICA').AsString,
            QFiltro.FieldByName('CUENTA').AsString,
            QFiltro.FieldByName('CUENTAH').AsString,
            QFiltro.FieldByName('ID_DELEGACION').AsString,
            QFiltro.FieldByName('ID_DEPARTAMENTO').AsString,
            QFiltro.FieldByName('ID_SECCION').AsString,
            QFiltro.FieldByName('ID_PROYECTO').AsString) then   begin
            Next;
            Continue;
         end;
{$Message Warn 'Revisar este warning. Al llegar aquí lprimero aún no tiene un valor por lo tanto es False'}
         if lPrimero then begin
            lPrimero := False;
            cCuenta  := FieldByName('subcuenta').AsString;
            cCuenta1 := Copy(FieldByName('subcuenta').AsString, 1, QFiltro.FieldByName('Nivel1').AsInteger);
            cCuenta2 := Copy(FieldByName('subcuenta').AsString, 1, QFiltro.FieldByName('Nivel2').AsInteger);
            QSubcuentas.Close;
            QSubcuentas.ParamByName('Subcuenta').AsString := cCuenta;
            QSubcuentas.ExecQuery;
            cDescripcion := QSubcuentas.FieldByName('Descripcion').AsString;
         end;

         if cCuenta <> FieldByName('subcuenta').AsString then   begin
            if oConSubcuentas.Checked then   begin
               DMContaRef.QInfBalAcum.Append;
               DMContaRef.QInfBalAcum.Edit;
               DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString      := cCuenta;
               DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString := cDescripcion;
               if RGAcumulacion.ItemIndex = 0 then   begin
                  DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses[1];
                  DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses[2];
                  DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses[3];
                  DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses[4];
                  DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses[5];
                  DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses[6];
                  DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses[7];
                  DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses[8];
                  DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses[9];
                  DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses[10];
                  DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses[11];
                  DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
                     DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses[12];
               end
               else begin
                  DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses[1];
                  DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses[2];
                  DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses[3];
                  DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses[4];
                  DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses[5];
                  DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses[6];
                  DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses[7];
                  DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses[8];
                  DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses[9];
                  DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses[10];
                  DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses[11];
                  DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses[12];
               end;
               // Suma array
               nAuxImporte := 0;
               for i := 1 to 12 do begin
                  nAuxImporte := nAuxImporte + aMeses[i];
               end;
               DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
               // Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
               DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
               DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
               DMContaRef.QInfBalAcum.Post;
               // Inicializar array
               for i := 1 to 12 do begin
                  aMeses[i] := 0;
               end;
            end;
            cCuenta := FieldByName('subcuenta').AsString;
            QSubcuentas.Close;
            QSubcuentas.ParamByName('Subcuenta').AsString := cCuenta;
            QSubcuentas.ExecQuery;
            cDescripcion := QSubcuentas.FieldByName('Descripcion').AsString;
         end;

         if cCuenta1 <> Copy(FieldByName('subcuenta').AsString, 1, QFiltro.FieldByName('Nivel1').AsInteger) then
         begin
            DMContaRef.QInfBalAcum.Append;
            DMContaRef.QInfBalAcum.Edit;
            DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString := cCuenta1;
            QCuentas.Close;
            QCuentas.ParamByName('cuenta').AsString := cCuenta1;
            QCuentas.ExecQuery;
            DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString :=
               QCuentas.FieldByName('Descripcion').AsString;
            if RGAcumulacion.ItemIndex = 0 then   begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses1[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses1[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses1[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses1[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses1[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses1[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses1[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses1[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses1[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses1[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses1[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses1[12];
            end
            else begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses1[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses1[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses1[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses1[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses1[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses1[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses1[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses1[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses1[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses1[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses1[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses1[12];
            end;
            // Suma array
            nAuxImporte := 0;
            for i := 1 to 12 do begin
               nAuxImporte := nAuxImporte + aMeses1[i];
            end;
            DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
            DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
            DMContaRef.QInfBalAcum.Post;
            // Inicializar array
            for i := 1 to 12 do begin
               aMeses1[i] := 0;
            end;

            cCuenta1 := Copy(FieldByName('subcuenta').AsString, 1, QFiltro.FieldByName('Nivel1').AsInteger);
         end;

         if cCuenta2 <> Copy(FieldByName('subcuenta').AsString, 1, QFiltro.FieldByName('Nivel2').AsInteger) then
         begin
            DMContaRef.QInfBalAcum.Append;
            DMContaRef.QInfBalAcum.Edit;
            DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString := cCuenta2;
            QCuentas.Close;
            QCuentas.ParamByName('cuenta').AsString := cCuenta2;
            QCuentas.ExecQuery;
            DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString :=
               QCuentas.FieldByName('Descripcion').AsString;

            if RGAcumulacion.ItemIndex = 0 then   begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses2[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses2[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses2[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses2[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses2[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses2[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses2[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses2[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses2[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses2[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses2[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses2[12];
            end
            else begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses2[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses2[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses2[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses2[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses2[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses2[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses2[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses2[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses2[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses2[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses2[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses2[12];
            end;
            // Suma array
            nAuxImporte := 0;
            for i := 1 to 12 do begin
               nAuxImporte := nAuxImporte + aMeses2[i];
            end;
            DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
            DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
            DMContaRef.QInfBalAcum.Post;
            // Inicializar array
            for i := 1 to 12 do begin
               aMeses2[i] := 0;
            end;
            cCuenta2 := Copy(FieldByName('subcuenta').AsString, 1, Qfiltro.FieldByName('Nivel2').AsInteger);
         end;

         if FieldByName('Debehaber').AsString = 'D' then begin
            nPor := 1;
         end
         else begin
            nPor := -1;
         end;

         nMes := month(FieldByName('fecha').AsDateTime);

         nAuxImporte := ((nPor) * FieldByName('importe').AsFloat);

         aMeses[nMes]  := aMeses[nMes] + nAuxImporte;
         aMeses1[nMes] := aMeses1[nMes] + nAuxImporte;
         aMeses2[nMes] := aMeses2[nMes] + nAuxImporte;

         Next;
      end;
      // Suma final
      if not lPrimero then  begin
         if oConSubcuentas.Checked then   begin
            DMContaRef.QInfBalAcum.Append;
            DMContaRef.QInfBalAcum.Edit;
            DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString := cCuenta;
            QSubcuentas.Close;
            QSubcuentas.ParamByName('Subcuenta').AsString := cCuenta;
            QSubcuentas.ExecQuery;
            DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString :=
               QSubcuentas.FieldByName('Descripcion').AsString;
            if RGAcumulacion.ItemIndex = 0 then   begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
                  DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses[12];
            end
            else begin
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses[1];
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses[2];
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses[3];
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses[4];
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses[5];
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses[6];
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses[7];
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses[8];
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses[9];
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses[10];
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses[11];
               DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses[12];
            end;
            // Suma array
            nAuxImporte := 0;
            for i := 1 to 12 do begin
               nAuxImporte := nAuxImporte + aMeses[i];
            end;
            DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
            // Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
            DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
            DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
            DMContaRef.QInfBalAcum.Post;
         end;

         DMContaRef.QInfBalAcum.Append;
         DMContaRef.QInfBalAcum.Edit;
         DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString := cCuenta1;
         QCuentas.Close;
         QCuentas.ParamByName('cuenta').AsString := cCuenta1;
         QCuentas.ExecQuery;
         DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString :=
            QCuentas.FieldByName('Descripcion').AsString;
         if RGAcumulacion.ItemIndex = 0 then   begin
            DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses1[1];
            DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses1[2];
            DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses1[3];
            DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses1[4];
            DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses1[5];
            DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses1[6];
            DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses1[7];
            DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses1[8];
            DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses1[9];
            DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses1[10];
            DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses1[11];
            DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses1[12];
         end
         else begin
            DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses1[1];
            DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses1[2];
            DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses1[3];
            DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses1[4];
            DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses1[5];
            DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses1[6];
            DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses1[7];
            DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses1[8];
            DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses1[9];
            DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses1[10];
            DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses1[11];
            DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses1[12];
         end;
         // Suma array
         nAuxImporte := 0;
         for i := 1 to 12 do begin
            nAuxImporte := nAuxImporte + aMeses1[i];
         end;
         DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
         DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
         DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
         DMContaRef.QInfBalAcum.Post;


         DMContaRef.QInfBalAcum.Append;
         DMContaRef.QInfBalAcum.Edit;
         DMContaRef.QInfBalAcum.FieldByName('Cuenta').AsString := cCuenta2;
         QCuentas.Close;
         QCuentas.ParamByName('cuenta').AsString := cCuenta2;
         QCuentas.ExecQuery;
         DMContaRef.QInfBalAcum.FieldByName('Descripcion').AsString :=
            Qcuentas.FieldByName('Descripcion').AsString;
         if RGAcumulacion.ItemIndex = 0 then   begin
            DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses2[1];
            DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat + aMeses2[2];
            DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat + aMeses2[3];
            DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat + aMeses2[4];
            DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat + aMeses2[5];
            DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat + aMeses2[6];
            DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat + aMeses2[7];
            DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat + aMeses2[8];
            DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  :=
               DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat + aMeses2[9];
            DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat + aMeses2[10];
            DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat + aMeses2[11];
            DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat :=
               DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat + aMeses2[12];
         end
         else begin
            DMContaRef.QInfBalAcum.FieldByName('Mes1').AsFloat  := aMeses2[1];
            DMContaRef.QInfBalAcum.FieldByName('Mes2').AsFloat  := aMeses2[2];
            DMContaRef.QInfBalAcum.FieldByName('Mes3').AsFloat  := aMeses2[3];
            DMContaRef.QInfBalAcum.FieldByName('Mes4').AsFloat  := aMeses2[4];
            DMContaRef.QInfBalAcum.FieldByName('Mes5').AsFloat  := aMeses2[5];
            DMContaRef.QInfBalAcum.FieldByName('Mes6').AsFloat  := aMeses2[6];
            DMContaRef.QInfBalAcum.FieldByName('Mes7').AsFloat  := aMeses2[7];
            DMContaRef.QInfBalAcum.FieldByName('Mes8').AsFloat  := aMeses2[8];
            DMContaRef.QInfBalAcum.FieldByName('Mes9').AsFloat  := aMeses2[9];
            DMContaRef.QInfBalAcum.FieldByName('Mes10').AsFloat := aMeses2[10];
            DMContaRef.QInfBalAcum.FieldByName('Mes11').AsFloat := aMeses2[11];
            DMContaRef.QInfBalAcum.FieldByName('Mes12').AsFloat := aMeses2[12];
         end;
         // Suma array
         nAuxImporte := 0;
         for i := 1 to 12 do begin
            nAuxImporte := nAuxImporte + aMeses2[i];
         end;
         DMContaRef.QInfBalAcum.FieldByName('Total').AsFloat           := nAuxImporte;
         // Almacenar el intervalo de fechas y la fecha de impresión para
         //incluirlas en la descripción del listado.
         DMContaRef.QInfBalAcum.FieldByName('FechaInicial').AsDateTime := FechaInicial;
         DMContaRef.QInfBalAcum.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
         DMContaRef.QInfBalAcum.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
         DMContaRef.QInfBalAcum.FieldByName('TITULOLISTADO').AsString  := TituloBalance;
         DMContaRef.QInfBalAcum.Post;
      end; // lPrimero

      // Imprimir listado

      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas do begin
      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DMContaRef do begin
      QInfBalAcum.First;
      while not QInfBalAcum.EOF do begin
         if QInfBalAcumCUENTA.AsString = '' then   begin
            QInfBalAcum.Delete;
         end
         else begin
            QInfBalAcum.Edit;
            QInfBalAcumMES1.AsFloat  := ConversionImporte(QInfBalAcumMES1.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES2.AsFloat  := ConversionImporte(QInfBalAcumMES2.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES3.AsFloat  := ConversionImporte(QInfBalAcumMES3.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES4.AsFloat  := ConversionImporte(QInfBalAcumMES4.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES5.AsFloat  := ConversionImporte(QInfBalAcumMES5.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES6.AsFloat  := ConversionImporte(QInfBalAcumMES6.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES7.AsFloat  := ConversionImporte(QInfBalAcumMES7.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES8.AsFloat  := ConversionImporte(QInfBalAcumMES8.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES9.AsFloat  := ConversionImporte(QInfBalAcumMES9.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES10.AsFloat := ConversionImporte(QInfBalAcumMES10.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES11.AsFloat := ConversionImporte(QInfBalAcumMES11.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumMES12.AsFloat := ConversionImporte(QInfBalAcumMES12.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcumTOTAL.AsFloat := ConversionImporte(QInfBalAcumTOTAL.AsFloat, 'E',
               QFiltro.FieldByName('MONEDA').AsString);
            QInfBalAcum.Post;
            QInfBalAcum.Next;
         end;
      end;
      QInfBalAcum.First;
   end;

   Caratula.Cerrar;
   Caratula.Free;

   FormPrincipal.LanzarListado('LBALANCEACUMULADOS.RTM', DMContaRef.sInfBalAcum, gvMonedaListado);

   DMContaRef.InicializarFicherosInformes;
end;

procedure TWBalAcumulados.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWBalAcumulados.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWBalAcumulados.FormShow(Sender: TObject);
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
         Add('SubcuentaDesde' , ftString ,  10, False);
         Add('SubcuentaHasta' , ftString ,  10, False);
         Add('FechaDesde'     , ftDate   ,   0, False);
         Add('FechaHasta'     , ftDate   ,   0, False);
         Add('Moneda'         , ftString ,   1, False);
         Add('TipoConcepto'   , ftString ,   1, False);
         Add('FechaImprimir'  , ftDate   ,   0, False);
         Add('Nivel1'         , ftInteger,   0, False);
         Add('Nivel2'         , ftInteger,   0, False);
         Add('CUENTA'         , ftString ,  10, False);
         Add('CUENTAH'        , ftString ,  10, False);
         Add('ID_DELEGACION'  , ftString ,  10, False);
         Add('ID_DEPARTAMENTO', ftString ,  10, False);
         Add('ID_SECCION'     , ftString ,  10, False);
         Add('ID_PROYECTO'    , ftString ,  10, False);
      end;

      CreateDataSet;
      Active := True;
      Append;
      FieldByName('SubcuentaHasta').AsString   := REPLICATE('9', gvLongitudSubcuenta);
      FieldByName('FechaDesde'    ).AsDateTime := dPrimeraFecha;
      FieldByName('FechaHasta'    ).AsDateTime := dUltimaFecha;
      FieldByName('Moneda'        ).AsString   := DmRef.QParametros.FieldByName('MONEDA').AsString;
      FieldByName('TipoConcepto'  ).AsString   := 'T';
      FieldByName('FechaImprimir' ).Value      := Date;
      FieldByName('Nivel1'        ).AsInteger  := 3;
      FieldByName('Nivel2'        ).AsInteger  := 1;
   end;
   eFechaDesde.SetFocus;
   Screen.Cursor := crDefault;
end;

procedure TWBalAcumulados.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWBalAcumulados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario     := nil;
   WBalAcumulados := nil;
end;

procedure TWBalAcumulados.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWBalAcumulados.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
