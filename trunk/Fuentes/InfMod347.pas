unit InfMod347;
interface
uses Classes, comctrls, ComObj, Controls, Db, dbclient, Dialogs, Forms, Graphics,
     IbQuery, Messages, ststrs, SysUtils, WinProcs, WinTypes, word_tlb, Wwtable, xprocs;

procedure LanzarInfModelo347(TipoInforme, AsientoInicial, AsientoFinal: Integer;
   FechaInicial, FechaFinal: TDateTime;
   ImporteInicial, ImporteFinal: Double;
   SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   SubcuentaInicial, SubcuentaFinal,
   DescSubctaInicial, DescSubctaFinal,
   TipoConcepto, Tipo216: String;
   FechaImpresion: TDateTime;
   GenerarCartas, GenerarDiskette: Boolean;
   MonedaImpresion: String = 'P';
   ExcluirProfesionales: Boolean = False;
   Orden: String = 'S');

implementation
uses Cadenas, DM, DMConta, General, Globales, Letras, UEspere, MenuPrincipal;

procedure LanzarInfModelo347(TipoInforme, AsientoInicial, AsientoFinal: Integer;
   FechaInicial, FechaFinal: TDateTime;
   ImporteInicial, ImporteFinal: Double;
   SeleccionPorSubcuenta, SeleccionPorDescripcion: Boolean;
   SubcuentaInicial, SubcuentaFinal,
   DescSubctaInicial, DescSubctaFinal,
   TipoConcepto, Tipo216: String;
   FechaImpresion: TDateTime;
   GenerarCartas, GenerarDiskette: Boolean;
   MonedaImpresion: String;
   ExcluirProfesionales: Boolean;
   Orden: String);
var
   //Quitado por no estar utilizándose TCorreo: TwwTable;
   FWord:   Variant;

   //Quitado por no estar utilizándoseprocedure CrearTablaCorreo;
   //Quitado por no estar utilizándosebegin
   //Quitado por no estar utilizándose   TCorreo := TwwTable.Create(nil);
   //Quitado por no estar utilizándose   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   //Quitado por no estar utilizándose   with TCorreo do begin
   //Quitado por no estar utilizándose      Active       := False;
   //Quitado por no estar utilizándose      DatabaseName := 'c:\'; //ExtractFileDir(Application.ExeName);
   //Quitado por no estar utilizándose      TableName    := 'Correo' + '.dbf';
   //Quitado por no estar utilizándose      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   //Quitado por no estar utilizándose      with FieldDefs do begin
   //Quitado por no estar utilizándose         Clear;
   //Quitado por no estar utilizándose         Add('Subcuenta', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Nombre', ftstring, 100, False);
   //Quitado por no estar utilizándose         Add('Direccion', ftstring, 85, False);
   //Quitado por no estar utilizándose         Add('Poblacion', ftstring, 60, False);
   //Quitado por no estar utilizándose         Add('CodPostal', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Provincia', ftstring, 25, False);
   //Quitado por no estar utilizándose         Add('Pesetas', ftstring, 150, False);
   //Quitado por no estar utilizándose         Add('Banco', ftstring, 100, False);
   //Quitado por no estar utilizándose         Add('Cheque', ftstring, 15, False);
   //Quitado por no estar utilizándose         Add('TotImporte', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Fecha1', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha2', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha3', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha4', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha5', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha6', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha7', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha8', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha9', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Fecha10', ftstring, 10, False);
   //Quitado por no estar utilizándose         Add('Importe1', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe2', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe3', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe4', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe5', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe6', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe7', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe8', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe9', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Importe10', ftstring, 14, False);
   //Quitado por no estar utilizándose         Add('Texto1', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto2', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto3', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto4', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto5', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto6', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto7', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto8', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto9', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Texto10', ftstring, 40, False);
   //Quitado por no estar utilizándose         Add('Ejercicio', ftstring, 4, False);
   //Quitado por no estar utilizándose         Add('Empresa', ftstring, 50, False);
   //Quitado por no estar utilizándose         Add('FVencim', ftstring, 10, False);
   //Quitado por no estar utilizándose      end;
   //Quitado por no estar utilizándose      CreateTable;
   //Quitado por no estar utilizándose   end;
   //Quitado por no estar utilizándoseend;

var
   QApuntes, QProvincias: TIBQuery;
   TFichero:          TClientDataset;
   Caratula:          TEspere;
   Subcuenta:         String;
   nImporte:          Double;
   F, Fichero:        TextFile;
   Reg1, Reg2, cNomFile, cEuro: String;
   cEjer, cCodProv, cClave, cImporte, cLocal: String;
   nImpCompras, nImpVentas: Double;
   nCompras, nVentas: Integer;
   nPosComa:          Cardinal;
   cTexto, cDescripcion: array [0..50] of Char;
   Documento, Registro: String;
begin
   if GenerarDiskette and (TipoInforme = INF_MOD_347) then   begin
      if Length(DMRef.QParametros.FieldByName('NIF').AsString) > 9 then   begin
         DatabaseError('Error en longitud NIF de empresa.' + #13 +
            'Debe ser de 9 caracteres.');
      end;
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
   Caratula.Imagenes.Cancelar_Arriba := gvDirImagenes + gcBtn;
   Caratula.Imagenes.Cancelar_Abajo := gvDirImagenes + gcBtnBlanco;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;
   gvProcesoAbortado := False;

   nImpCompras := 0;
   nImpVentas  := 0;
   nCompras    := 0;
   nVentas     := 0;

   // Selección de datos de país
   QProvincias := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QProvincias, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT CODIGO, NOMBRE FROM PROVINCIAS');
      Add('WHERE PROVINCIA = :PROVINCIA');
      Prepare;
   end;

   TFichero := TClientDataset.Create(nil);
   TFichero.Active := False;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TFichero.FieldDefs do begin
      Clear;
      Add('Cuenta', ftString, 10, False);
      Add('Descripcion', ftString, 40, False);
      Add('Arrendador', ftString, 1, False);
      Add('NIF', ftString, 15, False);
      Add('NIFEURO', ftString, 18, False);
      Add('CodProv', ftString, 2, False);
      Add('Ventas', ftFloat, 0, False);
      Add('Compras', ftFloat, 0, False);
      Add('Importe', ftFloat, 0, False);
      Add('Direccion', ftString, 85, False);
      Add('Poblacion', ftString, 60, False);
      Add('CodPostal', ftString, 10, False);
      Add('NombreProvincia', ftString, 25, False);
      Add('TIPOCUENTA', ftString, 1, False);
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TFichero.IndexDefs do begin
      Clear;
      Add('', 'cuenta', [ixPrimary]);
      Add('NIF', 'NIF;TIPOCUENTA', []);
   end;
   TFichero.CreateDataSet;
   TFichero.Active := True;
   TFichero.Append;

   DMContaRef.QInformesConta.EmptyDataSet;
   DMContaRef.QInformesConta.IndexName := 'SUBCUENTA';

   if subcuentafinal = '' then begin
      subcuentafinal := subcuentainicial;
   end;
   if subcuentainicial <> '' then begin
      if length(subcuentainicial) < gvlongitudsubcuenta then   begin
         subcuentainicial := BackChar(subcuentainicial, '0', gvlongitudsubcuenta);
      end;
      if length(subcuentafinal) < gvlongitudsubcuenta then   begin
         subcuentafinal := Backchar(subcuentafinal, '9', gvlongitudsubcuenta);
      end;
   end;

   if DescSubctaFinal = '' then  begin
      DescSubctaFinal := DescSubctaInicial;
   end;


   // Selección de asientos
   QApuntes := TIBQuery.Create(nil);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QApuntes, SQL do begin
      Close;
      Clear;
      //TODO: Database := DMRef.IBDSiamCont;
      Add('SELECT D.SUBCUENTA, D.DEBEHABER,S.NIF,');
      Add(' T.TIPOCONTABILIDAD,T.TIPOCONCEPTO,D.MONEDA, D.IMPORTE,S.PROVINCIA, ');
      aDD(' D.CUENTA_ANALITICA,S.PAIS,S.DESCRIPCION,C.TIPOCUENTA,S.ARRENDADOR,');
      Add(' S.DIRECCION, S.DIRECCION1, S.NUMERO, S.POBLACION, S.CODPOSTAL, S.PROFESIONAL');
      Add('FROM DIARIO D, CUENTAS C, SUBCTAS S,CONCEPTOS T');
      Add('WHERE SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');
      Add('   AND D.SUBCUENTA=S.SUBCUENTA ');
      Add('   AND (C.TIPOCUENTA="C" OR C.TIPOCUENTA="P")');
      // Los profesionales no salen en el 347
      Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS');
      if ExcluirProfesionales then   begin
         Add('AND (S.PROFESIONAL IS NULL OR S.PROFESIONAL <> "S")');
      end;

      if Tipo216 = 'I' then         // Incluir tipo 216
      begin
         if TipoInforme = INF_MOD_347 then begin
            Add('AND (T.TIPOCONCEPTO="3" OR T.TIPOCONCEPTO = "2")');
         end // 347
         else begin
            Add('AND (T.TIPOCONCEPTO="9" OR T.TIPOCONCEPTO = "2")');
         end; // 349
      end
      else
      if Tipo216 = 'S' then    // Sólo tipo 216
      begin
         Add('AND T.TIPOCONCEPTO = "2"');
      end
      else                          // Excluir tipo 216
      begin
         if TipoInforme = INF_MOD_347 then begin
            Add('AND T.TIPOCONCEPTO="3"');
         end // 347
         else begin
            Add('AND T.TIPOCONCEPTO="9"');
         end; // 349
      end;

      Add('   AND D.ASIENTO >= :ASIENTOINICIAL AND D.ASIENTO <= :ASIENTOFINAL');
      Add('   AND D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL');

      if SeleccionPorSubcuenta then  begin
         if SubcuentaFinal <> '' then   begin
            if SubcuentaInicial = '' then   begin
               Add('   AND (D.SUBCUENTA IS NULL OR (D.SUBCUENTA >= :SUBCUENTAINICIAL AND D.SUBCUENTA <= :SUBCUENTAFINAL))');
            end
            else begin
               Add('   AND D.SUBCUENTA >= :SUBCUENTAINICIAL AND D.SUBCUENTA <= :SUBCUENTAFINAL');
            end;
         end;
      end;
      if SeleccionPorDescripcion then  begin
         if DescSubctaFinal <> '' then   begin
            if DescSubctaInicial = '' then   begin
               Add('   AND (S.DESCRIPCION IS NULL OR (S.DESCRIPCION >= :DESCINICIAL AND S.DESCRIPCION <= :DESCFINAL))');
            end
            else begin
               Add('   AND S.DESCRIPCION >= :DESCINICIAL AND S.DESCRIPCION <= :DESCFINAL');
            end;
         end;
      end;

      Add('ORDER BY D.SUBCUENTA, D.FECHA');

      // PARÁMETROS
      ParamByName('ASIENTOINICIAL').AsInteger := AsientoInicial;
      ParamByName('ASIENTOFINAL').AsInteger   := AsientoFinal;

      ParamByName('FECHAINICIAL').AsDateTime := FechaInicial;
      ParamByName('FECHAFINAL').AsDateTime   := FechaFinal;

      if SeleccionPorSubcuenta then  begin
         if SubcuentaFinal <> '' then   begin
            ParamByName('SUBCUENTAINICIAL').AsString := SubcuentaInicial;
            ParamByName('SUBCUENTAFINAL').AsString   := SubcuentaFinal;
         end;
      end;
      if SeleccionPorDescripcion then  begin
         if DescSubctaFinal <> '' then   begin
            ParamByName('DESCINICIAL').AsString := DescSubctaInicial;
            ParamByName('DESCFINAL').AsString   := DescSubctaFinal;
         end;
      end;

      Prepare;
      Open;

      try
         while not EOF do begin
            if (TipoConcepto <> 'T') and (FieldByName('TipoContabilidad').AsString <> TipoConcepto) then
            begin
               Next;
               Continue;
            end;
            // Seleccionar datos subcuenta de enlace 347
            Subcuenta := FieldByName('SUBCUENTA').AsString;
            // Chequear si existe la subcuenta en TFichero
            TFichero.First;
            if not TFichero.findkey([Subcuenta]) then   begin
               // Si tampoco existe una subcuenta con ese nif
               // entonces si se da de alta.
               // Si no tiene nif, se trata como subcuenta diferente hasta
               // que el usuario le ponga su nif correspondiente, cuando vea el error
               // en el listado.

               TFichero.indexname := 'NIF';
               TFichero.First;
               if (empty(FieldByName('nif').AsString)) or
                  (not TFichero.findkey([FieldByName('nif').AsString,
                  FieldByName('TIPOCUENTA').AsString])) then   begin
                  TFichero.Append;
                  TFichero.Edit;
                  TFichero.FieldByName('TIPOCUENTA').AsString  := FieldByName('TIPOCUENTA').AsString;
                  TFichero.FieldByName('cuenta').AsString      := Subcuenta;
                  TFichero.FieldByName('arrendador').AsString  :=
                     FieldByName('arrendador').AsString;
                  TFichero.FieldByName('descripcion').AsString :=
                     FieldByName('Descripcion').AsString;
                  TFichero.FieldByName('nif').AsString         :=
                     FieldByName('nif').AsString;
                  TFichero.FieldByName('nifeuro').AsString     :=
                     FieldByName('pais').AsString + '-' + FieldByName('nif').AsString;
                  QProvincias.Close;
                  QProvincias.parambyname('provincia').AsString :=
                     FieldByName('Provincia').AsString;
                  QProvincias.Open;
                  TFichero.FieldByName('CodProv').AsString         :=
                     QProvincias.FieldByName('codigo').AsString;
                  TFichero.FieldByName('DIRECCION').AsString       :=
                     FieldByName('DIRECCION').AsString + ' ' + FieldByName('DIRECCION1').AsString +
                     ', ' + FieldByName('NUMERO').AsString;
                  TFichero.FieldByName('POBLACION').AsString       := FieldByName('POBLACION').AsString;
                  TFichero.FieldByName('NOMBREPROVINCIA').AsString := QProvincias.FieldByName('NOMBRE').AsString;
                  TFichero.FieldByName('CODPOSTAL').AsString       := FieldByName('CODPOSTAL').AsString;
                  TFichero.Post;
               end;
               TFichero.indexname := '';
            end;

            // Ya esta situado TFichero }
            TFichero.Edit;
            if (FieldByName('DebeHaber').AsString = 'D') and (FieldByName('TipoCuenta').AsString = 'C') then
            begin
               TFichero.FieldByName('Ventas').AsFloat :=
                  RoundToDecimal(TFichero.FieldByName('Ventas').AsFloat +
                  ConversionImporte(FieldByName('Importe').AsFloat, FieldByName('moneda').AsString,
                  MonedaImpresion), 2, True);
            end;
            if (FieldByName('DebeHaber').AsString = 'H') and (FieldByName('TipoCuenta').AsString = 'P') then
            begin
               TFichero.FieldByName('Compras').AsFloat :=
                  RoundToDecimal(TFichero.FieldByName('Compras').AsFloat +
                  ConversionImporte(FieldByName('Importe').AsFloat, FieldByName('moneda').AsString,
                  MonedaImpresion), 2, True);
            end;
            TFichero.Post;
            Next;
         end; // While
      except
         on E: Exception do begin
            QProvincias.Close;
            QProvincias.Free;
            Caratula.Cerrar;
            Caratula.Free;
            DatabaseError(E.message);
         end;
      end;
      Close;
      Free;
   end; 

   if GenerarDiskette and (TipoInforme = INF_MOD_349) then begin
      // Generacion de fichero de enlace 349
      cEjer    := IntToStr(DateYear(DmRef.QParametros.FieldByName('Fecha_Inicio_Ejercicio').AsDateTime));
      cNomfile := 'OP349' + copy(cEjer, 3, 2) + '.TXT';
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TFichero do begin
         First;
         while not EOF do begin
            if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
               nImporte := FieldByName('ventas').AsFloat;
            end
            else begin
               nImporte := FieldByName('compras').AsFloat;
            end;
            if not ((nImporte >= ImporteInicial) and (nImporte <= ImporteFinal)) then   begin
               Next;
               Continue;
            end;
            if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
               nImpVentas := nImpVentas + nImporte;
               Inc(nVentas);
            end
            else begin
               nImpCompras := nImpCompras + nImporte;
               Inc(nCompras);
            end;
            Next;
         end;
      end;

      AssignFile(F, gvDirectorio + '\' + cNomFile);
      Rewrite(F);

      cEuro := Trim(FloattostrF(RoundToDecimal(nImpCompras + nImpVentas, 2, True), ffFixed, 15, 2));
      StrStPosS(cEuro, ',', nPosComa);
      cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) +
         BackChar(Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 15);

      // Primero Reg1 (Declarante)
      Reg1 := '1349' + cEjer + leadchar(Trim(DmRef.QParametros.FieldByName('NIF').AsString), '0', 9) + //9-17
         Copy(BackChar(Trim(UpperCase(DmRef.QParametros.FieldByName('Nombrefiscal').AsString)), ' ', 40),
         1, 40) + // 18-57
         'D' +    // 58 Tipo de soporte Disquete
                  // 59-67 (9) Telefono de Contacto
         Backchar(Copy(Trim(DmRef.QParametros.FieldByName('telefono').AsString), 1, 9), ' ', 9) +
         // 68-107 (40) Apellidos y Nombre
         BackChar(copy(Trim(DmRef.QParametros.FieldByName('contacto').AsString), 1, 40), ' ', 40) +
         Replicate(' ', 13) + // 108-120 (13)  Numero justificante de declaracion
         ' ' +  // 121 Declaracion complementaria
         ' ' +  // 122 Declaracion sustitutiva
         Replicate('0', 13) + // 123-135 (13) Numero de justificante de la declaracion anterior
         '0A';  //  136-137 .. Se pone por defecto Periodo anual                     

      Reg1 := Reg1 + leadchar(IntToStr(nCompras + nVentas), '0', 9) +
         // 138-146 (9) Numero total de operadores tipo E
         cImporte +  // 147-161 Importe de las operaciones intracomunitarias
         Replicate('0', 9) +  // 162-170 Numero total de operadores rectificaciones (no se hace)
         Replicate('0', 15) + // 171-185 Importe de las operaciones rectificaciones (no se hace)
         Replicate(' ', 65); // 186-250   

      Writeln(F, Reg1);
      if length(Reg1) <> 250 then  begin
         Caratula.Cerrar;
         Caratula.Free;
         ShowMessage('Error en longitud Reg1 ' + IntToStr(Length(Reg1)));
         CloseFile(F);
         Exit;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TFichero do begin
         First;
         while not EOF do begin
            strpcopy(cTexto, Padr(FieldByName('Descripcion').AsString, 40));
            CharToOEM(cTexto, cDescripcion);

            if RoundToDecimal(FieldByName('Compras').AsFloat, 2, True) > 0 then   begin
               cEuro := Trim(FloattostrF(RoundToDecimal(FieldByName('Compras').AsFloat, 2, True), ffFixed, 13, 2));
               StrStPosS(cEuro, ',', nPosComa);
               cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) +
                  BackChar(Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 13);
            end
            else begin
               cEuro := Trim(FloattostrF(RoundToDecimal(FieldByName('ventas').AsFloat, 2, True), ffFixed, 13, 2));
               StrStPosS(cEuro, ',', nPosComa);
               cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) +
                  BackChar(Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 13);
            end;

            // Un Reg2 por cada Operacion declarada
            Reg2 := '2349' + cEjer + leadchar(Trim(DmRef.QParametros.FieldByName('Nif').AsString), '0', 9) +
               // 9-17 (9)
               Replicate(' ', 58) + // 18-75 En blanco
               Copy(Trim(FieldByName('NifEuro').AsString), 1, 2) + // 76-92 (17) Nif Operador comunitario
               Backchar(Trim(Copy(Trim(FieldByName('NifEuro').AsString), 4, 15)), ' ', 15) +
               Copy(cDescripcion, 1, 40) + // 93-132 (40) Razon social operador intracomunitario
               'E' +      // 133 Clave de Operacion
               cImporte + // 134-146 (13) Base Imponible               
               Replicate(' ', 104);// 147-250 Blancos             
            Writeln(F, Reg2);
            if length(Reg2) <> 250 then   begin
               Caratula.Cerrar;
               Caratula.Free;
               ShowMessage('Error en longitud Reg2 ' + IntToStr(Length(Reg2)));
               CloseFile(F);
               Exit;
            end;
            Next;
         end;
      end;
      CloseFile(F);
   end;

   if GenerarDiskette and (TipoInforme = INF_MOD_347) then begin
      // Generacion de fichero de enlace 347
      cEjer    := IntToStr(DateYear(DmRef.QParametros.FieldByName('Fecha_Inicio_Ejercicio').AsDateTime));
      cNomfile := 'OP347' + copy(cEjer, 3, 2) + '.TXT';
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TFichero do begin
         First;
         while not EOF do begin
            if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
               nImporte := FieldByName('ventas').AsFloat;
            end
            else begin
               nImporte := FieldByName('compras').AsFloat;
            end;
            if not ((nImporte >= ImporteInicial) and (nImporte <= ImporteFinal)) then   begin
               Next;
               Continue;
            end;
            if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
               nImpVentas := nImpVentas + nImporte;
               Inc(nVentas);
            end
            else begin
               nImpCompras := nImpCompras + nImporte;
               Inc(nCompras);
            end;
            Next;
         end;
      end;

      AssignFile(F, gvDirectorio + '\' + cNomFile);
      Rewrite(F);

      // Situar provincias                                        
      cCodProv := '00'; // Dejar asi de momento
      QProvincias.Close;
      QProvincias.parambyname('provincia').AsString :=
         DmRef.QParametros.FieldByName('Provincia').AsString;
      QProvincias.Open;
      cCodProv := leadchar(QProvincias.FieldByName('codigo').AsString, '0', 2);

      // Primero Reg1 (Declarante)
      Reg1 := '1347' + cEjer + leadchar(Trim(DmRef.QParametros.FieldByName('NIF').AsString), '0', 9) + //9-17
         Copy(BackChar(Trim(UpperCase(DmRef.QParametros.FieldByName('Nombrefiscal').AsString)), ' ', 40),
         1, 40); // 18-57
      // Cuantos con compras y ventas
      // Cambio

      cEuro := Trim(FloattostrF(RoundToDecimal(nImpCompras + nImpVentas, 2, True), ffFixed, 15, 2));
      StrStPosS(cEuro, ',', nPosComa);
      cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) + BackChar(
         Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 15);

      Reg1 := Reg1 + 'D' + Replicate(' ', 77) + leadchar(IntToStr(nCompras + nVentas), '0', 9) +
         // 136-144 (9) t. op.compras y ventas
         cImporte + // 145-159 (15) t.imp.compras  y ventas
         leadchar('', '0', 9) + // 160-168 (9)  t.inmuebles
         leadchar('', '0', 15) + // 169-183 (15) t.imp.inmuebles
         Replicate(' ', 67); // Resto de valores no utilizados

      Writeln(F, Reg1);
      if length(Reg1) <> 250 then  begin
         Caratula.Cerrar;
         Caratula.Free;
         ShowMessage('Error en longitud Reg1 ' + IntToStr(Length(Reg1)));
         CloseFile(F);
         Exit;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TFichero do begin
         First;
         while not EOF do begin
            if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
               nImporte := TFichero.FieldByName('ventas').AsFloat;
            end
            else begin
               nImporte := TFichero.FieldByName('compras').AsFloat;
            end;
            if not ((nImporte >= ImporteInicial) and (nImporte <= ImporteFinal)) then   begin
               Next;
               Continue;
            end;

            cLocal := ' ';
            if not empty(FieldByName('arrendador').AsString) then begin
               cLocal := 'X';
            end;

            // Un Reg2 por cada Operacion declarada
            Reg2 := '2347' + cEjer + leadchar(Trim(DmRef.QParametros.FieldByName('Nif').AsString), '0', 9);
            // 9-17 (9)
            // Clave de Operacion
            // Se considera que no puede tener compras y ventas a la vez
            // se hace en clave
            if RoundToDecimal(FieldByName('Compras').AsFloat, 2, True) > 0 then   begin
               cClave := 'A';
               cEuro  := Trim(FloattostrF(RoundToDecimal(FieldByName('Compras').AsFloat, 2, True), ffFixed, 15, 2));
               StrStPosS(cEuro, ',', nPosComa);
               cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) + BackChar(
                  Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 15);
            end;

            if RoundToDecimal(FieldByName('Ventas').AsFloat, 2, True) > 0 then   begin
               cClave := 'B';
               cEuro  := Trim(FloattostrF(RoundToDecimal(FieldByName('ventas').AsFloat, 2, True), ffFixed, 15, 2));
               StrStPosS(cEuro, ',', nPosComa);
               cImporte := LeadChar(Copy(cEuro, 1, nPosComa - 1) + BackChar(
                  Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', 15);
            end;

            strpcopy(cTexto, Padr(FieldByName('Descripcion').AsString, 40));
            CharToOEM(cTexto, cDescripcion);

            Reg2 := Reg2 + leadchar(Trim(FieldByName('Nif').AsString), '0', 9) + // 18-26 (9)
               Replicate(' ', 9) + // 27-35 (9)
               copy(cDescripcion, 1, 40) + // 36-75 (40)
               'D'; // 76

            // Hay que diferenciar por:
            //   Residentes y No residentes con domicilio permanente
            //   No residentes sin domicilio permanente (99xxx)
            //            siendo xxx el codigo del pais de residencia


            Reg2 := Reg2 +     // 77-78 (2) codigo de provincia
               leadchar(FieldByName('codprov').AsString, '0', 2) + '000' + // 79-81 (3) codigo de pais
               cClave +  // 82 
               cImporte + // 83-95 (13) importe de la operacion, parte entera
                         // 96-97 (2) importe de la operacion, parte decimal
               ' ' +     // (98) operacion de seguro
               cLocal +  // (99) arrendamiento local negocio
               Replicate(' ', 151); // (100-250) blancos

            Writeln(F, Reg2);
            if length(Reg2) <> 250 then   begin
               Caratula.Cerrar;
               Caratula.Free;
               ShowMessage('Subcuenta: ' + FieldByName('cuenta').AsString +
                  '. Error longitud NIF. Debe ser de 9 caracteres. (' + IntToStr(length(Reg2)) + ')');
               CloseFile(F);
               Exit;
            end;
            Next;
         end; // while
      end; // Tfichero
      CloseFile(F);
   end; // GenerarDiskette and (TipoInforme=INF_MOD_347) then
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TFichero do begin
      indexname := '';
      First;
      while not EOF do begin
         if RoundToDecimal(FieldByName('ventas').AsFloat, 2, True) > 0 then   begin
            nImporte := TFichero.FieldByName('ventas').AsFloat;
         end
         else begin
            nImporte := TFichero.FieldByName('compras').AsFloat;
         end;
         if ((nImporte >= ImporteInicial) and (nImporte <= ImporteFinal)) then   begin
            DMContaRef.QInformesConta.Append;
            DMContaRef.QInformesConta.Edit;
            //  Almacenar la fecha inicial del filtro para incluirla en la descripción
            // del listado.
            DMContaRef.QInformesConta.FieldByName('FechaInicial').AsDateTime := FechaInicial;
            DMContaRef.QInformesConta.FieldByName('FechaFinal').AsDateTime   := FechaFinal;

            DMContaRef.QInformesConta.FieldByName('FechaImpresion').AsDateTime := FechaImpresion;

            DMContaRef.QInformesConta.FieldByName('SUBCUENTA').AsString     :=
               FieldByName('cuenta').AsString;
            DMContaRef.QInformesConta.FieldByName('DESCSUBCUENTA').AsString :=
               FieldByName('DESCRIPCION').AsString;
            if (TipoInforme = INF_MOD_347) then   begin
               DMContaRef.QInformesConta.FieldByName('NIF').AsString :=
                  FieldByName('NIF').AsString;
            end
            else begin
               DMContaRef.QInformesConta.FieldByName('NIF').AsString :=
                  FieldByName('NIFeuro').AsString;
            end;
            DMContaRef.QInformesConta.FieldByName('PROVINCIA').AsString     :=
               FieldByName('CODPROV').AsString;
            // if RoundToDecimal(fieldbyname('ventas').asfloat,2,True)>0 then
            DMContaRef.QInformesConta.FieldByName('IMPORTEVENTAS').AsFloat  :=
               FieldByName('VENTAS').AsFloat;
            // else
            DMContaRef.QInformesConta.FieldByName('IMPORTECOMPRAS').AsFloat :=
               FieldByName('COMPRAS').AsFloat;
            DMContaRef.QInformesConta.Post;
         end;
         Next;
      end; // while
   end; 

   if GenerarCartas then begin
      //CrearTablaCorreo;
      AssignFile(Fichero, 'c:\enlace347.txt');
      Rewrite(Fichero);

      // Primero crear la cabecera del fichero la cual no se usa
      Registro := 'NOMBRE#SUBCUENTA#DIRECCION#POBLACION#CODPOSTAL#PROVINCIA#EJERCICIO#EMPRESA#TOTIMPORTE#EUROS';
      Writeln(Fichero, Registro);

      TFichero.IndexName := '';
      TFichero.First;
      while not TFichero.EOF do begin
         if RoundToDecimal(TFichero.FieldByName('VENTAS').AsFloat, 3, True) > 0 then   begin
            nImporte := TFichero.FieldByName('VENTAS').AsFloat;
         end
         else begin
            nImporte := TFichero.FieldByName('COMPRAS').AsFloat;
         end;
         if not ((nImporte >= ImporteInicial) and (nImporte <= ImporteFinal)) then   begin
            TFichero.Next;
            Continue;
         end;
         Registro := TFichero.FieldByName('DESCRIPCION').AsString + '#' +
            TFichero.FieldByName('CUENTA').AsString + '#' +
            TFichero.FieldByName('DIRECCION').AsString + '#' +
            TFichero.FieldByName('POBLACION').AsString + ' #' +
            TFichero.FieldByName('CODPOSTAL').AsString + ' #' +
            TFichero.FieldByName('NOMBREPROVINCIA').AsString + '#' +
            IntToStr(DateYear(DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime)) + '#' +
            DMRef.QParametros.FieldByName('NOMBREFISCAL').AsString + '#' +
            Format('%.2n', [nImporte]) + '#' + UpperCase(Euros(nImporte, 'M'));

         Writeln(Fichero, Registro);
         TFichero.Next;
      end;
      CloseFile(Fichero);
   end;


   QProvincias.Close;
   QProvincias.Free;

   Caratula.Cerrar;
   Caratula.Free;

   if GenerarCartas then begin
      Documento     := DMRef.QParametros.FieldByName('DOC347').AsString;
      Screen.Cursor := crHourGlass;
      try
         FWord := GetActiveOleObject('Word.Application');
      except
         FWord := CreateOleObject('Word.Application');
      end;

      FWord.Documents.Open(
         FileName := Documento,
         ConfirmConversions := False,
         ReadOnly := True, AddToRecentFiles := False, PasswordDocument := '',
         PasswordTemplate := '', Revert := False, WritePasswordDocument := '',
         WritePasswordTemplate := '', Format := wdOpenFormatAuto);

      FWord.ActiveDocument.MailMerge.MainDocumentType := 0;

      Screen.Cursor := crDefault;

      FWord.ActiveDocument.MailMerge.OpenDataSource(
         Name := 'c:\Enlace347.txt',
         ConfirmConversions := False, ReadOnly := False, LinkToSource := True,
         AddToRecentFiles := False, PasswordDocument := '', PasswordTemplate := '',
         WritePasswordDocument := '', WritePasswordTemplate := '', Revert := False,
         Format := wdOpenFormatAuto, Connection := '',
         SQLStatement := '', SQLStatement1 := '');

      if DMRef.QParametros.FieldByName('DOCIMPRIMIR').AsString = 'S' then   begin
         FWord.activeDocument.MailMerge.Destination := wdSendToNewDocument;
         FWord.Visible := True;
      end
      else begin
         FWord.activeDocument.MailMerge.Destination := wdSendToPrinter;
      end;

      FWord.activeDocument.Mailmerge.MailAsAttachment       := False;
      FWord.activeDocument.Mailmerge.SuppressBlankLines     := True;
      FWord.activeDocument.Mailmerge.Datasource.FirstRecord := wdDefaultFirstRecord;
      FWord.activeDocument.Mailmerge.Datasource.LastRecord  := wdDefaultLastRecord;
      FWord.activeDocument.Mailmerge.Execute(Pause          := False);

      if DMRef.QParametros.FieldByName('DOCIMPRIMIR').AsString <> 'S' then   begin
         FWord.ActiveDocument.Close(wdDoNotSaveChanges);
      end;

      MessageDlg('Impresión Finalizada', mtInformation, [mbOK], 0);
   end;

   if Orden = 'S' then   begin
      DMContaRef.QInformesConta.IndexName := 'SUBCUENTA';
   end
   else begin
      DMContaRef.QInformesConta.IndexName := 'DESCRIPCION';
   end;

   DMContaRef.QInformesConta.First;

   if TipoInforme = INF_MOD_347 then   begin
      FormPrincipal.LanzarListado('LOperaTer347.rtm', DMContaRef.SInformesConta, MonedaImpresion);
   end
   else begin
      FormPrincipal.LanzarListado('LOperaTer349.rtm', DMContaRef.SInformesConta, MonedaImpresion);
   end;

   DMContaRef.QInformesConta.EmptyDataSet;
   DMContaRef.QInformesConta.IndexName := '';

   TFichero.Close;
   TFichero.Free;

   DMContaRef.InicializarFicherosInformes;
end;

end.
