unit UIsoc202;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcpanel, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages,
     OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, shellapi, StdCtrls, SysUtils, WinProcs,
     WinTypes, wwclearpanel, wwdbdatetimepicker, Wwkeycb, wwSpeedButton, CustomView;

type
   TWISoc202 = class(TCustomView)
      OvcController1:  TOvcController;
      Datos:           TfcGroupBox;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      Label1:          TLabel;
      QIsoc202:        TClientDataSet;
      sISoc202:        TDataSource;
      oFormapago:      TRadioGroup;
      FiltroBaseDesde: TOvcDbNumericField;
      Label2:          TLabel;
      OvcDbPictureField9: TOvcDbPictureField;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      GroupBox5:       TfcGroupBox;
      Label7:          TLabel;
      cBaseA:          TOvcDbNumericField;
      Label8:          TLabel;
      BtnEdtErrores:   TfcImageBtn;
      cbDeclarante:    TCheckBox;
      OvcDbNumericField1: TOvcDbNumericField;
      GroupBox1:       TfcGroupBox;
      GroupBox2:       TfcGroupBox;
      Label3:          TLabel;
      Label4:          TLabel;
      cBaseB1:         TOvcDbNumericField;
      cTantoB1:        TOvcDbNumericField;
      Label5:          TLabel;
      cResultadoB1:    TOvcDbNumericField;
      GroupBox3:       TfcGroupBox;
      Label6:          TLabel;
      Label9:          TLabel;
      Label10:         TLabel;
      cBaseB2:         TOvcDbNumericField;
      cRestoB2:        TOvcDbNumericField;
      cHastaB2:        TOvcDbNumericField;
      Label11:         TLabel;
      Label12:         TLabel;
      OvcDbNumericField8: TOvcDbNumericField;
      OvcDbNumericField9: TOvcDbNumericField;
      Label13:         TLabel;
      cResultadoB2:    TOvcDbNumericField;
      Label14:         TLabel;
      OvcDbNumericField11: TOvcDbNumericField;
      Label15:         TLabel;
      OvcDbNumericField12: TOvcDbNumericField;
      Label16:         TLabel;
      OvcDbNumericField13: TOvcDbNumericField;
      Label17:         TLabel;
      OvcDbNumericField14: TOvcDbNumericField;
      Label18:         TLabel;
      FechaImprimir:   TwwDBDateTimePicker;
      OvcDbPictureField13: TOvcDbPictureField;
      Label84:         TLabel;
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
      procedure FormCreate(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure CalcularResultado(Sender: TObject);
      procedure BtnEdtErroresClick(Sender: TObject);
      procedure cBaseAExit(Sender: TObject);
      procedure CalculoB(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
   private
      function FormatoImporte(importe: Double; Longitud: Integer): String;
      procedure CalcularResultadoB;
   public
   end;

var WISoc202: TWISoc202;

implementation
uses Cadenas, DM, General, Globales, ststrs, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWISoc202.BtnEdtProcesarClick(Sender: TObject);
var
   F:          TextFile;
   Registro:   String;
   cProvincia: String;
   nIngreso:   Double;
   cNombreFiscal, cApellidos, cNombre: String;
   nPosComa:   Cardinal;
begin

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if QISoc202.state in dseditmodes then begin
      QISoc202.post;
   end;

   // Buscar provincia
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIbsql.Create(nil), SQL do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('SELECT NOMBRE FROM PROVINCIAS');
      Add('WHERE PROVINCIA=:PROVINCIA');
      parambyname('provincia').AsString := DmRef.QParametros.FieldByName('Provincia').AsString;
      ExecQuery;
      cProvincia := FieldByName('nombre').AsString;
      Close;
      Free;
   end;

   // Preparacion registro a imprimir por impresor de Hacienda
   AssignFile(F, gvDirectorio + 'Hacienda\Entrada.txt');
   Rewrite(F);
   Registro      := '202' +                // Modelo 202
      '01' +                 // Pagina 01
      ' ' +                  // Indicador pag. complementaria
      ' ' +                  // Tipo de declaracion
      // Codigo de administracion  (5)
      BackChar(DmRef.QParametros.FieldByName('CodAdmon').AsString, '0', 5) +
      LeadChar(Copy(Trim(DmRef.QParametros.FieldByName('Nif').AsString), 1, 9), '0', 9) +
      // Nif de 9 posiciones
      space(4);             // Letras de la etiqueta
      // Si es persona fisica es obligatorio poner el campo de nombre
      // Se pondra una coma para separar el nombre de los apellidos (Formato: Apellidos, Nombre)
   cNombreFiscal := Trim(Uppercase(DmRef.QParametros.FieldByName('NombreFiscal').AsString));
   StrStPosS(cNombreFiscal, ',', nPosComa);
   if DmRef.QParametros.FieldByName('Tipoempresa').AsString = 'F' then // Persona fisica 
   begin
      // Apellidos o Razón Social (30)
      cApellidos := Backchar(copy(cNombreFiscal, 1, nPoscoma - 1), ' ', 30);
      // Nombre (15)
      cNombre    := Backchar(Trim(copy(cNombreFiscal, nPoscoma + 1, 15)), ' ', 15);
      Registro   := Registro + cApellidos + cNombre;
   end
   else begin  // Empresa
      Registro := Registro +
         // Apellidos o Razón Social (30)
         Backchar(copy(
         Trim(Uppercase(DmRef.QParametros.FieldByName('NombreFiscal').AsString)), 1, 30), ' ', 30) +
         Backchar(copy(
         Trim(UpperCase(DmRef.QParametros.FieldByName('NombreFiscal').AsString)), 31, 15), ' ', 15);
   end;

   Registro := Registro +
      // Sigla Via   (2)
      Backchar(DmRef.QParametros.FieldByName('SiglaVia').AsString, ' ', 2) +
      // Nombre de via publica  (17)
      Backchar(copy(Trim(UpperCase(DmRef.QParametros.FieldByName('Direccion').AsString)),
      1, 17), ' ', 17) +
      // Numero (4)
      BackChar(DmRef.QParametros.FieldByName('NumeroCalle').AsString, ' ', 4) +
      // Escalera  (2)
      BackChar(DmRef.QParametros.FieldByName('Escalera').AsString, ' ', 2) +
      // Piso (2)
      BackChar(DmRef.QParametros.FieldByName('Piso').AsString, ' ', 2) +
      // Puerta (2)
      BackChar(DmRef.QParametros.FieldByName('Puerta').AsString, ' ', 2) +
      // Telefono
      Backchar(copy(Trim(DmRef.QParametros.FieldByName('Telefono').AsString), 1, 9), ' ', 9) +
      // Municipio
      Backchar(copy(Trim(Uppercase(DmRef.QParametros.FieldByName('Poblacion').AsString)),
      1, 20), ' ', 20) +
      // Provincia
      Backchar(Uppercase(copy(Trim(cProvincia), 1, 15)), ' ', 15) +
      // Cod. Postal
      Leadchar(copy(Trim(DmRef.QParametros.FieldByName('CodPostal').AsString), 1, 5), '0', 5) +
      // Textos en mayusculas <------------------------------------ OJO -------->
      LeadChar(QISoc202.FieldByName('Ejercicio').AsString, '0', 4) +  // Ejercicio
      BackChar(QISoc202.FieldByName('Periodo').AsString, ' ', 2) +    // Periodo

      // a) Base Pago fraccionado [01]
      FormatoImporte(QISoc202.FieldByName('Casilla01').AsFloat, 13) +
      // a) Resultado de la declaracion anterior si complementaria [02]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // a) A ingresar  (18% sobre casilla 01) [03]
      FormatoImporte(QISoc202.FieldByName('Casilla02').AsFloat, 13) +
      // B1) Base Pago Fraccionado  [04]
      FormatoImporte(QISoc202.FieldByName('Casilla03').AsFloat, 13) +
      // B1) Porcentaje [05]
      FormatoImporte(QISoc202.FieldByName('Casilla04').AsFloat, 4) +
      // B1) Resultado [06]
      FormatoImporte(QISoc202.FieldByName('Casilla05').AsFloat, 13) +
      // B2) Base Pago Fraccionado  [07]
      FormatoImporte(QISoc202.FieldByName('Casilla06').AsFloat, 13) +
      // B2) Base Pago Fraccionado  Hasta [07 Bis]
      FormatoImporte(QISoc202.FieldByName('Casilla06B').AsFloat, 13) +
      // B2) Base Pago Fraccionado  21% [08]
      FormatoImporte(QISoc202.FieldByName('Casilla07').AsFloat, 13) +
      // B2) Base Pago Fraccionado  Resto [08 Bis]
      FormatoImporte(QISoc202.FieldByName('Casilla07B').AsFloat, 13) +
      // B2) Base Pago Fraccionado , 25% [09]
      FormatoImporte(QISoc202.FieldByName('Casilla08').AsFloat, 13) +
      // B2) Resultado  [10]
      FormatoImporte(QISoc202.FieldByName('Casilla09').AsFloat, 13) +
      // B3) Base pago fraccionado. Parte General [11]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Importe pago fraccionado. Parte general [12]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Base pago fraccionado. Parte especial [13]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Importe pago fraccionado. Parte especial [14]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Resultado  [15]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Bonificaciones  [16]
      FormatoImporte(QISoc202.FieldByName('Casilla10').AsFloat, 13) +
      // B3) Retenciones y pagos a cuenta practicados  [17]
      FormatoImporte(QISoc202.FieldByName('Casilla11').AsFloat, 13) +
      // B3) Resultado de la decl.anterior si complementaria  [18]
      FormatoImporte(QISoc202.FieldByName('Casilla00').AsFloat, 13) +
      // B3) Pagos fraccionados de declaraciones anteriores  [19]
      FormatoImporte(QISoc202.FieldByName('Casilla12').AsFloat, 13) +
      // B3) A ingresar [20]
      FormatoImporte(QISoc202.FieldByName('Casilla13').AsFloat, 13) +
      // Complementaria. Codigo electronico declaracion anterior.
      Space(16) +
      // Complementaria. Justificante declaracion anterior
      Space(13);

   Registro := Registro +
      // Firma. dia
      Leadchar(IntToStr(Day(QISoc202.FieldByName('FechaImpresion').AsDateTime)), '0', 2) +
      // Firma. mes
      BackChar(Uppercase(Trim(CMonth(QISoc202.FieldByName('FechaImpresion').AsDateTime))),
      ' ', 10) +
      // Firma. año
      Leadchar(copy(IntToStr(year(QISoc202.FieldByName('FechaImpresion').AsDateTime)), 1, 4), '0', 4);

   // Ingreso. Forma de pago, efectivo (1)
   // Ingreso. Forma de pago, adeudo en cuenta (1)
   if oFormaPago.ItemIndex = 1 then begin
      Registro := Registro + 'X ';
   end
   else begin
      Registro := Registro + ' X';
   end;

   if RoundToDecimal(QISoc202.FieldByName('Casilla02').AsFloat, 2, True) <> 0 then   begin
      nIngreso := QISoc202.FieldByName('Casilla02').AsFloat;
   end
   else begin
      nIngreso := QISoc202.FieldByName('Casilla02').AsFloat;
   end;

   Registro := Registro +
      // Ingreso. Importe
      FormatoImporte(nIngreso, 13);

   if oFormaPago.ItemIndex = 0 then   begin
      Registro := Registro +
         // Ingreso. CCC Entidad
         LeadChar(Copy(QIsoc202.FieldByName('CCC').AsString, 1, 4), ' ', 4) +
         // Ingreso. CCC Oficina
         LeadChar(Copy(QIsoc202.FieldByName('CCC').AsString, 6, 4), ' ', 4) +
         // Ingreso. CCC DC
         LeadChar(Copy(QIsoc202.FieldByName('CCC').AsString, 11, 2), ' ', 2) +
         // Ingreso. CCC Cuenta
         LeadChar(Copy(QIsoc202.FieldByName('CCC').AsString, 14, 10), ' ', 10);
   end
   else begin
      Registro := Registro +
         // Ingreso. CCC Entidad
         LeadChar(space(4), ' ', 4) +
         // Ingreso. CCC Oficina
         LeadChar(space(4), ' ', 4) +
         // Ingreso. CCC DC
         LeadChar(space(2), ' ', 2) +
         // Ingreso. CCC Cuenta
         LeadChar(space(10), ' ', 10);
   end;

   Registro := Registro +
      // Persona de contacto
      BackChar(Uppercase(Trim(Copy(DmRef.QParametros.FieldByName('Contacto').AsString, 1, 100))),
      ' ', 100) +
      // Telefono de contacto
      BackChar(space(9), ' ', 9) +
      // Observaciones
      BackChar(Uppercase(QISoc202.FieldByName('Observaciones').AsString), ' ', 350);
   // Fin de Registro
   //           Showmessage(IntToStr(Length(Registro)));

   Writeln(F, Registro);
   CloseFile(F);

   // Impresion modelo IVA 202
   if cbDeclarante.Checked then  begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\ejecutar2.bat'), nil, nil, SW_HIDE);
   end
   else begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\ejecutar.bat'), nil, nil, SW_HIDE);
   end;

   MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
   Datos.Update;
end;

procedure TWISoc202.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWISoc202.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWISoc202.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
end;

procedure TWISoc202.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWISoc202.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario := nil;
   WIsoc202   := nil;
end;

procedure TWISoc202.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWISoc202.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWISoc202.FormCreate(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QISoc202 do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Ejercicio', ftInteger, 0, False);
         Add('Periodo', ftString, 2, False);
         Add('Casilla00', ftFloat, 0, False);
         Add('Casilla01', ftFloat, 0, False);
         Add('Casilla02', ftFloat, 0, False);
         Add('Casilla03', ftFloat, 0, False);
         Add('Casilla04', ftFloat, 0, False);
         Add('Casilla05', ftFloat, 0, False);
         Add('Casilla06', ftFloat, 0, False);
         Add('Casilla06B', ftFloat, 0, False);
         Add('Casilla07', ftFloat, 0, False);
         Add('Casilla07B', ftFloat, 0, False);
         Add('Casilla08', ftFloat, 0, False);
         Add('Casilla09', ftFloat, 0, False);
         Add('Casilla10', ftFloat, 0, False);
         Add('Casilla11', ftFloat, 0, False);
         Add('Casilla12', ftFloat, 0, False);
         Add('Casilla13', ftFloat, 0, False);
         Add('Observaciones', ftString, 350, False);
         Add('Ingreso', ftFloat, 0, False);
         Add('FechaImpresion', ftDate, 0, False);
         Add('CCC', ftString, 23, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
      FieldByName('fechaimpresion').AsDateTime := date;
      FieldByName('Ejercicio').AsInteger       := Year(date);
      if (month(date) >= 1) and (month(date) <= 6) then   begin
         FieldByName('periodo').AsString := '1P';
      end
      else
      if (month(date) >= 7) and (month(date) <= 10) then   begin
         FieldByName('periodo').AsString := '2P';
      end
      else begin
         FieldByName('periodo').AsString := '3P';
      end;
      FieldByName('CCC').AsString := DMRef.QParametros.FieldByName('CCC').AsString;
   end;
end;

function TWISoc202.FormatoImporte(Importe: Double; Longitud: Integer): String;
var
   cEuro:    String;
   nPosComa: Cardinal;
begin
   cEuro := Trim(FloattostrF(RoundToDecimal(importe, 2, True), ffFixed, Longitud, 2));
   StrStPosS(cEuro, ',', nPosComa);
   if RoundToDecimal(Importe, 2, True) < 0 then  begin
      Result := 'N' + LeadChar(Copy(cEuro, 2, nPosComa - 2) +
         BackChar(Copy(cEuro, nPosComa + 1, 2), '0', 2), '0', Longitud - 1);
   end
   else begin
      Result := LeadChar(Copy(cEuro, 1, nPosComa - 1) + BackChar(Copy(cEuro, nPosComa + 1, 2), '0', 2),
         '0', Longitud);
   end;

end;

procedure TWISoc202.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWISoc202.CalcularResultado(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QISoc202 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('TotalDevengado').AsFloat :=
         RoundToDecimal(FieldByName('cuota03').AsFloat + FieldByName('cuota06').AsFloat +
         FieldByName('cuota09').AsFloat + FieldByName('cuota12').AsFloat +
         FieldByName('cuota15').AsFloat + FieldByName('cuota18').AsFloat +
         FieldByName('cuota20').AsFloat, 2, True);
      FieldByName('TotalDeducible').AsFloat :=
         RoundToDecimal(FieldByName('deducible22').AsFloat + FieldByName('deducible23').AsFloat +
         FieldByName('deducible24').AsFloat, 2, True);
      FieldByName('Diferencia').AsFloat     :=
         RoundToDecimal(FieldByName('TotalDevengado').AsFloat -
         FieldByName('TotalDeducible').AsFloat, 2, True);
      FieldByName('Resultado').AsFloat      := FieldByName('Diferencia').AsFloat;
      if RoundToDecimal(FieldByName('Resultado').AsFloat, 2, True) > 0 then   begin
         FieldByName('ingreso').AsFloat    := FieldByName('Resultado').AsFloat;
         FieldByName('devolucion').AsFloat := 0;
      end
      else begin
         FieldByName('devolucion').AsFloat := FieldByName('Resultado').AsFloat;
         FieldByName('ingreso').AsFloat    := 0;
      end;
   end;
end;

procedure TWISoc202.BtnEdtErroresClick(Sender: TObject);
begin
   if fileexists(gvdirectorio + 'hacienda\errores.txt') then  begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\errores.txt'), nil, nil, SW_SHOWNORMAL);
   end
   else begin
      DatabaseError('No hay errores a visualizar.');
   end;
end;

procedure TWISoc202.cBaseAExit(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QISoc202 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('casilla02').AsFloat := RoundToDecimal(18 * 0.01 * FieldByName('casilla01').AsFloat, 2, True);
   end;
end;

procedure TWISoc202.CalculoB(Sender: TObject);
begin
   CalcularResultadoB;
end;

procedure TWISoc202.CalcularResultadoB;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QISoc202 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('casilla05').AsFloat :=
         RoundToDecimal(FieldByName('casilla04').AsFloat * 0.01 * FieldByName('casilla03').AsFloat, 2, True);

      FieldByName('casilla07').AsFloat  :=
         RoundToDecimal(21 * 0.01 * FieldByName('casilla06b').AsFloat, 2, True);
      FieldByName('casilla07b').AsFloat :=
         RoundToDecimal(FieldByName('casilla06').AsFloat - FieldByName('casilla06b').AsFloat, 2, True);
      FieldByName('casilla08').AsFloat  :=
         RoundToDecimal(25 * 0.01 * FieldByName('casilla07b').AsFloat, 2, True);
      FieldByName('casilla09').AsFloat  :=
         RoundToDecimal(FieldByName('casilla07').AsFloat + FieldByName('casilla08').AsFloat, 2, True);

      if RoundToDecimal(FieldByName('casilla05').AsFloat, 2, True) <> 0 then   begin
         FieldByName('casilla13').AsFloat := FieldByName('casilla05').AsFloat;
      end
      else begin
         FieldByName('casilla13').AsFloat := FieldByName('casilla09').AsFloat;
      end;
      FieldByName('casilla13').AsFloat := RoundToDecimal(FieldByName('casilla13').AsFloat -
         FieldByName('casilla10').AsFloat - FieldByName('casilla11').AsFloat -
         FieldByName('casilla12').AsFloat, 2, True);

      if RoundToDecimal(FieldByName('casilla02').AsFloat, 2, True) <> 0 then   begin
         FieldByName('ingreso').AsFloat := FieldByName('casilla02').AsFloat;
      end
      else begin
         FieldByName('ingreso').AsFloat := FieldByName('casilla13').AsFloat;
      end;
   end;
end;

procedure TWISoc202.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
