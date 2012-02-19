unit UParametrizacionFacturacion;
interface
uses Buttons, Windows, SysUtils, Messages, DB, Graphics, Classes,
     Forms, StdCtrls, DBCtrls, Controls, ExtCtrls, ComCtrls, Mask,
     FormHandler, CustomView;
type
  TWParametrizacionFacturacion = class(TCustomView)
    DSFichero: TDataSource;
    PanelButtons: TPanel;
    BtnSave: TSpeedButton;
    BtnCancel: TSpeedButton;
    PageControlParametrizacion: TPageControl;
    TabVentas: TTabSheet;
    PageControlVentas: TPageControl;
    TabVentasRegimenGeneral: TTabSheet;
    TabVentasRecEquivalencia: TTabSheet;
    TabCompras: TTabSheet;
    TabCarteraEfectos: TTabSheet;
    TabOtras: TTabSheet;
    GroupBoxDescuentosPorProntoPago: TGroupBox;
    LabelSCTADTOPPV: TLabel;
    LabelCTODTOPPV: TLabel;
    LabelSCTADTOPPC: TLabel;
    LabelCTODTOPPC: TLabel;
    TextCTODTOPPV: TDBText;
    TextCTODTOPPC: TDBText;
    TextSCTADTOPPV: TDBText;
    TextSCTADTOPPV_DS: TDBText;
    TextCTODTOPPV_DS: TDBText;
    TextSCTADTOPPC: TDBText;
    TextSCTADTOPPC_DS: TDBText;
    TextCTODTOPPC_DS: TDBText;
    GroupBoxProfesionalesArrendatarios: TGroupBox;
    LabelSCTARETPROF: TLabel;
    LabelCTORETPROF: TLabel;
    LabelSCTARETARRE: TLabel;
    LabelCTORETARRE: TLabel;
    LabelTANTORETPROF: TLabel;
    LabelTANTORETARRE: TLabel;
    TextCTORETARRE: TDBText;
    TextCTORETPROF: TDBText;
    TextSCTARETPROF: TDBText;
    TextSCTARETPROF_DS: TDBText;
    TextCTORETPROF_DS: TDBText;
    TextSCTARETARRE: TDBText;
    TextSCTARETARRE_DS: TDBText;
    TextCTORETARRE_DS: TDBText;
    BtnCTASearchSCTADTOPPV: TSpeedButton;
    BtnCTOSearchCTODTOPPV: TSpeedButton;
    BtnCTASearchSCTADTOPPC: TSpeedButton;
    BtnCTOSearchCTODTOPPC: TSpeedButton;
    BtnCTASearchSCTARETPROF: TSpeedButton;
    BtnCTOSearchCTORETPROF: TSpeedButton;
    BtnCTOSearchCTORETARRE: TSpeedButton;
    BtnCTASearchSCTARETARRE: TSpeedButton;
    BtnCTOSearchCTOHACIVA: TSpeedButton;
    BtnCTOSearchCTOCOBRO: TSpeedButton;
    BtnCTOSearchCTOPAGO: TSpeedButton;
    BtnCTASearchSCTAHACIVA: TSpeedButton;
    BtnCTASearchSCTAGENINTRACOM: TSpeedButton;
    BtnCTASearchSCTABANCO: TSpeedButton;
    BtnCTASearchSCTAEFECTOSCOMERCIALES: TSpeedButton;
    BtnCTASearchSCTAEFECTDESCONTADOS: TSpeedButton;
    BtnCTASearchSCTADEUDASDESCUENTOS: TSpeedButton;
    BtnCTASearchSCTAREMESAEFECTOS: TSpeedButton;
    BtnCTOSearchCTOEFECTOSCOMERCIALES: TSpeedButton;
    BtnCTOSearchCTODEUDASDESCUENTOS: TSpeedButton;
    BtnCTOSearchCTOREMESAEFECTOS: TSpeedButton;
    BtnCTASearchSCTAIVACNORMAL: TSpeedButton;
    BtnCTASearchSCTAIVACREDUCIDO: TSpeedButton;
    BtnCTASearchSCTAIVACSUPER: TSpeedButton;
    BtnCTASearchSCTAIVACEXENTO: TSpeedButton;
    BtnCTASearchSCTACOMPRAS: TSpeedButton;
    BtnCTASearchSCTAIVACINTRADEDUCIBLE: TSpeedButton;
    BtnCTASearchSCTAIVACINTRAREPERCUTIDO: TSpeedButton;
    BtnCTASearchVGENERICAC: TSpeedButton;
    BtnCTOSearchCTOIVACNORMAL: TSpeedButton;
    BtnCTOSearchCTOIVACREDUCIDO: TSpeedButton;
    BtnCTOSearchCTOIVACSUPER: TSpeedButton;
    BtnCTOSearchCTOIVACEXENTO: TSpeedButton;
    BtnCTOSearchCTOCOMPRAS: TSpeedButton;
    BtnCTOSearchCTOPROVEEDORES: TSpeedButton;
    BtnCTOSearchCTOPROVINTRA: TSpeedButton;
    BtnCTOSearchCTOPAGOF: TSpeedButton;
    BtnCTASearchSCTAIVANORMAL: TSpeedButton;
    BtnCTASearchSCTAIVAREDUCIDO: TSpeedButton;
    BtnCTASearchSCTAIVASUPER: TSpeedButton;
    BtnCTASearchSCTAIVAEXENTO: TSpeedButton;
    BtnCTASearchSCTAIVAINTRADEDUCIBLE: TSpeedButton;
    BtnCTASearchSCTAIVAINTRA: TSpeedButton;
    BtnCTASearchSCTAVENTAS: TSpeedButton;
    BtnCTASearchSCTADEVOLUCION: TSpeedButton;
    BtnCTOSearchCTOIVANORMAL: TSpeedButton;
    BtnCTOSearchCTOIVASUPER: TSpeedButton;
    BtnCTOSearchCTOIVAEXENTO: TSpeedButton;
    BtnCTOSearchCTOIVAINTRA: TSpeedButton;
    BtnCTOSearchCTOVENTAS: TSpeedButton;
    BtnCTOSearchCTODEVOLUCION: TSpeedButton;
    BtnCTOSearchCTOCLIENTES: TSpeedButton;
    BtnCTOSearchCTOIVAREDUCIDO: TSpeedButton;
    BtnCTASearchSCTARECNORMAL: TSpeedButton;
    BtnCTASearchSCTARECREDUCIDO: TSpeedButton;
    BtnCTASearchSCTARECSUPER: TSpeedButton;
    BtnCTOSearchCTORECNORMAL: TSpeedButton;
    BtnCTOSearchCTORECREDUCIDO: TSpeedButton;
    BtnCTOSearchCTORECSUPER: TSpeedButton;
    BtnCTOSearchCTOCOBROF: TSpeedButton;
    BtnCTOSearchCTORECIBOVENTAS: TSpeedButton;
    BtnCTASearchVGENERICA: TSpeedButton;
    BtnCTASearchSUBCAJA: TSpeedButton;
    BtnCTASearchSCTAIVAEXENTOCEE: TSpeedButton;
    BtnCTASearchSCTAINTERESES: TSpeedButton;
    BtnCTASearchSCTAEXPORTACIONES: TSpeedButton;
    EditRetencionProfesional: TDBEdit;
    EditRetencionArrendatario: TDBEdit;
    GroupBoxOtras: TGroupBox;
    LabelSCTAHACIVA: TLabel;
    TextSCTAHACIVA_DS: TDBText;
    TextSCTAHACIVA: TDBText;
    LabelSCTAGENINTRACOM: TLabel;
    TextSCTAGENINTRACOM: TDBText;
    TextSCTAGENINTRACOM_DS: TDBText;
    LabelSCTABANCO: TLabel;
    TextSCTABANCO: TDBText;
    TextSCTABANCO_DS: TDBText;
    LabelCTOHACIVA: TLabel;
    TextCTOHACIVA_DS: TDBText;
    TextCTOHACIVA: TDBText;
    LabelCTOCOBRO: TLabel;
    TextCTOCOBRO_DS: TDBText;
    TextCTOCOBRO: TDBText;
    LabelCTOPAGO: TLabel;
    TextCTOPAGO: TDBText;
    TextCTOPAGO_DS: TDBText;
    GroupBoxCarteraEfectos: TGroupBox;
    LabelSCTAREMESAEFECTOS: TLabel;
    LabelCTODEUDASDESCUENTOS: TLabel;
    LabelCTOREMESAEFECTOS: TLabel;
    TextCTODEUDASDESCUENTOS: TDBText;
    TextCTOREMESAEFECTOS: TDBText;
    LabelSCTAEFECTOSCOMERCIALES: TLabel;
    LabelSCTAEFECTDESCONTADOS: TLabel;
    LabelSCTADEUDASDESCUENTOS: TLabel;
    LabelCTOEFECTOSCOMERCIALES: TLabel;
    TextCTOEFECTOSCOMERCIALES: TDBText;
    TextSCTAREMESAEFECTOS_DS: TDBText;
    TextSCTAREMESAEFECTOS: TDBText;
    TextCTODEUDASDESCUENTOS_DS: TDBText;
    TextCTOREMESAEFECTOS_DS: TDBText;
    TextSCTAEFECTOSCOMERCIALES: TDBText;
    TextSCTAEFECTOSCOMERCIALES_DS: TDBText;
    TextSCTAEFECTDESCONTADOS: TDBText;
    TextSCTAEFECTDESCONTADOS_DS: TDBText;
    TextSCTADEUDASDESCUENTOS: TDBText;
    TextSCTADEUDASDESCUENTOS_DS: TDBText;
    TextCTOEFECTOSCOMERCIALES_DS: TDBText;
    CheckBoxDescCliente: TDBCheckBox;
    CheckBoxDescProveedor: TDBCheckBox;
    GroupBoxCompras: TGroupBox;
    TextCTOPROVINTRA: TDBText;
    LabelSCTAIVACNORMAL: TLabel;
    LabelSCTAIVACREDUCIDO: TLabel;
    LabelSCTAIVACSUPER: TLabel;
    LabelSCTAIVACEXENTO: TLabel;
    LabelCTOIVACNORMAL: TLabel;
    LabelCTOIVACREDUCIDO: TLabel;
    LabelCTOIVACSUPER: TLabel;
    LabelCTOPAGOF: TLabel;
    LabelVGENERICAC: TLabel;
    LabelCTOIVACEXENTO: TLabel;
    LabelCTOCOMPRAS: TLabel;
    LabelSCTACOMPRAS: TLabel;
    LabelCTOPROVEEDORES: TLabel;
    LabelCTOPROVINTRA: TLabel;
    LabelSCTAIVACINTRADEDUCIBLE: TLabel;
    LabelSCTAIVACINTRAREPERCUTIDO: TLabel;
    TextCTOIVACNORMAL: TDBText;
    TextCTOIVACREDUCIDO: TDBText;
    TextCTOIVACSUPER: TDBText;
    TextCTOIVACEXENTO: TDBText;
    TextCTOCOMPRAS: TDBText;
    TextCTOPROVEEDORES: TDBText;
    TextCTOPAGOF: TDBText;
    TextVGENERICAC_DS: TDBText;
    TextSCTAIVACEXENTO_DS: TDBText;
    TextSCTAIVACSUPER_DS: TDBText;
    TextSCTAIVACREDUCIDO_DS: TDBText;
    TextSCTAIVACNORMAL_DS: TDBText;
    TextSCTAIVACNORMAL: TDBText;
    TextSCTAIVACREDUCIDO: TDBText;
    TextSCTAIVACSUPER: TDBText;
    TextSCTAIVACEXENTO: TDBText;
    TextCTOIVACNORMAL_DS: TDBText;
    TextCTOIVACREDUCIDO_DS: TDBText;
    TextCTOIVACSUPER_DS: TDBText;
    TextCTOPAGOF_DS: TDBText;
    TextVGENERICAC: TDBText;
    TextCTOIVACEXENTO_DS: TDBText;
    TextSCTACOMPRAS_DS: TDBText;
    TextCTOCOMPRAS_DS: TDBText;
    TextSCTACOMPRAS: TDBText;
    TextCTOPROVEEDORES_DS: TDBText;
    TextCTOPROVINTRA_DS: TDBText;
    TextSCTAIVACINTRADEDUCIBLE_DS: TDBText;
    TextSCTAIVACINTRADEDUCIBLE: TDBText;
    TextSCTAIVACINTRAREPERCUTIDO_DS: TDBText;
    TextSCTAIVACINTRAREPERCUTIDO: TDBText;
    GroupBoxRegimenGeneral: TGroupBox;
    LabelCTOIVANORMAL: TLabel;
    LabelSCTAIVANORMAL: TLabel;
    LabelSCTAIVAEXENTO: TLabel;
    LabelCTOIVAREDUCIDO: TLabel;
    LabelSCTAIVAREDUCIDO: TLabel;
    LabelCTOIVASUPER: TLabel;
    LabelSCTAIVASUPER: TLabel;
    LabelCTOIVAEXENTO: TLabel;
    LabelSCTAIVAINTRADEDUCIBLE: TLabel;
    LabelCTOIVAINTRA: TLabel;
    LabelSCTAVENTAS: TLabel;
    LabelCTOVENTAS: TLabel;
    LabelSCTADEVOLUCION: TLabel;
    LabelCTODEVOLUCION: TLabel;
    LabelCTOCLIENTES: TLabel;
    LabelSCTAIVAINTRA: TLabel;
    TextCTOIVANORMAL: TDBText;
    TextCTOIVAREDUCIDO: TDBText;
    TextCTOIVAEXENTO: TDBText;
    TextCTOIVASUPER: TDBText;
    TextCTOIVAINTRA: TDBText;
    TextCTOVENTAS: TDBText;
    TextCTODEVOLUCION: TDBText;
    TextCTOCLIENTES: TDBText;
    TextSCTAIVANORMAL_DS: TDBText;
    TextSCTAIVANORMAL: TDBText;
    TextSCTAIVAEXENTO_DS: TDBText;
    TextCTOIVANORMAL_DS: TDBText;
    TextSCTAIVAEXENTO: TDBText;
    TextSCTAIVAREDUCIDO_DS: TDBText;
    TextCTOIVAREDUCIDO_DS: TDBText;
    TextSCTAIVAREDUCIDO: TDBText;
    TextSCTAIVASUPER_DS: TDBText;
    TextCTOIVASUPER_DS: TDBText;
    TextSCTAIVASUPER: TDBText;
    TextCTOIVAEXENTO_DS: TDBText;
    TextSCTAIVAINTRADEDUCIBLE_DS: TDBText;
    TextSCTAIVAINTRADEDUCIBLE: TDBText;
    TextCTOIVAINTRA_DS: TDBText;
    TextSCTAVENTAS_DS: TDBText;
    TextSCTAVENTAS: TDBText;
    TextCTOVENTAS_DS: TDBText;
    TextSCTADEVOLUCION_DS: TDBText;
    TextSCTADEVOLUCION: TDBText;
    TextCTODEVOLUCION_DS: TDBText;
    TextCTOCLIENTES_DS: TDBText;
    TextSCTAIVAINTRA: TDBText;
    TextSCTAIVAINTRA_DS: TDBText;
    GroupBoxRecargoEquivalencia: TGroupBox;
    LabelCTORECNORMAL: TLabel;
    LabelSCTARECNORMAL: TLabel;
    LabelCTORECREDUCIDO: TLabel;
    LabelSCTARECREDUCIDO: TLabel;
    LabelCTORECSUPER: TLabel;
    LabelSCTARECSUPER: TLabel;
    TextCTORECNORMAL: TDBText;
    TextCTORECREDUCIDO: TDBText;
    TextCTORECSUPER: TDBText;
    TextSCTARECNORMAL_DS: TDBText;
    TextCTORECNORMAL_DS: TDBText;
    TextSCTARECNORMAL: TDBText;
    TextSCTARECREDUCIDO_DS: TDBText;
    TextCTORECREDUCIDO_DS: TDBText;
    TextSCTARECREDUCIDO: TDBText;
    TextSCTARECSUPER_DS: TDBText;
    TextCTORECSUPER_DS: TDBText;
    TextSCTARECSUPER: TDBText;
    GroupBoxRecargoOtras: TGroupBox;
    LabelCTORECIBOVENTAS: TLabel;
    LabelCTOCOBROF: TLabel;
    LabelVGENERICA: TLabel;
    LabelSUBCAJA: TLabel;
    TextCTOCOBROF: TDBText;
    TextCTORECIBOVENTAS: TDBText;
    LabelSCTAIVAEXENTOCEE: TLabel;
    LabelSCTAINTERESES: TLabel;
    LabelSCTAEXPORTACIONES: TLabel;
    EditVGENERICA_DS: TDBText;
    TextCTOCOBROF_DS: TDBText;
    TextCTORECIBOVENTAS_DS: TDBText;
    TextVGENERICA: TDBText;
    TextSUBCAJA_DS: TDBText;
    TextSUBCAJA: TDBText;
    TextSCTAIVAEXENTOCEE_DS: TDBText;
    TextSCTAIVAEXENTOCEE: TDBText;
    TextSCTAINTERESES_DS: TDBText;
    TextSCTAINTERESES: TDBText;
    TextSCTAEXPORTACIONES_DS: TDBText;
    TextSCTAEXPORTACIONES: TDBText;
    StatusBar1: TStatusBar;
    procedure BtnNavCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
  private
    FormManager :TccFormHandler;
    procedure ShowTheChangedFields(AFieldName :string);
  public
  end;

implementation
uses Dialogs, General, Globales, MenuPrincipal, SearchAccount,
     IBCustomDataSet, SearchConcept, DM;
{$R *.DFM}

procedure TWParametrizacionFacturacion.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWParametrizacionFacturacion.FormCreate(Sender: TObject);
var i :Integer;
begin
   ActivarTransacciones(Self);
   TabVentas.Show;
   TabVentasRegimenGeneral.Show;

   FormManager := TccFormHandler.Create(Self);
   { Add all the TSpeedButton in the form to the FormManager List with Modifier fmEdit }
   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TSpeedButton then begin
         FormManager.AddComp(TSpeedButton(Components[i]).Name, fmEdit);
      end;
   end;

   FormManager.Mode := fmEdit;
end;

procedure TWParametrizacionFacturacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         key := 0;
         if DMRef.QParametros.State in dsEditModes then   begin
            BtnCancel.Click;
         end;
      end;
   end;
end;

procedure TWParametrizacionFacturacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DMRef.QParametros.State = dsBrowse then begin
      Action := caFree;
      FormManager.Free;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWParametrizacionFacturacion.BtnSaveClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   try
      DMRef.QParametros.Post;
      DMRef.QParametros.Transaction.CommitRetaining;
   except
      DatabaseError('Error al guardar los datos');
   end;
   FormManager.Mode := fmBrowse;
   Close;
end;

procedure TWParametrizacionFacturacion.BtnCancelClick(Sender: TObject);
var Canceled :Boolean;
begin
   Perform(WM_NextDlgCtl, 0, 0);

   if DMRef.QParametros.Modified then begin
      Canceled := MessageDlg('¿Quiere anular las modificaciones realizadas?',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes;
      if Canceled then begin
         try    DMRef.QParametros.Cancel;
         except Canceled := False;
                DatabaseError('No se ha podido cancelar la operación.');
         end;
      end;
   end
   else begin
      DMRef.QParametros.Cancel;
      Canceled := True;
   end;

   if Canceled then begin
      FormManager.Mode := fmBrowse;
      Close;
   end;
end;

procedure TWParametrizacionFacturacion.FormShow(Sender: TObject);
begin
   FormManager.Mode := fmEdit;
   DMRef.QParametros.Close;
   DMRef.QParametros.Open;
   if not (DMRef.QParametros.State in dsEditModes) then begin
      DMRef.QParametros.Edit;
   end;
end;

procedure TWParametrizacionFacturacion.ShowTheChangedFields(AFieldName: string);
var i         :Integer;
    CD_DBText :TDBText;
    DS_DBText :TDBText;
    OldStyle  :TFontStyles;
    OldColor  :TColor;
begin
   CD_DBText := nil;
   DS_DBText := nil;

   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDBText then begin
         if TDBText(Components[i]).DataField = AFieldName then begin
            CD_DBText := TDBText(Components[i]);
            Break;
         end;
      end;
   end;

   for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDBText then begin
         if TDBText(Components[i]).DataField = AFieldName+'_DS' then begin
            DS_DBText := TDBText(Components[i]);
            Break;
         end;
      end;
   end;

   if (CD_DBText <> nil) and (DS_DBText <> nil) then begin
      OldStyle := CD_DBText.Font.Style;
      OldColor := CD_DBText.Font.Color;
      RePaint;

      for i := 1 to 3 do begin;
          RePaint;
          Sleep(200);
          CD_DBText.Font.Style := [fsBold];
          CD_DBText.Font.Color := clRed;
          DS_DBText.Font.Style := [fsBold];
          DS_DBText.Font.Color := clRed;
          RePaint;
          Sleep(200);
          CD_DBText.Font.Style := [];
          CD_DBText.Font.Color := clBlack;
          DS_DBText.Font.Style := [];
          DS_DBText.Font.Color := clBlack;
      end;
      CD_DBText.Font.Style := OldStyle;
      CD_DBText.Font.Color := clRed;
      DS_DBText.Font.Style := OldStyle;
      DS_DBText.Font.Color := clRed;
   end;
end;

procedure TWParametrizacionFacturacion.BtnSearchClick(Sender: TObject);
var SearchAccount :TFormSearchAccount;
    SearchConcept :TFormSearchConcept;
    i            :Integer;
    BtnName      :string;
    CD_Field     :TIBStringField;
    DS_Field     :TIBStringField;
    Found        :Boolean;
begin
   CD_Field := nil;
   DS_Field := nil;

   { The next line avoid stupid exceptions }
   if not(Sender is TSpeedButton) then Exit;

   BtnName := Copy(TSpeedButton(Sender).Name, 13, Length(TSpeedButton(Sender).Name) -12);

   Found := False;
   { Search for the correspondant field in the DataModule }
   for i := 0 to DMRef.ComponentCount - 1 do begin
      if DMRef.Components[i] is TIBStringField then begin
         if Pos('QParametros', TIBStringField(DMRef.Components[i]).Name) = 1 then begin
            if TIBStringField(DMRef.Components[i]).Name = 'QParametros'+BtnName then begin
               CD_Field := TIBStringField(DMRef.Components[i]);
               Found := True;
            end;
         end;

         if Pos('QParametros', TIBStringField(DMRef.Components[i]).Name) = 1 then begin
            if TIBStringField(DMRef.Components[i]).Name = 'QParametros'+BtnName+'_DS' then begin
               DS_Field := TIBStringField(DMRef.Components[i]);
            end;
         end;
      end;
   end;

   if Found then begin
      { Based in the letters 4, 5 and 6 in the name of the Button we know if we search a Concept or an Account }
      { CTO is a Concept and CTA is an Account. We need to consider only the letter number 6 }
      case TSpeedButton(Sender).Name[6] of
        'A':begin { Search for an Account }
           SearchAccount := TFormSearchAccount.Create(DMRef.IBDSiamCont);
           try
              SearchAccount.TextSearched := CD_Field.AsString;
              if SearchAccount.ShowModal = mrOK then begin
                 CD_Field.AsString := SearchAccount.CD_ACCOUNT;
                 DS_Field.AsString := SearchAccount.DS_ACCOUNT;
                 ShowTheChangedFields(BtnName);
              end;
           finally
              FreeAndNil(SearchAccount);
           end;
        end;
        'O':begin { Search for a Concept }
           SearchConcept := TFormSearchConcept.Create(DMRef.IBDSiamCont);
           try
              SearchConcept.TextSearched := CD_Field.AsString;
              if SearchConcept.ShowModal = mrOK then begin
                 CD_Field.AsString := SearchConcept.ID_CONCEPT;
                 DS_Field.AsString := SearchConcept.DS_CONCEPT;
                 ShowTheChangedFields(BtnName);
              end;
           finally
              FreeAndNil(SearchConcept);
           end;
        end;
      end;
   end
   else begin
      ShowMessage('There is a problem with the name of the button or with the name of the field');
   end;
end;


(*

SELECT PRM.ID_PARAMETROS                          ,
       PRM.LONGITUD_SUBCUENTAS                    ,
       PRM.FECHA_INICIO_APLICACION                ,
       PRM.FECHA_INICIO_EJERCICIO                 ,
       PRM.FECHA_FIN_EJERCICIO                    ,
       PRM.CTO_REGULARIZACION                     ,
       PRM.SUBCUENTA_CIERRE                       ,
       PRM.MONEDA                                 ,
       PRM.NOMBREFISCAL                           ,
       PRM.DIRECCION                              ,
       PRM.DIRECCION1                             ,
       PRM.POBLACION                              ,
       PRM.CODPOSTAL                              ,
       PRM.PROVINCIA                              ,
       PRM.NIF                                    ,
       PRM.CONTACTO                               ,
       PRM.DOCCLIENTE                             ,
       PRM.DOCPROVEEDOR                           ,
       PRM.DOC347                                 ,
       PRM.FECHABLOQUEO                           ,
       PRM.CTO_APERTURA                           ,
       PRM.CTO_REGULARIZACION_ESP                 ,
       PRM.FECHAAMORTIZACION                      ,
       PRM.RECARGO                                ,
       PRM.CTO_APERTURA_ESP                       ,
       PRM.SCTAIVANORMAL                          ,
       S01.DESCRIPCION SCTAIVANORMAL_DS           ,
       PRM.SCTAIVAREDUCIDO                        ,
       S02.DESCRIPCION SCTAIVAREDUCIDO_DS         ,
       PRM.SCTAIVASUPER                           ,
       S03.DESCRIPCION SCTAIVASUPER_DS            ,
       PRM.SCTAIVAEXENTO                          ,
       S04.DESCRIPCION SCTAIVAEXENTO_DS           ,
       PRM.SCTAIVAINTRADEDUCIBLE                  ,
       S05.DESCRIPCION SCTAIVAINTRADEDUCIBLE_DS   ,
       PRM.SCTAIVAINTRA                           ,
       S06.DESCRIPCION SCTAIVAINTRA_DS            ,
       PRM.SCTAVENTAS                             ,
       S07.DESCRIPCION SCTAVENTAS_DS              ,
       PRM.SCTADEVOLUCION                         ,
       S08.DESCRIPCION SCTADEVOLUCION_DS          ,
       PRM.SCTARECNORMAL                          ,
       S09.DESCRIPCION SCTARECNORMAL_DS           ,
       PRM.SCTARECREDUCIDO                        ,
       S10.DESCRIPCION SCTARECREDUCIDO_DS         ,
       PRM.SCTARECSUPER                           ,
       S11.DESCRIPCION SCTARECSUPER_DS            ,
       PRM.VGENERICA                              ,
       S12.DESCRIPCION VGENERICA_DS               ,
       PRM.SUBCAJA                                ,
       S13.DESCRIPCION SUBCAJA_DS                 ,
       PRM.SCTAIVAEXENTOCEE                       ,
       S14.DESCRIPCION SCTAIVAEXENTOCEE_DS        ,
       PRM.SCTAINTERESES                          ,
       S15.DESCRIPCION SCTAINTERESES_DS           ,
       PRM.SCTAEXPORTACIONES                      ,
       S16.DESCRIPCION SCTAEXPORTACIONES_DS       ,
       PRM.SCTAIVACNORMAL                         ,
       S17.DESCRIPCION SCTAIVACNORMAL_DS          ,
       PRM.SCTAIVACREDUCIDO                       ,
       S18.DESCRIPCION SCTAIVACREDUCIDO_DS        ,
       PRM.SCTAIVACSUPER                          ,
       S19.DESCRIPCION SCTAIVACSUPER_DS           ,
       PRM.SCTAIVACEXENTO                         ,
       S20.DESCRIPCION SCTAIVACEXENTO_DS          ,
       PRM.SCTACOMPRAS                            ,
       S21.DESCRIPCION SCTACOMPRAS_DS             ,
       PRM.SCTAIVACINTRADEDUCIBLE                 ,
       S22.DESCRIPCION SCTAIVACINTRADEDUCIBLE_DS  ,
       PRM.SCTAIVACINTRAREPERCUTIDO               ,
       S23.DESCRIPCION SCTAIVACINTRAREPERCUTIDO_DS,
       PRM.VGENERICAC                             ,
       S24.DESCRIPCION VGENERICAC_DS              ,
       PRM.SCTAEFECTOSCOMERCIALES                 ,
       S25.DESCRIPCION SCTAEFECTOSCOMERCIALES_DS  ,
       PRM.SCTAEFECTDESCONTADOS                   ,
       S26.DESCRIPCION SCTAEFECTDESCONTADOS_DS    ,
       PRM.SCTADEUDASDESCUENTOS                   ,
       S27.DESCRIPCION SCTADEUDASDESCUENTOS_DS    ,
       PRM.SCTAREMESAEFECTOS                      ,
       S28.DESCRIPCION SCTAREMESAEFECTOS_DS       ,
       PRM.SCTADTOPPV                             ,
       S29.DESCRIPCION SCTADTOPPV_DS              ,
       PRM.SCTADTOPPC                             ,
       S30.DESCRIPCION SCTADTOPPC_DS              ,
       PRM.SCTARETPROF                            ,
       S31.DESCRIPCION SCTARETPROF_DS             ,
       PRM.SCTARETARRE                            ,
       S32.DESCRIPCION SCTARETARRE_DS             ,
       PRM.SCTAHACIVA                             ,
       S33.DESCRIPCION SCTAHACIVA_DS              ,
       PRM.SCTAGENINTRACOM                        ,
       S34.DESCRIPCION SCTAGENINTRACOM_DS         ,
       PRM.SCTABANCO                              ,
       S35.DESCRIPCION SCTABANCO_DS               ,
       PRM.CTOIVANORMAL                           ,
       C01.DESCRIPCION CTOIVANORMAL_DS            ,
       PRM.CTOIVAREDUCIDO                         ,
       C02.DESCRIPCION CTOIVAREDUCIDO_DS          ,
       PRM.CTOIVASUPER                            ,
       C03.DESCRIPCION CTOIVASUPER_DS             ,
       PRM.CTOIVAEXENTO                           ,
       C04.DESCRIPCION CTOIVAEXENTO_DS            ,
       PRM.CTOIVAINTRA                            ,
       C05.DESCRIPCION CTOIVAINTRA_DS             ,
       PRM.CTOVENTAS                              ,
       C06.DESCRIPCION CTOVENTAS_DS               ,
       PRM.CTODEVOLUCION                          ,
       C07.DESCRIPCION CTODEVOLUCION_DS           ,
       PRM.CTOCLIENTES                            ,
       C08.DESCRIPCION CTOCLIENTES_DS             ,
       PRM.CTORECNORMAL                           ,
       C09.DESCRIPCION CTORECNORMAL_DS            ,
       PRM.CTORECREDUCIDO                         ,
       C10.DESCRIPCION CTORECREDUCIDO_DS          ,
       PRM.CTORECSUPER                            ,
       C11.DESCRIPCION CTORECSUPER_DS             ,
       PRM.CTOCOBROF                              ,
       C12.DESCRIPCION CTOCOBROF_DS               ,
       PRM.CTORECIBOVENTAS                        ,
       C13.DESCRIPCION CTORECIBOVENTAS_DS         ,
       PRM.CTOIVACNORMAL                          ,
       C14.DESCRIPCION CTOIVACNORMAL_DS           ,
       PRM.CTOIVACREDUCIDO                        ,
       C15.DESCRIPCION CTOIVACREDUCIDO_DS         ,
       PRM.CTOIVACSUPER                           ,
       C16.DESCRIPCION CTOIVACSUPER_DS            ,
       PRM.CTOIVACEXENTO                          ,
       C17.DESCRIPCION CTOIVACEXENTO_DS           ,
       PRM.CTOCOMPRAS                             ,
       C18.DESCRIPCION CTOCOMPRAS_DS              ,
       PRM.CTOPROVEEDORES                         ,
       C19.DESCRIPCION CTOPROVEEDORES_DS          ,
       PRM.CTOPROVINTRA                           ,
       C20.DESCRIPCION CTOPROVINTRA_DS            ,
       PRM.CTOPAGOF                               ,
       C21.DESCRIPCION CTOPAGOF_DS                ,
       PRM.CTOEFECTOSCOMERCIALES                  ,
       C22.DESCRIPCION CTOEFECTOSCOMERCIALES_DS   ,
       PRM.CTODEUDASDESCUENTOS                    ,
       C23.DESCRIPCION CTODEUDASDESCUENTOS_DS     ,
       PRM.CTOREMESAEFECTOS                       ,
       C24.DESCRIPCION CTOREMESAEFECTOS_DS        ,
       PRM.CTODTOPPV                              ,
       C25.DESCRIPCION CTODTOPPV_DS               ,
       PRM.CTODTOPPC                              ,
       C26.DESCRIPCION CTODTOPPC_DS               ,
       PRM.CTORETPROF                             ,
       C27.DESCRIPCION CTORETPROF_DS              ,
       PRM.CTORETARRE                             ,
       C28.DESCRIPCION CTORETARRE_DS              ,
       PRM.CTOHACIVA                              ,
       C29.DESCRIPCION CTOHACIVA_DS               ,
       PRM.CTOCOBRO                               ,
       C30.DESCRIPCION CTOCOBRO_DS                ,
       PRM.CTOPAGO                                ,
       C31.DESCRIPCION CTOPAGO_DS                 ,
       PRM.SCTADESCUENTO                          ,
       PRM.CTODESCUENTO                           ,
       PRM.CTONOME                                ,
       PRM.CTONOMT                                ,
       PRM.SCTANOMSUELDO                          ,
       PRM.SCTANOMIRPF                            ,
       PRM.SCTANOMPAGO                            ,
       PRM.SCTANOMSSE                             ,
       PRM.SCTANOMSST                             ,
       PRM.SCTANOMCARGO                           ,
       PRM.TANTORETPROF                           ,
       PRM.TANTORETARRE                           ,
       PRM.TELEFONO                               ,
       PRM.FAX                                    ,
       PRM.DOCIMPRIMIR                            ,
       PRM.SIGLAVIA                               ,
       PRM.NUMEROCALLE                            ,
       PRM.ESCALERA                               ,
       PRM.PISO                                   ,
       PRM.PUERTA                                 ,
       PRM.CCC                                    ,
       PRM.CODADMON                               ,
       PRM.GESTIONA_CARTERA_EFECTOS               ,
       PRM.FILTRO_ASIENTOS_INICIO                 ,
       PRM.INCLUIR_ABREV                          ,
       PRM.ASIENTOS_INICIO_INTERVALO_BQDA         ,
       PRM.ASIENTOS_FIN_INTERVALO_BQDA            ,
       PRM.MOSTRAR_FILTRO_MAYOR                   ,
       PRM.ASIENTO_INICIO_INTERVALO_FILTRO        ,
       PRM.ASIENTO_FIN_INTERVALO_FILTRO           ,
       PRM.ASIENTO_NOMINA_INDIVIDUAL              ,
       PRM.BUSQUEDA_SUBCTAS                       ,
       PRM.SCTAOTRASREMUN                         ,
       PRM.DESCPROV_CARTERAEFECTOS                ,
       PRM.DESCCLI_CARTERAEFECTOS                 ,
       PRM.TIPOEMPRESA                            ,
       PRM.FILTROSUBCTAS                          ,
       PRM.OFFICE2003                             ,
       PRM.TRATASERIE                             ,
       PRM.ACTCOMENTARIO
FROM PARAMETROS PRM
LEFT JOIN SUBCTAS S01 ON S01.SUBCUENTA = PRM.SCTAIVANORMAL
LEFT JOIN SUBCTAS S02 ON S02.SUBCUENTA = PRM.SCTAIVAREDUCIDO
LEFT JOIN SUBCTAS S03 ON S03.SUBCUENTA = PRM.SCTAIVASUPER
LEFT JOIN SUBCTAS S04 ON S04.SUBCUENTA = PRM.SCTAIVAEXENTO
LEFT JOIN SUBCTAS S05 ON S05.SUBCUENTA = PRM.SCTAIVAINTRADEDUCIBLE
LEFT JOIN SUBCTAS S06 ON S06.SUBCUENTA = PRM.SCTAIVAINTRA
LEFT JOIN SUBCTAS S07 ON S07.SUBCUENTA = PRM.SCTAVENTAS
LEFT JOIN SUBCTAS S08 ON S08.SUBCUENTA = PRM.SCTADEVOLUCION
LEFT JOIN SUBCTAS S09 ON S09.SUBCUENTA = PRM.SCTARECNORMAL
LEFT JOIN SUBCTAS S10 ON S10.SUBCUENTA = PRM.SCTARECREDUCIDO
LEFT JOIN SUBCTAS S11 ON S11.SUBCUENTA = PRM.SCTARECSUPER
LEFT JOIN SUBCTAS S12 ON S12.SUBCUENTA = PRM.VGENERICA
LEFT JOIN SUBCTAS S13 ON S13.SUBCUENTA = PRM.SUBCAJA
LEFT JOIN SUBCTAS S14 ON S14.SUBCUENTA = PRM.SCTAIVAEXENTOCEE
LEFT JOIN SUBCTAS S15 ON S15.SUBCUENTA = PRM.SCTAINTERESES
LEFT JOIN SUBCTAS S16 ON S16.SUBCUENTA = PRM.SCTAEXPORTACIONES
LEFT JOIN SUBCTAS S17 ON S17.SUBCUENTA = PRM.SCTAIVACNORMAL
LEFT JOIN SUBCTAS S18 ON S18.SUBCUENTA = PRM.SCTAIVACREDUCIDO
LEFT JOIN SUBCTAS S19 ON S19.SUBCUENTA = PRM.SCTAIVACSUPER
LEFT JOIN SUBCTAS S20 ON S20.SUBCUENTA = PRM.SCTAIVACEXENTO
LEFT JOIN SUBCTAS S21 ON S21.SUBCUENTA = PRM.SCTACOMPRAS
LEFT JOIN SUBCTAS S22 ON S22.SUBCUENTA = PRM.SCTAIVACINTRADEDUCIBLE
LEFT JOIN SUBCTAS S23 ON S23.SUBCUENTA = PRM.SCTAIVACINTRAREPERCUTIDO
LEFT JOIN SUBCTAS S24 ON S24.SUBCUENTA = PRM.VGENERICAC
LEFT JOIN SUBCTAS S25 ON S25.SUBCUENTA = PRM.SCTAEFECTOSCOMERCIALES
LEFT JOIN SUBCTAS S26 ON S26.SUBCUENTA = PRM.SCTAEFECTDESCONTADOS
LEFT JOIN SUBCTAS S27 ON S27.SUBCUENTA = PRM.SCTADEUDASDESCUENTOS
LEFT JOIN SUBCTAS S28 ON S28.SUBCUENTA = PRM.SCTAREMESAEFECTOS
LEFT JOIN SUBCTAS S29 ON S29.SUBCUENTA = PRM.SCTADTOPPV
LEFT JOIN SUBCTAS S30 ON S30.SUBCUENTA = PRM.SCTADTOPPC
LEFT JOIN SUBCTAS S31 ON S31.SUBCUENTA = PRM.SCTARETPROF
LEFT JOIN SUBCTAS S32 ON S32.SUBCUENTA = PRM.SCTARETARRE
LEFT JOIN SUBCTAS S33 ON S33.SUBCUENTA = PRM.SCTAHACIVA
LEFT JOIN SUBCTAS S34 ON S34.SUBCUENTA = PRM.SCTAGENINTRACOM
LEFT JOIN SUBCTAS S35 ON S35.SUBCUENTA = PRM.SCTABANCO
LEFT JOIN CONCEPTOS C01 ON C01.ID_CONCEPTOS = PRM.CTOIVANORMAL
LEFT JOIN CONCEPTOS C02 ON C02.ID_CONCEPTOS = PRM.CTOIVAREDUCIDO
LEFT JOIN CONCEPTOS C03 ON C03.ID_CONCEPTOS = PRM.CTOIVASUPER
LEFT JOIN CONCEPTOS C04 ON C04.ID_CONCEPTOS = PRM.CTOIVAEXENTO
LEFT JOIN CONCEPTOS C05 ON C05.ID_CONCEPTOS = PRM.CTOIVAINTRA
LEFT JOIN CONCEPTOS C06 ON C06.ID_CONCEPTOS = PRM.CTOVENTAS
LEFT JOIN CONCEPTOS C07 ON C07.ID_CONCEPTOS = PRM.CTODEVOLUCION
LEFT JOIN CONCEPTOS C08 ON C08.ID_CONCEPTOS = PRM.CTOCLIENTES
LEFT JOIN CONCEPTOS C09 ON C09.ID_CONCEPTOS = PRM.CTORECNORMAL
LEFT JOIN CONCEPTOS C10 ON C10.ID_CONCEPTOS = PRM.CTORECREDUCIDO
LEFT JOIN CONCEPTOS C11 ON C11.ID_CONCEPTOS = PRM.CTORECSUPER
LEFT JOIN CONCEPTOS C12 ON C12.ID_CONCEPTOS = PRM.CTOCOBROF
LEFT JOIN CONCEPTOS C13 ON C13.ID_CONCEPTOS = PRM.CTORECIBOVENTAS
LEFT JOIN CONCEPTOS C14 ON C14.ID_CONCEPTOS = PRM.CTOIVACNORMAL
LEFT JOIN CONCEPTOS C15 ON C15.ID_CONCEPTOS = PRM.CTOIVACREDUCIDO
LEFT JOIN CONCEPTOS C16 ON C16.ID_CONCEPTOS = PRM.CTOIVACSUPER
LEFT JOIN CONCEPTOS C17 ON C17.ID_CONCEPTOS = PRM.CTOIVACEXENTO
LEFT JOIN CONCEPTOS C18 ON C18.ID_CONCEPTOS = PRM.CTOCOMPRAS
LEFT JOIN CONCEPTOS C19 ON C19.ID_CONCEPTOS = PRM.CTOPROVEEDORES
LEFT JOIN CONCEPTOS C20 ON C20.ID_CONCEPTOS = PRM.CTOPROVINTRA
LEFT JOIN CONCEPTOS C21 ON C21.ID_CONCEPTOS = PRM.CTOPAGOF
LEFT JOIN CONCEPTOS C22 ON C22.ID_CONCEPTOS = PRM.CTOEFECTOSCOMERCIALES
LEFT JOIN CONCEPTOS C23 ON C23.ID_CONCEPTOS = PRM.CTODEUDASDESCUENTOS
LEFT JOIN CONCEPTOS C24 ON C24.ID_CONCEPTOS = PRM.CTOREMESAEFECTOS
LEFT JOIN CONCEPTOS C25 ON C25.ID_CONCEPTOS = PRM.CTODTOPPV
LEFT JOIN CONCEPTOS C26 ON C26.ID_CONCEPTOS = PRM.CTODTOPPC
LEFT JOIN CONCEPTOS C27 ON C27.ID_CONCEPTOS = PRM.CTORETPROF
LEFT JOIN CONCEPTOS C28 ON C28.ID_CONCEPTOS = PRM.CTORETARRE
LEFT JOIN CONCEPTOS C29 ON C29.ID_CONCEPTOS = PRM.CTOHACIVA
LEFT JOIN CONCEPTOS C30 ON C30.ID_CONCEPTOS = PRM.CTOCOBRO
LEFT JOIN CONCEPTOS C31 ON C31.ID_CONCEPTOS = PRM.CTOPAGO

*)

end.
