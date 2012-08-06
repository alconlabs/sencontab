unit ParametersInvoicingController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls,
     DBController,
     CurrentConfigClass,
     DMParametersEnterprise,
     ParametersInvoicingView;
type
  TParametersInvoicingController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleParametersEnterprise;
    FView          :TParametersInvoicingView;
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnShowForm        (Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
    procedure OnClick_BtnSearchAccount(Sender :TObject);
    procedure OnClick_BtnSearchConcept(Sender :TObject);
   
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, SysUtils, Dialogs, DB, Windows, Messages, Buttons, 
     CustomView, SearchAccountController, SearchConceptController;

constructor TParametersInvoicingController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleParametersEnterprise, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TParametersInvoicingView, FView);

   FView.DataSource.DataSet  := DM.QParametros;
   //FView.SProvincias.DataSet := DM.LProvincias;
   //FView.SConceptos.DataSet  := DM.LConceptos;

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TParametersInvoicingController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TParametersInvoicingController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Parametros de Facturación';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow                      := OnShowForm;

   Result := True;
   FView.ShowModal;
end;

procedure TParametersInvoicingController.OnShowForm(Sender: TObject);
begin
   FView.TabVentas.Show;
   FView.TabVentasRegimenGeneral.Show;
end;

procedure TParametersInvoicingController.InitializeView;
begin
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADTOPPV              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODTOPPV               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADTOPPC              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODTOPPC               , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTARETPROF             , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORETPROF              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORETARRE              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTARETARRE             , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOHACIVA               , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOCOBRO                , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOPAGO                 , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAHACIVA              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAGENINTRACOM         , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTABANCO               , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAEFECTOSCOMERCIALES  , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAEFECTDESCONTADOS    , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADEUDASDESCUENTOS    , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAREMESAEFECTOS       , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOEFECTOSCOMERCIALES   , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODEUDASDESCUENTOS     , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOREMESAEFECTOS        , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACNORMAL          , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACREDUCIDO        , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACSUPER           , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACEXENTO          , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTACOMPRAS             , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACINTRADEDUCIBLE  , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVACINTRAREPERCUTIDO, fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchVGENERICAC              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVACNORMAL           , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVACREDUCIDO         , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVACSUPER            , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVACEXENTO           , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOCOMPRAS              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOPROVEEDORES          , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOPROVINTRA            , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOPAGOF                , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVANORMAL           , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVAREDUCIDO         , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVASUPER            , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVAEXENTO           , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVAINTRADEDUCIBLE   , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVAINTRA            , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAVENTAS              , fmEdit));  
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTADEVOLUCION          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVANORMAL            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVASUPER             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVAEXENTO            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVAINTRA             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOVENTAS               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTODEVOLUCION           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOCLIENTES             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOIVAREDUCIDO          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTARECNORMAL           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTARECREDUCIDO         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTARECSUPER            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORECNORMAL            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORECREDUCIDO          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORECSUPER             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTOCOBROF               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTOSearchCTORECIBOVENTAS         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchVGENERICA               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSUBCAJA                 , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAIVAEXENTOCEE        , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAINTERESES           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCTASearchSCTAEXPORTACIONES       , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxDescCliente                 , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxDescProveedor               , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify                           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept                           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel                           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditRetencionProfesional            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditRetencionArrendatario           , fmEdit));

   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.BtnCTASearchSCTAIVANORMAL.OnClick            := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVAREDUCIDO.OnClick          := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVASUPER.OnClick             := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVAEXENTO.OnClick            := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVAINTRADEDUCIBLE.OnClick    := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVAINTRA.OnClick             := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAVENTAS.OnClick               := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTADEVOLUCION.OnClick           := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTARECNORMAL.OnClick            := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTARECREDUCIDO.OnClick          := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTARECSUPER.OnClick             := OnClick_BtnSearchAccount;
   FView.BtnCTASearchVGENERICA.OnClick                := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSUBCAJA.OnClick                  := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVAEXENTOCEE.OnClick         := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAINTERESES.OnClick            := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAEXPORTACIONES.OnClick        := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACNORMAL.OnClick           := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACREDUCIDO.OnClick         := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACSUPER.OnClick            := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACEXENTO.OnClick           := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTACOMPRAS.OnClick              := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACINTRADEDUCIBLE.OnClick   := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAIVACINTRAREPERCUTIDO.OnClick := OnClick_BtnSearchAccount;
   FView.BtnCTASearchVGENERICAC.OnClick               := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAEFECTOSCOMERCIALES.OnClick   := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAEFECTDESCONTADOS.OnClick     := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTADEUDASDESCUENTOS.OnClick     := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAREMESAEFECTOS.OnClick        := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTADTOPPV.OnClick               := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTADTOPPC.OnClick               := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTARETPROF.OnClick              := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTARETARRE.OnClick              := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAHACIVA.OnClick               := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTAGENINTRACOM.OnClick          := OnClick_BtnSearchAccount;
   FView.BtnCTASearchSCTABANCO.OnClick                := OnClick_BtnSearchAccount;

   FView.BtnCTOSearchCTOIVANORMAL.OnClick             := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVAREDUCIDO.OnClick           := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVASUPER.OnClick              := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVAEXENTO.OnClick             := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVAINTRA.OnClick              := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOVENTAS.OnClick                := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTODEVOLUCION.OnClick            := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOCLIENTES.OnClick              := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORECNORMAL.OnClick             := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORECREDUCIDO.OnClick           := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORECSUPER.OnClick              := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOCOBROF.OnClick                := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORECIBOVENTAS.OnClick          := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVACNORMAL.OnClick            := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVACREDUCIDO.OnClick          := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVACSUPER.OnClick             := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOIVACEXENTO.OnClick            := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOCOMPRAS.OnClick               := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOPROVEEDORES.OnClick           := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOPROVINTRA.OnClick             := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOPAGOF.OnClick                 := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOEFECTOSCOMERCIALES.OnClick    := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTODEUDASDESCUENTOS.OnClick      := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOREMESAEFECTOS.OnClick         := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTODTOPPV.OnClick                := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTODTOPPC.OnClick                := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORETPROF.OnClick               := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTORETARRE.OnClick               := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOHACIVA.OnClick                := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOCOBRO.OnClick                 := OnClick_BtnSearchConcept;
   FView.BtnCTOSearchCTOPAGO.OnClick                  := OnClick_BtnSearchConcept;
                                                     
   FView.Mode := fmView;
end;

procedure TParametersInvoicingController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QParametros.Edit;
end;

procedure TParametersInvoicingController.OnClick_Accept(Sender: TObject);
var nPoscoma :Cardinal;
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QParametros.Post;
      DM.QParametros.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TParametersInvoicingController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QParametros.Cancel;
      DM.QParametros.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
end;

procedure TParametersInvoicingController.OnClick_BtnSearchAccount(Sender: TObject);
begin
   with TSearchAccountController.Create(FConfiguration) do begin
      try
        ShowView;
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVANORMAL           ) then begin
           DM.QParametrosSCTAIVANORMAL.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVAREDUCIDO         ) then begin
           DM.QParametrosSCTAIVAREDUCIDO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVASUPER            ) then begin
           DM.QParametrosSCTAIVASUPER.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVAEXENTO           ) then begin
           DM.QParametrosSCTAIVAEXENTO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVAINTRADEDUCIBLE   ) then begin
           DM.QParametrosSCTAIVAINTRADEDUCIBLE.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVAINTRA            ) then begin
           DM.QParametrosSCTAIVAINTRA.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAVENTAS              ) then begin
           DM.QParametrosSCTAVENTAS.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTADEVOLUCION          ) then begin
           DM.QParametrosSCTADEVOLUCION.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTARECNORMAL           ) then begin
           DM.QParametrosSCTARECNORMAL.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTARECREDUCIDO         ) then begin
           DM.QParametrosSCTARECREDUCIDO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTARECSUPER            ) then begin
           DM.QParametrosSCTARECSUPER.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchVGENERICA               ) then begin
           DM.QParametrosVGENERICA.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSUBCAJA                 ) then begin
           DM.QParametrosSUBCAJA.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVAEXENTOCEE        ) then begin
           DM.QParametrosSCTAIVAEXENTOCEE.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAINTERESES           ) then begin
           DM.QParametrosSCTAINTERESES.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAEXPORTACIONES       ) then begin
           DM.QParametrosSCTAEXPORTACIONES.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACNORMAL          ) then begin
           DM.QParametrosSCTAIVACNORMAL.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACREDUCIDO        ) then begin
           DM.QParametrosSCTAIVACREDUCIDO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACSUPER           ) then begin
           DM.QParametrosSCTAIVACSUPER.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACEXENTO          ) then begin
           DM.QParametrosSCTAIVACEXENTO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTACOMPRAS             ) then begin
           DM.QParametrosSCTACOMPRAS.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACINTRADEDUCIBLE  ) then begin
           DM.QParametrosSCTAIVACINTRADEDUCIBLE.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAIVACINTRAREPERCUTIDO) then begin
           DM.QParametrosSCTAIVACINTRAREPERCUTIDO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchVGENERICAC              ) then begin
           DM.QParametrosVGENERICAC.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAEFECTOSCOMERCIALES  ) then begin
           DM.QParametrosSCTAEFECTOSCOMERCIALES.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAEFECTDESCONTADOS    ) then begin
           DM.QParametrosSCTAEFECTDESCONTADOS.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTADEUDASDESCUENTOS    ) then begin
           DM.QParametrosSCTADEUDASDESCUENTOS.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAREMESAEFECTOS       ) then begin
           DM.QParametrosSCTAREMESAEFECTOS.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTADTOPPV              ) then begin
           DM.QParametrosSCTADTOPPV.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTADTOPPC              ) then begin
           DM.QParametrosSCTADTOPPC.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTARETPROF             ) then begin
           DM.QParametrosSCTARETPROF.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTARETARRE             ) then begin
           DM.QParametrosSCTARETARRE.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAHACIVA              ) then begin
           DM.QParametrosSCTAHACIVA.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTAGENINTRACOM         ) then begin
           DM.QParametrosSCTAGENINTRACOM.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnCTASearchSCTABANCO               ) then begin
           DM.QParametrosSCTABANCO.AsString := SUBCUENTA;
        end;
      finally
        Free;
      end;
   end;
end;

procedure TParametersInvoicingController.OnClick_BtnSearchConcept(Sender: TObject);
begin
   with TSearchConceptController.Create(FConfiguration) do begin
      try
        ShowView;
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVANORMAL         ) then begin
           DM.QParametrosCTOIVANORMAL.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVAREDUCIDO       ) then begin
           DM.QParametrosCTOIVAREDUCIDO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVASUPER          ) then begin
           DM.QParametrosCTOIVASUPER.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVAEXENTO         ) then begin
           DM.QParametrosCTOIVAEXENTO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVAINTRA          ) then begin
           DM.QParametrosCTOIVAINTRA.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOVENTAS            ) then begin
           DM.QParametrosCTOVENTAS.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTODEVOLUCION        ) then begin
           DM.QParametrosCTODEVOLUCION.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOCLIENTES          ) then begin
           DM.QParametrosCTOCLIENTES.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORECNORMAL         ) then begin
           DM.QParametrosCTORECNORMAL.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORECREDUCIDO       ) then begin
           DM.QParametrosCTORECREDUCIDO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORECSUPER          ) then begin
           DM.QParametrosCTORECSUPER.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOCOBROF            ) then begin
           DM.QParametrosCTOCOBROF.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORECIBOVENTAS      ) then begin
           DM.QParametrosCTORECIBOVENTAS.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVACNORMAL        ) then begin
           DM.QParametrosCTOIVACNORMAL.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVACREDUCIDO      ) then begin
           DM.QParametrosCTOIVACREDUCIDO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVACSUPER         ) then begin
           DM.QParametrosCTOIVACSUPER.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOIVACEXENTO        ) then begin
           DM.QParametrosCTOIVACEXENTO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOCOMPRAS           ) then begin
           DM.QParametrosCTOCOMPRAS.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOPROVEEDORES       ) then begin
           DM.QParametrosCTOPROVEEDORES.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOPROVINTRA         ) then begin
           DM.QParametrosCTOPROVINTRA.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOPAGOF             ) then begin
           DM.QParametrosCTOPAGOF.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOEFECTOSCOMERCIALES) then begin
           DM.QParametrosCTOEFECTOSCOMERCIALES.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTODEUDASDESCUENTOS  ) then begin
           DM.QParametrosCTODEUDASDESCUENTOS.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOREMESAEFECTOS     ) then begin
           DM.QParametrosCTOREMESAEFECTOS.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTODTOPPV            ) then begin
           DM.QParametrosCTODTOPPV.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTODTOPPC            ) then begin
           DM.QParametrosCTODTOPPC.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORETPROF           ) then begin
           DM.QParametrosCTORETPROF.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTORETARRE           ) then begin
           DM.QParametrosCTORETARRE.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOHACIVA            ) then begin
           DM.QParametrosCTOHACIVA.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOCOBRO             ) then begin
           DM.QParametrosCTOCOBRO.AsString := ID_CONCEPTOS;
        end else
        if Sender = TSpeedButton(FView.BtnCTOSearchCTOPAGO              ) then begin
           DM.QParametrosCTOPAGO.AsString := ID_CONCEPTOS;
        end;
      finally
        Free;
      end;
   end;
end;

end.

