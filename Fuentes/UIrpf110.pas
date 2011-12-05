unit UIrpf110;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcpanel, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages,
     OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, shellapi, StdCtrls, SysUtils, WinProcs,
     WinTypes, wwclearpanel, wwdbdatetimepicker, Wwkeycb, wwSpeedButton;

type
   TWIrpf110 = class(TForm)
      OvcController1:  TOvcController;
      Datos:           TfcGroupBox;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      Label1:          TLabel;
      QIrpf110:        TClientDataSet;
      sIrpf110:        TDataSource;
      oFormapago:      TRadioGroup;
      FiltroBaseDesde: TOvcDbNumericField;
      Label2:          TLabel;
      OvcDbPictureField9: TOvcDbPictureField;
      GroupBox1:       TfcGroupBox;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      GroupBox2:       TfcGroupBox;
      ePerceptor1:     TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      OvcDbNumericField3: TOvcDbNumericField;
      BtnEdtErrores:   TfcImageBtn;
      cbDeclarante:    TCheckBox;
      Label3:          TLabel;
      Label4:          TLabel;
      Label5:          TLabel;
      Label7:          TLabel;
      FechaImprimir:   TwwDBDateTimePicker;
      GroupBox3:       TfcGroupBox;
      Label6:          TLabel;
      Label8:          TLabel;
      Label9:          TLabel;
      OvcDbNumericField4: TOvcDbNumericField;
      OvcDbNumericField5: TOvcDbNumericField;
      OvcDbNumericField6: TOvcDbNumericField;
      GroupBox4:       TfcGroupBox;
      GroupBox5:       TfcGroupBox;
      Label10:         TLabel;
      Label11:         TLabel;
      Label12:         TLabel;
      OvcDbNumericField7: TOvcDbNumericField;
      OvcDbNumericField8: TOvcDbNumericField;
      OvcDbNumericField9: TOvcDbNumericField;
      GroupBox6:       TfcGroupBox;
      Label13:         TLabel;
      Label14:         TLabel;
      Label15:         TLabel;
      OvcDbNumericField10: TOvcDbNumericField;
      OvcDbNumericField11: TOvcDbNumericField;
      OvcDbNumericField12: TOvcDbNumericField;
      GroupBox7:       TfcGroupBox;
      GroupBox8:       TfcGroupBox;
      Label16:         TLabel;
      Label17:         TLabel;
      Label18:         TLabel;
      OvcDbNumericField13: TOvcDbNumericField;
      OvcDbNumericField14: TOvcDbNumericField;
      OvcDbNumericField15: TOvcDbNumericField;
      GroupBox9:       TfcGroupBox;
      Label19:         TLabel;
      Label20:         TLabel;
      Label21:         TLabel;
      OvcDbNumericField16: TOvcDbNumericField;
      OvcDbNumericField17: TOvcDbNumericField;
      OvcDbNumericField18: TOvcDbNumericField;
      GroupBox10:      TfcGroupBox;
      GroupBox11:      TfcGroupBox;
      Label22:         TLabel;
      Label23:         TLabel;
      Label24:         TLabel;
      OvcDbNumericField19: TOvcDbNumericField;
      OvcDbNumericField20: TOvcDbNumericField;
      OvcDbNumericField21: TOvcDbNumericField;
      GroupBox12:      TfcGroupBox;
      Label25:         TLabel;
      OvcDbNumericField22: TOvcDbNumericField;
      Label26:         TLabel;
      OvcDbNumericField23: TOvcDbNumericField;
      Label27:         TLabel;
      OvcDbNumericField24: TOvcDbNumericField;
      BtnedtCalcular:  TfcImageBtn;
      Label28:         TLabel;
      wwDBDateTimePicker1: TwwDBDateTimePicker;
      Label29:         TLabel;
      wwDBDateTimePicker2: TwwDBDateTimePicker;
      Label84:         TLabel;
      OvcDbPictureField13: TOvcDbPictureField;
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
      procedure CalcularOtro(Sender: TObject);
      procedure BtnedtCalcularClick(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
   private
      function FormatoImporte(importe: Double; Longitud: Integer): String;
      procedure CalcularSaldos(FechaIni, FechaFin: TDatetime);
   public
      nSumaSueldoD, nSumaIrpfD, nSumaIrpfH, nSumaRendimActiv, nSumaRetenActiv: Double;
   end;

var WIrpf110: TWIrpf110;

implementation
uses Cadenas, DM, General, Globales, StStrs, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWIrpf110.BtnEdtProcesarClick(Sender: TObject);
var
   F:          TextFile;
   Registro:   String;
   cProvincia: String;
   cNombreFiscal, cApellidos, cNombre: String;
   nPosComa:   Cardinal;
begin

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if QIrpf110.state in dseditmodes then begin
      QIrpf110.post;
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
   Registro := '110' +                // Modelo 110
      '01' +                          // Pagina 01
      ' ';                            // Indicador pag. complementaria

   // Tipo de declaracion
   if RoundToDecimal(QIrpf110.FieldByName('Liquidacion24').AsFloat, 2, True) > 0 then
   begin
      Registro := Registro + ' ';
   end
   else begin
      Registro := Registro + 'N';
   end;

   Registro := Registro +
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
      // Cod. Postal
      Leadchar(copy(Trim(DmRef.QParametros.FieldByName('CodPostal').AsString), 1, 5), '0', 5) +
      // Municipio
      Backchar(copy(Trim(Uppercase(DmRef.QParametros.FieldByName('Poblacion').AsString)),
      1, 20), ' ', 20) +
      // Provincia
      Backchar(Uppercase(copy(Trim(cProvincia), 1, 15)), ' ', 15) +
      // Telefono
      Backchar(copy(Trim(DmRef.QParametros.FieldByName('Telefono').AsString), 1, 9), ' ', 9) +
      // Textos en mayusculas <------------------------------------ OJO -------->
      LeadChar(QIrpf110.FieldByName('Ejercicio').AsString, '0', 4) +  // Ejercicio
      BackChar(QIrpf110.FieldByName('Periodo').AsString, ' ', 2) +    // Periodo
      // Dinerarios Nº Perceptores [01]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion01').AsString), '0', 6) +
      // Dinerarios  Importe Percepciones [02]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion02').AsFloat, 13) +
      // Dinerarios  Importe Retenciones  [03]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion03').AsFloat, 13) +
      // En Especie Nº Perceptores [04]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion04').AsString), '0', 6) +
      // En Especie  Importe Percepciones [05]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion05').AsFloat, 13) +
      // En Especie Importe Retenciones  [06]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion06').AsFloat, 13) +
      // Act. Economicas Dinerarios Nº Perceptores [07]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion07').AsString), '0', 6) +
      // Act. Economicas  Dinerarios Importe Percepciones [08]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion08').AsFloat, 13) +
      // Act. Economicas Dinerarios Importe Retenciones  [09]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion09').AsFloat, 13) +
      // Act. Economicas En Especie Nº Perceptores [10]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion10').AsString), '0', 6) +
      // Act. Economicas En especie Importe Percepciones [11]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion11').AsFloat, 13) +
      // Act. Economicas En especie Importe ing. a cuenta  [12]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion12').AsFloat, 13) +
      // Premios Dinerarios Nº Perceptores [13]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion13').AsString), '0', 6) +
      // Premios Dinerarios Importe Percepciones [14]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion14').AsFloat, 13) +
      // Premios Dinerarios Importe Retenciones  [15]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion15').AsFloat, 13) +
      // Premios En Especie Nº Perceptores [16]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion16').AsString), '0', 6) +
      // Premios En especie Importe Percepciones [17]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion17').AsFloat, 13) +
      // Premios En especie Importe ing. a cuenta  [18]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion18').AsFloat, 13) +
      // Derechos imagen Nº Perceptores [19]
      LeadChar(Trim(QIrpf110.FieldByName('Liquidacion19').AsString), '0', 6) +
      // Derechos imagen Contraprestaciones [20]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion20').AsFloat, 13) +
      // Derechos imagen Importe ingresos a cuenta  [21]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion21').AsFloat, 13) +
      // Suma Retenciones e ingresos a cuenta  [22]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion22').AsFloat, 13) +
      // Total a deducir  [23]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion23').AsFloat, 13) +
      // Resultado a ingresar  [24]
      FormatoImporte(QIrpf110.FieldByName('Liquidacion24').AsFloat, 13) +
      // Importe del ingreso
      FormatoImporte(QIrpf110.FieldByName('Ingreso').AsFloat, 13);

   // Ingreso. Forma de pago, efectivo (1)
   // Ingreso. Forma de pago, adeudo en cuenta (1)
   if RoundToDecimal(QIrpf110.FieldByName('Liquidacion24').AsFloat, 2, True) < 0 then
   begin
      Registro := Registro + space(2);
   end
   else begin
      if oFormaPago.ItemIndex = 1 then begin
         Registro := Registro + 'X ';
      end
      else begin
         Registro := Registro + ' X';
      end;
   end;
   if (RoundToDecimal(QIrpf110.FieldByName('Ingreso').AsFloat, 2, True) > 0) and
      (oFormaPago.ItemIndex = 0) then   begin
      Registro := Registro +
         // Ingreso. CCC Entidad
         LeadChar(Copy(QIrpf110.FieldByName('CCC').AsString, 1, 4), ' ', 4) +
         // Ingreso. CCC Oficina
         LeadChar(Copy(QIrpf110.FieldByName('CCC').AsString, 6, 4), ' ', 4) +
         // Ingreso. CCC DC
         LeadChar(Copy(QIrpf110.FieldByName('CCC').AsString, 11, 2), ' ', 2) +
         // Ingreso. CCC Cuenta
         LeadChar(Copy(QIrpf110.FieldByName('CCC').AsString, 14, 10), ' ', 10);
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
      // Complementaria.  Cod. electronico declaracion anterior
      BackChar(' ', ' ', 16) +
      // Complementaria.  Nº de justificante
      BackChar(' ', ' ', 13) +
      // Persona de contacto
      BackChar(Uppercase(Trim(Copy(DmRef.QParametros.FieldByName('Contacto').AsString, 1, 100))),
      ' ', 100) +
      // Telefono de contacto
      BackChar(space(9), ' ', 9) +
      // Observaciones
      BackChar(' ', ' ', 350) +
      // Firma Localidad
      BackChar(Uppercase(Trim(Copy(DmRef.QParametros.FieldByName('Poblacion').AsString, 1, 16))),
      ' ', 16) +
      // Firma. dia
      Leadchar(IntToStr(Day(QIrpf110.FieldByName('FechaImpresion').AsDateTime)), '0', 2) +
      // Firma. mes
      BackChar(Uppercase(Trim(CMonth(QIrpf110.FieldByName('FechaImpresion').AsDateTime))),
      ' ', 10) +
      // Firma. año
      Leadchar(copy(IntToStr(year(QIrpf110.FieldByName('FechaImpresion').AsDateTime)), 1, 4), '0', 4);
   // Fin de Registro
   // Showmessage(IntToStr(Length(Registro)));

   Writeln(F, Registro);
   CloseFile(F);

   // Impresion modelo IVA 110
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

procedure TWIrpf110.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWIrpf110.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWIrpf110.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
end;

procedure TWIrpf110.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWIrpf110.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario := nil;
   WIrpf110   := nil;
end;

procedure TWIrpf110.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWIrpf110.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWIrpf110.FormCreate(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf110 do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Ejercicio', ftInteger, 0, False);
         Add('Periodo', ftString, 2, False);
         Add('Liquidacion01', ftInteger, 0, False);
         Add('Liquidacion02', ftFloat, 0, False);
         Add('Liquidacion03', ftFloat, 0, False);
         Add('Liquidacion04', ftInteger, 0, False);
         Add('Liquidacion05', ftFloat, 0, False);
         Add('Liquidacion06', ftFloat, 0, False);
         Add('Liquidacion07', ftInteger, 0, False);
         Add('Liquidacion08', ftFloat, 0, False);
         Add('Liquidacion09', ftFloat, 0, False);
         Add('Liquidacion10', ftInteger, 0, False);
         Add('Liquidacion11', ftFloat, 0, False);
         Add('Liquidacion12', ftFloat, 0, False);
         Add('Liquidacion13', ftInteger, 0, False);
         Add('Liquidacion14', ftFloat, 0, False);
         Add('Liquidacion15', ftFloat, 0, False);
         Add('Liquidacion16', ftInteger, 0, False);
         Add('Liquidacion17', ftFloat, 0, False);
         Add('Liquidacion18', ftFloat, 0, False);
         Add('Liquidacion19', ftInteger, 0, False);
         Add('Liquidacion20', ftFloat, 0, False);
         Add('Liquidacion21', ftFloat, 0, False);
         Add('Liquidacion22', ftFloat, 0, False);
         Add('Liquidacion23', ftFloat, 0, False);
         Add('Liquidacion24', ftFloat, 0, False);
         Add('Ingreso', ftFloat, 0, False);
         Add('FechaImpresion', ftDate, 0, False);
         Add('FechaIni', ftDate, 0, False);
         Add('FechaFin', ftDate, 0, False);
         Add('CCC', ftString, 23, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
      FieldByName('fechaimpresion').AsDateTime := date;
      FieldByName('fechaini').AsDateTime       := date;
      FieldByName('fechafin').AsDateTime       := date;
      FieldByName('Ejercicio').AsInteger       := Year(date);
      if (month(date) >= 1) and (month(date) <= 3) then   begin
         FieldByName('periodo').AsString := '1T';
      end
      else
      if (month(date) >= 4) and (month(date) <= 6) then   begin
         FieldByName('periodo').AsString := '2T';
      end
      else
      if (month(date) >= 7) and (month(date) <= 9) then   begin
         FieldByName('periodo').AsString := '3T';
      end
      else begin
         FieldByName('periodo').AsString := '4T';
      end;
      FieldByName('CCC').AsString := DMRef.QParametros.FieldByName('CCC').AsString;
   end;
end;

function TWIrpf110.FormatoImporte(Importe: Double; Longitud: Integer): String;
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

procedure TWIrpf110.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWIrpf110.CalcularResultado(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf110 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('Liquidacion22').AsFloat :=
         RoundToDecimal(FieldByName('Liquidacion03').AsFloat + FieldByName('Liquidacion06').AsFloat +
         FieldByName('Liquidacion09').AsFloat + FieldByName('Liquidacion12').AsFloat +
         FieldByName('Liquidacion15').AsFloat + FieldByName('Liquidacion18').AsFloat +
         FieldByName('Liquidacion21').AsFloat, 2, True);

      FieldByName('Liquidacion24').AsFloat :=
         RoundToDecimal(FieldByName('Liquidacion22').AsFloat - FieldByName('Liquidacion23').AsFloat, 2, True);
      if RoundToDecimal(FieldByName('Liquidacion24').AsFloat, 2, True) > 0 then   begin
         FieldByName('Ingreso').AsFloat := RoundToDecimal(FieldByName('Liquidacion24').AsFloat, 2, True);
      end
      else begin
         FieldByName('Ingreso').AsFloat := 0;
      end;
   end;
end;

procedure TWIrpf110.BtnEdtErroresClick(Sender: TObject);
begin
   if fileexists(gvdirectorio + 'hacienda\errores.txt') then  begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\errores.txt'), nil, nil, SW_SHOWNORMAL);
   end
   else begin
      DatabaseError('No hay errores a visualizar.');
   end;
end;

procedure TWIrpf110.CalcularOtro(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf110 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('Liquidacion24').AsFloat :=
         RoundToDecimal(FieldByName('Liquidacion22').AsFloat - FieldByName('Liquidacion23').AsFloat, 2, True);

   end;
end;

procedure TWIrpf110.CalcularSaldos(FechaIni, FechaFin: TDatetime);
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   ePerceptor1.SetFocus;
   // Calcular importes del trimestre
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIbSql.Create(nil), sql do begin
      Close;
      Clear;
      Database := DMRef.IBDSiamCont;
      Add('select sum(importe) as suma from diario where subcuenta=:subcuenta and debehaber="D"');
      Add(' and Fecha>=:FechaIni and Fecha<=:FechaFin');
      parambyname('FechaIni').AsDateTime := FechaIni;
      parambyname('FechaFin').AsDateTime := FechaFin;
      parambyname('Subcuenta').AsString  := DmRef.QParametros.FieldByName('SctaNomSueldo').AsString;
      Execquery;
      nSumasueldoD := FieldByName('suma').AsFloat;
      Close;
      Clear;
      // No se puede contar el asiento de apertura
      Add('select sum(importe) as suma from diario d,Conceptos T ');
      Add('where d.subcuenta=:subcuenta and d.debehaber="H"');
      Add(' and d.Fecha>=:FechaIni and d.Fecha<=:FechaFin ');
      Add('AND D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"A" ');
      Add('AND D.ID_CONCEPTOS=:ID_CONCEPTOS');
      parambyname('FechaIni').AsDateTime   := FechaIni;
      parambyname('FechaFin').AsDateTime   := FechaFin;
      parambyname('Subcuenta').AsString    := DmRef.QParametros.FieldByName('SctaNomIrpf').AsString;
      ParamByName('ID_CONCEPTOS').AsString := DmRef.QParametros.FieldByName('CTONOMT').AsString;
      Execquery;
      nSumaIrpfH := FieldByName('suma').AsFloat;

      // Rendimientos de las actividades económicas: IMP. PERCEPCIONES
      Close;
      Clear;
      Database := DmRef.IBDSiamCont;
      Add('SELECT SUM(D.IMPORTE) AS SUMA FROM DIARIO D, CUENTAS C1, CUENTAS C2,Conceptos T');
      Add('WHERE');
      Add('   C1.TIPOCUENTA = "A" AND');
      Add('   C2.TIPOCUENTA = "P" AND');
      Add('   D.DEBEHABER = "D" AND');
      Add('   D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"A" AND');
      Add('   D.FECHA >= :FECHAINI AND D.FECHA <= :FECHAFIN AND');
      Add('   SUBSTR(D.SUBCUENTA, 1, 3) = C1.CUENTA AND');
      Add('   SUBSTR(D.CONTRAPARTIDA, 1, 3) = C2.CUENTA AND');
      Add('   D.ASIENTO IN (SELECT D2.ASIENTO FROM DIARIO D2');
      Add('                 WHERE D2.ASIENTO = D.ASIENTO AND');
      Add('                       D2.SUBCUENTA = :SUBCUENTA)');
      ParamByName('FECHAINI').AsDateTime := FechaIni;
      ParamByName('FECHAFIN').AsDateTime := FechaFin;
      ParamByName('SUBCUENTA').AsString  := DMRef.QParametros.FieldByName('SCTARETPROF').AsString;
      ExecQuery;
      nSumaRendimActiv := FieldByName('SUMA').AsFloat;

      // Rendimientos de las actividades económicas: IMP. RETENCIONES
      Close;
      Clear;
      Database := DmRef.IBDSiamCont;
      Add('SELECT SUM(D.IMPORTE) AS SUMA FROM DIARIO D,Conceptos T');
      Add('WHERE');
      Add('   D.SUBCUENTA = :SUBCUENTA AND');
      Add('   D.DEBEHABER = "H" AND');
      Add('   D.ID_CONCEPTOS=T.ID_CONCEPTOS AND T.TIPOCONCEPTO<>"A" AND');
      Add('   D.FECHA >= :FECHAINI AND D.FECHA <= :FECHAFIN AND');
      Add('   D.ASIENTO IN (SELECT D2.ASIENTO FROM DIARIO D2, CUENTAS C1');
      Add('                 WHERE D2.ASIENTO = D.ASIENTO AND');
      Add('                       C1.TIPOCUENTA = "P" AND');
      Add('                       SUBSTR(D2.SUBCUENTA, 1, 3) = C1.CUENTA)');
      ParamByName('FECHAINI').AsDateTime := FechaIni;
      ParamByName('FECHAFIN').AsDateTime := FechaFin;
      ParamByName('SUBCUENTA').AsString  := DMRef.QParametros.FieldByName('SCTARETPROF').AsString;
      ExecQuery;
      nSumaRetenActiv := FieldByName('SUMA').AsFloat;

      Close;
      Free;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf110 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('Liquidacion02').AsFloat := RoundToDecimal(nSumaSueldoD, 2, True);
      FieldByName('Liquidacion03').AsFloat := RoundToDecimal(nSumaIrpfH, 2, True);
      FieldByName('Liquidacion08').AsFloat := RoundToDecimal(nSumaRendimActiv, 2, True);
      FieldByName('Liquidacion09').AsFloat := RoundToDecimal(nSumaRetenActiv, 2, True);

      FieldByName('Ejercicio').AsInteger := Year(FechaIni);
      if (month(FechaIni) >= 1) and (month(FechaIni) <= 3) then   begin
         FieldByName('periodo').AsString := '1T';
      end
      else
      if (month(FechaIni) >= 4) and (month(FechaIni) <= 6) then   begin
         FieldByName('periodo').AsString := '2T';
      end
      else
      if (month(FechaIni) >= 7) and (month(FechaIni) <= 9) then   begin
         FieldByName('periodo').AsString := '3T';
      end
      else begin
         FieldByName('periodo').AsString := '4T';
      end;
   end;
   CalcularResultado(nil);
end;

procedure TWIrpf110.BtnedtCalcularClick(Sender: TObject);
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf110 do begin
      if state in dseditmodes then begin
         post;
      end;
      CalcularSaldos(FieldByName('FechaIni').AsDateTime, FieldByName('FechaFin').AsDateTime);
   end;
end;

procedure TWIrpf110.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
