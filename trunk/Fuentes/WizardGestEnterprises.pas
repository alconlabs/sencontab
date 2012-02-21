unit WizardGestEnterprises;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Grids,
  DBGrids, Mask, Gauges, DBXpress, SqlExpr, ConfigurationClass,
  CRSQLConnection, ImgList, jpeg, CheckLst,
  DBController, CustomView;

  {Todo: Lista de pasos realizados. Servirá para volver atras y para saber lo que se debe hacer al final}

type
  TButtonState   = (bsNext, bsNextBack, bsEnd);
  TActivePage    = (apNone, apPresentation, apManageOrNew, apEnterpriseData, apCreateDB,
                    apInsertData, apInsertExamples, apCopyData, apConsolide, apLinkEnterprise,
                    apResume);

  {Delegates Declarations}
  TCreateDatabaseDelegate = procedure (CD :string; DS :string) of object;


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
    PanelEnterpriseData: TPanel;
    Panel4: TPanel;
    Image3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    MemoPresentation: TMemo;
    RadioGroupManageOrNew: TRadioGroup;
    GroupBoxName: TGroupBox;
    Label18: TLabel;
    EditCD_ENTERPRISE: TEdit;
    Label19: TLabel;
    EditDS_ENTERPRISE: TEdit;
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
    RadioGroup1: TRadioGroup;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    Label13: TLabel;
    Edit5: TEdit;
    PanelResume: TPanel;
    Panel6: TPanel;
    Image4: TImage;
    Label14: TLabel;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    CheckListBoxResumen: TCheckListBox;
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

     FCreateDatabase :TCreateDatabaseDelegate;

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
     function  CDEnterpriseValid(prmCD_Enterprise :string):Boolean;

     function DoCreateDatabase(prmCD_Enterprise, prmDS_Enterprise :string):Boolean; {Returns true if shall continue}

  public
     property TaskCreateDatabase :TCreateDatabaseDelegate read FCreateDatabase write FCreateDatabase;

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
   Image03.Hint := 'Datos de la Nueva Empresa';
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
   RadioGroupManageOrNew.ItemIndex := 0;
   EditCD_Enterprise.CharCase := ecUpperCase;
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
   { Ponemos visibles los componentes }
end;

function TFormWizardGestEnterprises.BeforeNext(Value: TActivePage):Boolean;
begin
   case Value of
      apPresentation     :begin
        ActivePage := apManageOrNew;
      end;
      apManageOrNew      :begin
       case RadioGroupManageOrNew.ItemIndex of
         0:begin
            // Check that the name is not empty
            EditCD_Enterprise.Text := Trim(EditCD_Enterprise.Text);
            EditDS_Enterprise.Text := Trim(EditDS_Enterprise.Text);
            if EditCD_Enterprise.Text = '' then begin
               EditCD_Enterprise.SetFocus;
               EditCD_Enterprise.SelectAll;
               ShowErrorMessage('Debe indicar un codigo para la empresa');
               Result := False;
            end else
            // Check that the database name is correct: length, only letters and numbers, etc.
            if (Length(EditCD_Enterprise.Text) < 3)  or (Length(EditCD_Enterprise.Text) > 12) then begin
               EditCD_Enterprise.SetFocus;
               EditCD_Enterprise.SelectAll;
               ShowErrorMessage('El Código debe tener una lóngitud mínima de 3 carácteres y máxima de 12');
               Result := False;
            end else
            if not CDEnterpriseValid(EditCD_Enterprise.Text) then begin
               EditCD_Enterprise.SetFocus;
               EditCD_Enterprise.SelectAll;
               ShowErrorMessage('El nombre del código se debe componer de letras y números unicamente.');
               Result := False;
            end else
            // Check that the database name doesn't exists.

            // Check that the descriptive name is not empty.
         end;
         1:{Todo: Comprobar que ha seleccionado una empresa correctamente.};
       end;
      end;
      apEnterpriseData :begin
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
        SetButtonState(bsNextBack);
      end;
      apManageOrNew      :begin
        if BeforeNext(apManageOrNew) then begin
           case RadioGroupManageOrNew.ItemIndex of
             0:begin
                ActivePage := apEnterpriseData;
                SetButtonState(bsNextBack);
             end;
             1:begin
                SetButtonState(bsNextBack);
             end;
           end;
        end;
      end;
      apEnterpriseData :begin
        ActivePage := apResume;
        SetButtonState(bsEnd);
      end;
      apCreateDB         :begin
        ActivePage := apInsertData;
        SetButtonState(bsNextBack);
      end;
      apInsertData       :begin
        ActivePage := apInsertExamples;
        SetButtonState(bsNextBack);
      end;
      apInsertExamples   :begin
        ActivePage := apCopyData;
        SetButtonState(bsNextBack);
      end;
      apCopyData         :begin
        ActivePage := apConsolide;
        SetButtonState(bsNextBack);
      end;
      apConsolide        :begin
        ActivePage := apLinkEnterprise;
        SetButtonState(bsNextBack);
      end;
      apLinkEnterprise   :begin
        ActivePage := apResume;
        SetButtonState(bsNextBack);
      end;
      apResume           :begin
        //ActivePage := apResume;
        //SetButtonState(bsEnd);
      end;
   end;
end;

function TFormWizardGestEnterprises.BeforeBack(Value: TActivePage): Boolean;
begin
//
end;

procedure TFormWizardGestEnterprises.BtnBackClick(Sender: TObject);
begin
   case ActivePage of
      apResume           :begin
        ActivePage := apEnterpriseData;
        SetButtonState(bsNextBack);
      end;
      apPresentation     :begin
        //SetButtonState(bsNext);
        //ActivePage := apManageOrNew;
      end;
      apManageOrNew      :begin
        if BeforeBack(apManageOrNew) then begin
           ActivePage := apPresentation;
           SetButtonState(bsNext);
        end;
      end;
      apEnterpriseData :begin
        ActivePage := apManageOrNew;
        SetButtonState(bsNextBack);
      end;
      apCreateDB         :begin
        ActivePage := apInsertData;
        SetButtonState(bsNextBack);
      end;
      apInsertData       :begin
        ActivePage := apInsertExamples;
        SetButtonState(bsNextBack);
      end;
      apInsertExamples   :begin
        ActivePage := apCopyData;
        SetButtonState(bsNextBack);
      end;
      apCopyData         :begin
        ActivePage := apConsolide;
        SetButtonState(bsNextBack);
      end;
      apConsolide        :begin
        ActivePage := apLinkEnterprise;
        SetButtonState(bsNextBack);
      end;
      apLinkEnterprise   :begin
        ActivePage := apResume;
        SetButtonState(bsNextBack);
      end;
   end;
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
var StepsCorrect :Integer;
begin
   if MessageDlg('Se realizarán las tareas programadas.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
   begin
      Screen.Cursor := crSQLWait;
      try
         try
            //for StepCorrect := 0 to StepList.Count - 1 do begin
            //    Make all the tasks.
            //end;
            if DoCreateDatabase(EditCD_Enterprise.Text, EditDS_Enterprise.Text) then begin
            
            end;
         finally
         end;
      finally
         Screen.Cursor := crDefault;
      end;
      ModalResult := mrOK;
   end;
end;

function TFormWizardGestEnterprises.CDEnterpriseValid(prmCD_Enterprise :string):Boolean;
var i :Integer;
begin
   Result := True;
   for i := 1 to Length(prmCD_Enterprise) do begin
      if not (prmCD_Enterprise[i] in ['A'..'Z', '0'..'9', '_']) then Result := False;
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
      {Hide all the pages}
      PanelPresentation.Visible   := False;
      PanelManageOrNew.Visible    := False;
      PanelEnterpriseData.Visible := False;
      PanelResume.Visible         := False;

      {Show the "Value" page}
      case ActivePage of
         apPresentation     :begin
           PanelPresentation.Parent  := PanelContainer;
           PanelPresentation.Visible := True;
         end;
         apManageOrNew      :begin
           PanelManageOrNew.Parent  := PanelContainer;
           PanelManageOrNew.Visible := True;
         end;
         apEnterpriseData :begin
           PanelEnterpriseData.Parent  := PanelContainer;
           PanelEnterpriseData.Visible := True;
           ImageList.GetBitmap(1, Image02.Picture.Bitmap);
           ImageList.GetBitmap(2, Image03.Picture.Bitmap);
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
           PanelResume.Parent  := PanelContainer;
           PanelResume.Visible := True;
           //ImageList.GetBitmap(1, Image02.Picture.Bitmap);
           //ImageList.GetBitmap(2, Image03.Picture.Bitmap);

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

function TFormWizardGestEnterprises.DoCreateDatabase(prmCD_Enterprise, prmDS_Enterprise :string):Boolean;
begin
   if Assigned(FCreateDatabase) then begin
      try
        FCreateDatabase(prmCD_Enterprise, prmDS_Enterprise);
        Result := True;
      except
        if not HandleCreateException then
          raise;
        Result := False;
      end;
   end
   else begin
      Result := False;
   end;
end;

end.



