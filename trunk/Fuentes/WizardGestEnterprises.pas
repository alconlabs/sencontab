unit WizardGestEnterprises;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Grids,
  DBGrids, Mask, Gauges, DBXpress, SqlExpr, ConfigurationClass,
  CRSQLConnection, ImgList, jpeg, CheckLst,
  DBController, CustomView;

type
  TButtonState   = (bsNext, bsNextBack, bsEnd);
  TActivePage    = (apNone, apPresentation, apManageOrNew, apSelectEnterprise, apCreateDB,
                    apInsertData, apInsertExamples, apCopyData, apConsolide, apLinkEnterprise,
                    apResume);

  TFormWizardGestEnterprises = class(TCustomView)
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
    procedure FormShow(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEndClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
     FOKPresentation :Integer;
     FOKSeleccion :Integer;
     FOKPartidas  :Integer;
     FOKCodigos   :Integer;
     FOKResumen   :Integer;

     FActivePage  :TActivePage;

     procedure SetOKPresentation(Value :Integer);
     procedure SetOKSeleccion(Value :Integer);
     procedure SetOKPartidas (Value :Integer);
     procedure SetOKCodigos  (Value :Integer);
     procedure SetResumen    (Value :Integer);
     procedure SetOKImages;

     function  BeforeNext(Value :TActivePage):Boolean;
     procedure SetActivePage(Value :TActivePage);
     function  BeforeBack(Value :TActivePage):Boolean;


     procedure ShowErrorMessage(prmErrorMessage :string);
     procedure SetButtonState(prmState :TButtonState);

     function  DBConfigurationValid        :Boolean;

     function  ExisteInformacionDeCodigos  :Boolean;
     function  ExisteInformacionDePartidas :Boolean;
     function  EliminarInformacionPartidas :Boolean;
     procedure CreaInformacionResumen;
     function  PartidaValida(prmCodigoPartida :string):Boolean;
  public
     property OKPresentation :Integer     read FOKPresentation write SetOKPresentation;
     property OKSeleccion    :Integer     read FOKSeleccion    write SetOKSeleccion;
     property OKPartidas     :Integer     read FOKPartidas     write SetOKPartidas;
     property OKCodigos      :Integer     read FOKCodigos      write SetOKCodigos;
     property OKResumen      :Integer     read FOKResumen      write SetResumen;
     property ActivePage     :TActivePage read FActivePage     write SetActivePage;

     //constructor CreateWizard;
     //function Execute:Boolean;
  end;

implementation

uses General;

{$R *.DFM}

//constructor TFormWizardGestEnterprises.CreateWizard;
//begin
//   Self.Create(Application);
//
//end;

//function TFormWizardGestEnterprises.Execute:Boolean;
//begin
//   Result := ShowModal = mrOK;
//end;

procedure TFormWizardGestEnterprises.FormShow(Sender: TObject);
begin
   PageControl.Visible := False;
   ActivePage := apPresentation;
   ImageList.GetBitmap(1, Image01.Picture.Bitmap);
   ImageList.GetBitmap(0, Image02.Picture.Bitmap);
   ImageList.GetBitmap(0, Image03.Picture.Bitmap);
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

   ActivePage := apPresentation;
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
   FOKPresentation  := 0;
   FOKSeleccion := 0;
   FOKPartidas  := 0;
   FOKCodigos   := 0;
   FOKResumen   := 0;
end;

function TFormWizardGestEnterprises.DBConfigurationValid:Boolean;
var Resultado :Integer;
begin
   Result := True;
   case Resultado of
     -995 :begin
        ShowErrorMessage('El código de SOLICITUD ya existe en la base de datos.');
        Result := False;
        Exit;
     end;
   end;
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

function TFormWizardGestEnterprises.BeforeNext(Value: TActivePage):Boolean;
begin
   case Value of
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
end;

procedure TFormWizardGestEnterprises.BtnNextClick(Sender: TObject);
begin
   case ActivePage of
      apPresentation     :begin
        ActivePage := apManageOrNew;
      end;
      apManageOrNew      :begin
        BeforeNext(apManageOrNew);
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

function TFormWizardGestEnterprises.BeforeBack(Value: TActivePage): Boolean;
begin
//
end;

procedure TFormWizardGestEnterprises.BtnBackClick(Sender: TObject);
begin
   case ActivePage of
      apPresentation     :begin
        ActivePage := apManageOrNew;
      end;
      apManageOrNew      :begin
        if BeforeBack(apManageOrNew) then begin
           ActivePage := apSelectEnterprise;
           
        end;
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

(*
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
*)
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

procedure TFormWizardGestEnterprises.SetOKCodigos(Value: Integer);
begin
   if (Value <> FOKCodigos) and (Value > -2) and (Value < 2) then begin
      FOKCodigos := Value;
      SetOKImages;
   end;
end;

procedure TFormWizardGestEnterprises.SetOKPresentation(Value: Integer);
begin
   if (Value <> FOKPresentation) and (Value > -2) and (Value < 2) then begin
      FOKPresentation := Value;
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

procedure TFormWizardGestEnterprises.BtnHelpClick(Sender: TObject);
begin
   Application.HelpContext(Self.HelpContext);
end;

end.



