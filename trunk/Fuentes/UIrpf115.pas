unit UIrpf115;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages, OvcBase,
     OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, shellapi, StdCtrls, SysUtils, WinProcs, WinTypes,
     wwclearpanel, wwdbdatetimepicker, Wwkeycb, wwSpeedButton, CustomView;
type
   TWIrpf115 = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      Label1:         TLabel;
      QIrpf115:       TClientDataSet;
      sIrpf115:       TDataSource;
      oFormapago:     TRadioGroup;
      cEjercicio:     TOvcDbNumericField;
      Label2:         TLabel;
      OvcDbPictureField9: TOvcDbPictureField;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      BtnEdtErrores:  TfcImageBtn;
      cbDeclarante:   TCheckBox;
      Label7:         TLabel;
      FechaImprimir:  TwwDBDateTimePicker;
      GroupBox12:     TGroupBox;
      Label25:        TLabel;
      OvcDbNumericField22: TOvcDbNumericField;
      Label26:        TLabel;
      Label27:        TLabel;
      OvcDbNumericField24: TOvcDbNumericField;
      Label3:         TLabel;
      ePerceptor1:    TOvcDbNumericField;
      Label4:         TLabel;
      OvcDbNumericField2: TOvcDbNumericField;
      Label5:         TLabel;
      OvcDbNumericField1: TOvcDbNumericField;
      Label84:        TLabel;
      OvcDbPictureField13: TOvcDbPictureField;
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
      procedure FormCreate(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure BtnEdtErroresClick(Sender: TObject);
      procedure CalcularIngreso(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
   private
      function FormatoImporte(importe: Double; Longitud: Integer): String;
   public
      nSumaSueldoD, nSumaIrpfD, nSumaIrpfH: Double;
   end;

var WIrpf115: TWIrpf115;

implementation
uses Cadenas, DM, General, Globales, ststrs, UEspere, MenuPrincipal;
{$R *.DFM}

const
   CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWIrpf115.BtnEdtProcesarClick(Sender: TObject);
var
   F:          TextFile;
   Registro:   String;
   cProvincia: String;
   cNombreFiscal, cApellidos, cNombre: String;
   nPosComa:   Cardinal;
begin

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if QIrpf115.state in dseditmodes then begin
      QIrpf115.post;
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
   Registro      := '115' +                // Modelo 115
      '01' +                 // Pagina 01
      ' ' +                  // Indicador pag. complementaria
      ' ' +                  // Tipo de declaracion
      // Codigo de administracion  (5)
      BackChar(DmRef.QParametros.FieldByName('CodAdmon').AsString, '0', 5) +
      LeadChar(Copy(Trim(DmRef.QParametros.FieldByName('Nif').AsString), 1, 9), '0', 9) +
      // Nif de 9 posiciones
      space(4); // Letras de la etiqueta
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
      LeadChar(QIrpf115.FieldByName('Ejercicio').AsString, '0', 4) +  // Ejercicio
      BackChar(QIrpf115.FieldByName('Periodo').AsString, ' ', 2) +    // Periodo
      // Dinerarios Nº Perceptores [01]
      LeadChar(Trim(QIrpf115.FieldByName('Liquidacion01').AsString), '0', 6) +
      // Base Retenciones e ingresos a cuenta [02]
      FormatoImporte(QIrpf115.FieldByName('Liquidacion02').AsFloat, 13) +
      // Importe Retenciones  [03]
      FormatoImporte(QIrpf115.FieldByName('Liquidacion03').AsFloat, 13) +
      // A Deducir [04]
      FormatoImporte(QIrpf115.FieldByName('Liquidacion04').AsFloat, 13) +
      // Resultado a ingresar  [05]
      FormatoImporte(QIrpf115.FieldByName('Ingreso').AsFloat, 13) +
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
      BackChar(' ', ' ', 350);

   // Ingreso. Forma de pago, efectivo (1)
   // Ingreso. Forma de pago, adeudo en cuenta (1)
   if oFormaPago.ItemIndex = 1 then begin
      Registro := Registro + 'X ';
   end
   else begin
      Registro := Registro + ' X';
   end;

   // Importe del ingreso 
   Registro := Registro + FormatoImporte(
      QIrpf115.FieldByName('Ingreso').AsFloat, 13) +
      // Ingreso. CCC Entidad
      LeadChar(Copy(QIrpf115.FieldByName('CCC').AsString, 1, 4), ' ', 4) +
      // Ingreso. CCC Oficina
      LeadChar(Copy(QIrpf115.FieldByName('CCC').AsString, 6, 4), ' ', 4) +
      // Ingreso. CCC DC
      LeadChar(Copy(QIrpf115.FieldByName('CCC').AsString, 11, 2), ' ', 2) +
      // Ingreso. CCC Cuenta
      LeadChar(Copy(QIrpf115.FieldByName('CCC').AsString, 14, 10), ' ', 10) +
      // Firma. dia
      Leadchar(IntToStr(Day(QIrpf115.FieldByName('FechaImpresion').AsDateTime)), '0', 2) +
      // Firma. mes
      BackChar(Uppercase(Trim(CMonth(QIrpf115.FieldByName('FechaImpresion').AsDateTime))),
      ' ', 10) +
      // Firma. año
      Leadchar(copy(IntToStr(year(QIrpf115.FieldByName('FechaImpresion').AsDateTime)), 1, 4), '0', 4);
   // Fin de Registro
   // Showmessage(IntToStr(Length(Registro)));

   Writeln(F, Registro);
   CloseFile(F);

   // Impresion modelo IVA 115
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
   // Close;
end;

procedure TWIrpf115.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWIrpf115.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWIrpf115.FormShow(Sender: TObject);
begin
   cEjercicio.SetFocus;
end;

procedure TWIrpf115.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWIrpf115.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario := nil;
   WIrpf115   := nil;
end;

procedure TWIrpf115.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWIrpf115.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWIrpf115.FormCreate(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf115 do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Ejercicio', ftInteger, 0, False);
         Add('Periodo', ftString, 2, False);
         Add('Liquidacion01', ftInteger, 0, False);
         Add('Liquidacion02', ftFloat, 0, False);
         Add('Liquidacion03', ftFloat, 0, False);
         Add('Liquidacion04', ftFloat, 0, False);
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

function TWIrpf115.FormatoImporte(Importe: Double; Longitud: Integer): String;
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

procedure TWIrpf115.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWIrpf115.BtnEdtErroresClick(Sender: TObject);
begin
   if fileexists(gvdirectorio + 'hacienda\errores.txt') then  begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\errores.txt'), nil, nil, SW_SHOWNORMAL);
   end
   else begin
      DatabaseError('No hay errores a visualizar.');
   end;
end;

procedure TWIrpf115.CalcularIngreso(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIrpf115 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('Ingreso').AsFloat := FieldByName('Liquidacion03').AsFloat -
         FieldByName('Liquidacion04').AsFloat;
   end;
end;

procedure TWIrpf115.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

end.
