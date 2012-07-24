unit UCarteraEfectos;
interface
uses Buttons, Classes, ComCtrls, ComObj, Controls, Db, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls,
     fcButton, fcImage, fcimageform, fcImgBtn, fcpanel, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase,
     IBQuery, IBSQL, IBTableSet, jpeg, Mask, Menus, Messages, navegadorNotarios, OvcBase, OvcDbDat, OvcDbNF,
     OvcDbPF, OvcEdCal, OvcEditF, OvcEdPop, OvcEF, OvcNbk, OvcNF, OvcPB, OvcPF, ppCache, ppComm, ppDB,
     ppDBPipe, ppRelatv, StdCtrls, SysUtils, variants, Windows, word_tlb, Wwdbcomb,
     wwdbdatetimepicker, wwdbedit, Wwdbgrid, Wwdbigrd, wwdblook, Wwdotdot, wwSpeedButton, Wwtable,
     CustomView;
type
   TWCarteraEfectos = class(TCustomView)
      Paginas:       TOvcNotebook;
      BtnNavAnadir:  TfcImageBtn;
      BtnNavBorrar:  TfcImageBtn;
      BtnEdtAceptar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      BtnNavCerrar:  TfcImageBtn;
      Label2:        TLabel;
      Shape1:        TShape;
      BtnNavListados: TfcImageBtn;
      QFichero:      TIBTableSet;
      Transaccion:   TIBTransaction;
      CDSFiltro:     TClientDataSet;
      DSFiltro:      TDataSource;
      OvcController1: TOvcController;
      FiltroBuscar:  TGroupBox;
      Label1:        TLabel;
      Label12:       TLabel;
      FiltroBFactProveedor: TOvcDbPictureField;
      NavAnimate:    TAnimate;
      SpFiltro:      TSpeedButton;
      PopupMenuListados: TPopupMenu;
      InformeFVenc:  TMenuItem;
      Aux:           TfcImageBtn;
      Panel5:        TPanel;
      Panel3:        TPanel;
      Panel4:        TPanel;
      Rejilla:       TwwDBGrid;
      fcImageBtnMinimizar: TfcImageBtn;
      fcIBCerrar:    TfcImageBtn;
      Navegador:     TDBNavegadorNotarios;
      DSFichero:     TDataSource;
      FiltroBFactCliente: TOvcDbPictureField;
      BtnNavModificar: TfcImageBtn;
      Bevel1:        TBevel;
      Bevel2:        TBevel;
      Label3:        TLabel;
      Label4:        TLabel;
      Label5:        TLabel;
      Label6:        TLabel;
      Label7:        TLabel;
      Label8:        TLabel;
      Label9:        TLabel;
      Label10:       TLabel;
      Label11:       TLabel;
      Label13:       TLabel;
      Bevel3:        TBevel;
      Label15:       TLabel;
      CCuenta:       TwwDBLookupCombo;
      wwDBLookupCombo6: TwwDBLookupCombo;
      Situacion:     TwwDBComboBox;
      CBanco:        TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      OvcDbPictureField4: TOvcDbPictureField;
      FCliente:      TOvcDbPictureField;
      FProveedor:    TOvcDbPictureField;
      eImporte:      TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      QFicheroID_CARTERAEFECTOS: TIntegerField;
      QFicheroSUBCUENTA: TIBStringField;
      QFicheroSITUACION: TIBStringField;
      QFicheroSUBCTABANCO: TIBStringField;
      QFicheroCONCEPTO: TIBStringField;
      QFicheroFEMISION: TDateTimeField;
      QFicheroFASIENTO: TDateTimeField;
      QFicheroIMPORTE: TFloatField;
      QFicheroFACTCLIENT: TIBStringField;
      QFicheroFACTPROVEEDOR: TIBStringField;
      QFicheroFVENCIMIENTO: TDateTimeField;
      QFicheroCOMERCIAL: TIBStringField;
      QFicheroIMPCOMISION: TFloatField;
      eFechaEmision: TwwDBDateTimePicker;
      eFechaVencimiento: TwwDBDateTimePicker;
      eFechaAsiento: TwwDBDateTimePicker;
      QFicheroDescSituacion: TStringField;
      QFicheroNumeroFactura: TStringField;
      InformeporSubcuenta1: TMenuItem;
      InformeporBanco1: TMenuItem;
      InformeporSituacin1: TMenuItem;
      InformeporComercial1: TMenuItem;
      Panel1:        TPanel;
      GroupBox2:     TGroupBox;
      Label16:       TLabel;
      Label24:       TLabel;
      Label25:       TLabel;
      Label20:       TLabel;
      Label18:       TLabel;
      Label19:       TLabel;
      FiltroFechaVencimDesde: TwwDBDateTimePicker;
      FiltroFechaVencimHasta: TwwDBDateTimePicker;
      FiltroImporteDesde: TOvcDbNumericField;
      FiltroImporteHasta: TOvcDbNumericField;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBDESCSUBCUENTABANCO: TwwDBLookupCombo;
      FiltroCBSUBCUENTABANCO: TwwDBLookupCombo;
      Label17:       TLabel;
      FiltroFechaEmisionDesde: TwwDBDateTimePicker;
      FiltroFechaEmisionHasta: TwwDBDateTimePicker;
      Label22:       TLabel;
      FiltroComercial: TwwDBLookupCombo;
      FiltroMoneda:  TDBRadioGroup;
      FiltroCBDESCSUBCUENTAHasta: TwwDBLookupCombo;
      FiltroCBSUBCUENTAHasta: TwwDBLookupCombo;
      FiltroFactClienteDesde: TOvcDbPictureField;
      FiltroFactClienteHasta: TOvcDbPictureField;
      Label23:       TLabel;
      FiltroFactProvDesde: TOvcDbPictureField;
      FiltroFactProvHasta: TOvcDbPictureField;
      Label26:       TLabel;
      Label27:       TLabel;
      QFicheroCalcImporte: TFloatField;
      QFicheroDescSubcuenta: TStringField;
      QFicheroDescSubcuentaBanco: TStringField;
      Label14:       TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      QFicheroCalcComision: TFloatField;
      BtnPermAsiento: TfcImageBtn;
      FiltroSituacion: TGroupBox;
      FiltroPendiente: TCheckBox;
      FiltroRemesado: TCheckBox;
      FiltroCobrado: TCheckBox;
      FiltroDevuelto: TCheckBox;
      FiltroPagado:  TCheckBox;
      FiltroAceptado: TCheckBox;
      FiltroVencido: TCheckBox;
      QFicheroNomComercial: TStringField;
      BtnNavSeleccion: TfcImageBtn;
      FiltroFechaAsientoHasta: TwwDBDateTimePicker;
      FiltroFechaAsientoDesde: TwwDBDateTimePicker;
      Label21:       TLabel;
      FiltroRemesasBancarias: TCheckBox;
      DBText1:       TDBText;
      BtnNavCarta:   TfcImageBtn;
      BtnNavEfectos: TfcImageBtn;
      Label28:       TLabel;
      FiltroBNumero: TOvcDbNumericField;
      BtnNavAsientoBaja: TfcImageBtn;
      QFicheroASIENTORIESGO: TIntegerField;
      Panel2:        TPanel;
      FiltroBImporte: TOvcDbNumericField;
      Label29:       TLabel;
      Formulario:    TfcImageForm;
      Qaux:          TIBSQL;
      QFicheroEJERCICIO: TIntegerField;
      QFicheroSERIE: TIBStringField;
      lbEjercicio:   TLabel;
      lbSerie:       TLabel;
      cSerie:        TOvcDbPictureField;
      cEjercicio:    TOvcDbNumericField;
      BtnNavDuplicar: TfcImageBtn;
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
      procedure FiltroBFactClienteEnter(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnNavBorrarClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
         AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      procedure RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure FormShow(Sender: TObject);
      procedure CreateParams(var Params: TCreateParams); override;
      procedure FiltroBFactClienteExit(Sender: TObject);
      procedure BtnNavListadosClick(Sender: TObject);
      procedure SpFiltroClick(Sender: TObject);
      procedure InformeFVencAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
         ARect: TRect; State: TOwnerDrawState);
      procedure InformeFVencClick(Sender: TObject);
      procedure fcImageBtnMinimizarClick(Sender: TObject);
      procedure QFicheroCalcFields(DataSet: TDataSet);
      procedure OvcCuentaEnter(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure InformeporSubcuenta1Click(Sender: TObject);
      procedure InformeporBanco1Click(Sender: TObject);
      procedure InformeporSituacin1Click(Sender: TObject);
      procedure InformeporComercial1Click(Sender: TObject);
      procedure BtnPermAsientoClick(Sender: TObject);
      procedure BtnNavSeleccionClick(Sender: TObject);
      procedure FiltroRemesasBancariasClick(Sender: TObject);
      procedure ImporteClick(Sender: TObject);
      procedure BtnNavCartaClick(Sender: TObject);
      procedure BtnNavEfectosClick(Sender: TObject);
      procedure QFicheroNewRecord(DataSet: TDataSet);
      procedure BtnNavAsientoBajaClick(Sender: TObject);
      procedure BtnNavDuplicarClick(Sender: TObject);
   private
      lAdd:       Boolean;
      CampoOrden: String;
      x:          Integer;
      procedure ActivarTransacciones;
      procedure PrepararQuery;
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure GenerarAsientoEfectoActual;
      procedure GenerarAsientoFiltroRemesa;
      function ObtenerComentarioEfecto(Comentario: String): String;
   public
      FFacturaCliente, FFacturaProveedor: String;
      FModoConsulta:       Boolean;
      FSubcuenta:          String;
      FImporteDesde, FImporteHasta: Double;
      FFechaVtoDesde, FFechaVtoHasta, FFechaEmisionDesde, FFechaEmisionHasta: TDateTime;
      FSituacion, FCheque: String;
      FSubctaBanco:        String;
      FFechaAsiento:       TDateTime;
      FConcepto:           String;
      FBorrarVtos:         Boolean;

      FNuevoVto:        Boolean;
      FImporteNuevoVto: Double;
      FSubcuentaNuevoVto, FConceptoNuevoVto: String;
   end;

var WCarteraEfectos: TWCarteraEfectos;

implementation
uses DM, DMConta, General, Globales, Letras, UCargaCobrosPagos, UEfectosComerciales,
     UEspere, UGeneracionAsiento, MenuPrincipal, USituacionEfecto;
{$R *.DFM}

const TabCuentas    = 0;
      TabDatos      = 1;
      TabAcumulados = 2;

procedure TWCarteraEfectos.PrepararQuery;
var StrSQL: String;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, SelectSQL do begin
      DisableControls;
      Close;
      Clear;
      Transaction.active := True;
      Add('SELECT * FROM CARTERAEFECTOS E WHERE ID_CARTERAEFECTOS IS NOT NULL');

      if CDSFiltro.FieldByName('BFACTCLIENTE').AsString <> '' then   begin
         add('AND FACTCLIENT LIKE :BFACTCLIENTE');
      end
      else
      if CDSFiltro.FieldByName('BFACTPROVEEDOR').AsString <> '' then   begin
         add('AND FACTPROVEEDOR LIKE :BFACTPROVEEDOR');
      end
      else
      if CDSFiltro.FieldByName('BNUMERO').AsInteger <> 0 then   begin
         Add('AND ID_CARTERAEFECTOS = :BNUMERO');
      end
      else
      if CDSFiltro.FieldByName('BIMPORTE').AsFloat <> 0 then   begin
         Add('AND IMPORTE=:BIMPORTE');
      end
      else begin
         if FiltroRemesasBancarias.Checked then   begin
            // Sin fecha de asiento
            Add('AND FASIENTO IS NULL');

            // Sin subcuenta de banco
            Add('AND (SUBCTABANCO IS NULL OR SUBCTABANCO = "")');

            // Sólo subcuentas de cliente
            Add('AND SUBSTR(E.SUBCUENTA, 1, 3) IN (SELECT C.CUENTA FROM CUENTAS C');
            Add('                                  WHERE C.TIPOCUENTA = "C" AND');
            Add('                                  SUBSTR(E.SUBCUENTA, 1, 3) = C.CUENTA)');
         end
         else begin
            // Fecha de asiento
            if CDSFiltro.FieldByName('FECHAASIENTODESDE').IsNull then   begin
               Add('AND (FASIENTO IS NULL OR (FASIENTO >= :FECHAASIENTODESDE AND FASIENTO <= :FECHAASIENTOHASTA))');
            end
            else begin
               Add('AND FASIENTO >= :FECHAASIENTODESDE AND FASIENTO <= :FECHAASIENTOHASTA');
            end;

            // Subcuenta de banco
            if CDSFiltro.FieldByName('SUBCUENTABANCO').AsString <> '' then   begin
               Add('AND SUBCTABANCO LIKE :SUBCUENTABANCO');
            end;
         end;

         if CDSFiltro.FieldByName('FECHAEMISIONDESDE').IsNull then   begin
            Add('AND (FEMISION IS NULL OR (FEMISION >= :FECHAEMISIONDESDE AND FEMISION <= :FECHAEMISIONHASTA))');
         end
         else begin
            Add('AND FEMISION >= :FECHAEMISIONDESDE AND FEMISION <= :FECHAEMISIONHASTA');
         end;
         if CDSFiltro.FieldByName('FECHAVENCIMDESDE').IsNull then   begin
            Add('AND (FVENCIMIENTO IS NULL OR (FVENCIMIENTO >= :FECHAVENCIMDESDE AND FVENCIMIENTO <= :FECHAVENCIMHASTA))');
         end
         else begin
            Add('AND FVENCIMIENTO >= :FECHAVENCIMDESDE AND FVENCIMIENTO <= :FECHAVENCIMHASTA');
         end;

         if CDSFiltro.FieldByName('IMPORTEDESDE').AsFloat = 0 then   begin
            Add('AND (IMPORTE IS NULL OR (IMPORTE >= :IMPORTEDESDE AND IMPORTE <= :IMPORTEHASTA))');
         end
         else begin
            Add('AND IMPORTE >= :IMPORTEDESDE AND IMPORTE <= :IMPORTEHASTA');
         end;
         if CDSFiltro.FieldByName('FACTCLIENTEDESDE').AsString = '' then   begin
            Add('AND (FACTCLIENT IS NULL OR (FACTCLIENT >= :FACTCLIENTEDESDE AND FACTCLIENT <= :FACTCLIENTEHASTA))');
         end
         else begin
            Add('AND FACTCLIENT >= :FACTCLIENTEDESDE AND FACTCLIENT <= :FACTCLIENTEHASTA');
         end;
         if CDSFiltro.FieldByName('FACTPROVEEDORDESDE').AsString = '' then   begin
            Add('AND (FACTPROVEEDOR IS NULL OR (FACTPROVEEDOR >= :FACTPROVEEDORDESDE AND FACTPROVEEDOR <= :FACTPROVEEDORHASTA))');
         end
         else begin
            Add('AND FACTPROVEEDOR >= :FACTPROVEEDOR AND FACTPROVEEDOR <= :FACTPROVEEDORHASTA');
         end;

         if CDSFiltro.FieldByName('SUBCUENTADESDE').AsString = '' then   begin
            Add('AND (SUBCUENTA IS NULL OR (SUBCUENTA >= :SUBCUENTADESDE AND SUBCUENTA <= :SUBCUENTAHASTA))');
         end
         else
         if CDSFiltro.FieldByName('SUBCUENTAHASTA').AsString = '' then   begin
            Add('AND SUBCUENTA LIKE :SUBCUENTADESDE');
         end
         else begin
            Add('AND SUBCUENTA >= :SUBCUENTADESDE AND SUBCUENTA <= :SUBCUENTAHASTA');
         end;

         if CDSFiltro.FieldByName('COMERCIAL').AsString <> '' then   begin
            Add('AND COMERCIAL = :COMERCIAL');
         end;

         StrSQL := '';
         if FiltroPendiente.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "N"';
         end;
         if FiltroRemesado.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "B"';
         end;
         if FiltroCobrado.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "C"';
         end;
         if FiltroDevuelto.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "D"';
         end;
         if FiltroPagado.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "P"';
         end;
         if FiltroAceptado.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "A"';
         end;
         if FiltroVencido.Checked then   begin
            if StrSQL <> '' then   begin
               StrSQL := StrSQL + ' OR ';
            end;
            StrSQL := StrSQL + 'SITUACION = "V"';
         end;

         if StrSQL <> '' then   begin
            Add('AND (' + StrSQL + ')');
         end;
      end;

      CampoOrden := UpperCase(Trim(CampoOrden));
      if CampoOrden = 'SUBCUENTA' then   begin
         Add('ORDER BY SUBCUENTA, FVENCIMIENTO');
      end
      else
      if CampoOrden = 'SUBCTABANCO' then   begin
         Add('ORDER BY SUBCTABANCO, FVENCIMIENTO');
      end
      else
      if CampoOrden = 'FVENCIMIENTO' then   begin
         Add('ORDER BY FVENCIMIENTO, SUBCUENTA');
      end
      else
      if CampoOrden <> '' then   begin
         Add('ORDER BY ' + CampoOrden);
      end
      else begin
         Add('ORDER BY FVencimiento, Subcuenta');
      end;

      // PARÁMETROS
      if CDSFiltro.FieldByName('BFACTCLIENTE').AsString <> '' then   begin
         ParamByName('BFACTCLIENTE').AsString :=
            Copy(CDSFiltro.FieldByName('BFACTCLIENTE').AsString + '%', 1,
            CDSFiltro.FieldByName('BFACTCLIENTE').Size);
      end
      else
      if CDSFiltro.FieldByName('BFACTPROVEEDOR').AsString <> '' then   begin
         ParamByName('BFACTPROVEEDOR').AsString :=
            Copy(CDSFiltro.FieldByName('BFACTPROVEEDOR').AsString + '%', 1,
            CDSFiltro.FieldByName('BFACTPROVEEDOR').Size);
      end
      else
      if CDSFiltro.FieldByName('BNUMERO').AsInteger <> 0 then   begin
         ParamByName('BNUMERO').AsInteger := CDSFiltro.FieldByName('BNUMERO').AsInteger;
      end
      else
      if CDSFiltro.FieldByName('BIMPORTE').AsFloat <> 0 then   begin
         QFichero.ParamByName('BIMPORTE').AsVariant := CDSFiltro.FieldByName('BIMPORTE').AsFloat;
      end
      else begin
         if not FiltroRemesasBancarias.Checked then   begin
            ParamByName('FECHAASIENTODESDE').AsDateTime :=
               CDSFiltro.FieldByName('FECHAASIENTODESDE').AsDateTime;
            ParamByName('FECHAASIENTOHASTA').AsDateTime :=
               CDSFiltro.FieldByName('FECHAASIENTOHASTA').AsDateTime;

            if CDSFiltro.FieldByName('SUBCUENTABANCO').AsString <> '' then   begin
               ParamByName('SUBCUENTABANCO').AsString :=
                  Copy(CDSFiltro.FieldByName('SUBCUENTABANCO').AsString + '%', 1,
                  CDSFiltro.FieldByName('SUBCUENTABANCO').Size);
            end;
         end;

         ParamByName('FECHAEMISIONDESDE').AsDateTime :=
            CDSFiltro.FieldByName('FECHAEMISIONDESDE').AsDateTime;
         ParamByName('FECHAEMISIONHASTA').AsDateTime :=
            CDSFiltro.FieldByName('FECHAEMISIONHASTA').AsDateTime;
         ParamByName('FECHAVENCIMDESDE').AsDateTime  :=
            CDSFiltro.FieldByName('FECHAVENCIMDESDE').AsDateTime;
         ParamByName('FECHAVENCIMHASTA').AsDateTime  :=
            CDSFiltro.FieldByName('FECHAVENCIMHASTA').AsDateTime;
         ParamByName('IMPORTEDESDE').AsFloat         := CDSFiltro.FieldByName('IMPORTEDESDE').AsFloat - 0.001;
         ParamByName('IMPORTEHASTA').AsFloat         := CDSFiltro.FieldByName('IMPORTEHASTA').AsFloat + 0.001;
         ParamByName('FACTCLIENTEDESDE').AsString    := CDSFiltro.FieldByName('FACTCLIENTEDESDE').AsString;
         ParamByName('FACTCLIENTEHASTA').AsString    := CDSFiltro.FieldByName('FACTCLIENTEHASTA').AsString;
         ParamByName('FACTPROVEEDORDESDE').AsString  :=
            CDSFiltro.FieldByName('FACTPROVEEDORDESDE').AsString;
         ParamByName('FACTPROVEEDORHASTA').AsString  :=
            CDSFiltro.FieldByName('FACTPROVEEDORHASTA').AsString;

         QFichero.ParamByName('SUBCUENTADESDE').AsString :=
            CDSFiltro.FieldByName('SUBCUENTADESDE').AsString;
         //        Copy(CDSFiltro.FieldByName('SUBCUENTADESDE').AsString + '%', 1,
         //             CDSFiltro.FieldByName('SUBCUENTADESDE').Size);
         if CDSFiltro.FieldByName('SUBCUENTAHASTA').AsString <> '' then   begin
            ParamByName('SUBCUENTAHASTA').AsString := CDSFiltro.FieldByName('SUBCUENTAHASTA').AsString;
         end;
         if CDSFiltro.FieldByName('COMERCIAL').AsString <> '' then   begin
            ParamByName('COMERCIAL').AsString := CDSFiltro.FieldByName('COMERCIAL').AsString;
         end;
      end;

      Prepare;
      EnableControls;
      Open;

   end;
   SpFiltro.Flat := True;
end;

procedure TWCarteraEfectos.ActivarTransacciones;
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

procedure TWCarteraEfectos.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('BFactCliente', ftString, 10, False);
         Add('BFactProveedor', ftString, 15, False);
         Add('BNumero', ftInteger, 0, False);
         Add('BImporte', ftFloat, 0, False);
         Add('FechaEmisionDesde', ftDateTime, 0, False);
         Add('FechaEmisionHasta', ftDateTime, 0, False);
         Add('FechaVencimDesde', ftDateTime, 0, False);
         Add('FechaVencimHasta', ftDateTime, 0, False);
         Add('FechaAsientoDesde', ftDateTime, 0, False);
         Add('FechaAsientoHasta', ftDateTime, 0, False);
         Add('ImporteDesde', ftFloat, 0, False);
         Add('ImporteHasta', ftFloat, 0, False);
         Add('FactClienteDesde', ftString, 10, False);
         Add('FactClienteHasta', ftString, 10, False);
         Add('FactProveedorDesde', ftString, 15, False);
         Add('FactProveedorHasta', ftString, 15, False);
         Add('SubcuentaDesde', ftString, 10, False);
         Add('SubcuentaHasta', ftString, 10, False);
         Add('SubcuentaBanco', ftString, 10, False);
         Add('Comercial', ftString, 10, False);
         Add('Situacion', ftString, 1, False);
         Add('Moneda', ftString, 1, False);
      end;
      CreateDataSet;
      active := True;
      Append;
   end;
end;

procedure TWCarteraEfectos.InicializarFiltro;
var
   QSelEfectos: TIBQuery;
begin
   if FModoConsulta then  begin
      CDSFiltro.FieldByName('FechaEmisionDesde').AsDateTime := FFechaEmisionDesde;
      CDSFiltro.FieldByName('FechaEmisionHasta').AsDateTime := FFechaEmisionHasta;
      CDSFiltro.FieldByName('FechaVencimDesde').AsDateTime  := FFechaVtoDesde;
      CDSFiltro.FieldByName('FechaVencimHasta').AsDateTime  := FFechaVtoHasta;
      CDSFiltro.FieldByName('ImporteDesde').AsFloat         := FImporteDesde;
      CDSFiltro.FieldByName('ImporteHasta').AsFloat         := FImporteHasta;
      if FSubcuenta <> '' then   begin
         CDSFiltro.FieldByName('SubcuentaDesde').AsString := FSubcuenta;
         CDSFiltro.FieldByName('SubcuentaHasta').AsString := FSubcuenta;
      end
      else begin
         CDSFiltro.FieldByName('SubcuentaHasta').AsString := '9999999999';
      end;

      FiltroPendiente.Checked := True;
   end

   else begin
      CDSFiltro.FieldByName('FechaEmisionDesde').AsDateTime := Date - 365;
      CDSFiltro.FieldByName('FechaEmisionHasta').AsDateTime := Date + 30;
      CDSFiltro.FieldByName('FechaVencimDesde').AsDateTime  := Date - 30;
      CDSFiltro.FieldByName('FechaVencimHasta').AsDateTime  := Date + 365;
      CDSFiltro.FieldByName('ImporteHasta').AsFloat         := 999999999;
      CDSFiltro.FieldByName('SubcuentaHasta').AsString      := '9999999999';

      QSelEfectos := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QSelEfectos, SQL do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('SELECT FEMISION FROM CARTERAEFECTOS');
         Add('WHERE NOT FEMISION IS NULL ORDER BY FEMISION');
         Open;
         if not EOF then   begin
            CDSFiltro.FieldByName('FechaEmisionDesde').AsDateTime := FieldByName('FEMISION').AsDateTime;
            Last;
            CDSFiltro.FieldByName('FechaEmisionHasta').AsDateTime := FieldByName('FEMISION').AsDateTime;

            Close;
            Clear;
            Add('SELECT FVENCIMIENTO FROM CARTERAEFECTOS');
            Add('WHERE NOT FVENCIMIENTO IS NULL ORDER BY FVENCIMIENTO');
            Open;

            if not EOF then   begin
               CDSFiltro.FieldByName('FechaVencimDesde').AsDateTime :=
                  FieldByName('FVENCIMIENTO').AsDateTime;
               Last;
               CDSFiltro.FieldByName('FechaVencimHasta').AsDateTime :=
                  FieldByName('FVENCIMIENTO').AsDateTime;
            end;
         end;

         Close;
         Free;
      end;
   end;

   CDSFiltro.FieldByName('FechaAsientoHasta').AsDateTime := Date + 30;
   CDSFiltro.FieldByName('FactClienteHasta').AsString := 'ZZZZZZZZZZ';
   CDSFiltro.FieldByName('FactProveedorHasta').AsString := 'ZZZZZZZZZZZZZZZ';
   CDSFiltro.FieldByName('Moneda').AsString := 'E';

   if FFacturaCliente <> '' then   begin
      CDSFiltro.FieldByName('BFactCliente').AsString := FFacturaCliente;
   end
   else
   if FFacturaProveedor <> '' then   begin
      CDSFiltro.FieldByName('BFactProveedor').AsString := FFacturaProveedor;
   end;

   FFacturaCliente   := '';
   FFacturaProveedor := '';
end;

procedure TWCarteraEfectos.GenerarAsientoEfectoActual;
var
   Asiento: Integer;
begin
   Paginas.Pages[TabDatos].Show;

   Perform(wm_NextDlgCtl, 0, 0);

   if QFicheroSUBCUENTA.AsString = '' then  begin
      CCuenta.SetFocus;
      DatabaseError('La subcuenta está en blanco.');
   end;
   if QFicheroSUBCTABANCO.AsString = '' then  begin
      CBanco.SetFocus;
      if QFichero.State in dsEditModes then   begin
         DatabaseError('La subcuenta del banco está en blanco.');
      end
      else begin
         if MessageDlg('La subcuenta del banco está en blanco.' + #13 + '¿Desea modificarla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
            QFichero.Edit;
            Modo(Self, Edita);
         end;
         Exit;
      end;
   end;
   if (QFicheroSITUACION.AsString <> 'C') and (QFicheroSITUACION.AsString <> 'P') then  begin
      Situacion.SetFocus;
      DatabaseError('La situación no es válida para generar asiento.');
   end;
   if QFicheroIMPORTE.AsFloat = 0 then  begin
      eImporte.SetFocus;
      DatabaseError('El efecto no tiene importe.');
   end;

   if QFicheroFVENCIMIENTO.AsDateTime > Date then begin
      if MessageDlg('La fecha de vencimiento es mayor que la fecha actual.' + #13 +
      '¿Desea generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if QFicheroFVENCIMIENTO.AsDateTime < QFicheroFEMISION.AsDateTime then begin
      if MessageDlg('La fecha de vencimiento es menor que la de emisión.' +
      #13 + '¿Desea generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if QFicheroFVENCIMIENTO.AsDateTime < QFicheroFASIENTO.AsDateTime then begin
      if MessageDlg('La fecha de vencimiento es menor que la de asiento.' +
      #13 + '¿Desea generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if QFicheroFASIENTO.IsNull then begin
      if MessageDlg('La fecha de asiento está en blanco. Se tomará la fecha actual.' + #13 +
      '¿Desea generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   end;

   if QFicheroFASIENTO.IsNull then  begin
      if not (QFichero.State in dsEditModes) then   begin
         QFichero.Edit;
      end;
      QFicheroFASIENTO.AsDateTime := Date;
      QFichero.Post;
   end;

   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAux, SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('INSERT INTO DIARIO');
      Add('(APUNTE, ASIENTO, MONEDA, FECHA, IMPORTE, DEBEHABER,');
      Add(' COMENTARIO, SUBCUENTA, ID_CONCEPTOS, NUMEROFACTURA, CONTRAPARTIDA)');
      Add('VALUES');
      Add('(:APUNTE, :ASIENTO, :MONEDA, :FECHA, :IMPORTE, :DEBEHABER,');
      Add(' :COMENTARIO, :SUBCUENTA, :ID_CONCEPTOS, :NUMEROFACTURA, :CONTRAPARTIDA)');
   end;

   // Número de asiento
   Asiento := DMContaRef.ObtenerNumeroAsiento;

   // Apunte 1
   QAux.Close;
   QAux.ParamByName('ASIENTO').AsInteger  := Asiento;
   QAux.ParamByName('APUNTE').AsInteger   := 1;
   QAux.ParamByName('MONEDA').AsString    := DMRef.QParametros.FieldByName('MONEDA').AsString;
   QAux.ParamByName('FECHA').AsDateTime   := QFicheroFASIENTO.AsDateTime;
   QAux.ParamByName('IMPORTE').AsFloat    := QFicheroIMPORTE.AsFloat;
   QAux.ParamByName('DEBEHABER').AsString := 'D';
   if QFicheroCONCEPTO.AsString <> '' then   begin
      QAux.ParamByName('COMENTARIO').AsString :=
         ObtenerComentarioEfecto(QFicheroCONCEPTO.AsString);
   end
   else begin
      QAux.ParamByName('COMENTARIO').AsString := QFicheroFVENCIMIENTO.AsString;
   end;
   if QFicheroSITUACION.AsString = 'C' then    // Cobro
   begin
      QAux.ParamByName('SUBCUENTA').AsString     := Trim(QFicheroSUBCTABANCO.AsString);
      QAux.ParamByName('CONTRAPARTIDA').AsString := Trim(QFicheroSUBCUENTA.AsString);
      QAux.ParamByName('ID_CONCEPTOS').AsString  := '07';
      QAux.ParamByName('NUMEROFACTURA').AsString := QFicheroFACTCLIENT.AsString;
   end
   else                                        // Pago
   begin
      QAux.ParamByName('SUBCUENTA').AsString     := Trim(QFicheroSUBCUENTA.AsString);
      QAux.ParamByName('CONTRAPARTIDA').AsString := Trim(QFicheroSUBCTABANCO.AsString);
      QAux.ParamByName('ID_CONCEPTOS').AsString  := '08';
      QAux.ParamByName('NUMEROFACTURA').AsString := QFicheroFACTPROVEEDOR.AsString;
   end;
   QAux.ExecQuery;
   QAux.Transaction.CommitRetaining;

   // Apunte 2
   QAux.Close;
   QAux.ParamByName('ASIENTO').AsInteger  := Asiento;
   QAux.ParamByName('APUNTE').AsInteger   := 2;
   QAux.ParamByName('MONEDA').AsString    := DMRef.QParametros.FieldByName('MONEDA').AsString;
   QAux.ParamByName('FECHA').AsDateTime   := QFicheroFASIENTO.AsDateTime;
   QAux.ParamByName('IMPORTE').AsFloat    := QFicheroIMPORTE.AsFloat;
   QAux.ParamByName('DEBEHABER').AsString := 'H';
   if QFicheroCONCEPTO.AsString <> '' then   begin
      QAux.ParamByName('COMENTARIO').AsString :=
         ObtenerComentarioEfecto(QFicheroCONCEPTO.AsString);
   end
   else begin
      QAux.ParamByName('COMENTARIO').AsString := QFicheroFVENCIMIENTO.AsString;
   end;
   if QFicheroSITUACION.AsString = 'C' then    // Cobro
   begin
      QAux.ParamByName('SUBCUENTA').AsString     := Trim(QFicheroSUBCUENTA.AsString);
      QAux.ParamByName('CONTRAPARTIDA').AsString := Trim(QFicheroSUBCTABANCO.AsString);
      QAux.ParamByName('ID_CONCEPTOS').AsString  := '07';
      QAux.ParamByName('NUMEROFACTURA').AsString := QFicheroFACTCLIENT.AsString;
   end
   else                                        // Pago
   begin
      QAux.ParamByName('SUBCUENTA').AsString     := Trim(QFicheroSUBCTABANCO.AsString);
      QAux.ParamByName('CONTRAPARTIDA').AsString := Trim(QFicheroSUBCUENTA.AsString);
      QAux.ParamByName('ID_CONCEPTOS').AsString  := '08';
      QAux.ParamByName('NUMEROFACTURA').AsString := QFicheroFACTPROVEEDOR.AsString;
   end;
   QAux.ExecQuery;
   QAux.Transaction.CommitRetaining;

   if MessageDlg('¿Desea borrar el vencimiento después de generar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      QFichero.Delete;
      QFichero.Transaction.CommitRetaining;
   end;

   MessageDlg('Generado el asiento nº ' + IntToStr(Asiento), mtInformation, [mbOK], 0);
   Modo(Self, Naveg);
   Paginas.Pages[TabCuentas].Show;
   Rejilla.SetFocus;
   Paginas.Update;
end;

procedure TWCarteraEfectos.GenerarAsientoFiltroRemesa;
var
   Asiento, Apunte, I: Integer;
   Importe:       Double;
   AbreviaturaSubcuenta, Subcuenta1, Factura1, Concepto1: String;
   FechaVto1:     TDateTime;
   NumRegistros:  Integer;
   QAbrevSubctas: TIBQuery;
begin
   if not QFichero.IsEmpty then  begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAux, SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('INSERT INTO DIARIO');
         Add('(APUNTE, ASIENTO, COMENTARIO, CONTRAPARTIDA, DEBEHABER,');
         Add(' FECHA, ID_CONCEPTOS, IMPORTE, MONEDA, NUMEROFACTURA,');
         Add(' SUBCUENTA)');
         Add('VALUES');
         Add('(:APUNTE, :ASIENTO, :COMENTARIO, :CONTRAPARTIDA, :DEBEHABER,');
         Add(' :FECHA, :ID_CONCEPTOS, :IMPORTE, :MONEDA, :NUMEROFACTURA,');
         Add(' :SUBCUENTA)');
      end;

      // Si no se ha seleccionado ningún efecto, confirmar si desea generar
      // el asiento con todos los efectos filtrados.
      if Rejilla.SelectedList.Count = 0 then begin
         if MessageDlg('No ha seleccionado ningún efecto.' + #13 +
            '¿Desea generar el asiento con todos los efectos filtrados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
            Rejilla.SelectAll;
         end;
      end;

      // Generar el asiento con los efectos marcados.
      Subcuenta1 := '';
      FechaVto1  := 0;
      Factura1   := '';
      Concepto1  := '';

      WGeneracionAsiento := TWGeneracionAsiento.Create(nil);
      Importe := 0;
      for I := 0 to Rejilla.SelectedList.Count - 1 do begin
         QFichero.GotoBookmark(Rejilla.SelectedList.Items[I]);
         // Subcuenta de cliente o proveedor
         if DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'C' then   begin
            QAux.ParamByName('DEBEHABER').AsString := 'H';
            Importe := Importe - QFicheroIMPORTE.AsFloat;
         end
         else begin
            QAux.ParamByName('DEBEHABER').AsString := 'D';
            Importe := Importe + QFicheroIMPORTE.AsFloat;
         end;
         WGeneracionAsiento.ImporteAsiento := Abs(Importe);
      end;


      WGeneracionAsiento.ShowModal;

      if FSubctaBanco <> '' then   begin
         QAbrevSubctas := TIBQuery.Create(nil);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QAbrevSubctas, SQL do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            Add('SELECT SUBCUENTA, ABREVIATURA FROM SUBCTAS');
            Add('WHERE SUBCUENTA = :SUBCUENTA');
            ParamByName('SUBCUENTA').AsString := FSubctaBanco;
            Open;

            AbreviaturaSubcuenta := FieldByName('ABREVIATURA').AsString;
            Close;
            Free;
         end;

         Importe := 0;
         Apunte  := 0;
         Asiento := DMContaRef.ObtenerNumeroAsiento;

         NumRegistros := Rejilla.SelectedList.Count;

         for I := 0 to Rejilla.SelectedList.Count - 1 do begin
            QFichero.GotoBookmark(Rejilla.SelectedList.Items[I]);

            if (NumRegistros = 1) and (I = 0) then   begin
               Subcuenta1 := QFicheroSUBCUENTA.AsString;
               FechaVto1  := QFicheroFVENCIMIENTO.AsDateTime;
               Factura1   := QFicheroFACTCLIENT.AsString;
               Concepto1  := QFicheroCONCEPTO.AsString;
            end;

            Inc(Apunte);

            QAux.Close;
            QAux.ParamByName('APUNTE').AsInteger  := Apunte;
            QAux.ParamByName('ASIENTO').AsInteger := Asiento;
            if QFicheroCONCEPTO.AsString <> '' then   begin
               QAux.ParamByName('COMENTARIO').AsString :=
                  ObtenerComentarioEfecto(QFicheroCONCEPTO.AsString);
            end
            else begin
               QAux.ParamByName('COMENTARIO').AsString := QFicheroFVENCIMIENTO.AsString;
            end;
            QAux.ParamByName('CONTRAPARTIDA').AsString := FSubctaBanco;
            // Subcuenta de cliente o proveedor
            if DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'C' then   begin
               QAux.ParamByName('DEBEHABER').AsString := 'H';
               Importe := Importe - QFicheroIMPORTE.AsFloat;
            end
            else begin
               QAux.ParamByName('DEBEHABER').AsString := 'D';
               Importe := Importe + QFicheroIMPORTE.AsFloat;
            end;
            QAux.ParamByName('FECHA').AsDateTime      := FFechaAsiento;
            QAux.ParamByName('ID_CONCEPTOS').AsString := FConcepto;
            QAux.ParamByName('IMPORTE').AsFloat       := QFicheroIMPORTE.AsFloat;
            QAux.ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
            if AbreviaturaSubcuenta <> '' then   begin
               QAux.ParamByName('NUMEROFACTURA').AsString := AbreviaturaSubcuenta;
            end
            else begin
               QAux.ParamByName('NUMEROFACTURA').AsString := QFicheroFACTCLIENT.AsString;
            end;
            QAux.ParamByName('SUBCUENTA').AsString := QFicheroSUBCUENTA.AsString;
            QAux.ExecQuery;
            QAux.Transaction.CommitRetaining;

            if FBorrarVtos then   begin
               QFichero.Delete;
               QFichero.Transaction.CommitRetaining;
            end
            else begin
               QFichero.Edit;
               QFicheroSUBCTABANCO.AsString := FSubctaBanco;
               QFicheroFASIENTO.AsDateTime  := FFechaAsiento;
               QFicheroSITUACION.AsString   := FSituacion;
               QFichero.Post;
               QFichero.Transaction.CommitRetaining;
            end;
         end;    // for

         Inc(Apunte);
         QAux.Close;
         QAux.ParamByName('APUNTE').AsInteger  := Apunte;
         QAux.ParamByName('ASIENTO').AsInteger := Asiento;
         if NumRegistros = 1 then   begin
            if Concepto1 <> '' then   begin
               QAux.ParamByName('COMENTARIO').AsString := ObtenerComentarioEfecto(Concepto1);
            end
            else begin
               QAux.ParamByName('COMENTARIO').AsString := DateToStr(FechaVto1);
            end;
            QAux.ParamByName('CONTRAPARTIDA').AsString := Subcuenta1;
            if AbreviaturaSubcuenta <> '' then   begin
               QAux.ParamByName('NUMEROFACTURA').AsString := AbreviaturaSubcuenta;
            end
            else begin
               QAux.ParamByName('NUMEROFACTURA').AsString := Factura1;
            end;
         end
         else begin
            QAux.ParamByName('COMENTARIO').AsString     := '';
            QAux.ParamByName('CONTRAPARTIDA').AsVariant := null;
            if AbreviaturaSubcuenta <> '' then   begin
               QAux.ParamByName('NUMEROFACTURA').AsString := AbreviaturaSubcuenta;
            end
            else begin
               QAux.ParamByName('NUMEROFACTURA').AsString := '';
            end;
         end;
         // Subcuenta de cliente o proveedor
         if Importe > 0 then   begin
            QAux.ParamByName('DEBEHABER').AsString := 'H';
         end
         else begin
            QAux.ParamByName('DEBEHABER').AsString := 'D';
         end;
         QAux.ParamByName('FECHA').AsDateTime      := FFechaAsiento;
         QAux.ParamByName('ID_CONCEPTOS').AsString := FConcepto;
         QAux.ParamByName('IMPORTE').AsFloat       := Abs(Importe);
         QAux.ParamByName('MONEDA').AsString       := DMRef.QParametros.FieldByName('MONEDA').AsString;
         QAux.ParamByName('SUBCUENTA').AsString    := FSubctaBanco;
         QAux.ExecQuery;
         QAux.Transaction.CommitRetaining;

         QFichero.First;
         QFichero.EnableControls;

{      // Refrescar datos
      if not (CDSFiltro.State in dsEditModes) then
        CDSFiltro.Edit;
      CDSFiltro.FieldByName('FechaAsientoDesde').AsDateTime := FFechaAsiento;
      CDSFiltro.FieldByName('FechaAsientoHasta').AsDateTime := FFechaAsiento;
      CDSFiltro.FieldByName('SubcuentaBanco').AsString := FSubctaBanco;
      FiltroPendiente.Checked := FALSE;
      FiltroRemesado.Checked := FALSE;
      FiltroCobrado.Checked := FALSE;
      FiltroDevuelto.Checked := FALSE;
      FiltroPagado.Checked := FALSE;
      FiltroAceptado.Checked := FALSE;
      FiltroVencido.Checked := FALSE;
      FiltroRemesasBancarias.Checked := FALSE;}

         Rejilla.SelectedList.Clear;
         MessageDlg('Generado asiento nº ' + FormatFloat('###,###,###', Asiento), mtInformation, [mbOK], 0);
      end;
   end;
end;

function TWCarteraEfectos.ObtenerComentarioEfecto(Comentario: String): String;
begin
   Comentario := Trim(Comentario);
   if UpperCase(Copy(Comentario, 1, 5)) = 'COBRO' then   begin
      Comentario := Trim(Copy(Comentario, 6, length(Comentario)));
   end;
   Result := Copy(Comentario, 1, 40);
end;


procedure TWCarteraEfectos.BtnNavCerrarClick(Sender: TObject);
begin
   if FModoConsulta then  begin
      WCargaCobrosPagos.FID_Cartera := 0;
      WCargaCobrosPagos.FSituacion  := '';
   end;

   Close;
end;

procedure TWCarteraEfectos.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCarteraEfectos.FormCreate(Sender: TObject);
begin
   FFacturaCliente   := '';
   FFacturaProveedor := '';

   x := GetSystemMetrics(SM_CXSCREEN);

   Paginas.Width  := 655;
   Paginas.Height := 430;

   ActivarTransacciones;
   CrearFiltro;

   FModoConsulta := False;
   FNuevoVto     := False;

   Paginas.Pages[TabCuentas].Show;
end;

procedure TWCarteraEfectos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      // Comprobación del filtro por número
      if (FiltroBNumero.Focused) and (FiltroBNumero.AsInteger <> 0) then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobación del filtro por factura de cliente
      else
      if (FiltroBFactCliente.Focused) and (Trim(FiltroBFactCliente.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobación del filtro por factura de proveedor
      else
      if (FiltroBFactProveedor.Focused) and (Trim(FiltroBFactProveedor.Text) <> '') then   begin
         key := #0;
         if CDSFiltro.State in dsEditModes then   begin
            CDSFiltro.Post;
         end;
         PrepararQuery;
      end

      // Comprobación del filtro por importe
      else
      if (FiltroBImporte.Focused) and (FiltroBImporte.AsFloat <> 0) then   begin
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

procedure TWCarteraEfectos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Salir: Boolean;
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
         if (ActiveControl <> FiltroBFactCliente) and (ActiveControl <>
            FiltroBFactProveedor) and (ActiveControl <> FiltroBNumero) and
            (ActiveControl <> FiltroBImporte) and not
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
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not
            (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBLookupCombo) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWCarteraEfectos.BtnNavAnadirClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), ANIADIR) then begin
   //   Exit;
   //end;

   lAdd := True;
   try
      Paginas.PageIndex := TabDatos;
      QFichero.Insert;
      ccuenta.SetFocus;
      Modo(Self, Edita);
      PaginasPageChanged(Self, TabDatos);
   except
      raise;
      DatabaseError('Error al añadir un nuevo efecto.');
   end;
end;

procedure TWCarteraEfectos.PaginasPageChanged(Sender: TObject; Index: Integer);
begin
   case Index of
      TabDatos: begin
         if not FModoConsulta then   begin
            BtnNavAnadir.Visible := not (QFichero.State in dsEditModes);
            BtnNavBorrar.Visible := not (QFichero.State in dsEditModes);
         end;
      end;
   end;
end;

procedure TWCarteraEfectos.RejillaDblClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;
   //
   if not QFichero.IsEmpty and (Rejilla.SelectedList.Count = 1) then  begin
      lAdd := False;
      try
         QFichero.Edit;
         Modo(Self, Edita);
         Paginas.PageIndex := TabDatos;
         cCuenta.SetFocus;
      except
         DatabaseError('No se puede editar el registro seleccionado.' + #13 +
            'Puede estar en uso por otra persona.');
      end;
   end;
end;

procedure TWCarteraEfectos.QFicheroBeforeOpen(DataSet: TDataSet);
begin
   QFichero.EnableControls;
end;

procedure TWCarteraEfectos.fcIBMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWCarteraEfectos.BtnNavAnadirMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCarteraEfectos.BtnNavAnadirMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCarteraEfectos.QFicheroAfterEdit(DataSet: TDataSet);
begin
   PaginasPageChanged(Self, TabDatos);
end;

procedure TWCarteraEfectos.FiltroBFactClienteEnter(Sender: TObject);
begin
   if not (CDSFiltro.state in dseditmodes) then begin
      CDSFiltro.edit;
   end;
   CDSFiltro.FieldByName('BFactCliente').AsString   := '';
   CDSFiltro.FieldByName('BFactProveedor').AsString := '';
   CDSFiltro.FieldByName('BNumero').AsInteger       := 0;
   CDSFiltro.FieldByName('BIMPORTE').AsFloat        := 0;
end;

procedure TWCarteraEfectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if QFichero.State = dsBrowse then begin
      {$Message Warn 'Aparición de TCorreo'}
      DMContaRef.HCorreo.Active := False;
      Action := caFree;
      Formulario.Free;
      Formulario      := nil;
      WCarteraEfectos := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWCarteraEfectos.BtnNavBorrarClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), BORRAR) then begin
   //   Exit;
   //end;

   if QFichero.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar este efecto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try QFichero.Delete;
          QFichero.Transaction.CommitRetaining;
      except DatabaseError('Error al borrar el efecto.' + #13 + 'Puede tener datos asociados');
      end;
   end;
end;

procedure TWCarteraEfectos.BtnEdtAceptarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   QFichero.Post;
   Transaccion.CommitRetaining;

   Modo(Self, Naveg);
   Paginas.Pages[TabCuentas].Show;
   Rejilla.SetFocus;
end;

procedure TWCarteraEfectos.BtnEdtCancelarClick(Sender: TObject);
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

procedure TWCarteraEfectos.RejillaCalcTitleAttributes(Sender: TObject; AFieldName: String;
   AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(CampoOrden)) then   begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

procedure TWCarteraEfectos.RejillaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'SUBCUENTA') or (UpperCase(AFieldName) = 'FVENCIMIENTO') or
      (UpperCase(AFieldName) = 'FEMISION') or (UpperCase(AFieldName) = 'ID_CARTERAEFECTOS') then  begin
      CampoOrden := UpperCase(AFieldName);
      PrepararQuery;
   end;
   Rejilla.SetFocus;

end;

procedure TWCarteraEfectos.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   InicializarFiltro;

   CampoOrden := 'FVencimiento';
   PrepararQuery;
   Modo(Self, Naveg);

   lbSerie.Visible     := False;
   lbEjercicio.Visible := False;
   cEjercicio.Visible  := False;
   cSerie.Visible      := False;
   if Dmref.QParametros.FieldByName('TrataSerie').AsString = 'S' then  begin
      lbSerie.Visible     := True;
      lbEjercicio.Visible := True;
      cEjercicio.Visible  := True;
      cSerie.Visible      := True;
   end;

   if not FModoConsulta then   begin
      BtnNavSeleccion.Free;
   end
   else begin
      BtnNavAnadir.Free;
      BtnNavModificar.Free;
      BtnPermAsiento.Free;
      BtnNavCarta.Free;
      BtnNavEfectos.Free;
      BtnNavAsientoBaja.Free;
   end;

   if FNuevoVto then begin
      BtnNavAnadir.Click;
   end;
end;

procedure TWCarteraEfectos.CreateParams(var Params: TCreateParams);
begin
   inherited;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with params do begin
      style          := (style or ws_popup) and not ws_dlgframe and not ws_clipchildren;
      doublebuffered := True;
   end;
end;

procedure TWCarteraEfectos.FiltroBFactClienteExit(Sender: TObject);
begin
   if (CDSFiltro.State in dseditmodes) then begin
      CDSFiltro.post;
   end;
   if QFichero.State in dsEditModes then begin
      Exit;
   end;
   if ((Sender is TOvcDbNumericField) and (TOvcDbNumericField(Sender).AsVariant <> 0)) or
      ((Sender is TOvcDbPictureField) and (TOvcDbPictureField(Sender).Text <> '')) then begin
      PrepararQuery;
   end;
end;

procedure TWCarteraEfectos.BtnNavListadosClick(Sender: TObject);
begin
   PopupMenuListados.Popup(Self.Left + BtnNavListados.Left,
      Self.Top + BtnNavListados.Top + BtnNavListados.Height - 5);
end;

procedure TWCarteraEfectos.SpFiltroClick(Sender: TObject);
begin

   if (CDSFiltro.State in dseditmodes) then begin
      CDSFiltro.post;
   end;

   NavAnimate.Active  := True;
   NavAnimate.Visible := True;

   FiltroBFactClienteEnter(nil);

   PrepararQuery;

   NavAnimate.Visible := False;
   NavAnimate.Active  := False;
   Paginas.Pages[TabCuentas].Show;
   FiltroBuscar.SetFocus;
end;

procedure TWCarteraEfectos.InformeFVencAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
   ARect: TRect; State: TOwnerDrawState);
begin
   ACanvas.Brush.Color := gcClAplicacion;
   ACanvas.FillRect(ARect);
   ACanvas.Font.Color := clNavy;
   ACanvas.Font.Name  := 'Tahoma';
   ACanvas.TextRect(ARect, ARect.Left + 7, ARect.Top, TMenuItem(Sender).Caption);
end;

procedure TWCarteraEfectos.fcImageBtnMinimizarClick(Sender: TObject);
begin
   WindowState := wsMinimized;
end;

procedure TWCarteraEfectos.QFicheroCalcFields(DataSet: TDataSet);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with Dataset do begin
      if FieldByName('Situacion').AsString = 'N' then   begin
         FieldByName('DescSituacion').AsString := 'PENDIENTE';
      end
      else
      if FieldByName('Situacion').AsString = 'B' then   begin
         FieldByName('DescSituacion').AsString := 'REMESADO';
      end
      else
      if FieldByName('Situacion').AsString = 'C' then   begin
         FieldByName('DescSituacion').AsString := 'COBRADO';
      end
      else
      if FieldByName('Situacion').AsString = 'D' then   begin
         FieldByName('DescSituacion').AsString := 'DEVUELTO';
      end
      else
      if FieldByName('Situacion').AsString = 'P' then   begin
         FieldByName('DescSituacion').AsString := 'PAGADO';
      end
      else
      if FieldByName('Situacion').AsString = 'A' then   begin
         FieldByName('DescSituacion').AsString := 'ACEPTADO';
      end
      else
      if FieldByName('Situacion').AsString = 'V' then   begin
         FieldByName('DescSituacion').AsString := 'VENCIDO';
      end;
      if Empty(FieldByName('FactClient').AsString) then   begin
         FieldByName('NumeroFactura').AsString := FieldByName('FactProveedor').AsString;
      end
      else begin
         FieldByName('NumeroFactura').AsString := FieldByName('FactClient').AsString;
      end;
      FieldByName('CALCIMPORTE').AsFloat  :=
         ConversionImporte(FieldByName('IMPORTE').AsFloat, 'E',
         CDSFiltro.FieldByName('MONEDA').AsString);
      FieldByName('CALCCOMISION').AsFloat :=
         ConversionImporte(FieldByName('IMPCOMISION').AsFloat, 'E',
         CDSFiltro.FieldByName('MONEDA').AsString);
      if CDSFiltro.FieldByName('MONEDA').AsString = 'E' then   begin
         QFicheroCalcImporte.DisplayFormat := '###,###,##0.00';
      end
      else begin
         QFicheroCalcImporte.DisplayFormat := '###,###,##0';
      end;
      if CDSFiltro.FieldByName('MONEDA').AsString = 'E' then   begin
         QFicheroCalcComision.DisplayFormat := '###,###,##0.00';
      end
      else begin
         QFicheroCalcComision.DisplayFormat := '###,###,##0';
      end;
   end;
end;

procedure TWCarteraEfectos.OvcCuentaEnter(Sender: TObject);
begin
   if not lAdd then begin
      Perform(wm_NextDlgCtl, 0, 0);
   end;
end;

procedure TWCarteraEfectos.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWCarteraEfectos.InformeFVencClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if CampoOrden <> 'FVENCIMIENTO' then  begin
      CampoOrden := 'FVENCIMIENTO';
      PrepararQuery;
   end;

   FormPrincipal.LanzarListado('CarteraFVenc.rtm', DSFichero, CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWCarteraEfectos.InformeporSubcuenta1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if CampoOrden <> 'SUBCUENTA' then  begin
      CampoOrden := 'SUBCUENTA';
      PrepararQuery;
   end;
   FormPrincipal.LanzarListado('CarteraSubcta.rtm', DSFichero, CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWCarteraEfectos.InformeporBanco1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if CampoOrden <> 'SUBCTABANCO' then  begin
      CampoOrden := 'SUBCTABANCO';
      PrepararQuery;
   end;
   FormPrincipal.LanzarListado('CarteraBanco.rtm', DSFichero, CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWCarteraEfectos.InformeporSituacin1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if CampoOrden <> 'SITUACION, FVENCIMIENTO' then  begin
      CampoOrden := 'SITUACION, FVENCIMIENTO';
      PrepararQuery;
   end;
   FormPrincipal.LanzarListado('CarteraSituacion.rtm', DSFichero, CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWCarteraEfectos.InformeporComercial1Click(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), IMPRESION) then begin
   //   Exit;
   //end;

   if CampoOrden <> 'COMERCIAL, SUBCUENTA, FVENCIMIENTO' then  begin
      CampoOrden := 'COMERCIAL, SUBCUENTA, FVENCIMIENTO';
      PrepararQuery;
   end;
   FormPrincipal.LanzarListado('CarteraComercial.rtm', DSFichero, CDSFiltro.FieldByName('MONEDA').AsString);
end;

procedure TWCarteraEfectos.BtnPermAsientoClick(Sender: TObject);
begin
   //if not DmControlRef.PermisoUsuario(gvID_Usuario, UpperCase(Self.Name), MODIFICAR) then begin
   //   Exit;
   //end;

   if not QFichero.IsEmpty then  begin
      if QFichero.State in dsEditModes then   begin
         GenerarAsientoEfectoActual;
      end
      else begin
         GenerarAsientoFiltroRemesa;
      end;
   end;
end;

procedure TWCarteraEfectos.BtnNavSeleccionClick(Sender: TObject);
begin
   if not QFichero.IsEmpty then  begin
      WSituacionEfecto := TWSituacionEfecto.Create(nil);
      WSituacionEfecto.FOperacionEfectos := GENERAR_ASIENTO;
      WSituacionEfecto.ShowModal;
      if FSituacion <> '' then   begin
         WCargaCobrosPagos.FID_Cartera := QFicheroID_CARTERAEFECTOS.AsInteger;
         WCargaCobrosPagos.FSituacion  := FSituacion;
         Close;
      end;
   end;
end;

procedure TWCarteraEfectos.FiltroRemesasBancariasClick(Sender: TObject);
begin
   if FiltroRemesasBancarias.Checked then  begin
      FiltroCBSUBCUENTADesde.LookupTable     := DMContaRef.QSubCtaClientes;
      FiltroCBDESCSUBCUENTADesde.LookupTable := DMContaRef.QSubCtaClientesDesc;
      FiltroCBSUBCUENTAHasta.LookupTable     := DMContaRef.QSubCtaClientes;
      FiltroCBDESCSUBCUENTAHasta.LookupTable := DMContaRef.QSubCtaClientesDesc;
   end
   else begin
      FiltroCBSUBCUENTADesde.LookupTable     := DMContaRef.QSubCtaClientesProv;
      FiltroCBDESCSUBCUENTADesde.LookupTable := DMContaRef.QSubCtaClientesProvDesc;
      FiltroCBSUBCUENTAHasta.LookupTable     := DMContaRef.QSubCtaClientesProv;
      FiltroCBDESCSUBCUENTAHasta.LookupTable := DMContaRef.QSubCtaClientesProvDesc;
   end;
end;

procedure TWCarteraEfectos.ImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then   begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWCarteraEfectos.BtnNavCartaClick(Sender: TObject);
var
   nTotImporte, nImporte: Double;
   i, j:        Integer;
   Documento, Registro: String;
   QSubcuentas: TIBQuery;
   Factura:     String;
   FWord:       Variant;
   Fichero:     TextFile;
begin
   if not QFichero.IsEmpty then  begin
      if Rejilla.SelectedList.Count = 0 then   begin
         DatabaseError('No ha seleccionado ningún registro.');
      end;

      WSituacionEfecto := TWSituacionEfecto.Create(nil);
      WSituacionEfecto.FOperacionEfectos := IMPRIMIR_CARTA;

      if WSituacionEfecto.ShowModal = mrOk then   begin
         //DMContaRef.CrearTablaCorreo;

         QSubcuentas := TIBQuery.Create(nil);
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QSubcuentas, SQL do begin
            Close;
            Database := DMRef.IBDSiamCont;
            Clear;
            Add('SELECT S.DESCRIPCION, S.DIRECCION, S.DIRECCION1, S.NUMERO,');
            Add('       S.POBLACION, S.CODPOSTAL, PR.NOMBRE NOMPROVINCIA   ');
            Add('FROM SUBCTAS S LEFT JOIN PROVINCIAS PR                    ');
            Add('     ON S.PROVINCIA = PR.PROVINCIA                        ');
            Add('WHERE S.SUBCUENTA = :SUBCUENTA                            ');
         end;

         AssignFile(Fichero, 'c:\correo.txt');
         Rewrite(Fichero);

         // Primero crear la cabecera del fichero la cual no se usa
         Registro :=
            'NOMBRE#SUBCUENTA#DIRECCION#POBLACION#CODPOSTAL#PROVINCIA#BANCO#CHEQUE#EJERCICIO#EMPRESA#TOTIMPORTE#EUROS#FECHAASIENTO#FECHA1#TEXTO1#IMPORTE1#FACTURA1#' +
            'FECHA2#TEXTO2#IMPORTE2#FACTURA2#FECHA3#TEXTO3#IMPORTE3#FACTURA3#FECHA4#TEXTO4#IMPORTE4#FACTURA4#FECHA5#TEXTO5#IMPORTE5#FACTURA5#'
            +
            'FECHA6#TEXTO6#IMPORTE6#FACTURA6#FECHA7#TEXTO7#IMPORTE7#FACTURA7#FECHA8#TEXTO8#IMPORTE8#FACTURA8#FECHA9#TEXTO9#IMPORTE9#FACTURA9#'
            +
            'FECHA10#TEXTO10#IMPORTE10#FACTURA10#';
         Writeln(Fichero, Registro);

         QSubcuentas.Close;
         QSubcuentas.ParamByName('SUBCUENTA').AsString := QFicheroSUBCUENTA.AsString;
         QSubcuentas.Open;

         // Segundo incluir registro
         if not QSubcuentas.EOF then   begin
            Registro := QSubcuentas.FieldByName('DESCRIPCION').AsString + '#' +
               QFicheroSUBCUENTA.AsString + '#' + QSubcuentas.FieldByName(
               'DIRECCION').AsString + ' ' + QSubcuentas.FieldByName('DIRECCION1').AsString +
               ', ' + QSubcuentas.FieldByName('NUMERO').AsString + '#' +
               QSubcuentas.FieldByName('POBLACION').AsString + '#' +
               QSubcuentas.FieldByName('CODPOSTAL').AsString + '#';
            if QSubcuentas.FieldByName('NOMPROVINCIA').AsString <> '' then   begin
               Registro := Registro + QSubcuentas.FieldByName('NOMPROVINCIA').AsString + '#';
            end
            else begin
               Registro := Registro + ' #';
            end;
         end
         else begin
            Registro := ' #' + QFicheroSUBCUENTA.AsString + '# # # # #';
         end;

         if QFicheroSUBCTABANCO.AsString <> '' then   begin
            Registro := Registro + QFicheroDescSubcuentaBanco.AsString + '#' + FCheque + '# #' +
               DMRef.QParametros.FieldByName('NOMBREFISCAL').AsString + '#';
         end
         else begin
            Registro := Registro + ' # # # #';
         end;

         // Obtener total importe
         nTotImporte := 0;
         for i := 0 to Rejilla.SelectedList.Count - 1 do begin
            QFichero.GotoBookmark(Rejilla.SelectedList.items[i]);
            nImporte    := RoundToDecimal(QFicheroIMPORTE.AsFloat, 2, True);
            nTotImporte := nTotImporte + nImporte;
            if i = 9 then begin
               break;
            end;
         end;
         Registro := Registro + Format('%.2n', [nTotImporte]) + '#' +
            UpperCase(Euros(nTotImporte, 'M')) + '# #'; // Fecha asiento


         for i := 0 to Rejilla.SelectedList.Count - 1 do begin
            QFichero.GotoBookmark(Rejilla.SelectedList.items[i]);
            nImporte := RoundToDecimal(QFicheroIMPORTE.AsFloat, 2, True);
            if QFicheroFACTCLIENT.AsString <> '' then begin
               Factura := QFicheroFACTCLIENT.AsString;
            end
            else begin
               Factura := QFicheroFACTPROVEEDOR.AsString;
            end;

            Registro := Registro + QFicheroFVencimiento.AsString + '#' +
               Copy(QFicheroConcepto.AsString, 1, 40) + '#' + Format('%.2n', [nImporte]) + '#' +
               FACTURA + '#';
            if i = 9 then begin
               break;
            end;
         end;
         // Poner el resto de campos vacios
         if i < 9 then   begin
            for j := i to 9 do begin
               Registro := Registro + ' # # # #';
            end;
         end;
         Writeln(Fichero, Registro);
         CloseFile(Fichero);

         if DMContaRef.ObtenerTipoSubcuenta(QFicheroSUBCUENTA.AsString) = 'P' then   begin
            Documento := DMRef.QParametros.FieldByName('DOCPROVEEDOR').AsString;
         end
         else begin
            Documento := DMRef.QParametros.FieldByName('DOCCLIENTE').AsString;
         end;

         Screen.Cursor := crHourGlass;

         QSubcuentas.Close;
         QSubcuentas.Free;
         Screen.Cursor := crDefault;
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

         FWord.ActiveDocument.MailMerge.OpenDataSource(
            Name := 'c:\correo.txt',
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

         MessageDlg('Impresión de carta finalizada', mtInformation, [mbOK], 0);
      end;
   end;
end;

procedure TWCarteraEfectos.BtnNavEfectosClick(Sender: TObject);
var
   Importe, Total: Double;
   I: Integer;
begin
   WEfectosComerciales := TWEfectosComerciales.Create(nil);
   if not QFichero.IsEmpty then  begin
      Total := 0;
      for I := 0 to Rejilla.SelectedList.Count - 1 do begin
         QFichero.GotoBookmark(Rejilla.SelectedList.items[I]);
         Importe := RoundToDecimal(QFicheroIMPORTE.AsFloat, 2, True);
         Total   := Total + Importe;
         WEfectosComerciales.FFechaEmision := QFicheroFEMISION.AsDateTime;
         WEfectosComerciales.FFechaVencimiento := QFicheroFVENCIMIENTO.AsDateTime;
         WEfectosComerciales.FSubcuenta := QFicheroSUBCUENTA.AsString;
         WEfectosComerciales.FTotalImporte := Total;
         if QFicheroFACTCLIENT.AsString <> '' then   begin
            WEfectosComerciales.FFactura := QFicheroFACTCLIENT.AsString;
         end
         else begin
            WEfectosComerciales.FFactura := QFicheroFACTPROVEEDOR.AsString;
         end;
      end;
   end;
   WEfectosComerciales.ShowModal;
   WEfectosComerciales := nil;
   Rejilla.SelectedList.Clear;
end;

procedure TWCarteraEfectos.QFicheroNewRecord(DataSet: TDataSet);
begin
   QFicheroFEMISION.AsDateTime := Date;

   if FNuevoVto then  begin
      QFicheroSUBCUENTA.AsString := FSubcuentaNuevoVto;
      QFicheroCONCEPTO.AsString  := Copy(FConceptoNuevoVto, 1, 50);
      QFicheroIMPORTE.AsFloat    := FImporteNuevoVto;
   end;
end;

procedure TWCarteraEfectos.BtnNavAsientoBajaClick(Sender: TObject);
var
   I, Asiento:  Integer;
   QInsDiario:  TIBSQL;
   QAsientos:   TIBQuery;
   StrAsientos: String;
   Caratula:    TEspere;
begin
   if not QFichero.IsEmpty then  begin
      // Si no se ha seleccionado ningún efecto, confirmar si desea generar
      // el asiento de baja de todos los efectos filtrados.
      if (Rejilla.SelectedList.Count = 0) or ((Rejilla.SelectedList.Count = 1) and
         (QFicheroASIENTORIESGO.AsInteger = 0)) then begin
         if MessageDlg('No ha seleccionado ningún efecto.' + #13 +
            '¿Desea generar el asiento de baja de todos los efectos filtrados?' + #13 +
            'Le recuerdo que sólo son válidos asientos con asiento de riesgo ya generado.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
            Rejilla.SelectAll;
         end;
      end
      else
      if MessageDlg('¿Confirma la realización del asiento de baja?.' + #13 +
         'Le recuerdo que sólo son válidos asientos con asiento de riesgo ya generado.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         Exit;
      end;

      // Seleccionar asiento de riesgo
      QAsientos := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QAsientos, SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('SELECT * FROM DIARIO WHERE ASIENTO = :ASIENTO');
      end;

      // Insertar asiento de baja
      QInsDiario := TIBSQL.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QInsDiario, SQL do begin
         Close;
         Database := DMRef.IBDSiamCont;
         Clear;
         Add('INSERT INTO DIARIO ');
         Add('(APUNTE, ASIENTO, COMENTARIO, CONTRAPARTIDA, DEBEHABER,');
         Add(' FECHA, IMPORTE, MONEDA, NUMEROFACTURA, SUBCUENTA,');
         Add(' ID_CONCEPTOS, CUENTA_ANALITICA)');
         Add('VALUES');
         Add('(:APUNTE, :ASIENTO, :COMENTARIO, :CONTRAPARTIDA, :DEBEHABER,');
         Add(' :FECHA, :IMPORTE, :MONEDA, :NUMEROFACTURA, :SUBCUENTA,');
         Add(' :ID_CONCEPTOS, :CUENTA_ANALITICA)');
      end;

      Asiento     := 0;
      StrAsientos := '';

      Caratula := TEspere.Create(nil);
      Caratula.Mensaje      := 'Generando asientos ...';
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
      Caratula.Avi_Predet   := Ninguno;
      Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
      Caratula.Mostrar;

      QFichero.DisableControls;
      for I := 0 to Rejilla.SelectedList.Count - 1 do begin
         QFichero.GotoBookmark(Rejilla.SelectedList.items[I]);
         if QFicheroASIENTORIESGO.AsInteger <> 0 then   begin
            QAsientos.Close;
            QAsientos.ParamByName('ASIENTO').AsInteger := QFicheroASIENTORIESGO.AsInteger;
            QAsientos.Open;
            if not QAsientos.EOF then   begin
               Asiento := DMContaRef.ObtenerNumeroAsiento;

               QInsDiario.Close;
               while not QAsientos.EOF do begin
                  QInsDiario.Close;
                  QInsDiario.ParamByName('APUNTE').AsInteger        := QAsientos.FieldByName('APUNTE').AsInteger;
                  QInsDiario.ParamByName('ASIENTO').AsInteger       := Asiento;
                  QInsDiario.ParamByName('COMENTARIO').AsString     :=
                     QAsientos.FieldByName('COMENTARIO').AsString;
                  QInsDiario.ParamByName('CONTRAPARTIDA').AsVariant :=
                     QAsientos.FieldByName('SUBCUENTA').AsVariant;
                  QInsDiario.ParamByName('DEBEHABER').AsString      := QAsientos.FieldByName('DEBEHABER').AsString;
                  QInsDiario.ParamByName('FECHA').AsDateTime        := Date;
                  QInsDiario.ParamByName('IMPORTE').AsFloat         :=
                     RoundToDecimal(QAsientos.FieldByName('IMPORTE').AsFloat, 2, True);
                  QInsDiario.ParamByName('MONEDA').AsString         := QAsientos.FieldByName('MONEDA').AsString;
                  QInsDiario.ParamByName('NUMEROFACTURA').AsString  :=
                     QAsientos.FieldByName('NUMEROFACTURA').AsString;
                  QInsDiario.ParamByName('SUBCUENTA').AsVariant     :=
                     QAsientos.FieldByName('CONTRAPARTIDA').AsVariant;
                  QInsDiario.ParamByName('ID_CONCEPTOS').AsVariant  :=
                     QAsientos.FieldByName('ID_CONCEPTOS').AsVariant;
                  QInsDiario.ParamByName('CUENTA_ANALITICA').AsVariant :=
                     QAsientos.FieldByName('CUENTA_ANALITICA').AsVariant;
                  QInsDiario.ExecQuery;
                  QInsDiario.Transaction.CommitRetaining;
                  QAsientos.Next;
               end;  // while not QAsientos.Eof do

               if StrAsientos <> '' then   begin
                  StrAsientos := StrAsientos + ', ';
               end;
               StrAsientos := StrAsientos + IntToStr(Asiento);
            end;  // if not QAsientos.Eof then
         end;  // if QFicheroASIENTORIESGO.AsInteger <> 0 then
      end;  // for I := 0 to Rejilla.SelectedList.Count - 1 do

      Caratula.Cerrar;

      if Asiento = 0 then begin
         MessageDlg('No había ningún asiento de riesgo entre los seleccionados.', mtInformation, [mbOK], 0);
      end
      else begin
         if MessageDlg('¿Desea eliminar los efectos seleccionados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Caratula do begin
               Mensaje      := 'Eliminando efectos ...';
               Ancho        := 300;
               Alto         := 150;
               Avi_Left     := 20;
               Avi_Top      := 80;
               Fuente.Color := clWhite;
               Fuente.Name  := 'Arial';
               Fuente.Size  := 14;
               Mensaje_Left := 14;
               Mensaje_Top  := 14;
               Avi_Color    := $00A56D39;
               ColorFondo   := $00A56D39;
               MostrarMarco := True;
               Avi_Predet   := Ninguno;
               Avi_File     := gvDirImagenes + gcBarraProgreso;
               Mostrar;
            end;

            for I := 0 to Rejilla.SelectedList.Count - 1 do begin
               QFichero.GotoBookmark(Rejilla.SelectedList.items[I]);
               if QFicheroASIENTORIESGO.AsInteger <> 0 then   begin
                  QFichero.Delete;
                  QFichero.Transaction.CommitRetaining;
               end;
            end;  // for I := 0 to Rejilla.SelectedList.Count - 1 do
         end;
      end;
      Rejilla.SelectedList.Clear;
      QFichero.EnableControls;
      Caratula.Cerrar;
      Caratula.Free;

      if StrAsientos <> '' then   begin
         MessageDlg('Generado asiento nº ' + StrAsientos, mtInformation, [mbYes], 0);
      end;

      QAsientos.Close;
      QAsientos.Free;

      QInsDiario.Close;
      QInsDiario.Free;
   end;        // if not QFichero.IsEmpty then
end;

procedure TWCarteraEfectos.BtnNavDuplicarClick(Sender: TObject);
var QOrigen   :TibDataset;
    i         :Integer;
    nContador :Integer;
    Campo     :string;
begin
   if MessageDlg('¿Confirma duplicar el registro actual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      QOrigen := TibDataset.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QOrigen, selectSql do begin
         Database    := DMRef.IBDSiamCont;
         Transaction := Transaccion;
         Clear;
         add('select * from carteraefectos where id_carteraefectos=:id_carteraefectos');
         params.byname('id_carteraefectos').AsInteger := QFicheroid_CarteraEfectos.AsInteger;
         Open;

         QFichero.insert;
         for i := 0 to fieldcount - 1 do begin
            Campo           := fields[i].fieldname;
            QFichero[campo] := QOrigen[campo];
         end;
         QFichero.post;
         Transaccion.CommitRetaining;
         Close;
         Free;
         nContador := DMRef.ObtenerValor('GEN_ID(CARTERAEFECTOS, 0)', 'RDB$DATABASE', '');
         cdsfiltro.edit;
         cdsfiltro.FieldByName('Bnumero').AsInteger := nContador;
         cdsfiltro.post;
         PrepararQuery;
      end;
   end;
end;

end.
