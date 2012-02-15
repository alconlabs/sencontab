unit WizardGestEnterprises;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Grids,
  DBGrids, Mask, Gauges, DBXpress, SqlExpr, ConfigurationClass,
  CRSQLConnection, ImgList, D6OnHelpFix, jpeg, CheckLst,
  DBController;

type
  TButtonState   = (bsNext, bsNextBack, bsEnd);
  TActivePage    = (apNone, apPresentation, apManageOrNew   , apSelectEnterprise, apCreateDB,
                    apInsertData  , apInsertExamples, apCopyData, apConsolide, apLinkEnterprise,
                    apResume);

  TFormWizardGestEnterprises = class(TForm)
    PanelBottom: TPanel;
    PageControl: TPageControl;
    TabPresentation: TTabSheet;
    TabManageOrNew: TTabSheet;
    TabAccountPlan: TTabSheet;
    TabEnterpriseData: TTabSheet;
    BtnBack: TButton;
    BtnNext: TButton;
    BtnEnd: TButton;
    BtnCancel: TButton;
    TabResumen: TTabSheet;
    Timer: TTimer;
    OpenFileDialog: TOpenDialog;
    StatusBar: TStatusBar;
    PanelContainer: TPanel;
    PanelPresentation: TPanel;
    Panel8: TPanel;
    ImagePresentation: TImage;
    PanelManageOrNew: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ImageList: TImageList;
    Image01: TImage;
    Image02: TImage;
    Image03: TImage;
    Image04: TImage;
    Image05: TImage;
    Image06: TImage;
    Image07: TImage;
    Image08: TImage;
    Image09: TImage;
    Image10: TImage;
    Image1: TImage;
    BtnHelp: TButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    Panel4: TPanel;
    Image3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    MemoPresentation: TMemo;
    RadioGroupManageOrNew: TRadioGroup;
    CheckListBoxResumen: TCheckListBox;
    GroupBoxName: TGroupBox;
    Label18: TLabel;
    EditDatabaseName: TEdit;
    Label19: TLabel;
    EditUserName: TEdit;
    GroupBoxEnterprise: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    EditHostName: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    EditPassword: TEdit;
    EditRetypePassword: TEdit;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEndClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
  private
     FOKDatabase  :Integer;
     FOKSeleccion :Integer;
     FOKPartidas  :Integer;
     FOKCodigos   :Integer;
     FOKResumen   :Integer;

     FModificando :Boolean;
     FActivePage  :TActivePage;

     FDBController :TDBController;
     //FController   :TEnterprisesController;

     procedure SetOKDatabase (Value :Integer);
     procedure SetOKSeleccion(Value :Integer);
     procedure SetOKPartidas (Value :Integer);
     procedure SetOKCodigos  (Value :Integer);
     procedure SetResumen    (Value :Integer);
     procedure SetOKImages;
     procedure SetActivePage (Value :TActivePage);

     function  CheckDatabaseValues:Boolean;
     procedure SetValuesToConfiguration;
     function  CheckConnection(ADatabase :string):Boolean;
     procedure CreateINIFile;
     procedure ShowErrorMessage(prmErrorMessage :string);
     procedure SetButtonState(prmState :TButtonState);

     function  DBConfigurationValid        :Boolean;
     function  CodigosSolicitadosValidos   :Boolean;
     function  ExisteInformacionDeCodigos  :Boolean;
     function  ExisteInformacionDePartidas :Boolean;
     function  EliminarInformacionPartidas :Boolean;
     procedure CreaInformacionResumen;
     function  PartidaValida(prmCodigoPartida :string):Boolean;
     function  CodigoValido(prmNSerie :string):Boolean;
  public
     property OKDatabase  :Integer       read FOKDatabase  write SetOKDatabase;
     property OKSeleccion :Integer       read FOKSeleccion write SetOKSeleccion;
     property OKPartidas  :Integer       read FOKPartidas  write SetOKPartidas;
     property OKCodigos   :Integer       read FOKCodigos   write SetOKCodigos;
     property OKResumen   :Integer       read FOKResumen   write SetResumen;
     property ActivePage  :TActivePage   read FActivePage  write SetActivePage;
     property DB          :TDBController read FDBController;

     constructor CreateWizard;
     function Execute:Boolean;
     property Modificando :Boolean read FModificando write FModificando;
  end;

implementation

uses General;

{$R *.DFM}

constructor TFormWizardGestEnterprises.CreateWizard;
begin
   Self.Create(Application);

   //FModel := TEnterprisesModel.Create(MainController.DBMain);

   PageControl.Visible := False;
   ActivePage := apPresentation;
   ImageList.GetBitmap(1, Image01.Picture.Bitmap);
   ImageList.GetBitmap(1, Image02.Picture.Bitmap);
   ImageList.GetBitmap(2, Image03.Picture.Bitmap);
   ImageList.GetBitmap(0, Image04.Picture.Bitmap);
   ImageList.GetBitmap(0, Image05.Picture.Bitmap);
   ImageList.GetBitmap(0, Image06.Picture.Bitmap);
   ImageList.GetBitmap(0, Image07.Picture.Bitmap);
   ImageList.GetBitmap(0, Image08.Picture.Bitmap);
   ImageList.GetBitmap(0, Image09.Picture.Bitmap);
   ImageList.GetBitmap(0, Image10.Picture.Bitmap);


   Image01.Hint := 'Presentación';
   Image02.Hint := 'Gestión ó Nueva';
   Image03.Hint := 'Seleccionar Empresa';
   Image04.Hint := 'Crear Base de Datos';
   Image05.Hint := 'Insertar Datos';
   Image06.Hint := 'Insertar Ejemplos';
   Image07.Hint := 'Copiar Datos';
   Image08.Hint := 'Consolidar Empresas';
   Image09.Hint := 'EnlazarEmpresas';
   Image10.Hint := 'Resumen';

   //EditHostName.Text     := FConfiguration.DBConfig.HostName;
   //EditDataBaseName.Text := FConfiguration.DBConfig.Database;
   //EditUserName.Text     := FConfiguration.DBConfig.User_Name;
   
end;

function TFormWizardGestEnterprises.Execute:Boolean;
begin
   Result := ShowModal = mrOK;
end;

procedure TFormWizardGestEnterprises.FormShow(Sender: TObject);
begin
   SetButtonState(bsNext);

end;

procedure TFormWizardGestEnterprises.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := False;
end;

procedure TFormWizardGestEnterprises.SetButtonState(prmState :TButtonState);
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

procedure TFormWizardGestEnterprises.TimerTimer(Sender: TObject);
begin
   StatusBar.Panels[1].Text := '';
   Timer.Enabled := False;
end;

procedure TFormWizardGestEnterprises.ShowErrorMessage(prmErrorMessage :string);
begin
   StatusBar.Font.Style := [fsBold];
   StatusBar.Panels[1].Text := '      '+prmErrorMessage;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
end;

procedure TFormWizardGestEnterprises.FormCreate(Sender: TObject);
begin
   FOKDatabase  := 0;
   FOKSeleccion := 0;
   FOKPartidas  := 0;
   FOKCodigos   := 0;
   FOKResumen   := 0;
end;

function TFormWizardGestEnterprises.DBConfigurationValid:Boolean;
var Resultado :Integer;
begin
   if FModificando then begin
      Result := True;
      Exit;
   end;

   Result := True;
    case Resultado of
      -995 :begin
         ShowErrorMessage('El código de SOLICITUD ya existe en la base de datos.');
         Result := False;
         Exit;
      end;
   end;
end;

function TFormWizardGestEnterprises.CodigosSolicitadosValidos:Boolean;
begin
   Result := True;
   //Result := not MRegistroCodigos.IsEmpty;
end;

function TFormWizardGestEnterprises.ExisteInformacionDeCodigos:Boolean;
begin
   //Result := True;
   //Result := not MRegistroCodigos.IsEmpty;
end;

function TFormWizardGestEnterprises.ExisteInformacionDePartidas:Boolean;
begin
   Result := True;
   //Result := not MRegistroPartidas.IsEmpty;
end;

function TFormWizardGestEnterprises.EliminarInformacionPartidas:Boolean;
begin
   if MessageDlg('Perderá la Información de las Partidas Solicitadas ¿Seguro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      //MRegistroPartidas.EmptyTable;
      Result := True;
   end
   else Result := False;
end;

procedure TFormWizardGestEnterprises.CreaInformacionResumen;
var Partidas  :Integer;
    Activos   :Integer;
    Inactivos :Integer;
    Libres    :Integer;
    EnUso     :Integer;
    Renovados :Integer;
begin
   { Ponemos visibles lo componentes }
end;

procedure TFormWizardGestEnterprises.BtnNextClick(Sender: TObject);
begin
   case ActivePage of
      apPresentation     :begin
        ActivePage := apManageOrNew;
      end;
      apManageOrNew      :begin
        ActivePage := apSelectEnterprise;
      end;
      apSelectEnterprise :begin
        ActivePage := apCreateDB; 
      end;
      apCreateDB         :begin
        ActivePage := apInsertData;
      end;
      apInsertData       :begin
        ActivePage := apInsertExamples;
      end;
      apInsertExamples   :begin
        ActivePage := apCopyData;
      end;
      apCopyData         :begin
        ActivePage := apConsolide;
      end;
      apConsolide        :begin
        ActivePage := apLinkEnterprise;
      end;
      apLinkEnterprise   :begin
        ActivePage := apResume;
      end;
      apResume           :begin
        //ActivePage := apResume;
      end;
   end;

   Exit;


   //if PageControl.ActivePage = TabSeleccionaTipo then begin
   //   case RadioGroupTipoSolicitud.ItemIndex of
   //      0 :begin {Partidas}
   //         if ExisteInformacionDeCodigos then begin
   //            
   //         end;
   //         TabPartidas.Show;
   //         EditCodigoPartida.SetFocus;
   //      end;
   //      1 :begin { Códigos }
   //         if ExisteInformacionDePartidas then begin
   //            if not EliminarInformacionPartidas then begin
   //               TabSeleccionaTipo.Show;
   //               Exit;
   //            end;
   //         end;
   //         TabCodigos.Show;
   //      end;
   //   end;
   //   SetButtonState(bsNextBack);
   //end else
   if PageControl.ActivePage = TabAccountPlan then begin
      //if (Self.ActiveControl = EditCodigoPartida) and
      //   (Trim(EditCodigoPartida.Text) <> '' ) then
      //begin
      //   BtnInsertarPartida.Click;
      //end else
   end else
   if PageControl.ActivePage = TabEnterpriseData then begin
      //if (Self.ActiveControl = EditNSerie) and
      //   (Trim(EditNSerie.Text) <> '' ) then
      //begin
      //   BtnInsertaCodigo.Click;
      //end else
      //if CodigosSolicitadosValidos then begin
      //   CreaInformacionResumen;
      //   TabResumen.Show;
      //   SetButtonState(bsEnd);
      //end
      //else begin
      //   ShowErrorMessage('Los datos de los códigos solicitados no son válidos.');
      //end;
   end;
end;

procedure TFormWizardGestEnterprises.BtnBackClick(Sender: TObject);
begin
   if PageControl.ActivePage = TabResumen then begin
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabAccountPlan then begin
      //TabSeleccionaTipo.Show;
      SetButtonState(bsNextBack);
   end else
   if PageControl.ActivePage = TabEnterpriseData then begin
      //TabSeleccionaTipo.Show;
      SetButtonState(bsNextBack);
   end
   //else
   //if PageControl.ActivePage = TabSeleccionaTipo then begin
   //   TabDatabase.Show;
   //   SetButtonState(bsNext);
   //end;
end;

procedure TFormWizardGestEnterprises.BtnCancelClick(Sender: TObject);
begin
   if MessageDlg('¿Seguro que desea cancelar la solicitud?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      //EliminarDatosDeMemoria;
      ModalResult := mrCancel;
   end;
end;

procedure TFormWizardGestEnterprises.BtnEndClick(Sender: TObject);
var Correctos :Integer;
begin
   if MessageDlg('Se creará la base de datos de la empresa tal.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
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

function TFormWizardGestEnterprises.PartidaValida(prmCodigoPartida :string):Boolean;
var CodigoValidez :Integer;
begin
   Result := True; {Valor por defecto}

   {RFU.01a}
   if prmCodigoPartida = '' then begin
      ShowErrorMessage('Debe indicar un código de partida');
      //EditCodigoPartida.SetFocus;
      Result := False;
      Exit;
   end;

   {RFU.01b}
   if Length(prmCodigoPartida) > 10 then begin
      ShowErrorMessage('El "Código de Partida" debe tener como máximo 10 caracteres de longitud');
      //EditCodigoPartida.SetFocus;
      Result := False;
      Exit;
   end;
end;

function TFormWizardGestEnterprises.CodigoValido(prmNSerie :string):Boolean;
begin
   Result := True;
   if prmNSerie = '' then begin
      ShowErrorMessage('Debe indicar un código válido');
      //EditNSerie.SetFocus;
      Result := False;
      Exit;
   end else
   if Length(prmNSerie) > 20 then begin
      ShowErrorMessage('La código no debe superar los 20 caracteres de longitud.');
      //EditNSerie.SetFocus;
      Result := False;
      Exit;
   end;
end;

function TFormWizardGestEnterprises.CheckConnection(ADatabase :string):Boolean;
begin

end;

function TFormWizardGestEnterprises.CheckDatabaseValues:Boolean;
begin
   //if Trim(EditHostName.Text    ) = '' then begin
   //   ShowErrorMessage('Host Name cannot be empty.');
   //   EditHostName.SetFocus;
   //   Result := False;
   //end else
   //if Trim(EditDatabaseName.Text) = '' then begin
   //   ShowErrorMessage('Database Name cannot be empty.');
   //   EditDatabaseName.SetFocus;
   //   Result := False;
   //end else
   //if Trim(EditUserName.Text    ) = '' then begin
   //   ShowErrorMessage('User Name cannot be empty.');
   //   EditUserName.SetFocus;
   //   Result := False;
   //end else
   //if Trim(EditPassword.Text    ) = '' then begin
   //   ShowErrorMessage('Password cannot be empty.');
   //   EditPassword.SetFocus;
   //   Result := False;
   //end else
   //if Trim(EditPassword.Text) <> (EditRetypePassword.Text) then begin
   //   ShowErrorMessage('You need to type the same password twice.');
   //   EditPassword.SetFocus;
   //   Result := False;
   //end
   //else Result := True;
end;

procedure TFormWizardGestEnterprises.SetValuesToConfiguration;
begin
   //FConfiguration.DBConfig.HostName  := Trim(EditHostName.Text    );
   //FConfiguration.DBConfig.Database  := Trim(EditDatabaseName.Text);
   //FConfiguration.DBConfig.User_Name := Trim(EditUserName.Text    );
   //FConfiguration.DBConfig.Password  := Trim(EditPassword.Text    );
end;

procedure TFormWizardGestEnterprises.CreateINIFile;
begin
   //
end;

procedure TFormWizardGestEnterprises.SetOKCodigos(Value: Integer);
begin
   if (Value <> FOKCodigos) and (Value > -2) and (Value < 2) then begin
      FOKCodigos := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetOKDatabase(Value: Integer);
begin
   if (Value <> FOKDatabase) and (Value > -2) and (Value < 2) then begin
      FOKDatabase := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetOKPartidas(Value: Integer);
begin
   if (Value <> FOKPartidas) and (Value > -2) and (Value < 2) then begin
      FOKPartidas := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetOKSeleccion(Value: Integer);
begin
   if (Value <> FOKSeleccion) and (Value > -2) and (Value < 2) then begin
      FOKSeleccion := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetResumen(Value: Integer);
begin
   if (Value <> FOKResumen) and (Value > -2) and (Value < 2) then begin
      FOKResumen := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetOKImages;
begin
   //ImageListCaptions.Assign(nil);
   //case FOKDatabase of
   //   -1:ImageListCaptions.AddImage(ImageList, 0);
   //    0:ImageListCaptions.AddImage(ImageList, 1);
   //    1:ImageListCaptions.AddImage(ImageList, 2);
   //end;
   //
   //case FOKSeleccion of
   //   -1:ImageListCaptions.AddImage(ImageList, 0);
   //    0:ImageListCaptions.AddImage(ImageList, 1);
   //    1:ImageListCaptions.AddImage(ImageList, 2);
   //end;
   //
   //case FOKPartidas of
   //   -1:ImageListCaptions.AddImage(ImageList, 0);
   //    0:ImageListCaptions.AddImage(ImageList, 1);
   //    1:ImageListCaptions.AddImage(ImageList, 2);
   //end;
   //
   //case FOKCodigos of
   //   -1:ImageListCaptions.AddImage(ImageList, 0);
   //    0:ImageListCaptions.AddImage(ImageList, 1);
   //    1:ImageListCaptions.AddImage(ImageList, 2);
   //end;
   //
   //case FOKResumen of
   //   -1:ImageListCaptions.AddImage(ImageList, 0);
   //    0:ImageListCaptions.AddImage(ImageList, 1);
   //    1:ImageListCaptions.AddImage(ImageList, 2);
   //end;
end;



procedure TFormWizardGestEnterprises.SetActivePage(Value :TActivePage);
begin
   if FActivePage <> Value then begin
      FActivePage := Value;
      {ShowTheNewPage;}
      case ActivePage of
         apPresentation     :begin
           PanelPresentation.Parent  := PanelContainer;
           PanelPresentation.Visible := True;
         end;
         apManageOrNew      :begin
           PanelManageOrNew.Parent  := PanelContainer;
           PanelManageOrNew.Visible := True;
         end;
         apSelectEnterprise :begin
         end;
         apCreateDB         :begin
         end;
         apInsertData       :begin
         end;
         apInsertExamples   :begin
         end;
         apCopyData         :begin
         end;
         apConsolide        :begin
         end;
         apLinkEnterprise   :begin
         end;
         apResume           :begin

         end;
      end;
      {ChangeDisplayActivePage;}

      {ConfigureButtons;}
   end;

end;

end.



