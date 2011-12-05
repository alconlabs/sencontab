unit UCargaApuntes;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Globales, Graphics, Grids, IBCustomDataSet, IBDatabase, IBQuery, IBSQL,
     IBTableSet, jpeg, Mask, Messages, navegadorNotarios, OvcBase, ovcclcdg, OvcDbNF, OvcDbPF, ovcdlg,
     OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel,
     Wwdatsrc, Wwdbcomb, wwdbdatetimepicker, Wwdbdlg, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, wwDBNavigator,
     Wwdbspin, Wwdotdot, Wwkeycb, wwSpeedButton, Wwtable;
type
   TWCargaApuntes = class(TForm)
      OvcController1:  TOvcController;
      Shape1:          TShape;
      lTitulo:         TLabel;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtGuardar:   TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      QSubcuentas:     TIBSQL;
      SFichero:        TwwDataSource;
      QFichero:        TClientDataSet;
      Paginas:         TOvcNotebook;
      Datos:           TGroupBox;
      Label2:          TLabel;
      lSubcuenta:      TLabel;
      lContrapartida:  TLabel;
      Label7:          TLabel;
      Label8:          TLabel;
      Label4:          TLabel;
      eComentario:     TOvcDbPictureField;
      eSubcuentaCBSUBCUENTA: TwwDBLookupCombo;
      eDescSubcuentaCBDESCSUBCUENTA: TwwDBLookupCombo;
      eContrapartidaCBSUBCUENTA: TwwDBLookupCombo;
      eDescContrapartidaCBDESCSUBCUENTA: TwwDBLookupCombo;
      eImporte:        TOvcDbNumericField;
      eFecha:          TwwDBDateTimePicker;
      GridEdtMovimientos: TwwDBGrid;
      Transaccion:     TIBTransaction;
      SMovimientos:    TDataSource;
      BtnEdtBorrarMovim: TfcImageBtn;
      Label1:          TLabel;
      DBText1:         TDBText;
      QMovimientos:    TIBTableSet;
      QMovimientosASIENTO: TIntegerField;
      QMovimientosAPUNTE: TSmallintField;
      QMovimientosFECHA: TDateTimeField;
      QMovimientosSUBCUENTA: TIBStringField;
      QMovimientosID_CONCEPTOS: TIBStringField;
      QMovimientosDescComentario: TStringField;
      QMovimientosDEBEHABER: TIBStringField;
      QMovimientosIMPORTE: TFloatField;
      QMovimientosCONTRAPARTIDA: TIBStringField;
      QMovimientosCOMENTARIO: TIBStringField;
      QMovimientosNUMEROFACTURA: TIBStringField;
      QMovimientosCUENTA_ANALITICA: TIBStringField;
      QMovimientosDESCCONCEPTO: TIBStringField;
      QMovimientosDESCSUBCUENTA: TIBStringField;
      BtnEdtSalir:     TfcImageBtn;
      BtnEdtSubcuenta: TfcImageBtn;
      Label3:          TLabel;
      NFactura:        TOvcDbPictureField;
      eConcepto:       TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      BtnEdtModificar: TfcImageBtn;
      BtnEdtMayor:     TfcImageBtn;
      PermBtnCalculadora: TSpeedButton;
      QMovimientosABREVIATURA: TIBStringField;
      Label17:         TLabel;
      eAnalitica:      TwwDBLookupCombo;
      eAnaliticaNom:   TwwDBLookupCombo;
      QMovimientosTIPOASIENTO: TIntegerField;
      QMovimientosASIENTONOMINA: TIntegerField;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      QMovimientosEJERCICIO: TIntegerField;
      QMovimientosSERIE: TIBStringField;
      procedure BtnEdtGuardarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure QMovimientosCalcFields(DataSet: TDataSet);
      procedure BtnEdtBorrarMovimClick(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure eSubcuentaCBSUBCUENTACloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure BtnEdtModificarClick(Sender: TObject);
      procedure BtnEdtMayorClick(Sender: TObject);
      procedure PermBtnCalculadoraClick(Sender: TObject);
      procedure ImporteClick(Sender: TObject);
      procedure eSubcuentaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure eContrapartidaCBSUBCUENTANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure GridEdtMovimientosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure eConceptoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
   private
      FColorActual:     TColor;
      FAsientoAnterior: Integer;
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure PrepararQuery;
   public
   end;

var WCargaApuntes: TWCargaApuntes;
implementation
uses DM, DMConta, General, InfMayor, UCalculadora, UCargaAsiento, UCargaRapidaNominas,
     UFiltroMayorSubcuenta, UNuevaSubcuenta, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWCargaApuntes.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('Fecha', ftDate, 0, False);
      Add('ID_CONCEPTOS', ftVarBytes, 3, False);
      Add('IMPORTE', ftFloat, 0, False);
      Add('SUBCUENTA', ftString, 10, False);
      Add('CONTRAPARTIDA', ftString, 10, False);
      Add('COMENTARIO', ftString, 40, False);
      Add('NUMEROFACTURA', ftString, 10, False);
      Add('CUENTA_ANALITICA', ftString, 10, False);

      CreateDataSet;
      Active := True;
      Append;
      FieldByName('Fecha').AsDateTime := Date;
      Post;
   end;

   Modo(Self, Edita);
end;

procedure TWCargaApuntes.InicializarFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Edit;
      FieldByName('Fecha').AsDateTime          := Date;
      FieldByName('IMPORTE').AsFloat           := 0;
      FieldByName('COMENTARIO').AsString       := '';
      FieldByName('CONTRAPARTIDA').AsString    := '';
      FieldByName('SUBCUENTA').AsString        := '';
      FieldByName('ID_CONCEPTOS').AsString     := '';
      FieldByName('NUMEROFACTURA').AsString    := '';
      FieldByName('CUENTA_ANALITICA').AsString := '';
      Post;
   end;
   Paginas.Pages[0].Show;
   eFecha.SetFocus;
end;

procedure TWCargaApuntes.PrepararQuery;
var
   Asiento: Integer;
begin
   Asiento := DMRef.ObtenerValor('GEN_ID(ASIENTO, 0)', 'RDB$DATABASE', '');
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QMovimientos, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT');
      Add('   D.ASIENTO,D.APUNTE,D.FECHA,D.SUBCUENTA,D.ID_CONCEPTOS, D.DEBEHABER,');
      Add('   D.CONTRAPARTIDA,D.COMENTARIO,D.NUMEROFACTURA,D.CUENTA_ANALITICA,D.SERIE, D.EJERCICIO,');
      Add('   C.DESCRIPCION DESCCONCEPTO, S.DESCRIPCION DESCSUBCUENTA,D.IMPORTE,S.ABREVIATURA,');
      Add('   D.TIPOASIENTO, D.ASIENTONOMINA');
      Add('FROM DIARIO D, CONCEPTOS C, SUBCTAS S');
      Add('WHERE');
      Add('   D.ASIENTO >= :ASIENTO1 AND D.ASIENTO <= :ASIENTO2 AND');
      Add('   D.ID_CONCEPTOS = C.ID_CONCEPTOS AND');
      Add('   D.SUBCUENTA = S.SUBCUENTA');
      Add('ORDER BY D.ASIENTO, D.APUNTE');
      Params.ByName('ASIENTO1').AsInteger := Asiento - 30;
      Params.ByName('ASIENTO2').AsInteger := Asiento;
      Prepare;
      EnableControls;
      Open;
      Last;
   end;
end;

procedure TWCargaApuntes.BtnEdtGuardarClick(Sender: TObject);
var
   Msg:      String;
   nAsiento: Integer;
begin
   Paginas.Pages[0].Show;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   // Msg contendrá la información a presentar al usuario sobre los datos
   // que ha de introducir antes de guardar el registro.
   Msg := '';

   if QFichero.FieldByName('FECHA').IsNull then begin
      Msg := Msg + 'No se puede dejar la fecha en blanco.' + #13;
   end
   else
   if not DMContaRef.FechaAsientoPerteneceEjercicio(QFichero.FieldByName('FECHA').AsDateTime) then begin
      if MessageDlg('La fecha de asiento no pertenece al ejercicio actual.' + #13 +
         '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if Empty(QFichero.FieldByName('SUBCUENTA').AsString) then begin
      Msg := Msg + 'No se puede dejar la subcuenta en blanco.' + #13;
   end;

   if RoundToDecimal(QFichero.FieldByName('IMPORTE').AsFloat, 2, True) = 0 then begin
      Msg := Msg + 'No se puede dejar el importe a cero.' + #13;
   end;

   if Empty(QFichero.FieldByName('CONTRAPARTIDA').AsString) then begin
      Msg := Msg + 'No se puede dejar la contrapartida en blanco.' + #13;
   end;

   if Empty(QFichero.FieldByName('ID_CONCEPTOS').AsString) then begin
      Msg := Msg + 'No se puede dejar el concepto en blanco.' + #13;
   end;

   // Si los datos especificados no son válidos, presentar mensaje de error.
   if Trim(Msg) <> '' then begin
      Msg := Msg + 'Por favor, revise los datos de entrada.';
      Paginas.Pages[0].Show;
      eFecha.SetFocus;
      DatabaseError(Msg);
   end;

   nAsiento := DMContaRef.ObtenerNumeroAsiento;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSql.Create(nil), sql do begin
      Close;
      Clear;
      Database := DmRef.IbdSiamcont;
      Add('insert into diario(asiento,apunte,id_conceptos,');
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then begin
         Add('comentario,');
      end;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then begin
         Add('cuenta_analitica,');
      end;
      if not Empty(QFichero.FieldByName('NUMEROFACTURA').AsString) then begin
         Add('numerofactura,');
      end;
      Add(' subcuenta,contrapartida,debehaber,fecha,importe,moneda)');
      Add(' values (:asiento,:apunte,:id_conceptos,');
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then begin
         Add(':comentario,');
      end;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then begin
         Add(':CUENTA_ANALITICA,');
      end;
      if not Empty(QFichero.FieldByName('NUMEROFACTURA').AsString) then begin
         Add(':numerofactura,');
      end;
      Add(' :subcuenta,:contrapartida,:debehaber,:fecha,:importe,:moneda)');

      // Apunte 1
      parambyname('asiento').AsInteger := nAsiento;
      parambyname('apunte').AsInteger  := 1;
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then begin
         parambyname('comentario').AsString :=
            Trim(QFichero.FieldByName('comentario').AsString);
      end;
      parambyname('debehaber').AsString     := 'D';
      parambyname('subcuenta').AsString     := Qfichero.FieldByName('subcuenta').AsString;
      parambyname('contrapartida').AsString := Qfichero.FieldByName('contrapartida').AsString;
      parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
      parambyname('importe').AsFloat        := Qfichero.FieldByName('importe').AsFloat;
      parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
      parambyname('id_conceptos').AsString  := Qfichero.FieldByName('id_conceptos').AsString;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then begin
         parambyname('CUENTA_ANALITICA').AsString :=
            Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
      end;
      if not Empty(QFichero.FieldByName('NUMEROFACTURA').AsString) then begin
         ParamByName('NUMEROFACTURA').AsString := Trim(QFichero.FieldByName('NUMEROFACTURA').AsString);
      end;
      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 1

      // Apunte 2
      parambyname('asiento').AsInteger := nAsiento;
      parambyname('apunte').AsInteger  := 2;
      if not empty(QFichero.FieldByName('COMENTARIO').AsString) then begin
         parambyname('comentario').AsString :=
            Trim(QFichero.FieldByName('comentario').AsString);
      end;
      parambyname('debehaber').AsString     := 'H';
      parambyname('subcuenta').AsString     := Qfichero.FieldByName('contrapartida').AsString;
      parambyname('contrapartida').AsString := Qfichero.FieldByName('subcuenta').AsString;
      parambyname('fecha').AsDateTime       := Qfichero.FieldByName('fecha').AsDateTime;
      parambyname('importe').AsFloat        := Qfichero.FieldByName('importe').AsFloat;
      parambyname('moneda').AsString        := DmREf.QParametros.FieldByName('Moneda').AsString;
      parambyname('id_conceptos').AsString  := Qfichero.FieldByName('id_conceptos').AsString;
      if not empty(QFichero.FieldByName('CUENTA_ANALITICA').AsString) then begin
         parambyname('CUENTA_ANALITICA').AsString :=
            Trim(QFichero.FieldByName('CUENTA_ANALITICA').AsString);
      end;
      if not Empty(QFichero.FieldByName('NUMEROFACTURA').AsString) then begin
         ParamByName('NUMEROFACTURA').AsString := Trim(QFichero.FieldByName('NUMEROFACTURA').AsString);
      end;
      ExecQuery;
      Transaction.CommitRetaining;
      // Final Apunte 2

      Close;
      Free;
   end;

   MessageDlg('Se ha generado el asiento ' + FormatFloat('###,###,###', nAsiento), mtInformation, [mbOK], 0);

   Modo(Self, Edita);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Edit;
      // Se deja la misma fecha que tiene el asiento anterior
      // ya que el usuario puede introducir asientos ordenados
      // por fecha.
      // FieldByName('Fecha').AsDateTime := Date;
      FieldByName('IMPORTE').AsFloat        := 0;
      FieldByName('NUMEROFACTURA').AsString := '';
      Post;
   end;

   PrepararQuery;

   eFecha.SetFocus;
end;

procedure TWCargaApuntes.BtnEdtCancelarClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);
   InicializarFiltro;
end;

procedure TWCargaApuntes.BtnEdtBorrarMovimClick(Sender: TObject);
begin
   if not QMovimientos.IsEmpty then begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then begin
         DatabaseError('No se puede borrar un asiento bloqueado.');
      end;
      if MessageDlg('¿Desea borrar el asiento ' +
                    FormatFloat('###,###,###', QMovimientos.FieldByName('ASIENTO').AsInteger) +
                    ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSql.Create(nil), sql do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            add('delete from diario where asiento=:asiento');
            parambyname('asiento').AsInteger := QMovimientos.FieldByName('asiento').AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;
            Close;
            Free;
         end;
         PrepararQuery;
      end;
   end;

   Paginas.Update;
end;

procedure TWCargaApuntes.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then begin
      //Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then  begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWCargaApuntes.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   Paginas.Pages[0].Show;
   eFecha.SetFocus;
end;

procedure TWCargaApuntes.FormCreate(Sender: TObject);
var
   Pos1: Integer;
begin
   ActivarTransacciones(Self);

   Paginas.Height := 441;
   Paginas.Width  := 742;

   CrearFiltro;

   // Longitud subcuenta
   eSubcuentaCBSUBCUENTA.MaxLength     := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   eContrapartidaCBSUBCUENTA.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   // Búsqueda subcuenta
   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
      Pos1 := eSubcuentaCBSUBCUENTA.Left;
      eDescSubcuentaCBDESCSUBCUENTA.Left := Pos1;
      eDescContrapartidaCBDESCSUBCUENTA.Left := Pos1;
      eSubcuentaCBSUBCUENTA.Left := eSubcuentaCBSUBCUENTA.Left + eDescSubcuentaCBDESCSUBCUENTA.Width;
      eContrapartidaCBSUBCUENTA.Left :=
         eContrapartidaCBSUBCUENTA.Left + eDescContrapartidaCBDESCSUBCUENTA.Width;
      eSubcuentaCBSUBCUENTA.TabStop := False;
      eContrapartidaCBSUBCUENTA.TabStop := False;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QSubcuentas, Sql do begin
      Close;
      Clear;
      Add(' Select contrapartida from subctas');
      Add(' Where Subcuenta=:subcuenta');
      Prepare;
   end;

   PrepararQuery;
end;

procedure TWCargaApuntes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtGuardar.Click;
      end;
      VK_F5: begin
         if (ActiveControl is TwwDBLookupCombo) then begin
            (ActiveControl as TwwDBLookupCombo).DropDown;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            (ActiveControl as TwwDBComboBox).DropDown;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBDateTimePicker) and
            not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) and
            not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBComboBox) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWCargaApuntes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario    := nil;
   WCargaApuntes := nil;
end;

procedure TWCargaApuntes.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCargaApuntes.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCargaApuntes.QMovimientosCalcFields(DataSet: TDataSet);
begin
   QMovimientosDESCCOMENTARIO.AsString :=
         DMContaRef.GetDescripcionApunte(QMovimientosDESCCONCEPTO.AsString,
                                         QMovimientosNUMEROFACTURA.AsString,
                                         QMovimientosSERIE.AsString,
                                         QMovimientosEJERCICIO.AsInteger,
                                         QMovimientosCOMENTARIO.AsString,
                                         QMovimientosABREVIATURA.AsString);
end;

procedure TWCargaApuntes.BtnEdtSalirClick(Sender: TObject);
begin
   // Pasamos al siguiente campo antes de comprobar si se ha modificado el registro.
   Perform(wm_NextDlgCtl, 0, 0);
   if (QFichero.Modified) and (MessageDlg('Ha hecho modificaciones ¿Quiere salir?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
   Close;
end;

procedure TWCargaApuntes.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWCargaApuntes.eSubcuentaCBSUBCUENTACloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   if modified and (not empty(Qfichero.FieldByName('subcuenta').AsString)) then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QSubcuentas do begin
         Close;
         parambyname('subcuenta').AsString := QFichero.FieldByName('subcuenta').AsString;
         ExecQuery;
         if not empty(FieldByName('contrapartida').AsString) then begin
            QFichero.FieldByName('contrapartida').AsString :=
               FieldByName('contrapartida').AsString;
         end;
      end;
   end;
end;

procedure TWCargaApuntes.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;
   WNuevaSubcuenta.ShowModal;
   if WNuevaSubcuenta.FNuevaSubcuenta <> '' then  begin
      if not (QFichero.State in dsEditModes) then begin
         QFichero.Edit;
      end;
      QFichero.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
      if WNuevaSubcuenta.FContrapartidaSubcta <> '' then begin
         QFichero.FieldByName('CONTRAPARTIDA').AsString := WNuevaSubcuenta.FContrapartidaSubcta;
      end;
   end;

   if DMRef.QParametros.FieldByName('BUSQUEDA_SUBCTAS').AsString = 'D' then begin
      eDescSubcuentaCBDESCSUBCUENTA.SetFocus;
   end
   else begin
      eSubcuentaCBSUBCUENTA.SetFocus;
   end;

   WNuevaSubcuenta := nil;
   Paginas.Update;
end;

procedure TWCargaApuntes.BtnEdtModificarClick(Sender: TObject);
var
   Asiento: Integer;
   AsientoNomina, AsientoEmpresa: Integer;
begin
   if not QMovimientos.IsEmpty then  begin
      if DMContaRef.AsientoBloqueado(QMovimientosFECHA.AsDateTime) then begin
         DatabaseError('No se puede modificar un asiento bloqueado.');
      end;

      // ASIENTO DE NÓMINA / SS EMPRESA
      if (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA) or
         (QMovimientosTIPOASIENTO.AsInteger = ASIENTO_SSOCIAL_EMPRESA) then begin
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;

         if QMovimientosTIPOASIENTO.AsInteger = ASIENTO_NOMINA then begin
            AsientoNomina  := QMovimientosASIENTO.AsInteger;
            AsientoEmpresa := QMovimientosASIENTONOMINA.AsInteger;
         end
         else begin
            AsientoEmpresa := QMovimientosASIENTO.AsInteger;
            AsientoNomina  := QMovimientosASIENTONOMINA.AsInteger;
         end;

         if not Assigned(WCargaRapidaNominas) then begin
            WCargaRapidaNominas := TWCargaRapidaNominas.Create(nil);
         end;

         WCargaRapidaNominas.FModoArranque   := Modificacion;
         WCargaRapidaNominas.FAsientoNomina  := AsientoNomina;
         WCargaRapidaNominas.FAsientoEmpresa := AsientoEmpresa;

         WCargaRapidaNominas.ShowModal;
      end

      else begin
         if not Assigned(WCargaAsiento) then begin
            WCargaAsiento := TWCargaAsiento.Create(nil);
         end;

         WCargaAsiento.FModoArranque := Modificacion;
         Asiento := QMovimientos.FieldByName('ASIENTO').AsInteger;
         WCargaAsiento.FAsiento := Asiento;
         WCargaAsiento.ShowModal;
      end;

      PrepararQuery;

      QMovimientos.DisableControls;
      QMovimientos.First;
      while not QMovimientos.EOF do begin
         if QMovimientos.FieldByName('ASIENTO').AsInteger = Asiento then begin
            Break;
         end;
         QMovimientos.Next;
      end;
      QMovimientos.EnableControls;
   end;

   Paginas.Update;
end;

procedure TWCargaApuntes.BtnEdtMayorClick(Sender: TObject);
begin
   if DMRef.QParametros.FieldByName('MOSTRAR_FILTRO_MAYOR').AsString = 'S' then  begin
      if not Assigned(WFiltroMayorSubcuenta) then begin
         WFiltroMayorSubcuenta := TWFiltroMayorSubcuenta.Create(nil);
      end;
      WFiltroMayorSubcuenta.FSubcuenta := QMovimientosSUBCUENTA.AsString;
      WFiltroMayorSubcuenta.ShowModal;
      WFiltroMayorSubcuenta := nil;
   end
   else begin
      // Primero vaciar el fichero
      DMContaRef.QInformesConta.EmptyDataset;

      PonerTipoConta('T');

      LanzarInfMayor(True, False,
         QMovimientosSUBCUENTA.AsString, QMovimientosSUBCUENTA.AsString,
         '', '', DMRef.QParametros.FieldByName('FECHA_INICIO_EJERCICIO').AsDateTime,
         DMRef.QParametros.FieldByName('FECHA_FIN_EJERCICIO').AsDateTime, Date, 'T',
         '', '', '', '', '', '', DMRef.QParametros.FieldByName('MONEDA').AsString, '', '');
   end;

   Paginas.Update;
end;

procedure TWCargaApuntes.PermBtnCalculadoraClick(Sender: TObject);
begin
   if not Assigned(WCalculadora) then begin
      WCalculadora := TWCalculadora.Create(nil);
   end;
   if WCalculadora.ShowModal = mrOk then  begin
      if not (QFichero.State in dsEditModes) then begin
         QFichero.Edit;
      end;
      QFichero.FieldByName('IMPORTE').AsFloat := WCalculadora.Importe;
      eImporte.SetFocus;
   end;
end;

procedure TWCargaApuntes.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCargaApuntes.eSubcuentaCBSUBCUENTANotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         eSubcuentaCBSUBCUENTA.SetFocus;
         Exit;
      end;

      if (MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
         if not Assigned(WNuevaSubcuenta) then begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then begin
            if not (QFichero.State in dsEditModes) then begin
               QFichero.Edit;
            end;
            QFichero.FieldByName('SUBCUENTA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            if WNuevaSubcuenta.FContrapartidaSubcta <> '' then begin
               QFichero.FieldByName('CONTRAPARTIDA').AsString := WNuevaSubcuenta.FContrapartidaSubcta;
            end;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eSubcuentaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaApuntes.eContrapartidaCBSUBCUENTANotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         eContrapartidaCBSUBCUENTA.SetFocus;
         Exit;
      end;

      if (MessageDlg('Subcuenta inexistente ¿Desea añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
         if not Assigned(WNuevaSubcuenta) then begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then begin
            if not (QFichero.State in dsEditModes) then begin
               QFichero.Edit;
            end;
            QFichero.FieldByName('CONTRAPARTIDA').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
         Paginas.Update;
      end;
      eContrapartidaCBSUBCUENTA.SetFocus;
   end;
end;

procedure TWCargaApuntes.GridEdtMovimientosMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
begin
   FAsientoAnterior := QMovimientosASIENTO.AsInteger;
   GridEdtMovimientos.Refresh;
end;

procedure TWCargaApuntes.GridEdtMovimientosCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if QMovimientosASIENTO.AsInteger <> FAsientoAnterior then  begin
      FAsientoAnterior := QMovimientosASIENTO.AsInteger;
      if FColorActual = COLOR_ASIENTO1 then begin
         FColorActual := COLOR_ASIENTO2;
      end
      else begin
         FColorActual := COLOR_ASIENTO1;
      end;
   end;
   if State * [gdFixed, gdSelected] = [] then begin
      ABrush.Color := FColorActual;
   end;
end;

procedure TWCargaApuntes.eConceptoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
   modified: Boolean);
begin
   if modified and (QFichero.FieldByName('ID_CONCEPTOS').AsString <> '') and
      (QFichero.FieldByName('SUBCUENTA').AsString = '') and
      (QFichero.FieldByName('CONTRAPARTIDA').AsString = '') then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT SUBCUENTA, CONTRAPARTIDA FROM CONCEPTOS');
         Add('WHERE ID_CONCEPTOS = :ID_CONCEPTOS');
         ParamByName('ID_CONCEPTOS').AsString := QFichero.FieldByName('ID_CONCEPTOS').AsString;
         Open;
         if not EOF then begin
            if not (QFichero.State in dsEditModes) then begin
               QFichero.Edit;
            end;
            if FieldByName('SUBCUENTA').AsString <> '' then begin
               QFichero.FieldByName('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
            end;
            if FieldByName('CONTRAPARTIDA').AsString <> '' then begin
               QFichero.FieldByName('CONTRAPARTIDA').AsString := FieldByName('CONTRAPARTIDA').AsString;
            end;
         end;
         Close;
         Free;
      end;
   end;
end;

end.
