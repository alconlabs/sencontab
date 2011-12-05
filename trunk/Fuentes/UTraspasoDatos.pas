unit UTraspasoDatos;
interface
uses Buttons, Classes, comctrls, Controls, Db, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton,
     fcImage, fcimageform, fcImgBtn, fcpanel, Forms, Graphics, IBCustomDataSet, IBDatabase, IBQuery,
     IBSQL, Mask, Messages, OvcBase, OvcCmbx, OvcDbNF, OvcDbPF, OvcDrCbx, OvcEF, OvcNF, OvcPB, OvcPF,
     StdCtrls, STSTRS, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot;

type
   TWTraspasoDatos = class(TForm)
      Panel5:         TPanel;
      Panel4:         TPanel;
      Panel3:         TPanel;
      lTitulo:        TLabel;
      Shape1:         TShape;
      GroupBox1:      TfcGroupBox;
      BtnEdtAceptar:  TfcImageBtn;
      BtnEdtSalir:    TfcImageBtn;
      OvcController1: TOvcController;
      fcIBCerrar:     TfcImageBtn;
      Label5:         TLabel;
      GroupBox2:      TfcGroupBox;
      cbPaises:       TCheckBox;
      cbProvincias:   TCheckBox;
      GroupBox3:      TfcGroupBox;
      cbTitulos:      TCheckBox;
      cbSubcuentas:   TCheckBox;
      cbGrupos:       TCheckBox;
      cbCuentas:      TCheckBox;
      cbDatos:        TCheckBox;
      cbAmortizacion: TCheckBox;
      cbCartera:      TCheckBox;
      cbDiario:       TCheckBox;
      cbConceptos:    TCheckBox;
      Directorio:     TOvcDirectoryComboBox;
      Fichero:        TTable;
      QAux:           TIBSQL;
      QChequeo:       TIBSQL;
      Memo1:          TMemo;
      Label1:         TLabel;
      QChequeo1:      TIBSQL;
      QInsertar:      TIBSQL;
      cbAnalitica:    TCheckBox;
      cbDiarioJL:     TCheckBox;
      cbInicio:       TCheckBox;
      BtnEdtImprimir: TfcImageBtn;
      QFichero:       TClientDataSet;
      SFichero:       TDataSource;
      cbSubctaAcum:   TCheckBox;
      cbCuentasAcum:  TCheckBox;
      fcGroupBox1:    TfcGroupBox;
      Label24:        TLabel;
      Label25:        TLabel;
      Label2:         TLabel;
      Label7:         TLabel;
      FiltroBaseDesde: TOvcDbNumericField;
      FiltroBaseHasta: TOvcDbNumericField;
      FiltroFechaFacturaDesde: TwwDBDateTimePicker;
      FiltroFechaFacturaHasta: TwwDBDateTimePicker;
      cbActivarFiltro: TCheckBox;
      QFicherodescripcion: TStringField;
      QFicherofecha1: TDateTimeField;
      QFicherofecha2: TDateTimeField;
      QFicheroasiento1: TIntegerField;
      QFicheroasiento2: TIntegerField;
      cbDos:          TCheckBox;
      Panel1:         TPanel;
      cbDiarsa:       TCheckBox;
      dbDiarsa:       TIBDatabase;
      TrDiarsa:       TIBTransaction;
      ConexionDiarsa: TEdit;
      Formulario:     TfcImageForm;
      QChequeo2:      TIBSQL;
      QAuxD:          TIBQuery;
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure BtnEdtImprimirClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
   public
   end;

var WTraspasoDatos: TWTraspasoDatos;

implementation
uses DM, DMConta, Globales, MenuPrincipal, XpROCS, General;
{$R *.DFM}

procedure TWTraspasoDatos.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWTraspasoDatos.BtnEdtAceptarClick(Sender: TObject);
var
   cAux, cGrupo1, cGrupo2, cPais, cProvincia, cContrapartida, cDocumento: String;
   nDocumento, nAsiento, i: Integer;
   cNif, cNifCopia:         String;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);
   if QFichero.state in dseditmodes then begin
      QFichero.Post;
   end;
   nDocumento := 0;
   cDocumento := 'siam2003';

   Fichero.DataBaseName := Directorio.directory;

   if cbDiarsa.Checked then  begin
      DBDiarsa.connected := False;
      TrDiarsa.active    := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with DbDiarsa, params do begin
         Clear;
         add('user_name=SYSDBA');
         add('password=masterkey');
         DatabaseName := ConexionDiarsa.Text;
         connected    := True;
      end;
      TrDiarsa.active := True;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, Sql do begin
         Close;
         Clear;
         Database    := Dbdiarsa;
         Transaction := TrDiarsa;
         Add('Update subctas set descripcion=:descripcion');
         Add('where subcuenta=:subcuenta');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TibSql.Create(nil), sql do begin
         Close;
         Clear;
         Database := DBDiarsa;
         Add('Select nomfiscal,subcta from clientes');
         Add('order by subcta');
         ExecQuery;
         while not EOF do begin
            if (FieldByName('subcta').AsString <> '') then   begin
               QAux.Close;
               QAux.params.byname('descripcion').AsString := FieldByName('nomfiscal').AsString;
               QAux.params.byname('subcuenta').AsString   := FieldByName('subcta').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end;
            Next;
         end;
         Close;
         Free;
      end;
      cbDiarsa.Checked := False;
      ShowMessage('Proceso finalizado');
      Exit;
   end;

   if cbInicio.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TibSql.Create(nil), sql do begin
         Close;
         Clear;
         Database := QAux.Database;
         Add('Execute procedure Inicializar_BD');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Free;
      end;
      cbInicio.Checked := False;
   end;

   // Fichero Provincias
   if cbProvincias.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from provincias');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add('Insert INTO PROVINCIAS(PROVINCIA,NOMBRE,CODIGO) ');
         Add(' VALUES (:PROVINCIA,:Nombre,:CODIGO)');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'provinci';
         Open;
         while not EOF do begin
            QAux.Params.byname('provincia').AsString := FieldByName('provincia').AsString;
            QAux.Params.byname('nombre').AsString    := FieldByName('nombre').AsString;
            QAux.Params.byname('codigo').AsString    := FieldByName('codigo').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbProvincias.Checked := False;
   end;

   // Fichero Paises
   if cbPaises.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from paises');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add('Insert INTO PAISES(PAIS,NOMBRE) ');
         Add(' VALUES (:PAIS,:Nombre)');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'pais';
         Open;
         while not EOF do begin
            QAux.Params.byname('pais').AsString   := FieldByName('pais').AsString;
            QAux.Params.byname('nombre').AsString := FieldByName('nombre').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbPaises.Checked := False;
   end;

   // Fichero Titulos
   if cbTitulos.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from titulos');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add(' INSERT INTO TITULOS (TITULO,DESCRIPCION,RESTA1,RESTA2,RESTA3,RESTA4,RESTA5,');
         Add(' RESTA6,SUMA1,SUMA2,SUMA3,SUMA4,SUMA5,SUMA6) ');
         Add(' VALUES (:TITULO,:DESCRIPCION,:RESTA1,:RESTA2,:RESTA3,:RESTA4,:RESTA5,');
         Add(' :RESTA6,:SUMA1,:SUMA2,:SUMA3,:SUMA4,:SUMA5,:SUMA6) ');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         if cbDos.Checked then begin
            Tablename := 'c_Titulo.dbf';
         end
         else begin
            Tablename := 'TITULOS';
         end;
         Open;
         while not EOF do begin
            QAux.Params.byname('TITULO').AsString := FieldByName('TITULO').AsString;
            if cbDos.Checked then   begin
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIBE').AsString;
            end
            else begin
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIPCION').AsString;
            end;
            QAux.Params.byname('RESTA1').AsString := FieldByName('RESTA1').AsString;
            QAux.Params.byname('RESTA2').AsString := FieldByName('RESTA2').AsString;
            QAux.Params.byname('RESTA3').AsString := FieldByName('RESTA3').AsString;
            QAux.Params.byname('RESTA4').AsString := FieldByName('RESTA4').AsString;
            QAux.Params.byname('RESTA5').AsString := FieldByName('RESTA5').AsString;
            QAux.Params.byname('RESTA6').AsString := FieldByName('RESTA6').AsString;
            QAux.Params.byname('SUMA1').AsString  := FieldByName('SUMA1').AsString;
            QAux.Params.byname('SUMA2').AsString  := FieldByName('SUMA2').AsString;
            QAux.Params.byname('SUMA3').AsString  := FieldByName('SUMA3').AsString;
            QAux.Params.byname('SUMA4').AsString  := FieldByName('SUMA4').AsString;
            QAux.Params.byname('SUMA5').AsString  := FieldByName('SUMA5').AsString;
            QAux.Params.byname('SUMA6').AsString  := FieldByName('SUMA6').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbTitulos.Checked := False;
   end;

   // Fichero Grupos
   if cbGrupos.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from grupos');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add(' INSERT INTO GRUPOS (GRUPO,DESCRIPCION)');
         Add(' VALUES (:GRUPO,:DESCRIPCION)');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         if cbDos.Checked then begin
            Tablename := 'c_grupo.dbf';
         end
         else begin
            Tablename := 'GRUPOS';
         end;
         Open;
         while not EOF do begin
            QAux.Params.byname('GRUPO').AsString := FieldByName('GRUPO').AsString;
            if cbDos.Checked then   begin
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIBE').AsString;
            end
            else begin
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIPCION').AsString;
            end;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbGrupos.Checked := False;
   end;

   // Fichero Cuentas
   if cbCuentas.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from cuentas');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add(' INSERT INTO CUENTAS (CUENTA,ACUDB01,ACUDB02,ACUDB03,ACUDB04,ACUDB05,');
         Add(' ACUDB06,ACUDB07,ACUDB08,ACUDB09,ACUDB10,ACUDB11,ACUDB12,ACUHB01,ACUHB02,');
         Add(' ACUHB03,ACUHB04,ACUHB05,ACUHB06,ACUHB07,ACUHB08,ACUHB09,ACUHB10,ACUHB11,');
         Add(' ACUHB12,ANTDB01,ANTDB02,ANTDB03,ANTDB04,ANTDB05,ANTDB06,ANTDB07,ANTDB08,');
         Add(' ANTDB09,ANTDB10,ANTDB11,ANTDB12,ANTHB01,ANTHB02,ANTHB03,ANTHB04,ANTHB05,');
         Add(' ANTHB06,ANTHB07,ANTHB08,ANTHB09,ANTHB10,ANTHB11,ANTHB12,ANTHB,ANTDB,');
         Add(' DESCRIPCION,SUMADB,SUMAHB,TIPOCUENTA) ');
         Add(' VALUES (:CUENTA,:ACUDB01,:ACUDB02,:ACUDB03,:ACUDB04,:ACUDB05,');
         Add(' :ACUDB06,:ACUDB07,:ACUDB08,:ACUDB09,:ACUDB10,:ACUDB11,:ACUDB12,:ACUHB01,:ACUHB02,');
         Add(' :ACUHB03,:ACUHB04,:ACUHB05,:ACUHB06,:ACUHB07,:ACUHB08,:ACUHB09,:ACUHB10,:ACUHB11,');
         Add(' :ACUHB12,:ANTDB01,:ANTDB02,:ANTDB03,:ANTDB04,:ANTDB05,:ANTDB06,:ANTDB07,:ANTDB08,');
         Add(' :ANTDB09,:ANTDB10,:ANTDB11,:ANTDB12,:ANTHB01,:ANTHB02,:ANTHB03,:ANTHB04,:ANTHB05,');
         Add(' :ANTHB06,:ANTHB07,:ANTHB08,:ANTHB09,:ANTHB10,:ANTHB11,:ANTHB12,:ANTHB,:ANTDB,');
         Add(' :DESCRIPCION,:SUMADB,:SUMAHB,:TIPOCUENTA) ');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from grupos where grupo=:grupo');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo1, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from titulos where titulo=:titulo');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         if cbDos.Checked then begin
            Tablename := 'c_cuenta.dbf';
         end
         else begin
            Tablename := 'CUENTAS';
         end;
         Open;
         while not EOF do begin
            if cbDos.Checked then   begin
               QAux.Params.byname('CUENTA').AsString      := FieldByName('codigo').AsString;
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIBE').AsString;
               QAux.Params.byname('TIPOCUENTA').AsString  := '';
            end
            else begin
               QAux.Params.byname('CUENTA').AsString      := FieldByName('CUENTA').AsString;
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIPCION').AsString;
               QAux.Params.byname('TIPOCUENTA').AsString  := FieldByName('TIPOCUENTA').AsString;
               QAux.Params.byname('ACUDB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB01').AsFloat, 2, True);
               QAux.Params.byname('ACUDB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB02').AsFloat, 2, True);
               QAux.Params.byname('ACUDB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB03').AsFloat, 2, True);
               QAux.Params.byname('ACUDB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB04').AsFloat, 2, True);
               QAux.Params.byname('ACUDB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB05').AsFloat, 2, True);
               QAux.Params.byname('ACUDB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB06').AsFloat, 2, True);
               QAux.Params.byname('ACUDB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB07').AsFloat, 2, True);
               QAux.Params.byname('ACUDB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB08').AsFloat, 2, True);
               QAux.Params.byname('ACUDB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB09').AsFloat, 2, True);
               QAux.Params.byname('ACUDB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB10').AsFloat, 2, True);
               QAux.Params.byname('ACUDB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB11').AsFloat, 2, True);
               QAux.Params.byname('ACUDB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB12').AsFloat, 2, True);
               QAux.Params.byname('SUMADB').AsFloat       :=
                  RoundToDecimal(FieldByName('SUMADB').AsFloat, 2, True);
               QAux.Params.byname('ACUHB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB01').AsFloat, 2, True);
               QAux.Params.byname('ACUHB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB02').AsFloat, 2, True);
               QAux.Params.byname('ACUHB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB03').AsFloat, 2, True);
               QAux.Params.byname('ACUHB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB04').AsFloat, 2, True);
               QAux.Params.byname('ACUHB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB05').AsFloat, 2, True);
               QAux.Params.byname('ACUHB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB06').AsFloat, 2, True);
               QAux.Params.byname('ACUHB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB07').AsFloat, 2, True);
               QAux.Params.byname('ACUHB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB08').AsFloat, 2, True);
               QAux.Params.byname('ACUHB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB09').AsFloat, 2, True);
               QAux.Params.byname('ACUHB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB10').AsFloat, 2, True);
               QAux.Params.byname('ACUHB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB11').AsFloat, 2, True);
               QAux.Params.byname('ACUHB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB12').AsFloat, 2, True);
               QAux.Params.byname('SUMAHB').AsFloat       :=
                  RoundToDecimal(FieldByName('SUMAHB').AsFloat, 2, True);
               QAux.Params.byname('ANTDB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB01').AsFloat, 2, True);
               QAux.Params.byname('ANTDB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB02').AsFloat, 2, True);
               QAux.Params.byname('ANTDB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB03').AsFloat, 2, True);
               QAux.Params.byname('ANTDB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB04').AsFloat, 2, True);
               QAux.Params.byname('ANTDB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB05').AsFloat, 2, True);
               QAux.Params.byname('ANTDB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB06').AsFloat, 2, True);
               QAux.Params.byname('ANTDB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB07').AsFloat, 2, True);
               QAux.Params.byname('ANTDB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB08').AsFloat, 2, True);
               QAux.Params.byname('ANTDB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB09').AsFloat, 2, True);
               QAux.Params.byname('ANTDB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB10').AsFloat, 2, True);
               QAux.Params.byname('ANTDB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB11').AsFloat, 2, True);
               QAux.Params.byname('ANTDB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB12').AsFloat, 2, True);
               QAux.Params.byname('ANTDB').AsFloat        :=
                  RoundToDecimal(FieldByName('ANTDB').AsFloat, 2, True);
               QAux.Params.byname('ANTHB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB01').AsFloat, 2, True);
               QAux.Params.byname('ANTHB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB02').AsFloat, 2, True);
               QAux.Params.byname('ANTHB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB03').AsFloat, 2, True);
               QAux.Params.byname('ANTHB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB04').AsFloat, 2, True);
               QAux.Params.byname('ANTHB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB05').AsFloat, 2, True);
               QAux.Params.byname('ANTHB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB06').AsFloat, 2, True);
               QAux.Params.byname('ANTHB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB07').AsFloat, 2, True);
               QAux.Params.byname('ANTHB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB08').AsFloat, 2, True);
               QAux.Params.byname('ANTHB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB09').AsFloat, 2, True);
               QAux.Params.byname('ANTHB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB10').AsFloat, 2, True);
               QAux.Params.byname('ANTHB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB11').AsFloat, 2, True);
               QAux.Params.byname('ANTHB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB12').AsFloat, 2, True);
               QAux.Params.byname('ANTHB').AsFloat        :=
                  RoundToDecimal(FieldByName('ANTHB').AsFloat, 2, True);
            end;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         First;
         while not EOF do begin
            // Antes de dar de alta verificar si existe el grupo1 y 2 en grupos
            cGrupo1 := FieldByName('grupo1').AsString;
            if cGrupo1 <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('grupo').AsString := cgrupo1;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into grupos(grupo,descripcion) ');
                  QInsertar.Sql.Add(' Values(:grupo,:descripcion) ');
                  QInsertar.ParamByName('grupo').AsString       := FieldByName('grupo1').AsString;
                  QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  if cbDos.Checked then   begin
                     Memo1.Lines.Add('Cuenta: ' + FieldByName('codigo').AsString +
                        '. El grupo1 ' + FieldByName('grupo1').AsString + ' no existe, se crea.');
                  end
                  else begin
                     Memo1.Lines.Add('Cuenta: ' + FieldByName('cuenta').AsString +
                        '. El grupo1 ' + FieldByName('grupo1').AsString + ' no existe, se crea.');
                  end;

                  // Chequear si existe el titulo
                  QChequeo1.Close;
                  QChequeo1.params.byname('titulo').AsString := Copy(Trim(cgrupo1), 1, 2);
                  QChequeo1.execquery;
                  if not (QChequeo1.FieldByName('cuantos').AsInteger > 0) then   begin
                     QInsertar.Close;
                     QInsertar.Sql.Clear;
                     QInsertar.Sql.Add('Insert into titulos(titulo,descripcion) ');
                     QInsertar.Sql.Add(' Values(:titulo,:descripcion) ');
                     QInsertar.ParamByName('titulo').AsString      :=
                        Copy(Trim(FieldByName('grupo1').AsString), 1, 2);
                     QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                     QInsertar.ExecQuery;
                     QInsertar.Transaction.Commitretaining;
                     if cbDos.Checked then   begin
                        Memo1.Lines.Add('Cuenta: ' + FieldByName('codigo').AsString +
                           '. El titulo ' + Copy(Trim(FieldByName('grupo1').AsString), 1, 2) +
                           ' no existe, se crea.');
                     end
                     else begin
                        Memo1.Lines.Add('Cuenta: ' + FieldByName('cuenta').AsString +
                           '. El titulo ' + Copy(Trim(FieldByName('grupo1').AsString), 1, 2) +
                           ' no existe, se crea.');
                     end;
                  end;
               end;
            end;

            cGrupo2 := FieldByName('grupo2').AsString;
            if cGrupo2 <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('grupo').AsString := cgrupo2;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into grupos(grupo,descripcion) ');
                  QInsertar.Sql.Add(' Values(:grupo,:descripcion) ');
                  QInsertar.ParamByName('grupo').AsString       := FieldByName('grupo2').AsString;
                  QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  if cbDos.Checked then   begin
                     Memo1.Lines.Add('Cuenta: ' + FieldByName('codigo').AsString +
                        '. El grupo2 ' + FieldByName('grupo2').AsString + ' no existe, se crea.');
                  end
                  else begin
                     Memo1.Lines.Add('Cuenta: ' + FieldByName('cuenta').AsString +
                        '. El grupo2 ' + FieldByName('grupo2').AsString + ' no existe, se crea.');
                  end;
                  // Chequear si existe el titulo
                  QChequeo1.Close;
                  QChequeo1.params.byname('titulo').AsString := Copy(Trim(cgrupo1), 1, 2);
                  QChequeo1.execquery;
                  if not (QChequeo1.FieldByName('cuantos').AsInteger > 0) then   begin
                     QInsertar.Close;
                     QInsertar.Sql.Clear;
                     QInsertar.Sql.Add('Insert into titulos(titulo,descripcion) ');
                     QInsertar.Sql.Add(' Values(:titulo,:descripcion) ');
                     QInsertar.ParamByName('titulo').AsString      :=
                        Copy(Trim(FieldByName('grupo1').AsString), 1, 2);
                     QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                     QInsertar.ExecQuery;
                     QInsertar.Transaction.Commitretaining;
                     if cbDos.Checked then   begin
                        Memo1.Lines.Add('Cuenta: ' + FieldByName('codigo').AsString +
                           '. El titulo ' + Copy(Trim(FieldByName('grupo1').AsString), 1, 2) +
                           ' no existe, se crea.');
                     end
                     else begin
                        Memo1.Lines.Add('Cuenta: ' + FieldByName('cuenta').AsString +
                           '. El titulo ' + Copy(Trim(FieldByName('grupo1').AsString), 1, 2) +
                           ' no existe, se crea.');
                     end;
                  end;
               end;
            end;

            if (cGrupo1 <> '') and (cGrupo2 = '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update cuentas set grupo1=:grupo1');
               QAux.sql.Add('where cuenta=:cuenta');
               if cbDos.Checked then   begin
                  QAux.params.byname('cuenta').AsString := FieldByName('codigo').AsString;
               end
               else begin
                  QAux.params.byname('cuenta').AsString := FieldByName('cuenta').AsString;
               end;
               QAux.params.byname('grupo1').AsString := FieldByName('grupo1').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end
            else
            if (cGrupo1 = '') and (cGrupo2 <> '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update cuentas set grupo2=:grupo2');
               QAux.sql.Add('where cuenta=:cuenta');
               if cbDos.Checked then   begin
                  QAux.params.byname('cuenta').AsString := FieldByName('codigo').AsString;
               end
               else begin
                  QAux.params.byname('cuenta').AsString := FieldByName('cuenta').AsString;
               end;
               QAux.params.byname('grupo2').AsString := FieldByName('grupo2').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end
            else
            if (cGrupo1 <> '') and (cGrupo2 <> '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update cuentas set grupo1=:grupo1,grupo2=:grupo2');
               QAux.sql.Add('where cuenta=:cuenta');
               if cbDos.Checked then   begin
                  QAux.params.byname('cuenta').AsString := FieldByName('codigo').AsString;
               end
               else begin
                  QAux.params.byname('cuenta').AsString := FieldByName('cuenta').AsString;
               end;
               QAux.params.byname('grupo1').AsString := FieldByName('grupo1').AsString;
               QAux.params.byname('grupo2').AsString := FieldByName('grupo2').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end;
            Next;
         end;
         Close;
      end;
      cbCuentas.Checked := False;
   end;

   // Fichero Cuentas - Actualizar solo saldos acumulados año anterior
   if cbCuentasAcum.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Clear;
         Add(' UPDATE CUENTAS SET ');
         Add(' ANTDB01=:ANTDB01,ANTDB02=:ANTDB02,ANTDB03=:ANTDB03,ANTDB04=:ANTDB04,ANTDB05=:ANTDB05,');
         Add(' ANTDB06=:ANTDB06,ANTDB07=:ANTDB07,ANTDB08=:ANTDB08,ANTDB09=:ANTDB09,ANTDB10=:ANTDB10,');
         Add(' ANTDB11=:ANTDB11,ANTDB12=:ANTDB12,ANTHB01=:ANTHB01,ANTHB02=:ANTHB02,ANTHB03=:ANTHB03,');
         Add(' ANTHB04=:ANTHB04,ANTHB05=:ANTHB05,ANTHB06=:ANTHB06,ANTHB07=:ANTHB07,ANTHB08=:ANTHB08,');
         Add(' ANTHB09=:ANTHB09,ANTHB10=:ANTHB10,ANTHB11=:ANTHB11,ANTHB12=:ANTHB12,ANTHB=:ANTHB,ANTDB=:ANTDB');
         Add(' WHERE CUENTA=:CUENTA');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'CUENTAS';
         Open;
         while not EOF do begin
            QAux.Params.byname('CUENTA').AsString := FieldByName('CUENTA').AsString;
            QAux.Params.byname('ANTDB01').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB01').AsFloat, 2, True);
            QAux.Params.byname('ANTDB02').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB02').AsFloat, 2, True);
            QAux.Params.byname('ANTDB03').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB03').AsFloat, 2, True);
            QAux.Params.byname('ANTDB04').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB04').AsFloat, 2, True);
            QAux.Params.byname('ANTDB05').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB05').AsFloat, 2, True);
            QAux.Params.byname('ANTDB06').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB06').AsFloat, 2, True);
            QAux.Params.byname('ANTDB07').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB07').AsFloat, 2, True);
            QAux.Params.byname('ANTDB08').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB08').AsFloat, 2, True);
            QAux.Params.byname('ANTDB09').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB09').AsFloat, 2, True);
            QAux.Params.byname('ANTDB10').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB10').AsFloat, 2, True);
            QAux.Params.byname('ANTDB11').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB11').AsFloat, 2, True);
            QAux.Params.byname('ANTDB12').AsFloat :=
               RoundToDecimal(FieldByName('ACUDB12').AsFloat, 2, True);
            QAux.Params.byname('ANTDB').AsFloat   :=
               RoundToDecimal(FieldByName('SUMADB').AsFloat, 2, True);
            QAux.Params.byname('ANTHB01').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB01').AsFloat, 2, True);
            QAux.Params.byname('ANTHB02').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB02').AsFloat, 2, True);
            QAux.Params.byname('ANTHB03').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB03').AsFloat, 2, True);
            QAux.Params.byname('ANTHB04').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB04').AsFloat, 2, True);
            QAux.Params.byname('ANTHB05').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB05').AsFloat, 2, True);
            QAux.Params.byname('ANTHB06').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB06').AsFloat, 2, True);
            QAux.Params.byname('ANTHB07').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB07').AsFloat, 2, True);
            QAux.Params.byname('ANTHB08').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB08').AsFloat, 2, True);
            QAux.Params.byname('ANTHB09').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB09').AsFloat, 2, True);
            QAux.Params.byname('ANTHB10').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB10').AsFloat, 2, True);
            QAux.Params.byname('ANTHB11').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB11').AsFloat, 2, True);
            QAux.Params.byname('ANTHB12').AsFloat :=
               RoundToDecimal(FieldByName('ACUHB12').AsFloat, 2, True);
            QAux.Params.byname('ANTHB').AsFloat   :=
               RoundToDecimal(FieldByName('SUMAHB').AsFloat, 2, True);
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
      end;
      cbCuentasAcum.Checked := False;
   end;

   // Fichero SubCuentas
   if cbSubCuentas.Checked then  begin
     {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from subctas');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from provincias where provincia=:provincia');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo1, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from paises where pais=:pais');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         if cbDos.Checked then begin
            Tablename := 'c_subcta.dbf';
         end
         else begin
            Tablename := 'SUBCTAS';
         end;
         Open;
         while not EOF do begin
            QAux.Close;
            QAux.SQL.Clear;
            QAux.Sql.Add(' INSERT INTO SUBCTAS (ACUDB01,ACUDB02,ACUDB03,ACUDB04,ACUDB05,ACUDB06,');
            QAux.Sql.Add(' ACUDB07,ACUDB08,ACUDB09,ACUDB10,ACUDB11,ACUDB12,ACUHB01,ACUHB02,');
            QAux.Sql.Add(' ACUHB03,ACUHB04,ACUHB05,ACUHB06,ACUHB07,ACUHB08,ACUHB09,ACUHB10,');
            QAux.Sql.Add(' ACUHB11,ACUHB12,ANTDB,ANTDB01,ANTDB02,ANTDB03,ANTDB04,ANTDB05,');
            QAux.Sql.Add(' ANTDB06,ANTDB07,ANTDB08,ANTDB09,ANTDB10,ANTDB11,ANTDB12,ANTHB,');
            QAux.Sql.Add(' ANTHB01,ANTHB02,ANTHB03,ANTHB04,ANTHB05,ANTHB06,ANTHB07,ANTHB08,');
            QAux.Sql.Add(' ANTHB09,ANTHB10,ANTHB11,ANTHB12,ARRENDADOR,');
            QAux.Sql.Add(' DESCRIPCION,DIRECCION,FAX,IVA,PROFESIONAL,RECARGO,SUBCUENTA,');
            QAux.SQL.Add(' SUMADB,SUMAHB,TELEFONO,TIPOIVA,NIF,CODPOSTAL,POBLACION,');
            QAux.Sql.Add(' NUMERO,OBSOLETO) ');
            QAux.Sql.Add(' VALUES (:ACUDB01,:ACUDB02,:ACUDB03,:ACUDB04,:ACUDB05,:ACUDB06,');
            QAux.Sql.Add(' :ACUDB07,:ACUDB08,:ACUDB09,:ACUDB10,:ACUDB11,:ACUDB12,:ACUHB01,:ACUHB02,');
            QAux.Sql.Add(' :ACUHB03,:ACUHB04,:ACUHB05,:ACUHB06,:ACUHB07,:ACUHB08,:ACUHB09,:ACUHB10,');
            QAux.Sql.Add(' :ACUHB11,:ACUHB12,:ANTDB,:ANTDB01,:ANTDB02,:ANTDB03,:ANTDB04,:ANTDB05,');
            QAux.Sql.Add(' :ANTDB06,:ANTDB07,:ANTDB08,:ANTDB09,:ANTDB10,:ANTDB11,:ANTDB12,:ANTHB,');
            QAux.Sql.Add(' :ANTHB01,:ANTHB02,:ANTHB03,:ANTHB04,:ANTHB05,:ANTHB06,:ANTHB07,:ANTHB08,');
            QAux.Sql.Add(' :ANTHB09,:ANTHB10,:ANTHB11,:ANTHB12,:ARRENDADOR,');
            QAux.Sql.Add(' :DESCRIPCION,:DIRECCION,:FAX,:IVA,:PROFESIONAL,:RECARGO,:SUBCUENTA,');
            QAux.Sql.Add(' :SUMADB,:SUMAHB,:TELEFONO,:TIPOIVA,:NIF,:CODPOSTAL,:POBLACION,');
            QAux.Sql.Add(' :NUMERO,"N") ');
            if cbDos.Checked then   begin
               QAux.Params.byname('SUBCUENTA').AsString   := FieldByName('codscta').AsString;
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIBE').AsString;
               QAux.Params.byname('NIF').AsString         := FieldByName('CIF').AsString;
               QAux.Params.byname('DIRECCION').AsString   := FieldByName('Domicilio').AsString;
               QAux.Params.byname('CODPOSTAL').AsString   := FieldByName('CODPOSTAL').AsString;
               QAux.Params.byname('POBLACION').AsString   := FieldByName('POBLACION').AsString;
               QAux.Params.byname('TIPOIVA').AsString     := FieldByName('TIPOIVA').AsString;
               QAux.Params.byname('IVA').AsInteger        := FieldByName('IVA').AsInteger;
               QAux.Params.byname('RECARGO').AsInteger    := FieldByName('RECequiv').AsInteger;
            end
            else begin
               QAux.Params.byname('SUBCUENTA').AsString   := FieldByName('SUBCUENTA').AsString;
               QAux.Params.byname('DESCRIPCION').AsString := FieldByName('DESCRIPCION').AsString;
               QAux.Params.byname('ARRENDADOR').AsString  := FieldByName('ARRENDADOR').AsString;
               QAux.Params.byname('PROFESIONAL').AsString := FieldByName('PROFESIONAL').AsString;
               QAux.Params.byname('TELEFONO').AsString    := FieldByName('TELEFONO').AsString;
               QAux.Params.byname('FAX').AsString         := FieldByName('FAX').AsString;
               QAux.Params.byname('NIF').AsString         := FieldByName('NIF').AsString;
               QAux.Params.byname('DIRECCION').AsString   := FieldByName('DIRECCION').AsString;
               QAux.Params.byname('CODPOSTAL').AsString   := FieldByName('CODPOSTAL').AsString;
               QAux.Params.byname('POBLACION').AsString   := FieldByName('POBLACION').AsString;
               QAux.Params.byname('NUMERO').AsString      := FieldByName('NUMERO').AsString;
               QAux.Params.byname('TIPOIVA').AsString     := FieldByName('TIPOIVA').AsString;
               QAux.Params.byname('IVA').AsInteger        := FieldByName('IVA').AsInteger;
               QAux.Params.byname('RECARGO').AsInteger    := FieldByName('RECARGO').AsInteger;
               QAux.Params.byname('ACUDB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB01').AsFloat, 2, True);
               QAux.Params.byname('ACUDB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB02').AsFloat, 2, True);
               QAux.Params.byname('ACUDB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB03').AsFloat, 2, True);
               QAux.Params.byname('ACUDB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB04').AsFloat, 2, True);
               QAux.Params.byname('ACUDB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB05').AsFloat, 2, True);
               QAux.Params.byname('ACUDB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB06').AsFloat, 2, True);
               QAux.Params.byname('ACUDB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB07').AsFloat, 2, True);
               QAux.Params.byname('ACUDB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB08').AsFloat, 2, True);
               QAux.Params.byname('ACUDB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB09').AsFloat, 2, True);
               QAux.Params.byname('ACUDB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB10').AsFloat, 2, True);
               QAux.Params.byname('ACUDB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB11').AsFloat, 2, True);
               QAux.Params.byname('ACUDB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUDB12').AsFloat, 2, True);
               QAux.Params.byname('SUMADB').AsFloat       :=
                  RoundToDecimal(FieldByName('SUMADB').AsFloat, 2, True);
               QAux.Params.byname('ACUHB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB01').AsFloat, 2, True);
               QAux.Params.byname('ACUHB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB02').AsFloat, 2, True);
               QAux.Params.byname('ACUHB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB03').AsFloat, 2, True);
               QAux.Params.byname('ACUHB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB04').AsFloat, 2, True);
               QAux.Params.byname('ACUHB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB05').AsFloat, 2, True);
               QAux.Params.byname('ACUHB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB06').AsFloat, 2, True);
               QAux.Params.byname('ACUHB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB07').AsFloat, 2, True);
               QAux.Params.byname('ACUHB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB08').AsFloat, 2, True);
               QAux.Params.byname('ACUHB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB09').AsFloat, 2, True);
               QAux.Params.byname('ACUHB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB10').AsFloat, 2, True);
               QAux.Params.byname('ACUHB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB11').AsFloat, 2, True);
               QAux.Params.byname('ACUHB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ACUHB12').AsFloat, 2, True);
               QAux.Params.byname('SUMAHB').AsFloat       :=
                  RoundToDecimal(FieldByName('SUMAHB').AsFloat, 2, True);
               QAux.Params.byname('ANTDB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB01').AsFloat, 2, True);
               QAux.Params.byname('ANTDB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB02').AsFloat, 2, True);
               QAux.Params.byname('ANTDB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB03').AsFloat, 2, True);
               QAux.Params.byname('ANTDB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB04').AsFloat, 2, True);
               QAux.Params.byname('ANTDB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB05').AsFloat, 2, True);
               QAux.Params.byname('ANTDB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB06').AsFloat, 2, True);
               QAux.Params.byname('ANTDB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB07').AsFloat, 2, True);
               QAux.Params.byname('ANTDB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB08').AsFloat, 2, True);
               QAux.Params.byname('ANTDB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB09').AsFloat, 2, True);
               QAux.Params.byname('ANTDB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB10').AsFloat, 2, True);
               QAux.Params.byname('ANTDB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB11').AsFloat, 2, True);
               QAux.Params.byname('ANTDB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTDB12').AsFloat, 2, True);
               QAux.Params.byname('ANTDB').AsFloat        :=
                  RoundToDecimal(FieldByName('ANTDB').AsFloat, 2, True);
               QAux.Params.byname('ANTHB01').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB01').AsFloat, 2, True);
               QAux.Params.byname('ANTHB02').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB02').AsFloat, 2, True);
               QAux.Params.byname('ANTHB03').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB03').AsFloat, 2, True);
               QAux.Params.byname('ANTHB04').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB04').AsFloat, 2, True);
               QAux.Params.byname('ANTHB05').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB05').AsFloat, 2, True);
               QAux.Params.byname('ANTHB06').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB06').AsFloat, 2, True);
               QAux.Params.byname('ANTHB07').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB07').AsFloat, 2, True);
               QAux.Params.byname('ANTHB08').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB08').AsFloat, 2, True);
               QAux.Params.byname('ANTHB09').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB09').AsFloat, 2, True);
               QAux.Params.byname('ANTHB10').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB10').AsFloat, 2, True);
               QAux.Params.byname('ANTHB11').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB11').AsFloat, 2, True);
               QAux.Params.byname('ANTHB12').AsFloat      :=
                  RoundToDecimal(FieldByName('ANTHB12').AsFloat, 2, True);
               QAux.Params.byname('ANTHB').AsFloat        :=
                  RoundToDecimal(FieldByName('ANTHB').AsFloat, 2, True);
            end;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         First;
         while not EOF do begin
            // Antes de dar de alta verificar si existe la provincia
            if cbDos.Checked then begin
               cProvincia := 'M';
            end
            else begin
               cProvincia := FieldByName('provincia').AsString;
            end;
            if cProvincia <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('provincia').AsString := cProvincia;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  Memo1.Lines.Add('SubCuenta: ' + FieldByName('subcuenta').AsString +
                     '. La provincia ' + FieldByName('provincia').AsString + ' no existe, se crea.');
                  cProvincia := FieldByName('provincia').AsString;
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('insert into provincias(provincia,nombre) ');
                  QAux.Sql.Add(' values(:provincia,"CREADO EN TRASPASO")');
                  QAux.params.byname('provincia').AsString := FieldByName('provincia').AsString;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
            end;
            // Antes de dar de alta verificar si existe el pais
            if cbDos.Checked then begin
               cPais := 'ES';
            end
            else begin
               cPais := FieldByName('pais').AsString;
            end;
            if cPais <> '' then   begin
               QChequeo1.Close;
               QChequeo1.params.byname('pais').AsString := cPais;
               QChequeo1.execquery;
               if not (QChequeo1.FieldByName('cuantos').AsInteger > 0) then   begin
                  Memo1.Lines.Add('SubCuenta: ' + FieldByName('subcuenta').AsString +
                     '. El pais ' + FieldByName('pais').AsString + ' no existe.');
                  cPais := FieldByName('pais').AsString;
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('insert into paises(pais,nombre) ');
                  QAux.Sql.Add(' values(:pais,"CREADO EN TRASPASO")');
                  QAux.params.byname('pais').AsString := FieldByName('pais').AsString;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
            end;
            if (cProvincia <> '') and (cPais = '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update subctas set provincia=:provincia');
               QAux.sql.Add('where subcuenta=:subcuenta');
               QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
               QAux.params.byname('provincia').AsString := FieldByName('provincia').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end
            else
            if (cProvincia = '') and (cPais <> '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update subctas set pais=:pais');
               QAux.sql.Add('where subcuenta=:subcuenta');
               QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
               QAux.params.byname('pais').AsString      := FieldByName('pais').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end
            else
            if (cProvincia <> '') and (cPais <> '') then   begin
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update subctas set provincia=:provincia,pais=:pais');
               QAux.sql.Add('where subcuenta=:subcuenta');
               if cbDos.Checked then   begin
                  QAux.params.byname('subcuenta').AsString := FieldByName('codscta').AsString;
               end
               else begin
                  QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
               end;
               QAux.params.byname('provincia').AsString := cProvincia;
               QAux.params.byname('pais').AsString      := cPais;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end;
            if cbDos.Checked then begin
               cContrapartida := FieldByName('Contra').AsString;
            end
            else begin
               cContrapartida := FieldByName('Contrapartida').AsString;
            end;
            if not empty(cContrapartida) then   begin
               // Verificar que existe la contrapartida
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('select count(*) as cuantos from subctas ');
               QAux.Sql.Add(' where subcuenta=:subcuenta ');
               QAux.params.byname('subcuenta').AsString := cContrapartida;
               QAux.ExecQuery;
               if QAux.FieldByName('cuantos').AsInteger = 0 then   begin
                  Memo1.Lines.Add('SubCuenta: ' + cContrapartida + ' no existe, se crea.');
                  // insertar subcuenta
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('insert into subctas(subcuenta,descripcion) ');
                  QAux.Sql.Add(' values(:subcuenta,"CREADO EN TRASPASO")');
                  QAux.params.byname('subcuenta').AsString := cContrapartida;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('update subctas set contrapartida=:contrapartida');
               QAux.sql.Add('where subcuenta=:subcuenta');
               if cbDos.Checked then   begin
                  QAux.params.byname('subcuenta').AsString := FieldByName('codscta').AsString;
               end
               else begin
                  QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
               end;
               QAux.params.byname('contrapartida').AsString := cContrapartida;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end;
            Next;
         end;
         Close;
      end;
      cbSubCuentas.Checked := False;
   end;

   // Fichero Subcuentas - Actualizar solo saldos acumulados año anterior
   if cbSubCtaAcum.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Clear;
         Add(' UPDATE SUBCTAS SET ');
         Add(' ANTDB01=:ANTDB01,ANTDB02=:ANTDB02,ANTDB03=:ANTDB03,ANTDB04=:ANTDB04,ANTDB05=:ANTDB05,');
         Add(' ANTDB06=:ANTDB06,ANTDB07=:ANTDB07,ANTDB08=:ANTDB08,ANTDB09=:ANTDB09,ANTDB10=:ANTDB10,');
         Add(' ANTDB11=:ANTDB11,ANTDB12=:ANTDB12,ANTHB01=:ANTHB01,ANTHB02=:ANTHB02,ANTHB03=:ANTHB03,');
         Add(' ANTHB04=:ANTHB04,ANTHB05=:ANTHB05,ANTHB06=:ANTHB06,ANTHB07=:ANTHB07,ANTHB08=:ANTHB08,');
         Add(' ANTHB09=:ANTHB09,ANTHB10=:ANTHB10,ANTHB11=:ANTHB11,ANTHB12=:ANTHB12,ANTHB=:ANTHB,ANTDB=:ANTDB');
         Add(' WHERE SUBCUENTA=:SUBCUENTA');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'SUBCTAS';
         Open;
         while not EOF do begin
            QAux.Params.byname('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
            QAux.Params.byname('ANTDB01').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB01').AsFloat, 2, True);
            QAux.Params.byname('ANTDB02').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB02').AsFloat, 2, True);
            QAux.Params.byname('ANTDB03').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB03').AsFloat, 2, True);
            QAux.Params.byname('ANTDB04').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB04').AsFloat, 2, True);
            QAux.Params.byname('ANTDB05').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB05').AsFloat, 2, True);
            QAux.Params.byname('ANTDB06').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB06').AsFloat, 2, True);
            QAux.Params.byname('ANTDB07').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB07').AsFloat, 2, True);
            QAux.Params.byname('ANTDB08').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB08').AsFloat, 2, True);
            QAux.Params.byname('ANTDB09').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB09').AsFloat, 2, True);
            QAux.Params.byname('ANTDB10').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB10').AsFloat, 2, True);
            QAux.Params.byname('ANTDB11').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB11').AsFloat, 2, True);
            QAux.Params.byname('ANTDB12').AsFloat    :=
               RoundToDecimal(FieldByName('ACUDB12').AsFloat, 2, True);
            QAux.Params.byname('ANTDB').AsFloat      :=
               RoundToDecimal(FieldByName('SUMADB').AsFloat, 2, True);
            QAux.Params.byname('ANTHB01').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB01').AsFloat, 2, True);
            QAux.Params.byname('ANTHB02').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB02').AsFloat, 2, True);
            QAux.Params.byname('ANTHB03').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB03').AsFloat, 2, True);
            QAux.Params.byname('ANTHB04').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB04').AsFloat, 2, True);
            QAux.Params.byname('ANTHB05').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB05').AsFloat, 2, True);
            QAux.Params.byname('ANTHB06').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB06').AsFloat, 2, True);
            QAux.Params.byname('ANTHB07').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB07').AsFloat, 2, True);
            QAux.Params.byname('ANTHB08').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB08').AsFloat, 2, True);
            QAux.Params.byname('ANTHB09').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB09').AsFloat, 2, True);
            QAux.Params.byname('ANTHB10').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB10').AsFloat, 2, True);
            QAux.Params.byname('ANTHB11').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB11').AsFloat, 2, True);
            QAux.Params.byname('ANTHB12').AsFloat    :=
               RoundToDecimal(FieldByName('ACUHB12').AsFloat, 2, True);
            QAux.Params.byname('ANTHB').AsFloat      :=
               RoundToDecimal(FieldByName('SUMAHB').AsFloat, 2, True);
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
      end;
      cbSubCtaAcum.Checked := False;
   end;

   // Fichero Amortizacion
   if cbAmortizacion.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from amortiza');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from subctas where subcuenta=:subcuenta');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'AMORTIZA';
         Open;
         while not EOF do begin
            // Antes de dar de alta verificar que existe la Subcuenta
            QChequeo.Close;
            QChequeo.params.byname('subcuenta').AsString := FieldByName('Subcuenta').AsString;
            QChequeo.execquery;
            if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
               Memo1.Lines.Add('Amortiza: Subcuenta ' + Trim(FieldByName('subcuenta').AsString) +
                  '. Se crea.');
               QAux.Close;
               QAux.sql.Clear;
               QAux.Sql.Add('insert into subctas(subcuenta,descripcion) ');
               QAux.Sql.Add(' values(:subcuenta,"CREADO TRASPASO AMORTIZACIONES")');
               QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
               QAux.ExecQuery;
               QAux.Transaction.CommitRetaining;
            end;

            QAux.SQl.Clear;
            QAux.Sql.Add('INSERT INTO AMORTIZA (SUBCUENTA,FCOMPRA,FINICIO,FULTAMOR,');
            QAux.Sql.Add(' FFINAMOR,');
            if Day(FieldByName('fbaja').AsDateTime) <> 0 then   begin
               QAux.Sql.Add(' FBAJA,');
            end;
            if not empty(FieldByName('CENTROCOSTE').AsString) then   begin
               QAux.Sql.Add(' CENTROCOSTE,');
            end;
            QAux.Sql.Add(' PERIODO,ANUAL,FACTURA,');
            QAux.Sql.Add(' VCOMPRA,VRESIDUAL,VAMOR,VEJPINICIO,VEJAINICIO,VEJPAMOR,VEJAAMOR,');
            Qaux.Sql.Add(' CLASE) VALUES (:SUBCUENTA,:FCOMPRA,:FINICIO,:FULTAMOR,');
            QAux.Sql.Add(' :FFINAMOR,');
            if Day(FieldByName('fbaja').AsDateTime) <> 0 then   begin
               QAux.SQL.Add(' :FBAJA,');
            end;
            if not empty(FieldByName('CENTROCOSTE').AsString) then   begin
               QAux.SQL.Add(' :CENTROCOSTE,');
            end;
            Qaux.SQl.Add(' :PERIODO,:ANUAL,:FACTURA,');
            QAux.Sql.Add(' :VCOMPRA,:VRESIDUAL,:VAMOR,:VEJPINICIO,:VEJAINICIO,:VEJPAMOR,:VEJAAMOR,');
            QAux.Sql.Add(' :CLASE)');
            QAux.Params.byname('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
            if not empty(FieldByName('CENTROCOSTE').AsString) then   begin
               QAux.Params.byname('CENTROCOSTE').AsString := FieldByName('CENTROCOSTE').AsString;
            end;
            QAux.Params.byname('FCOMPRA').AsDateTime  := FieldByName('FCOMPRA').AsDateTime;
            QAux.Params.byname('FINICIO').AsDateTime  := FieldByName('FINICIO').AsDateTime;
            QAux.Params.byname('FULTAMOR').AsDateTime := FieldByName('FULTAMOR').AsDateTime;
            QAux.Params.byname('FFINAMOR').AsDateTime := FieldByName('FFINAMOR').AsDateTime;
            if day(FieldByName('fbaja').AsDateTime) <> 0 then   begin
               QAux.Params.byname('FBAJA').AsDateTime := FieldByName('FBAJA').AsDateTime;
            end;
            QAux.Params.byname('PERIODO').AsString   := FieldByName('PERIODO').AsString;
            QAux.Params.byname('ANUAL').AsInteger    := FieldByName('ANUAL').AsInteger;
            QAux.Params.byname('FACTURA').AsString   := FieldByName('FACTURA').AsString;
            QAux.Params.byname('VCOMPRA').AsFloat    :=
               RoundToDecimal(FieldByName('VCOMPRA').AsFloat, 2, True);
            QAux.Params.byname('VRESIDUAL').AsFloat  :=
               RoundToDecimal(FieldByName('VRESIDUAL').AsFloat, 2, True);
            QAux.Params.byname('VAMOR').AsFloat      :=
               RoundToDecimal(FieldByName('VAMOR').AsFloat, 2, True);
            QAux.Params.byname('VEJPINICIO').AsFloat :=
               RoundToDecimal(FieldByName('VEJPINICIO').AsFloat, 2, True);
            QAux.Params.byname('VEJAINICIO').AsFloat :=
               RoundToDecimal(FieldByName('VEJAINICIO').AsFloat, 2, True);
            QAux.Params.byname('VEJPAMOR').AsFloat   :=
               RoundToDecimal(FieldByName('VEJPAMOR').AsFloat, 2, True);
            QAux.Params.byname('VEJAAMOR').AsFloat   :=
               RoundToDecimal(FieldByName('VEJAAMOR').AsFloat, 2, True);
            QAux.Params.byname('CLASE').AsInteger    := FieldByName('CLASE').AsInteger;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         First;
         while not EOF do begin
            // Antes de dar de alta verificar si existe el proveedor
            cAux := FieldByName('proveedor').AsString;
            if cAux <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('subcuenta').AsString := cAux;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  Memo1.Lines.Add('Amortiza: Subcuenta ' +
                     Trim(FieldByName('subcuenta').AsString) + ' Proveedor ' + cAux + 'no existe.');
               end
               else begin
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('update amortiza set proveedor=:proveedor');
                  QAux.sql.Add('where subcuenta=:subcuenta');
                  QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
                  QAux.params.byname('proveedor').AsString := FieldByName('proveedor').AsString;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
            end;
            // Antes de dar de alta verificar si existe el subgasto
            cAux := FieldByName('subgasto').AsString;
            if cAux <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('subcuenta').AsString := cAux;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  Memo1.Lines.Add('Amortiza: Subcuenta ' +
                     Trim(FieldByName('subcuenta').AsString) + ' Sub. Gasto ' + cAux + 'no existe.');
               end
               else begin
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('update amortiza set subgasto=:subgasto');
                  QAux.sql.Add('where subcuenta=:subcuenta');
                  QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
                  QAux.params.byname('subgasto').AsString  := FieldByName('subgasto').AsString;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
            end;
            // Antes de dar de alta verificar si existe el subamor
            cAux := FieldByName('subamor').AsString;
            if cAux <> '' then   begin
               QChequeo.Close;
               QChequeo.params.byname('subcuenta').AsString := cAux;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  Memo1.Lines.Add('Amortiza: Subcuenta ' +
                     Trim(FieldByName('subcuenta').AsString) + ' Sub. Amor. ' + cAux + 'no existe.');
               end
               else begin
                  QAux.Close;
                  QAux.sql.Clear;
                  QAux.Sql.Add('update amortiza set subamor=:subamor');
                  QAux.sql.Add('where subcuenta=:subcuenta');
                  QAux.params.byname('subcuenta').AsString := FieldByName('subcuenta').AsString;
                  QAux.params.byname('subamor').AsString   := FieldByName('subamor').AsString;
                  QAux.ExecQuery;
                  QAux.Transaction.CommitRetaining;
               end;
            end;
            Next;
         end;
         Close;
      end;
      cbAmortizacion.Checked := False;
   end;

   // Fichero Conceptos
   if cbConceptos.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from conceptos');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add(' INSERT INTO CONCEPTOS (ID_CONCEPTOS,DESCRIPCION,TIPOCONTABILIDAD,');
         Add(' TIPOCONCEPTO,OBSOLETO)');
         Add(' VALUES (:ID_CONCEPTOS,:DESCRIPCION,:TIPOCONTABILIDAD,');
         Add(' :TIPOCONCEPTO,"N") ');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'CONCEPTO';
         Open;
         while not EOF do begin
            QAux.Params.byname('ID_CONCEPTOS').AsString     := FieldByName('CONCEPTO').AsString;
            QAux.Params.byname('DESCRIPCION').AsString      := FieldByName('DESCRIPCION').AsString;
            QAux.Params.byname('TIPOCONTABILIDAD').AsString := FieldByName('TIPOCONTABILIDAD').AsString;
            QAux.Params.byname('TIPOCONCEPTO').AsString     := FieldByName('TIPOCONCEPTO').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbConceptos.Checked := False;
   end;

   // Fichero Centros de coste
   if cbAnalitica.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from analiticas');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add('Insert INTO ANALITICAS(cuenta,NOMBRE) ');
         Add(' VALUES (:Cuenta,:Nombre)');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'ctocoste';
         Open;
         while not EOF do begin
            QAux.Params.byname('cuenta').AsString := FieldByName('centrocoste').AsString;
            QAux.Params.byname('nombre').AsString := FieldByName('descripcion').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbAnalitica.Checked := False;
   end;

   // Fichero Diario
   if (cbDiario.Checked) or (cbDiarioJL.Checked) then  begin
      Memo1.Lines.Add('Diario: Comienza ' + TimeToStr(Time));
      DmContaRef.Actualizar_Contador('asiento', 1);
      DmContaRef.Actualizar_Contador('diario', 1);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         // Inactivar Triggers
         Add('Update rdb$triggers set rdb$trigger_inactive=1');
         Add('Where Upper(rdb$relation_name)="DIARIO"');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;

         if not cbActivarFiltro.Checked then   begin
            Add('delete from diario');
            ExecQuery;
            Transaction.CommitRetaining;
         end;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo1, Sql do begin
         Close;
         Clear;
         Add('select tipocuenta from cuentas where cuenta=:cuenta');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from analiticas where cuenta=:cuenta');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         if cbDos.Checked then begin
            Tablename := 'c_diario.dbf';
         end
         else begin
            Tablename := 'DIARIO';
         end;
         Open;
         while not EOF do begin
            if cbDos.Checked then   begin
               if cbActivarFiltro.Checked and not
                  ((QFicheroFecha1.AsDateTime <= FieldByName('fecha').AsDateTime) and
                  (QFicheroFecha2.AsDateTime >= FieldByName('fecha').AsDateTime)) then   begin
                  Next;
                  continue;
               end;
            end
            else begin
               if cbActivarFiltro.Checked and not
                  ((QFicheroFecha1.AsDateTime <= FieldByName('fecha').AsDateTime) and
                  (QFicheroFecha2.AsDateTime >= FieldByName('fecha').AsDateTime) and
                  (QFicheroAsiento1.AsInteger <= FieldByName('documento').AsInteger) and
                  (QFicheroAsiento2.AsInteger >= FieldByName('documento').AsInteger)) then   begin
                  Next;
                  continue;
               end;
            end;
            if (cbDiarioJl.Checked) and (not empty(FieldByName('NumeroFactura').AsString)) and
               (FieldByName('Fechavto').AsDateTime >= DateBeginofYear(date)) then   begin
               // Solo si es de cliente o proveedor
               QChequeo1.Close;
               QChequeo1.parambyname('cuenta').AsString :=
                  Copy(Trim(FieldByName('subcuenta').AsString), 1, 3);
               QChequeo1.ExecQuery;
               if (QChequeo1.FieldByName('tipocuenta').AsString = 'C') or
                  (QChequeo1.FieldByName('tipocuenta').AsString = 'P') then   begin
                  // insertar vencimientos
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('INSERT INTO CARTERAEFECTOS (SITUACION,CONCEPTO,FEMISION,');
                  QInsertar.Sql.Add(' SUBCUENTA,IMPORTE,FACTCLIENT,FACTPROVEEDOR,FVENCIMIENTO)');
                  // Se deja la situacion como pendiente ("N")
                  QInsertar.Sql.Add('VALUES("N",:CONCEPTO,:FEMISION,:SUBCUENTA,');
                  QInsertar.Sql.Add(' :IMPORTE,:FACTCLIENT,:FACTPROVEEDOR,:FVENCIMIENTO)');
                  QInsertar.ParamByName('femision').AsDateTime := FieldByName('fecha').AsDateTime;
                  QInsertar.ParamByName('subcuenta').AsString  := FieldByName('subcuenta').AsString;
                  QInsertar.ParamByName('importe').AsFloat     := FieldByName('importe').AsFloat;
                  //         RoundToDecimal(fieldbyname('importe').asfloat,2,True);
                  if (QChequeo1.FieldByName('tipocuenta').AsString = 'C') then   begin
                     QInsertar.ParamByName('factclient').AsString    := FieldByName('numerofactura').AsString;
                     QInsertar.ParamByName('factproveedor').AsString := '';
                     QInsertar.parambyname('concepto').AsString      :=
                        'COBRO VTO. ' + FieldByName('fechavto').AsString + ' FACT. ' +
                        FieldByName('numerofactura').AsString;
                  end
                  else begin
                     QInsertar.ParamByName('factproveedor').AsString := FieldByName('numerofactura').AsString;
                     QInsertar.ParamByName('factclient').AsString    := '';
                     QInsertar.parambyname('concepto').AsString      :=
                        'PAGO VTO. ' + FieldByName('fechavto').AsString + ' FACT. ' +
                        FieldByName('numerofactura').AsString;
                  end;
                  QInsertar.ParamByName('fvencimiento').AsDateTime := FieldByName('fechavto').AsDateTime;
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
               end;
            end;
            // Antes de dar de alta verificar si existe el centro de coste
            if (not cbDos.Checked) and (not empty(FieldByName('centrocoste').AsString)) then   begin
               QChequeo.Close;
               QChequeo.ParamByName('cuenta').AsString := FieldByName('centrocoste').AsString;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into analiticas(cuenta,nombre) ');
                  QInsertar.Sql.Add(' Values(:cuenta,:nombre) ');
                  QInsertar.ParamByName('cuenta').AsString := FieldByName('centrocoste').AsString;
                  QInsertar.ParamByName('nombre').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  Memo1.Lines.Add('Diario: Analitica ' + Trim(FieldByName('centrocoste').AsString) +
                     ' ha sido creada.');
               end;
            end;
            if cbDos.Checked then   begin
               QAux.Close;
               QAux.Sql.Clear;
               QAux.Sql.Add(' INSERT INTO DIARIO (ID_DIARIO,APUNTE,ASIENTO,BASEIMPONIBLE,');
               QAux.Sql.Add(' COMENTARIO,DEBEHABER,FECHA,');
               QAux.Sql.Add(' IMPORTE,IVA,');
               QAux.Sql.Add(' MONEDA,NUMEROFACTURA,RECARGO,');
               if (FieldByName('contra').AsInteger) = 0 then   begin
                  QAux.Sql.Add(' SUBCUENTA,ID_CONCEPTOS) ');
               end
               else begin
                  QAux.Sql.Add(' SUBCUENTA,ID_CONCEPTOS,CONTRAPARTIDA) ');
               end;
               QAux.Sql.Add(' VALUES (:ID_DIARIO,:APUNTE,:ASIENTO,:BASEIMPONIBLE,');
               QAux.Sql.Add(' :COMENTARIO,:DEBEHABER,:FECHA,');
               QAux.Sql.Add(' :IMPORTE,:IVA,');
               QAux.Sql.Add(' :MONEDA,:NUMEROFACTURA,:RECARGO,');
               if (FieldByName('contra').AsInteger) = 0 then   begin
                  QAux.Sql.Add(' :SUBCUENTA,:ID_CONCEPTOS)');
               end
               else begin
                  QAux.Sql.Add(' :SUBCUENTA,:ID_CONCEPTOS,:CONTRAPARTIDA)');
               end;

               QAux.Params.byname('ID_DIARIO').AsInteger :=
                  DmContaRef.Obtener_Contador('diario', 'id_diario', 'Diario');
               QAux.Params.byname('APUNTE').AsInteger    := FieldByName('APUNTE').AsInteger;

               // Si es por activacion de filtro, se debe buscar el asiento que corresponde
               QAux.Params.byname('ASIENTO').AsInteger := FieldByName('Asiento').AsInteger;

               QAux.Params.byname('BASEIMPONIBLE').AsFloat :=
                  RoundToDecimal(FieldByName('BASEIMPO').AsFloat, 2, True);
               QAux.Params.byname('ID_CONCEPTOS').AsString := '14';
               QAux.Params.byname('SUBCUENTA').AsString    := FieldByName('codscta').AsString;
               QAux.Params.byname('COMENTARIO').AsString   := FieldByName('COncepto').AsString;
               QAux.Params.byname('DEBEHABER').AsString    := FieldByName('DEBEHABER').AsString;
               QAux.Params.byname('FECHA').AsDateTime      := FieldByName('FECHA').AsDateTime;
               QAux.Params.byname('IMPORTE').AsFloat       := FieldByName('IMPORTE').AsFloat;
               //         RoundToDecimal(fieldbyname('IMPORTE').asfloat,2,True);     
               QAux.Params.byname('IVA').AsFloat           := FieldByName('IVA').AsFloat;
               QAux.Params.byname('MONEDA').AsString       := 'E';
               QAux.Params.byname('NUMEROFACTURA').AsString := FieldByName('NUMFACTU').AsString;
               QAux.Params.byname('RECARGO').AsFloat       := FieldByName('RECEQUIV').AsFloat;
               if (FieldByName('contra').AsInteger > 0) then   begin
                  QAux.Params.byname('CONTRAPARTIDA').AsString := FieldByName('CONTRA').AsString;
               end;
            end
            else begin
               // Comprobacion de q exista la subcuenta
               QChequeo2.Close;
               QChequeo2.Sql.Clear;
               QChequeo2.Sql.Add('select count(*) as cuantos from subctas where subcuenta=:subcuenta');
               QChequeo2.Params.byname('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
               QChequeo2.ExecQuery;
               if not (QChequeo2.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into subctas(subcuenta,descripcion) ');
                  QInsertar.Sql.Add(' Values(:subcuenta,:descripcion) ');
                  QInsertar.ParamByName('subcuenta').AsString   := FieldByName('subcuenta').AsString;
                  QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
               end;

               if (FieldByName('contrapartida').AsString <> '') then   begin
                  // Comprobacion de q exista la contrapartida
                  QChequeo2.Close;
                  QChequeo2.Sql.Clear;
                  QChequeo2.Sql.Add('select count(*) as cuantos from subctas where subcuenta=:subcuenta');
                  QChequeo2.Params.byname('SUBCUENTA').AsString := FieldByName('contrapartida').AsString;
                  QChequeo2.ExecQuery;
                  if not (QChequeo2.FieldByName('cuantos').AsInteger > 0) then   begin
                     QInsertar.Close;
                     QInsertar.Sql.Clear;
                     QInsertar.Sql.Add('Insert into subctas(subcuenta,descripcion) ');
                     QInsertar.Sql.Add(' Values(:subcuenta,:descripcion) ');
                     QInsertar.ParamByName('subcuenta').AsString   := FieldByName('contrapartida').AsString;
                     QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                     QInsertar.ExecQuery;
                     QInsertar.Transaction.Commitretaining;
                  end;
               end;

               QAuxD.Close;
               QAuxD.Sql.Clear;
               QAuxD.Sql.Add(' INSERT INTO DIARIO (ID_DIARIO,APUNTE,ASIENTO,BASEIMPONIBLE,');
               QAuxD.Sql.Add(' COMENTARIO,DEBEHABER,FECHA,');
               if not empty(FieldByName('centrocoste').AsString) then   begin
                  QAuxD.Sql.Add(' CUENTA_ANALITICA,');
               end;
               QAuxD.Sql.Add(' IMPORTE,IVA,NIF,');
               QAuxD.Sql.Add(' MONEDA,NUMEROFACTURA,RECARGO,PUNTEO,ASIENTOPUNTEO,');
               if (FieldByName('contrapartida').AsString) = '' then   begin
                  QAuxD.Sql.Add(' PUNTEOIVA,SUBCUENTA,ID_CONCEPTOS) ');
               end
               else begin
                  QAuxD.Sql.Add(' PUNTEOIVA,SUBCUENTA,ID_CONCEPTOS,CONTRAPARTIDA) ');
               end;

               QAuxD.Sql.Add(' VALUES (:ID_DIARIO,:APUNTE,:ASIENTO,:BASEIMPONIBLE,');
               QAuxD.Sql.Add(' :COMENTARIO,:DEBEHABER,:FECHA,');
               if not empty(FieldByName('centrocoste').AsString) then   begin
                  QAuxD.Sql.Add(':CUENTA_ANALITICA,');
               end;
               QAuxD.Sql.Add(' :IMPORTE,:IVA,:NIF,');
               QAuxD.Sql.Add(' :MONEDA,:NUMEROFACTURA,:RECARGO,:PUNTEO,:ASIENTOPUNTEO,');
               if (FieldByName('contrapartida').AsString) = '' then   begin
                  QAuxD.Sql.Add(' :PUNTEOIVA,:SUBCUENTA,:ID_CONCEPTOS)');
               end
               else begin
                  QAuxD.Sql.Add(' :PUNTEOIVA,:SUBCUENTA,:ID_CONCEPTOS,:CONTRAPARTIDA)');
               end;

               QAuxD.Parambyname('ID_DIARIO').AsInteger :=
                  DmContaRef.Obtener_Contador('diario', 'id_diario', 'Diario');
               QAuxD.Parambyname('APUNTE').AsInteger    := FieldByName('APUNTE').AsInteger;

               // Si es por activacion de filtro, se debe buscar el asiento que corresponde
               if cbActivarFiltro.Checked and (nDocumento <> FieldByName('documento').AsInteger) then   begin
                  nDocumento := FieldByName('documento').AsInteger;
                  nAsiento   := DMContaRef.ObtenerNumeroAsiento;
               end;
               if cbActivarFiltro.Checked then   begin
                  QAuxD.Parambyname('ASIENTO').AsInteger := nAsiento;
               end
               else begin
                  QAuxD.Parambyname('ASIENTO').AsInteger := FieldByName('DOCUMENTO').AsInteger;
               end;

               QAuxD.Parambyname('BASEIMPONIBLE').AsFloat :=
                  RoundToDecimal(FieldByName('BASEIMPONIBLE').AsFloat, 2, True);
               QAuxD.Parambyname('ID_CONCEPTOS').AsString := FieldByName('CONCEPTO').AsString;
               QAuxD.Parambyname('SUBCUENTA').AsString    := FieldByName('SUBCUENTA').AsString;
               if not empty(FieldByName('centrocoste').AsString) then   begin
                  QAuxD.Parambyname('CUENTA_ANALITICA').AsString := FieldByName('CENTROCOSTE').AsString;
               end;
               QAuxD.Parambyname('COMENTARIO').AsString := FieldByName('COMENTARIO').AsString;
               QAuxD.Parambyname('DEBEHABER').AsString  := FieldByName('DEBEHABER').AsString;
               QAuxD.Parambyname('FECHA').AsDateTime    := FieldByName('FECHA').AsDateTime;
               QAuxD.Parambyname('IMPORTE').AsFloat     := Fichero.FieldByName('IMPORTE').AsFloat;
               //  RoundToDecimal(fieldbyname('IMPORTE').asfloat,2,True);
               QAuxD.Parambyname('IVA').AsFloat         := FieldByName('IVA').AsFloat;
               QAuxD.Parambyname('NIF').AsString        := FieldByName('NIF').AsString;
               QAuxD.Parambyname('MONEDA').AsString     := FieldByName('MONEDA').AsString;
               QAuxD.Parambyname('NUMEROFACTURA').AsString := FieldByName('NUMEROFACTURA').AsString;
               QAuxD.Parambyname('RECARGO').AsFloat     := FieldByName('RECARGO').AsFloat;
               QAuxD.Parambyname('PUNTEO').AsString     := FieldByName('PUNTEO').AsString;
               QAuxD.Parambyname('ASIENTOPUNTEO').AsInteger := FieldByName('DOCUMENTOPUNTEO').AsInteger;
               QAuxD.Parambyname('PUNTEOIVA').AsString  := FieldByName('PUNTEOIVA').AsString;
               if (FieldByName('contrapartida').AsString <> '') then   begin
                  QAuxD.Parambyname('CONTRAPARTIDA').AsString :=
                     FieldByName('CONTRAPARTIDA').AsString;
               end;
            end;
            QAuxD.ExecSql;
            QAuxD.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         if not cbDos.Checked then   begin
            Close;
            Clear;
            add('update diario set cuotaiva=iva*baseimponible*0.01,');
            add(' cuotarecargo=recargo*baseimponible*0.01');
            add(' where id_conceptos in ');
            add(' (select id_conceptos from Conceptos Where TipoConcepto="I")');
            ExecQuery;
            Transaction.CommitRetaining;
         end;
         Close;
         Clear;
         // activar Triggers
         Add('Update rdb$triggers set rdb$trigger_inactive=0');
         Add('Where Upper(rdb$relation_name)="DIARIO"');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
      end;
      Memo1.Lines.Add('Diario: Finaliza ' + TimeToStr(Time));
      cbDiario.Checked   := False;
      cbDiarioJL.Checked := False;
   end;

   // Fichero Cartera de efectos
   if cbCartera.Checked then  begin
      DmContaRef.Actualizar_Contador('carteraefectos', 1);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from carteraefectos');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from subctas where subcuenta=:subcuenta');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QChequeo1, Sql do begin
         Close;
         Clear;
         Add('select count(*) as cuantos from comerciales where comercial=:comercial');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'PAGOCOBRO';
         Open;
         while not EOF do begin
            QAux.Close;
            QAux.Sql.Clear;
            QAux.Sql.Add('INSERT INTO CARTERAEFECTOS (SITUACION,CONCEPTO,FEMISION,FASIENTO,');
            if (FieldByName('Subcuenta').AsString) <> '' then   begin
               QChequeo.Close;
               QChequeo.ParamByName('Subcuenta').AsString := FieldByName('subcuenta').AsString;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into subctas(subcuenta,descripcion) ');
                  QInsertar.Sql.Add(' Values(:subcuenta,:descripcion) ');
                  QInsertar.ParamByName('subcuenta').AsString   := FieldByName('subcuenta').AsString;
                  QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  Memo1.Lines.Add('Cartera: Subcuenta ' +
                     Trim(FieldByName('subcuenta').AsString) + ' ha sido creada.');
               end;
               QAux.Sql.Add(' SUBCUENTA,');
            end;
            if (FieldByName('Subctabanco').AsString) <> '' then   begin
               QChequeo.Close;
               QChequeo.ParamByName('Subcuenta').AsString := FieldByName('subctabanco').AsString;
               QChequeo.execquery;
               if not (QChequeo.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into subctas(subcuenta,descripcion) ');
                  QInsertar.Sql.Add(' Values(:subcuenta,:descripcion) ');
                  QInsertar.ParamByName('subcuenta').AsString   := FieldByName('subctabanco').AsString;
                  QInsertar.ParamByName('descripcion').AsString := 'Creado en traspaso de datos';
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  Memo1.Lines.Add('Cartera: Subcuenta Banco ' +
                     Trim(FieldByName('subctabanco').AsString) + ' ha sido creada.');
               end;
               QAux.Sql.Add(' SUBCTABANCO,');
            end;
            if (FieldByName('Comercial').AsString) <> '' then   begin
               QChequeo1.Close;
               QChequeo1.ParamByName('comercial').AsString := FieldByName('comercial').AsString;
               QChequeo1.execquery;
               if not (QChequeo1.FieldByName('cuantos').AsInteger > 0) then   begin
                  QInsertar.Close;
                  QInsertar.Sql.Clear;
                  QInsertar.Sql.Add('Insert into comerciales(comercial,nombre) ');
                  QInsertar.Sql.Add(' Values(:comercial,:nombre) ');
                  QInsertar.ParamByName('comercial').AsString := FieldByName('comercial').AsString;
                  QInsertar.ParamByName('nombre').AsString    := 'Comercial ' + FieldByName('comercial').AsString;
                  ;
                  QInsertar.ExecQuery;
                  QInsertar.Transaction.Commitretaining;
                  Memo1.Lines.Add('Cartera: Comercial ' +
                     Trim(FieldByName('comercial').AsString) + ' ha sido creado.');
               end;
               QAux.Sql.Add(' COMERCIAL,');
            end;
            QAux.Sql.Add('IMPORTE,FACTCLIENT,FACTPROVEEDOR,FVENCIMIENTO,IMPCOMISION)');
            QAux.SQL.Add(' VALUES (:SITUACION,:CONCEPTO,:FEMISION,:FASIENTO,');
            if (FieldByName('Subcuenta').AsString) <> '' then   begin
               QAux.Sql.Add(' :SUBCUENTA,');
            end;
            if (FieldByName('Subctabanco').AsString) <> '' then   begin
               QAux.Sql.Add(' :SUBCTABANCO,');
            end;
            if (FieldByName('Comercial').AsString) <> '' then   begin
               QAux.Sql.Add(' :COMERCIAL,');
            end;
            QAux.Sql.Add(':IMPORTE,:FACTCLIENT,:FACTPROVEEDOR,:FVENCIMIENTO,:IMPCOMISION)');

            QAux.Params.byname('SITUACION').AsString      := FieldByName('SITUACION').AsString;
            QAux.Params.byname('CONCEPTO').AsString       := FieldByName('CONCEPTO').AsString;
            QAux.Params.byname('FEMISION').AsDateTime     := FieldByName('FEMISION').AsDateTime;
            QAux.Params.byname('FASIENTO').AsDateTime     := FieldByName('FASIENTO').AsDateTime;
            QAux.Params.byname('FVENCIMIENTO').AsDateTime := FieldByName('FVENCIMIENTO').AsDateTime;
            QAux.Params.byname('IMPORTE').AsFloat         :=
               RoundToDecimal(FieldByName('IMPORTE').AsFloat, 2, True);
            QAux.Params.byname('IMPCOMISION').AsFloat     :=
               RoundToDecimal(FieldByName('IMPCOMISION').AsFloat, 2, True);
            QAux.Params.byname('FACTCLIENT').AsString     := FieldByName('FACTCLIENT').AsString;
            QAux.Params.byname('FACTPROVEEDOR').AsString  := FieldByName('FACTPROVEEDOR').AsString;
            if (FieldByName('Subcuenta').AsString) <> '' then   begin
               QAux.Params.byname('SUBCUENTA').AsString := FieldByName('SUBCUENTA').AsString;
            end;
            if (FieldByName('Subctabanco').AsString) <> '' then   begin
               QAux.Params.byname('SUBCTABANCO').AsString := FieldByName('SUBCTABANCO').AsString;
            end;
            if (FieldByName('Comercial').AsString) <> '' then   begin
               QAux.Params.byname('COMERCIAL').AsString := FieldByName('COMERCIAL').AsString;
            end;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbCartera.Checked := False;
   end;

   // Fichero Datos
   if cbDatos.Checked then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, sql do begin
         Close;
         Clear;
         Add('delete from parametros');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Clear;
         Add(' INSERT INTO PARAMETROS (LONGITUD_SUBCUENTAS,');
         Add(' FECHA_INICIO_EJERCICIO,FECHA_FIN_EJERCICIO,');
         Add(' SUBCUENTA_CIERRE,MONEDA,');
         Add(' RECARGO,SCTAIVANORMAL,SCTAIVAEXENTO,');
         Add(' SCTAIVAINTRA,SCTAVENTAS,SCTADEVOLUCION,CTOIVANORMAL,CTOIVAEXENTO,');
         Add(' CTOIVAINTRA,CTOVENTAS,CTODEVOLUCION,CTOCLIENTES,SCTADESCUENTO,');
         Add(' SCTACOMPRAS,CTODESCUENTO,CTOCOMPRAS,SCTAIVAREDUCIDO,CTOIVAREDUCIDO,');
         Add(' SCTAIVASUPER,CTOIVASUPER,CTOPROVEEDORES,SCTAIVACNORMAL,CTOIVACNORMAL,');
         Add(' SCTAIVACREDUCIDO,CTOIVACREDUCIDO,SCTAIVACSUPER,CTOIVACSUPER,SCTARECNORMAL,');
         Add(' CTORECNORMAL,SCTARECREDUCIDO,CTORECREDUCIDO,SCTARECSUPER,CTORECSUPER,');
         Add(' CTORECIBOVENTAS,VGENERICA,SUBCAJA,CTOCOBROF,CTONOME,CTONOMT,SCTANOMSUELDO,');
         Add(' SCTANOMIRPF,SCTANOMPAGO,SCTANOMSSE,SCTANOMSST,SCTANOMCARGO,SCTADTOPPV,');
         Add(' SCTADTOPPC,CTODTOPPV,CTODTOPPC,SCTARETPROF,SCTARETARRE,CTORETPROF,');
         Add(' CTORETARRE,TANTORETPROF,TANTORETARRE,SCTAHACIVA,CTOHACIVA,');
         Add(' SCTAIVACEXENTO,CTOIVACEXENTO,CTOPAGOF,VGENERICAC) ');
         Add(' VALUES(:LONGITUD_SUBCUENTAS,');
         Add(' :FECHA_INICIO_EJERCICIO,:FECHA_FIN_EJERCICIO,');
         Add(' "1290000","E","N",:SCTAIVANORMAL,:SCTAIVAEXENTO,');
         Add(' :SCTAIVAINTRA,:SCTAVENTAS,:SCTADEVOLUCION,:CTOIVANORMAL,:CTOIVAEXENTO,');
         Add(' :CTOIVAINTRA,:CTOVENTAS,:CTODEVOLUCION,:CTOCLIENTES,:SCTADESCUENTO,');
         Add(' :SCTACOMPRAS,:CTODESCUENTO,:CTOCOMPRAS,:SCTAIVAREDUCIDO,:CTOIVAREDUCIDO,');
         Add(' :SCTAIVASUPER,:CTOIVASUPER,:CTOPROVEEDORES,:SCTAIVACNORMAL,:CTOIVACNORMAL,');
         Add(' :SCTAIVACREDUCIDO,:CTOIVACREDUCIDO,:SCTAIVACSUPER,:CTOIVACSUPER,:SCTARECNORMAL,');
         Add(' :CTORECNORMAL,:SCTARECREDUCIDO,:CTORECREDUCIDO,:SCTARECSUPER,:CTORECSUPER,');
         Add(' :CTORECIBOVENTAS,:VGENERICA,:SUBCAJA,:CTOCOBROF,:CTONOME,:CTONOMT,:SCTANOMSUELDO,');
         Add(' :SCTANOMIRPF,:SCTANOMPAGO,:SCTANOMSSE,:SCTANOMSST,:SCTANOMCARGO,:SCTADTOPPV,');
         Add(' :SCTADTOPPC,:CTODTOPPV,:CTODTOPPC,:SCTARETPROF,:SCTARETARRE,:CTORETPROF,');
         Add(' :CTORETARRE,:TANTORETPROF,:TANTORETARRE,:SCTAHACIVA,:CTOHACIVA,');
         Add(' :SCTAIVACEXENTO,:CTOIVACEXENTO,:CTOPAGOF,:VGENERICAC) ');
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with Fichero do begin
         Close;
         Tablename := 'datos';
         Open;
         while not EOF do begin
            QAux.Params.byname('LONGITUD_SUBCUENTAS').AsInteger := 7;
            QAux.Params.byname('FECHA_INICIO_EJERCICIO').AsDateTime := DateBeginOfYear(date);
            QAux.Params.byname('FECHA_FIN_EJERCICIO').AsDateTime := DateEndOfYear(date);
            QAux.Params.byname('SCTAIVANORMAL').AsString    := FieldByName('SCTAIVANORMAL').AsString;
            QAux.Params.byname('SCTAIVAEXENTO').AsString    := FieldByName('SCTAIVAEXENTO').AsString;
            QAux.Params.byname('SCTAIVAINTRA').AsString     := FieldByName('SCTAIVAINTRA').AsString;
            QAux.Params.byname('SCTAVENTAS').AsString       := FieldByName('SCTAVENTAS').AsString;
            QAux.Params.byname('SCTADEVOLUCION').AsString   := FieldByName('SCTADEVOLUCION').AsString;
            QAux.Params.byname('CTOIVANORMAL').AsString     := FieldByName('CTOIVANORMAL').AsString;
            QAux.Params.byname('CTOIVAEXENTO').AsString     := FieldByName('CTOIVAEXENTO').AsString;
            QAux.Params.byname('CTOIVAINTRA').AsString      := FieldByName('CTOIVAINTRA').AsString;
            QAux.Params.byname('CTOVENTAS').AsString        := FieldByName('CTOVENTAS').AsString;
            QAux.Params.byname('CTODEVOLUCION').AsString    := FieldByName('CTODEVOLUCION').AsString;
            QAux.Params.byname('CTOCLIENTES').AsString      := FieldByName('CTOCLIENTES').AsString;
            QAux.Params.byname('SCTADESCUENTO').AsString    := FieldByName('SCTADESCUENTO').AsString;
            QAux.Params.byname('SCTACOMPRAS').AsString      := FieldByName('SCTACOMPRAS').AsString;
            QAux.Params.byname('CTODESCUENTO').AsString     := FieldByName('CTODESCUENTO').AsString;
            QAux.Params.byname('CTOCOMPRAS').AsString       := FieldByName('CTOCOMPRAS').AsString;
            QAux.Params.byname('SCTAIVAREDUCIDO').AsString  := FieldByName('SCTAIVAREDUCIDO').AsString;
            QAux.Params.byname('CTOIVAREDUCIDO').AsString   := FieldByName('CTOIVAREDUCIDO').AsString;
            QAux.Params.byname('SCTAIVASUPER').AsString     := FieldByName('SCTAIVASUPER').AsString;
            QAux.Params.byname('CTOIVASUPER').AsString      := FieldByName('CTOIVASUPER').AsString;
            QAux.Params.byname('CTOPROVEEDORES').AsString   := FieldByName('CTOPROVEEDORES').AsString;
            QAux.Params.byname('SCTAIVACNORMAL').AsString   := FieldByName('SCTAIVACNORMAL').AsString;
            QAux.Params.byname('CTOIVACNORMAL').AsString    := FieldByName('CTOIVACNORMAL').AsString;
            QAux.Params.byname('SCTAIVACREDUCIDO').AsString := FieldByName('SCTAIVACREDUCIDO').AsString;
            QAux.Params.byname('CTOIVACREDUCIDO').AsString  := FieldByName('CTOIVACREDUCIDO').AsString;
            QAux.Params.byname('SCTAIVACSUPER').AsString    := FieldByName('SCTAIVACSUPER').AsString;
            QAux.Params.byname('CTOIVACSUPER').AsString     := FieldByName('CTOIVACSUPER').AsString;
            QAux.Params.byname('SCTARECNORMAL').AsString    := FieldByName('SCTARECNORMAL').AsString;
            QAux.Params.byname('CTORECNORMAL').AsString     := FieldByName('CTORECNORMAL').AsString;
            QAux.Params.byname('SCTARECREDUCIDO').AsString  := FieldByName('SCTARECREDUCIDO').AsString;
            QAux.Params.byname('CTORECREDUCIDO').AsString   := FieldByName('CTORECREDUCIDO').AsString;
            QAux.Params.byname('SCTARECSUPER').AsString     := FieldByName('SCTARECSUPER').AsString;
            QAux.Params.byname('CTORECSUPER').AsString      := FieldByName('CTORECSUPER').AsString;
            QAux.Params.byname('CTORECIBOVENTAS').AsString  := FieldByName('CTORECIBOVENTAS').AsString;
            QAux.Params.byname('VGENERICA').AsString        := FieldByName('VGENERICA').AsString;
            QAux.Params.byname('SUBCAJA').AsString          := FieldByName('SUBCAJA').AsString;
            QAux.Params.byname('CTOCOBROF').AsString        := FieldByName('CTOCOBROF').AsString;
            QAux.Params.byname('CTONOME').AsString          := FieldByName('CTONOME').AsString;
            QAux.Params.byname('CTONOMT').AsString          := FieldByName('CTONOMT').AsString;
            QAux.Params.byname('SCTANOMSUELDO').AsString    := FieldByName('SCTANOMSUELDO').AsString;
            QAux.Params.byname('SCTANOMIRPF').AsString      := FieldByName('SCTANOMIRPF').AsString;
            QAux.Params.byname('SCTANOMPAGO').AsString      := FieldByName('SCTANOMPAGO').AsString;
            QAux.Params.byname('SCTANOMSSE').AsString       := FieldByName('SCTANOMSSE').AsString;
            QAux.Params.byname('SCTANOMSST').AsString       := FieldByName('SCTANOMSST').AsString;
            QAux.Params.byname('SCTANOMCARGO').AsString     := FieldByName('SCTANOMCARGO').AsString;
            QAux.Params.byname('SCTADTOPPV').AsString       := FieldByName('SCTADTOPPV').AsString;
            QAux.Params.byname('SCTADTOPPC').AsString       := FieldByName('SCTADTOPPC').AsString;
            QAux.Params.byname('CTODTOPPV').AsString        := FieldByName('CTODTOPPV').AsString;
            QAux.Params.byname('CTODTOPPC').AsString        := FieldByName('CTODTOPPC').AsString;
            QAux.Params.byname('SCTARETPROF').AsString      := FieldByName('SCTARETPROF').AsString;
            QAux.Params.byname('SCTARETARRE').AsString      := FieldByName('SCTARETARRE').AsString;
            QAux.Params.byname('CTORETPROF').AsString       := FieldByName('CTORETPROF').AsString;
            QAux.Params.byname('CTORETARRE').AsString       := FieldByName('CTORETARRE').AsString;
            QAux.Params.byname('TANTORETPROF').AsString     := FieldByName('TANTORETPROF').AsString;
            QAux.Params.byname('TANTORETARRE').AsString     := FieldByName('TANTORETARRE').AsString;
            QAux.Params.byname('SCTAHACIVA').AsString       := FieldByName('SCTAHACIVA').AsString;
            QAux.Params.byname('CTOHACIVA').AsString        := FieldByName('CTOHACIVA').AsString;
            QAux.Params.byname('SCTAIVACEXENTO').AsString   := FieldByName('SCTAIVACEXENTO').AsString;
            QAux.Params.byname('CTOIVACEXENTO').AsString    := FieldByName('CTOIVACEXENTO').AsString;
            QAux.Params.byname('CTOPAGOF').AsString         := FieldByName('CTOPAGOF').AsString;
            QAux.Params.byname('VGENERICAC').AsString       := FieldByName('VGENERICAC').AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;
            Next;
         end;
         Close;
      end;
      cbDatos.Checked := False;
   end;
end;

procedure TWTraspasoDatos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWTraspasoDatos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWTraspasoDatos.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWTraspasoDatos.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWTraspasoDatos.BtnEdtImprimirClick(Sender: TObject);
var
   I: Integer;
begin
   QFichero.EmptyDataSet;

   for I := 0 to Memo1.Lines.Count - 1 do begin
      QFichero.Append;
      QFicheroDESCRIPCION.AsString := Copy(Memo1.Lines[I], 1, QFicheroDESCRIPCION.Size);
      QFichero.Post;
   end;

   QFichero.First;

   FormPrincipal.LanzarListado('LIncidenciasTraspaso.rtm', SFichero);
end;

procedure TWTraspasoDatos.FormCreate(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('DESCRIPCION', ftString, 250, False);
      Add('Asiento1', ftInteger, 0, False);
      Add('Asiento2', ftInteger, 0, False);
      Add('Fecha1', ftdateTime, 0, False);
      Add('Fecha2', ftdateTime, 0, False);
      CreateDataSet;
      Active := True;
      append;
      edit;
      FieldByName('Asiento1').AsInteger := 0;
      FieldByName('Asiento2').AsInteger := 9999999;
      FieldByName('Fecha1').AsDateTime  := date;
      FieldByName('Fecha2').AsDateTime  := date;
      post;
   end;
end;

procedure TWTraspasoDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
