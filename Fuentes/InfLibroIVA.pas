unit InfLibroIVA;
interface
uses Classes, comctrls, Controls, Db, Dm, DmConta, Forms, Graphics, IBQuery, IbSql, SysUtils;

procedure LanzarInfLibroIVA(FechaInicial, FechaFinal, BaseImpInicial,
   BaseImpFinal, CuotaIVAInicial, CuotaIVAFinal,
   IVAInicial, IVAFinal: Double;
   FechaImpresion: TDateTime;
   FormatoOficial: Boolean;
   Orden, MonedaImpresion, TipoInforme,
   Subcuenta, Agrupacion, Cuenta,
   Delegacion, Departamento, Seccion, Proyecto, Intracomun: String);

implementation
uses UEspere, UIVA300, MenuPrincipal, Globales, General;

procedure LanzarInfLibroIVA(FechaInicial, FechaFinal, BaseImpInicial,
   BaseImpFinal, CuotaIVAInicial, CuotaIVAFinal,
   IVAInicial, IVAFinal: Double;
   FechaImpresion: TDateTime;
   FormatoOficial: Boolean;
   Orden, MonedaImpresion, TipoInforme,
   Subcuenta, Agrupacion, Cuenta,
   Delegacion, Departamento, Seccion, Proyecto, Intracomun: String);
var
   QFacturas, QApuntes216, QApuntes, QSubcuentas: TIBSQL;
   Caratula:         TEspere;
   AsientoAnterior, NumLinea: Integer;
   DescInforme, Titulo, clienteproveedor: String;
   nBase01, nBase04, nBase07: Double;
   nTipo02, nTipo05, nTipo08: Double;
   nCuota03, nCuota06, nCuota09: Double;
   nBase10, nBase13, nBase16: Double;
   nTipo11, nTipo14, nTipo17: Double;
   nCuota12, nCuota15, nCuota18: Double;
   nBase19, nBase19SI, nCuota20, nCuota20SI: Double;
   nBase32:          Double;
   nCuota22O, nCuota22B: Double;
   nBase00, nTipo00: Double;
   nBase36:          Double;
   nBase37:          Double;
   nBase38:          Double;
   nBase216, nCuota216: Double;
   nCuota22, nCuota23, nCuota23BI, nCuota24, nCuota24BI, nCuota24SI, nCuota25, nCuota27: Double;
   nCuota22T00, nCuota22T02, nCuota22T05, nCuota22T08: Double;
   nBase22B, nBase22T00, nBase22T02, nBase22T05, nBase22T08: Double;
   nSumaBaseImponible, nSumaCuotaIva, nSumaCuotaRecargo: Double;
   nTSumaBaseImponible, nTSumaCuotaIva, nTSumaCuotaRecargo: Double;
   nTSumaTotalFactura: Double;
begin
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
   Caratula.Imagenes.Cancelar_Abajo  := gvDirImagenes + gcBtnBlanco;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   gvProcesoAbortado := False;
   gvFormatoOficial  := FormatoOficial;

   if TipoInforme = 'B' then   begin
      Titulo           := 'LIBRO DE FACTURAS BIENES DE INVERSION';
      ClienteProveedor := 'Proveedor';
   end
   else
   if TipoInforme = 'R' then   begin
      Titulo           := 'LIBRO DE FACTURAS RECIBIDAS';
      ClienteProveedor := 'Proveedor';
   end
   else begin
      Titulo           := 'LIBRO DE FACTURAS EMITIDAS';
      ClienteProveedor := 'Cliente';
   end;

   // inicializar valores
   nBase00   := 0;
   nBase01   := 0;
   nBase04   := 0;
   nBase07   := 0;
   nBase10   := 0;
   nBase13   := 0;
   nBase16   := 0;
   nBase19   := 0;
   nBase19SI := 0;
   nBase32   := 0;
   nBase36   := 0;
   nBase37   := 0;
   nBase38   := 0;
   nBase216  := 0;

   nCuota03    := 0;
   nCuota06    := 0;
   nCuota09    := 0;
   nCuota12    := 0;
   nCuota15    := 0;
   nCuota18    := 0;
   nCuota20    := 0;
   nCuota20SI  := 0;
   nCuota22    := 0;
   nCuota22O   := 0;
   nCuota22B   := 0;
   nCuota23    := 0;
   nCuota23BI  := 0;
   nCuota24    := 0;
   nCuota24BI  := 0;
   nCuota24SI  := 0;
   nCuota25    := 0;
   nCuota22T00 := 0;
   nCuota22T02 := 0;
   nCuota22T05 := 0;
   nCuota22T08 := 0;
   nCuota216   := 0;
   nBase22B    := 0;
   nBase22T00  := 0;
   nBase22T02  := 0;
   nBase22T05  := 0;
   nBase22T08  := 0;

   nSumaBaseImponible := 0;
   nSumaCuotaIva      := 0;
   nSumaCuotaRecargo  := 0;

   nTSumaBaseImponible := 0;
   nTSumaCuotaIva      := 0;
   nTSumaCuotaRecargo  := 0;
   nTSumaTotalFactura  := 0;

   AsientoAnterior := -99;
   NumLinea        := 1;
   // Subcuentas
   QSubcuentas     := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT NIF,DESCRIPCION,PAIS,IVA,RECARGO');
      Add('FROM SUBCTAS WHERE SUBCUENTA=:SUBCUENTA');
   end;

   // Selección del importe total de la factura
   QFacturas := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFacturas, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT D.IMPORTE FROM DIARIO D, CUENTAS C');
      Add('WHERE');
      Add('   D.ASIENTO = :ASIENTO AND');
      Add('   ((C.TIPOCUENTA = "P" AND D.DEBEHABER = "H") OR (C.TIPOCUENTA = "C" AND D.DEBEHABER = "D")) AND');
      Add('   SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA');
   end;

   // Poner valores a los tipos
   nTipo00 := 0;
   nTipo02 := 99;
   nTipo05 := 99;
   nTipo08 := 99;
   nTipo11 := 99;
   nTipo14 := 99;
   nTipo17 := 99;

   // IVA normal
   if (DmRef.QParametros.FieldByName('Sctaivanormal').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('Sctaivanormal').AsString;
      QSubcuentas.ExecQuery;
      nTipo02 := QSubcuentas.FieldByName('iva').AsFloat;
   end;

   // Verificacion para que no se quede nunca a cero
   if nTipo02 = 0 then  begin
      if (DmRef.QParametros.FieldByName('SctaivaCnormal').AsString <> '') then   begin
         QSubcuentas.Close;
         QSubcuentas.parambyname('subcuenta').AsString :=
            DmRef.QParametros.FieldByName('SctaivaCnormal').AsString;
         QSubcuentas.ExecQuery;
         nTipo02 := QSubcuentas.FieldByName('iva').AsFloat;
      end;
   end;

   // IVA reducido
   if (DmRef.QParametros.FieldByName('Sctaivareducido').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('Sctaivareducido').AsString;
      QSubcuentas.ExecQuery;
      nTipo05 := QSubcuentas.FieldByName('iva').AsFloat;
   end;
   // Verificacion para que no se quede nunca a cero
   if nTipo05 = 0 then  begin
      if (DmRef.QParametros.FieldByName('SctaivaCreducido').AsString <> '') then   begin
         QSubcuentas.Close;
         QSubcuentas.parambyname('subcuenta').AsString :=
            DmRef.QParametros.FieldByName('SctaivaCreducido').AsString;
         QSubcuentas.ExecQuery;
         nTipo05 := QSubcuentas.FieldByName('iva').AsFloat;
      end;
   end;

   // IVA Superreducido
   if (DmRef.QParametros.FieldByName('SctaivaSuper').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('SctaivaSuper').AsString;
      QSubcuentas.ExecQuery;
      nTipo08 := QSubcuentas.FieldByName('iva').AsFloat;
   end;
   // Verificacion para que no se quede nunca a cero
   if nTipo08 = 0 then  begin
      if (DmRef.QParametros.FieldByName('SctaivaCSuper').AsString <> '') then   begin
         QSubcuentas.Close;
         QSubcuentas.parambyname('subcuenta').AsString :=
            DmRef.QParametros.FieldByName('SctaivaCSuper').AsString;
         QSubcuentas.ExecQuery;
         nTipo08 := QSubcuentas.FieldByName('iva').AsFloat;
      end;
   end;

   // Recargo normal
   if (DmRef.QParametros.FieldByName('SctaRecnormal').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('SctaRecnormal').AsString;
      QSubcuentas.ExecQuery;
      nTipo11 := RoundToDecimal(QSubcuentas.FieldByName('recargo').AsFloat, 2, True);
   end;
   // Recargo reducido
   if (DmRef.QParametros.FieldByName('SctaRecreducido').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('SctaRecreducido').AsString;
      QSubcuentas.ExecQuery;
      nTipo14 := RoundToDecimal(QSubcuentas.FieldByName('recargo').AsFloat, 2, True);
   end;
   // Recargo Superreducido
   if (DmRef.QParametros.FieldByName('SctaRecSuper').AsString <> '') then  begin
      QSubcuentas.Close;
      QSubcuentas.parambyname('subcuenta').AsString :=
         DmRef.QParametros.FieldByName('SctaRecSuper').AsString;
      QSubcuentas.ExecQuery;
      nTipo17 := RoundToDecimal(QSubcuentas.FieldByName('recargo').AsFloat, 2, True);
   end;

   if TipoInforme = '3' then  begin
      // Selección de asientos 216
      QApuntes216 := TIBSQL.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QApuntes216, SQL do begin
         Close;
         Clear;
         //TODO: Database := DMRef.IBDSiamCont;

         Add('SELECT');
         Add('  DISTINCT D.ASIENTO, D.IMPORTE, D.MONEDA, D.CONTRAPARTIDA,');
         Add('  D.IVA, D.BASEIMPONIBLE, S.TIPOIVA, D.CUOTARECARGO, D.CUOTAIVA,');
         Add('  D.CUENTA_ANALITICA');
         Add('FROM DIARIO D, CONCEPTOS C, CUENTAS T, SUBCTAS S');
         Add('WHERE');
         Add('  D.ID_CONCEPTOS = C.ID_CONCEPTOS AND C.TIPOCONCEPTO= "2"');
         Add('  AND SUBSTR(D.SUBCUENTA, 1, 3) = T.CUENTA AND D.SUBCUENTA = S.SUBCUENTA');
         Add('  AND T.TIPOCUENTA = "R"');
         Add('  and D.Fecha>=:FechaIni and D.Fecha<=:FechaFin ');
         Add('  and d.BaseImponible>=:BaseIni and D.BaseImponible<=:BaseFin ');
         Add('  and d.Importe>=:CuotaIvaIni and D.Importe<=:CuotaIvaFin ');
         if (ivainicial = 0) or (ivafinal = 0) then   begin
            Add('  and ((d.Iva>=:IvaIni and D.Iva<=:IvaFin) or (d.iva is null)) ');
         end
         else begin
            Add('  and d.Iva>=:IvaIni and D.Iva<=:IvaFin ');
         end;


         // Recordar que en importe esta la misma cantidad que en cuotaiva
         if Agrupacion = 'S' then     // Agrupado por subcuenta
         begin
            Add('order by D.CONTRAPARTIDA,');
         end
         else begin
            Add('order by');
         end;
         if Orden = 'F' then begin
            Add('D.FECHA,D.ASIENTO');
         end
         else
         if Orden = 'N' then begin
            Add('D.NUMEROFACTURA');
         end
         else
         if Orden = 'A' then begin
            Add('D.ASIENTO');
         end
         else
         if Orden = 'S' then begin
            Add('D.CONTRAPARTIDA,D.FECHA');
         end;
         parambyname('FechaIni').AsDateTime  := FechaInicial;
         parambyname('FechaFin').AsDateTime  := FechaFinal;
         parambyname('BaseIni').AsDouble     := BaseImpInicial;
         parambyname('BaseFin').AsDouble     := BaseImpFinal;
         parambyname('CuotaIvaIni').AsDouble := CuotaIvaInicial;
         parambyname('CuotaIvaFin').AsDouble := CuotaIvaFinal;
         parambyname('IvaIni').AsDouble      := IvaInicial;
         parambyname('IvaFin').AsDouble      := IvaFinal;
         ExecQuery;

         while not EOF do begin
            if (Subcuenta <> '') and (FieldByName('contrapartida').AsString <> Subcuenta) then   begin
               Next;
               continue;
            end;
            if not DMContaRef.Pertenece_Analitica(FieldByName('CUENTA_ANALITICA').AsString,
               Cuenta, '', Delegacion, Departamento,
               Seccion, Proyecto) then   begin
               Next;
               Continue;
            end;

            nBase216  := nBase216 + FieldByName('Baseimponible').AsFloat;
            nCuota216 := nCuota216 + FieldByName('cuotaiva').AsFloat;

            Next;
         end;

         Close;
         Free;
      end;
   end;    

   // Selección de asientos
   QApuntes := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QApuntes, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   D.ASIENTO, D.NUMEROFACTURA, D.FECHA, D.IMPORTE, D.NIF, T.TIPOCUENTA,');
      Add('   D.MONEDA, D.CONTRAPARTIDA, D.RECARGO, D.IVA, D.BASEIMPONIBLE, D.SERIE, D.EJERCICIO,');
      Add('   D.COMENTARIO, D.ID_CONCEPTOS, S.TIPOIVA, D.CUOTARECARGO, D.CUOTAIVA, D.CUENTA_ANALITICA, D.SUBCUENTA');
      Add(' From Diario D, Conceptos C , Cuentas T, Subctas S');
      Add(' Where D.ID_Conceptos=C.id_Conceptos and (C.TipoConcepto="I" or c.tipoconcepto="2") ');
      Add('  and SUBSTR(D.SUBCUENTA, 1, 3) = T.CUENTA and D.Subcuenta=S.subcuenta');
      if TipoInforme = 'E' then begin
         add(' and T.Tipocuenta="R"');
      end
      else
      if TipoInforme = '3' then   begin
         add(' and (T.Tipocuenta="S" or T.TipoCuenta="R") ');
      end
      else
      if TipoInforme = 'R' then   begin
         add(' and (T.Tipocuenta="S" and S.TipoIva<>"B") ');
      end
      else
      if TipoInforme = 'B' then   begin
         add(' and (T.Tipocuenta="S" and S.TipoIva="B") ');
      end;
      Add('  and D.Fecha>=:FechaIni and D.Fecha<=:FechaFin ');
      Add('  and d.BaseImponible>=:BaseIni and D.BaseImponible<=:BaseFin ');
      Add('  and d.Importe>=:CuotaIvaIni and D.Importe<=:CuotaIvaFin ');
      if (ivainicial = 0) or (ivafinal = 0) then   begin
         Add('  and ((d.Iva>=:IvaIni and D.Iva<=:IvaFin) or (d.iva is null)) ');
      end
      else begin
         Add('  and d.Iva>=:IvaIni and D.Iva<=:IvaFin ');
      end;
      // Recordar que en importe esta la misma cantidad que en cuotaiva
      if Agrupacion = 'S' then     // Agrupado por subcuenta
      begin
         Add('order by D.CONTRAPARTIDA,');
      end
      else
      if Agrupacion = 'I' then // Agrupado por Subcuenta (IVA)
      begin
         Add('order by D.SUBCUENTA,');
      end
      else begin
         Add('order by');
      end;
      if Orden = 'F' then begin
         Add('D.FECHA,D.ASIENTO');
      end
      else
      if Orden = 'N' then begin
         Add('D.EJERCICIO,D.SERIE,D.NUMEROFACTURA');
      end
      else
      if Orden = 'A' then begin
         Add('D.ASIENTO');
      end
      else
      if Orden = 'S' then begin
         Add('D.CONTRAPARTIDA,D.FECHA');
      end;
      parambyname('FechaIni').AsDateTime  := FechaInicial;
      parambyname('FechaFin').AsDateTime  := FechaFinal;
      parambyname('BaseIni').AsDouble     := BaseImpInicial;
      parambyname('BaseFin').AsDouble     := BaseImpFinal;
      parambyname('CuotaIvaIni').AsDouble := CuotaIvaInicial;
      parambyname('CuotaIvaFin').AsDouble := CuotaIvaFinal;
      parambyname('IvaIni').AsDouble      := IvaInicial;
      parambyname('IvaFin').AsDouble      := IvaFinal;
      ExecQuery;
   { Tipo de Listado :    (3) Modelo 300
                          (G) Modelo 420
                          (E) Facturas emitidas
                          {R) Facturas recibidas
                          {B) Facturas Bienes Inversion  }

   { Cuentas : TipoCuenta (R) Iva Devengado/Repercutido
                          (S) Iva Deducible/Soportado    }

      try
         while not EOF do begin
            if (Subcuenta <> '') and (FieldByName('contrapartida').AsString <> Subcuenta) then   begin
               Next;
               continue;
            end;
            if not DMContaRef.Pertenece_Analitica(FieldByName('CUENTA_ANALITICA').AsString,
               Cuenta, '', Delegacion, Departamento,
               Seccion, Proyecto) then   begin
               Next;
               Continue;
            end;

            // Excluir Cliente Intracomunitario
            if (TipoInforme = 'E') and (Intracomun = 'E') and
               (DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString <> '') and
               (DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString =
               FieldByName('CONTRAPARTIDA').AsString) then   begin
               Next;
               Continue;
            end;

            // Solo Cliente Intracomunitario
            if (TipoInforme = 'E') and (Intracomun = 'S') and
               (DMRef.QParametros.FieldByName('SCTAGENINTRACOM').AsString <>
               FieldByName('CONTRAPARTIDA').AsString) then   begin
               Next;
               Continue;
            end;


            // No se debe sumar la base imponible si el tratamiento de recargo
            // es individual, en el caso de diarsa, ya que la base imponible en
            // el enlace automatico se traspasa al apunte del iva.
      {if not gvTratamientoRecargo then
        nSumaBaseImponible:=nSumaBaseImponible+Fieldbyname('BaseImponible').asfloat;}
            nSumaCuotaIva     := nSumaCuotaIva + FieldByName('cuotaiva').AsFloat;
            nSumaCuotaRecargo := nSumaCuotaRecargo + FieldByName('cuotarecargo').AsFloat;

            // Informe Mod. 300
            if (TipoInforme = '3') and (FieldByName('Tipocuenta').AsString = 'R') then   begin
               if (FieldByName('iva').AsFloat = nTipo00) and
                  (FieldByName('SUBCUENTA').AsString = DMRef.QParametros.FieldByName(
                  'SCTAIVAEXENTOCEE').AsString) then   begin
                  nBase38 := nBase38 + FieldByName('Baseimponible').AsFloat;
               end;
               if (FieldByName('iva').AsFloat = nTipo00) and
                  (FieldByName('SUBCUENTA').AsString = DMRef.QParametros.FieldByName(
                  'SCTAEXPORTACIONES').AsString) then   begin
                  nBase36 := nBase36 + FieldByName('Baseimponible').AsFloat;
               end;
               if (FieldByName('IVA').AsFloat = nTipo00) and
                  (FieldByName('SUBCUENTA').AsString = DMRef.QParametros.FieldByName('SCTAINTERESES').AsString)
               then   begin
                  nBase37 := nBase37 + FieldByName('BASEIMPONIBLE').AsFloat;
               end;
               if FieldByName('Tipoiva').AsString = 'C' then         // Entregas intracomunitarias
               begin
                  nBase32 := nBase32 + FieldByName('baseimponible').AsFloat;
               end;
               if FieldByName('Tipoiva').AsString = 'A' then        // Adquisiciones intracomunitarias
               begin
                  nBase19  := nBase19 + FieldByName('BaseImponible').AsFloat;
                  nCuota20 := nCuota20 + FieldByName('importe').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'L' then        // Servicios Intracomunitarios
               begin
                  nBase19SI  := nBase19SI + FieldByName('BaseImponible').AsFloat;
                  nCuota20SI := nCuota20SI + FieldByName('importe').AsFloat;
               end
               else begin
                  if (FieldByName('iva').AsFloat = nTipo00) and
                     (RoundToDecimal(FieldByName('recargo').AsFloat, 2, True) = 0) then   begin
                     nBase00 := nBase00 + FieldByName('Baseimponible').AsFloat;
                     // Buscar desglose
                  end
                  else
                  if (FieldByName('iva').AsFloat = nTipo02) then   begin
                     nBase01  := nBase01 + FieldByName('Baseimponible').AsFloat;
                     nCuota03 := nCuota03 + FieldByName('cuotaiva').AsFloat;
                  end
                  else
                  if FieldByName('iva').AsFloat = nTipo05 then   begin
                     nBase04  := nBase04 + FieldByName('Baseimponible').AsFloat;
                     nCuota06 := nCuota06 + FieldByName('cuotaiva').AsFloat;
                  end
                  else
                  if FieldByName('iva').AsFloat = nTipo08 then   begin
                     nBase07  := nBase07 + FieldByName('Baseimponible').AsFloat;
                     nCuota09 := nCuota09 + FieldByName('cuotaiva').AsFloat;
                  end;

                  if RoundToDecimal(FieldByName('Recargo').AsFloat, 2, True) <> 0 then         // Tiene recargo
                  begin
                     if FieldByName('Recargo').AsFloat = nTipo11 then   begin
                        nBase10  := nBase10 + FieldByName('Baseimponible').AsFloat;
                        nCuota12 := nCuota12 + FieldByName('cuotarecargo').AsFloat;
                     end;
                     if FieldByName('Recargo').AsFloat = nTipo14 then   begin
                        nBase13  := nBase13 + FieldByName('Baseimponible').AsFloat;
                        nCuota15 := nCuota15 + FieldByName('CuotaRecargo').AsFloat;
                     end;
                     if FieldByName('Recargo').AsFloat = nTipo17 then   begin
                        nBase16  := nBase16 + FieldByName('Baseimponible').AsFloat;
                        nCuota18 := nCuota18 + FieldByName('CuotaRecargo').AsFloat;
                     end;
                  end;
               end;
            end;

      { (C) Adquisiciones Intracomunitarias
        (I) Importaciones
        (O) Operaciones Interiores
        (B) Operaciones Interiores (Bienes de Inversion)
        (R) Regimen Agrario

        IGIC (G) Operaciones interiores    (N) Op. Interio. Bienes Inversion }

            // Informe Mod. 300
            if (TipoInforme = '3') and (FieldByName('Tipocuenta').AsString = 'S') then   begin
               if (FieldByName('Tipoiva').AsString = 'O') or (FieldByName('TipoIva').AsString = 'B') then
               begin
                  nCuota22 := nCuota22 + FieldByName('CuotaIva').AsFloat;
                  if (FieldByName('Tipoiva').AsString = 'B') then   begin
                     nCuota22B := nCuota22B + FieldByName('cuotaiva').AsFloat;
                     nBase22B  := nBase22B + FieldByName('Baseimponible').AsFloat;
                  end
                  else begin
                     nCuota22O := nCuota22O + FieldByName('cuotaiva').AsFloat;
                     if FieldByName('iva').AsFloat = nTipo00 then   begin
                        nBase22T00  := nBase22T00 + FieldByName('Baseimponible').AsFloat;
                        nCuota22T00 := nCuota22T00 + FieldByName('cuotaiva').AsFloat;
                     end
                     else
                     if FieldByName('iva').AsFloat = nTipo02 then   begin
                        nBase22T02  := nBase22T02 + FieldByName('Baseimponible').AsFloat;
                        nCuota22T02 := nCuota22T02 + FieldByName('cuotaiva').AsFloat;
                     end
                     else
                     if FieldByName('iva').AsFloat = nTipo05 then   begin
                        nBase22T05  := nBase22T05 + FieldByName('Baseimponible').AsFloat;
                        nCuota22T05 := nCuota22T05 + FieldByName('cuotaiva').AsFloat;
                     end
                     else
                     if FieldByName('iva').AsFloat = nTipo08 then   begin
                        nBase22T08  := nBase22T08 + FieldByName('Baseimponible').AsFloat;
                        nCuota22T08 := nCuota22T08 + FieldByName('cuotaiva').AsFloat;
                     end;
                  end;
               end
               else
               if FieldByName('Tipoiva').AsString = 'I' then   begin
                  nCuota23 := nCuota23 + FieldByName('cuotaiva').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'X' then   begin
                  nCuota23BI := nCuota23BI + FieldByName('cuotaiva').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'C' then   begin
                  nCuota24 := nCuota24 + FieldByName('cuotaiva').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'W' then   begin
                  nCuota24BI := nCuota24BI + FieldByName('cuotaiva').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'L' then   begin
                  nCuota24SI := nCuota24SI + FieldByName('cuotaiva').AsFloat;
               end
               else
               if FieldByName('Tipoiva').AsString = 'R' then   begin
                  nCuota25 := nCuota25 + FieldByName('cuotaiva').AsFloat;
               end;
            end;

            if (TipoInforme <> '3') then   begin
               // Grabar campos del informe
               // Imprimir el número de línea y el total factura
               //sólo en el primer apunte del asiento
               DMContaRef.QInformesConta.Append;
               DMContaRef.QInformesConta.FieldByName('ASIENTO').AsInteger     := FieldByName('ASIENTO').AsInteger;
               // Almacenar datos necesarios para el título del informe
               DMContaRef.QInformeSConta.FieldByName('Titulo').AsString       := Titulo;
               DMContaRef.QInformesConta.FieldByName('ClienteProveedor').AsString := clienteproveedor;
               DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
               DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
               DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime := FechaFinal;

               if FieldByName('ASIENTO').AsInteger <> AsientoAnterior then   begin
                  AsientoAnterior := FieldByName('ASIENTO').AsInteger;
                  DMContaRef.QInformesConta.FieldByName('NUMLINEA').AsInteger := NumLinea;
                  QFacturas.Close;
                  QFacturas.ParamByName('ASIENTO').AsInteger := FieldByName('ASIENTO').AsInteger;
                  QFacturas.ExecQuery;
                  if not QFacturas.EOF then   begin
                     DMContaRef.QInformesContaImporte.AsFloat :=
                        ConversionImporte(QFacturas.FieldByName('IMPORTE').AsFloat,
                        FieldByName('MONEDA').AsString, MonedaImpresion);
                  end;
                  Inc(NumLinea);
               end;
               DMContaRef.QInformesConta.FieldByName('ASIENTO').AsInteger :=
                  FieldByName('ASIENTO').AsInteger;

               if Dmref.QParametros.FieldByName('TrataSerie').AsString = 'S' then   begin
                  DMContaRef.QInformesConta.FieldByName('FACTURA').AsString :=
                     Trim(FieldByName('EJERCICIO').AsString) + '/' + Trim(FieldByName('Serie').AsString) + '-' +
                     Trim(FieldByName('NUMEROFACTURA').AsString);
               end
               else begin
                  DMContaRef.QInformesConta.FieldByName('FACTURA').AsString :=
                     FieldByName('NUMEROFACTURA').AsString;
               end;

               DMContaRef.QInformesConta.FieldByName('FECHA').AsDateTime :=
                  FieldByName('FECHA').AsDateTime;
               if Agrupacion = 'I' then   begin
                  DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString :=
                     FieldByName('SUBCUENTA').AsString;
               end
               else begin
                  DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString :=
                     FieldByName('CONTRAPARTIDA').AsString;
               end;

               // Si es 570 o es generica
               if (Copy(Trim(FieldByName('Contrapartida').AsString), 1, 3) = '570') or
                  (FieldByName('Contrapartida').AsString = DmRef.QParametros.FieldByName('Vgenerica').AsString) or
                  (FieldByName('Contrapartida').AsString = DmRef.QParametros.FieldByName(
                  'VgenericaC').AsString) or (DMContaRef.ObtenerTipoSubcuenta(
                  FieldByName('Contrapartida').AsString) = 'B') then   begin
                  DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                     FieldByName('COMENTARIO').AsString;
                  DMContaRef.QInformesConta.FieldByName('NIF').AsString           :=
                     'ES-' + Trim(FieldByName('NIF').AsString);
               end
               else begin
                  QSubcuentas.Close;
                  if Agrupacion = 'I' then   begin
                     QSubcuentas.parambyname('subcuenta').AsString := FieldByName('subcuenta').AsString;
                  end
                  else begin
                     QSubcuentas.parambyname('subcuenta').AsString := FieldByName('contrapartida').AsString;
                  end;
                  QSubcuentas.ExecQuery;
                  DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                     QSubcuentas.FieldByName('DESCRIPCION').AsString;
                  if Agrupacion = 'I' then   begin
                     QSubcuentas.Close;
                     QSubcuentas.parambyname('subcuenta').AsString := FieldByName('contrapartida').AsString;
                     QSubcuentas.ExecQuery;
                     DMContaRef.QInformesConta.FieldByName('FSubcuenta').AsString :=
                        FieldByName('contrapartida').AsString;
                     DMContaRef.QInformesConta.FieldByName('FDESCSUBCUENTA').AsString :=
                        QSubcuentas.FieldByName('DESCRIPCION').AsString;
                  end;
                  DMContaRef.QInformesConta.FieldByName('NIF').AsString :=
                     QSubcuentas.FieldByName('PAIS').AsString + '-' +
                     Trim(QSubcuentas.FieldByName('NIF').AsString);
               end;

               if (FieldByName('Tipoiva').AsString = 'C') then // Intracomunitarias Diarsa
               begin
                  DmContaRef.QInformesConta.FieldByName('TOTALBRUTO').AsFloat := 0;
               end
               else begin
                  if (((RoundToDecimal(FieldByName('recargo').AsFloat, 2, True) <> 0) and
                     (not gvTratamientoRecargo)) or
                     (RoundToDecimal(FieldByName('recargo').AsFloat, 2, True) = 0)) then   begin
                     DmContaRef.QInformesConta.FieldByName('TOTALBRUTO').AsFloat :=
                        ConversionImporte(FieldByName('BASEIMPONIBLE').AsFloat,
                        FieldByName('MONEDA').AsString,
                        MonedaImpresion);
                  end;
               end;

               DmContaRef.QInformesConta.FieldByName('IVA').AsFloat := FieldByName('IVA').AsFloat;

               // Cuota IVA
               if RoundToDecimal(FieldByName('Iva').AsFloat, 2, True) <> 0 then   begin
                  DmContaRef.QInformesConta.FieldByName('CUOTAIVA').AsFloat :=
                     ConversionImporte(FieldByName('CUOTAIVA').AsFloat,
                     FieldByName('MONEDA').AsString, MonedaImpresion);
               end;
               DmContaRef.QInformesConta.FieldByName('RECARGO').AsFloat :=
                  FieldByName('RECARGO').AsFloat;
               // Cuota Recargo
               if RoundToDecimal(FieldByName('recargo').AsFloat, 2, True) <> 0 then   begin
                  DmContaRef.QInformesConta.FieldByName('CUOTARECARGO').AsFloat :=
                     ConversionImporte(FieldByName('CUOTARECARGO').AsFloat,
                     FieldByName('MONEDA').AsString, MonedaImpresion);
               end;

               if (RoundToDecimal(FieldByName('recargo').AsFloat, 2, True) <> 0) and gvTratamientoRecargo then
               begin
                  DmContaRef.QInformesConta.FieldByName('TOTALFACTURA').AsFloat :=
                     ConversionImporte(FieldByName('CuotaRecargo').AsFloat,
                     FieldByName('MONEDA').AsString, MonedaImpresion);
               end
               else begin
                  if (FieldByName('Tipoiva').AsString = 'C') then // Intracomunitarias Diarsa
                  begin
                     DmContaRef.QInformesConta.FieldByName('TOTALFACTURA').AsFloat := 0;
                  end
                  else begin
                     DmContaRef.QInformesConta.FieldByName('TOTALFACTURA').AsFloat :=
                        ConversionImporte(FieldByName('Baseimponible').AsFloat +
                        FieldByName('cuotarecargo').AsFloat +
                        FieldByName('cuotaiva').AsFloat,
                        FieldByName('MONEDA').AsString, MonedaImpresion);
                  end;
               end;
               DMContaRef.QInformesConta.Post;
            end;
            Next;
         end; // While
      except
         on E: Exception do begin
            QSubcuentas.Close;
            QSubcuentas.Free;

            QFacturas.Close;
            QFacturas.Free;

            Caratula.Cerrar;
            Caratula.Free;

            DatabaseError(E.message);
         end;
      end;

      Close;
      Free;
   end; 
   QSubcuentas.Close;
   QSubcuentas.Free;

   QFacturas.Close;
   QFacturas.Free;

   Caratula.Cerrar;
   Caratula.Free;

   if TipoInforme <> '3' then  begin
      if Agrupacion = 'S' then   begin
         FormPrincipal.LanzarListado('LLibroFacturasEmitidasSubcta.rtm', DMContaRef.SInformesConta,  MonedaImpresion);
      end else
      if Agrupacion = 'I' then   begin
         FormPrincipal.LanzarListado('LLibroFacturasTipoIva.rtm', DMContaRef.SInformesConta, MonedaImpresion);
      end
      else begin
         FormPrincipal.LanzarListado('LLibroFacturasEmitidas.rtm', DMContaRef.SInformesConta, MonedaImpresion);
      end;
      DMContaRef.InicializarFicherosInformes;
   end
   else begin
      // Asignar valores de variables a campos
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with WIva300, QIva300 do begin
         append;
         edit;
         FieldByName('Ejercicio').AsInteger     := Year(FechaFinal);
         FieldByName('FECHAINICIAL').AsDateTime := FechaInicial;
         FieldByName('FECHAFINAL').AsDateTime   := FechaFinal;
         if (month(FechaFinal) >= 1) and (month(fechaFinal) <= 3) then   begin
            FieldByName('periodo').AsString := '1T';
         end
         else
         if (month(FechaFinal) >= 4) and (month(fechaFinal) <= 6) then   begin
            FieldByName('periodo').AsString := '2T';
         end
         else
         if (month(FechaFinal) >= 7) and (month(fechaFinal) <= 9) then   begin
            FieldByName('periodo').AsString := '3T';
         end
         else begin
            FieldByName('periodo').AsString := '4T';
         end;

         FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

         FieldByName('Base00').AsFloat        := RoundToDecimal(nBase00, 2, True);
         FieldByName('Base00Normal').AsFloat  := RoundToDecimal(nBase00 - nBase36 - nBase37 - nBase38, 2, True);
         FieldByName('Base00CEE').AsFloat     := RoundToDecimal(nBase38, 2, True);
         FieldByName('Base00Interes').AsFloat := RoundToDecimal(nBase37, 2, True);
         FieldByName('Base00Exportacion').AsFloat := RoundToDecimal(nBase36, 2, True);

         FieldByName('Base01').AsFloat  := RoundToDecimal(nBase01, 2, True);
         FieldByName('Tipo02').AsFloat  := nTipo02;
         FieldByName('Cuota03').AsFloat := RoundToDecimal(nCuota03, 2, True);

         FieldByName('Base04').AsFloat  := RoundToDecimal(nBase04, 2, True);
         FieldByName('Tipo05').AsFloat  := nTipo05;
         FieldByName('Cuota06').AsFloat := RoundToDecimal(nCuota06, 2, True);

         FieldByName('Base07').AsFloat  := RoundToDecimal(nBase07, 2, True);
         FieldByName('Tipo08').AsFloat  := nTipo08;
         FieldByName('Cuota09').AsFloat := RoundToDecimal(nCuota09, 2, True);

         FieldByName('Base10').AsFloat  := RoundToDecimal(nBase10, 2, True);
         FieldByName('Tipo11').AsFloat  := nTipo11;
         FieldByName('Cuota12').AsFloat := RoundToDecimal(nCuota12, 2, True);

         FieldByName('Base13').AsFloat  := RoundToDecimal(nBase13, 2, True);
         FieldByName('Tipo14').AsFloat  := nTipo14;
         FieldByName('Cuota15').AsFloat := RoundToDecimal(nCuota15, 2, True);

         FieldByName('Base16').AsFloat  := RoundToDecimal(nBase16, 2, True);
         FieldByName('Tipo17').AsFloat  := nTipo17;
         FieldByName('Cuota18').AsFloat := RoundToDecimal(nCuota18, 2, True);

         FieldByName('Base19').AsFloat    := RoundToDecimal(nBase19, 2, True);
         FieldByName('Cuota20').AsFloat   := RoundToDecimal(nCuota20, 2, True);
         FieldByName('Base19SI').AsFloat  := RoundToDecimal(nBase19SI, 2, True);
         FieldByName('Cuota20SI').AsFloat := RoundToDecimal(nCuota20SI, 2, True);

         FieldByName('BASE36').AsFloat := RoundToDecimal(nBase36, 2, True);

         FieldByName('BASE37').AsFloat := RoundToDecimal(nBase37, 2, True);

         FieldByName('BASE216').AsFloat     := RoundToDecimal(nBase216, 2, True);
         FieldByName('CUOTA216').AsFloat    := RoundToDecimal(nCuota216, 2, True);
         FieldByName('BASEadqInt').AsFloat  := RoundToDecimal(nBase19 - nBase216, 2, True);
         FieldByName('CUOTAadqint').AsFloat := RoundToDecimal(nCuota20 - nCuota216, 2, True);

         FieldByName('TotalDevengado').AsFloat :=
            RoundToDecimal(nCuota03 + nCuota06 + nCuota09 + nCuota12 + nCuota15 + nCuota18 + nCuota20 + nCuota20SI, 2, True);

         FieldByName('Deducible22').AsFloat := RoundToDecimal(nCuota22, 2, True);
         FieldByName('Cuota22B').AsFloat    := RoundToDecimal(nCuota22B, 2, True);
         FieldByName('Cuota22TN').AsFloat   := RoundToDecimal(nCuota22T02, 2, True);
         FieldByName('Cuota22TR').AsFloat   := RoundToDecimal(nCuota22T05, 2, True);
         FieldByName('Cuota22TS').AsFloat   := RoundToDecimal(nCuota22T08, 2, True);
         FieldByName('Base22B').AsFloat     := RoundToDecimal(nBase22B, 2, True);
         FieldByName('Base22TN').AsFloat    := RoundToDecimal(nBase22T02, 2, True);
         FieldByName('Base22TR').AsFloat    := RoundToDecimal(nBase22T05, 2, True);
         FieldByName('Base22TS').AsFloat    := RoundToDecimal(nBase22T08, 2, True);
         FieldByName('Base22TE').AsFloat    := RoundToDecimal(nBase22T00, 2, True);

         FieldByName('Deducible23').AsFloat    := RoundToDecimal(nCuota23, 2, True);
         FieldByName('Deducible23BI').AsFloat  := RoundToDecimal(nCuota23BI, 2, True);
         FieldByName('Deducible24').AsFloat    := RoundToDecimal(nCuota24, 2, True);
         FieldByName('Deducible24BI').AsFloat  := RoundToDecimal(nCuota24BI, 2, True);
         FieldByName('Deducible24SI').AsFloat  := RoundToDecimal(nCuota24SI, 2, True);
         FieldByName('Deducible25').AsFloat    := RoundToDecimal(nCuota25, 2, True);
         FieldByName('TotalDeducible').AsFloat :=
            RoundToDecimal(nCuota22 + nCuota23 + nCuota23BI + nCuota24 + nCuota24BI + nCuota24SI + nCuota25, 2, True);
         FieldByName('Diferencia').AsFloat     :=
            RoundToDecimal(FieldByName('TotalDevengado').AsFloat -
            FieldByName('TotalDeducible').AsFloat, 2, True);
         FieldByName('Liquidacion32').AsFloat  := RoundToDecimal(nBase32, 2, True);
         // Esto se deja asi de momento, aunque no es totalmente exacto.
         FieldByName('Resultado').AsFloat      := FieldByName('Diferencia').AsFloat;
         if RoundToDecimal(FieldByName('Resultado').AsFloat, 2, True) > 0 then   begin
            FieldByName('ingreso').AsFloat := FieldByName('Resultado').AsFloat;
         end
         else begin
            FieldByName('devolucion').AsFloat := FieldByName('Resultado').AsFloat;
         end;

         post;
      end;
   end;
end;

end.
