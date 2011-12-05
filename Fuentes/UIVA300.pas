unit UIVA300;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, fcpanel, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages,
     OvcBase, OvcDbNF, OvcDbPF, OvcEF, ovcnbk, OvcNF, OvcPB, OvcPF, shellapi, StdCtrls, SysUtils,
     WinProcs, WinTypes, wwclearpanel, Wwkeycb, wwSpeedButton;

type
   TWIva300 = class(TForm)
      OvcController1:  TOvcController;
      Datos:           TGroupBox;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      Label1:          TLabel;
      QIva300:         TClientDataSet;
      sIva300:         TDataSource;
      oFormapago:      TRadioGroup;
      FiltroBaseDesde: TOvcDbNumericField;
      Label2:          TLabel;
      OvcDbPictureField9: TOvcDbPictureField;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      Label11:         TLabel;
      OvcDbNumericField22: TOvcDbNumericField;
      Label12:         TLabel;
      OvcDbNumericField23: TOvcDbNumericField;
      BtnEdtErrores:   TfcImageBtn;
      cbDeclarante:    TCheckBox;
      cbTrimestral:    TCheckBox;
      Label84:         TLabel;
      OvcDbPictureField13: TOvcDbPictureField;
      Paginas:         TOvcNotebook;
      GroupBox1:       TGroupBox;
      Label3:          TLabel;
      Label4:          TLabel;
      Label5:          TLabel;
      Label6:          TLabel;
      GroupBox2:       TfcGroupBox;
      OvcDbNumericField1: TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      OvcDbNumericField3: TOvcDbNumericField;
      OvcDbNumericField4: TOvcDbNumericField;
      OvcDbNumericField5: TOvcDbNumericField;
      OvcDbNumericField6: TOvcDbNumericField;
      OvcDbNumericField7: TOvcDbNumericField;
      OvcDbNumericField28: TOvcDbNumericField;
      GroupBox3:       TfcGroupBox;
      OvcDbNumericField8: TOvcDbNumericField;
      OvcDbNumericField9: TOvcDbNumericField;
      OvcDbNumericField10: TOvcDbNumericField;
      OvcDbNumericField11: TOvcDbNumericField;
      OvcDbNumericField12: TOvcDbNumericField;
      OvcDbNumericField13: TOvcDbNumericField;
      OvcDbNumericField29: TOvcDbNumericField;
      GroupBox4:       TfcGroupBox;
      OvcDbNumericField14: TOvcDbNumericField;
      OvcDbNumericField15: TOvcDbNumericField;
      OvcDbNumericField16: TOvcDbNumericField;
      OvcDbNumericField17: TOvcDbNumericField;
      OvcDbNumericField18: TOvcDbNumericField;
      OvcDbNumericField19: TOvcDbNumericField;
      OvcDbNumericField20: TOvcDbNumericField;
      OvcDbNumericField21: TOvcDbNumericField;
      GroupBox5:       TGroupBox;
      Label10:         TLabel;
      GroupBox8:       TfcGroupBox;
      OvcDbNumericField35: TOvcDbNumericField;
      OvcDbNumericField36: TOvcDbNumericField;
      OvcDbNumericField37: TOvcDbNumericField;
      OvcDbNumericField42: TOvcDbNumericField;
      GroupBox6:       TfcGroupBox;
      Label13:         TLabel;
      Label14:         TLabel;
      Label15:         TLabel;
      Label17:         TLabel;
      Label18:         TLabel;
      Label19:         TLabel;
      Label20:         TLabel;
      Label21:         TLabel;
      Label22:         TLabel;
      OvcDbNumericField24: TOvcDbNumericField;
      OvcDbNumericField25: TOvcDbNumericField;
      OvcDbNumericField26: TOvcDbNumericField;
      OvcDbNumericField30: TOvcDbNumericField;
      OvcDbNumericField31: TOvcDbNumericField;
      OvcDbNumericField32: TOvcDbNumericField;
      Label25:         TLabel;
      Label26:         TLabel;
      OvcDbNumericField39: TOvcDbNumericField;
      OvcDbNumericField40: TOvcDbNumericField;
      fcGroupBox1:     TfcGroupBox;
      Label30:         TLabel;
      Label33:         TLabel;
      OvcDbNumericField27: TOvcDbNumericField;
      OvcDbNumericField33: TOvcDbNumericField;
      BtnEdtBorrador:  TfcImageBtn;
      Label16:         TLabel;
      Label23:         TLabel;
      OvcDbNumericField38: TOvcDbNumericField;
      Label24:         TLabel;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      Label27:         TLabel;
      OvcDbNumericField43: TOvcDbNumericField;
      Label7:          TLabel;
      Label8:          TLabel;
      Label9:          TLabel;
      Label28:         TLabel;
      OvcDbNumericField44: TOvcDbNumericField;
      Label29:         TLabel;
      OvcDbNumericField45: TOvcDbNumericField;
      Label31:         TLabel;
      OvcDbNumericField46: TOvcDbNumericField;
      OvcDbNumericField34: TOvcDbNumericField;
      OvcDbNumericField41: TOvcDbNumericField;
      Label32:         TLabel;
      OvcDbNumericField47: TOvcDbNumericField;
      OvcDbNumericField48: TOvcDbNumericField;
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
      procedure cbTrimestralClick(Sender: TObject);
      procedure SeleccionarContenido(Sender: TObject);
      procedure BtnEdtBorradorClick(Sender: TObject);
   private
      function FormatoImporte(importe: Double; Longitud: Integer): String;
   public
   end;

var WIva300: TWIva300;

implementation
uses Cadenas, DM, DMConta, General, Globales, ststrs, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWIva300.BtnEdtProcesarClick(Sender: TObject);
var
   F:          TextFile;
   Registro:   String;
   cProvincia: String;
   nAsiento, nApunte: Integer;
   dFecha:     TDatetime;
   cNombreFiscal, cApellidos, cNombre: String;
   nPosComa:   Cardinal;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if QIVa300.state in dseditmodes then begin
      QIva300.post;
   end;

   if cbTrimestral.Checked then  begin
      if QIva300.FieldByName('periodo').AsString = '1T' then   begin
         dFecha := Encodedate(QIva300.FieldByName('Ejercicio').AsInteger, 3, 31);
      end
      else
      if QIva300.FieldByName('periodo').AsString = '2T' then   begin
         dFecha := Encodedate(QIva300.FieldByName('Ejercicio').AsInteger, 6, 30);
      end
      else
      if QIva300.FieldByName('periodo').AsString = '3T' then   begin
         dFecha := Encodedate(QIva300.FieldByName('Ejercicio').AsInteger, 9, 30);
      end
      else begin
         dFecha := Encodedate(QIva300.FieldByName('Ejercicio').AsInteger, 12, 31);
      end;

      nAsiento := DMContaRef.ObtenerNumeroAsiento;
      nApunte  := 1;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSql.Create(nil), Sql do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('INSERT INTO DIARIO (APUNTE, ASIENTO, CONTRAPARTIDA,');
         Add('    DEBEHABER, FECHA, ID_CONCEPTOS, IMPORTE, MONEDA, SUBCUENTA)');
         Add('VALUES (:APUNTE, :ASIENTO,:CONTRAPARTIDA,');
         Add('    :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
         Add('    :IMPORTE, :MONEDA, :SUBCUENTA)');

         if RoundToDecimal(QIva300.FieldByName('Cuota03').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaIvaNormal').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota03').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota06').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaIvaReducido').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota06').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota09').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaIvaSuper').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota09').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota12').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaRecNormal').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota12').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota15').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaRecReducido').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota15').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota18').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger      := nAsiento;
            parambyname('Fecha').AsDateTime       := dFecha;
            parambyname('moneda').AsString        := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString     := DmRef.QParametros.FieldByName('SctaRecSuper').AsString;
            parambyname('debehaber').AsString     := 'D';
            parambyname('importe').AsFloat        := QIva300.FieldByName('Cuota18').AsFloat;
            parambyname('id_conceptos').AsString  := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            parambyname('contrapartida').AsString := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         Clear;
         Add('INSERT INTO DIARIO (APUNTE, ASIENTO,');
         Add('    DEBEHABER, FECHA, ID_CONCEPTOS, IMPORTE, MONEDA, SUBCUENTA)');
         Add('VALUES (:APUNTE, :ASIENTO,');
         Add('    :DEBEHABER, :FECHA, :ID_CONCEPTOS,');
         Add('    :IMPORTE, :MONEDA, :SUBCUENTA)');

         if RoundToDecimal(QIva300.FieldByName('Cuota22TN').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger     := nAsiento;
            parambyname('Fecha').AsDateTime      := dFecha;
            parambyname('moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString    := DmRef.QParametros.FieldByName('SctaIvaCNormal').AsString;
            parambyname('debehaber').AsString    := 'H';
            parambyname('importe').AsFloat       := QIva300.FieldByName('Cuota22TN').AsFloat;
            parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota22TR').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger     := nAsiento;
            parambyname('Fecha').AsDateTime      := dFecha;
            parambyname('moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString    := DmRef.QParametros.FieldByName('SctaIvaCReducido').AsString;
            parambyname('debehaber').AsString    := 'H';
            parambyname('importe').AsFloat       := QIva300.FieldByName('Cuota22TR').AsFloat;
            parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         if RoundToDecimal(QIva300.FieldByName('Cuota22TS').AsFloat, 2, True) <> 0 then   begin
            Close;
            parambyname('Apunte').AsInteger := nApunte;
            Inc(nApunte);
            parambyname('asiento').AsInteger     := nAsiento;
            parambyname('Fecha').AsDateTime      := dFecha;
            parambyname('moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
            parambyname('subcuenta').AsString    := DmRef.QParametros.FieldByName('SctaIvaCSuper').AsString;
            parambyname('debehaber').AsString    := 'H';
            parambyname('importe').AsFloat       := QIva300.FieldByName('Cuota22TS').AsFloat;
            parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
            ExecQuery;
            Transaction.CommitRetaining;
         end;

         // Ultimo
         Close;
         parambyname('Apunte').AsInteger      := nApunte;
         parambyname('asiento').AsInteger     := nAsiento;
         parambyname('Fecha').AsDateTime      := dFecha;
         parambyname('moneda').AsString       := DmRef.QParametros.FieldByName('MONEDA').AsString;
         parambyname('subcuenta').AsString    := DmRef.QParametros.FieldByName('SctaHacIva').AsString;
         parambyname('debehaber').AsString    := 'H';
         parambyname('importe').AsFloat       := QIva300.FieldByName('Resultado').AsFloat;
         parambyname('id_conceptos').AsString := DmRef.QParametros.FieldByName('CtoHacIva').AsString;
         ExecQuery;
         Transaction.CommitRetaining;
      end;

      MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', nAsiento), mtInformation, [mbOK], 0);

      BtnEdtProcesar.Caption := 'Imprimir';
      cbTrimestral.Checked   := False;
   end
   else begin
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
      Registro      := '300' +                // Modelo 300
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
            Backchar(copy(Trim(Uppercase(DmRef.QParametros.FieldByName('NombreFiscal').AsString)),
            1, 30), ' ', 30) + Backchar(
            copy(Trim(UpperCase(DmRef.QParametros.FieldByName('NombreFiscal').AsString)), 31, 15), ' ', 15);
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
         Backchar(copy(Trim(DmRef.QParametros.FieldByName('Telefono').AsString), 1, 9), ' ', 9);
      // Textos en mayusculas <------------------------------------ OJO -------->

      //             Showmessage('Ejercicio: '+IntToStr(Length(Registro)));
      Registro := Registro + LeadChar(QIva300.FieldByName('Ejercicio').AsString, '0', 4) +
         // Ejercicio
         BackChar(QIva300.FieldByName('Periodo').AsString, ' ', 2);    // Periodo
         //  Showmessage('Casilla 01: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Gen. Base Imponible [01]
         FormatoImporte(QIva300.FieldByName('Base01').AsFloat, 13);
      //  Showmessage('Casilla 02: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Gen. Tipo % [02]
         FormatoImporte(QIva300.FieldByName('Tipo02').AsFloat, 4) +
         // Iva Devengado R.Gen. Cuota  [03]
         FormatoImporte(QIva300.FieldByName('Cuota03').AsFloat, 13);
      //   Showmessage('Casilla 04: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Gen. Base Imponible [04]
         FormatoImporte(QIva300.FieldByName('Base04').AsFloat, 13);
      //   Showmessage(FormatoImporte(QIva300.fieldbyname('Base04').asfloat,13));
      //   Showmessage('Casilla 05: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Gen. Tipo % [05]
         FormatoImporte(QIva300.FieldByName('Tipo05').AsFloat, 4) +
         // Iva Devengado R.Gen. Cuota  [06]
         FormatoImporte(QIva300.FieldByName('Cuota06').AsFloat, 13) +
         // Iva Devengado R.Gen. Base Imponible [07]
         FormatoImporte(QIva300.FieldByName('Base07').AsFloat, 13) +
         // Iva Devengado R.Gen. Tipo % [08]
         FormatoImporte(QIva300.FieldByName('Tipo08').AsFloat, 4);
      //      Showmessage('Casilla 09: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Gen. Cuota  [09]
         FormatoImporte(QIva300.FieldByName('Cuota09').AsFloat, 13) +
         // Iva Devengado R.Equ. Base Imponible [10]
         FormatoImporte(QIva300.FieldByName('Base10').AsFloat, 13) +
         // Iva Devengado R.Equ. Tipo % [11]
         FormatoImporte(QIva300.FieldByName('Tipo11').AsFloat, 3) +
         // Iva Devengado R.Equ. Cuota  [12]
         FormatoImporte(QIva300.FieldByName('Cuota12').AsFloat, 13);
      //    Showmessage('Casilla 13: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Equ. Base Imponible [13]
         FormatoImporte(QIva300.FieldByName('Base13').AsFloat, 13) +
         // Iva Devengado R.Equ. Tipo % [14]
         FormatoImporte(QIva300.FieldByName('Tipo14').AsFloat, 3);
      //     Showmessage('Casilla 15: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Equ. Cuota  [15]
         FormatoImporte(QIva300.FieldByName('Cuota15').AsFloat, 13);
      //     Showmessage('Casilla 16: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Equ. Base Imponible [16]
         FormatoImporte(QIva300.FieldByName('Base16').AsFloat, 13);
      //    Showmessage('Casilla 17: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Equ. Tipo % [17]
         FormatoImporte(QIva300.FieldByName('Tipo17').AsFloat, 3);
      // Showmessage(FormatoImporte(QIva300.fieldbyname('Tipo17').asfloat,3));

      //Showmessage('Casilla 18: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Iva Devengado R.Equ. Cuota  [18]
         FormatoImporte(QIva300.FieldByName('Cuota18').AsFloat, 13) +
         // Iva Devengado Adq. Intra. Base Imponible [19]
         FormatoImporte(QIva300.FieldByName('Base19').AsFloat, 13) +
         // Iva Devengado Adq. Intra. Base Imponible [19] S.I.
         FormatoImporte(QIva300.FieldByName('Base19SI').AsFloat, 13) +
         // Iva Devengado Adq. Intra. Cuota  [20]
         FormatoImporte(QIva300.FieldByName('Cuota20').AsFloat, 13) +
         // Iva Devengado Adq. Intra. Cuota  [20] S.I.
         FormatoImporte(QIva300.FieldByName('Cuota20SI').AsFloat, 13) +
         // Iva Devengado Total Cuota Devengada [21]
         FormatoImporte(QIva300.FieldByName('TotalDevengado').AsFloat, 13) +
         // Iva Deducible por cuotas soportadas en op. interiores [22]
         FormatoImporte(QIva300.FieldByName('Deducible22').AsFloat, 13) +
         // Iva Deducible por cuotas satisfechas importaciones [23]
         FormatoImporte(QIva300.FieldByName('Deducible23').AsFloat, 13) +
         // Iva Deducible por cuotas satisfechas importaciones [23] Bienes Inversion
         FormatoImporte(QIva300.FieldByName('Deducible23BI').AsFloat, 13) +
         // Iva Deducible por adq. intra.[24]
         FormatoImporte(QIva300.FieldByName('Deducible24').AsFloat, 13) +
         // Iva Deducible por adq. intra.[24] Bienes Inversión
         FormatoImporte(QIva300.FieldByName('Deducible24BI').AsFloat, 13) +
         // Iva Deducible por adq. intra.[24] Servicios Inversión
         FormatoImporte(QIva300.FieldByName('Deducible24SI').AsFloat, 13) +
         // Iva Deducible Reg. Agrario [25]               
         FormatoImporte(QIva300.FieldByName('Deducible25').AsFloat, 13) +
         // Iva Deducible Regula. Inversiones [26]
         FormatoImporte(QIva300.FieldByName('Deducible26').AsFloat, 13) +
         // Iva Deducible Total a Deducir [27]
         FormatoImporte(QIva300.FieldByName('TotalDeducible').AsFloat, 13) +
         // Liquidacion. Diferencia [28]
         FormatoImporte(QIva300.FieldByName('Diferencia').AsFloat, 13) +
         // Liquidacion. Atribuible a la Adm. Estado % [29]
         FormatoImporte(QIva300.FieldByName('Liquidacion29').AsFloat, 5) +
         // Liquidacion. Atribuible a la Adm. Estado [30]
         FormatoImporte(QIva300.FieldByName('Liquidacion30').AsFloat, 13) +
         // Liquidacion. Cuotas a compenzar de periodos anteriores [31]
         FormatoImporte(QIva300.FieldByName('Liquidacion31').AsFloat, 13) +
         // Liquidacion. Entregas intracomunitarias [32]
         FormatoImporte(QIva300.FieldByName('Liquidacion32').AsFloat, 13) +
         // Liquidacion. Exclusivamente tributacion conjunta estado y dip. forales [33]
         FormatoImporte(QIva300.FieldByName('Liquidacion33').AsFloat, 13) +
         // Liquidacion. Resultado [34]
         FormatoImporte(QIva300.FieldByName('Resultado').AsFloat, 13) +
         // Compensacion. Importe a compensar si resulta negativo el resultado
         FormatoImporte(QIva300.FieldByName('Compensacion').AsFloat, 13) +
         // Devolucion. Importe
         FormatoImporte(QIva300.FieldByName('Devolucion').AsFloat, 13);

      //  Showmessage('Dev. CCC: '+IntToStr(Length(Registro)));

      if RoundToDecimal(QIva300.FieldByName('Ingreso').AsFloat, 2, True) > 0 then   begin
         Registro := Registro +
            // Devolucion. CCC Entidad
            LeadChar(space(4), ' ', 4) +
            // Devolucion. CCC Oficina
            LeadChar(space(4), ' ', 4) +
            // Devolucion. CCC DC
            LeadChar(space(2), ' ', 2) +
            // Devolucion. CCC Cuenta
            LeadChar(space(10), ' ', 10);
      end
      else begin
         Registro := Registro +
            // Devolucion. CCC Entidad
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 1, 4), ' ', 4) +
            // Devolucion. CCC Oficina
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 6, 4), ' ', 4) +
            // Devolucion. CCC DC
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 11, 2), ' ', 2) +
            // Devolucion. CCC Cuenta
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 14, 10), ' ', 10);
      end;

      // Ingreso. Forma de pago, efectivo (1)
      // Ingreso. Forma de pago, adeudo en cuenta (1)
      if oFormaPago.ItemIndex = 1 then begin
         Registro := Registro + 'X ';
      end
      else begin
         Registro := Registro + ' X';
      end;

      Registro := Registro +
         // Ingreso. Importe
         FormatoImporte(QIva300.FieldByName('Ingreso').AsFloat, 13);

      if (RoundToDecimal(QIva300.FieldByName('Ingreso').AsFloat, 2, True) > 0) and
         (oFormaPago.ItemIndex = 0) then   begin
         Registro := Registro +
            // Ingreso. CCC Entidad
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 1, 4), ' ', 4) +
            // Ingreso. CCC Oficina
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 6, 4), ' ', 4) +
            // Ingreso. CCC DC
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 11, 2), ' ', 2) +
            // Ingreso. CCC Cuenta
            LeadChar(Copy(QIva300.FieldByName('CCC').AsString, 14, 10), ' ', 10);
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
      //Showmessage('Persona Contacto: '+IntToStr(Length(Registro)));

      Registro := Registro +
         // Persona de contacto
         BackChar(Uppercase(Trim(Copy(DmRef.QParametros.FieldByName(
         'Contacto').AsString, 1, 100))), ' ', 100) +
         // Telefono de contacto
         BackChar(space(9), ' ', 9);

      //Showmessage('Observaciones: '+IntToStr(Length(Registro)));
      Registro := Registro +
         // Observaciones
         BackChar(Uppercase(Trim(Copy(QIva300.FieldByName('Observaciones').AsString, 1, 350))),
         ' ', 350) +
         // Firma. dia
         Leadchar(IntToStr(Day(QIva300.FieldByName('FechaImpresion').AsDateTime)), '0', 2) +
         // Firma. mes
         BackChar(Uppercase(Trim(CMonth(QIva300.FieldByName('FechaImpresion').AsDateTime))),
         ' ', 10);
      // Firma. año
      // Showmessage('Año: '+IntToStr(Length(Registro)));
      Registro := Registro + Leadchar(
         copy(IntToStr(year(QIva300.FieldByName('FechaImpresion').AsDateTime)), 1, 4), '0', 4);
      // Fin de Registro
      //Showmessage('Final: '+IntToStr(Length(Registro)));

      Writeln(F, Registro);
      CloseFile(F);

      // Impresion modelo IVA 300
      if cbDeclarante.Checked then   begin
         ShellExecute(Application.handle, 'open',
            PChar(gvDirectorio + '\hacienda\ejecutar2.bat'), nil, nil, SW_HIDE);
      end
      else begin
         ShellExecute(Application.handle, 'open',
            PChar(gvDirectorio + '\hacienda\ejecutar.bat'), nil, nil, SW_HIDE);
      end;

      if Length(Registro) <> 1087 then   begin
         MessageDlg('El fichero no es correcto. Consulte al soporte técnico.', mtInformation, [mbOK], 0);
      end
      else begin
         MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
      end;
   end;
   Datos.Update;
   // Close;
end;

procedure TWIva300.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWIva300.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWIva300.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   QIva300.Edit;
   QIva300.FieldByName('CCC').AsString := DMRef.QParametros.FieldByName('CCC').AsString;
end;

procedure TWIva300.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWIva300.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario := nil;
   WIVA300    := nil;
end;

procedure TWIva300.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWIva300.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWIva300.FormCreate(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QIva300 do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Ejercicio', ftInteger, 0, False);
         Add('FECHAINICIAL', ftDateTime, 0, False);
         Add('FECHAFINAL', ftDateTime, 0, False);
         Add('Periodo', ftString, 2, False);
         Add('Base00', ftFloat, 0, False);
         Add('Base00Normal', ftFloat, 0, False);
         Add('Base00CEE', ftFloat, 0, False);
         Add('Base00Interes', ftFloat, 0, False);
         Add('Base00Exportacion', ftFloat, 0, False);
         Add('Tipo00', ftFloat, 0, False);
         Add('Base01', ftFloat, 0, False);
         Add('Tipo02', ftFloat, 0, False);
         Add('Cuota03', ftFloat, 0, False);
         Add('Base04', ftFloat, 0, False);
         Add('Tipo05', ftFloat, 0, False);
         Add('Cuota06', ftFloat, 0, False);
         Add('Base07', ftFloat, 0, False);
         Add('Tipo08', ftFloat, 0, False);
         Add('Cuota09', ftFloat, 0, False);
         Add('Base10', ftFloat, 0, False);
         Add('Tipo11', ftFloat, 0, False);
         Add('Cuota12', ftFloat, 0, False);
         Add('Base13', ftFloat, 0, False);
         Add('Tipo14', ftFloat, 0, False);
         Add('Cuota15', ftFloat, 0, False);
         Add('Base16', ftFloat, 0, False);
         Add('Tipo17', ftFloat, 0, False);
         Add('Cuota18', ftFloat, 0, False);
         Add('Base19', ftFloat, 0, False);
         Add('Base19SI', ftFloat, 0, False);
         Add('Cuota20', ftFloat, 0, False);
         Add('Cuota20SI', ftFloat, 0, False);
         Add('Base36', ftFloat, 0, False);
         Add('Base37', ftFloat, 0, False);
         Add('BaseAdqInt', ftFloat, 0, False);
         Add('CuotaAdqInt', ftFloat, 0, False);
         Add('Base216', ftFloat, 0, False);
         Add('Cuota216', ftFloat, 0, False);
         Add('TotalDevengado', ftFloat, 0, False);
         Add('Deducible22', ftFloat, 0, False);
         // Campos de desglose del Deducible22
         Add('Cuota22B', ftFloat, 0, False);
         Add('Cuota22TN', ftFloat, 0, False);
         Add('Cuota22TR', ftFloat, 0, False);
         Add('Cuota22TS', ftFloat, 0, False);
         Add('Base22B', ftFloat, 0, False);
         Add('Base22TN', ftFloat, 0, False);
         Add('Base22TR', ftFloat, 0, False);
         Add('Base22TS', ftFloat, 0, False);
         Add('Base22TE', ftFloat, 0, False);

         Add('Deducible23', ftFloat, 0, False);
         Add('Deducible23BI', ftFloat, 0, False);
         Add('Deducible24', ftFloat, 0, False);
         Add('Deducible24BI', ftFloat, 0, False);
         Add('Deducible24SI', ftFloat, 0, False);
         Add('Deducible25', ftFloat, 0, False);
         Add('Deducible26', ftFloat, 0, False);
         Add('TotalDeducible', ftFloat, 0, False);
         Add('Diferencia', ftFloat, 0, False);
         Add('Liquidacion29', ftFloat, 0, False);
         Add('Liquidacion30', ftFloat, 0, False);
         Add('Liquidacion31', ftFloat, 0, False);
         Add('Liquidacion32', ftFloat, 0, False);
         Add('Liquidacion33', ftFloat, 0, False);
         Add('Resultado', ftFloat, 0, False);
         Add('Compensacion', ftFloat, 0, False);
         Add('Devolucion', ftFloat, 0, False);
         Add('Ingreso', ftFloat, 0, False);
         Add('FechaImpresion', ftDate, 0, False);
         Add('Observaciones', ftString, 350, False);
         Add('CCC', ftString, 23, False);
      end;
      CreateDataSet;
      Active := True;

   end;
end;

function TWIva300.FormatoImporte(Importe: Double; Longitud: Integer): String;
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
   if longitud < Length(Result) then begin
      Result := Copy(Result, 1, Longitud);
   end;
end;

procedure TWIva300.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWIva300.CalcularResultado(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with Qiva300 do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
      FieldByName('TotalDevengado').AsFloat :=
         RoundToDecimal(FieldByName('cuota03').AsFloat + FieldByName('cuota06').AsFloat +
         FieldByName('cuota09').AsFloat + FieldByName('cuota12').AsFloat +
         FieldByName('cuota15').AsFloat + FieldByName('cuota18').AsFloat +
         FieldByName('cuota20').AsFloat + FieldByName('cuota216').AsFloat, 2, True);
      FieldByName('TotalDeducible').AsFloat :=
         RoundToDecimal(FieldByName('deducible22').AsFloat + FieldByName('deducible23').AsFloat +
         FieldByName('deducible23BI').AsFloat + FieldByName('deducible24').AsFloat +
         FieldByName('deducible24BI').AsFloat + FieldByName('deducible24SI').AsFloat +
         FieldByName('cuota216').AsFloat, 2, True);
      FieldByName('Diferencia').AsFloat     :=
         RoundToDecimal(FieldByName('TotalDevengado').AsFloat -
         FieldByName('TotalDeducible').AsFloat, 2, True);
      FieldByName('Resultado').AsFloat      :=
         FieldByName('Diferencia').AsFloat - FieldByName('Liquidacion31').AsFloat;
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

procedure TWIva300.BtnEdtErroresClick(Sender: TObject);
begin
   if fileexists(gvdirectorio + 'hacienda\errores.txt') then  begin
      ShellExecute(Application.handle, 'open',
         PChar(gvDirectorio + '\hacienda\errores.txt'), nil, nil, SW_SHOWNORMAL);
   end
   else begin
      DatabaseError('No hay errores a visualizar.');
   end;
end;

procedure TWIva300.cbTrimestralClick(Sender: TObject);
begin
   if cbTrimestral.Checked then begin
      BtnEdtProcesar.Caption := 'Generar';
   end
   else begin
      BtnEdtProcesar.Caption := 'Imprimir';
   end;
end;

procedure TWIva300.SeleccionarContenido(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWIva300.BtnEdtBorradorClick(Sender: TObject);
begin
   FormPrincipal.LanzarListado('LMODELO300.RTM', sIva300, DMRef.QParametros.FieldByName('MONEDA').AsString);
end;

end.
