unit InfBalanceSumasSaldos;
interface
uses Classes, ComCtrls, Controls, Db, Dm, DmConta, Forms, General, Globales, Graphics, IBQuery,
     IbSql, SysUtils;

procedure LanzarInfBalanceSumasYGastos(FechaInicial, FechaFinal: TDateTime;
   FechaImpresion: TDateTime;
   SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   SubcuentaInicial, SubcuentaFinal,
   DescSubctaInicial, DescSubctaFinal,
   TipoConcepto: String;
   ConSubcuentas, SoloSaldos: Boolean;
   CuentaAnalitica, Delegacion, Departamento,
   Seccion, Proyecto: String; Empresas: TStrings;
   MonedaImpresion: String = 'P';
   NivelIni: Integer = 3;
   NivelFin: Integer = 1);

implementation
uses MenuPrincipal, UEspere, Cadenas;

procedure LanzarInfBalanceSumasYGastos(FechaInicial, FechaFinal: TDateTime;
   FechaImpresion: TDateTime;
   SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   SubcuentaInicial, SubcuentaFinal,
   DescSubctaInicial, DescSubctaFinal,
   TipoConcepto: String;
   ConSubcuentas, SoloSaldos: Boolean;
   CuentaAnalitica, Delegacion, Departamento,
   Seccion, Proyecto: String; Empresas: TStrings;
   MonedaImpresion: String = 'P';
   NivelIni: Integer = 3;
   NivelFin: Integer = 1);

   procedure FiltrarRegistros;
   begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with DMContaRef.QInformesConta do begin
         First;
         while not EOF do begin
            if RoundToDecimal(FieldByName('SALDO').AsFloat, 2, True) = 0 then   begin
               Delete;
            end
            else begin
               Next;
            end;
         end;
         First;
      end;
   end;

   procedure RellenarDatosDescripcion;
   begin
      //  Almacenar la fecha inicial del filtro para incluirla en la descripción
      // del listado.
      DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
      DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;

      DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;
   end;

   procedure RellenarImportes(SumaDebe, SumaHaber, TotSumaDebe,
      TotSumaHaber: Double);
   begin
      DmContaRef.QInformesConta.FieldByName('DEBE').AsFloat           := SumaDebe;
      DmContaRef.QInformesConta.FieldByName('HABER').AsFloat          := SumaHaber;
      DmContaRef.QInformesConta.FieldByName('SALDO').AsFloat          := SumaDebe - SumaHaber;
      DmContaRef.QInformesConta.FieldByName('TOTALSUMADEBE').AsFloat  := TotSumaDebe;
      DmContaRef.QInformesConta.FieldByName('TOTALSUMAHABER').AsFloat := TotSumaHaber;
      DmContaRef.QInformesConta.FieldByName('TOTALSUMASALDO').AsFloat := TotSumaDebe - TotSumaHaber;
   end;

var
   QApuntes, QCuentas, QConceptos: TIBQuery;
   Caratula:  TEspere;
   EsPrimero: Boolean;
   Cuenta, Cuenta1, Cuenta2, Descripcion: String;
   nTotSumaDebe, nSumaDebe, nSumaDebe1, nSumaDebe2, nTotSumaHaber, nSumaHaber,
   nSumaHaber1, nSumaHaber2: Double;
   IndCons:   Integer;
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
   Caratula.Imagenes.Cancelar_Abajo := gvDirImagenes + gcBtnBlanco;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   gvProcesoAbortado := False;

   if subcuentaFinal = '' then begin
      subcuentaFinal := subcuentaInicial;
   end;

   if length(subcuentaInicial) < gvlongitudsubcuenta then   begin
      subcuentaInicial := BackChar(subcuentaInicial, '0', gvlongitudsubcuenta);
   end;
   if length(subcuentaFinal) < gvlongitudsubcuenta then   begin
      subcuentaFinal := Backchar(subcuentaFinal, '9', gvlongitudsubcuenta);
   end;

   if DescSubctaFinal = '' then   begin
      DescSubctaFinal := DescSubctaInicial;
   end;

   // Selección de datos de concepto
   QConceptos := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QConceptos, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT TIPOCONTABILIDAD');
      Add('FROM CONCEPTOS');
      Add('WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
      Prepare;
   end;

   // Selección de cuentas
   QCuentas := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QCuentas, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   CUENTA, DESCRIPCION, TIPOCUENTA');
      Add('FROM CUENTAS');
      Add('WHERE CUENTA = :CUENTA');

      Prepare;
   end;

   // Selección de asientos
   QApuntes := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QApuntes, SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   D.ASIENTO, D.APUNTE, D.NUMEROFACTURA, D.FECHA, D.DEBEHABER,');
      Add('   D.CONTRAPARTIDA, D.SUBCUENTA, S.DESCRIPCION,D.ID_CONCEPTOS,');
      Add('   D.BASEIMPONIBLE, D.IMPORTE, D.IVA, D.MONEDA, D.CUENTA_ANALITICA,');
      Add('   D.COMENTARIO');
      Add('FROM DIARIO D, SUBCTAS S');
      Add('WHERE');

      if FechaInicial = 0 then   begin
         Add('   (D.FECHA IS NULL OR (D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL))');
      end
      else begin
         Add('   D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL');
      end;

      if SeleccionPorSubcuenta then   begin
         if SubcuentaFinal <> '' then   begin
            if SubcuentaInicial = '' then   begin
               Add('   AND (D.SUBCUENTA IS NULL OR (D.SUBCUENTA >= :SUBCUENTAINICIAL AND D.SUBCUENTA <= :SUBCUENTAFINAL))');
            end
            else begin
               Add('   AND D.SUBCUENTA >= :SUBCUENTAINICIAL AND D.SUBCUENTA <= :SUBCUENTAFINAL');
            end;
         end;
      end;
      if SeleccionPorDescripcion then   begin
         if DescSubctaFinal <> '' then   begin
            if DescSubctaInicial = '' then   begin
               Add('   AND (S.DESCRIPCION IS NULL OR (S.DESCRIPCION >= :DESCINICIAL AND S.DESCRIPCION <= :DESCFINAL))');
            end
            else begin
               Add('   AND S.DESCRIPCION >= :DESCINICIAL AND S.DESCRIPCION <= :DESCFINAL');
            end;
         end;
      end;

      Add('   AND D.SUBCUENTA = S.SUBCUENTA');


      Add('ORDER BY D.SUBCUENTA');

      // PARÁMETROS
      ParamByName('FECHAINICIAL').AsDateTime := FechaInicial;
      ParamByName('FECHAFINAL').AsDateTime   := FechaFinal;

      if SeleccionPorSubcuenta then   begin
         if SubcuentaFinal <> '' then   begin
            ParamByName('SUBCUENTAINICIAL').AsString := SubcuentaInicial;
            ParamByName('SUBCUENTAFINAL').AsString   := SubcuentaFinal;
         end;
      end;
      if SeleccionPorDescripcion then   begin
         if DescSubctaFinal <> '' then   begin
            ParamByName('DESCINICIAL').AsString := DescSubctaInicial;
            ParamByName('DESCFINAL').AsString   := DescSubctaFinal;
         end;
      end;

      Prepare;
      Open;
   end;

   DMContaRef.QSubcuentasSS.EmptyDataset;
   DMContaRef.QSubcuentasSS.indexname := 'SUBCUENTA';

   EsPrimero     := True;
   nTotSumaDebe  := 0;
   nSumaDebe     := 0;
   //nSumaDebe1 := 0;
   //nSumaDebe2 := 0;
   nTotSumaHaber := 0;
   nSumaHaber    := 0;
   //nSumaHaber1 := 0;
   //nSumaHaber2 := 0;


   // Empresa actual
   try
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QApuntes do begin
         while not EOF do begin
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
                  CuentaAnalitica, '', Delegacion,
                  Departamento, Seccion, Proyecto) then   begin
                  Next;
                  Continue;
               end;
            end;
            if EsPrimero then   begin
               EsPrimero   := False;
               Cuenta      := FieldByName('SUBCUENTA').AsString;
               Cuenta1     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelIni);
               Cuenta2     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelFin);
               Descripcion := FieldByName('DESCRIPCION').AsString;
            end;

            if Cuenta <> FieldByName('SUBCUENTA').AsString then   begin
               // if ConSubcuentas then
               begin
                  DmContaRef.QSubcuentasSS.Append;
                  DmContaRef.QSubcuentasSS.Edit;
                  DmContaRef.QSubcuentasSS.FieldByName('SUBCUENTA').AsString := Cuenta;
                  DmContaRef.QSubcuentasSS.FieldByName('DESCSUBCUENTA').AsString := Descripcion;
                  DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat       := nSumaDebe;
                  DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat      := nSumaHaber;
                  DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat      := nSumaDebe - nSumaHaber;
                  DmContaRef.QSubcuentasSS.Post;
                  Application.ProcessMessages;
               end;
               nTotSumaDebe  := nTotSumaDebe + nSumaDebe;
               nTotSumaHaber := nTotSumaHaber + nSumaHaber;
               nSumaDebe     := 0;
               nSumaHaber    := 0;
               Cuenta        := FieldByName('SUBCUENTA').AsString;
               Descripcion   := FieldByName('DESCRIPCION').AsString;
            end;
            if FieldByName('DEBEHABER').AsString = 'D' then   begin
               nSumaDebe := nSumaDebe + ConversionImporte(
                  FieldByName('IMPORTE').AsFloat, FieldByName(
                  'MONEDA').AsString, MonedaImpresion);
            end
            else begin
               nSumaHaber := nSumaHaber + ConversionImporte(
                  FieldByName('IMPORTE').AsFloat, FieldByName(
                  'MONEDA').AsString, MonedaImpresion);
            end;

            Next;
         end;  // while

         if not EsPrimero then   begin
            nTotSumaDebe  := nTotSumaDebe + nSumaDebe;
            nTotSumaHaber := nTotSumaHaber + nSumaHaber;
            //if ConSubcuentas then
            begin
               DmContaRef.QSubcuentasSS.Append;
               DmContaRef.QSubcuentasSS.Edit;
               DmContaRef.QSubcuentasSS.FieldByName('SUBCUENTA').AsString     := Cuenta;
               DmContaRef.QSubcuentasSS.FieldByName('DESCSUBCUENTA').AsString := Descripcion;
               DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat           := nSumaDebe;
               DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat          := nSumaHaber;
               DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat          := nSumaDebe - nSumaHaber;
               DmContaRef.QSubcuentasSS.Post;
               Application.ProcessMessages;
            end;
            Application.ProcessMessages;
         end;
      end;      


      // Empresas consolidadas
      for IndCons := 0 to Empresas.Count - 1 do begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QApuntes do begin
            DMRef.ConectarBDEmpresa(Empresas.Strings[IndCons]);
            Close;
            Database    := DMRef.IBDConsolida;
            Transaction := DMRef.IBDConsolida.DefaultTransaction;

            // PARÁMETROS
            ParamByName('FECHAINICIAL').AsDateTime := FechaInicial;
            ParamByName('FECHAFINAL').AsDateTime   := FechaFinal;

            if SeleccionPorSubcuenta then   begin
               if SubcuentaFinal <> '' then   begin
                  ParamByName('SUBCUENTAINICIAL').AsString := SubcuentaInicial;
                  ParamByName('SUBCUENTAFINAL').AsString   := SubcuentaFinal;
               end;
            end;
            if SeleccionPorDescripcion then   begin
               if DescSubctaFinal <> '' then   begin
                  ParamByName('DESCINICIAL').AsString := DescSubctaInicial;
                  ParamByName('DESCFINAL').AsString   := DescSubctaFinal;
               end;
            end;

            Prepare;
            Open;
         end;    

         EsPrimero  := True;
         nSumaDebe  := 0;
         //nSumaDebe1 := 0;
         //nSumaDebe2 := 0;
         nSumaHaber := 0;
         //nSumaHaber1 := 0;
         //nSumaHaber2 := 0;

         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QApuntes do begin
            while not EOF do begin
               if not FieldByName('ID_CONCEPTOS').IsNull then   begin
                  QConceptos.Close;
                  QConceptos.Database    := DMRef.IBDConsolida;
                  QConceptos.Transaction := DMRef.IBDConsolida.DefaultTransaction;
                  QConceptos.ParamByName('ID_CONCEPTOS').AsString := FieldByName('ID_CONCEPTOS').AsString;
                  QConceptos.Open;
                  if (TipoConcepto <> 'T') and (QConceptos.FieldByName(
                     'TipoContabilidad').AsString <> TipoConcepto) then   begin
                     Next;
                     continue;
                  end;
                  if not DMContaRef.Pertenece_Analitica(FieldByName('CUENTA_ANALITICA').AsString,
                     CuentaAnalitica, '', Delegacion,
                     Departamento, Seccion, Proyecto,
                     DMRef.IBDConsolida) then   begin
                     Next;
                     Continue;
                  end;
               end;
               if EsPrimero then   begin
                  EsPrimero   := False;
                  Cuenta      := FieldByName('SUBCUENTA').AsString;
                  Cuenta1     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelIni);
                  Cuenta2     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelFin);
                  Descripcion := FieldByName('DESCRIPCION').AsString;
               end;

               if Cuenta <> FieldByName('SUBCUENTA').AsString then   begin
                  //if ConSubcuentas then
                  begin
                     // DmContaRef.QInformesConta.IndexName := 'SUBCUENTA';
                     DmContaRef.QSubcuentasSS.First;
                     if not DMContaRef.QSubcuentasSS.FindKey([Cuenta]) then   begin
                        DmContaRef.QSubcuentasSS.Append;
                     end;
                     DmContaRef.QSubcuentasSS.Edit;
                     DmContaRef.QSubcuentasSS.FieldByName('SUBCUENTA').AsString := Cuenta;
                     DmContaRef.QSubcuentasSS.FieldByName('DESCSUBCUENTA').AsString := Descripcion;
                     DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat       :=
                        DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat + nSumaDebe;
                     DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat      :=
                        DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat + nSumaHaber;
                     DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat      :=
                        DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat + nSumaDebe - nSumaHaber;
                     DmContaRef.QSubcuentasSS.Post;
                     Application.ProcessMessages;
                  end;
                  nTotSumaDebe  := nTotSumaDebe + nSumaDebe;
                  nTotSumaHaber := nTotSumaHaber + nSumaHaber;
                  nSumaDebe     := 0;
                  nSumaHaber    := 0;
                  Cuenta        := FieldByName('SUBCUENTA').AsString;
                  Descripcion   := FieldByName('DESCRIPCION').AsString;
               end;
               if FieldByName('DEBEHABER').AsString = 'D' then   begin
                  nSumaDebe := nSumaDebe + ConversionImporte(
                     FieldByName('IMPORTE').AsFloat, FieldByName(
                     'MONEDA').AsString, MonedaImpresion);
               end
               else begin
                  nSumaHaber := nSumaHaber + ConversionImporte(
                     FieldByName('IMPORTE').AsFloat, FieldByName(
                     'MONEDA').AsString, MonedaImpresion);
               end;

               Next;
            end;    // while not eof

            if not EsPrimero then   begin
               nTotSumaDebe  := nTotSumaDebe + nSumaDebe;
               nTotSumaHaber := nTotSumaHaber + nSumaHaber;
               //if ConSubcuentas then
               begin
                  DmContaRef.QSubcuentasSS.First;
                  if not DMContaRef.QSubcuentasSS.FindKey([Cuenta]) then   begin
                     DmContaRef.QSubcuentasSS.Append;
                  end;
                  DmContaRef.QSubcuentasSS.Edit;
                  DmContaRef.QSubcuentasSS.FieldByName('SUBCUENTA').AsString := Cuenta;
                  DmContaRef.QSubcuentasSS.FieldByName('DESCSUBCUENTA').AsString := Descripcion;
                  DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat       :=
                     DmContaRef.QSubcuentasSS.FieldByName('DEBE').AsFloat + nSumaDebe;
                  DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat      :=
                     DmContaRef.QSubcuentasSS.FieldByName('HABER').AsFloat + nSumaHaber;
                  DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat      :=
                     DmContaRef.QSubcuentasSS.FieldByName('SALDO').AsFloat + nSumaDebe - nSumaHaber;
                  DmContaRef.QSubcuentasSS.Post;
                  Application.ProcessMessages;
               end;
               Application.ProcessMessages;
            end;
         end;
      end;   
      QApuntes.Close;
      QApuntes.Free;
   except
      on E: Exception do begin
         QConceptos.Close;
         QConceptos.Free;
         QApuntes.Close;
         QApuntes.Free;
         QCuentas.Close;
         QCuentas.Free;

         Caratula.Cerrar;
         Caratula.Free;

         DatabaseError(E.Message);
      end;
   end;

   QConceptos.Close;
   QConceptos.Free;


   // Cargar datos en QInformes
   DMContaRef.QInformesConta.IndexName := '';
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DmContaRef.QSubcuentasSS do begin
      First;

      // Inicializaciones
      nTotSumaDebe  := 0;
      nTotSumaHaber := 0;
      nSumaDebe1    := 0;
      nSumaDebe2    := 0;
      nSumaHaber1   := 0;
      nSumaHaber2   := 0;
      Cuenta1       := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelIni);
      Cuenta2       := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelFin);

      while not EOF do begin

         if Cuenta1 <> Copy(FieldByName('SUBCUENTA').AsString, 1, NivelIni) then   begin
            DmContaRef.QInformesConta.Append;
            DmContaRef.QInformesConta.Edit;
            DmContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString := Cuenta1;

            QCuentas.Close;
            QCuentas.ParamByName('CUENTA').AsString := Cuenta1;
            QCuentas.Open;
            if not QCuentas.EOF then   begin
               DmContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                  Trim(QCuentas.FieldByName('DESCRIPCION').AsString);
            end;

            RellenarImportes(nSumaDebe1, nSumaHaber1, nTotSumaDebe, nTotSumaHaber);
            RellenarDatosDescripcion;

            DmContaRef.QInformesConta.Post;
            Application.ProcessMessages;
            nSumaDebe1  := 0;
            nSumaHaber1 := 0;
            Cuenta1     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelIni);
         end;

         if Cuenta2 <> Copy(FieldByName('SUBCUENTA').AsString, 1, NivelFin) then   begin
            DmContaRef.QInformesConta.Append;
            DmContaRef.QInformesConta.Edit;
            DmContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString := Cuenta2;

            QCuentas.Close;
            QCuentas.ParamByName('CUENTA').AsString := Cuenta2;
            QCuentas.Open;
            if not QCuentas.EOF then   begin
               DmContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                  Trim(QCuentas.FieldByName('DESCRIPCION').AsString);
            end;

            RellenarImportes(nSumaDebe2, nSumaHaber2, nTotSumaDebe, nTotSumaHaber);
            RellenarDatosDescripcion;

            DmContaRef.QInformesConta.Post;
            Application.ProcessMessages;
            nSumaDebe2  := 0;
            nSumaHaber2 := 0;
            Cuenta2     := Copy(FieldByName('SUBCUENTA').AsString, 1, NivelFin);
         end;

         nSumaDebe     := FieldByName('debe').AsFloat;
         nSumaDebe1    := nSumaDebe1 + FieldByName('debe').AsFloat;
         nSumaDebe2    := nSumaDebe2 + FieldByName('debe').AsFloat;
         nSumaHaber    := FieldByName('haber').AsFloat;
         nSumaHaber1   := nSumaHaber1 + FieldByName('haber').AsFloat;
         nSumaHaber2   := nSumaHaber2 + FieldByName('haber').AsFloat;
         nTotSumaDebe  := nTotSumaDebe + nSumaDebe;
         nTotSumaHaber := nTotSumaHaber + nSumaHaber;

         if ConSubcuentas then   begin
            DmContaRef.QInformesConta.Append;
            DmContaRef.QInformesConta.Edit;
            DmContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString     := FieldByName('Subcuenta').AsString;
            DmContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
               FieldByName('DescSubcuenta').AsString;
            DmContaRef.QInformesConta.FieldByName('DEBE').AsFloat           := nSumaDebe;
            DmContaRef.QInformesConta.FieldByName('HABER').AsFloat          := nSumaHaber;
            DmContaRef.QInformesConta.FieldByName('SALDO').AsFloat          := nSumaDebe - nSumaHaber;

            RellenarImportes(nSumaDebe, nSumaHaber, nTotSumaDebe, nTotSumaHaber);
            RellenarDatosDescripcion;
            DmContaRef.QInformesConta.Post;
         end;
         Next;
      end;

      // Fin del bucle
      // Cuenta1 
      DmContaRef.QInformesConta.Append;
      DmContaRef.QInformesConta.Edit;
      DmContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString := Cuenta1;

      QCuentas.Close;
      QCuentas.ParamByName('CUENTA').AsString := Cuenta1;
      QCuentas.Open;
      if not QCuentas.EOF then   begin
         DmContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
            Trim(QCuentas.FieldByName('DESCRIPCION').AsString);
      end;

      RellenarImportes(nSumaDebe1, nSumaHaber1, nTotSumaDebe, nTotSumaHaber);
      RellenarDatosDescripcion;

      DmContaRef.QInformesConta.Post;
      Application.ProcessMessages;

      // Cuenta2 
      DmContaRef.QInformesConta.Append;
      DmContaRef.QInformesConta.Edit;
      DmContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString := Cuenta2;

      QCuentas.Close;
      QCuentas.ParamByName('CUENTA').AsString := Cuenta2;
      QCuentas.Open;
      if not QCuentas.EOF then   begin
         DmContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
            Trim(QCuentas.FieldByName('DESCRIPCION').AsString);
      end;

      RellenarImportes(nSumaDebe2, nSumaHaber2, nTotSumaDebe, nTotSumaHaber);
      RellenarDatosDescripcion;

      DmContaRef.QInformesConta.Post;
      Application.ProcessMessages;
   end;

   QCuentas.Close;
   QCuentas.Free;

   // Filtrar registros a imprimir
   // Con la opción de SOLO SALDOS, no imprimir los registros con saldo 0
   if SoloSaldos then begin
      FiltrarRegistros;
   end;

   Caratula.Cerrar;
   Caratula.Free;

   if SoloSaldos then   begin
      FormPrincipal.LanzarListado('LSumasSaldosSaldo.rtm', DMContaRef.SInformesConta, MonedaImpresion);
   end
   else begin
      FormPrincipal.LanzarListado('LSumasSaldos.rtm', DMContaRef.SInformesConta, MonedaImpresion);
   end;

   DMContaRef.InicializarFicherosInformes;
end;

end.
