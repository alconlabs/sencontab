unit InfBalanceSituacion;
interface
uses Classes, comctrls, Controls, Db, Dialogs, Forms, General, Globales, Graphics, SysUtils,
     IBQuery, IbSql, UEspere, DM, DMConta;

//procedure LanzarInfBalanceSituacion(prmTipoInforme             :Integer;
//                                    prmFechaInicial            :TDateTime;
//                                    prmFechaFinal              :TDateTime;
//                                    prmFechaImpresion          :TDateTime;
//                                    prmSaldosEjercicioAnterior :Boolean;
//                                    prmMonedaImpresion         :string;
//                                    prmTipoConcepto            :string;
//                                    prmCuentaAnalitica         :string;
//                                    prmDelegacion              :string;
//                                    prmDepartamento            :string;
//                                    prmSeccion                 :string;
//                                    prmProyecto                :string;
//                                    prmEmpresas                :TStrings;
//                                    prmEmpresaAnterior         :Integer);

implementation
uses MenuPrincipal, DMBalances;

//procedure RellenaDatosDescripcion(prmFechaInicial   :TDateTime;
//                                  prmFechaFinal     :TDateTime;
//                                  prmFechaImpresion :TDateTime);
//begin
//   { Indica la fechas del informe para incluirlas en la descripción. }
//   DMBlnc.QInfBalanc_CuentasFECHAINICIAL.AsDateTime   := prmFechaInicial;
//   DMBlnc.QInfBalanc_CuentasFECHAFINAL.AsDateTime     := prmFechaFinal;
//   DMBlnc.QInfBalanc_CuentasFECHAIMPRESION.AsDateTime := prmFechaImpresion;
//end;
//
//procedure Formula(prmSuma :string; prmSigno :Integer);
//var nPor         :Integer;
//    nActual1     :Double;
//    nAnterior1   :Double;
//    cTituloReves :string;
//begin
//   cTituloReves := DMBlnc.QInfBalanc_TitulosTITULOREVES.AsString;
//   if not Empty(prmSuma) then begin
//      if Copy(prmSuma, 1, 1) = 'H' then nPor := -1
//                                   else nPor :=  1;
//      if Length(Trim(prmSuma)) > 2 then begin
//         { GRUPO }
//         if DMBlnc.QInfBalanc_Grupos.Locate('GRUPO', prmSuma, []) then begin
//            DMBlnc.QInfBalanc_Titulos.Edit;
//            if prmSigno = 1 then begin
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat   :=
//                    DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat +
//                    (nPor * DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat);
//               DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                    DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat +
//                    (nPor * DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat);
//            end
//            else begin
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat   :=
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat - (nPor *
//                  DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat);
//               DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                  DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat -
//                  (nPor * DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat);
//            end;
//            DMBlnc.QInfBalanc_Titulos.Post;
//         end;
//      end else
//      if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', Copy(prmSuma, 2, 1) + Copy(prmSuma, 1, 1), []) then begin { TITULO }
//         nActual1   := DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat;
//         nAnterior1 := DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat;
//
//         if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', cTituloReves, []) then begin
//            DMBlnc.QInfBalanc_Titulos.Edit;
//            if prmSigno = 1 then begin
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat   :=
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat + (nPor * nActual1);
//               DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                  DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat + (nPor * nAnterior1);
//            end
//            else begin
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat   :=
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat - (nPor * nActual1);
//               DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                  DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat - (nPor * nAnterior1);
//            end;
//            DMBlnc.QInfBalanc_Titulos.Post;
//         end;
//      end;
//   end;
//end;
//
//procedure RellenaSaldosCuentas(prmFechaInicial   :TDateTime;
//                               prmFechaFinal     :TDateTime;
//                               prmFechaImpresion :TDateTime);
//var j     :Integer;
//    Campo :string;
//    Letra :string;
//begin
//   DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//   DMBlnc.QInfBalanc_Grupos.IndexName  := 'Titulo';
//   DMBlnc.QInfBalanc_Titulos.IndexName := '';
//
//   DMBlnc.QInfBalanc_Cuentas.First;
//   DMBlnc.QInfBalanc_Titulos.First;
//   DMBlnc.QInfBalanc_Grupos.First;
//
//   while not DMBlnc.QInfBalanc_Titulos.EOF do begin
//      while not DMBlnc.QInfBalanc_Grupos.EOF and
//         (DMBlnc.QInfBalanc_TitulosTITULO.AsString = DMBlnc.QInfBalanc_GruposTITULO.AsString) do begin
//         while not DMBlnc.QInfBalanc_Cuentas.EOF and (DMBlnc.QInfBalanc_GruposGRUPO.AsString =
//               DMBlnc.QInfBalanc_CuentasGRUPO.AsString) do begin
//            DMBlnc.QInfBalanc_Cuentas.Edit;
//            RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
//
//            for j := 0 to DMBlnc.QInfBalanc_Titulos.FieldCount - 1 do begin
//               Campo := DMBlnc.QInfBalanc_Titulos.Fields[j].FieldName;
//               DMBlnc.QInfBalanc_Cuentas.FieldByName(Campo).Value := DMBlnc.QInfBalanc_Titulos.FieldByName(Campo).Value;
//            end;
//
//            for j := 0 to DMBlnc.QInfBalanc_Grupos.FieldCount - 1 do begin
//               Campo := DMBlnc.QInfBalanc_Grupos.Fields[j].FieldName;
//               DMBlnc.QInfBalanc_Cuentas.FieldByName(Campo).Value := DMBlnc.QInfBalanc_Grupos.FieldByName(Campo).Value;
//            end;
//
//            Letra := Copy(DMBlnc.QInfBalanc_CuentasTITULO.AsString, 1, 1);
//            if (Letra = 'P') or (Letra = 'H') then begin
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat;
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALGRUPO.AsFloat  :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOACTUALGRUPO.AsFloat;
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat;
//
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat;
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORGRUPO.AsFloat  :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOANTERIORGRUPO.AsFloat;
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat;
//            end;
//
//            if (Letra = 'D') or (Letra = 'H') then begin
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat   := Abs(DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat  );
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat := Abs(DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat);
//            end;
//            
//            DMBlnc.QInfBalanc_Cuentas.Post;
//            DMBlnc.QInfBalanc_Cuentas.Next;
//         end;
//         DMBlnc.QInfBalanc_Grupos.Next;
//      end;
//      DMBlnc.QInfBalanc_Titulos.Next;
//   end;
//end;
//
//
//procedure FiltraRegistros(prmTipoInforme             :Integer;
//                          prmSaldosEjercicioAnterior :Boolean;
//                          prmEmpresaAnterior         :Integer);
//begin
//   DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//   DMBlnc.QInfBalanc_Cuentas.First;
//
//   while not DMBlnc.QInfBalanc_Cuentas.EOF do begin
//      if prmTipoInforme = INF_BALANCE_SITUACION then begin
//         if (DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat   = 0) and
//            (DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat = 0) then begin
//            DMBlnc.QInfBalanc_Cuentas.Delete;
//         end else
//         if (not prmSaldosEjercicioAnterior) and (prmEmpresaAnterior = 0) and
//            (DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat = 0) then
//         begin
//            DMBlnc.QInfBalanc_Cuentas.Delete;
//         end
//         else DMBlnc.QInfBalanc_Cuentas.Next;
//      end
//      else begin
//         if (DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat    = 0) and
//            (DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat  = 0) and
//            (DMBlnc.QInfBalanc_CuentasCUENTA.AsString             <> '') then begin
//            DMBlnc.QInfBalanc_Cuentas.Delete;
//         end
//         else DMBlnc.QInfBalanc_Cuentas.Next;
//      end;
//   end;
//end;
//
//procedure InsertaLineasFormulas(prmFechaInicial   :TDateTime;
//                                prmFechaFinal     :TDateTime;
//                                prmFechaImpresion :TDateTime);
//var
//   Campo, Letra, Titulo: String;
//   J: Integer;
//begin
//   DMBlnc.QInfBalanc_Titulos.IndexName := '';
//   DMBlnc.QInfBalanc_Titulos.First;
//
//   DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//
//   while not DMBlnc.QInfBalanc_Titulos.EOF do begin
//      if (DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat +
//         DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat) <> 0 then begin
//         DMBlnc.QInfBalanc_Cuentas.First;
//         Titulo := DMBlnc.QInfBalanc_TitulosTITULO.AsString;
//         if not DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', Titulo, []) then begin
//            DMBlnc.QInfBalanc_Cuentas.Append;
//            DMBlnc.QInfBalanc_Cuentas.Edit;
//            RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
//            for J := 0 to DMBlnc.QInfBalanc_Titulos.FieldCount - 1 do begin
//               Campo := DMBlnc.QInfBalanc_Titulos.Fields[J].FieldName;
//               DMBlnc.QInfBalanc_Cuentas.FieldByName(Campo).Value :=
//                  DMBlnc.QInfBalanc_Titulos.FieldByName(Campo).Value;
//            end;
//
//            Letra := Copy(DMBlnc.QInfBalanc_CuentasTITULO.AsString, 1, 1);
//            if (Letra = 'P') or (Letra = 'H') then begin
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat;
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat :=
//                  (-1) * DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat;
//            end;
//
//            if (Letra = 'D') or (Letra = 'H') then begin
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat :=
//                  Abs(DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat);
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat :=
//                  Abs(DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat);
//            end;
//
//            DMBlnc.QInfBalanc_Cuentas.Post;
//         end;
//      end;
//      DMBlnc.QInfBalanc_Titulos.Next;
//   end;
//end;
//
//
//{+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-}
//
//procedure LanzarInfBalanceSituacion(prmTipoInforme             :Integer;
//                                    prmFechaInicial            :TDateTime;
//                                    prmFechaFinal              :TDateTime;
//                                    prmFechaImpresion          :TDateTime;
//                                    prmSaldosEjercicioAnterior :Boolean;
//                                    prmMonedaImpresion         :string;
//                                    prmTipoConcepto            :string;
//                                    prmCuentaAnalitica         :string;
//                                    prmDelegacion              :string;
//                                    prmDepartamento            :string;
//                                    prmSeccion                 :string;
//                                    prmProyecto                :string;
//                                    prmEmpresas                :TStrings;
//                                    prmEmpresaAnterior         :Integer);
//
//var
//   // quita la espera Caratula             :TEspere;
//   QCuentas             :TIBQuery;
//   QTitulos             :TIBQuery;
//   QGrupos              :TIBQuery;
//   QDiario              :TIBQuery;
//   QDiarioConsolida     :TIBQuery;
//   QConsolida           :TIBQuery;
//   QSaldoAnteriorCuenta :TIBQuery;
//   
//   nIndice              :Integer;
//   MesInicio            :Integer;
//   MesFinal             :Integer;
//   IndCons              :Integer;
//   j                    :Integer;
//   aFormula             :array [0..8] of string;
//   aSaldo               :array [0..8] of Double;
//   Cuenta               :string;
//   DebeHaber            :string;
//   Grupo1               :string;
//   Grupo2               :string;
//   Grupo                :string;
//   Letra1               :string;
//   Letra2               :string;
//   Letra                :string;
//   Titulo               :string;
//   TipoPagina           :string;
//   nImporteAnt          :Double;
//   nImporte             :Double;
//   nImporteCons         :Double;
//   nTotDb               :Double;
//   nTotHb               :Double;
//   nTot129              :Double;
//   nTotDbEjAnt          :Double;
//   nTotHbEjAnt          :Double;
//   nTotAnt129           :Double;
//   nTotDbAnt129         :Double;
//   nTotHbAnt129         :Double;
//   nSaldoAux            :Double;
//   aMeses               :array[1..12] of Double;
//   Campo                :string;
//   TextoFormula         :string;
//   IncluirEnInforme     :Boolean;
//   lBorraAnterior       :Boolean;
//   FechaInicialAnterior :TDateTime;
//   FechaFinalAnterior   :TDateTime;
//   nEjercicio           :Word;
//   nMes                 :Word;
//   nDia                 :Word;
//   ListaQuery           :TStringList;
//begin
//   //Screen.cursor:= crHourGlass;
//   // quita la espera Caratula := TEspere.Create(nil);
//   // quita la espera Caratula.Mensaje      := 'Generando informe ...';
//   // quita la espera Caratula.Ancho        := 300;
//   // quita la espera Caratula.Alto         := 150;
//   // quita la espera Caratula.Avi_Left     := 20;
//   // quita la espera Caratula.Avi_Top      := 80;
//   // quita la espera Caratula.Fuente.Color := clWhite;
//   // quita la espera Caratula.Fuente.Name  := 'Arial';
//   // quita la espera Caratula.Fuente.Size  := 14;
//   // quita la espera Caratula.Mensaje_Left := 14;
//   // quita la espera Caratula.Mensaje_Top  := 14;
//   // quita la espera Caratula.Avi_Color    := $00A56D39;
//   // quita la espera Caratula.ColorFondo   := $00A56D39;
//   // quita la espera Caratula.Imagenes.Cancelar_Arriba := gvDirImagenes + gcBtn;
//   // quita la espera Caratula.Imagenes.Cancelar_Abajo := gvDirImagenes + gcBtnBlanco;
//   // quita la espera Caratula.MostrarMarco := True;
//   // quita la espera Caratula.Avi_Predet   := Ninguno;
//   // quita la espera Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
//   // quita la espera Caratula.Mostrar;
//
//   gvProcesoAbortado := False;
//
//   DMBlnc.QInfBalanc_Titulos.Open;
//   DMBlnc.QInfBalanc_Grupos.Open;
//   DMBlnc.QInfBalanc_Cuentas.Open;
//
//   { Vacia las tablas }
//   DMBlnc.QInfBalanc_Titulos.EmptyTable;
//   DMBlnc.QInfBalanc_Grupos.EmptyTable;
//   DMBlnc.QInfBalanc_Cuentas.EmptyTable;
//
//   { Establece índices }
//   //DMBlnc.QInfBalanc_Titulos.IndexName := '';
//   //DMBlnc.QInfBalanc_Grupos.IndexName  := '';
//   //DMBlnc.QInfBalanc_Cuentas.IndexName := '';
//
//   { Inicialización de variables }
//   for j := 0 to 8 do begin
//      aFormula[j] := '';
//      aSaldo[j]   := 0;
//   end;
//
//   MesInicio := Month(prmFechaInicial);
//   MesFinal  := Month(prmFechaFinal  );
//
//   { Consolida empresas }
//   QConsolida := DMRef.CreateQueryConsolida(['']);
//   
//   { Selección de títulos }
//   QTitulos := DMRef.CreateQuery(['SELECT * FROM TITULOS ORDER BY TITULO']);
//   QTitulos.Prepare;
//   QTitulos.Open;
//
//   { Selección de grupos }
//   QGrupos := DMRef.CreateQuery(['SELECT * FROM GRUPOS ORDER BY GRUPO']);
//   QGrupos.Prepare;
//   QGrupos.Open;
//
//   { Selección de cuentas }
//   QCuentas := DMRef.CreateQuery(['SELECT * FROM CUENTAS ORDER BY CUENTA']);
//   QCuentas.Prepare;
//   QCuentas.Open;
//
//   if prmEmpresaAnterior <> 0 then begin
//      { Inicializacion de Fechas Filtro }
//      DecodeDate(prmFechaInicial, nEjercicio, nMes, nDia);
//      FechaInicialAnterior := EncodeDate(nEjercicio - 1, nMes, nDia);
//      DecodeDate(prmFechaFinal, nEjercicio, nMes, nDia);
//      FechaFinalAnterior := EncodeDate(nEjercicio - 1, nMes, nDia);
//
//      { Conexion de empresa año anterior }
//      DMRef.ConectarBDEmpresaAnterior(prmEmpresaAnterior);
//
//      { Prepara query para obtencion de importes }
//      QSaldoAnteriorCuenta := DMRef.CreateQueryEjAnterior(
//          ['SELECT D.IMPORTE         ,                       ',
//           '       D.CUENTA_ANALITICA,                       ',
//           '       D.DEBEHABER                               ',
//           'FROM DIARIO    D,                                ',
//           '     CONCEPTOS T                                 ',
//           'WHERE D.FECHA                  >= :FECHAINICIAL  ',
//           'AND   D.FECHA                  <= :FECHAFINAL    ',
//           'AND   D.ID_CONCEPTOS            = T.ID_CONCEPTOS ', {no deben aparecer los apuntes con conceptos de cierre Y sólo }
//           'AND   T.TIPOCONCEPTO           <> "C"            ', {los conceptos de tipo de contabilidad/clase normales         }
//           'AND   T.TIPOCONTABILIDAD        = "N"            ',
//           'AND   SUBSTR(D.SUBCUENTA, 1, 3) = :CUENTA        ']);
//   end; 
//
//   try
//      { Carga de CUENTAS }
//      while not QCuentas.EOF do begin
//         Grupo1 := QCuentas.FieldByName('GRUPO1').AsString;
//         Grupo2 := QCuentas.FieldByName('GRUPO2').AsString;
//         Letra1 := Copy(Grupo1, 1, 1);
//         Letra2 := Copy(Grupo2, 1, 1);
//
//         if (prmTipoInforme = INF_BALANCE_SITUACION) and ((Empty(Grupo1) and Empty(Grupo2)) or
//            (Empty(Grupo1) and ((Letra2 = 'D') or (Letra2 = 'H'))) or
//            (Empty(Grupo2) and ((Letra1 = 'D') or (Letra1 = 'H'))) or
//            (((Letra1 = 'D') or (Letra1 = 'H')) and ((Letra2 = 'D') or (Letra2 = 'H')))) then
//         begin
//            QCuentas.Next;
//            Continue;
//         end;
//
//         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) and
//            ((Empty(Grupo1) and Empty(Grupo2)) or (Empty(Grupo1) and
//            ((Letra2 = 'A') or (Letra2 = 'P'))) or (Empty(Grupo2) and ((Letra1 = 'A') or (Letra1 = 'P'))) or
//            (((Letra1 = 'A') or (Letra1 = 'P')) and ((Letra2 = 'A') or (Letra2 = 'P')))) then
//         begin
//            QCuentas.Next;
//            Continue;
//         end;
//
//         { Calcula saldo ejercicio anterior }
//         nImporteAnt := 0;
//         if prmSaldosEjercicioAnterior then begin
//            aMeses[1]  := QCuentas.FieldByName('ANTDB01').AsFloat - QCuentas.FieldByName('ANTHB01').AsFloat;
//            aMeses[2]  := QCuentas.FieldByName('ANTDB02').AsFloat - QCuentas.FieldByName('ANTHB02').AsFloat;
//            aMeses[3]  := QCuentas.FieldByName('ANTDB03').AsFloat - QCuentas.FieldByName('ANTHB03').AsFloat;
//            aMeses[4]  := QCuentas.FieldByName('ANTDB04').AsFloat - QCuentas.FieldByName('ANTHB04').AsFloat;
//            aMeses[5]  := QCuentas.FieldByName('ANTDB05').AsFloat - QCuentas.FieldByName('ANTHB05').AsFloat;
//            aMeses[6]  := QCuentas.FieldByName('ANTDB06').AsFloat - QCuentas.FieldByName('ANTHB06').AsFloat;
//            aMeses[7]  := QCuentas.FieldByName('ANTDB07').AsFloat - QCuentas.FieldByName('ANTHB07').AsFloat;
//            aMeses[8]  := QCuentas.FieldByName('ANTDB08').AsFloat - QCuentas.FieldByName('ANTHB08').AsFloat;
//            aMeses[9]  := QCuentas.FieldByName('ANTDB09').AsFloat - QCuentas.FieldByName('ANTHB09').AsFloat;
//            aMeses[10] := QCuentas.FieldByName('ANTDB10').AsFloat - QCuentas.FieldByName('ANTHB10').AsFloat;
//            aMeses[11] := QCuentas.FieldByName('ANTDB11').AsFloat - QCuentas.FieldByName('ANTHB11').AsFloat;
//            aMeses[12] := QCuentas.FieldByName('ANTDB12').AsFloat - QCuentas.FieldByName('ANTHB12').AsFloat;
//
//            for j := MesInicio to MesFinal do begin
//               nImporteAnt := nImporteAnt + aMeses[j];
//            end;
//            nImporteAnt := ConversionImporte(nImporteAnt,
//                                             DMRef.QParametros.FieldByName('MONEDA').AsString,
//                                             prmMonedaImpresion);
//
//            { Empresas consolidadas }
//            for IndCons := 0 to prmEmpresas.Count - 1 do begin
//               DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);
//               QConsolida.Close;
//               QConsolida.Database    := DMRef.IBDConsolida;
//               QConsolida.Transaction := DmRef.IBDConsolida.DefaultTransaction;
//               QConsolida.SQL.Clear;
//               QConsolida.SQL.Add('SELECT * FROM CUENTAS WHERE CUENTA = :CUENTA');
//               QConsolida.ParamByName('CUENTA').AsString := QCuentas.FieldByName('CUENTA').AsString;
//               if not QConsolida.EOF then begin
//                  nImporteCons := 0;
//                  aMeses[1]    := QConsolida.FieldByName('ANTDB01').AsFloat -
//                     QConsolida.FieldByName('ANTHB01').AsFloat;
//                  aMeses[2]    := QConsolida.FieldByName('ANTDB02').AsFloat -
//                     QConsolida.FieldByName('ANTHB02').AsFloat;
//                  aMeses[3]    := QConsolida.FieldByName('ANTDB03').AsFloat -
//                     QConsolida.FieldByName('ANTHB03').AsFloat;
//                  aMeses[4]    := QConsolida.FieldByName('ANTDB04').AsFloat -
//                     QConsolida.FieldByName('ANTHB04').AsFloat;
//                  aMeses[5]    := QConsolida.FieldByName('ANTDB05').AsFloat -
//                     QConsolida.FieldByName('ANTHB05').AsFloat;
//                  aMeses[6]    := QConsolida.FieldByName('ANTDB06').AsFloat -
//                     QConsolida.FieldByName('ANTHB06').AsFloat;
//                  aMeses[7]    := QConsolida.FieldByName('ANTDB07').AsFloat -
//                     QConsolida.FieldByName('ANTHB07').AsFloat;
//                  aMeses[8]    := QConsolida.FieldByName('ANTDB08').AsFloat -
//                     QConsolida.FieldByName('ANTHB08').AsFloat;
//                  aMeses[9]    := QConsolida.FieldByName('ANTDB09').AsFloat -
//                     QConsolida.FieldByName('ANTHB09').AsFloat;
//                  aMeses[10]   := QConsolida.FieldByName('ANTDB10').AsFloat -
//                     QConsolida.FieldByName('ANTHB10').AsFloat;
//                  aMeses[11]   := QConsolida.FieldByName('ANTDB11').AsFloat -
//                     QConsolida.FieldByName('ANTHB11').AsFloat;
//                  aMeses[12]   := QConsolida.FieldByName('ANTDB12').AsFloat -
//                     QConsolida.FieldByName('ANTHB12').AsFloat;
//                  for j := MesInicio to MesFinal do begin
//                     nImporteCons := nImporteCons + aMeses[j];
//                  end;
//                  nImporteCons :=
//                     ConversionImporte(nImporteCons,
//                                       DMRef.QParametros.FieldByName('MONEDA').AsString,
//                                       prmMonedaImpresion);
//                  nImporteAnt  := nImporteAnt + nImporteCons;
//               end;
//            end;
//         end else
//         if prmEmpresaAnterior <> 0 then begin
//            { No se puede consolidar de esta forma con años anteriores }
//            QSaldoAnteriorCuenta.Close;
//            QSaldoAnteriorCuenta.ParamByName('FechaInicial').AsDateTime := FechaInicialAnterior;
//            QSaldoAnteriorCuenta.ParamByName('FechaFinal'  ).AsDateTime := FechaFinalAnterior;
//            QSaldoAnteriorCuenta.ParamByName('Cuenta'      ).AsString   := QCuentas.FieldByName('Cuenta').AsString;
//            QSaldoAnteriorCuenta.Open;
//            nTotDbEjAnt := 0;
//            nTotHbEjAnt := 0;
//            while not QSaldoAnteriorCuenta.EOF do begin
//               if not DMContaRef.Pertenece_Analitica(QSaldoAnteriorCuenta.FieldByName('CUENTA_ANALITICA').AsString,
//                                                     prmCuentaAnalitica,
//                                                     '',
//                                                     prmDelegacion,
//                                                     prmDepartamento,
//                                                     prmSeccion,
//                                                     prmProyecto,
//                                                     DMRef.BDEjAnterior) then begin
//                  QSaldoAnteriorCuenta.Next;
//                  Continue;
//               end;
//               if QSaldoAnteriorCuenta.FieldByName('DebeHaber').AsString = 'D' then begin
//                  nTotDbEjAnt := nTotDbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
//               end
//               else begin
//                  nTotHbEjAnt := nTotHbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
//               end;
//               QSaldoAnteriorCuenta.Next;
//            end;
//            nImporteAnt := nTotDbEjAnt - nTotHbEjAnt;
//            nImporteAnt := ConversionImporte(nImporteAnt,
//                                             DMRef.QParametros.FieldByName('MONEDA').AsString,
//                                             prmMonedaImpresion);
//         end;
//
//         if not Empty(Grupo1) then begin
//            DMBlnc.QInfBalanc_Cuentas.Append;
//            DMBlnc.QInfBalanc_Cuentas.Edit;
//
//            { Título, Grupo y descripción de cuenta }
//            DMBlnc.QInfBalanc_CuentasCUENTA.AsString            := QCuentas.FieldByName('CUENTA').AsString;
//            DMBlnc.QInfBalanc_CuentasDESCRIPCIONCUENTA.AsString := QCuentas.FieldByName('DESCRIPCION').AsString;
//            DMBlnc.QInfBalanc_CuentasGRUPO.AsString             := Grupo1;
//            DMBlnc.QInfBalanc_CuentasTITULO.AsString            := Copy(Grupo1, 1, 2);
//
//            { Saldo del ejercicio anterior }
//            DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat := nImporteAnt;
//
//            DMBlnc.QInfBalanc_Cuentas.Post;
//         end;      
//
//         if not Empty(Grupo2) then begin
//            DMBlnc.QInfBalanc_Cuentas.Append;
//            DMBlnc.QInfBalanc_Cuentas.Edit;
//
//            { Título, Grupo y descripción de cuenta }
//            DMBlnc.QInfBalanc_CuentasCUENTA.AsString             := QCuentas.FieldByName('CUENTA').AsString;
//            DMBlnc.QInfBalanc_CuentasDESCRIPCIONCUENTA.AsString  := QCuentas.FieldByName('DESCRIPCION').AsString;
//            DMBlnc.QInfBalanc_CuentasGRUPO.AsString              := Grupo2;
//            DMBlnc.QInfBalanc_CuentasTITULO.AsString             := Copy(Grupo2, 1, 2);
//            { Saldo del ejercicio anterior }
//            DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat := nImporteAnt;
//            DMBlnc.QInfBalanc_Cuentas.Post;
//         end;      
//         QCuentas.Next;
//      end;
//      
//      { Carga de TITULOS }
//      while not QTitulos.EOF do begin
//         Titulo := QTitulos.FieldByName('TITULO').AsString;
//         Letra  := Copy(Titulo, 1, 1);
//
//         if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
//            if ((Letra = 'D') or (Letra = 'H')) then begin
//               QTitulos.Next;
//               Continue;
//            end
//            else begin
//               if (Letra = 'A') then begin
//                  TipoPagina := 'ACTIVO';
//               end else
//               if (Letra = 'P') then begin
//                  TipoPagina := 'PASIVO';
//               end;
//            end;
//         end;
//
//         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) then begin
//            if ((Letra = 'A') or (Letra = 'P')) then begin
//               QTitulos.Next;
//               Continue;
//            end
//            else begin
//               if (Letra = 'D') then begin
//                  TipoPagina := 'DEBE';
//               end else
//               if (Letra = 'H') then begin
//                  TipoPagina := 'HABER';
//               end;
//            end;
//         end;
//
//         DMBlnc.QInfBalanc_Titulos.Append;
//         DMBlnc.QInfBalanc_TitulosTIPOPAGINA.AsString        := TipoPagina;
//         DMBlnc.QInfBalanc_TitulosTITULO.AsString            := QTitulos.FieldByName('TITULO').AsString;
//         DMBlnc.QInfBalanc_TitulosTITULOREVES.AsString       := Copy(QTitulos.FieldByName('TITULO').AsString, 2, 1) + Letra;
//         DMBlnc.QInfBalanc_TitulosDESCRIPCIONTITULO.AsString := QTitulos.FieldByName('DESCRIPCION').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA1.AsString             := QTitulos.FieldByName('SUMA1').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA2.AsString             := QTitulos.FieldByName('SUMA2').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA3.AsString             := QTitulos.FieldByName('SUMA3').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA4.AsString             := QTitulos.FieldByName('SUMA4').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA5.AsString             := QTitulos.FieldByName('SUMA5').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA6.AsString             := QTitulos.FieldByName('SUMA6').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA7.AsString             := QTitulos.FieldByName('SUMA7').AsString;
//         DMBlnc.QInfBalanc_TitulosSUMA8.AsString             := QTitulos.FieldByName('SUMA8').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA1.AsString            := QTitulos.FieldByName('RESTA1').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA2.AsString            := QTitulos.FieldByName('RESTA2').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA3.AsString            := QTitulos.FieldByName('RESTA3').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA4.AsString            := QTitulos.FieldByName('RESTA4').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA5.AsString            := QTitulos.FieldByName('RESTA5').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA6.AsString            := QTitulos.FieldByName('RESTA6').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA7.AsString            := QTitulos.FieldByName('RESTA7').AsString;
//         DMBlnc.QInfBalanc_TitulosRESTA8.AsString            := QTitulos.FieldByName('RESTA8').AsString;
//
//         TextoFormula := '';
//         if not Empty(QTitulos.FieldByName('SUMA1' ).AsString) then TextoFormula := QTitulos.FieldByName('SUMA1').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA2' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA2').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA3' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA3').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA4' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA4').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA5' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA5').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA6' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA6').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA7' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA7').AsString;
//         if not Empty(QTitulos.FieldByName('SUMA8' ).AsString) then TextoFormula := TextoFormula + '+' + QTitulos.FieldByName('SUMA8').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA1').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA1').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA2').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA2').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA3').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA3').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA4').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA4').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA5').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA5').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA6').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA6').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA7').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA7').AsString;
//         if not Empty(QTitulos.FieldByName('RESTA8').AsString) then TextoFormula := TextoFormula + '-' + QTitulos.FieldByName('RESTA8').AsString;
//
//         DMBlnc.QInfBalanc_TitulosFORMULA.AsString := TextoFormula;
//         DMBlnc.QInfBalanc_Titulos.Post;
//
//         QTitulos.Next;
//      end;
//
//      { Carga GRUPOS }
//      while not QGrupos.EOF do begin
//         Grupo := QGrupos.FieldByName('GRUPO').AsString;
//         Letra := Copy(Grupo, 1, 1);
//
//         if (prmTipoInforme = INF_BALANCE_SITUACION) and ((Letra = 'D') or (Letra = 'H')) then begin
//            QGrupos.Next;
//            Continue;
//         end;
//
//         if (prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS) and ((Letra = 'A') or (Letra = 'P'))
//         then begin
//            QGrupos.Next;
//            Continue;
//         end;
//
//         DMBlnc.QInfBalanc_Grupos.Append;
//         DMBlnc.QInfBalanc_Grupos.Edit;
//         DMBlnc.QInfBalanc_GruposGRUPO.AsString            :=      QGrupos.FieldByName('GRUPO'      ).AsString;
//         DMBlnc.QInfBalanc_GruposDESCRIPCIONGRUPO.AsString :=      QGrupos.FieldByName('DESCRIPCION').AsString;
//         DMBlnc.QInfBalanc_GruposTITULO.AsString           := Copy(QGrupos.FieldByName('GRUPO'      ).AsString, 1, 2);
//         DMBlnc.QInfBalanc_Grupos.Post;
//         QGrupos.Next;
//      end;
//
//   { Carga de saldos anteriores por acumulados de cuentas
//      ya cargados antes, por meses o por seleccion de empresa año anterior }
//      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//         DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//         DMBlnc.QInfBalanc_Cuentas.First;
//         while not DMBlnc.QInfBalanc_Cuentas.EOF do begin
//            { Carga GRUPOS }
//            if DMBlnc.QInfBalanc_Grupos.Locate('GRUPO', DMBlnc.QInfBalanc_CuentasGRUPO.AsString, []) then begin
//               DMBlnc.QInfBalanc_Grupos.Edit;
//               DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat +
//                                                                         DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat;
//               DMBlnc.QInfBalanc_Grupos.Post;
//            end;
//            { Carga TITULOS }
//            if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', Copy(DMBlnc.QInfBalanc_CuentasGRUPO.AsString, 1, 2), []) then begin
//               DMBlnc.QInfBalanc_Titulos.Edit;
//               DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat := DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat +
//                                                                           DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat;
//               DMBlnc.QInfBalanc_Titulos.Post;
//            end;
//            DMBlnc.QInfBalanc_Cuentas.Next;
//         end;
//         DMBlnc.QInfBalanc_Cuentas.IndexName := '';
//      end;
//
//      { Carga de saldos actuales según fecha }
//      nTotDb := 0;
//      nTotHb := 0;
//
//      { Selecciona los apuntes de la empresa actual }
//      QDiario := TIBQuery.Create(nil);
//      QDiario.Close;
//      QDiario.SQL.Clear;
//      QDiario.Database    := DMRef.IBDSiamCont;
//      QDiario.Transaction := DMRef.IBDSiamCont.DefaultTransaction;
//      //QDiario.Add('SELECT CAST(SUM(D.IMPORTE) AS NUMERIC(15, 2)) SUMA, D.MONEDA, D.CUENTA_ANALITICA,');
//      QDiario.SQL.Add('SELECT D.IMPORTE, D.MONEDA, D.CUENTA_ANALITICA,');
//      if prmTipoConcepto <> 'T' then begin
//         QDiario.SQL.Add('T.TIPOCONTABILIDAD,');
//      end;
//      QDiario.SQL.Add(' D.DEBEHABER, c.CUENTA ');
//      QDiario.SQL.Add('FROM DIARIO D, CUENTAS C,CONCEPTOS T');
//      QDiario.SQL.Add('WHERE D.FECHA >= :FECHAINICIAL AND D.FECHA <= :FECHAFINAL');
//      {{ En la query no deben aparecer los apuntes con conceptos de cierre}
//      QDiario.SQL.Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"C" ');
//      QDiario.SQL.Add(' AND SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');
//
//      if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
//         // QDiario.SQL.Add(' AND (SUBSTR(C.GRUPO1,1,1)="A" OR SUBSTR(C.GRUPO2,1,1)="A" OR ');
//         // QDiario.SQL.Add(' SUBSTR(C.GRUPO1,1,1)="P" OR SUBSTR(C.GRUPO2,1,1)="P") ');
//      end
//      else begin
//         QDiario.SQL.Add(' AND (SUBSTR(C.GRUPO1,1,1)="D" OR SUBSTR(C.GRUPO2,1,1)="D" OR ');
//         QDiario.SQL.Add(' SUBSTR(C.GRUPO1,1,1)="H" OR SUBSTR(C.GRUPO2,1,1)="H") ');
//      end;
//      //QDiario.SQL.Add('GROUP BY C.CUENTA, D.DEBEHABER, D.CUENTA_ANALITICA, D.MONEDA');
//      QDiario.SQL.Add('order by d.fecha');
//
//      if prmTipoConcepto <> 'T' then begin
//         QDiario.SQL.Add(', T.TIPOCONTABILIDAD');
//      end;
//
//      QDiario.ParamByName('FECHAINICIAL').AsDateTime := prmFechaInicial;
//      QDiario.ParamByName('FECHAFINAL'  ).AsDateTime := prmFechaFinal;
//
//      QDiario.Prepare;
//      QDiario.Open;
//
//      DMBlnc.QInfBalanc_Cuentas.IndexName := '';
//      DMBlnc.QInfBalanc_Grupos.IndexName  := '';
//      DMBlnc.QInfBalanc_Titulos.IndexName := '';
//
//      while not QDiario.EOF do begin
//         if (prmTipoConcepto <> 'T') and (QDiario.FieldByName('TipoContabilidad').AsString <> prmTipoConcepto) then begin
//            QDiario.Next;
//            Continue;
//         end;
//         if not DMContaRef.Pertenece_Analitica(QDiario.FieldByName('CUENTA_ANALITICA').AsString,
//                                               prmCuentaAnalitica,
//                                               '',
//                                               prmDelegacion,
//                                               prmDepartamento,
//                                               prmSeccion,
//                                               prmProyecto,
//                                               DMRef.IBDSiamCont) then begin
//            QDiario.Next;
//            Continue;
//         end;
//
//         Cuenta    := QDiario.FieldByName('CUENTA').AsString;
//         DebeHaber := QDiario.FieldByName('DEBEHABER').AsString;
//         nImporte  := ConversionImporte(QDiario.FieldByName('IMPORTE').AsFloat,
//                                        QDiario.FieldByName('MONEDA').AsString,
//                                        prmMonedaImpresion);
//
//         IncluirEnInforme := True;
//         if (Cuenta >= '6') and (Cuenta < '8') then begin
//            if DebeHaber = 'D' then begin
//               nTotDb := nTotDb + nImporte;
//            end
//            else begin
//               nTotHb := nTotHb + nImporte;
//            end;
//            IncluirEnInforme := prmTipoInforme <> INF_BALANCE_SITUACION;
//         end;
//
//         if IncluirEnInforme then begin
//            { Carga CUENTAS }
//            if DMBlnc.QInfBalanc_Cuentas.Locate('CUENTA', QDiario.FieldByName('CUENTA').AsString, []) then begin
//               DMBlnc.QInfBalanc_Cuentas.Edit;
//               if DebeHaber = 'D' then begin
//                  DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat :=
//                     DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat + nImporte;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat :=
//                     DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat - nImporte;
//               end;
//               DMBlnc.QInfBalanc_Cuentas.Post;
//            end;
//            { Carga GRUPOS }
//            if DMBlnc.QInfBalanc_Grupos.Locate('GRUPO', DMBlnc.QInfBalanc_CuentasGRUPO.AsString, []) then begin
//               DMBlnc.QInfBalanc_Grupos.Edit;
//               if DebeHaber = 'D' then begin
//                  DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat + nImporte;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat - nImporte;
//               end;
//               DMBlnc.QInfBalanc_Grupos.Post;
//            end;
//
//            { Carga TITULOS }
//            if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', Copy(DMBlnc.QInfBalanc_GruposGRUPO.AsString, 1, 2), []) then begin
//               DMBlnc.QInfBalanc_Titulos.Edit;
//               if DebeHaber = 'D' then begin
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat + nImporte;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat - nImporte;
//               end;
//               DMBlnc.QInfBalanc_Titulos.Post;
//            end;
//         end;
//         QDiario.Next;
//      end;
//
//
//      ListaQuery := TStringList.Create;
//                                     ListaQuery.Add('SELECT D.IMPORTE         ,                  ');
//                                     ListaQuery.Add('       D.MONEDA          ,                  ');
//                                     ListaQuery.Add('       D.CUENTA_ANALITICA,                  ');
//      if prmTipoConcepto <> 'T' then ListaQuery.Add('       T.TIPOCONTABILIDAD,                  ');
//                                     ListaQuery.Add('       D.DEBEHABER       ,                  ');
//                                     ListaQuery.Add('       C.CUENTA                             ');
//                                     ListaQuery.Add('FROM   DIARIO    D,                         ');
//                                     ListaQuery.Add('       CUENTAS   C,                         ');
//                                     ListaQuery.Add('       CONCEPTOS T                          ');
//                                     ListaQuery.Add('WHERE  D.FECHA >= :FECHAINICIAL             ');
//                                     ListaQuery.Add('AND    D.FECHA <= :FECHAFINAL               ');
//                                     ListaQuery.Add('AND    D.ID_CONCEPTOS = T.ID_CONCEPTOS      '); { No deben aparecer los apuntes }
//                                     ListaQuery.Add('AND    T.TIPOCONCEPTO <> "C"                '); {      con conceptos de cierre  }
//                                     ListaQuery.Add('AND    SUBSTR(D.SUBCUENTA, 1, 3) = C.CUENTA ');
//      if (prmTipoInforme = INF_BALANCE_SITUACION) then begin
//         // Add(' AND (SUBSTR(C.GRUPO1,1,1)="A" OR SUBSTR(C.GRUPO2,1,1)="A" OR ');
//         // Add(' SUBSTR(C.GRUPO1,1,1)="P" OR SUBSTR(C.GRUPO2,1,1)="P") ');
//      end
//      else begin
//         ListaQuery.Add('AND (   SUBSTR(C.GRUPO1, 1, 1) = "D" ');
//         ListaQuery.Add('     OR SUBSTR(C.GRUPO2, 1, 1) = "D" ');
//         ListaQuery.Add('     OR SUBSTR(C.GRUPO1, 1, 1) = "H" ');
//         ListaQuery.Add('     OR SUBSTR(C.GRUPO2, 1, 1) = "H" ');
//         ListaQuery.Add('    )                                ');
//      end;
//      ListaQuery.Add('ORDER BY D.FECHA ');
//
//      if prmTipoConcepto <> 'T' then begin
//         ListaQuery.Add(', T.TIPOCONTABILIDAD');
//      end;
//      QDiarioConsolida := DMRef.CreateQueryConsolida([ListaQuery.Text]);
//
//      { Empresas consolidadas }
//      for IndCons := 0 to prmEmpresas.Count - 1 do begin
//         DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);
//
//
//         QDiarioConsolida.ParamByName('FECHAINICIAL').AsDateTime := prmFechaInicial;
//         QDiarioConsolida.ParamByName('FECHAFINAL'  ).AsDateTime := prmFechaFinal;
//
//         QDiarioConsolida.Prepare;
//         QDiarioConsolida.Open;
//
//         DMBlnc.QInfBalanc_Cuentas.IndexName := '';
//         DMBlnc.QInfBalanc_Grupos.IndexName  := '';
//         DMBlnc.QInfBalanc_Titulos.IndexName := '';
//
//         while not QDiarioConsolida.EOF do begin
//            if (prmTipoConcepto <> 'T') and (QDiarioConsolida.FieldByName('TIPOCONTABILIDAD').AsString <> prmTipoConcepto) then begin
//               QDiarioConsolida.Next;
//               Continue;
//            end;
//            if not DMContaRef.Pertenece_Analitica(QDiarioConsolida.FieldByName('CUENTA_ANALITICA').AsString,
//                                                  prmCuentaAnalitica,
//                                                  '',
//                                                  prmDelegacion,
//                                                  prmDepartamento,
//                                                  prmSeccion,
//                                                  prmProyecto,
//                                                  DMRef.IBDConsolida) then begin
//               QDiarioConsolida.Next;
//               Continue;
//            end;
//
//            Cuenta    := QDiarioConsolida.FieldByName('CUENTA').AsString;
//            DebeHaber := QDiarioConsolida.FieldByName('DEBEHABER').AsString;
//            nImporte  := ConversionImporte(QDiarioConsolida.FieldByName('IMPORTE').AsFloat,
//                                           QDiarioConsolida.FieldByName('MONEDA' ).AsString,
//                                           prmMonedaImpresion);
//
//            IncluirEnInforme := True;
//            if (Cuenta >= '6') and (Cuenta < '8') then begin
//               if DebeHaber = 'D' then nTotDb := nTotDb + nImporte
//                                  else nTotHb := nTotHb + nImporte;
//               IncluirEnInforme := prmTipoInforme <> INF_BALANCE_SITUACION;
//            end;
//
//            if IncluirEnInforme then begin
//               { Carga CUENTAS }
//               if DMBlnc.QInfBalanc_Cuentas.Locate('CUENTA', QDiarioConsolida.FieldByName('CUENTA').AsString, []) then begin
//                  DMBlnc.QInfBalanc_Cuentas.Edit;
//                  if DebeHaber = 'D' then begin
//                     DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat := DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat + nImporte;
//                  end
//                  else begin
//                     DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat := DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat - nImporte;
//                  end;
//                  DMBlnc.QInfBalanc_Cuentas.Post;
//               end;
//
//               { Carga GRUPOS }
//               if DMBlnc.QInfBalanc_Grupos.Locate('GRUPO', DMBlnc.QInfBalanc_CuentasGRUPO.AsString, []) then begin
//                  DMBlnc.QInfBalanc_Grupos.Edit;
//                  if DebeHaber = 'D' then begin
//                     DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat + nImporte;
//                  end
//                  else begin
//                     DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat - nImporte;
//                  end;
//                  DMBlnc.QInfBalanc_Grupos.Post;
//               end;
//
//               { Carga TITULOS }
//               if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', Copy(DMBlnc.QInfBalanc_GruposGRUPO.AsString, 1, 2), []) then begin 
//                  DMBlnc.QInfBalanc_Titulos.Edit;
//                  if DebeHaber = 'D' then begin
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                        DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat + nImporte;
//                  end
//                  else begin
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                        DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat - nImporte;
//                  end;
//                  DMBlnc.QInfBalanc_Titulos.Post;
//               end;
//            end;
//            QDiarioConsolida.Next;
//         end;
//      end;
//
//      { CÁLCULO DE PÉRDIDAS Y GANANCIAS PARA BALANCE DE SITUACIÓN }
//      if prmTipoInforme = INF_BALANCE_SITUACION then begin
//         nTot129 := nTotDb - nTotHb;
//         if RoundToDecimal(nTot129, 3, True) <> 0 then begin
//            if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//               { Suma todas las 6 y resta todas las 7 }
//               QCuentas.Close;
//               QCuentas.Open;
//               while not QCuentas.EOF and (QCuentas.FieldByName('CUENTA').AsString <> '600') do begin
//                  QCuentas.Next;
//               end;
//               nTotAnt129   := 0;
//               nTotDbAnt129 := 0;
//               nTotHbAnt129 := 0;
//
//               { Saldo empresa actual }
//               while not QCuentas.EOF do begin
//                  nImporteAnt := 0;
//                  if prmEmpresaAnterior <> 0 then begin
//                     QSaldoAnteriorCuenta.Close;
//                     QSaldoAnteriorCuenta.ParamByName('FechaInicial').AsDateTime := FechaInicialAnterior;
//                     QSaldoAnteriorCuenta.ParamByName('FechaFinal'  ).AsDateTime := FechaFinalAnterior;
//                     QSaldoAnteriorCuenta.ParamByName('Cuenta'      ).AsString   := QCuentas.FieldByName('CUENTA').AsString;
//                     QSaldoAnteriorCuenta.Open;
//                     nTotDbEjAnt := 0;
//                     nTotHbEjAnt := 0;
//                     while not QSaldoAnteriorCuenta.EOF do begin
//                        if not DMContaRef.Pertenece_Analitica(QSaldoAnteriorCuenta.FieldByName('CUENTA_ANALITICA').AsString,
//                                                              prmCuentaAnalitica,
//                                                              '',
//                                                              prmDelegacion,
//                                                              prmDepartamento,
//                                                              prmSeccion,
//                                                              prmProyecto,
//                                                              DMRef.BDEjAnterior) then begin
//                           QSaldoAnteriorCuenta.Next;
//                           Continue;
//                        end;
//                        if QSaldoAnteriorCuenta.FieldByName('DebeHaber').AsString = 'D' then begin
//                           nTotDbEjAnt := nTotDbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
//                        end
//                        else begin
//                           nTotHbEjAnt := nTotHbEjAnt + QSaldoAnteriorCuenta.FieldByName('Importe').AsFloat;
//                        end;
//                        QSaldoAnteriorCuenta.Next;
//                     end;
//                     nImporteAnt := nTotDbEjAnt - nTotHbEjAnt;
//                  end
//                  else begin
//                     { Calcular saldo ejercicio anterior }
//                     aMeses[1]  := QCuentas.FieldByName('ANTDB01').AsFloat - QCuentas.FieldByName('ANTHB01').AsFloat;
//                     aMeses[2]  := QCuentas.FieldByName('ANTDB02').AsFloat - QCuentas.FieldByName('ANTHB02').AsFloat;
//                     aMeses[3]  := QCuentas.FieldByName('ANTDB03').AsFloat - QCuentas.FieldByName('ANTHB03').AsFloat;
//                     aMeses[4]  := QCuentas.FieldByName('ANTDB04').AsFloat - QCuentas.FieldByName('ANTHB04').AsFloat;
//                     aMeses[5]  := QCuentas.FieldByName('ANTDB05').AsFloat - QCuentas.FieldByName('ANTHB05').AsFloat;
//                     aMeses[6]  := QCuentas.FieldByName('ANTDB06').AsFloat - QCuentas.FieldByName('ANTHB06').AsFloat;
//                     aMeses[7]  := QCuentas.FieldByName('ANTDB07').AsFloat - QCuentas.FieldByName('ANTHB07').AsFloat;
//                     aMeses[8]  := QCuentas.FieldByName('ANTDB08').AsFloat - QCuentas.FieldByName('ANTHB08').AsFloat;
//                     aMeses[9]  := QCuentas.FieldByName('ANTDB09').AsFloat - QCuentas.FieldByName('ANTHB09').AsFloat;
//                     aMeses[10] := QCuentas.FieldByName('ANTDB10').AsFloat - QCuentas.FieldByName('ANTHB10').AsFloat;
//                     aMeses[11] := QCuentas.FieldByName('ANTDB11').AsFloat - QCuentas.FieldByName('ANTHB11').AsFloat;
//                     aMeses[12] := QCuentas.FieldByName('ANTDB12').AsFloat - QCuentas.FieldByName('ANTHB12').AsFloat;
//                     for j := MesInicio to MesFinal do begin
//                        nImporteAnt := nImporteAnt + aMeses[j];
//                     end;
//                  end;
//
//                  nImporteAnt := ConversionImporte(nImporteAnt,
//                                                   DMRef.QParametros.FieldByName('MONEDA').AsString,
//                                                   prmMonedaImpresion);
//                  if (QCuentas.FieldByName('CUENTA').AsString < '700') and
//                     (QCuentas.FieldByName('CUENTA').AsString > '599') then begin
//                     nTotDbAnt129 := nTotDbAnt129 + nImporteAnt;
//                  end;
//                  if (QCuentas.FieldByName('CUENTA').AsString < '800') and
//                     (QCuentas.FieldByName('CUENTA').AsString > '699') then begin
//                     nTotHbAnt129 := nTotHbAnt129 + nImporteAnt;
//                  end;
//
//                  { Empresas consolidadas }
//                  for IndCons := 0 to prmEmpresas.Count - 1 do begin
//                     DMRef.ConectarBDEmpresa(prmEmpresas.Strings[IndCons]);
//                     QConsolida.Close;
//                     QConsolida.Database    := DmRef.IBDConsolida;
//                     QConsolida.Transaction := DmRef.IBDConsolida.DefaultTransaction;
//                     QConsolida.SQL.Clear;
//                     QConsolida.SQL.Add('SELECT * FROM CUENTAS WHERE CUENTA = :CUENTA');
//                     QConsolida.ParamByName('CUENTA').AsString := QCuentas.FieldByName('CUENTA').AsString;
//                     if not QConsolida.EOF then begin
//                        { Calcular saldo ejercicio anterior }
//                        aMeses[1]  := QConsolida.FieldByName('ANTDB01').AsFloat -
//                           QConsolida.FieldByName('ANTHB01').AsFloat;
//                        aMeses[2]  := QConsolida.FieldByName('ANTDB02').AsFloat -
//                           QConsolida.FieldByName('ANTHB02').AsFloat;
//                        aMeses[3]  := QConsolida.FieldByName('ANTDB03').AsFloat -
//                           QConsolida.FieldByName('ANTHB03').AsFloat;
//                        aMeses[4]  := QConsolida.FieldByName('ANTDB04').AsFloat -
//                           QConsolida.FieldByName('ANTHB04').AsFloat;
//                        aMeses[5]  := QConsolida.FieldByName('ANTDB05').AsFloat -
//                           QConsolida.FieldByName('ANTHB05').AsFloat;
//                        aMeses[6]  := QConsolida.FieldByName('ANTDB06').AsFloat -
//                           QConsolida.FieldByName('ANTHB06').AsFloat;
//                        aMeses[7]  := QConsolida.FieldByName('ANTDB07').AsFloat -
//                           QConsolida.FieldByName('ANTHB07').AsFloat;
//                        aMeses[8]  := QConsolida.FieldByName('ANTDB08').AsFloat -
//                           QConsolida.FieldByName('ANTHB08').AsFloat;
//                        aMeses[9]  := QConsolida.FieldByName('ANTDB09').AsFloat -
//                           QConsolida.FieldByName('ANTHB09').AsFloat;
//                        aMeses[10] := QConsolida.FieldByName('ANTDB10').AsFloat -
//                           QConsolida.FieldByName('ANTHB10').AsFloat;
//                        aMeses[11] := QConsolida.FieldByName('ANTDB11').AsFloat -
//                           QConsolida.FieldByName('ANTHB11').AsFloat;
//                        aMeses[12] := QConsolida.FieldByName('ANTDB12').AsFloat -
//                           QConsolida.FieldByName('ANTHB12').AsFloat;
//
//                        nImporteCons := 0;
//                        for j := MesInicio to MesFinal do begin
//                           nImporteCons := nImporteCons + aMeses[j];
//                        end;
//
//                        nImporteCons := ConversionImporte(nImporteCons,
//                                                          DMRef.QParametros.FieldByName('MONEDA').AsString,
//                                                          prmMonedaImpresion);
//                        if (QCuentas.FieldByName('CUENTA').AsString < '700') and
//                           (QCuentas.FieldByName('CUENTA').AsString > '599') then begin
//                           nTotDbAnt129 := nTotDbAnt129 + nImporteCons;
//                        end;
//                        if (QCuentas.FieldByName('CUENTA').AsString < '800') and
//                           (QCuentas.FieldByName('CUENTA').AsString > '699') then begin
//                           nTotHbAnt129 := nTotHbAnt129 + nImporteCons;
//                        end;
//                     end;
//                  end;
//                  QCuentas.Next;
//               end;  
//
//               nTotAnt129 := nTotDbAnt129 + nTotHbAnt129;
//
//               if DMBlnc.QInfBalanc_Cuentas.Locate('CUENTA', '129', []) then begin
//                  DMBlnc.QInfBalanc_Cuentas.Edit;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_Cuentas.Insert;
//                  RellenaDatosDescripcion(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
//                  DMBlnc.QInfBalanc_CuentasCUENTA.AsString := '129';
//                  DMBlnc.QInfBalanc_CuentasGRUPO.AsString  := 'PA6';
//                  DMBlnc.QInfBalanc_CuentasTITULO.AsString := 'PA';
//                  // DMBlnc.QInfBalanc_CuentasTITULOREVES.AsString := 'AP'; 
//               end;
//
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORCUENTA.AsFloat := nTotAnt129;
//               DMBlnc.QInfBalanc_Cuentas.Post;
//            end;      
//
//            { Cargar CUENTAS }
//            if DMBlnc.QInfBalanc_Cuentas.Locate('CUENTA', '129', []) then begin { PPGG }
//               DMBlnc.QInfBalanc_Cuentas.Edit;
//               if RoundToDecimal(nTot129, 3, True) > 0 then begin
//                  DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat := DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat + nTot129;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat := DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat - (-1 * nTot129);
//               end;
//               DMBlnc.QInfBalanc_Cuentas.Post;
//            end;
//
//            { Cargar GRUPOS }
//            if DMBlnc.QInfBalanc_Grupos.Locate('GRUPO', DMBlnc.QInfBalanc_CuentasGRUPO.AsString, []) then begin
//               DMBlnc.QInfBalanc_Grupos.Edit;
//               if RoundToDecimal(nTot129, 3, True) > 0 then begin
//                  DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat := DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat + nTot129;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat :=
//                     DMBlnc.QInfBalanc_GruposSALDOACTUALGRUPO.AsFloat - (-1 * nTot129);
//               end;
//               if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//                  if RoundToDecimal(nTotAnt129, 3, True) > 0 then begin
//                     DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat :=
//                        DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat + nTotAnt129;
//                  end
//                  else begin
//                     DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat :=
//                        DMBlnc.QInfBalanc_GruposSALDOANTERIORGRUPO.AsFloat - (-1 * nTotAnt129);
//                  end;
//               end;
//               DMBlnc.QInfBalanc_Grupos.Post;
//            end;
//
//            { Carga TÍTULOS }
//            if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', Copy(DMBlnc.QInfBalanc_GruposGRUPO.AsString, 1, 2), []) then begin
//               DMBlnc.QInfBalanc_Titulos.Edit;
//               if RoundToDecimal(nTot129, 3, True) > 0 then begin
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat + nTot129;
//               end
//               else begin
//                  DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat :=
//                     DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat - (-1 * nTot129);
//               end;
//               if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//                  if RoundToDecimal(nTotAnt129, 3, True) > 0 then begin
//                     DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                        DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat + nTotAnt129;
//                  end
//                  else begin
//                     DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat :=
//                        DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat - (-1 * nTotAnt129);
//                  end;
//               end;
//               DMBlnc.QInfBalanc_Titulos.Post;
//            end;
//         end;
//      end;  
//
//      { CÁLCULO DE FÓRMULAS PARA BALANCE DE PÉRDIDAS Y GANANCIAS }
//      if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
//         DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//         DMBlnc.QInfBalanc_Grupos.IndexName  := '';
//         DMBlnc.QInfBalanc_Titulos.IndexName := 'TituloReves';
//         DMBlnc.QInfBalanc_Titulos.First;
//         while not DMBlnc.QInfBalanc_Titulos.EOF do begin
//            Titulo := DMBlnc.QInfBalanc_TitulosTITULO.AsString;
//            Letra  := Copy(Titulo, 1, 1);
//            if (Letra = 'A') or (Letra = 'P') or (Empty(DMBlnc.QInfBalanc_TitulosSUMA1.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA2.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA3.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA4.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA5.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA6.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA7.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosSUMA8.AsString ) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA1.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA2.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA3.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA4.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA5.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA6.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA7.AsString) and
//               Empty(DMBlnc.QInfBalanc_TitulosRESTA8.AsString))then begin
//               DMBlnc.QInfBalanc_Titulos.Next;
//               Continue;
//            end;
//
//            { Inicializar }
//            DMBlnc.QInfBalanc_Titulos.Edit;
//            DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat   := 0;
//            DMBlnc.QInfBalanc_TitulosSALDOANTERIORTITULO.AsFloat := 0;
//            DMBlnc.QInfBalanc_Titulos.Post;
//            nIndice := StrToInt(Copy(Titulo, 2, 1));
//
//            { Leer fórmula }
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA1.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA2.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA3.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA4.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA5.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA6.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA7.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosSUMA8.AsString ,  1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA1.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA2.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA3.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA4.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA5.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA6.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA7.AsString, -1);
//            Formula(DMBlnc.QInfBalanc_TitulosRESTA8.AsString, -1);
//
//            if Copy(Titulo, 1, 1) = 'D' then begin
//               if RoundToDecimal(DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat, 3, True) > 0 then begin
//                  aSaldo[nIndice]   := DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat;
//                  aFormula[nIndice] := 'D';
//               end;
//            end else
//            if Empty(aFormula[nIndice]) then begin
//               aSaldo[nIndice]   := DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat;
//               aFormula[nIndice] := 'H';
//            end;
//            DMBlnc.QInfBalanc_Titulos.Next;
//         end;
//         DMBlnc.QInfBalanc_Titulos.IndexName := '';
//      end;
//
//      if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
//         { Poner en H5 y H6 lo que tenga en D5 y D6 (Saldo actual) }
//         if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', 'D5', []) then begin
//            nSaldoAux := DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat;
//            if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', 'H5', []) then begin
//               DMBlnc.QInfBalanc_Titulos.Edit;
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat := nSaldoAux;
//               DMBlnc.QInfBalanc_Titulos.Post;
//            end;
//         end;
//
//         if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', 'D6', []) then begin
//            nSaldoAux := DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat;
//            if DMBlnc.QInfBalanc_Titulos.Locate('TITULO', 'H6', []) then begin
//               DMBlnc.QInfBalanc_Titulos.Edit;
//               DMBlnc.QInfBalanc_TitulosSALDOACTUALTITULO.AsFloat := nSaldoAux;
//               DMBlnc.QInfBalanc_Titulos.Post;
//            end;
//         end;
//      end;
//   except
//      on E: Exception do begin
//         QCuentas.Close;
//         QCuentas.Free;
//         QTitulos.Close;
//         QTitulos.Free;
//         QGrupos.Close;
//         QGrupos.Free;
//         QConsolida.Close;
//         QConsolida.Free;
//         if prmEmpresaAnterior <> 0 then begin
//            QSaldoAnteriorCuenta.Close;
//            QSaldoAnteriorCuenta.Free;
//         end;
//
//         // quita la espera Caratula.Cerrar;
//         // quita la espera Caratula.Free;
//
//         DatabaseError(E.Message);
//      end;
//   end;
//
//   QCuentas.Close;
//   QCuentas.Free;
//   QTitulos.Close;
//   QTitulos.Free;
//   QGrupos.Close;
//   QGrupos.Free;
//   QConsolida.Close;
//   QConsolida.Free;
//   if prmEmpresaAnterior <> 0 then begin
//      QSaldoAnteriorCuenta.Close;
//      QSaldoAnteriorCuenta.Free;
//   end;
//
//   { Rellena saldos de título y grupo }
//   RellenaSaldosCuentas(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
//
//   { Filtra registros a imprimir }
//   FiltraRegistros(prmTipoInforme, prmSaldosEjercicioAnterior, prmEmpresaAnterior);
//
//   { Añadir registros de fórmulas }
//   InsertaLineasFormulas(prmFechaInicial, prmFechaFinal, prmFechaImpresion);
//
//   lBorraAnterior := False;
//   DMBlnc.QInfBalanc_Cuentas.IndexName := 'Titulo';
//   if prmTipoInforme = INF_BALANCE_PERDIDAS_Y_GANANCIAS then begin
//      DMBlnc.QInfBalanc_Cuentas.First;
//      while not DMBlnc.QInfBalanc_Cuentas.EOF do begin
//         Letra1  := Copy(DMBlnc.QInfBalanc_CuentasTITULO.AsString, 1, 1);
//         Letra2  := Copy(DMBlnc.QInfBalanc_CuentasTITULO.AsString, 2, 1);
//         nIndice := StrToInt(Letra2);
//
//         DMBlnc.QInfBalanc_Cuentas.Edit;
//         DMBlnc.QInfBalanc_CuentasTITULOIMPRESO.AsString := DMBlnc.QInfBalanc_CuentasTITULO.AsString;
//         DMBlnc.QInfBalanc_Cuentas.Post;
//
//         if ((Trim(DMBlnc.QInfBalanc_CuentasTITULO.AsString) = 'H5') or
//             (Trim(DMBlnc.QInfBalanc_CuentasTITULO.AsString) = 'H6')) and lBorraAnterior then begin
//            DMBlnc.QInfBalanc_Cuentas.Edit;
//            DMBlnc.QInfBalanc_CuentasSALDOAnteriorTITULO.AsFloat := 0;
//            DMBlnc.QInfBalanc_Cuentas.Post;
//            DMBlnc.QInfBalanc_Cuentas.Next;
//            Continue;
//         end;
//
//         if (nIndice <> 0) and (Letra1 <> aFormula[nIndice]) then begin
//            if DMBlnc.QInfBalanc_CuentasSALDOACTUALCUENTA.AsFloat = 0 then begin
//               if ((Trim(DMBlnc.QInfBalanc_CuentasTITULO.AsString) = 'D5') or
//                   (Trim(DMBlnc.QInfBalanc_CuentasTITULO.AsString) = 'D6')) then begin
//                  lBorraAnterior := True;
//               end;
//               DMBlnc.QInfBalanc_Cuentas.Edit;
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat := 0;
//               DMBlnc.QInfBalanc_Cuentas.Post;
//            end
//            else begin
//               DMBlnc.QInfBalanc_Cuentas.Edit;
//               DMBlnc.QInfBalanc_CuentasTITULOIMPRESO.AsString      := '';
//               DMBlnc.QInfBalanc_CuentasDESCRIPCIONTITULO.AsString  := '';
//               DMBlnc.QInfBalanc_CuentasFORMULA.AsString            := '';
//               DMBlnc.QInfBalanc_CuentasSALDOACTUALTITULO.AsFloat   :=  0;
//               DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat :=  0;
//               DMBlnc.QInfBalanc_Cuentas.Post;
//            end;
//            DMBlnc.QInfBalanc_Cuentas.Next;
//         end
//         else begin
//            DMBlnc.QInfBalanc_Cuentas.Next;
//         end;
//      end;
//   end;
//
//   { Si saca D3,D4,D5 y D6 de anterior, se pone a cero  H5 y H6 de anterior. }
//   DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'D3', []);
//   if DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
//      if DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'H3', []) then begin
//         DMBlnc.QInfBalanc_Cuentas.Edit;
//         DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat := 0;
//         DMBlnc.QInfBalanc_Cuentas.Post;
//      end;
//   end;
//
//   DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'D4', []);
//   if DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
//      if DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'H4', []) then begin
//         DMBlnc.QInfBalanc_Cuentas.Edit;
//         DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat := 0;
//         DMBlnc.QInfBalanc_Cuentas.Post;
//      end;
//   end;
//
//   DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'D5', []);
//   if DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
//      if DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'H5', []) then begin
//         DMBlnc.QInfBalanc_Cuentas.Edit;
//         DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat := 0;
//         DMBlnc.QInfBalanc_Cuentas.Post;
//      end;
//   end;
//
//   DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'D6', []);
//   if DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat <> 0 then begin
//      if DMBlnc.QInfBalanc_Cuentas.Locate('TITULO', 'H6', []) then begin
//         DMBlnc.QInfBalanc_Cuentas.Edit;
//         DMBlnc.QInfBalanc_CuentasSALDOANTERIORTITULO.AsFloat := 0;
//         DMBlnc.QInfBalanc_Cuentas.Post;
//      end;
//   end;
//
//   // quita la espera Caratula.Cerrar;
//   // quita la espera Caratula.Free;
//
//   if prmTipoInforme = INF_BALANCE_SITUACION then begin
//      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//         FormPrincipal.LanzarListado('LBalanceSituacionAnterior.rtm',
//                                     DMBlnc.SInfBalanc_Cuentas,
//                                     prmMonedaImpresion);
//      end
//      else begin
//         FormPrincipal.LanzarListado('LBalanceSituacion.rtm',
//                                     DMBlnc.SInfBalanc_Cuentas,
//                                     prmMonedaImpresion);
//      end;
//   end
//   else begin
//      if prmSaldosEjercicioAnterior or (prmEmpresaAnterior <> 0) then begin
//         FormPrincipal.LanzarListado('LCuentaPPGGAnterior.rtm',
//                                     DMBlnc.SInfBalanc_Cuentas,
//                                     prmMonedaImpresion);
//      end
//      else begin
//         FormPrincipal.LanzarListado('LCuentaPPGG.rtm',
//                                     DMBlnc.SInfBalanc_Cuentas,
//                                     prmMonedaImpresion);
//      end;
//   end;
//   DMContaRef.InicializarFicherosInformes;
//end;

end.
