unit UParametrizacion;
interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DBCtrls, ExtCtrls,
     DB, IBCustomDataSet, wwSpeedButton, Buttons, ComCtrls, jpeg, IBSQL, fcImgBtn, fcButton,
     OvcBase, IBDatabase, IBTableSet, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, OvcEF, OvcPB, OvcNF,
     OvcDbNF, OvcNbk, Wwdbgrid, OvcCmbx, OvcPrCbx, OvcDlg, OvcRvPDg, wwdbdatetimepicker, StBrowsr, OvcPF,
     OvcDbPF, DBClient, fcImage, fcimageform, SsBase, CustomView,
     ccResButton;
type
   TWParametrizacion = class(TCustomView)
      Label2:           TLabel;
      Shape1:           TShape;
      Panel5:           TPanel;
      Panel3:           TPanel;
      Panel4:           TPanel;
    fcIBCerrar: TSpeedButton;
      DSFichero:        TDataSource;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      OpenDialog:       TOpenDialog;
      Label89:          TLabel;
      DSControl:        TDataSource;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
    PnlBtn: TPanel;
    BtnCancelar: TBitBtn;
    BtnAceptar: TBitBtn;
    BtnEdit: TBitBtn;
    PageControl: TPageControl;
    TabSheetGeneral: TTabSheet;
    TabSheetNominas: TTabSheet;
    TabSheetCierreEjercicio: TTabSheet;
    TabSheetDocumentos: TTabSheet;
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
    Label20: TLabel;
    Label74: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EditNombreFiscal: TDBEdit;
    EditNIF: TDBEdit;
    CampoDireccion: TDBEdit;
    CampoCodPostal: TDBEdit;
    CampoPoblacion: TDBEdit;
    DBLookupComboProvincia: TwwDBLookupCombo;
    OvcDbPictureField2: TDBEdit;
    OvcDbPictureField3: TDBEdit;
    OvcDbPictureField6: TDBEdit;
    eAsiento: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    eLongSubcuenta: TDBEdit;
    eMoneda: TwwDBComboBox;
    GroupBox2: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    eFechaInicioEjer: TwwDBDateTimePicker;
    eFechaFinEjer: TwwDBDateTimePicker;
    eFechaInicio: TwwDBDateTimePicker;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    OvcDbPictureField1: TDBEdit;
    OvcDbPictureField4: TDBEdit;
    OvcDbPictureField9: TDBEdit;
    OvcDbPictureField10: TDBEdit;
    OvcDbPictureField11: TDBEdit;
    OvcDbPictureField12: TDBEdit;
    OvcDbPictureField13: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    GroupBox16: TGroupBox;
    Label76: TLabel;
    Label80: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    eAsientosInicio: TDBEdit;
    eAsientosFin: TDBEdit;
    OvcDbNumericField3: TDBEdit;
    OvcDbNumericField4: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    eTipoEmpresa: TwwDBComboBox;
    eFiltroSubctas: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
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
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnMouseEnter(Sender: TObject);
      procedure BtnMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure PermSPClientesClick(Sender: TObject);
      procedure PermSPProveedorClick(Sender: TObject);
      procedure PermSP347Click(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
   private
   public
   end;

var WParametrizacion: TWParametrizacion;

implementation
uses DM, DMConta, General, Globales, InfAsientos, ststrs, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWParametrizacion.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWParametrizacion.FormCreate(Sender: TObject);
begin
   CDSFiltro.Active := False;
   CDSFiltro.FieldDefs.Clear;
   CDSFiltro.FieldDefs.Add('Asiento'   , ftInteger, 0, False);
   CDSFiltro.FieldDefs.Add('AsientoOld', ftInteger, 0, False);
   CDSFiltro.CreateDataSet;
   CDSFiltro.Active := True;
   CDSFiltro.Append;
   CDSFiltro.FieldByName('asiento').AsInteger    := DmContaRef.Dame_contador('asiento');
   CDSFiltro.FieldByName('asientoOld').AsInteger := CDSFiltro.FieldByName('Asiento').AsInteger;

   CBSUBCUENTA18.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA19.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA20.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA21.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA22.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA23.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA29.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA39.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   Modo(Self, Edita);
end;

procedure TWParametrizacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then begin
      // Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWParametrizacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if DMRef.QParametros.State in dsEditModes then begin
            BtnCancelar.Click;
         end;
      end;
      VK_F3: begin
         if DMRef.QParametros.State in dsEditModes then begin
            BtnAceptar.Click;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWParametrizacion.BtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWParametrizacion.BtnMouseLeave(Sender: TObject);
begin
   //(Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWParametrizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DMRef.QParametros.State = dsBrowse then begin
      Action := caFree;
      Formulario.Free;
      Formulario       := nil;
      WParametrizacion := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWParametrizacion.FormShow(Sender: TObject);
begin
   //SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   DMRef.QParametros.Close;
   DMRef.QParametros.Open;
   //DMRef.QParametros.Regenerar := True;
   //FIbQueryRefresh(DMRef.QParametros);
   if not (DMRef.QParametros.State in dseditmodes) then begin
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
   Perform(wm_NextDlgCtl, 0, 0);
   StrStPosS(DmRef.QParametros.FieldByName('NombreFiscal').AsString, ',', nPosComa);
   if (DmRef.QParametros.FieldByName('Tipoempresa').AsString = 'F') and (nPoscoma = 0) then begin
      DatabaseError('Debe poner una coma entre los apellidos y nombre (Ej.- Navarro,Angel Luis).');
   end;

   try
      DMRef.QParametros.Post;
      //DmControlRef.QControl.Post;
      //DmControlRef.QControl.Transaction.CommitRetaining;
   except
      DatabaseError('Error al guardar los datos');
   end;
   if (CdsFiltro.FieldByName('AsientoOld').AsInteger <> CdsFiltro.FieldByName('Asiento').AsInteger) then begin
      // Actualizar contadores
      DmContaRef.Actualizar_contador('asiento',
         CdsFiltro.FieldByName('asiento').AsInteger);
   end;
   gvNombreEmpresa := DmRef.QParametros.FieldByName('NombreFiscal').AsString;
   Modo(Self, Naveg);
   Close;
end;

procedure TWParametrizacion.BtnCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not(DMRef.QParametros.Modified {or DmControlRef.QControl.Modified}) then Exit;

   if MessageDlg('¿Quiere anular las modificaciones realizadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DMRef.QParametros.Cancel;
          {DmControlRef.QControl.Cancel;}
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
      Close;
   end;
end;

end.
