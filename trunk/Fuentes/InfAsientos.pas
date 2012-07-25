unit InfAsientos;
interface
uses comctrls, Controls, Db, Forms, General, Globales, Graphics, IBQuery, IbSql, SysUtils, UEspere;

procedure LanzarInfAsientos(AsientoInicial           ,
                            AsientoFinal             :Integer;
                            FechaInicial             ,
                            FechaFinal               ,
                            FechaImpresion           :TDateTime;
                            TipoConcepto             ,
                            Cuenta                   ,
                            Delegacion               ,
                            Departamento             ,
                            Seccion                  ,
                            Proyecto                 ,
                            MonedaImpresion          :string;
                            OrdenadoPorAsiento       :Boolean = True;
                            InformeNormal            :Boolean = True;
                            SoloAsientosDescuadrados :Boolean = False;
                            SoloAsientosMezcla       :Boolean = False;
                            FormatoOficial           :Boolean = False);

implementation
uses DMConta, DM, MenuPrincipal;

procedure LanzarInfAsientos(AsientoInicial           ,
                            AsientoFinal             :Integer;
                            FechaInicial             ,
                            FechaFinal               ,
                            FechaImpresion           :TDateTime;
                            TipoConcepto             ,
                            Cuenta                   ,
                            Delegacion               ,
                            Departamento             ,
                            Seccion                  ,
                            Proyecto                 ,
                            MonedaImpresion          :string;
                            OrdenadoPorAsiento       :Boolean = True;
                            InformeNormal            :Boolean = True;
                            SoloAsientosDescuadrados :Boolean = False;
                            SoloAsientosMezcla       :Boolean = False;
                            FormatoOficial           :Boolean = False);

var
   QAsientos     :TIBSQL;
   QSubcuentas   :TIBSQL;
   QConceptos    :TIBSQL;
   Caratula      :TEspere;
   nAsiento      :Integer;
   QApuntes      :TIBQuery;
   AsientoOK     :Boolean;
   Abreviatura   :string;
   DescConcepto  :string;
   NumeroFactura :string;

   procedure ProcesarAsiento(Asiento: Integer; var AsientoOK: Boolean);
   var
      TotImporte:           Double;
      DescApunte:           String;
      nTotalLineas, nLinea: Word;
   begin
      AsientoOK := True;
      nLinea    := 0; {default value}
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QApuntes do begin
         Close;
         ParamByName('ASIENTO').AsInteger := Asiento;
         Open;

         if not EOF then   begin
            if not FieldByName('ID_CONCEPTOS').IsNull then   begin
               QConceptos.Close;
               QConceptos.Params.ByName('ID_CONCEPTOS').AsString := FieldByName('ID_CONCEPTOS').AsString;
               QConceptos.ExecQuery;
               if (TipoConcepto <> 'T') and
                  (QConceptos.FieldByName('TipoContabilidad').AsString <> TipoConcepto) then   begin
                  AsientoOK := False;
               end;
            end;
            if AsientoOK and not DMContaRef.Pertenece_Analitica(
               FieldByName('CUENTA_ANALITICA').AsString, Cuenta,
               '', Delegacion, Departamento, Seccion, Proyecto) then
            begin
               AsientoOK := False;
            end;

            if AsientoOK and SoloAsientosDescuadrados then   begin
               TotImporte := 0;
               while not EOF do begin
                  if FieldByName('DEBEHABER').AsString = 'D' then   begin
                     TotImporte := TotImporte + FieldByName('IMPORTE').AsFloat;
                  end
                  else begin
                     TotImporte := TotImporte - FieldByName('IMPORTE').AsFloat;
                  end;
                  Next;
               end;
               AsientoOK := (RoundToDecimal(TotImporte, 2, True) <> 0);
            end
            else
            if AsientoOK and SoloAsientosMezcla then   begin
               nTotalLineas := 0;
               while not EOF do begin
                  Inc(nTotalLineas);
                  nLinea := FieldByName('apunte').AsInteger;
                  Next;
               end;
               AsientoOK := (nLinea <> nTotalLineas);
            end;
         end;

         if AsientoOK then   begin
            First;
            while not EOF do begin
               DMContaRef.QInformesConta.Append;
               DMContaRef.QInformesConta.Edit;
               DMContaRef.QInformesConta.FieldByName('FECHA').AsDateTime      := FieldByName('FECHA').AsDateTime;
               DMContaRef.QInformesConta.FieldByName('ASIENTO').AsInteger     :=
                  FieldByName('ASIENTO').AsInteger;
               DMContaRef.QInformesConta.FieldByName('APUNTE').AsInteger      := FieldByName('APUNTE').AsInteger;
               DMContaRef.QInformesConta.FieldByName('ID_CONCEPTOS').AsString :=
                  FieldByName('ID_CONCEPTOS').AsString;

               // Subcuenta y descripción
               Abreviatura := '';
               DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString :=
                  FieldByName('SUBCUENTA').AsString;
               if not FieldByName('SUBCUENTA').IsNull then   begin
                  QSubcuentas.Close;
                  QSubcuentas.Params.ByName('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
                  QSubcuentas.ExecQuery;
                  if not QSubcuentas.EOF then   begin
                     DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
                        Trim(QSubcuentas.FieldByName('DESCRIPCION').AsString);
                     Abreviatura := QSubcuentas.FieldByName('ABREVIATURA').AsString;
                  end;
               end;

               // Obtener la descripción del concepto
               QConceptos.Close;
               QConceptos.Params.ByName('ID_CONCEPTOS').AsString := FieldByName('ID_CONCEPTOS').AsString;
               QConceptos.ExecQuery;
               //DescConcepto := '';
               //if not QConceptos.Eof then
               DescConcepto  := Trim(QConceptos.FieldByName('DESCRIPCION').AsString) + ' ';
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
                  ConversionImporte(FieldByName('IMPORTE').AsFloat, FieldByName('MONEDA').AsString,
                  MonedaImpresion);

               if FieldByName('DEBEHABER').AsString = 'D' then   begin
                  DMContaRef.QInformesConta.FieldByName('DEBE').AsFloat :=
                     ConversionImporte(FieldByName('IMPORTE').AsFloat, FieldByName('MONEDA').AsString,
                     MonedaImpresion);
               end
               else begin
                  DMContaRef.QInformesConta.FieldByName('HABER').AsFloat :=
                     ConversionImporte(FieldByName('IMPORTE').AsFloat, FieldByName('MONEDA').AsString,
                     MonedaImpresion);
               end;

               DMContaRef.QInformesConta.FieldByName('CONTRAPARTIDA').AsString :=
                  FieldByName('CONTRAPARTIDA').AsString;

               //  Almacenar el intervalo de fechas y la fecha de impresión para
               //incluirlas en la descripción del listado.
               DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
               DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
               DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

               DMContaRef.QInformesConta.post;

               Next;
            end;
         end;
      end;
   end;

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
   Caratula.MostrarMarco := True;
   Caratula.Imagenes.Cancelar_Arriba := gvDirImagenes + gcBtn;
   Caratula.Imagenes.Cancelar_Abajo  := gvDirImagenes + gcBtnBlanco;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   gvProcesoAbortado := False;
   gvFormatoOficial  := FormatoOficial;


   // Selección de datos de subcuenta
   QSubcuentas := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT');
      Add('   SUBCUENTA, DESCRIPCION, ABREVIATURA');
      Add('FROM SUBCTAS');
      Add('WHERE SUBCUENTA = :SUBCUENTA');
      Prepare;
   end;

   // Selección de datos de concepto
   QConceptos := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QConceptos, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT ID_CONCEPTOS,DESCRIPCION,TIPOCONTABILIDAD');
      Add('FROM CONCEPTOS');
      Add('WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
      Prepare;
   end;

   // Selección de apuntes
   QApuntes := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QApuntes, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   D.APUNTE, D.SUBCUENTA, D.FECHA, D.CONTRAPARTIDA, D.IMPORTE,');
      Add('   D.NUMEROFACTURA, D.ID_CONCEPTOS, D.ID_DIARIO,D.SERIE, D.EJERCICIO,');
      Add('   D.DEBEHABER, D.ASIENTO, D.COMENTARIO, D.MONEDA, D.CUENTA_ANALITICA');
      Add('FROM');
      Add('   DIARIO D');
      Add('WHERE D.ASIENTO = :ASIENTO');
      Add('ORDER BY D.ASIENTO, D.APUNTE');
   end;

   // Selección de asientos
   QAsientos := TIBSQL.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAsientos, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;

      Add('SELECT');
      Add('   DISTINCT D.ASIENTO, D.FECHA');
      Add('FROM');
      Add('   DIARIO D');
      Add('WHERE');

      Add('   D.ASIENTO >= :ASIENTOINICIAL AND D.ASIENTO <= :ASIENTOFINAL AND');

      if FechaInicial = 0 then   begin
         Add('   (D.FECHA IS NULL OR (D.FECHA >= :FECHAINICIAL AND FECHA <= :FECHAFINAL))');
      end
      else begin
         Add('   D.FECHA >= :FECHAINICIAL AND FECHA <= :FECHAFINAL');
      end;

      if OrdenadoPorAsiento then   begin
         Add('ORDER BY D.ASIENTO, D.APUNTE');
      end
      else begin
         Add('ORDER BY D.FECHA, D.ASIENTO');
      end;

      Prepare;

      Params.ByName('ASIENTOINICIAL').AsInteger := AsientoInicial;
      Params.ByName('ASIENTOFINAL').AsInteger   := AsientoFinal;
      Params.ByName('FECHAINICIAL').AsDateTime  := FechaInicial;
      Params.ByName('FECHAFINAL').AsDateTime    := FechaFinal;

      ExecQuery;
   end;


   try
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAsientos do begin
         nAsiento := -MaxInt;
         while not EOF do begin
            ProcesarAsiento(FieldByName('ASIENTO').AsInteger, AsientoOK);

            // Forzar la inserción de una banda de separación entre asientos
            // Si es formato oficial
            if AsientoOK and (nAsiento <> FieldByName('ASIENTO').AsInteger) then   begin
               if (nAsiento <> -MaxInt) and FormatoOficial then   begin
                  DMContaRef.QInformesConta.Append;
                  DMContaRef.QInformesConta.Edit;

                  // Almacenar el intervalo de fechas y la fecha de impresión para
                  //incluirlas en la descripción del listado.
                  DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
                  DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;
                  DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

                  DMContaRef.QInformesConta.Post;
               end;
               nAsiento := FieldByName('ASIENTO').AsInteger;
            end;

            Next;
         end;

         Close;
         Free;
      end;
   except
      on E: Exception do begin
         Caratula.Cerrar;
         Caratula.Free;
         QSubcuentas.Close;
         QSubcuentas.Free;
         QConceptos.Close;
         QConceptos.Free;
         QApuntes.Close;
         QApuntes.Free;
         DatabaseError(E.message);
      end;
   end;

   QSubcuentas.Close;
   QSubcuentas.Free;
   QConceptos.Close;
   QConceptos.Free;
   QApuntes.Close;
   QApuntes.Free;

   Caratula.Cerrar;
   Caratula.Free;

   if InformeNormal then   begin
      FormPrincipal.LanzarListado('LAsientos.rtm', DmContaRef.sInformesConta, MonedaImpresion);
   end
   else begin
      FormPrincipal.LanzarListado('LAsientosExpandido.rtm', DmContaRef.sInformesConta, MonedaImpresion);
   end;

   DMContaRef.InicializarFicherosInformes;
end;

end.
