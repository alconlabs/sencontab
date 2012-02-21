unit WizardConnectDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Grids,
  DBGrids, DB, Mask, Gauges, DBXpress, SqlExpr, ConfigurationClass,
  CRSQLConnection, ImgList, D6OnHelpFix, CustomView;

  {TODO: Finish this wizard with editing posibilities and all the options }
  {TODO: Improve the detection of the Database. Don't create if the database has tables or exists previously}

type
  TButtonState   = (bsNext, bsNextBack, bsEnd);

  TWizardConnectDB = class(TCustomView)
    PanelBottom: TPanel;
    PageControl: TPageControl;
    TabDatabase: TTabSheet;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    TabSeleccionaTipo: TTabSheet;
    TabPartidas: TTabSheet;
    TabCodigos: TTabSheet;
    BtnBack: TButton;
    BtnNext: TButton;
    BtnEnd: TButton;
    BtnCancel: TButton;
    TabResumen: TTabSheet;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroupTipoSolicitud: TRadioGroup;
    DBGridPartidas: TDBGrid;
    PanelUpPartidas: TPanel;
    BtnInsertarPartida: TBitBtn;
    EditCodigoPartida: TEdit;
    Label6: TLabel;
    BtnDeletePartida: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Label9: TLabel;
    BtnInsertaCodigo: TBitBtn;
    EditNSerie: TEdit;
    BtnEliminaCodigo: TBitBtn;
    DBGridCodigos: TDBGrid;
    Label24: TLabel;
    Label10: TLabel;
    BtnImportaCodigos: TBitBtn;
    BtnQuitarTodosCodigos: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    Panel7: TPanel;
    Fondo: TPanel;
    Label13: TLabel;
    StatusBar: TStatusBar;
    Timer: TTimer;
    OpenFileDialog: TOpenDialog;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EditHostName: TEdit;
    EditDatabaseName: TEdit;
    GroupBoxPartidas: TGroupBox;
    PanelSummaryPartidas: TPanel;
    LabelTotalPartidasTexto: TLabel;
    PanelSummaryLibres: TPanel;
    LabelLibresTexto: TLabel;
    PanelSummaryEnUso: TPanel;
    LabelEnUsoTexto: TLabel;
    PanelSummaryActivos: TPanel;
    LabelActivosTexto: TLabel;
    PanelSummaryInactivos: TPanel;
    LabelInactivosTexto: TLabel;
    PanelSummaryRenovados: TPanel;
    LabelRenovadosTexto: TLabel;
    LabelPartidas: TLabel;
    LabelActivos: TLabel;
    LabelInactivos: TLabel;
    LabelEnUso: TLabel;
    LabelLibres: TLabel;
    LabelRenovados: TLabel;
    Label25: TLabel;
    Gauge: TGauge;
    EditUserName: TEdit;
    EditPassword: TEdit;
    Label15: TLabel;
    EditRetypePassword: TEdit;
    BtnTestConnection: TButton;
    ImageList: TImageList;
    ImageListCaptions: TImageList;
    CheckBoxCreateNew: TCheckBox;
    Label14: TLabel;
    procedure FormShow(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEndClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnInsertarPartidaClick(Sender: TObject);
    procedure BtnDeletePartidaClick(Sender: TObject);
    procedure BtnInsertaCodigoClick(Sender: TObject);
    procedure BtnImportaCodigosClick(Sender: TObject);
    procedure BtnEliminaCodigoClick(Sender: TObject);
    procedure BtnQuitarTodosCodigosClick(Sender: TObject);
    procedure BtnTestConnectionClick(Sender: TObject);
  private
     FDummyDB     :TCRSQLConnection;
     FOKDatabase  :Integer;
     FOKSeleccion :Integer;
     FOKPartidas  :Integer;
     FOKCodigos   :Integer;
     FOKResumen   :Integer;

     FModificando   :Boolean;
     FConfiguration :TConfiguration;

     procedure SetOKDatabase (Value :Integer);
     procedure SetOKSeleccion(Value :Integer);
     procedure SetOKPartidas (Value :Integer);
     procedure SetOKCodigos  (Value :Integer);
     procedure SetResumen    (Value :Integer);
     procedure SetOKImages;

     function  CheckDatabaseValues:Boolean;
     procedure SetValuesToConfiguration;
     function  CheckConnection(ADatabase :string):Boolean;
     function  CheckDatabaseExistency(ADatabase :string):Boolean;
     function  CheckDatabaseVersion:Boolean;
     procedure CreateDatabase;
     procedure CreateINIFile;
     procedure ShowErrorMessage(prmErrorMessage :string);
     procedure SetButtonState(prmState :TButtonState);

     function  DBConfigurationValid        :Boolean;
     function  PartidasSolicitadasValidas  :Boolean;
     function  CodigosSolicitadosValidos   :Boolean;
     function  ExisteInformacionDeCodigos  :Boolean;
     function  ExisteInformacionDePartidas :Boolean;
     function  EliminarInformacionPartidas :Boolean;
     procedure CreaInformacionResumen;
     function  PartidaValida(prmCodigoPartida :string):Boolean;
     function  CodigoValido(prmNSerie :string):Boolean;
     function  InsertaCodigo(prmNSerie :string):Boolean;
  public
     property OKDatabase  :Integer read FOKDatabase  write SetOKDatabase;
     property OKSeleccion :Integer read FOKSeleccion write SetOKSeleccion;
     property OKPartidas  :Integer read FOKPartidas  write SetOKPartidas;
     property OKCodigos   :Integer read FOKCodigos   write SetOKCodigos;
     property OKResumen   :Integer read FOKResumen   write SetResumen;

     constructor CreateWizard(AConfiguration :TConfiguration);
     function Execute:Boolean;
     property Modificando :Boolean read FModificando write FModificando;
  end;

implementation

uses General, HashCriptography;

{$R *.DFM}

constructor TWizardConnectDB.CreateWizard(AConfiguration: TConfiguration);
//var dummy :string;
begin
   Self.Create(Application);
   FConfiguration := AConfiguration;

   FDummyDB := TCRSQLConnection.Create(Self);

   FConfiguration.DBConfig.AssignValuesTo(FDummyDB);

   EditHostName.Text     := FConfiguration.DBConfig.HostName;
   EditDataBaseName.Text := FConfiguration.DBConfig.Database;
   EditUserName.Text     := FConfiguration.DBConfig.User_Name;
   CheckBoxCreateNew.Checked := False;

   //FDummyDB.ConnectionName := 'SQLServerConnection';
   //FDummyDB.DriverName     := 'SQLServer';
   //FDummyDB.GetDriverFunc  := 'getSQLDriverSQLServer';
   //FDummyDB.LibraryName    := 'dbexpsda.dll';
   //FDummyDB.LoginPrompt    := False;
   //FDummyDB.KeepConnection := True;
   //FDummyDB.VendorLib      := 'sqloledb.dll';
   //FDummyDB.Params.Values['DriverName' ] := 'SQLServer';
   //FDummyDB.Params.Values['BlobSize'   ] := '-1'  ;
   //FDummyDB.Params.Values['EnableBCD'  ] := 'True';
   //FDummyDB.Params.Values['LongStrings'] := 'True';
   //FDummyDB.Params.Values['FetchAll'   ] := 'True';

   {$Message Warn 'Asignar aquí los valores a los campos'}
end;

function TWizardConnectDB.Execute:Boolean;
begin
   //   FModificando := prmDatos.Modificacion;
   //   if prmDatos.Modificacion then begin
   //      Screen.Cursor := crSQLWait;
   //      try
   //         if prmDatos.Tipo = 'P'  then RadioGroupTipoSolicitud.ItemIndex := 0
   //                           {'C'} else RadioGroupTipoSolicitud.ItemIndex := 1;
   //
   //      finally
   //         Screen.Cursor := crDefault;
   //         EditCodigo.Ctl3D    := False;
   //         EditCodigo.TabStop  := False;
   //         EditCodigo.ReadOnly := True;
   //      end;
   //   end
   //   else begin
   //      MRegistro.Append;
   //      MRegistroidDPC.AsInteger          := prmDatos.idDPC;
   //      MRegistroCodigo.AsString          := prmDatos.Codigo;
   //      MRegistroDescripcion.AsString     := prmDatos.Descripcion;
   //      MRegistroTipo.AsString            := prmDatos.Tipo;
   //      MRegistroidUsuario.AsInteger      := prmDatos.idUsuario;
   //      MRegistroFechaRegistro.AsDateTime := prmDatos.FechaRegistro;
   //      MRegistroEstado.AsInteger         := prmDatos.Estado;
   //      MRegistroFechaEstado.AsDateTime   := prmDatos.FechaEstado;
   //      MRegistroNombreUsuario.AsString   := prmDatos.NombreUsuario;
   //      MRegistro.Post;
   //   end;
      try
         Result := ShowModal = mrOK;
   //      if Result then begin
   //      end;
      finally Free;
      end;
end;

procedure TWizardConnectDB.FormShow(Sender: TObject);
begin
   SetButtonState(bsNext);
   if FModificando then EditDatabaseName.SetFocus
                   else EditHostName.SetFocus;
end;

procedure TWizardConnectDB.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := False;
end;

procedure TWizardConnectDB.SetButtonState(prmState :TButtonState);
begin
   case prmState of
      bsNext     :begin
        BtnBack.Enabled   := False;
        BtnNext.Enabled   := True;
        BtnEnd.Enabled    := False;
        BtnCancel.Enabled := True;

        BtnNext.Default   := True;
        BtnEnd.Default    := False;

        BtnNext.SetFocus;
      end;
      bsNextBack :begin
        BtnBack.Enabled   := True;
        BtnNext.Enabled   := True;
        BtnEnd.Enabled    := False;
        BtnCancel.Enabled := True;

        BtnNext.Default   := True;
        BtnEnd.Default    := False;

        BtnNext.SetFocus;
      end;
      bsEnd      :begin
        BtnBack.Enabled   := True;
        BtnNext.Enabled   := False;
        BtnEnd.Enabled    := True;
        BtnCancel.Enabled := True;

        BtnNext.Default   := False;
        BtnEnd.Default    := True;
        BtnEnd.SetFocus;
      end;
   end;
end;

procedure TWizardConnectDB.TimerTimer(Sender: TObject);
begin
   StatusBar.Panels[1].Text := '';
   Timer.Enabled := False;
end;

procedure TWizardConnectDB.ShowErrorMessage(prmErrorMessage :string);
begin
   StatusBar.Font.Style := [fsBold];
   StatusBar.Panels[1].Text := '      '+prmErrorMessage;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
end;

procedure TWizardConnectDB.FormCreate(Sender: TObject);
begin
   FOKDatabase  := 0;
   FOKSeleccion := 0;
   FOKPartidas  := 0;
   FOKCodigos   := 0;
   FOKResumen   := 0;

   TabDatabase.Show;
end;

function TWizardConnectDB.DBConfigurationValid:Boolean;
var Resultado :Integer;
begin
   if FModificando then begin
      Result := True;
      Exit;
   end;

   Result := True;
   //if Trim(MRegistroCodigo.AsString) = '' then begin
   //   ShowErrorMessage('Debe indicar un código de solicitud');
   //   EditCodigo.SetFocus;
   //   Result := False;
   //   Exit;
   //end;

   //Resultado := DPCData.RegistroCorrecto(MRegistroCODIGO.AsString);
   case Resultado of
      -995 :begin
         ShowErrorMessage('El código de SOLICITUD ya existe en la base de datos.');
         EditHostName.SetFocus;
         Result := False;
         Exit;
      end;
   end;
end;

function TWizardConnectDB.PartidasSolicitadasValidas:Boolean;
begin
   Result := True;
   //Result := not MRegistroPartidas.IsEmpty;
end;

function TWizardConnectDB.CodigosSolicitadosValidos:Boolean;
begin
   Result := True;
   //Result := not MRegistroCodigos.IsEmpty;
end;

function TWizardConnectDB.ExisteInformacionDeCodigos:Boolean;
begin
   //Result := True;
   //Result := not MRegistroCodigos.IsEmpty;
end;

function TWizardConnectDB.ExisteInformacionDePartidas:Boolean;
begin
   Result := True;
   //Result := not MRegistroPartidas.IsEmpty;
end;

function TWizardConnectDB.EliminarInformacionPartidas:Boolean;
begin
   if MessageDlg('Perderá la Información de las Partidas Solicitadas ¿Seguro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      //MRegistroPartidas.EmptyTable;
      Result := True;
   end
   else Result := False;
end;

procedure TWizardConnectDB.CreaInformacionResumen;
var Partidas  :Integer;
    Activos   :Integer;
    Inactivos :Integer;
    Libres    :Integer;
    EnUso     :Integer;
    Renovados :Integer;
begin
   { Ponemos visibles lo componentes }
    PanelSummaryPartidas.Visible    := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelTotalPartidasTexto.Visible := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelActivosTexto.Visible       := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelInactivosTexto.Visible     := RadioGroupTipoSolicitud.ItemIndex = 0;
    PanelSummaryInactivos.Visible   := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelEnUsoTexto.Visible         := RadioGroupTipoSolicitud.ItemIndex = 0;
    PanelSummaryEnUso.Visible       := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelLibresTexto.Visible        := RadioGroupTipoSolicitud.ItemIndex = 0;
    PanelSummaryLibres.Visible      := RadioGroupTipoSolicitud.ItemIndex = 0;
    LabelRenovadosTexto.Visible     := RadioGroupTipoSolicitud.ItemIndex = 0;
    PanelSummaryRenovados.Visible   := RadioGroupTipoSolicitud.ItemIndex = 0;
    case RadioGroupTipoSolicitud.ItemIndex of
      0 :begin { Partidas }
        Partidas  := 0;
        Activos   := 0;
        Inactivos := 0;
        Libres    := 0;
        EnUso     := 0;
        Renovados := 0;

        //MRegistroPartidas.DisableControls;
        //Screen.Cursor := crSQLWait;
        //try
        //   MRegistroPartidas.First;
        //   while not MRegistroPartidas.EOF do begin
        //      Partidas  := Partidas  + 1;
        //      Activos   := Activos   + MRegistroPartidasActivos.AsInteger;
        //      Inactivos := Inactivos + MRegistroPartidasInactivos.AsInteger;
        //      Libres    := Libres    + MRegistroPartidasLibres.AsInteger;
        //      EnUso     := EnUso     + MRegistroPartidasEnUso.AsInteger;
        //      Renovados := Renovados + MRegistroPartidasRenovados.AsInteger;
        //      MRegistroPartidas.Next;
        //   end;
        //
        //   LabelPartidas.Caption  := IntToStr(Partidas );
        //   LabelActivos.Caption   := IntToStr(Activos  );
        //   LabelActivos.Tag       := Activos;
        //   LabelInactivos.Caption := IntToStr(Inactivos);
        //   LabelLibres.Caption    := IntToStr(Libres   );
        //   LabelEnUso.Caption     := IntToStr(EnUso    );
        //   LabelRenovados.Caption := IntToStr(Renovados);
        //finally
        //   MRegistroPartidas.EnableControls;
        //   Screen.Cursor := crDefault;
        //end;
      end;
      1 :begin { Codigos }
        Activos := 0;
        //MRegistroCodigos.DisableControls;
        //Screen.Cursor := crSQLWait;
        //try
        //   { Cuenta los Códigos a modo de estadística }
        //   MRegistroCodigos.First;
        //   while not MRegistroCodigos.EOF do begin
        //      Inc(Activos);
        //      MRegistroCodigos.Next;
        //   end;
        //   LabelActivos.Caption := IntToStr(Activos);
        //   LabelActivos.Tag     := Activos;
        //finally
        //    MRegistroCodigos.EnableControls;
        //    Screen.Cursor := crDefault;
        //end;
      end;
    end;
end;

procedure TWizardConnectDB.BtnNextClick(Sender: TObject);
begin
   if PageControl.ActivePage = TabDatabase then begin
      if DBConfigurationValid then begin
         TabSeleccionaTipo.Show;
         SetButtonState(bsNextBack);
      end
      else begin
         ShowErrorMessage('¡Inténtelo de nuevo!');
      end;
   end else
   if PageControl.ActivePage = TabSeleccionaTipo then begin
      case RadioGroupTipoSolicitud.ItemIndex of
         0 :begin {Partidas}
            if ExisteInformacionDeCodigos then begin
               
            end;
            TabPartidas.Show;

            //MRegistro.Edit;
            //MRegistroTipo.AsString := 'P';
            //try MRegistro.Post;
            //except
            //   MRegistro.Cancel;
            //   ShowErrorMessage('Hubo algún problema al indicar el tipo de Solicitud');
            //end;

            EditCodigoPartida.SetFocus;
         end;
         1 :begin { Códigos }
            if ExisteInformacionDePartidas then begin
               if not EliminarInformacionPartidas then begin
                  TabSeleccionaTipo.Show;
                  Exit;
               end;
            end;
            TabCodigos.Show;

            //MRegistro.Edit;
            //MRegistroTipo.AsString := 'C';
            //try MRegistro.Post;
            //except
            //   MRegistro.Cancel;
            //   ShowErrorMessage('Hubo algún problema al indicar el tipo de Solicitud');
            //end;
            //EditNSerie.SetFocus;
         end;
      end;
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabPartidas then begin
      if (Self.ActiveControl = EditCodigoPartida) and
         (Trim(EditCodigoPartida.Text) <> '' ) then
      begin
         BtnInsertarPartida.Click;
      end else
      if PartidasSolicitadasValidas then begin
         CreaInformacionResumen;
         TabResumen.Show;
         SetButtonState(bsEnd);
      end
      else begin
         ShowErrorMessage('Los datos de las partidas solicitadas no son válidos.');
      end;
   end else
   if PageControl.ActivePage = TabCodigos then begin
      if (Self.ActiveControl = EditNSerie) and
         (Trim(EditNSerie.Text) <> '' ) then
      begin
         BtnInsertaCodigo.Click;
      end else
      if CodigosSolicitadosValidos then begin
         CreaInformacionResumen;
         TabResumen.Show;
         SetButtonState(bsEnd);
      end
      else begin
         ShowErrorMessage('Los datos de los códigos solicitados no son válidos.');
      end;
   end;
end;

procedure TWizardConnectDB.BtnBackClick(Sender: TObject);
begin
   if PageControl.ActivePage = TabResumen then begin
      case RadioGroupTipoSolicitud.ItemIndex of
         0 :TabPartidas.Show;
         1 :TabCodigos.Show;
      end;
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabPartidas then begin
      TabSeleccionaTipo.Show;
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabCodigos then begin
      TabSeleccionaTipo.Show;
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabSeleccionaTipo then begin
      TabDatabase.Show;
      SetButtonState(bsNext);
   end;
end;

procedure TWizardConnectDB.BtnCancelClick(Sender: TObject);
begin
   if MessageDlg('¿Seguro que desea cancelar la solicitud?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      //EliminarDatosDeMemoria;
      ModalResult := mrCancel;
   end;
end;

procedure TWizardConnectDB.BtnEndClick(Sender: TObject);
var Correctos :Integer;
begin
   FConfiguration.Serialize;
   if CheckBoxCreateNew.Checked then CreateDatabase;

   if MessageDlg('Se registrará esta petición y quedará pendiente de marcar como procesable.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
   begin
      Screen.Cursor := crSQLWait;
      try
         try
         finally
         end;
      finally
         Screen.Cursor := crDefault;
      end;
      ModalResult := mrOK;
   end;
end;

function TWizardConnectDB.PartidaValida(prmCodigoPartida :string):Boolean;
var CodigoValidez :Integer;
begin
   Result := True; {Valor por defecto}

   {RFU.01a}
   if prmCodigoPartida = '' then begin
      ShowErrorMessage('Debe indicar un código de partida');
      EditCodigoPartida.SetFocus;
      Result := False;
      Exit;
   end;

   {RFU.01b}
   if Length(prmCodigoPartida) > 10 then begin
      ShowErrorMessage('El "Código de Partida" debe tener como máximo 10 caracteres de longitud');
      EditCodigoPartida.SetFocus;
      Result := False;
      Exit;
   end;

   {RFU.XX  No está en el análisis. El Código de partida no puede solicitarse dos veces.}
   //MRegistroPartidas.DisableControls;
   //try
   //   MRegistroPartidas.First;
   //   while not MRegistroPartidas.EOF do begin
   //      if MRegistroPartidasCodigoPartida.AsString = prmCodigoPartida then begin
   //         ShowErrorMessage('El "Código de Partida" ya está en solicitado AQUÍ');
   //         EditCodigoPartida.SetFocus;
   //         Result := False;
   //         Break;
   //      end;
   //      MRegistroPartidas.Next;
   //   end;
   //finally
   //   MRegistroPartidas.EnableControls;
   //end;

   //CodigoValidez := DPCData.CodigoPartidaCorrecto(prmCodigoPartida);
   //case CodigoValidez of
   //   -990 :begin {FRU.02}
   //      ShowErrorMessage('(990) La partida '+prmCodigoPartida+' no existe en la base de datos.');
   //      EditCodigoPartida.SetFocus;
   //      Result := False;
   //      Exit;
   //   end;
   //   -991 :begin {FRU.03}
   //      ShowErrorMessage('(991) Existe una solicitud de desactivación de la partida '+prmCodigoPartida+
   //                   ' Consulte con el usuario '+DPCData.GetUsuarioSolicitoDesactPartida(prmCodigoPartida));
   //      EditCodigoPartida.SetFocus;
   //      Result := False;
   //      Exit;
   //   end;
   //   -992 :begin {FRU.04}
   //      ShowErrorMessage('(992) La partida '+prmCodigoPartida+' ya está inactiva.');
   //      EditCodigoPartida.SetFocus;
   //      Result := False;
   //      Exit;
   //   end;
   //   -993 :begin {FRU.05}
   //      ShowErrorMessage('(993) La partida '+prmCodigoPartida+' no tiene codigos de activación vinculados.');
   //      EditCodigoPartida.SetFocus;
   //      Result := False;
   //      Exit;
   //   end;
   //   -994 :begin {FRU.06}
   //      ShowErrorMessage('(994) La partida '+prmCodigoPartida+' no tiene códigos de activación a desactivar.');
   //      EditCodigoPartida.SetFocus;
   //      Result := False;
   //      Exit;
   //   end;
   //   -995 :begin {FRU.07}
   //      ShowErrorMessage('(995) La partida '+prmCodigoPartida+' tiene '+DPCData.GetNumCodigosVinculados(prmCodigoPartida)+
   //                   ' vinculados a clientes finales.');
   //      EditCodigoPartida.SetFocus;
   //      Result := True;
   //      Exit;
   //   end;
   //end;
end;

procedure TWizardConnectDB.BtnInsertarPartidaClick(Sender: TObject);
//var //DatosPartida :TDPCDatosPartidaNSerie;
    //StadsPartida :TDPCStadsPartida;
begin
   //Screen.Cursor := crSQLWait;
   //try
   //   if not PartidaValida(Trim(EditCodigoPartida.Text)) then begin
   //      Screen.Cursor := crDefault;
   //      Exit;
   //   end
   //finally
   //   Screen.Cursor := crDefault;
   //end;
   //
   //Screen.Cursor := crSQLWait;
   //DatosPartida := DPCData.GetDatosPartidaNSerie(Trim(EditCodigoPartida.Text));
   //StadsPartida := DPCData.GetStadsPartida(DatosPartida.idPartidaNSerie);
   //
   //MRegistroPartidas.Append;
   //MRegistroPartidasidDPC.AsInteger           := MRegistroidDPC.AsInteger;
   //MRegistroPartidasCodigoPartida.AsString    := Trim(EditCodigoPartida.Text);
   //MRegistroPartidasidPartidaNSerie.AsInteger := DatosPartida.idPartidaNSerie;
   //MRegistroPartidasEstado.AsInteger          := DatosPartida.Estado;
   //MRegistroPartidasObservaciones.AsString    := DatosPartida.Observaciones;
   //MRegistroPartidasTotalCodigos.AsInteger    := StadsPartida.TotalCodigos;
   //MRegistroPartidasLibres.AsInteger          := StadsPartida.TotalLibres;
   //MRegistroPartidasEnUso.AsInteger           := StadsPartida.TotalEnUso;
   //MRegistroPartidasActivos.AsInteger         := StadsPartida.TotalActivos;
   //MRegistroPartidasInactivos.AsInteger       := StadsPartida.TotalInactivos;
   //MRegistroPartidasRenovados.AsInteger       := StadsPartida.TotalRenovados;
   //try MRegistroPartidas.Post;
   //    EditCodigoPartida.Text := '';
   //    EditCodigoPartida.SetFocus;
   //    Screen.Cursor := crDefault;
   //except MRegistroPartidas.Cancel;
   //       Screen.Cursor := crDefault;
   //       ShowErrorMessage('Hubo algún problema al dar de alta la partida');
   //end;
end;

procedure TWizardConnectDB.BtnDeletePartidaClick(Sender: TObject);
begin
   //if MessageDlg('Esto quitará la partida '+MRegistroPartidasCodigoPartida.AsString+' de la solicitud actual.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
   //begin
   //   MRegistroPartidas.Delete;
   //end;
end;

function TWizardConnectDB.CodigoValido(prmNSerie :string):Boolean;
begin
   Result := True;
   if prmNSerie = '' then begin
      ShowErrorMessage('Debe indicar un código válido');
      EditNSerie.SetFocus;
      Result := False;
      Exit;
   end else
   if Length(prmNSerie) > 20 then begin
      ShowErrorMessage('La código no debe superar los 20 caracteres de longitud.');
      EditNSerie.SetFocus;
      Result := False;
      Exit;
   end;
end;

function TWizardConnectDB.InsertaCodigo(prmNSerie :string):Boolean;
begin
   //MRegistroCodigos.Append;
   //MRegistroCodigosidDPC.AsInteger            := MRegistroidDPC.AsInteger;
   //MRegistroCodigosidNumerosSerie.AsInteger   := -1; { Estos son los nuevos }
   //{ IdPartidaNSerie no se aplica aquí. }
   ////MRegistroCodigosidPartidaNSerie.AsInteger  := DatosPartida.idPartidaNSerie;
   //MRegistroCodigosNSerie.AsString            := prmNSerie;
   //MRegistroCodigosEstado.AsInteger           := 0;
   //try MRegistroCodigos.Post;
   //    Result := True;
   //except MRegistroCodigos.Cancel;
   //    Result := False;
   //    ShowErrorMessage('Hubo algún problema al dar de alta el código');
   //end;
end;

procedure TWizardConnectDB.BtnInsertaCodigoClick(Sender: TObject);
begin
   if not CodigoValido(Trim(EditNSerie.Text)) then Exit;

   if InsertaCodigo(Trim(EditNSerie.Text)) then begin
      EditNSerie.Text := '';
      EditNSerie.SetFocus;
   end;
end;

procedure TWizardConnectDB.BtnImportaCodigosClick(Sender: TObject);
var FileWithCodes :TStrings; {El tipo es correcto ver ADODB.pas para entenderlo}
    i             :Integer;
    Totales       :Integer;
    Correctos     :Integer;
    Erroneos      :Integer;
begin
   if OpenFileDialog.Execute then begin
      Totales   := 0;
      Correctos := 0;
      Erroneos  := 0;
      FileWithCodes := TStringList.Create;
      //MRegistroCodigos.DisableControls;
      //Screen.Cursor := crSQLWait;
      //try
      //   FileWithCodes.LoadFromFile(OpenFileDialog.FileName);
      //   for i := 0 to FileWithCodes.Count -1 do begin
      //       if not CodigoValido(Trim(FileWithCodes[i])) then begin
      //          Inc(Totales);
      //          Inc(Erroneos);
      //       end else
      //       if InsertaCodigo(Trim(FileWithCodes[i])) then begin
      //          Inc(Totales);
      //          Inc(Correctos);
      //       end;
      //   end;
      //finally
      //   FileWithCodes.Free;
      //   Screen.Cursor := crDefault;
      //   MRegistroCodigos.EnableControls;
      //end;
      MessageDlg(IntToStr(Totales  )+ ' Códigos procesados, de los cuales'+#13+
                 IntToStr(Correctos)+ ' tienen un formato correcto y '+#13+
                 IntToStr(Erroneos )+ ' no se han insertado, por ser erróneos.', mtInformation, [mbOK], 0);
   end;
end;

procedure TWizardConnectDB.BtnEliminaCodigoClick(Sender: TObject);
begin
   //if MessageDlg('Esto quitará el Código de Activación "'+MRegistroCodigosNSerie.AsString+'" de la solicitud actual.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
   //begin
   //   MRegistroCodigos.Delete;
   //end;
end;

procedure TWizardConnectDB.BtnQuitarTodosCodigosClick(Sender: TObject);
begin
   if MessageDlg('¡Esto quitará TODOS LOS CÓDIGOS DE ACTIVACIÓN de la solicitud actual!', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
   begin
      //MRegistroCodigos.EmptyTable;
      ShowErrorMessage('Se ha vaciado la tabla');
   end;
end;

procedure TWizardConnectDB.BtnTestConnectionClick(Sender: TObject);
begin
   if CheckDatabaseValues then begin
      SetValuesToConfiguration;
      if CheckBoxCreateNew.Checked then begin
         CheckConnection('master'); { This is for Connect correctly }
         { The database shall not exists }
         if not CheckDatabaseExistency(FConfiguration.DBConfig.DataBase) then begin
            ShowErrorMessage('Database '''+FConfiguration.DBConfig.DataBase+''' already exists.');
            OKDatabase := 1;
         end;
      end
      else begin
         CheckConnection(FConfiguration.DBConfig.DataBase);
         { Database shall exists }
         if CheckDatabaseExistency(FConfiguration.DBConfig.DataBase) then begin
            ShowErrorMessage('Database '''+FConfiguration.DBConfig.DataBase+''' does not exists.');
            OKDatabase := 1;
         end;

         if not CheckConnection(FConfiguration.DBConfig.DataBase) then begin

         end;
         
         if CheckDatabaseVersion then begin
            { The database shall exists }
            OKDatabase := 1;
         end;
      end;
   end
   else OKDatabase := -1;
end;

function TWizardConnectDB.CheckDatabaseVersion: Boolean;
var Q      :TSQLQuery;
    Exists :Boolean;
begin
   Q := FDummyDB.CreateQuery(['SELECT TOP 1 DB_VERSION ',
                              'FROM   CONTROL          ',
                              'ORDER BY ID_CONTROL     ']);
   try
      Q.Open;
      Result := Q.FieldByName('DB_VERSION').AsString = FConfiguration.DBConfig.DBVersion; 
   finally
      Q.Free;
   end;
end;

function TWizardConnectDB.CheckDatabaseExistency(ADatabase :string): Boolean;
var Q      :TSQLQuery;
begin
   Q := FDummyDB.CreateQuery(['SELECT 1                         ',
                              'FROM INFORMATION_SCHEMA.SCHEMATA ',
                              'WHERE CATALOG_NAME = :prmDatabase']);
   Q.ParamByName('prmDatabase').AsString := ADatabase;
   try
      Q.Open;
      Result := Q.RowsAffected > 0;
   finally
      Q.Free;
   end;
end;

function TWizardConnectDB.CheckConnection(ADatabase :string):Boolean;
begin
   FDummyDB.Close;
   FDummyDB.Params.Values['HostName'   ] := FConfiguration.DBConfig.HostName;
   FDummyDB.Params.Values['DataBase'   ] := ADatabase;
   FDummyDB.Params.Values['User_Name'  ] := FConfiguration.DBConfig.User_Name;
   FDummyDB.Params.Values['Password'   ] := FConfiguration.DBConfig.Password;
   try FDummyDB.Open;
       Result := True;
       OKDatabase := 1;
   except
       on E: Exception do begin
         ShowErrorMessage(E.Message);
         Result := False;
         OKDatabase := -1;
       end;
   end;
end;

function TWizardConnectDB.CheckDatabaseValues:Boolean;
begin
   if Trim(EditHostName.Text    ) = '' then begin
      ShowErrorMessage('Host Name cannot be empty.');
      EditHostName.SetFocus;
      Result := False;
   end else
   if Trim(EditDatabaseName.Text) = '' then begin
      ShowErrorMessage('Database Name cannot be empty.');
      EditDatabaseName.SetFocus;
      Result := False;
   end else
   if Trim(EditUserName.Text    ) = '' then begin
      ShowErrorMessage('User Name cannot be empty.');
      EditUserName.SetFocus;
      Result := False;
   end else
   if Trim(EditPassword.Text    ) = '' then begin
      ShowErrorMessage('Password cannot be empty.');
      EditPassword.SetFocus;
      Result := False;
   end else
   if Trim(EditPassword.Text) <> (EditRetypePassword.Text) then begin
      ShowErrorMessage('You need to type the same password twice.');
      EditPassword.SetFocus;
      Result := False;
   end
   else Result := True;
end;

procedure TWizardConnectDB.SetValuesToConfiguration;
begin
   FConfiguration.DBConfig.HostName  := Trim(EditHostName.Text    );
   FConfiguration.DBConfig.Database  := Trim(EditDatabaseName.Text);
   FConfiguration.DBConfig.User_Name := Trim(EditUserName.Text    );
   FConfiguration.DBConfig.Password  := Trim(EditPassword.Text    );
end;

procedure TWizardConnectDB.CreateDatabase;
var DB :TCRSQLConnection;
begin
   DB := TCRSQLConnection.Create(Self);

   DB.ConnectionName := 'SQLServerConnection';
   DB.DriverName     := 'SQLServer';
   DB.GetDriverFunc  := 'getSQLDriverSQLServer';
   DB.LibraryName    := 'dbexpsda.dll';
   DB.LoginPrompt    := False;
   DB.KeepConnection := True;
   DB.VendorLib      := 'sqloledb.dll';
   DB.Params.Values['DriverName' ] := 'SQLServer';
   DB.Params.Values['BlobSize'   ] := '-1'  ;
   DB.Params.Values['EnableBCD'  ] := 'True';
   DB.Params.Values['LongStrings'] := 'True';
   DB.Params.Values['FetchAll'   ] := 'True';

   DB.Params.Values['HostName' ] := FConfiguration.DBConfig.HostName;
   DB.Params.Values['DataBase' ] := 'master';
   DB.Params.Values['User_Name'] := FConfiguration.DBConfig.User_Name;
   DB.Params.Values['Password' ] := FConfiguration.DBConfig.Password;
   try
     DB.Open;
     try
        DB.ExecuteDirect('CREATE DATABASE '+FConfiguration.DBConfig.DataBase);
        (*,
                             '    ON (NAME     = '''+FConfiguration.DBConfig.DataBase+'_DB'',           ',
                             '        FILENAME = ''D:\'+FConfiguration.DBConfig.DataBase+'_DB.mdf'',    ',
                             '        SIZE     = 30  ,                                                  ',
                             '        FILEGROWTH = 5MB)                                                 ',
                             'LOG ON (NAME     = ''LOG'+FConfiguration.DBConfig.DataBase+'_LOG'',       ',
                             '        FILENAME = ''d:\LOG'+FConfiguration.DBConfig.DataBase+'_LOG.ldf'', ',
                             '        SIZE     =  1,                                                     ',
                             '        FILEGROWTH = 5MB  )                                                ']);
                             *)
     except
        on E: Exception do begin
           ShowErrorMessage(E.Message);
        end;
     end;
   finally
      DB.Free;
      DB := nil;
   end;

   { We create newly the database, now connecting with the recencly created database }


   DB := TCRSQLConnection.Create(Self);

   DB.ConnectionName := 'SQLServerConnection';
   DB.DriverName     := 'SQLServer';
   DB.GetDriverFunc  := 'getSQLDriverSQLServer';
   DB.LibraryName    := 'dbexpsda.dll';
   DB.LoginPrompt    := False;
   DB.KeepConnection := True;
   DB.VendorLib      := 'sqloledb.dll';
   DB.Params.Values['DriverName' ] := 'SQLServer';
   DB.Params.Values['BlobSize'   ] := '-1'  ;
   DB.Params.Values['EnableBCD'  ] := 'True';
   DB.Params.Values['LongStrings'] := 'True';
   DB.Params.Values['FetchAll'   ] := 'True';

   DB.Params.Values['HostName' ] := FConfiguration.DBConfig.HostName;
   DB.Params.Values['DataBase' ] := FConfiguration.DBConfig.DataBase;
   DB.Params.Values['User_Name'] := FConfiguration.DBConfig.User_Name;
   DB.Params.Values['Password' ] := FConfiguration.DBConfig.Password;
   DB.Open;
   try
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE APPLICATIONS(                                          '+
        '    APPLICATION    char(15)    NOT NULL,                            '+
        '    DB_VERSION     char(5)     NOT NULL,                            '+
        '    CONSTRAINT PK_APPLICATIONS PRIMARY KEY CLUSTERED (APPLICATION)  '+
        ')                                                                   ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE ENTERPRISES(                                           '+
        '    CD_ENTERPRISE    char(12)       NOT NULL,                       '+
        '    DS_ENTERPRISE    varchar(80)    NOT NULL,                       '+
        '    CLOSED           char(1)        NOT NULL,                       '+
        '    BLOCKED          char(1)        NOT NULL,                       '+
        '    CONSTRAINT PK_ENTERPRISES PRIMARY KEY CLUSTERED (CD_ENTERPRISE) '+
        ')                                                                   ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE SECTIONS(                                                       '+
        '    APPLICATION    char(15)       NOT NULL,                                  '+
        '    CD_SECTION     char(15)       NOT NULL,                                  '+
        '    DS_SECTION     varchar(25)    NULL,                                      '+
        '    CONSTRAINT PK_SECTIONS PRIMARY KEY CLUSTERED (CD_SECTION, APPLICATION),  '+
        '    CONSTRAINT RefAPPLICATIONS35 FOREIGN KEY (APPLICATION)                   '+
        '    REFERENCES APPLICATIONS(APPLICATION)                                     '+
        ')                                                                            ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE MODULES(                                               '+
        '    APPLICATION       char(15)       NOT NULL,                      '+
        '    CD_SECTION        char(15)       NOT NULL,                      '+
        '    CD_MODULE         char(50)       NOT NULL,                      '+
        '    DS_MODULE         varchar(80)    NOT NULL,                      '+
        '    HELP_PAGE_LINK    char(80)       NOT NULL,                      '+
        '    CONSTRAINT PK_MODULES PRIMARY                                   '+
        '             KEY CLUSTERED (CD_MODULE, CD_SECTION, APPLICATION),    '+
        '    CONSTRAINT RefSECTIONS34 FOREIGN KEY (CD_SECTION, APPLICATION)  '+
        '    REFERENCES SECTIONS(CD_SECTION, APPLICATION)                    '+
        ')                                                                   ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE USERS(                                     '+
        '    CD_USER         char(12)       NOT NULL,            '+
        '    DS_USER         varchar(80)    NULL,                '+
        '    PASSWORD        varchar(40)    NOT NULL,            '+
        '    ADMINISTRATOR   char(1)        NOT NULL,            '+
        '    CONSTRAINT PK_USERS PRIMARY KEY CLUSTERED (CD_USER) '+
        ')                                                       ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE MODULES_ALLOW(                                                           '+
        '    APPLICATION      char(15)    NOT NULL,                                            '+
        '    CD_SECTION       char(15)    NOT NULL,                                            '+
        '    CD_MODULE        char(50)    NOT NULL,                                            '+
        '    CD_ENTERPRISE    char(12)    NOT NULL,                                            '+
        '    CD_USER          char(12)    NOT NULL,                                            '+
        '    ALLOW_SEE        char(1)     NOT NULL,                                            '+
        '    ALLOW_ACCESS     char(1)     NOT NULL,                                            '+
        '    CONSTRAINT PK_MODULES_ALLOW PRIMARY                                               '+
        '       KEY NONCLUSTERED (CD_ENTERPRISE, CD_USER, APPLICATION, CD_SECTION, CD_MODULE), '+
        '    CONSTRAINT RefMODULES36 FOREIGN KEY (CD_MODULE, CD_SECTION, APPLICATION)          '+
        '    REFERENCES MODULES(CD_MODULE, CD_SECTION, APPLICATION),                           '+
        '    CONSTRAINT RefENTERPRISES37 FOREIGN KEY (CD_ENTERPRISE)                           '+
        '    REFERENCES ENTERPRISES(CD_ENTERPRISE),                                            '+
        '    CONSTRAINT RefUSERS38 FOREIGN KEY (CD_USER)                                       '+
        '    REFERENCES USERS(CD_USER)                                                         '+
        ')                                                                                     ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE PROFILES(                                                          '+
        '    APPLICATION     char(15)    NOT NULL,                                       '+
        '    CD_SECTION      char(15)    NOT NULL,                                       '+
        '    CD_MODULE       char(50)    NOT NULL,                                       '+
        '    CD_PROFILE      char(15)    NOT NULL,                                       '+
        '    DS_PROFILE      char(80)    NULL,                                           '+
        '    ALLOW_ADD       char(1)     NOT NULL,                                       '+
        '    ALLOW_MODIFY    char(1)     NOT NULL,                                       '+
        '    ALLOW_DELETE    char(1)     NOT NULL,                                       '+
        '    ALLOW_REPORT    char(1)     NOT NULL,                                       '+
        '    ALLOW_EXEC      char(1)     NOT NULL,                                       '+
        '    CONSTRAINT PK_PROFILES PRIMARY                                              '+
        '            KEY CLUSTERED (CD_PROFILE, CD_MODULE, CD_SECTION, APPLICATION),     '+
        '    CONSTRAINT RefMODULES30 FOREIGN KEY (CD_MODULE, CD_SECTION, APPLICATION)    '+
        '    REFERENCES MODULES(CD_MODULE, CD_SECTION, APPLICATION)                      '+
        ')                                                                               ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE SECTIONS_ALLOW(                                                    '+
        '    APPLICATION      char(15)    NOT NULL,                                      '+
        '    CD_SECTION       char(15)    NOT NULL,                                      '+
        '    CD_ENTERPRISE    char(12)    NOT NULL,                                      '+
        '    CD_USER          char(12)    NOT NULL,                                      '+
        '    ALLOW_SEE        char(1)     NOT NULL,                                      '+
        '    ALLOW_ACCESS     char(1)     NOT NULL,                                      '+
        '    CONSTRAINT PK_SECTIONS_ALLOW PRIMARY                                        '+
        '          KEY NONCLUSTERED (APPLICATION, CD_SECTION, CD_ENTERPRISE, CD_USER),   '+
        '    CONSTRAINT RefSECTIONS39 FOREIGN KEY (CD_SECTION, APPLICATION)              '+
        '    REFERENCES SECTIONS(CD_SECTION, APPLICATION),                               '+
        '    CONSTRAINT RefENTERPRISES40 FOREIGN KEY (CD_ENTERPRISE)                     '+
        '    REFERENCES ENTERPRISES(CD_ENTERPRISE),                                      '+
        '    CONSTRAINT RefUSERS41 FOREIGN KEY (CD_USER)                                 '+
        '    REFERENCES USERS(CD_USER)                                                   '+
        ')                                                                               ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE TABLE USER_PROFILES(                                                          '+
        '    CD_USER          char(12)    NOT NULL,                                           '+
        '    CD_ENTERPRISE    char(12)    NOT NULL,                                           '+
        '    APPLICATION      char(15)    NOT NULL,                                           '+
        '    CD_SECTION       char(15)    NOT NULL,                                           '+
        '    CD_MODULE        char(50)    NOT NULL,                                           '+
        '    ALLOW_ADD        char(1)     NOT NULL,                                           '+
        '    ALLOW_MODIFY     char(1)     NOT NULL,                                           '+
        '    ALLOW_DELETE     char(1)     NOT NULL,                                           '+
        '    ALLOW_REPORT     char(1)     NOT NULL,                                           '+
        '    ALLOW_EXEC       char(1)     NOT NULL,                                           '+
        '    CONSTRAINT PK_USER_PROFILES PRIMARY                                              '+
        '         KEY CLUSTERED (CD_MODULE, CD_USER, CD_ENTERPRISE, CD_SECTION, APPLICATION), '+
        '    CONSTRAINT RefMODULES31 FOREIGN KEY (CD_MODULE, CD_SECTION, APPLICATION)         '+
        '    REFERENCES MODULES(CD_MODULE, CD_SECTION, APPLICATION),                          '+
        '    CONSTRAINT RefUSERS32 FOREIGN KEY (CD_USER)                                      '+
        '    REFERENCES USERS(CD_USER),                                                       '+
        '    CONSTRAINT RefENTERPRISES33 FOREIGN KEY (CD_ENTERPRISE)                          '+
        '    REFERENCES ENTERPRISES(CD_ENTERPRISE)                                            '+
        ')                                                                                    ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE INDEX AK_ENTERPRISES_DS_ENTERPRISE ON ENTERPRISES(DS_ENTERPRISE)   ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'CREATE INDEX AK_USERS_DS_USER ON USERS(DS_USER)  ');
     {***********************************************************************************}
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO APPLICATIONS (APPLICATION,      '+
        '                          DB_VERSION )      '+
        '            VALUES       (''ACCOUNTING'',   '+
        '                          ''00.01'')        ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO USERS (CD_USER       ,                               '+
        '                   DS_USER       ,                               '+
        '                   PASSWORD      ,                               '+
        '                   ADMINISTRATOR )                               '+
        '            VALUES(''ADMIN''                                   , '+
        '                   ''Administrator''                           , '+
        '                   ''dba09fef2390af4ea7503ee5ff7c60d65900437f'', '+  //sencille
        '                   ''Y''                                       ) ');
     {***********************************************************************************}
     {***********************************************************************************}
     DB.ExecuteDirect(                       
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Maestros'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''TiposDiario'',  ''Tipos de Diario'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''FormasPago'',  ''Formas de Pago'' , ''NULL'' );    ');

//     DB.ExecuteDirect(
//        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
//        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Usuarios'',  ''Usuarios'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Comerciales'',  ''Comerciales'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Conceptos'',  ''Conceptos'', ''NULL'');            ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Provincias'',  ''Provincias'', ''NULL'');          ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Paises'',  ''Paises'', ''NULL'');                 ');

//     DB.ExecuteDirect(
//        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
//        '            VALUES  (''ACCOUNTING'', ''MAESTROS'', ''Salir'',  ''Salir'', ''NULL'');                    ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''Plan Contable'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''Titulos'',  ''Títulos'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''Grupos'',  ''Grupos'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''Cuentas'',  ''Cuentas'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''SubCuentas'',  ''Subcuentas'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANCONTABLE'', ''Impr_PlanContab'',  ''Impresión Plan Contable'', ''NULL''); ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Plan Analítica'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Delegaciones'',  ''Delegaciones'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Departamentos'',  ''Departamentos'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Secciones'',  ''Secciones'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Proyectos'',  ''Proyectos'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''PLANANALITICA'', ''Impr_PlanAnalit'',  ''Impresión Plan Analítica'', ''NULL'');  ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''Asistentes Asientos'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''CargaRapidaAsientos'',  ''Carga rápida de asientos'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''FacturasVenta'',  ''Facturas de Venta'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''FacturasCompra'',  ''Facturas de Compra'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''CargaSimplificada'',  ''CargaSimplificada'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''Nominas'',  ''Nominas'', ''NULL'');  ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''ASISTENTES'', ''ConbrosPagos'',  ''Cobros / Pagos'', ''NULL'');  ');

     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''Diario'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''ListadoAsientos'',  ''Listado de Asientos'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''Mayor'',  ''Mayor'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''RecalculoSaldos'',  ''Recálculo de Saldos'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''BorradoGeneralAsientos'',  ''Borrado General de Asientos'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''TraspasoApuntesEntreSubcuentas'',  ''Traspaso de Apuntes entre Subcuentas'', ''NULL'');  ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''CopiaAsientosEntreEmpresas'',  ''Copia de Asientos entre Empresas'', ''NULL'');  ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''DIARIO'', ''PunteoAutomaticoAsientos'',  ''Punteo Automático de Asientos'', ''NULL'');  ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''Balances'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''SUMASYSALDOS'',  ''Sumas y Saldos'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''Situacion'',  ''Situación'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''PerdidasYGanancias'',  ''Perdidas y Ganancias'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''Acumulados'',  ''Acumulados'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''BALANCES'', ''Explotacion'',  ''Explotación'', ''NULL'');  ');
     {***********************************************************************************}
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''IVA'', ''I.V.A.'');           ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IVA'', ''Modelo300'',  ''Modelo (300)'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IVA'', ''LibroFacturasEmitidas'',  ''Libro de Facturas Emitidas'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IVA'', ''LibroFacturasRecibidas'',  ''Libro de Facturas Recibidas'', ''NULL'');              ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''IVA'', ''LibroFacturasBienesInversion'',  ''Libro de Facturas Bienes de Inversión'', ''NULL'');     ');

     {***********************************************************************************}
     
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''Impuestos'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''OperacionesTerceros347'',  ''Operaciones con Terceros (347)'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''OperacionesCEE'',  ''Operaciones con la CEE (349, 216)'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''IRPF110'',  ''I.R.P.F. (110)'', ''NULL''); ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''IRPF115'',  ''I.R.P.F. (115)'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''IMPUESTOS'', ''ImpuestoSociedades202'',  ''Impuesto de Sociedades (202)'', ''NULL'');  ');

     {***********************************************************************************}
     
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''GESTION'', ''Gestion'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''GESTION'', ''CarteraEfectos'',  ''Operaciones con Terceros (347)'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''GESTION'', ''Amortizaciones'',  ''Operaciones con la CEE (349, 216)'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''GESTION'', ''CierreEjercicio'',  ''I.R.P.F. (110)'', ''NULL''); ');  {Proceso Automatizado}

     {***********************************************************************************}
     
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''Herramientas'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''ControlEmpresas'',  ''Control de Empresas'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''EnlaceContable'',  ''EnlaceContable'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''ParametrosGenerales'',  ''Parámetros Generales'', ''NULL''); ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''ParametrosFacturacion'',  ''Parámetros de Facturación'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''Importacion'',  ''Importación'', ''NULL'');  ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )  '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''TraspasoDatos'',  ''Traspaso de Datos'', ''NULL'');     ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''HERRAMIENTAS'', ''ActualizacionDB'',  ''Actualización de la Base de Datos'', ''NULL'');  ');

     {***********************************************************************************}
     
     DB.ExecuteDirect(
        'INSERT INTO SECTIONS(APPLICATION   , CD_SECTION  , DS_SECTION  )     '+
        '            VALUES  (''ACCOUNTING'', ''AYUDA'', ''Ayuda'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''AYUDA'', ''Contabilidad'',  ''Ayuda de Contabilidad'', ''NULL'');    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''AYUDA'', ''ConectarseA'',  ''Conectarse a la Web'' , ''NULL'' );    ');

     DB.ExecuteDirect(
        'INSERT INTO MODULES(APPLICATION   , CD_SECTION  , CD_MODULE, DS_MODULE, HELP_PAGE_LINK  )     '+
        '            VALUES  (''ACCOUNTING'', ''AYUDA'', ''AcercaDe'',  ''Acerca de...'', ''NULL''); ');  {Proceso Automatizado}
   finally
      DB.Free;
      DB := nil;
   end;
end;

procedure TWizardConnectDB.CreateINIFile;
begin
   //
end;

procedure TWizardConnectDB.SetOKCodigos(Value: Integer);
begin
   if (Value <> FOKCodigos) and (Value > -2) and (Value < 2) then begin
      FOKCodigos := Value;
      SetOKImages;
   end;
end;

procedure TWizardConnectDB.SetOKDatabase(Value: Integer);
begin
   if (Value <> FOKDatabase) and (Value > -2) and (Value < 2) then begin
      FOKDatabase := Value;
      SetOKImages;
   end;
end;

procedure TWizardConnectDB.SetOKPartidas(Value: Integer);
begin
   if (Value <> FOKPartidas) and (Value > -2) and (Value < 2) then begin
      FOKPartidas := Value;
      SetOKImages;
   end;
end;

procedure TWizardConnectDB.SetOKSeleccion(Value: Integer);
begin
   if (Value <> FOKSeleccion) and (Value > -2) and (Value < 2) then begin
      FOKSeleccion := Value;
      SetOKImages;
   end;
end;

procedure TWizardConnectDB.SetResumen(Value: Integer);
begin
   if (Value <> FOKResumen) and (Value > -2) and (Value < 2) then begin
      FOKResumen := Value;
      SetOKImages;
   end;
end;

procedure TWizardConnectDB.SetOKImages;
begin
   ImageListCaptions.Assign(nil);
   case FOKDatabase of
      -1:ImageListCaptions.AddImage(ImageList, 0);
       0:ImageListCaptions.AddImage(ImageList, 1);
       1:ImageListCaptions.AddImage(ImageList, 2);
   end;

   case FOKSeleccion of
      -1:ImageListCaptions.AddImage(ImageList, 0);
       0:ImageListCaptions.AddImage(ImageList, 1);
       1:ImageListCaptions.AddImage(ImageList, 2);
   end;

   case FOKPartidas of
      -1:ImageListCaptions.AddImage(ImageList, 0);
       0:ImageListCaptions.AddImage(ImageList, 1);
       1:ImageListCaptions.AddImage(ImageList, 2);
   end;

   case FOKCodigos of
      -1:ImageListCaptions.AddImage(ImageList, 0);
       0:ImageListCaptions.AddImage(ImageList, 1);
       1:ImageListCaptions.AddImage(ImageList, 2);
   end;

   case FOKResumen of
      -1:ImageListCaptions.AddImage(ImageList, 0);
       0:ImageListCaptions.AddImage(ImageList, 1);
       1:ImageListCaptions.AddImage(ImageList, 2);
   end;
end;



end.



