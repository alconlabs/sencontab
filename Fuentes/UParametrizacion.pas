unit UParametrizacion;
interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
     DBCtrls, ExtCtrls, DB, Buttons, ComCtrls, DBClient, Mask,
     CustomView,
     wwdbedit, Wwdotdot, wwdbdatetimepicker, Wwdbcomb, wwdblook;
type
  TWParametrizacion = class(TCustomView)
    OpenDialog: TOpenDialog;
    PnlBtn: TPanel;
    Label89: TLabel;
    PageControl: TPageControl;
    TabSheetGeneral: TTabSheet;
    LabelNif: TLabel;
    LabelDireccion: TLabel;
    LabelPostal: TLabel;
    LabelPoblacion: TLabel;
    LabelProvincia: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label60: TLabel;
    lLongSubcuentas: TLabel;
    Label74: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EditNOMBREFISCAL: TDBEdit;
    EditNIF: TDBEdit;
    EditDIRECCION: TDBEdit;
    EditCODPOSTAL: TDBEdit;
    EditPOBLACION: TDBEdit;
    EditPROVINCIA: TwwDBLookupCombo;
    EditTELEFONO: TDBEdit;
    EditCONTACTO: TDBEdit;
    EditFAX: TDBEdit;
    EditAsiento: TDBEdit;
    CheckBoxRECARGO: TDBCheckBox;
    EditLONGITUD_SUBCUENTAS: TDBEdit;
    GroupBox2: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    EditFECHA_INICIO_EJERCICIO: TDBEdit;
    EditFECHA_FIN_EJERCICIO: TDBEdit;
    EditFECHAAMORTIZACION: TDBEdit;
    EditFECHABLOQUEO: TDBEdit;
    EditSIGLAVIA: TDBEdit;
    EditNUMEROCALLE: TDBEdit;
    EditESCALERA: TDBEdit;
    EditPISO: TDBEdit;
    EditPUERTA: TDBEdit;
    EditCODADMON: TDBEdit;
    EditCCC: TDBEdit;
    CheckBoxGESTIONA_CARTERA_EFECTOS: TDBCheckBox;
    CheckBoxINCLUIR_ABREV: TDBCheckBox;
    GroupBox16: TGroupBox;
    Label76: TLabel;
    Label80: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    EditASIENTOS_INICIO_INTERVALO_BQDA: TDBEdit;
    EditASIENTOS_FIN_INTERVALO_BQDA: TDBEdit;
    EditASIENTO_INICIO_INTERVALO_FILTRO: TDBEdit;
    EditASIENTO_FIN_INTERVALO_FILTRO: TDBEdit;
    CheckBoxFILTRO_ASIENTOS_INICIO: TDBCheckBox;
    CheckBoxMOSTRAR_FILTRO_MAYOR: TDBCheckBox;
    RadioGroupBUSQUEDA_SUBCTAS: TDBRadioGroup;
    EditFILTROSUCUENTAS: TDBEdit;
    CheckBoxACTCOMENTARIO: TDBCheckBox;
    CheckBoxTRATASERIE: TDBCheckBox;
    TabSheetNominas: TTabSheet;
    GroupBox7: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    DBText22: TDBText;
    Label100: TLabel;
    CBSUBCUENTA18: TwwDBLookupCombo;
    wwDBLookupCombo19: TwwDBLookupCombo;
    CBSUBCUENTA19: TwwDBLookupCombo;
    wwDBLookupCombo49: TwwDBLookupCombo;
    CBSUBCUENTA20: TwwDBLookupCombo;
    wwDBLookupCombo51: TwwDBLookupCombo;
    CBSUBCUENTA21: TwwDBLookupCombo;
    wwDBLookupCombo53: TwwDBLookupCombo;
    wwDBLookupCombo55: TwwDBLookupCombo;
    DBCheckBox7: TDBCheckBox;
    CBSUBCUENTA39: TwwDBLookupCombo;
    wwDBLookupCombo35: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label50: TLabel;
    DBText23: TDBText;
    CBSUBCUENTA22: TwwDBLookupCombo;
    wwDBLookupCombo57: TwwDBLookupCombo;
    CBSUBCUENTA23: TwwDBLookupCombo;
    wwDBLookupCombo59: TwwDBLookupCombo;
    wwDBLookupCombo61: TwwDBLookupCombo;
    TabSheetCierreEjercicio: TTabSheet;
    GroupBox12: TGroupBox;
    Label62: TLabel;
    GroupBox14: TGroupBox;
    Label63: TLabel;
    Label77: TLabel;
    DBText29: TDBText;
    DBText30: TDBText;
    wwDBLookupCombo16: TwwDBLookupCombo;
    wwDBLookupCombo18: TwwDBLookupCombo;
    GroupBox15: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    DBText31: TDBText;
    DBText32: TDBText;
    wwDBLookupCombo62: TwwDBLookupCombo;
    wwDBLookupCombo64: TwwDBLookupCombo;
    CBSUBCUENTA29: TwwDBLookupCombo;
    wwDBLookupCombo17: TwwDBLookupCombo;
    TabSheetDocumentos: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    PermSPClientes: TSpeedButton;
    PermSPProveedor: TSpeedButton;
    PermSP347: TSpeedButton;
    OvcDbPictureField5: TDBEdit;
    OvcDbPictureField7: TDBEdit;
    OvcDbPictureField8: TDBEdit;
    CBImprimir: TDBCheckBox;
    DSFichero: TDataSource;
    BtnCancel: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnEdit: TSpeedButton;
    RadioGroupMONEDA: TDBRadioGroup;
    RadioGroupTIPOEMPRESA: TDBRadioGroup;
    BtnFECHA_INICIO_EJERCICIO: TSpeedButton;
    BtnFECHA_FIN_EJERCICIO: TSpeedButton;
    BtnFECHAAMORTIZACION: TSpeedButton;
    BtnFECHABLOQUEO: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PermSPClientesClick(Sender: TObject);
    procedure PermSPProveedorClick(Sender: TObject);
    procedure PermSP347Click(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
   private
   public
   end;

var WParametrizacion: TWParametrizacion;

implementation
uses DM, DMConta, General, Globales, InfAsientos, ststrs, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWParametrizacion.FormCreate(Sender: TObject);
begin
   ModeList.Add(TComponentMode.Create(EditNOMBREFISCAL                   , fmEdit));
   ModeList.Add(TComponentMode.Create(EditSIGLAVIA                       , fmEdit));
   ModeList.Add(TComponentMode.Create(EditDIRECCION                      , fmEdit));
   ModeList.Add(TComponentMode.Create(EditCODPOSTAL                      , fmEdit));
   ModeList.Add(TComponentMode.Create(EditPOBLACION                      , fmEdit));
   ModeList.Add(TComponentMode.Create(EditCONTACTO                       , fmEdit));
   ModeList.Add(TComponentMode.Create(EditCODADMON                       , fmEdit));
   ModeList.Add(TComponentMode.Create(EditCCC                            , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFECHA_INICIO_EJERCICIO         , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFECHA_FIN_EJERCICIO            , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFECHAAMORTIZACION              , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFECHABLOQUEO                   , fmEdit));
   ModeList.Add(TComponentMode.Create(EditNIF                            , fmEdit));
   ModeList.Add(TComponentMode.Create(RadioGroupTIPOEMPRESA              , fmEdit));
   ModeList.Add(TComponentMode.Create(RadioGroupMONEDA                   , fmEdit));
   ModeList.Add(TComponentMode.Create(EditNUMEROCALLE                    , fmEdit));
   ModeList.Add(TComponentMode.Create(EditESCALERA                       , fmEdit));
   ModeList.Add(TComponentMode.Create(EditPISO                           , fmEdit));
   ModeList.Add(TComponentMode.Create(EditPUERTA                         , fmEdit));
   ModeList.Add(TComponentMode.Create(EditPROVINCIA                      , fmEdit));
   ModeList.Add(TComponentMode.Create(EditTELEFONO                       , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFAX                            , fmEdit));
   ModeList.Add(TComponentMode.Create(EditLONGITUD_SUBCUENTAS            , fmEdit));
   ModeList.Add(TComponentMode.Create(EditAsiento                        , fmEdit));
   ModeList.Add(TComponentMode.Create(EditFILTROSUCUENTAS                , fmEdit));
   ModeList.Add(TComponentMode.Create(EditASIENTOS_INICIO_INTERVALO_BQDA , fmEdit));
   ModeList.Add(TComponentMode.Create(EditASIENTOS_FIN_INTERVALO_BQDA    , fmEdit));
   ModeList.Add(TComponentMode.Create(EditASIENTO_INICIO_INTERVALO_FILTRO, fmEdit));
   ModeList.Add(TComponentMode.Create(EditASIENTO_FIN_INTERVALO_FILTRO   , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxRECARGO                    , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxACTCOMENTARIO              , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxGESTIONA_CARTERA_EFECTOS   , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxINCLUIR_ABREV              , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxTRATASERIE                 , fmEdit));
   ModeList.Add(TComponentMode.Create(RadioGroupBUSQUEDA_SUBCTAS         , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxMOSTRAR_FILTRO_MAYOR       , fmEdit));
   ModeList.Add(TComponentMode.Create(CheckBoxFILTRO_ASIENTOS_INICIO     , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnEdit                            , fmView));
   ModeList.Add(TComponentMode.Create(BtnAccept                          , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnCancel                          , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnFECHA_INICIO_EJERCICIO          , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnFECHA_FIN_EJERCICIO             , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnFECHAAMORTIZACION               , fmEdit));
   ModeList.Add(TComponentMode.Create(BtnFECHABLOQUEO                    , fmEdit));

   Mode := fmView;

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

   CBSUBCUENTA18.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA19.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA20.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA21.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA22.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA23.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA29.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA39.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   //FView.
   AppleIcons := [aiClose];
   //FView.
   AppleIconsVisibles := [aiClose];

end;

procedure TWParametrizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //if DMRef.QParametros.State = dsBrowse then begin
   //   Action := caFree;
   //   WParametrizacion := nil;
   //end
   //else begin
   //   MessageBeep(0);
   //   Abort;
   //end;
end;

procedure TWParametrizacion.FormShow(Sender: TObject);
begin
   //SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   DMRef.QParametros.Close;
   DMRef.QParametros.Open;

   DMRef.QProvinciasNom.Close;
   DMRef.QProvinciasNom.Open;

   //DMRef.QParametros.Regenerar := True;
   //FIbQueryRefresh(DMRef.QParametros);
   if not (DMRef.QParametros.State in dsEditModes) then begin
      DMRef.QParametros.Edit;
   end;

   {if not (DmControlRef.QControl.State in dsEditModes) then begin
      DmControlRef.QControl.Edit;
   end;}

   EditNombreFiscal.SetFocus;
end;

procedure TWParametrizacion.PermSPClientesClick(Sender: TObject);
begin
   OpenDialog.Title      := 'SELECCIONE CARTA DE RECLAMACION A CLIENTES';
   OpenDialog.InitialDir := gvDirectorio;
   OpenDialog.Execute;
   DMRef.QParametros.FieldByName('DocCliente').AsString := OpenDialog.Filename;
end;

procedure TWParametrizacion.PermSPProveedorClick(Sender: TObject);
begin
   OpenDialog.Title      := 'SELECCIONE CARTA DE PAGOS A PROVEEDORES';
   OpenDialog.InitialDir := gvDirectorio;
   OpenDialog.Execute;
   DMRef.QParametros.FieldByName('DocProveedor').AsString := OpenDialog.Filename;
end;

procedure TWParametrizacion.PermSP347Click(Sender: TObject);
begin
   OpenDialog.Title      := 'SELECCIONE CARTA DE OPERACIONES CON TERCEROS (347)';
   OpenDialog.InitialDir := gvDirectorio;
   OpenDialog.Execute;
   DMRef.QParametros.FieldByName('Doc347').AsString := OpenDialog.Filename;
end;

procedure TWParametrizacion.BtnAceptarClick(Sender: TObject);
var nPoscoma :Cardinal;
begin
   Mode := fmView;

(*
   Perform(wm_NextDlgCtl, 0, 0);
   StrStPosS(DmRef.QParametros.FieldByName('NOMBREFISCAL').AsString, ',', nPosComa);
   if (DmRef.QParametros.FieldByName('TIPOEMPRESA').AsString = 'F') and (nPoscoma = 0) then begin
      DatabaseError('Debe poner una coma entre los apellidos y nombre (Ej.- Apellido Apellido, Nombre).');
   end;

   try
      DMRef.QParametros.Post;
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

   gvNombreEmpresa := DmRef.QParametros.FieldByName('NombreFiscal').AsString;
   Modo(Self, Naveg);
   Close;
*)
end;

procedure TWParametrizacion.BtnCancelarClick(Sender: TObject);
begin
   Mode := fmView;
   //Perform(wm_NextDlgCtl, 0, 0);

   //if not(DMRef.QParametros.Modified {or DmControlRef.QControl.Modified}) then Exit;
   //
   //if MessageDlg('¿Quiere anular las modificaciones realizadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
   //   try DMRef.QParametros.Cancel;
   //       {DmControlRef.QControl.Cancel;}
   //   except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
   //   end;
   //   Modo(Self, Naveg);
   //   Close;
   //end;
end;

procedure TWParametrizacion.BtnEditClick(Sender: TObject);
begin
   Mode := fmEdit;
end;

procedure TWParametrizacion.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := Mode = fmView;

end;

end.
