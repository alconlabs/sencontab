unit InfMayor;
interface
uses comctrls, Controls, Db, Forms, Graphics, IBQuery, IbSql, SysUtils;

procedure LanzarInfMayor(SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   Subcuenta_desde, Subcuenta_hasta, DescSubctaInicial,
   DescSubctaFinal: String; FechaInicial, FechaFinal, FechaImpresion: TDateTime;
   TipoConcepto, Concepto, Cuenta,
   Delegacion, Departamento, Seccion, Proyecto, MonedaImpresion, sNif, sContenga:
   String; SaltoPaginaPorSubcta: Boolean = True;
   SaldosAcumulados: Boolean = False;
   FormatoOficial: Boolean = False;
   SoloSinPuntear: Boolean = False; Orden: String = 'S');

implementation
uses General, Globales, Cadenas, DM, DMConta, MenuPrincipal, UEspere;

procedure LanzarInfMayor(SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   Subcuenta_desde, Subcuenta_hasta, DescSubctaInicial,
   DescSubctaFinal: String; FechaInicial, FechaFinal, FechaImpresion: TDateTime;
   TipoConcepto, Concepto, Cuenta,
   Delegacion, Departamento, Seccion, Proyecto, MonedaImpresion, sNif, sContenga:
   String; SaltoPaginaPorSubcta, SaldosAcumulados,
   FormatoOficial, SoloSinPuntear: Boolean;
   Orden: String);
var
   QAsientos, QSubcuentas, QConceptos, QAcumulados: TIBQuery;
   Caratula:       TEspere;
   DescApunte:     String;
   nSubcuenta:     String;
   nDescSubcuenta: String;
   nSaldo, nAcuDebe, nAcuHaber: Double;
   Abreviatura, DescConcepto, NumeroFactura: String;
   FechaAcumIni, FechaAcumFin: TDateTime;
   PrimerAsiento:  Integer;
   SubctaAcum, DescSubctaAcum: String;
begin
   DMContaRef.QInformesConta.IndexName := 'SUBCUENTA';

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
   Caratula.Imagenes.Cancelar_Arriba := gvDirImagenes + gcBtn;
   Caratula.Imagenes.Cancelar_Abajo := gvDirImagenes + gcBtnBlanco;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   gvProcesoAbortado := False;

   if subcuenta_hasta = '' then begin
      subcuenta_hasta := subcuenta_desde;
   end;


   if length(subcuenta_desde) < gvlongitudsubcuenta then   begin
      subcuenta_desde := BackChar(subcuenta_desde, '0', gvlongitudsubcuenta);
   end;
   if length(subcuenta_hasta) < gvlongitudsubcuenta then   begin
      subcuenta_hasta := Backchar(subcuenta_hasta, '9', gvlongitudsubcuenta);
   end;

   if DescSubctaFinal = '' then   begin
      DescSubctaFinal := DescSubctaInicial;
   end;
   DescSubctaFinal := BackChar(DescSubctaFinal, 'Z', 80);

   // Selección de datos de subcuenta
   QSubcuentas := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT');
      Add('   S.SUBCUENTA, S.DESCRIPCION, ABREVIATURA');
      Add('FROM SUBCTAS S');
      Add('WHERE SUBCUENTA = :SUBCUENTA');
      Prepare;
   end;

   // Selección de datos de concepto
   QConceptos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QConceptos, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT');
      Add('   ID_CONCEPTOS, DESCRIPCION,TIPOCONTABILIDAD');
      Add('FROM CONCEPTOS');
      Add('WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
      Prepare;
   end;


   // Saldos Acumulados
   if SaldosAcumulados then  begin
      FechaAcumIni := DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime;
      FechaAcumFin := FechaInicial - 1;

      QAcumulados := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAcumulados, SQL do begin
         Close;
         Clear;
         Database := DMRef.IBDSiamCont;

         Add('SELECT S.SUBCUENTA, S.DESCRIPCION, D.IMPORTE, D.MONEDA,');
         Add('       D.DEBEHABER, D.ID_CONCEPTOS, D.CUENTA_ANALITICA');
         Add('FROM DIARIO D, SUBCTAS S');
         Add('WHERE');
         Add('   D.FECHA >= :FECHAINICIO AND D.FECHA <= :FECHAFIN');
         if (sNif <> '') then begin
            add('AND Upper(S.Nif) LIKE Upper(:Nif)');
         end;
         if SeleccionPorSubcuenta and (subcuenta_desde <> '') then   begin
            Add('  AND S.SUBCUENTA >= :SUBCUENTA_DESDE');
            Add('  AND S.SUBCUENTA <= :SUBCUENTA_HASTA');
         end;
         if SeleccionPorDescripcion and (DescSubctaInicial <> '') then   begin
            Add('  AND S.DESCRIPCION >= :DESCRIPCION_DESDE');
            Add('  AND S.DESCRIPCION <= :DESCRIPCION_HASTA');
         end;
         if (sContenga <> '') then   begin
            add('   and s.descripcion containing :contenga');
         end;
         Add('   AND D.SUBCUENTA = S.SUBCUENTA');
         Add('ORDER BY S.SUBCUENTA,D.FECHA');

         ParamByName('FECHAINICIO').AsDateTime := FechaAcumIni;
         ParamByName('FECHAFIN').AsDateTime    := FechaAcumFin;
         if (sNif <> '') then   begin
            Parambyname('Nif').AsString := Copy(sNif + '%', 1, 20);
         end;
         if (sContenga <> '') then   begin
            Parambyname('Contenga').AsString := Trim(sContenga);
         end;
         if SeleccionPorSubcuenta and (subcuenta_desde <> '') then   begin
            QAcumulados.ParamByName('SUBCUENTA_DESDE').AsString := subcuenta_desde;
            QAcumulados.ParamByName('SUBCUENTA_HASTA').AsString := subcuenta_hasta;
         end;
         if SeleccionPorDescripcion and (DescSubctaInicial <> '') then   begin
            QAcumulados.ParamByName('DESCRIPCION_DESDE').AsString := DescSubctaInicial;
            QAcumulados.ParamByName('DESCRIPCION_HASTA').AsString := DescSubctaFinal;
         end;
         QAcumulados.Open;
      end;  

      while not QAcumulados.EOF do begin
         SubctaAcum     := QAcumulados.FieldByName('SUBCUENTA').AsString;
         DescSubctaAcum := QAcumulados.FieldByName('DESCRIPCION').AsString;
         nAcuDebe       := 0;
         nAcuHaber      := 0;
         while not QAcumulados.EOF and (QAcumulados.FieldByName('SUBCUENTA').AsString =
               SubctaAcum) do begin
            // Chequeo conceptos
            if (TipoConcepto <> 'T') and (not QAcumulados.FieldByName('ID_CONCEPTOS').IsNull) then
            begin
               QConceptos.Close;
               QConceptos.ParamByName('ID_CONCEPTOS').AsString :=
                  QAcumulados.FieldByName('ID_CONCEPTOS').AsString;
               QConceptos.Open;
               if (QConceptos.FieldByName('TipoContabilidad').AsString <> TipoConcepto) then   begin
                  QAcumulados.Next;
                  Continue;
               end;
            end;
            if not DMContaRef.Pertenece_Analitica(QAcumulados.FieldByName('CUENTA_ANALITICA').AsString,
               Cuenta, '', Delegacion, Departamento,
               Seccion, Proyecto) then   begin
               QAcumulados.Next;
               Continue;
            end;
            if QAcumulados.FieldByName('DEBEHABER').AsString = 'D' then   begin
               nAcuDebe := nAcuDebe + ConversionImporte(
                  QAcumulados.FieldByName('IMPORTE').AsFloat,
                  QAcumulados.FieldByName('MONEDA').AsString, MonedaImpresion);
            end
            else begin
               nAcuHaber := nAcuHaber + ConversionImporte(
                  QAcumulados.FieldByName('IMPORTE').AsFloat,
                  QAcumulados.FieldByName('MONEDA').AsString, MonedaImpresion);
            end;
            QAcumulados.Next;
         end;  // while not QAcumulados.Eof

         nSaldo := RoundToDecimal(nAcuDebe - nAcuHaber, 3, True);

         if RoundToDecimal(nSaldo, 2, True) <> 0 then   begin
            DMContaRef.QInformesConta.Insert;
            DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString     := SubctaAcum;
            DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString := DescSubctaAcum;
            DMContaRef.QInformesConta.FieldByName('DESCAPUNTE').AsString    := 'SALDO ACUMULADO';

            DMContaRef.QInformesConta.FieldByName('DEBE').AsFloat  := RoundToDecimal(nAcuDebe, 2, True);
            DMContaRef.QInformesConta.FieldByName('HABER').AsFloat := RoundToDecimal(nAcuHaber, 2, True);
            DMContaRef.QInformesConta.FieldByName('SALDO').AsFloat := RoundToDecimal(nSaldo, 2, True);

            //  Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
            DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

            PrimerAsiento := DMContaRef.ObtenerUltimoAsientoSubcuenta(SubctaAcum,
               DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime, FechaInicial - 1);
            if PrimerAsiento = 0 then   begin
               PrimerAsiento := 1;
            end;

            DMContaRef.QInformesConta.FieldByName('ASIENTO').AsInteger := PrimerAsiento;

            DMContaRef.QInformesConta.post;
         end;  // if RoundToDecimal(nSaldo, 2, TRUE) <> 0 then

         //QAcumulados.Next;
      end;  // while not QAcumulados.Eof do

      QAcumulados.Close;
      QAcumulados.Free;
   end;  // SaldosAcumulados


   // Selección de asientos
   QAsientos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   D.APUNTE, D.SUBCUENTA, D.FECHA, D.CONTRAPARTIDA, D.IMPORTE,');
      Add('   D.NUMEROFACTURA, D.ID_CONCEPTOS, D.ID_DIARIO, D.MONEDA,');
      Add('   D.DEBEHABER, D.ASIENTO, D.COMENTARIO, D.CUENTA_ANALITICA,');
      Add('   D.PUNTEO, D.SERIE, D.EJERCICIO');
      Add('FROM');
      Add('   DIARIO D,SUBCTAS S');
      Add('WHERE');

      if SeleccionPorSubcuenta and (subcuenta_desde <> '') then   begin
         Add('  D.SUBCUENTA >= :SUBCUENTA_DESDE AND ');
         Add('  D.SUBCUENTA<=:SUBCUENTA_HASTA AND');
      end;

      if (sContenga <> '') then begin
         add(' s.descripcion containing :contenga and');
      end;

      if (sNif <> '') then begin
         add('Upper(S.Nif) LIKE Upper(:Nif) AND');
      end;

      if Concepto <> '' then   begin
         Add('  D.ID_CONCEPTOS = :ID_CONCEPTOS AND');
      end;

      if SoloSinPuntear then   begin
         Add('  (D.PUNTEO IS NULL OR D.PUNTEO = "" OR D.PUNTEO = "N") AND');
      end;

      if FechaInicial = 0 then   begin
         Add('   (D.FECHA IS NULL OR (D.FECHA >= :FECHAINICIAL AND FECHA <= :FECHAFINAL))');
      end
      else begin
         Add('   D.FECHA >= :FECHAINICIAL AND FECHA <= :FECHAFINAL');
      end;

      Add('   AND D.SUBCUENTA = S.SUBCUENTA');

      Add('ORDER BY D.SUBCUENTA, D.FECHA, D.ASIENTO, D.APUNTE');

      Prepare;

      if SeleccionPorSubcuenta and (Subcuenta_desde <> '') then   begin
         ParamByName('SUBCUENTA_DESDE').AsString := Subcuenta_desde;
         ParamByName('SUBCUENTA_HASTA').AsString := Subcuenta_hasta;
      end;

      if (sNif <> '') then   begin
         Parambyname('Nif').AsString := Copy(sNif + '%', 1, 20);
      end;

      if (sContenga <> '') then   begin
         Parambyname('Contenga').AsString := Trim(sContenga);
      end;

      if Concepto <> '' then   begin
         ParamByName('ID_CONCEPTOS').AsString := Concepto;
      end;

      ParamByName('FECHAINICIAL').AsDateTime := FechaInicial;
      ParamByName('FECHAFINAL').AsDateTime   := FechaFinal;

      Open;
   end;

   try
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAsientos do begin
         nSubcuenta     := '';
         nDescSubcuenta := '';
         while not EOF do begin
            // Chequeo conceptos
            if not FieldByName('ID_CONCEPTOS').IsNull then   begin
               QConceptos.Close;
               QConceptos.ParamByName('ID_CONCEPTOS').AsString := FieldByName('ID_CONCEPTOS').AsString;
               QConceptos.Open;
               if (TipoConcepto <> 'T') and
                  (QConceptos.FieldByName('TipoContabilidad').AsString <> TipoConcepto) then   begin
                  Next;
                  continue;
               end;
               if not DMContaRef.Pertenece_Analitica(FieldByName('CUENTA_ANALITICA').AsString,
                  Cuenta, '', Delegacion, Departamento,
                  Seccion, Proyecto) then   begin
                  Next;
                  Continue;
               end;
            end;

            if nSubcuenta <> FieldByName('SUBCUENTA').AsString then   begin
               // Subcuenta y descripción
               if not FieldByName('SUBCUENTA').IsNull then   begin
                  QSubcuentas.Close;
                  QSubcuentas.ParamByName('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
                  QSubcuentas.Open;
                  nDescSubcuenta := QSubcuentas.FieldByName('DESCRIPCION').AsString;
               end;
               nSubcuenta := FieldByName('SUBCUENTA').AsString;

               if SeleccionPorDescripcion and not
                  ((nDescSubcuenta >= DescSubctaInicial) and (nDescSubcuenta <= DescSubctaFinal)) then   begin
                  Next;
                  Continue;
               end;
            end;

            if SeleccionPorDescripcion and not ((nDescSubcuenta >= DescSubctaInicial) and
               (nDescSubcuenta <= DescSubctaFinal)) then   begin
               Next;
               Continue;
            end;

            DMContaRef.QInformesConta.Append;
            DMContaRef.QInformesConta.Edit;

            // Subcuenta y descripción
            Abreviatura := '';
            if not FieldByName('SUBCUENTA').IsNull then   begin
               DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString :=
                  FieldByName('SUBCUENTA').AsString;
               if not QSubcuentas.EOF then   begin
                  DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                     Trim(QSubcuentas.FieldByName('DESCRIPCION').AsString);
                  Abreviatura := QSubcuentas.FieldByName('ABREVIATURA').AsString;
               end;
            end;

            if FieldByName('FECHA').AsDateTime > 0 then   begin
               DMContaRef.QInformesConta.FieldByName('FECHA').AsDateTime := FieldByName('FECHA').AsDateTime;
            end;
            DMContaRef.QInformesConta.FieldByName('ASIENTO').AsInteger     := FieldByName('ASIENTO').AsInteger;
            DMContaRef.QInformesConta.FieldByName('APUNTE').AsInteger      := FieldByName('APUNTE').AsInteger;
            DMContaRef.QInformesConta.FieldByName('ID_CONCEPTOS').AsString :=
               FieldByName('ID_CONCEPTOS').AsString;
            DMContaRef.QInformesConta.FieldByName('CUENTA_ANALITICA').AsString :=
               FieldByName('CUENTA_ANALITICA').AsString;
            DMContaRef.QInformesConta.FieldByName('PUNTEO').AsString       := FieldByName('PUNTEO').AsString;

            // Descripción de apunte
            DescConcepto := '';
            if not QConceptos.EOF then   begin
               DescConcepto := Trim(QConceptos.FieldByName('DESCRIPCION').AsString) + ' ';
            end;
            NumeroFactura := FieldByName('NUMEROFACTURA').AsString;

            // Descripción de apunte
            DescApunte := DMContaRef.GetDescripcionApunte(DescConcepto,
                                                          NumeroFactura,
                                                          FieldByName('SERIE'     ).AsString,
                                                          FieldByName('EJERCICIO' ).AsInteger,
                                                          FieldByName('COMENTARIO').AsString,
                                                          Abreviatura);

            DMContaRef.QInformesConta.FieldByName('DESCAPUNTE').AsString := Copy(DescApunte, 1, 100);

            DMContaRef.QInformesConta.FieldByName('DEBEHABER').AsString :=
               FieldByName('DEBEHABER').AsString;
            DMContaRef.QInformesConta.FieldByName('IMPORTE').AsFloat    :=
               ConversionImporte(FieldByName('IMPORTE').AsFloat,
               FieldByName('MONEDA').AsString, MonedaImpresion);

            if FieldByName('DEBEHABER').AsString = 'D' then   begin
               DMContaRef.QInformesConta.FieldByName('DEBE').AsFloat :=
                  ConversionImporte(FieldByName('IMPORTE').AsFloat,
                  FieldByName('MONEDA').AsString, MonedaImpresion);
               nSaldo := ConversionImporte(FieldByName('IMPORTE').AsFloat,
                  FieldByName('MONEDA').AsString, MonedaImpresion);
            end
            else begin
               DMContaRef.QInformesConta.FieldByName('HABER').AsFloat :=
                  ConversionImporte(FieldByName('IMPORTE').AsFloat,
                  FieldByName('MONEDA').AsString, MonedaImpresion);
               nSaldo := -ConversionImporte(FieldByName('IMPORTE').AsFloat,
                  FieldByName('MONEDA').AsString, MonedaImpresion);
            end;

            DMContaRef.QInformesConta.FieldByName('SALDO').AsFloat := RoundToDecimal(nSaldo, 3, True);

            DMContaRef.QInformesConta.FieldByName('CONTRAPARTIDA').AsString :=
               FieldByName('CONTRAPARTIDA').AsString;

            //  Almacenar el intervalo de fechas y la fecha de impresión para
            //incluirlas en la descripción del listado.
            DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
            DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

            DMContaRef.QInformesConta.post;

            Application.ProcessMessages;

            Next;
         end;

         Close;
         Free;
      end;

   except
      on E: Exception do begin
         QAsientos.Close;
         QAsientos.Free;
         QSubcuentas.Close;
         QSubcuentas.Free;
         QConceptos.Close;
         QConceptos.Free;
         Caratula.Cerrar;
         Caratula.Free;

         DatabaseError(E.Message);
      end;
   end;

   QSubcuentas.Close;
   QSubcuentas.Free;
   QConceptos.Close;
   QConceptos.Free;

   Caratula.Cerrar;
   Caratula.Free;

   if Orden = 'S' then   begin
      DMContaRef.QInformesConta.IndexName := 'SUBCUENTA';
   end
   else begin
      DMContaRef.QInformesConta.IndexName := 'DESCRIPCION';
   end;

   DMContaRef.QInformesConta.First;

   FormPrincipal.LanzarListado('LMayor.rtm', DMContaRef.SInformesConta, MonedaImpresion,
      True, False, SaltoPaginaPorSubcta);
   DMContaRef.QInformesConta.IndexName := '';

   DMContaRef.InicializarFicherosInformes;
end;

end.
