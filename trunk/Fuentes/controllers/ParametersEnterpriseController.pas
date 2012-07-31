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
    //FModel         :TUsersModel;
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnShowForm        (Sender :TObject);
    procedure OnClick_Edit(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
    procedure OnClick_BtnSPClientes(Sender :TObject);
    procedure OnClick_BtnSPProveedores(Sender :TObject);
    procedure OnClick_BtnSP347(Sender :TObject);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation
uses Forms, SysUtils, Dialogs, DB, Windows, Messages,
     CustomView;

constructor TParametersEnterpriseController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleParametersEnterprise, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TParametersEnterpriseView, FView);
   FView.DataSource.DataSet := DM.QParametros;
   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

   InitializeView;

   FView.Mode := fmView;



   //FModel := TUsersModel.Create(DBCtlr.DBConnection.Connection);
   //FModel.Open;

end;

destructor TParametersEnterpriseController.Destroy;
begin
   //FModel.Free;
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
   //FView.EditSearchText.SetFocus;
   //FView.EditSearchText.SelectAll;
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
   FView.ModeList.Add(TComponentMode.Create(FView.BtnEdit                            , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHA_INICIO_EJERCICIO          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHA_FIN_EJERCICIO             , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHAAMORTIZACION               , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnFECHABLOQUEO                    , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.BtnDocCliente                      , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDocProveedor                    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDoc347                          , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOCCLIENTE                     , fmFixed));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOCPROVEEDOR                   , fmFixed));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDOC347                         , fmFixed));





   FView.CBSUBCUENTA18.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA19.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA20.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA21.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA22.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA23.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA29.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   FView.CBSUBCUENTA39.MaxLength := DM.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

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

procedure TParametersEnterpriseController.OnClick_Edit(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QParametros.Edit;

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
   FView.Mode := fmView;

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
   FView.Mode := fmView;
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



procedure TParametersEnterpriseController.OnClick_BtnSP347(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE OPERACIONES CON TERCEROS (347)';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOC347.AsString := FView.OpenDialog.Filename;
end;

procedure TParametersEnterpriseController.OnClick_BtnSPClientes(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE RECLAMACION A CLIENTES';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOCCLIENTE.AsString := FView.OpenDialog.Filename;
end;

procedure TParametersEnterpriseController.OnClick_BtnSPProveedores(Sender: TObject);
begin
   FView.OpenDialog.Title      := 'SELECCIONE CARTA DE PAGOS A PROVEEDORES';
   FView.OpenDialog.InitialDir := FConfiguration.RunningDirectory;
   FView.OpenDialog.Execute;
   DM.QParametrosDOCPROVEEDOR.AsString := FView.OpenDialog.Filename;
end;

end.
