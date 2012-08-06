unit ParametersEnterpriseController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls,
     DBController,
     CurrentConfigClass,
     DMParametersEnterprise,
     ParametersEnterpriseView;
type
  TParametersEnterpriseController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleParametersEnterprise;
    FView          :TParametersEnterpriseView;
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnShowForm        (Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
    procedure OnClick_BtnDOCCliente(Sender :TObject);
    procedure OnClick_BtnDOCProveedor(Sender :TObject);
    procedure OnClick_BtnDOC347(Sender :TObject);
    procedure OnClick_BtnFECHA_INICIO_EJERCICIO(Sender :TObject);
    procedure OnClick_BtnFECHA_FIN_EJERCICIO(Sender :TObject);
    procedure OnClick_BtnFECHAAMORTIZACION(Sender :TObject);
    procedure OnClick_BtnFECHABLOQUEO(Sender :TObject);
    procedure OnClick_BtnSearchAccount(Sender :TObject);
   
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, SysUtils, Dialogs, DB, Windows, Messages, Buttons, 
     CustomView, SearchAccountController;

constructor TParametersEnterpriseController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleParametersEnterprise, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TParametersEnterpriseView, FView);

   FView.DataSource.DataSet  := DM.QParametros;
   FView.SProvincias.DataSet := DM.LProvincias;
   FView.SConceptos.DataSet  := DM.LConceptos;

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TParametersEnterpriseController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TParametersEnterpriseController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Parametros de la Empresa';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow                      := OnShowForm;

   Result := True;
   FView.ShowModal;
end;

procedure TParametersEnterpriseController.OnShowForm(Sender: TObject);
begin
   FView.TabSheetGeneral.Show;
   FView.EditNOMBREFISCAL.SetFocus;
end;

procedure TParametersEnterpriseController.InitializeView;
begin

   FView.ModeList.Add(TComponentMode.Create(FView.EditNOMBREFISCAL                   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditSIGLAVIA                       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDIRECCION                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCODPOSTAL                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditPOBLACION                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCONTACTO                       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCODADMON                       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCCC                            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFECHA_INICIO_EJERCICIO         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFECHA_FIN_EJERCICIO            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFECHAAMORTIZACION              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFECHABLOQUEO                   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNIF                            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.RadioGroupTIPOEMPRESA              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.RadioGroupMONEDA                   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNUMEROCALLE                    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditESCALERA                       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditPISO                           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditPUERTA                         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditPROVINCIA                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditTELEFONO                       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFAX                            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditLONGITUD_SUBCUENTAS            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditAsiento                        , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditFILTROSUCUENTAS                , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditASIENTOS_INICIO_INTERVALO_BQDA , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditASIENTOS_FIN_INTERVALO_BQDA    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditASIENTO_INICIO_INTERVALO_FILTRO, fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditASIENTO_FIN_INTERVALO_FILTRO   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxRECARGO                    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxACTCOMENTARIO              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxGESTIONA_CARTERA_EFECTOS   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxINCLUIR_ABREV              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxTRATASERIE                 , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.RadioGroupBUSQUEDA_SUBCTAS         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxMOSTRAR_FILTRO_MAYOR       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxFILTRO_ASIENTOS_INICIO     , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify                          , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHA_INICIO_EJERCICIO          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHA_FIN_EJERCICIO             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHAAMORTIZACION               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHABLOQUEO                    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxASIENTO_NOMINA_INDIVIDUAL  , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.BtnDocCliente                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDocProveedor                    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDoc347                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOCCLIENTE                     , fmFixed));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOCPROVEEDOR                   , fmFixed));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOC347                         , fmFixed));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMSUELDO             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMSST                , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMPAGO               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTAOTRASREMUN            , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMIRPF               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMCARGO              , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSCTANOMSSE                , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnSearchSUBCUENTA_CIERRE          , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditCTO_REGULARIZACION             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCTO_REGULARIZACION_ESP         , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCTO_APERTURA                   , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCTO_APERTURA_ESP               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCTONOMT                        , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditCTONOME                        , fmEdit));

   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;
   FView.BtnDOCCliente.OnClick   := OnClick_BtnDOCCliente;
   FView.BtnDOCProveedor.OnClick := OnClick_BtnDOCProveedor;
   FView.BtnDOC347.OnClick       := OnClick_BtnDOC347;

   FView.BtnFECHA_INICIO_EJERCICIO.OnClick := OnClick_BtnFECHA_INICIO_EJERCICIO;
   FView.BtnFECHA_FIN_EJERCICIO.OnClick    := OnClick_BtnFECHA_FIN_EJERCICIO;
   FView.BtnFECHAAMORTIZACION.OnClick      := OnClick_BtnFECHAAMORTIZACION;
   FView.BtnFECHABLOQUEO.OnClick           := OnClick_BtnFECHABLOQUEO;
   FView.BtnSearchSCTANOMSUELDO.OnClick    := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTANOMSST.OnClick       := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTANOMPAGO.OnClick      := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTAOTRASREMUN.OnClick   := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTANOMIRPF.OnClick      := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTANOMCARGO.OnClick     := OnClick_BtnSearchAccount;
   FView.BtnSearchSCTANOMSSE.OnClick       := OnClick_BtnSearchAccount;
   FView.BtnSearchSUBCUENTA_CIERRE.OnClick := OnClick_BtnSearchAccount;

   { Toma el Asiento actual mediante la llamada a DMContaRef.Dame_Contador('asiento');
   { y apunta el mismo valor en AsientoOld, para luego comprobar si ha cambiado.       }
   //CDSFiltro.Active := False;
   //CDSFiltro.FieldDefs.Clear;
   //CDSFiltro.FieldDefs.Add('Asiento'   , ftInteger, 0, False);
   //CDSFiltro.FieldDefs.Add('AsientoOld', ftInteger, 0, False);
   //CDSFiltro.CreateDataSet;
   //CDSFiltro.Active := True;
   //CDSFiltro.Append;
   //CDSFiltro.FieldByName('asiento').AsInteger    := DmContaRef.Dame_contador('asiento');
   //CDSFiltro.FieldByName('asientoOld').AsInteger := CDSFiltro.FieldByName('Asiento').AsInteger;
end;

procedure TParametersEnterpriseController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QParametros.Edit;

   //if Integrity.Operation(okEdit) then begin
   //   FormHandler.Mode  := fmEditing;
   //   if Integrity.Preserve then begin
   //      EditCD_FAMILIA.ccMode := fmNavigating;
   //      EditDS_FAMILIA.SetFocus;
   //   end                                                         
   //   else EditCD_FAMILIA.SetFocus;
   //end;

   //if FView.ListViewUsers.Selected <> nil then begin
   //   FEditUserView := TEditUserView.Create(FView);
   //   FEditUserView.State := vsEdit;
   //   {Configuration of the view....}
   //   FEditUserView.User := TUser(FView.ListViewUsers.Selected.Data);
   //   try
   //      if FEditUserView.ShowModal = mrOK then begin
   //         //TUser(FView.ListViewUsers.Selected.Data).AcceptChanges;
   //         FModel.Update(TUser(FView.ListViewUsers.Selected.Data));
   //         FModel.Refresh;
   //         RefreshAllItems;
   //      end;
   //   finally FEditUserView.Free;
   //   end;
   //end
   //else FView.ShowMessage('Debe seleccionar un Usuario');
end;


procedure TParametersEnterpriseController.OnClick_Accept(Sender: TObject);
var nPoscoma :Cardinal;
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QParametros.Post;
      DM.QParametros.ApplyUpdates(0);
      FView.Mode := fmView;
   end;
   //if not ValidData then Exit;
   //if Integrity.Operation(okPost) then begin
   //   FormHandler.Mode := fmNavigating;
   //   Integrity.Operation(okRefresh);
   //end;

(*
   Perform(wm_NextDlgCtl, 0, 0);
   StrStPosS(DM.QParametros.FieldByName('NOMBREFISCAL').AsString, ',', nPosComa);
   if (DM.QParametros.FieldByName('TIPOEMPRESA').AsString = 'F') and (nPoscoma = 0) then begin
      DatabaseError('Debe poner una coma entre los apellidos y nombre (Ej.- Apellido Apellido, Nombre).');
   end;

   try
      DM.QParametros.Post;
      //DmControlRef.QControl.Post;
      //DmControlRef.QControl.Transaction.CommitRetaining;
   except
      DatabaseError('Error al guardar los datos');
   end;

   {Si ha cambiado el valor de Asiento entonces lo guarda, mediante DMContaRef.Actualizar_Contador(....   }
   //if (CdsFiltro.FieldByName('AsientoOld').AsInteger <> CdsFiltro.FieldByName('Asiento').AsInteger) then begin
   //   // Actualizar contadores
   //   DmContaRef.Actualizar_contador('asiento',
   //      CdsFiltro.FieldByName('asiento').AsInteger);
   //end;

   gvNombreEmpresa := DM.QParametros.FieldByName('NombreFiscal').AsString;
   Modo(Self, Naveg);
   Close;
*)
end;

procedure TParametersEnterpriseController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QParametros.Cancel;
      DM.QParametros.ApplyUpdates(0);
      FView.Mode := fmView;
   end;

   //Perform(wm_NextDlgCtl, 0, 0);

   //if not(DM.QParametros.Modified {or DmControlRef.QControl.Modified}) then Exit;
   //
   //if MessageDlg('¿Quiere anular las modificaciones realizadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
   //   try DM.QParametros.Cancel;
   //       {DmControlRef.QControl.Cancel;}
   //   except DatabaseError('No se ha podido cancelar la operación.' + #13 +);
   //   end;
   //   Modo(Self, Naveg);
   //   Close;
   //end;
end;

procedure TParametersEnterpriseController.OnClick_BtnDOCCliente(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE RECLAMACION A CLIENTES';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOCCLIENTE.AsString := FView.OpenDialog.Filename;
end;

procedure TParametersEnterpriseController.OnClick_BtnDOCProveedor(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE PAGOS A PROVEEDORES';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOCPROVEEDOR.AsString := FView.OpenDialog.Filename;
end;

procedure TParametersEnterpriseController.OnClick_BtnDOC347(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE OPERACIONES CON TERCEROS (347)';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOC347.AsString := FView.OpenDialog.Filename;
end;

procedure TParametersEnterpriseController.OnClick_BtnFECHA_FIN_EJERCICIO(Sender: TObject);
begin
   {$Message Warn 'P E N D I E N T E'}
   Dialogs.ShowMessage('Esto está pendiente');
end;

procedure TParametersEnterpriseController.OnClick_BtnFECHA_INICIO_EJERCICIO(Sender: TObject);
begin
   {$Message Warn 'P E N D I E N T E'}
   Dialogs.ShowMessage('Esto está pendiente');
end;

procedure TParametersEnterpriseController.OnClick_BtnFECHAAMORTIZACION(Sender: TObject);
begin
   {$Message Warn 'P E N D I E N T E'}
   Dialogs.ShowMessage('Esto está pendiente');
end;

procedure TParametersEnterpriseController.OnClick_BtnFECHABLOQUEO(Sender: TObject);
begin
   {$Message Warn 'P E N D I E N T E'}
   Dialogs.ShowMessage('Esto está pendiente');
end;

procedure TParametersEnterpriseController.OnClick_BtnSearchAccount(Sender: TObject);
begin
   with TSearchAccountController.Create(FConfiguration) do begin
      try
        ShowView;
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMSUELDO) then begin
           DM.QParametrosSCTANOMSUELDO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMSST) then begin
           DM.QParametrosSCTANOMSST.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMPAGO) then begin
           DM.QParametrosSCTANOMPAGO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTAOTRASREMUN) then begin
           DM.QParametrosSCTAOTRASREMUN.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMIRPF) then begin
           DM.QParametrosSCTANOMIRPF.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMCARGO) then begin
           DM.QParametrosSCTANOMCARGO.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSCTANOMSSE) then begin
           DM.QParametrosSCTANOMSSE.AsString := SUBCUENTA;
        end else
        if Sender = TSpeedButton(FView.BtnSearchSUBCUENTA_CIERRE) then begin
           DM.QParametrosSUBCUENTA_CIERRE.AsString := SUBCUENTA;
        end else
      finally
        Free;
      end;
   end;
end;

end.
