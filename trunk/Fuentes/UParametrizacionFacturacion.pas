unit UParametrizacionFacturacion;
interface
uses Buttons, Windows, SysUtils, Messages, ovcbase, DB, fcButton, fcImgBtn, ExtCtrls, ovcef, ovcpb, ovcnf,
     ovcdbnf, StdCtrls, DBCtrls, wwdblook, Controls, ovcnbk, Graphics, fcImage, fcimageform, Classes,
     Forms, wwdbgrid;
type
   TWParametrizacionFacturacion = class(TForm)
      Paginas:          TOvcNotebook;
      Label2:           TLabel;
      Shape1:           TShape;
      OvcController1:   TOvcController;
      Panel5:           TPanel;
      Panel3:           TPanel;
      Panel4:           TPanel;
      fcIBCerrar:       TfcImageBtn;
      DSFichero:        TDataSource;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtCancelar:   TfcImageBtn;
      GroupBox4:        TGroupBox;
      Label22:          TLabel;
      Label23:          TLabel;
      Label24:          TLabel;
      Label29:          TLabel;
      CBSUBCUENTA11:    TwwDBLookupCombo;
      CBDESCSUBCUENTA11: TwwDBLookupCombo;
      CBSUBCUENTA12:    TwwDBLookupCombo;
      CBDESCSUBCUENTA12: TwwDBLookupCombo;
      CBSUBCUENTA13:    TwwDBLookupCombo;
      CBDESCSUBCUENTA13: TwwDBLookupCombo;
      CBSUBCUENTA14:    TwwDBLookupCombo;
      CBDESCSUBCUENTA14: TwwDBLookupCombo;
      Label27:          TLabel;
      Label28:          TLabel;
      wwDBLookupCombo28: TwwDBLookupCombo;
      eDescConcepto:    TwwDBLookupCombo;
      wwDBLookupCombo11: TwwDBLookupCombo;
      Label30:          TLabel;
      Label34:          TLabel;
      Label35:          TLabel;
      wwDBLookupCombo30: TwwDBLookupCombo;
      CBSUBCUENTA15:    TwwDBLookupCombo;
      CBDESCSUBCUENTA15: TwwDBLookupCombo;
      PaginasVentas:    TOvcNotebook;
      GroupBox6:        TGroupBox;
      Label7:           TLabel;
      Label11:          TLabel;
      Label12:          TLabel;
      CBDESCSUBCUENTA8: TwwDBLookupCombo;
      CBDESCSUBCUENTA7: TwwDBLookupCombo;
      eSubctaVentasCorredorDesc: TwwDBLookupCombo;
      CBSUBCUENTA7:     TwwDBLookupCombo;
      CBSUBCUENTA8:     TwwDBLookupCombo;
      Label6:           TLabel;
      Label10:          TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      CBSUBCUENTA1:     TwwDBLookupCombo;
      Label14:          TLabel;
      Label15:          TLabel;
      wwDBLookupCombo4: TwwDBLookupCombo;
      wwDBLookupCombo5: TwwDBLookupCombo;
      CBSUBCUENTA2:     TwwDBLookupCombo;
      Label16:          TLabel;
      wwDBLookupCombo7: TwwDBLookupCombo;
      Label4:           TLabel;
      wwDBLookupCombo9: TwwDBLookupCombo;
      CBSUBCUENTA3:     TwwDBLookupCombo;
      Label32:          TLabel;
      wwDBLookupCombo15: TwwDBLookupCombo;
      Label33:          TLabel;
      wwDBLookupCombo23: TwwDBLookupCombo;
      CBSUBCUENTA4:     TwwDBLookupCombo;
      Label42:          TLabel;
      wwDBLookupCombo26: TwwDBLookupCombo;
      Label47:          TLabel;
      wwDBLookupCombo34: TwwDBLookupCombo;
      CBSUBCUENTA5:     TwwDBLookupCombo;
      Label51:          TLabel;
      wwDBLookupCombo36: TwwDBLookupCombo;
      Label52:          TLabel;
      wwDBLookupCombo37: TwwDBLookupCombo;
      GroupBox5:        TGroupBox;
      Label56:          TLabel;
      Label57:          TLabel;
      Label59:          TLabel;
      Label61:          TLabel;
      Label64:          TLabel;
      Label65:          TLabel;
      wwDBLookupCombo39: TwwDBLookupCombo;
      wwDBLookupCombo40: TwwDBLookupCombo;
      CBSUBCUENTA6:     TwwDBLookupCombo;
      wwDBLookupCombo43: TwwDBLookupCombo;
      wwDBLookupCombo44: TwwDBLookupCombo;
      CBSUBCUENTA9:     TwwDBLookupCombo;
      wwDBLookupCombo46: TwwDBLookupCombo;
      wwDBLookupCombo47: TwwDBLookupCombo;
      wwDBLookupCombo48: TwwDBLookupCombo;
      GroupBox1:        TGroupBox;
      Label36:          TLabel;
      Label53:          TLabel;
      Label54:          TLabel;
      Label55:          TLabel;
      wwDBLookupCombo8: TwwDBLookupCombo;
      wwDBLookupCombo22: TwwDBLookupCombo;
      wwDBLookupCombo29: TwwDBLookupCombo;
      CBSUBCUENTA10:    TwwDBLookupCombo;
      wwDBLookupCombo32: TwwDBLookupCombo;
      CBSUBCUENTA16:    TwwDBLookupCombo;
      Label25:          TLabel;
      wwDBLookupCombo13: TwwDBLookupCombo;
      Label26:          TLabel;
      Label31:          TLabel;
      wwDBLookupCombo20: TwwDBLookupCombo;
      wwDBLookupCombo24: TwwDBLookupCombo;
      CBSUBCUENTA17:    TwwDBLookupCombo;
      Label45:          TLabel;
      wwDBLookupCombo38: TwwDBLookupCombo;
      GroupBox9:        TGroupBox;
      Label8:           TLabel;
      Label13:          TLabel;
      Label58:          TLabel;
      Label66:          TLabel;
      CBSUBCUENTA24:    TwwDBLookupCombo;
      wwDBLookupCombo86: TwwDBLookupCombo;
      wwDBLookupCombo88: TwwDBLookupCombo;
      CBSUBCUENTA25:    TwwDBLookupCombo;
      wwDBLookupCombo90: TwwDBLookupCombo;
      wwDBLookupCombo92: TwwDBLookupCombo;
      GroupBox10:       TGroupBox;
      Label67:          TLabel;
      Label68:          TLabel;
      Label69:          TLabel;
      Label70:          TLabel;
      Label71:          TLabel;
      Label72:          TLabel;
      CBSUBCUENTA26:    TwwDBLookupCombo;
      wwDBLookupCombo94: TwwDBLookupCombo;
      wwDBLookupCombo96: TwwDBLookupCombo;
      CBSUBCUENTA27:    TwwDBLookupCombo;
      wwDBLookupCombo98: TwwDBLookupCombo;
      wwDBLookupCombo100: TwwDBLookupCombo;
      OvcDbNumericField1: TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      Label73:          TLabel;
      Label75:          TLabel;
      CBSUBCUENTA28:    TwwDBLookupCombo;
      wwDBLookupCombo118: TwwDBLookupCombo;
      wwDBLookupCombo124: TwwDBLookupCombo;
      Label89:          TLabel;
      Label83:          TLabel;
      wwDBLookupCombo6: TwwDBLookupCombo;
      Label93:          TLabel;
      Label94:          TLabel;
      wwDBLookupCombo12: TwwDBLookupCombo;
      CBSUBCUENTA33:    TwwDBLookupCombo;
      wwDBLookupCombo21: TwwDBLookupCombo;
      CBSUBCUENTA34:    TwwDBLookupCombo;
      Label95:          TLabel;
      CBSUBCUENTA32:    TwwDBLookupCombo;
      wwDBLookupCombo31: TwwDBLookupCombo;
      Label96:          TLabel;
      CBSUBCUENTA35:    TwwDBLookupCombo;
      wwDBLookupCombo25: TwwDBLookupCombo;
      DBText1:          TDBText;
      DBText2:          TDBText;
      DBText3:          TDBText;
      DBText4:          TDBText;
      DBText5:          TDBText;
      DBText6:          TDBText;
      DBText7:          TDBText;
      DBText8:          TDBText;
      DBText9:          TDBText;
      DBText10:         TDBText;
      DBText11:         TDBText;
      DBText12:         TDBText;
      DBText13:         TDBText;
      DBText14:         TDBText;
      DBText15:         TDBText;
      DBText16:         TDBText;
      DBText17:         TDBText;
      DBText18:         TDBText;
      DBText19:         TDBText;
      DBText20:         TDBText;
      DBText21:         TDBText;
      DBText24:         TDBText;
      DBText25:         TDBText;
      DBText26:         TDBText;
      DBText27:         TDBText;
      DBText28:         TDBText;
      Label97:          TLabel;
      Label98:          TLabel;
      Label99:          TLabel;
      wwDBLookupCombo14: TwwDBLookupCombo;
      CBSUBCUENTA36:    TwwDBLookupCombo;
      wwDBLookupCombo33: TwwDBLookupCombo;
      CBSUBCUENTA37:    TwwDBLookupCombo;
      wwDBLookupCombo41: TwwDBLookupCombo;
      CBSUBCUENTA38:    TwwDBLookupCombo;
      Panel1:           TPanel;
      Label101:         TLabel;
      CBSUBCUENTA40:    TwwDBLookupCombo;
      wwDBLookupCombo42: TwwDBLookupCombo;
      Label102:         TLabel;
      wwDBLookupCombo27: TwwDBLookupCombo;
      DBText33:         TDBText;
      Label103:         TLabel;
      wwDBLookupCombo45: TwwDBLookupCombo;
      DBText34:         TDBText;
      GroupBox2:        TGroupBox;
      Label9:           TLabel;
      Label17:          TLabel;
      Label37:          TLabel;
      DBText23:         TDBText;
      DBText31:         TDBText;
      wwDBLookupCombo17: TwwDBLookupCombo;
      CBSUBCUENTA18:    TwwDBLookupCombo;
      wwDBLookupCombo53: TwwDBLookupCombo;
      wwDBLookupCombo58: TwwDBLookupCombo;
      CBSUBCUENTA39:    TwwDBLookupCombo;
      Label1:           TLabel;
      wwDBLookupCombo35: TwwDBLookupCombo;
      Label81:          TLabel;
      CBSUBCUENTA30:    TwwDBLookupCombo;
      wwDBLookupCombo3: TwwDBLookupCombo;
      Label82:          TLabel;
      CBSUBCUENTA31:    TwwDBLookupCombo;
      wwDBLookupCombo10: TwwDBLookupCombo;
      Label3:           TLabel;
      DBText22:         TDBText;
      wwDBLookupCombo16: TwwDBLookupCombo;
      DBCheckBox1:      TDBCheckBox;
      DBCheckBox2:      TDBCheckBox;
      Formulario:       TfcImageForm;
      procedure BtnNavCerrarClick(Sender: TObject);
      procedure fcIBCerrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnMouseEnter(Sender: TObject);
      procedure BtnMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private
   public
   end;

var WParametrizacionFacturacion: TWParametrizacionFacturacion;

implementation
uses Dialogs, General, Globales, DM, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWParametrizacionFacturacion.BtnNavCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWParametrizacionFacturacion.fcIBCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TWParametrizacionFacturacion.FormCreate(Sender: TObject);
begin
   ActivarTransacciones(Self);

   CBSUBCUENTA1.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA2.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA3.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA4.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA5.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA6.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA7.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA8.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA9.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA10.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA11.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA12.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA13.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA14.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA15.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA16.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA17.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA18.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA24.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA25.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA26.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA27.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA28.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA30.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA31.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA32.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA33.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA34.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA35.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA36.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA37.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA38.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA39.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTA40.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;

   Modo(Self, Edita);
end;

procedure TWParametrizacionFacturacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter y el control actual no es un grid pasamos al siguiente
   // control
   if (Key = Chr(VK_RETURN)) then  begin
      // Pasamos al siguiente control
      if (not (ActiveControl is TwwDBGrid)) then   begin
         Key := #0;
         SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
      end;
   end;
end;

procedure TWParametrizacionFacturacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         if DMRef.QParametros.State in dsEditModes then   begin
            BtnEdtCancelar.Click;
         end;
      end;
      VK_F3: begin
         if DMRef.QParametros.State in dsEditModes then   begin
            BtnEdtAceptar.Click;
         end;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBGrid) and not (ActiveControl is TwwDBLookupCombo) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
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
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWParametrizacionFacturacion.BtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWParametrizacionFacturacion.BtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWParametrizacionFacturacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DMRef.QParametros.State = dsBrowse then  begin
      Action := caFree;
      Formulario.Free;
      Formulario := nil;
      WParametrizacionFacturacion := nil;
   end
   else begin
      MessageBeep(0);
      Abort;
   end;
end;

procedure TWParametrizacionFacturacion.BtnEdtAceptarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   try
      DMRef.QParametros.Post;
      DMRef.QParametros.Transaction.CommitRetaining;
   except
      DatabaseError('Error al guardar los datos');
   end;
   Modo(Self, Naveg);
   Close;
end;

procedure TWParametrizacionFacturacion.BtnEdtCancelarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if not DMRef.QParametros.Modified then Exit;

   if MessageDlg('¿Quiere anular las modificaciones realizadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try    DMRef.QParametros.Cancel;
      except DatabaseError('No se ha podido cancelar la operación.' + #13 + CADENA_MANUAL);
      end;
      Modo(Self, Naveg);
      Close;
   end;
end;

procedure TWParametrizacionFacturacion.FormShow(Sender: TObject);
begin
   SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);

   DMRef.QParametros.Close;
   DMRef.QParametros.Regenerar := True;
   FIbQueryRefresh(DMRef.QParametros);
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with DMRef.QParametros do begin
      if not (state in dseditmodes) then begin
         edit;
      end;
   end;
end;

end.
