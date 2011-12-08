unit UCierreEjercicio;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSql, jpeg, Mask, Messages,
     OvcBase, OvcDbNF, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, wwdblook,
     Wwkeycb, wwSpeedButton;
type
   TWCierreEjercicio = class(TForm)
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
      GroupBox1:      TGroupBox;
      oURecalculo:    TCheckBox;
      oUImpresion:    TCheckBox;
      oAAcumSaldosEjerAnt: TCheckBox;
      oAAcumSaldosAmortiz: TCheckBox;
      oARegularizacion: TCheckBox;
      oACierreApertura: TCheckBox;
      oABorrarAsientos: TCheckBox;
      Label2:         TLabel;
      oACambioFechas: TCheckBox;
      oARenumerado:   TCheckBox;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
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
      FFechaInicio, FFechaFin: TDateTime;
      FAsientoNormalReg, FAsientoEspecialReg, FAsientoNormalCierre, FAsientoEspecialCierre,
      FAsientoNormalApert, FAsientoEspecialApert: Integer;

      procedure ActualizarAcumulados_Cuentas_Subctas;
      procedure ActualizarAcumuladosAmortizaciones;
      procedure GenerarAsientoRegularizacion;
      procedure GenerarAsientos_Cierre_Apertura;
      procedure BorrarAsientos;
      procedure CambiarFechasNuevoEjercicio;
      procedure RenumerarAsientos;
   public
   end;

var WCierreEjercicio: TWCierreEjercicio;

implementation
uses DM, DMConta, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

procedure TWCierreEjercicio.ActualizarAcumulados_Cuentas_Subctas;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Database    := DMRef.IBDSiamCont;
      Transaction := DmRef.IBDSiamCont.DefaultTransaction;
      Clear;

      // Actualizar acumulados de CUENTAS
      Add('UPDATE CUENTAS SET   ');

      Add('   ANTDB01 = ACUDB01,');
      Add('   ANTDB02 = ACUDB02,');
      Add('   ANTDB03 = ACUDB03,');
      Add('   ANTDB04 = ACUDB04,');
      Add('   ANTDB05 = ACUDB05,');
      Add('   ANTDB06 = ACUDB06,');
      Add('   ANTDB07 = ACUDB07,');
      Add('   ANTDB08 = ACUDB08,');
      Add('   ANTDB09 = ACUDB09,');
      Add('   ANTDB10 = ACUDB10,');
      Add('   ANTDB11 = ACUDB11,');
      Add('   ANTDB12 = ACUDB12,');

      Add('   ANTHB01 = ACUHB01,');
      Add('   ANTHB02 = ACUHB02,');
      Add('   ANTHB03 = ACUHB03,');
      Add('   ANTHB04 = ACUHB04,');
      Add('   ANTHB05 = ACUHB05,');
      Add('   ANTHB06 = ACUHB06,');
      Add('   ANTHB07 = ACUHB07,');
      Add('   ANTHB08 = ACUHB08,');
      Add('   ANTHB09 = ACUHB09,');
      Add('   ANTHB10 = ACUHB10,');
      Add('   ANTHB11 = ACUHB11,');
      Add('   ANTHB12 = ACUHB12,');

      Add('   ANTDB = ACUDB01 + ACUDB02 + ACUDB03 + ACUDB04 + ACUDB05 + ACUDB06 +');
      Add('           ACUDB07 + ACUDB08 + ACUDB09 + ACUDB10 + ACUDB11 + ACUDB12,');
      Add('   ANTHB = ACUHB01 + ACUHB02 + ACUHB03 + ACUHB04 + ACUHB05 + ACUHB06 +');
      Add('           ACUHB07 + ACUHB08 + ACUHB09 + ACUHB10 + ACUHB11 + ACUHB12');

      ExecSql;
      Transaction.CommitRetaining;

      Close;
      Clear;

      // Actualizar acumulados de SUBCUENTAS
      Add('UPDATE SUBCTAS SET   ');

      Add('   ANTDB01 = ACUDB01,');
      Add('   ANTDB02 = ACUDB02,');
      Add('   ANTDB03 = ACUDB03,');
      Add('   ANTDB04 = ACUDB04,');
      Add('   ANTDB05 = ACUDB05,');
      Add('   ANTDB06 = ACUDB06,');
      Add('   ANTDB07 = ACUDB07,');
      Add('   ANTDB08 = ACUDB08,');
      Add('   ANTDB09 = ACUDB09,');
      Add('   ANTDB10 = ACUDB10,');
      Add('   ANTDB11 = ACUDB11,');
      Add('   ANTDB12 = ACUDB12,');

      Add('   ANTHB01 = ACUHB01,');
      Add('   ANTHB02 = ACUHB02,');
      Add('   ANTHB03 = ACUHB03,');
      Add('   ANTHB04 = ACUHB04,');
      Add('   ANTHB05 = ACUHB05,');
      Add('   ANTHB06 = ACUHB06,');
      Add('   ANTHB07 = ACUHB07,');
      Add('   ANTHB08 = ACUHB08,');
      Add('   ANTHB09 = ACUHB09,');
      Add('   ANTHB10 = ACUHB10,');
      Add('   ANTHB11 = ACUHB11,');
      Add('   ANTHB12 = ACUHB12,');

      Add('   ANTDB = ACUDB01 + ACUDB02 + ACUDB03 + ACUDB04 + ACUDB05 + ACUDB06 +');
      Add('           ACUDB07 + ACUDB08 + ACUDB09 + ACUDB10 + ACUDB11 + ACUDB12,');
      Add('   ANTHB = ACUHB01 + ACUHB02 + ACUHB03 + ACUHB04 + ACUHB05 + ACUHB06 +');
      Add('           ACUHB07 + ACUHB08 + ACUHB09 + ACUHB10 + ACUHB11 + ACUHB12');

      ExecSql;
      Transaction.CommitRetaining;
      Close;
      Free;
   end;

   oAAcumSaldosEjerAnt.Caption := 'Acumular saldos del ejercicio anterior     [OK]';
end;

procedure TWCierreEjercicio.ActualizarAcumuladosAmortizaciones;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('UPDATE AMORTIZA SET                     ');
      Add('   VEJPINICIO = VEJPINICIO + VEJAINICIO,');
      Add('   VEJPAMOR = VEJAAMOR,                 ');
      Add('   VEJAINICIO = 0                       ');
      ExecSql;
      Transaction.CommitRetaining;
      Close;
      Free;
   end;
   oAAcumSaldosAmortiz.Caption := 'Acumular saldos de amortizaciones     [OK]';
end;

procedure TWCierreEjercicio.GenerarAsientoRegularizacion;
var
   QInsApunte:   TIBQuery;
   QSubcuentas, QAsientos: TIBQuery;
   nIDNormal, nIHNormal, nIDEspecial, nIHEspecial, nITDNormal, nITHNormal, nITDEspecial,
   nITHEspecial: Double;
   AsientoNormal, AsientoEspecial, ApunteNormal, ApunteEspecial: Integer;
begin
   // Inserción de apuntes
   QInsApunte := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsApunte, SQL do begin
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO DIARIO                                           ');
      Add('(APUNTE, ASIENTO, COMENTARIO, CONTRAPARTIDA, DEBEHABER,      ');
      Add(' FECHA, IMPORTE, MONEDA, SUBCUENTA, ID_CONCEPTOS)            ');
      Add('VALUES                                                       ');
      Add('(:APUNTE, :ASIENTO, :COMENTARIO, :CONTRAPARTIDA, :DEBEHABER, ');
      Add(' :FECHA, :IMPORTE, :MONEDA, :SUBCUENTA, :ID_CONCEPTOS)       ');
   end;

   // Selección de subcuentas
   QSubcuentas := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT S.SUBCUENTA FROM SUBCTAS S                     ');
      Add('WHERE (S.SUBCUENTA LIKE "6%") OR (SUBCUENTA LIKE "7%")');
      Add('ORDER BY S.SUBCUENTA                                  ');
      Open;
   end;

   // Selección de apuntes
   QAsientos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT D.IMPORTE, D.DEBEHABER ');
      Add('FROM DIARIO D, CONCEPTOS C                                       ');
      Add('WHERE                                                            ');
      Add('   D.SUBCUENTA = :SUBCUENTA AND                                  ');
      Add('   D.FECHA >= :FECHAINI AND D.FECHA <= :FECHAFIN AND             ');
      Add('   C.TIPOCONTABILIDAD = :TIPOCONTABILIDAD AND                    ');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS                               ');
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsApunte do begin
      AsientoNormal   := 0;
      AsientoEspecial := 0;

      ApunteNormal   := 0;
      ApunteEspecial := 0;

      nITDNormal   := 0;
      nITHNormal   := 0;
      nITDEspecial := 0;
      nITHEspecial := 0;

      while not QSubcuentas.EOF do begin
         nIDNormal   := 0;
         nIHNormal   := 0;
         nIDEspecial := 0;
         nIHEspecial := 0;

         // Saldo Normal
         QAsientos.Close;
         QAsientos.ParamByName('SUBCUENTA').AsString        := QSubcuentas.FieldByName('SUBCUENTA').AsString;
         QAsientos.ParamByName('FECHAINI').AsDateTime       := FFechaInicio;
         QAsientos.ParamByName('FECHAFIN').AsDateTime       := FFechaFin;
         QAsientos.ParamByName('TIPOCONTABILIDAD').AsString := 'N';
         QAsientos.Open;
         while not QAsientos.EOF do begin
            if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
               nIDNormal  := nIDNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITDNormal := nITDNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
            end
            else begin
               nIHNormal  := nIHNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITHNormal := nITHNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
            end;
            QAsientos.Next;
         end;    // while not QAsientos.Eof do

         // Saldo Especial
         QAsientos.Close;
         QAsientos.ParamByName('SUBCUENTA').AsString        := QSubcuentas.FieldByName('SUBCUENTA').AsString;
         QAsientos.ParamByName('FECHAINI').AsDateTime       := FFechaInicio;
         QAsientos.ParamByName('FECHAFIN').AsDateTime       := FFechaFin;
         QAsientos.ParamByName('TIPOCONTABILIDAD').AsString := 'E';
         QAsientos.Open;
         while not QAsientos.EOF do begin
            if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
               nIDEspecial  := nIDEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITDEspecial := nITDEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
            end
            else begin
               nIHEspecial  := nIHEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITHEspecial := nITHEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
            end;
            QAsientos.Next;
         end;    // while not QAsientos.Eof do

         // Apunte Saldo Normal
         if RoundToDecimal(nIDNormal - nIHNormal, 2, True) <> 0 then   begin
            if AsientoNormal = 0 then   begin
               AsientoNormal := DMContaRef.ObtenerNumeroAsiento;
            end;

            Inc(ApunteNormal);
            Close;
            ParamByName('APUNTE').AsInteger       := ApunteNormal;
            ParamByName('ASIENTO').AsInteger      := AsientoNormal;
            ParamByName('COMENTARIO').AsString    := 'ASTO. REGULARIZACION';
            ParamByName('CONTRAPARTIDA').AsString :=
               DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
            if RoundToDecimal(nIDNormal - nIHNormal, 2, True) > 0 then   begin
               ParamByName('DEBEHABER').AsString := 'H';
            end
            else begin
               ParamByName('DEBEHABER').AsString := 'D';
            end;
            ParamByName('FECHA').AsDateTime      := FFechaFin;
            ParamByName('IMPORTE').AsFloat       := Abs(RoundToDecimal(nIDNormal - nIHNormal, 2, True));
            ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
            ParamByName('SUBCUENTA').AsString    := QSubcuentas.FieldByName('SUBCUENTA').AsString;
            ParamByName('ID_CONCEPTOS').AsString :=
               DMRef.QParametros.FieldByName('CTO_REGULARIZACION').AsString;
            ExecSql;
            Transaction.CommitRetaining;
         end;

         // Apunte Saldo Especial
         if RoundToDecimal(nIDEspecial - nIHEspecial, 2, True) <> 0 then   begin
            if AsientoEspecial = 0 then   begin
               AsientoEspecial := DMContaRef.ObtenerNumeroAsiento;
            end;

            Inc(ApunteEspecial);
            Close;
            ParamByName('APUNTE').AsInteger       := ApunteEspecial;
            ParamByName('ASIENTO').AsInteger      := AsientoEspecial;
            ParamByName('COMENTARIO').AsString    := 'ASTO. REGULARIZACION';
            ParamByName('CONTRAPARTIDA').AsString :=
               DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
            if RoundToDecimal(nIDEspecial - nIHEspecial, 2, True) > 0 then   begin
               ParamByName('DEBEHABER').AsString := 'H';
            end
            else begin
               ParamByName('DEBEHABER').AsString := 'D';
            end;
            ParamByName('FECHA').AsDateTime      := FFechaFin;
            ParamByName('IMPORTE').AsFloat       :=
               Abs(RoundToDecimal(nIDEspecial - nIHEspecial, 2, True));
            ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
            ParamByName('SUBCUENTA').AsString    := QSubcuentas.FieldByName('SUBCUENTA').AsString;
            ParamByName('ID_CONCEPTOS').AsString :=
               DMRef.QParametros.FieldByName('CTO_REGULARIZACION_ESP').AsString;
            ExecSql;
            Transaction.CommitRetaining;
         end;

         QSubcuentas.Next;
      end;    // while not QSubcuentas.Eof do

      // Subcuenta 1290000    (Saldo Normal)
      if RoundToDecimal(nITDNormal - nITHNormal, 2, True) <> 0 then   begin
         if AsientoNormal = 0 then   begin
            AsientoNormal := DMContaRef.ObtenerNumeroAsiento;
         end;

         Inc(ApunteNormal);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteNormal;
         ParamByName('ASIENTO').AsInteger      := AsientoNormal;
         ParamByName('COMENTARIO').AsString    := 'ASTO. REGULARIZACION';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if RoundToDecimal(nITDNormal - nITHNormal, 2, True) > 0 then   begin
            ParamByName('DEBEHABER').AsString := 'D';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'H';
         end;
         ParamByName('FECHA').AsDateTime      := FFechaFin;
         ParamByName('IMPORTE').AsFloat       := Abs(RoundToDecimal(nITDNormal - nITHNormal, 2, True));
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         ParamByName('ID_CONCEPTOS').AsString :=
            DMRef.QParametros.FieldByName('CTO_REGULARIZACION').AsString;
         ExecSql;
         Transaction.CommitRetaining;
      end;

      // Subcuenta 1290000    (Saldo Especial)
      if RoundToDecimal(nITDEspecial - nITHEspecial, 2, True) <> 0 then   begin
         if AsientoEspecial = 0 then   begin
            AsientoEspecial := DMContaRef.ObtenerNumeroAsiento;
         end;

         Inc(ApunteEspecial);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteEspecial;
         ParamByName('ASIENTO').AsInteger      := AsientoEspecial;
         ParamByName('COMENTARIO').AsString    := 'ASTO. REGULARIZACION';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if RoundToDecimal(nITDEspecial - nITHEspecial, 2, True) > 0 then   begin
            ParamByName('DEBEHABER').AsString := 'D';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'H';
         end;
         ParamByName('FECHA').AsDateTime      := FFechaFin;
         ParamByName('IMPORTE').AsFloat       :=
            Abs(RoundToDecimal(nITDEspecial - nITHEspecial, 2, True));
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         ParamByName('ID_CONCEPTOS').AsString :=
            DMRef.QParametros.FieldByName('CTO_REGULARIZACION_ESP').AsString;
         ExecSql;
         Transaction.CommitRetaining;
      end;
   end;    

   QInsApunte.Close;
   QInsApunte.Free;
   QSubcuentas.Close;
   QSubcuentas.Free;
   QAsientos.Close;
   QAsientos.Free;

   oARegularizacion.Caption := 'Asiento de regularización     [OK]';

   // Almacenar el número de los asientos de regulación generados
   FAsientoNormalReg   := AsientoNormal;
   FAsientoEspecialReg := AsientoEspecial;
end;

procedure TWCierreEjercicio.GenerarAsientos_Cierre_Apertura;
var
   QInsApunte:   TIBQuery;
   QSubcuentas, QAsientos: TIBQuery;
   nIDNormal, nIHNormal, nIDEspecial, nIHEspecial, nITDNormal, nITHNormal, nITDEspecial,
   nITHEspecial: Double;
   AsientoNormalCierre, AsientoEspecialCierre, AsientoNormalApertura, AsientoEspecialApertura,
   ApunteNormal, ApunteEspecial: Integer;
   cEj:          String;
begin
   cEj        := IntToStr(Year(FFechaFin) + 1);
   // Inserción de apuntes
   QInsApunte := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsApunte, SQL do begin
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO DIARIO                                           ');
      Add('(APUNTE, ASIENTO, COMENTARIO, CONTRAPARTIDA, DEBEHABER,      ');
      Add(' FECHA, IMPORTE, MONEDA, SUBCUENTA, ID_CONCEPTOS)            ');
      Add('VALUES                                                       ');
      Add('(:APUNTE, :ASIENTO, :COMENTARIO, :CONTRAPARTIDA, :DEBEHABER, ');
      Add(' :FECHA, :IMPORTE, :MONEDA, :SUBCUENTA, :ID_CONCEPTOS)       ');
   end;

   // Selección de subcuentas
   QSubcuentas := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT S.SUBCUENTA FROM SUBCTAS S                           ');
      Add('WHERE NOT ((S.SUBCUENTA LIKE "6%") OR (SUBCUENTA LIKE "7%"))');
      Add('ORDER BY S.SUBCUENTA                                        ');
      Open;
   end;

   // Selección de apuntes
   QAsientos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT D.IMPORTE, D.DEBEHABER ');
      Add('FROM DIARIO D, CONCEPTOS C                                       ');
      Add('WHERE                                                            ');
      Add('   D.SUBCUENTA = :SUBCUENTA AND                                  ');
      Add('   D.FECHA >= :FECHAINI AND D.FECHA <= :FECHAFIN AND             ');
      Add('   C.TIPOCONTABILIDAD = :TIPOCONTABILIDAD AND                    ');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS                               ');
   end;


   // Generación de asiento de cierre
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsApunte do begin
      AsientoNormalCierre   := 0;
      AsientoEspecialCierre := 0;

      ApunteNormal   := 0;
      ApunteEspecial := 0;

      nITDNormal   := 0;
      nITHNormal   := 0;
      nITDEspecial := 0;
      nITHEspecial := 0;

      while not QSubcuentas.EOF do begin
         nIDNormal   := 0;
         nIHNormal   := 0;
         nIDEspecial := 0;
         nIHEspecial := 0;

         // Saldo Normal
         QAsientos.Close;
         QAsientos.ParamByName('SUBCUENTA').AsString        := QSubcuentas.FieldByName('SUBCUENTA').AsString;
         QAsientos.ParamByName('FECHAINI').AsDateTime       := FFechaInicio;
         QAsientos.ParamByName('FECHAFIN').AsDateTime       := FFechaFin;
         QAsientos.ParamByName('TIPOCONTABILIDAD').AsString := 'N';
         QAsientos.Open;
         while not QAsientos.EOF do begin
            if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
               nIDNormal  := nIDNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITDNormal := nITDNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
            end
            else begin
               nIHNormal  := nIHNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITHNormal := nITHNormal + QAsientos.FieldByName('IMPORTE').AsFloat;
            end;
            QAsientos.Next;
         end;    // while not QAsientos.Eof do

         // Saldo Especial
         QAsientos.Close;
         QAsientos.ParamByName('SUBCUENTA').AsString        := QSubcuentas.FieldByName('SUBCUENTA').AsString;
         QAsientos.ParamByName('FECHAINI').AsDateTime       := FFechaInicio;
         QAsientos.ParamByName('FECHAFIN').AsDateTime       := FFechaFin;
         QAsientos.ParamByName('TIPOCONTABILIDAD').AsString := 'E';
         QAsientos.Open;
         while not QAsientos.EOF do begin
            if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
               nIDEspecial  := nIDEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITDEspecial := nITDEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
            end
            else begin
               nIHEspecial  := nIHEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
               nITHEspecial := nITHEspecial + QAsientos.FieldByName('IMPORTE').AsFloat;
            end;
            QAsientos.Next;
         end;    // while not QAsientos.Eof do

         // Apunte Saldo Normal
         if RoundToDecimal(nIDNormal - nIHNormal, 2, True) <> 0 then   begin
            if AsientoNormalCierre = 0 then   begin
               AsientoNormalCierre := DMContaRef.ObtenerNumeroAsiento;
            end;

            Inc(ApunteNormal);
            Close;
            ParamByName('APUNTE').AsInteger       := ApunteNormal;
            ParamByName('ASIENTO').AsInteger      := AsientoNormalCierre;
            ParamByName('COMENTARIO').AsString    := 'ASTO. CIERRE';
            ParamByName('CONTRAPARTIDA').AsString :=
               DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
            if RoundToDecimal(nIDNormal - nIHNormal, 2, True) > 0 then   begin
               ParamByName('DEBEHABER').AsString := 'H';
            end
            else begin
               ParamByName('DEBEHABER').AsString := 'D';
            end;
            ParamByName('FECHA').AsDateTime      := FFechaFin;
            ParamByName('IMPORTE').AsFloat       := Abs(RoundToDecimal(nIDNormal - nIHNormal, 2, True));
            ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
            ParamByName('SUBCUENTA').AsString    := QSubcuentas.FieldByName('SUBCUENTA').AsString;
            ParamByName('ID_CONCEPTOS').AsString :=
               DMRef.QParametros.FieldByName('CTO_REGULARIZACION').AsString;
            ExecSql;
            Transaction.CommitRetaining;
         end;

         // Apunte Saldo Especial
         if RoundToDecimal(nIDEspecial - nIHEspecial, 2, True) <> 0 then   begin
            if AsientoEspecialCierre = 0 then   begin
               AsientoEspecialCierre := DMContaRef.ObtenerNumeroAsiento;
            end;

            Inc(ApunteEspecial);
            Close;
            ParamByName('APUNTE').AsInteger       := ApunteEspecial;
            ParamByName('ASIENTO').AsInteger      := AsientoEspecialCierre;
            ParamByName('COMENTARIO').AsString    := 'ASTO. CIERRE';
            ParamByName('CONTRAPARTIDA').AsString :=
               DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
            if RoundToDecimal(nIDEspecial - nIHEspecial, 2, True) > 0 then   begin
               ParamByName('DEBEHABER').AsString := 'H';
            end
            else begin
               ParamByName('DEBEHABER').AsString := 'D';
            end;
            ParamByName('FECHA').AsDateTime      := FFechaFin;
            ParamByName('IMPORTE').AsFloat       :=
               Abs(RoundToDecimal(nIDEspecial - nIHEspecial, 2, True));
            ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
            ParamByName('SUBCUENTA').AsString    := QSubcuentas.FieldByName('SUBCUENTA').AsString;
            ParamByName('ID_CONCEPTOS').AsString :=
               DMRef.QParametros.FieldByName('CTO_REGULARIZACION_ESP').AsString;
            ExecSql;
            Transaction.CommitRetaining;
         end;

         QSubcuentas.Next;
      end;    // while not QSubcuentas.Eof do

      // Subcuenta 1290000    (Saldo Normal)
      if RoundToDecimal(nITDNormal - nITHNormal, 2, True) <> 0 then   begin
         if AsientoNormalCierre = 0 then   begin
            AsientoNormalCierre := DMContaRef.ObtenerNumeroAsiento;
         end;

         Inc(ApunteNormal);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteNormal;
         ParamByName('ASIENTO').AsInteger      := AsientoNormalCierre;
         ParamByName('COMENTARIO').AsString    := 'ASTO. CIERRE';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if RoundToDecimal(nITDNormal - nITHNormal, 2, True) > 0 then   begin
            ParamByName('DEBEHABER').AsString := 'D';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'H';
         end;
         ParamByName('FECHA').AsDateTime      := FFechaFin;
         ParamByName('IMPORTE').AsFloat       := Abs(RoundToDecimal(nITDNormal - nITHNormal, 2, True));
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         ParamByName('ID_CONCEPTOS').AsString :=
            DMRef.QParametros.FieldByName('CTO_REGULARIZACION').AsString;
         ExecSql;
         Transaction.CommitRetaining;
      end;

      // Subcuenta 1290000    (Saldo Especial)
      if RoundToDecimal(nITDEspecial - nITHEspecial, 2, True) <> 0 then   begin
         if AsientoEspecialCierre = 0 then   begin
            AsientoEspecialCierre := DMContaRef.ObtenerNumeroAsiento;
         end;

         Inc(ApunteEspecial);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteEspecial;
         ParamByName('ASIENTO').AsInteger      := AsientoEspecialCierre;
         ParamByName('COMENTARIO').AsString    := 'ASTO. CIERRE';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if RoundToDecimal(nITDEspecial - nITHEspecial, 2, True) > 0 then   begin
            ParamByName('DEBEHABER').AsString := 'D';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'H';
         end;
         ParamByName('FECHA').AsDateTime      := FFechaFin;
         ParamByName('IMPORTE').AsFloat       := Abs(RoundToDecimal(nITDEspecial - nITHEspecial, 2, True));
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         ParamByName('ID_CONCEPTOS').AsString :=
            DMRef.QParametros.FieldByName('CTO_REGULARIZACION_ESP').AsString;
         ExecSql;
         Transaction.CommitRetaining;
      end;
   end;    

   // Generación de asiento de apertura
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Close;
      Clear;
      Add('SELECT * FROM DIARIO WHERE ASIENTO = :ASIENTO ORDER BY APUNTE');
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QInsApunte do begin
      AsientoNormalApertura   := 0;
      AsientoEspecialApertura := 0;

      // Asiento de apertura Normal
      QAsientos.Close;
      QAsientos.ParamByName('ASIENTO').AsInteger := AsientoNormalCierre;
      QAsientos.Open;
      ApunteNormal := 0;

      if not QAsientos.EOF and (AsientoNormalApertura = 0) then   begin
         AsientoNormalApertura := DMContaRef.ObtenerNumeroAsiento;
      end;

      while not QAsientos.EOF do begin
         Inc(ApunteNormal);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteNormal;
         ParamByName('ASIENTO').AsInteger      := AsientoNormalApertura;
         ParamByName('COMENTARIO').AsString    := 'ASTO. APERTURA';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
            ParamByName('DEBEHABER').AsString := 'H';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'D';
         end;
         //      ParamByName('FECHA').AsDateTime       := StrToDateTime('01/01/' + IntToStr(Year(Date)));
         ParamByName('FECHA').AsDateTime      := StrToDateTime('01/01/' + cEj);
         ParamByName('IMPORTE').AsFloat       :=
            RoundToDecimal(QAsientos.FieldByName('IMPORTE').AsFloat, 2, True);
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    := QAsientos.FieldByName('SUBCUENTA').AsString;
         ParamByName('ID_CONCEPTOS').AsString := DMRef.QParametros.FieldByName('CTO_APERTURA').AsString;
         ExecSql;
         Transaction.CommitRetaining;

         QAsientos.Next;
      end;    // while not QAsientos.Eof do

      // Asiento de apertura Especial
      QAsientos.Close;
      QAsientos.ParamByName('ASIENTO').AsInteger := AsientoEspecialCierre;
      QAsientos.Open;
      ApunteEspecial := 0;

      if not QAsientos.EOF and (AsientoEspecialApertura = 0) then   begin
         AsientoEspecialApertura := DMContaRef.ObtenerNumeroAsiento;
      end;

      while not QAsientos.EOF do begin
         Inc(ApunteEspecial);
         Close;
         ParamByName('APUNTE').AsInteger       := ApunteEspecial;
         ParamByName('ASIENTO').AsInteger      := AsientoEspecialApertura;
         ParamByName('COMENTARIO').AsString    := 'ASTO. APERTURA';
         ParamByName('CONTRAPARTIDA').AsString :=
            DMRef.QParametros.FieldByName('SUBCUENTA_CIERRE').AsString;
         if QAsientos.FieldByName('DEBEHABER').AsString = 'D' then   begin
            ParamByName('DEBEHABER').AsString := 'H';
         end
         else begin
            ParamByName('DEBEHABER').AsString := 'D';
         end;
         ParamByName('FECHA').AsDateTime      := StrToDateTime('01/01/' + cEj);
         ParamByName('IMPORTE').AsFloat       :=
            RoundToDecimal(QAsientos.FieldByName('IMPORTE').AsFloat, 2, True);
         ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         ParamByName('SUBCUENTA').AsString    := QAsientos.FieldByName('SUBCUENTA').AsString;
         ParamByName('ID_CONCEPTOS').AsString :=
            DMRef.QParametros.FieldByName('CTO_APERTURA_ESP').AsString;
         ExecSql;
         Transaction.CommitRetaining;

         QAsientos.Next;
      end;
   end;

   QInsApunte.Close;
   QInsApunte.Free;
   QSubcuentas.Close;
   QSubcuentas.Free;
   QAsientos.Close;
   QAsientos.Free;

   oACierreApertura.Caption := 'Asientos de cierre y apertura     [OK]';

   // Almacenar el número de los asientos de cierre generados
   FAsientoNormalCierre   := AsientoNormalCierre;
   FAsientoEspecialCierre := AsientoEspecialCierre;

   // Almacenar el número de los asientos de apertura generados
   FAsientoNormalApert   := AsientoNormalApertura;
   FAsientoEspecialApert := AsientoEspecialApertura;
end;

procedure TWCierreEjercicio.BorrarAsientos;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database    := DMRef.IBDSiamCont;
      Transaction := DmRef.IBDSiamCont.DefaultTransaction;

      // Desactivar triggers
      Close;
      Clear;
      Add('UPDATE RDB$TRIGGERS SET RDB$TRIGGER_INACTIVE = 1');
      Add('WHERE UPPER(RDB$RELATION_NAME) = "DIARIO"       ');
      ExecQuery;
      Transaction.CommitRetaining;

      // Borrado de asientos del ejercicio actual
      Close;
      Clear;
      Add('DELETE FROM DIARIO WHERE FECHA >= :FECHAINI AND FECHA <= :FECHAFIN');
      ParamByName('FECHAINI').AsDateTime := FFechaInicio;
      ParamByName('FECHAFIN').AsDateTime := FFechaFin;
      ExecQuery;
      Transaction.CommitRetaining;

      // Recalcular saldos ejercicio actual
      Close;
      Clear;
      Add('EXECUTE PROCEDURE RECALCULOSALDOS (:EJERCICIO)');
      Params.ByName('EJERCICIO').AsInteger := Year(Date);
      ExecQuery;
      Transaction.CommitRetaining;

      // Activar triggers
      Close;
      Clear;
      Add('UPDATE RDB$TRIGGERS SET RDB$TRIGGER_INACTIVE = 0');
      Add('WHERE UPPER(RDB$RELATION_NAME) = "DIARIO"       ');
      ExecQuery;
      Transaction.CommitRetaining;

      Close;
      Free;
   end;

   oABorrarAsientos.Caption := 'Borrar asientos entre las fechas ' +
      DateToStr(FFechaInicio) + ' a ' + DateToStr(FFechaFin) +
      '  [OK]';
end;

procedure TWCierreEjercicio.CambiarFechasNuevoEjercicio;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database    := DMRef.IBDSiamCont;
      Transaction := DmRef.IBDSiamCont.DefaultTransaction;

      // Actualizar fechas ejercicio
      Close;
      Clear;
      Add('UPDATE PARAMETROS SET                    ');
      Add('   FECHA_INICIO_EJERCICIO = :FECHAINICIO,');
      Add('   FECHA_FIN_EJERCICIO = :FECHAFIN       ');
      Add('WHERE ID_PARAMETROS = :ID_PARAMETROS     ');
      ParamByName('FECHAINICIO').AsDateTime  := StrToDateTime('01/01/' + IntToStr(Year(Date)));
      ParamByName('FECHAFIN').AsDateTime     := StrToDateTime('31/12/' + IntToStr(Year(Date)));
      ParamByName('ID_PARAMETROS').AsInteger := DMRef.QParametros.FieldByName('ID_PARAMETROS').AsInteger;
      ExecQuery;
      Transaction.CommitRetaining;
      //FIbQueryRefresh(DMRef.QParametros);

      Close;
      Free;
   end;

   oACambioFechas.Caption := 'Cambiar fechas del nuevo ejercicio     [OK]';
end;

procedure TWCierreEjercicio.RenumerarAsientos;
var
   QAsientos: TIBQuery;
   AsientoAnt, NuevoAsiento: Integer;
begin
   QAsientos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Database    := DMRef.IBDSiamCont;
      Transaction := DmRef.IBDSiamCont.DefaultTransaction;
      Close;
      Clear;
      Add('SELECT * FROM DIARIO                           ');
      Add('WHERE FECHA >= :FECHAINI AND FECHA <= :FECHAFIN');
      Add('ORDER BY FECHA, ASIENTO                        ');
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Database    := DMRef.IBDSiamCont;
      Transaction := DmRef.IBDSiamCont.DefaultTransaction;

      // Desactivar triggers
      Close;
      Clear;
      Add('UPDATE RDB$TRIGGERS SET RDB$TRIGGER_INACTIVE = 1');
      Add('WHERE UPPER(RDB$RELATION_NAME) = "DIARIO"       ');
      ExecQuery;
      Transaction.CommitRetaining;

      // Renumerar asientos
      Close;
      Clear;
      Add('UPDATE DIARIO SET ASIENTO = :ASIENTO');
      Add('WHERE ID_DIARIO = :ID_DIARIO        ');

      QAsientos.Close;
      QAsientos.ParamByName('FECHAINI').AsDateTime :=
         DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
      QAsientos.ParamByName('FECHAFIN').AsDateTime :=
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
      QAsientos.Open;

      AsientoAnt   := 0;
      NuevoAsiento := 0;
      while not QAsientos.EOF do begin
         if AsientoAnt <> QAsientos.FieldByName('ASIENTO').AsInteger then   begin
            AsientoAnt := QAsientos.FieldByName('ASIENTO').AsInteger;
            Inc(NuevoAsiento);
         end;
         Close;
         ParamByName('ASIENTO').AsInteger   := NuevoAsiento;
         ParamByName('ID_DIARIO').AsInteger := QAsientos.FieldByName('ID_DIARIO').AsInteger;
         ExecQuery;
         Transaction.CommitRetaining;

         QAsientos.Next;
      end;

      // Actualizar contadores de asientos
      DmContaRef.Actualizar_contador('asiento', NuevoAsiento);

      // Activar triggers
      Close;
      Clear;
      Add('UPDATE RDB$TRIGGERS SET RDB$TRIGGER_INACTIVE = 0');
      Add('WHERE UPPER(RDB$RELATION_NAME) = "DIARIO"       ');
      ExecQuery;
      Transaction.CommitRetaining;

      Close;
      Free;
   end;

   oARenumerado.Caption := 'Renumerar asientos     [OK]';
end;

procedure TWCierreEjercicio.BtnEdtProcesarClick(Sender: TObject);
var
   Caratula: TEspere;
   Msg:      String;
begin
   // Comprobar opciones de usuario
   if not oURecalculo.Checked then   begin
      DatabaseError('Debe realizar previamente el recálculo de saldos.');
   end;
   if not oUImpresion.Checked then   begin
      DatabaseError('Debe realizar previamente la impresión de los listados y balances.');
   end;


   Caratula           := TEspere.Create(nil);
   Caratula.Mensaje   := 'Cierre de Ejercicio ...';
   Caratula.Ancho     := 300;
   Caratula.Alto      := 150;
   Caratula.Avi_Left  := 20;
   Caratula.Avi_Top   := 80;
   Caratula.Fuente.Color := clWhite;
   Caratula.Fuente.Name := 'Arial';
   Caratula.Fuente.Size := 14;
   Caratula.Mensaje_Left := 14;
   Caratula.Mensaje_Top := 14;
   Caratula.Avi_Color := $00A56D39;
   Caratula.ColorFondo := $00A56D39;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet := Ninguno;
   Caratula.Avi_File  := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   // Comprobar opciones automatizadas   (PASO 1)
   if oAAcumSaldosAmortiz.Checked then  begin
      Caratula.Mensaje := 'Acumular saldos amortizaciones ...';
      Caratula.Mostrar;
      ActualizarAcumuladosAmortizaciones;
   end;

   if oARegularizacion.Checked then  begin
      Caratula.Mensaje := 'Asiento regularización ...';
      Caratula.Mostrar;
      GenerarAsientoRegularizacion;
   end;

   if oACierreApertura.Checked then  begin
      Caratula.Mensaje := 'Asientos cierre y apertura ...';
      Caratula.Mostrar;
      GenerarAsientos_Cierre_Apertura;
   end;

   // Comprobar opciones automatizadas   (PASO 2)
   if oAAcumSaldosEjerAnt.Checked or oABorrarAsientos.Checked or oACambioFechas.Checked or
      oARenumerado.Checked then  begin
      Caratula.Cerrar;
      if MessageDlg('¿Confirma que ha realizado correctamente el duplicado de la empresa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if oAAcumSaldosEjerAnt.Checked then   begin
            Caratula.Mensaje := 'Acumular saldos ejer. anterior ...';
            Caratula.Mostrar;
            ActualizarAcumulados_Cuentas_Subctas;
         end;

         if oABorrarAsientos.Checked then   begin
            Caratula.Mensaje := 'Borrar asientos ejer. actual ...';
            Caratula.Mostrar;
            BorrarAsientos;
         end;

         if oACambioFechas.Checked then   begin
            Caratula.Mensaje := 'Cambiar fechas nuevo ejercicio ...';
            Caratula.Mostrar;
            CambiarFechasNuevoEjercicio;
         end;

         if oARenumerado.Checked then   begin
            Caratula.Mensaje := 'Renumerar asientos ...';
            Caratula.Mostrar;
            RenumerarAsientos;
         end;
      end
      else begin
         Caratula.Free;
         Exit;
      end;
   end;


   Caratula.Cerrar;
   Caratula.Free;

   Msg := 'Proceso finalizado correctamente.';
   if oARegularizacion.Checked then  begin
      Msg := Msg + #13 + 'Asiento Regularización ' +
         IntToStr(FAsientoNormalReg);
      if FAsientoEspecialReg <> 0 then   begin
         Msg := Msg + ' y ' + IntToStr(FAsientoEspecialReg);
      end;
   end;
   if oACierreApertura.Checked then  begin
      Msg := Msg + #13 + 'Asiento Cierre ' +
         IntToStr(FAsientoNormalCierre);
      if FAsientoEspecialCierre <> 0 then   begin
         Msg := Msg + ' y ' + IntToStr(FAsientoEspecialCierre);
      end;
      Msg := Msg + #13 + 'Asiento Apertura ' +
         IntToStr(FAsientoNormalApert);
      if FAsientoEspecialApert <> 0 then   begin
         Msg := Msg + ' y ' + IntToStr(FAsientoEspecialApert);
      end;
   end;
   MessageDlg(Msg, mtInformation, [mbOK], 0);
end;

procedure TWCierreEjercicio.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCierreEjercicio.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWCierreEjercicio.FormShow(Sender: TObject);
begin
   FFechaInicio := DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
   FFechaFin    := DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime;
   oABorrarAsientos.Caption := 'Borrar asientos entre las fechas ' +
      DateToStr(FFechaInicio) + ' a ' + DateToStr(FFechaFin);
end;

procedure TWCierreEjercicio.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWCierreEjercicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario       := nil;
   WCierreEjercicio := nil;
end;

procedure TWCierreEjercicio.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCierreEjercicio.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCierreEjercicio.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
