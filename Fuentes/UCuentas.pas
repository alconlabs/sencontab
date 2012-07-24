unit UCuentas;
interface
uses Buttons, Classes, ComCtrls, Controls, Chart, Db, DBClient, DBCtrls, DBChart, DBTables, Dialogs,
     ExtCtrls, fcButton, fcImage, fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase,
     IBSQL, IBTableSet, jpeg, Mask, Menus, Messages, navegadorNotarios, OvcBase, OvcDbDat, OvcDbNF, OvcDbPF,
     OvcEdCal, OvcEditF, OvcEdPop, OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, ppCache, ppComm, ppDB, ppDBPipe,
     ppRelatv, Series, StdCtrls, SysUtils, TeEngine, TeeProcs, Windows, Wwdbcomb, wwdbedit,
     Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, wwSpeedButton,
     CustomView;
type
   TWCuentas = class(TCustomView)
      Paginas:       TOvcNotebook;
      BtnNavAnadir:  TfcImageBtn;
      BtnNavBorrar:  TfcImageBtn;
      BtnEdtAceptar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      BtnNavCerrar:  TfcImageBtn;
      Label2:        TLabel;
      Shape1:        TShape;
      BtnNavImprimir: TfcImageBtn;
      QFichero:      TIBTableSet;
      Transaccion:   TIBTransaction;
      CDSFiltro:     TClientDataSet;
      DSFiltro:      TDataSource;
      OvcController1: TOvcController;
      FiltroBuscar:  TGroupBox;
      Label1:        TLabel;
      Label12:       TLabel;
      FiltroBDescripcion: TOvcDbPictureField;
      GroupBox1:     TGroupBox;
      Label3:        TLabel;
      NavAnimate:    TAnimate;
      SpFiltro:      TSpeedButton;
      OvcDescripcion: TOvcDbPictureField;
      Label30:       TLabel;
      Aux:           TfcImageBtn;
      Panel5:        TPanel;
      Panel3:        TPanel;
      Panel4:        TPanel;
      Rejilla:       TwwDBGrid;
      fcImageBtnMinimizar: TfcImageBtn;
      fcIBCerrar:    TfcImageBtn;
      Navegador:     TDBNavegadorNotarios;
      DSFichero:     TDataSource;
      FiltroBCuenta: TOvcDbPictureField;
      OvcCuenta:     TOvcDbPictureField;
      QAux:          TIBSQL;
      ComboGrupo1:   TwwDBLookupCombo;
      ComboGrupo2:   TwwDBLookupCombo;
      ComboGrupo1Desc: TwwDBLookupCombo;
      ComboGrupo2Desc: TwwDBLookupCombo;
      Label4:        TLabel;
      Label5:        TLabel;
      DBRadioGroup1: TDBRadioGroup;
      PaginasInterno: TOvcNotebook;
      GroupBox2:     TGroupBox;
      GroupBox3:     TGroupBox;
      OvcDbNumericField3: TOvcDbNumericField;
      OvcDbNumericField1: TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      OvcDbNumericField4: TOvcDbNumericField;
      OvcDbNumericField5: TOvcDbNumericField;
      OvcDbNumericField6: TOvcDbNumericField;
      GroupBox4:     TGroupBox;
      OvcDbNumericField7: TOvcDbNumericField;
      OvcDbNumericField8: TOvcDbNumericField;
      OvcDbNumericField9: TOvcDbNumericField;
      OvcDbNumericField10: TOvcDbNumericField;
      OvcDbNumericField11: TOvcDbNumericField;
      OvcDbNumericField12: TOvcDbNumericField;
      Label6:        TLabel;
      Label7:        TLabel;
      Label8:        TLabel;
      Label9:        TLabel;
      Label10:       TLabel;
      Label11:       TLabel;
      GroupBox5:     TGroupBox;
      Label13:       TLabel;
      Label14:       TLabel;
      Label15:       TLabel;
      Label16:       TLabel;
      Label17:       TLabel;
      Label18:       TLabel;
      GroupBox6:     TGroupBox;
      OvcDbNumericField13: TOvcDbNumericField;
      OvcDbNumericField14: TOvcDbNumericField;
      OvcDbNumericField15: TOvcDbNumericField;
      OvcDbNumericField16: TOvcDbNumericField;
      OvcDbNumericField17: TOvcDbNumericField;
      OvcDbNumericField18: TOvcDbNumericField;
      GroupBox7:     TGroupBox;
      OvcDbNumericField19: TOvcDbNumericField;
      OvcDbNumericField20: TOvcDbNumericField;
      OvcDbNumericField21: TOvcDbNumericField;
      OvcDbNumericField22: TOvcDbNumericField;
      OvcDbNumericField23: TOvcDbNumericField;
      OvcDbNumericField24: TOvcDbNumericField;
      OvcDbNumericField25: TOvcDbNumericField;
      OvcDbNumericField26: TOvcDbNumericField;
      Label19:       TLabel;
      Label20:       TLabel;
      GroupBox8:     TGroupBox;
      Label21:       TLabel;
      Label22:       TLabel;
      Label23:       TLabel;
      Label24:       TLabel;
      Label25:       TLabel;
      Label26:       TLabel;
      GroupBox9:     TGroupBox;
      OvcDbNumericField27: TOvcDbNumericField;
      OvcDbNumericField28: TOvcDbNumericField;
      OvcDbNumericField29: TOvcDbNumericField;
      OvcDbNumericField30: TOvcDbNumericField;
      OvcDbNumericField31: TOvcDbNumericField;
      OvcDbNumericField32: TOvcDbNumericField;
      GroupBox10:    TGroupBox;
      OvcDbNumericField33: TOvcDbNumericField;
      OvcDbNumericField34: TOvcDbNumericField;
      OvcDbNumericField35: TOvcDbNumericField;
      OvcDbNumericField36: TOvcDbNumericField;
      OvcDbNumericField37: TOvcDbNumericField;
      OvcDbNumericField38: TOvcDbNumericField;
      GroupBox11:    TGroupBox;
      Label27:       TLabel;
      Label28:       TLabel;
      Label29:       TLabel;
      Label31:       TLabel;
      Label32:       TLabel;
      Label33:       TLabel;
      GroupBox12:    TGroupBox;
      OvcDbNumericField39: TOvcDbNumericField;
      OvcDbNumericField40: TOvcDbNumericField;
      OvcDbNumericField41: TOvcDbNumericField;
      OvcDbNumericField42: TOvcDbNumericField;
      OvcDbNumericField43: TOvcDbNumericField;
      OvcDbNumericField44: TOvcDbNumericField;
      GroupBox13:    TGroupBox;
      OvcDbNumericField45: TOvcDbNumericField;
      OvcDbNumericField46: TOvcDbNumericField;
      OvcDbNumericField47: TOvcDbNumericField;
      OvcDbNumericField48: TOvcDbNumericField;
      OvcDbNumericField49: TOvcDbNumericField;
      OvcDbNumericField50: TOvcDbNumericField;
      OvcDbNumericField51: TOvcDbNumericField;
      OvcDbNumericField52: TOvcDbNumericField;
      Label34:       TLabel;
      Label35:       TLabel;
      QFicheroDESCRIPCION: TIBStringField;
      QFicheroTIPOCUENTA: TIBStringField;
      QFicheroGRUPO1: TIBStringField;
      QFicheroGRUPO2: TIBStringField;
      QFicheroSUMADB: TFloatField;
      QFicheroSUMAHB: TFloatField;
      QFicheroACUDB01: TFloatField;
      QFicheroACUDB02: TFloatField;
      QFicheroACUDB03: TFloatField;
      QFicheroACUDB04: TFloatField;
      QFicheroACUDB05: TFloatField;
      QFicheroACUDB06: TFloatField;
      QFicheroACUDB07: TFloatField;
      QFicheroACUDB08: TFloatField;
      QFicheroACUDB09: TFloatField;
      QFicheroACUDB10: TFloatField;
      QFicheroACUDB11: TFloatField;
      QFicheroACUDB12: TFloatField;
      QFicheroACUHB01: TFloatField;
      QFicheroACUHB02: TFloatField;
      QFicheroACUHB03: TFloatField;
      QFicheroACUHB04: TFloatField;
      QFicheroACUHB05: TFloatField;
      QFicheroACUHB06: TFloatField;
      QFicheroACUHB07: TFloatField;
      QFicheroACUHB08: TFloatField;
      QFicheroACUHB09: TFloatField;
      QFicheroACUHB10: TFloatField;
      QFicheroACUHB11: TFloatField;
      QFicheroACUHB12: TFloatField;
      QFicheroANTDB01: TFloatField;
      QFicheroANTDB02: TFloatField;
      QFicheroANTDB03: TFloatField;
      QFicheroANTDB04: TFloatField;
      QFicheroANTDB05: TFloatField;
      QFicheroANTDB06: TFloatField;
      QFicheroANTDB07: TFloatField;
      QFicheroANTDB08: TFloatField;
      QFicheroANTDB09: TFloatField;
      QFicheroANTDB10: TFloatField;
      QFicheroANTDB11: TFloatField;
      QFicheroANTDB12: TFloatField;
      QFicheroANTHB01: TFloatField;
      QFicheroANTHB02: TFloatField;
      QFicheroANTHB03: TFloatField;
      QFicheroANTHB04: TFloatField;
      QFicheroANTHB05: TFloatField;
      QFicheroANTHB06: TFloatField;
      QFicheroANTHB07: TFloatField;
      QFicheroANTHB08: TFloatField;
      QFicheroANTHB09: TFloatField;
      QFicheroANTHB10: TFloatField;
      QFicheroANTHB11: TFloatField;
      QFicheroANTHB12: TFloatField;
      QFicheroANTHB: TFloatField;
      QFicheroANTDB: TFloatField;
      QFicheroCUENTA: TIBStringField;
      QFicheroTipoCuentaDesc: TIBStringField;
      BtnNavModificar: TfcImageBtn;
      DBText2:       TDBText;
      DBText1:       TDBText;
      Label36:       TLabel;
      FiltroBTitulo: TOvcDbPictureField;
      Label37:       TLabel;
      FiltroBGrupo:  TOvcDbPictureField;
      PagGraficos:   TOvcNotebook;
      ChartActual:   TDBChart;
      Series1:       TBarSeries;
      ChartAnterior: TDBChart;
      BarSeries1:    TBarSeries;
      ChartCompara:  TDBChart;
      BarSeries2:    TBarSeries;
      Series2:       TBarSeries;
      Panel1:        TPanel;
      Formulario:    TfcImageForm;
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnNavAnadirClick(Sender: TObject);
      procedure PaginasPageChanged(Sender: TObject; Index: Integer);
      procedure RejillaDblClick(Sender: TObject);
      procedure QFicheroBeforeOpen(DataSet: TDataSet);
      procedure fcIBMinimizarClick(Sender: TObject);
      procedure BtnNavAnadirMouseEnter(Sender: TObject);
      procedure BtnNavAnadirMouseLeave(Sender: TObject);
      procedure QFicheroAfterEdit(DataSet: TDataSet);
      procedure FiltroBCuentaEnter(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnNavBorrarClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
         AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure FormShow(Sender: TObject);
      procedure CreateParams(var Params: TCreateParams); override;
      procedure FiltroBCuentaExit(Sender: TObject);
      procedure BtnNavImprimirClick(Sender: TObject);
      procedure SpFiltroClick(Sender: TObject);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure OvcCuentaEnter(Sender: TObject);
      procedure QFicheroAfterScroll(DataSet: TDataSet);
   private
      lAdd:       Boolean;
      CampoOrden: String;
      x:          Integer;
      procedure ActivarTransacciones;
      procedure PrepararQuery;
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure RellenaChart;
   public
   end;

const
   TabCuentas    = 0;
   TabDatos      = 1;
   TabAcumulados = 2;
   TabGraficos   = 3;

var WCuentas: TWCuentas;
implementation
uses DM, DMConta, General, Globales, MenuPrincipal;
{$R *.DFM}

procedure TWCuentas.PrepararQuery;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM Cuentas WHERE Cuenta IS NOT NULL');

      if CDSFiltro.FieldByName('BCuenta').AsString <> '' then   begin
         add('AND Cuenta LIKE :BCuenta ');
      end
      else
      if CDSFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         add('AND Upper(Descripcion) LIKE Upper(:BDescripcion)');
      end
      else
      if CDSFiltro.FieldByName('BTITULO').AsString <> '' then   begin
         Add('AND (GRUPO1 LIKE :TITULO OR GRUPO2 LIKE :TITULO)');
      end
      else
      if CDSFiltro.FieldByName('BGRUPO').AsString <> '' then   begin
         Add('AND (GRUPO1 LIKE :GRUPO OR GRUPO2 LIKE :GRUPO)');
      end;

      CampoOrden := UpperCase(Trim(CampoOrden));
      if CampoOrden <> '' then   begin
         Add('ORDER BY ' + CampoOrden);
      end
      else begin
         Add('ORDER BY Cuenta');
      end;

      // PARÁMETROS
      if CDSFiltro.FieldByName('BCuenta').AsString <> '' then   begin
         Params.byname('BCuenta').AsString :=
            Trim(CDSFiltro.FieldByName('BCuenta').AsString);
         if Length(CdsFiltro.FieldByName('BCuenta').AsString) <> 3 then   begin
            Params.byname('BCuenta').AsString :=
               Params.byname('BCuenta').AsString + '%';
         end;
      end
      else
      if CDSFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         Params.byname('BDescripcion').AsString :=
            Trim(CDSFiltro.FieldByName('BDescripcion').AsString) + '%';
      end
      else
      if CDSFiltro.FieldByName('BTITULO').AsString <> '' then   begin
         Params.ByName('TITULO').AsString := CDSFiltro.FieldByName('BTITULO').AsString + '%';
      end
      else
      if CDSFiltro.FieldByName('BGRUPO').AsString <> '' then   begin
         Params.ByName('GRUPO').AsString :=
            Copy(CDSFiltro.FieldByName('BGRUPO').AsString + '%', 1,
            CDSFiltro.FieldByName('BGRUPO').Size);
      end;

      Prepare;
      EnableControls;
      Open;

   end;
   SpFiltro.Flat := True;
end;

procedure TWCuentas.ActivarTransacciones;
var
   i: Word;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if (Components[i] is TibTransaction) then   begin
         TibTransaction(Components[i]).active := False;
         TibTransaction(Components[i]).Params.Clear;
         TibTransaction(Components[i]).Params.add('Read_committed');
         TibTransaction(Components[i]).Params.add('Rec_version');
         TibTransaction(Components[i]).Params.add('Write');
         TibTransaction(Components[i]).active := True;
      end;
   end;
end;

procedure TWCuentas.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('BCuenta', ftString, 3, False);
         Add('BDescripcion', ftstring, 50, False);
         Add('BTITULO', ftstring, 2, False);
         Add('BGRUPO', ftstring, 3, False);
      end;
      CreateDataSet;
      active := True;
      Append;
   end;
end;

procedure TWCuentas.InicializarFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('BCuenta').AsString      := '';
      FieldByName('BDescripcion').AsString := '';
      FieldByName('BTITULO').AsString      := '';
      FieldByName('BGRUPO').AsString       := '';
   end;
end;

procedure TWCuentas.RellenaChart;
var
   I: Integer;
begin
   ChartActual.Title.Text.Clear;
   ChartActual.Title.Text.Add(gvNombreEmpresaMenu);

   ChartActual.Foot.Text.Clear;
   ChartActual.Foot.Text.Add(QFicheroCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   ChartAnterior.Title.Text.Clear;
   ChartAnterior.Title.Text.Add(gvNombreEmpresaMenu);

   ChartAnterior.Foot.Text.Clear;
   ChartAnterior.Foot.Text.Add(QFicheroCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   ChartCompara.Title.Text.Clear;
   ChartCompara.Title.Text.Add(gvNombreEmpresaMenu);

   ChartCompara.Foot.Text.Clear;
   ChartCompara.Foot.Text.Add(QFicheroCUENTA.AsString + '   ' + QFicheroDESCRIPCION.AsString);

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DMContaRef, QGraficos do begin
      EmptyDataSet;
      for I := 1 to 12 do begin
         Append;
         QGraficosNUMMES.AsInteger := I;
         case I of
            1: begin
               QGraficosMES.AsString     := 'Ene';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB01.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB01.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB01.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB01.AsFloat;
            end;
            2: begin
               QGraficosMES.AsString     := 'Feb';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB02.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB02.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB02.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB02.AsFloat;
            end;
            3: begin
               QGraficosMES.AsString     := 'Mar';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB03.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB03.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB03.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB03.AsFloat;
            end;
            4: begin
               QGraficosMES.AsString     := 'Abr';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB04.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB04.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB04.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB04.AsFloat;
            end;
            5: begin
               QGraficosMES.AsString     := 'May';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB05.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB05.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB05.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB05.AsFloat;
            end;
            6: begin
               QGraficosMES.AsString     := 'Jun';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB06.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB06.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB06.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB06.AsFloat;
            end;
            7: begin
               QGraficosMES.AsString     := 'Jul';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB07.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB07.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB07.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB07.AsFloat;
            end;
            8: begin
               QGraficosMES.AsString     := 'Ago';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB08.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB08.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB08.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB08.AsFloat;
            end;
            9: begin
               QGraficosMES.AsString     := 'Sep';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB09.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB09.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB09.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB09.AsFloat;
            end;
            10: begin
               QGraficosMES.AsString     := 'Oct';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB10.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB10.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB10.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB10.AsFloat;
            end;
            11: begin
               QGraficosMES.AsString     := 'Nov';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB11.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB11.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB11.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB11.AsFloat;
            end;
            12: begin
               QGraficosMES.AsString     := 'Dic';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB12.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB12.AsFloat;
               QGraficosHABERACT.AsFloat := QFicheroACUHB12.AsFloat;
               QGraficosHABERANT.AsFloat := QFicheroANTHB12.AsFloat;
            end;
            13: begin
               QGraficosMES.AsString     := 'Tot';
               QGraficosDEBEACT.AsFloat  := QFicheroACUDB01.AsFloat + QFicheroACUDB02.AsFloat +
                  QFicheroACUDB03.AsFloat + QFicheroACUDB04.AsFloat +
                  QFicheroACUDB05.AsFloat + QFicheroACUDB06.AsFloat +
                  QFicheroACUDB07.AsFloat + QFicheroACUDB08.AsFloat +
                  QFicheroACUDB09.AsFloat + QFicheroACUDB10.AsFloat +
                  QFicheroACUDB11.AsFloat + QFicheroACUDB12.AsFloat;
               QGraficosDEBEANT.AsFloat  := QFicheroANTDB01.AsFloat + QFicheroANTDB02.AsFloat +
                  QFicheroANTDB03.AsFloat + QFicheroANTDB04.AsFloat +
                  QFicheroANTDB05.AsFloat + QFicheroANTDB06.AsFloat +
                  QFicheroANTDB07.AsFloat + QFicheroANTDB08.AsFloat +
                  QFicheroANTDB09.AsFloat + QFicheroANTDB10.AsFloat +
                  QFicheroANTDB11.AsFloat + QFicheroANTDB12.AsFloat;
               QGraficosHABERACT.AsFloat :=
                  QFicheroACUHB01.AsFloat + QFicheroACUHB02.AsFloat +
                  QFicheroACUHB03.AsFloat + QFicheroACUHB04.AsFloat +
                  QFicheroACUHB05.AsFloat + QFicheroACUHB06.AsFloat +
                  QFicheroACUHB07.AsFloat + QFicheroACUHB08.AsFloat +
                  QFicheroACUHB09.AsFloat + QFicheroACUHB10.AsFloat +
                  QFicheroACUHB11.AsFloat + QFicheroACUHB12.AsFloat;
               QGraficosHABERANT.AsFloat :=
                  QFicheroANTHB01.AsFloat + QFicheroANTHB02.AsFloat +
                  QFicheroANTHB03.AsFloat + QFicheroANTHB04.AsFloat +
                  QFicheroANTHB05.AsFloat + QFicheroANTHB06.AsFloat +
                  QFicheroANTHB07.AsFloat + QFicheroANTHB08.AsFloat +
                  QFicheroANTHB09.AsFloat + QFicheroANTHB10.AsFloat +
                  QFicheroANTHB11.AsFloat + QFicheroANTHB12.AsFloat;
            end;
         end;

         // Situar cuentas
         if (Copy(QFicheroGRUPO1.AsString, 1, 1) = 'A') or (Copy(QFicheroGRUPO1.AsString, 1, 1) = 'D') or
            (Copy(QFicheroGRUPO2.AsString, 1, 1) = 'A') or
            (Copy(QFicheroGRUPO2.AsString, 1, 1) = 'D') then
         begin
            // Debe
            QGraficosSALDOACT.AsFloat := RoundToDecimal(QGraficosDEBEACT.AsFloat, 0, True);
            QGraficosSALDOANT.AsFloat := RoundToDecimal(QGraficosDEBEANT.AsFloat, 0, True);
         end
         else begin
            // Haber
            QGraficosSALDOACT.AsFloat := RoundToDecimal(QGraficosHABERACT.AsFloat, 2, True);
            QGraficosSALDOANT.AsFloat := RoundToDecimal(QGraficosHABERANT.AsFloat, 2, True);
         end;
         Post;
      end;     
   end;
end;

procedure TWCuentas.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCuentas.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCuentas.FormCreate(Sender: TObject);
begin
   x := GetSystemMetrics(SM_CXSCREEN);

   Paginas.Width  := 655;
   Paginas.Height := 430;

   ActivarTransacciones;
   CrearFiltro;
   InicializarFiltro;

   CampoOrden := 'Cuenta';
   PrepararQuery;
   Modo(Self, Naveg);

   Paginas.Pages[TabCuentas].Show;
end;

procedure TWCuentas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobación del filtro por número de cuenta
      if (FiltroBCuenta.Focused) and (Trim(FiltroBCuenta.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobación del filtro por Descripción de la cuenta
      else
      if (FiltroBDescripcion.Focused) and (Trim(FiltroBDescripcion.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         PrepararQuery;
      end

      //Si no es ninguno de los otros, dos pasamos al siguiente control
      else
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWCuentas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Anterior: Boolean;
   Salir:    Boolean;
begin
   case Key of
      VK_ESCAPE: begin
         Salir := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Salir := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Salir := False;
            end;
         end;
         if Salir then begin
            if TDataSet(Navegador.DataSource.DataSet).State in
               dsEditModes then begin
               BtnEdtCancelar.Click;
            end
            else begin
               BtnNavCerrar.Click;
            end;
         end;
      end;
      VK_SPACE: begin
         if (ActiveControl <> FiltroBCuenta) and (ActiveControl <> FiltroBDescripcion) and
            (ActiveControl <> FiltroBTitulo) and
            (ActiveControl <> FiltroBGrupo) and not
            (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then   begin
            if not (TDataSet(Navegador.DataSource.DataSet).State in dsEditModes) then begin
               Key := 0;
               RejillaDblClick(Self);
            end;
         end;
      end;
      VK_F3: begin
         if TDataSet(Navegador.DataSource.DataSet).State in dsEditModes then begin
            BtnEdtAceptar.Click;
         end;
      end;
      VK_F5: begin
         if (ActiveControl is TwwDBLookupCombo) then begin
            TwwDBLookupCombo(ActiveControl).DropDown;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            TwwDBComboBox(ActiveControl).DropDown;
         end;
      end;
      VK_F12: begin
         if not (QFichero.State in dsEditModes) then begin
            SpFiltro.Click;
         end;
      end;
      VK_UP: begin
         Anterior := True;
         if (ActiveControl is TwwDBLookupCombo) then begin
            if TwwDBLookupCombo(ActiveControl).Grid.Visible then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBComboBox) then begin
            if TwwDBComboBox(ActiveControl).DroppedDown then begin
               Anterior := False;
            end;
         end
         else
         if (ActiveControl is TwwDBGrid) then begin
            Anterior := False;
         end;

         if Anterior then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
   end;
end;

procedure TWCuentas.BtnNavAnadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   lAdd := True;
   try
      Paginas.PageIndex := TabDatos;
      QFichero.Insert;
      OvcCuenta.SetFocus;
      Modo(Self, Edita);
      PaginasPageChanged(Self, TabDatos);
   except
      raise;
      DatabaseError('Error al añadir una nueva cuenta.');
   end;
end;

procedure TWCuentas.PaginasPageChanged(Sender: TObject; Index: Integer);
begin
   case Index of
      TabDatos: begin
         BtnNavAnadir.Visible := not (QFichero.State in dsEditModes);
         BtnNavBorrar.Visible := not (QFichero.State in dsEditModes);
      end;
      TabGraficos: begin
         RellenaChart;
      end;
   end;
end;

procedure TWCuentas.RejillaDblClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then  begin
      lAdd := False;
      try
         QFichero.Edit;
         Modo(Self, Edita);
         Paginas.PageIndex := TabDatos;
         OvcDescripcion.SetFocus;
      except MessageDlg('No se puede editar el registro seleccionado.' + #13 +
                        'Puede estar en uso por otra persona.', mtInformation, [mbOK], 0);
      end;
   end;
end;

procedure TWCuentas.QFicheroBeforeOpen(DataSet: TDataSet);
begin
   QFichero.EnableControls;
end;

procedure TWCuentas.fcIBMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWCuentas.BtnNavAnadirMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCuentas.BtnNavAnadirMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCuentas.QFicheroAfterEdit(DataSet: TDataSet);
begin
   PaginasPageChanged(Self, TabDatos);
end;

procedure TWCuentas.FiltroBCuentaEnter(Sender: TObject);
begin
   if not (CDSFiltro.state in dseditmodes) then begin
      CDSFiltro.edit;
   end;
   CDSFiltro.FieldByName('BCuenta').AsString      := '';
   CDSFiltro.FieldByName('BDescripcion').AsString := '';
   CDSFiltro.FieldByName('BTITULO').AsString      := '';
   CDSFiltro.FieldByName('BGRUPO').AsString       := '';
end;

procedure TWCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WCuentas   := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWCuentas.BtnNavBorrarClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if QFichero.IsEmpty then begin
      Exit;
   end;

   if MessageDlg('¿Quiere borrar esta cuenta? ' + #13 + QFicheroDescripcion.AsString,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      QFichero.Delete;
      QFichero.Transaction.CommitRetaining;
   end;
end;

procedure TWCuentas.BtnEdtAceptarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   QFichero.Post;
   Transaccion.CommitRetaining;
   DMContaRef.RefrescarSubcuentas(
      QFicheroCUENTA.AsString + REPLICATE('0', DMRef.QParametros.FieldByName(
      'LONGITUD_SUBCUENTAS').AsInteger - Length(Trim(QFicheroCUENTA.AsString))));

   Modo(Self, Naveg);
   Paginas.Pages[TabCuentas].Show;
   Rejilla.SetFocus;
end;

procedure TWCuentas.BtnEdtCancelarClick(Sender: TObject);
begin
   if MessageDlg('¿Quiere anular los cambios realizados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Cancel;
      except DatabaseError('Error al cancelar la operación');
      end;

      Modo(Self, Naveg);
      Paginas.PageIndex := TabCuentas;

      Rejilla.SetFocus;
   end;
end;

procedure TWCuentas.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(CampoOrden)) then   begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWCuentas.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'CUENTA') or (UpperCase(AFieldName) = 'DESCRIPCION') then  begin
      CampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;

end;

procedure TWCuentas.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
   FiltroBCuenta.SetFocus;
end;

procedure TWCuentas.CreateParams(var Params: TCreateParams);
begin
   inherited;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with params do begin
      style          := (style or ws_popup) and not ws_dlgframe and not ws_clipchildren;
      doublebuffered := True;
   end;
end;

procedure TWCuentas.FiltroBCuentaExit(Sender: TObject);
begin
   if (CDSFiltro.State in dseditmodes) then begin
      CDSFiltro.post;
   end;
   if QFichero.State in dsEditModes then begin
      Exit;
   end;
   if ((Sender is TOvcDbNumericField) and (StrToInt(TOvcDbNumericField(Sender).Text) <> 0)) or
      ((Sender is TOvcDbPictureField) and (TOvcDbPictureField(Sender).Text <> '')) then begin
      if CDSFiltro.FieldByName('BCuenta').AsString <> '' then   begin
         CampoOrden := 'Cuenta';
      end
      else
      if CDSFiltro.FieldByName('BDescripcion').AsString <> '' then   begin
         CampoOrden := 'Descripcion';
      end;
      PrepararQuery;
   end;
end;

procedure TWCuentas.BtnNavImprimirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if Paginas.PageIndex = TabGraficos then begin
      if MessageDlg('¿Desea imprimir este gráfico?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         case PagGraficos.PageIndex of
            0: begin
               ChartActual.PrintLandscape;
            end;
            1: begin
               ChartAnterior.PrintLandscape;
            end;
            2: begin
               ChartCompara.PrintLandscape;
            end;
         end;
      end;
   end
   else begin
      FormPrincipal.LanzarListado('LCuentas.rtm', DSFichero);
   end;
end;

procedure TWCuentas.SpFiltroClick(Sender: TObject);
begin

   if (CDSFiltro.State in dseditmodes) then begin
      CDSFiltro.post;
   end;

   NavAnimate.Active  := True;
   NavAnimate.Visible := True;

   FiltroBCuentaEnter(nil);

   PrepararQuery;

   NavAnimate.Visible := False;
   NavAnimate.Active  := False;
   Paginas.Pages[TabCuentas].Show;
   FiltroBuscar.SetFocus;
end;

procedure TWCuentas.fcImageBtnMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWCuentas.QFicheroCalcFields(DataSet: TDataSet);
begin
   if Dataset.FieldByName('TipoCuenta').AsString = 'C' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Clientes';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'P' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Proveedores';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'R' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'I.V.A. Devengado';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'S' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'I.V.A. Deducible';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'M' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Amort. Mater.';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'I' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Amort. Inmate.';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'B' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Banco/Caja';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'V' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Ventas';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'A' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Compras';
   end
   else
   if Dataset.FieldByName('TipoCuenta').AsString = 'O' then   begin
      Dataset.FieldByName('TipoCuentaDesc').AsString := 'Otras';
   end;
end;

procedure TWCuentas.OvcCuentaEnter(Sender: TObject);
begin
   if not lAdd then begin
      Perform(wm_NextDlgCtl, 0, 0);
   end;
end;

procedure TWCuentas.QFicheroAfterScroll(DataSet: TDataSet);
begin
   if Paginas.PageIndex = TabGraficos then begin
      RellenaChart;
   end;
end;

end.
