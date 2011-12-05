unit UGeneracionAsiento;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages, OvcBase,
     ovcdbnf, OvcEF, OvcNF, OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, Wwdatsrc,
     Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot, Wwkeycb, wwSpeedButton;
type
   TWGeneracionAsiento = class(TForm)
      OvcController1:  TOvcController;
      Datos:           TGroupBox;
      Shape1:          TShape;
      lTitulo:         TLabel;
      fcIBCerrar:      TfcImageBtn;
      Panel3:          TPanel;
      Panel4:          TPanel;
      Panel5:          TPanel;
      BtnEdtProcesar:  TfcImageBtn;
      BtnEdtCancelar:  TfcImageBtn;
      SFichero:        TwwDataSource;
      QFichero:        TClientDataSet;
      QFicheroSITUACION: TStringField;
      Label7:          TLabel;
      Label9:          TLabel;
      Label10:         TLabel;
      eSituacion:      TwwDBComboBox;
      eBanco:          TwwDBLookupCombo;
      eDescBanco:      TwwDBLookupCombo;
      eFechaAsiento:   TwwDBDateTimePicker;
      oBorrarVencimientos: TCheckBox;
      QFicheroFASIENTO: TDateTimeField;
      QFicheroSUBCTABANCO: TStringField;
      eDescConcepto:   TwwDBLookupCombo;
      eConcepto:       TwwDBLookupCombo;
      Label1:          TLabel;
      QFicheroID_CONCEPTOS: TVarBytesField;
      Label6:          TLabel;
      eImporte:        TOvcDbNumericField;
      QFicheroIMPORTE: TFloatField;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
   private
   public
      ImporteAsiento: Double;
   end;

var WGeneracionAsiento: TWGeneracionAsiento;

implementation
uses DM, General, Globales, UCarteraEfectos, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWGeneracionAsiento.BtnEdtProcesarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);

   if QFicheroSUBCTABANCO.AsString = '' then  begin
      eBanco.SetFocus;
      DatabaseError('La subcuenta del banco está en blanco.');
   end;
   if QFicheroID_CONCEPTOS.AsString = '' then  begin
      eConcepto.SetFocus;
      DatabaseError('El concepto está en blanco.');
   end;
   if QFicheroFASIENTO.IsNull then  begin
      eFechaAsiento.SetFocus;
      DatabaseError('La fecha de asiento está en blanco.');
   end;
   if QFicheroSITUACION.AsString = '' then  begin
      eSituacion.SetFocus;
      DatabaseError('La situación está en blanco.');
   end;

   WCarteraEfectos.FSituacion    := QFicheroSITUACION.AsString;
   WCarteraEfectos.FSubctaBanco  := QFicheroSUBCTABANCO.AsString;
   WCarteraEfectos.FFechaAsiento := QFicheroFASIENTO.AsDateTime;
   WCarteraEfectos.FConcepto     := QFicheroID_CONCEPTOS.AsString;
   WCarteraEfectos.FBorrarVtos   := oBorrarVencimientos.Checked;

   Close;
end;

procedure TWGeneracionAsiento.BtnEdtCancelarClick(Sender: TObject);
begin
   WCarteraEfectos.FSituacion    := '';
   WCarteraEfectos.FSubctaBanco  := '';
   WCarteraEfectos.FFechaAsiento := 0;
   WCarteraEfectos.FConcepto     := '';

   Close;
end;

procedure TWGeneracionAsiento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWGeneracionAsiento.FormShow(Sender: TObject);
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SUBCTABANCO', ftString, 10, False);
         Add('FASIENTO', ftDateTime, 0, False);
         Add('SITUACION', ftString, 1, False);
         Add('ID_CONCEPTOS', ftVarBytes, 3, False);
         Add('SCTAEFECTDESCONTADOS', ftString, 10, False);
         Add('SCTADEUDASDESCUENTOS', ftString, 10, False);
         Add('IMPORTE', ftFloat, 0, False);
      end;
      CreateDataset;
      Open;
      append;
   end;

   QFicheroSITUACION.AsString    := 'B';
   QFicheroFASIENTO.AsDateTime   := Date;
   QFicheroIMPORTE.AsFloat       := ImporteAsiento;
   QFicheroSUBCTABANCO.AsString  := DMRef.QParametros.FieldByName('SCTAREMESAEFECTOS').AsString;
   QFicheroID_CONCEPTOS.AsString := DMRef.QParametros.FieldByName('CTOREMESAEFECTOS').AsString;

   eBanco.SetFocus;
end;

procedure TWGeneracionAsiento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtCancelar.Click;
      end;
      VK_F3: begin
         BtnEdtProcesar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBLookupCombo) and not (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
         end;
      end;
      VK_DOWN: begin
         if not (ActiveControl is TwwDBDateTimePicker) and not
            (ActiveControl is TwwDBLookupCombo) and not (ActiveControl is TwwDBComboBox) then
         begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBLookupCombo) and not
            (TwwDBLookupCombo(ActiveControl).DataSource.State in dsEditModes) then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end
         else
         if (ActiveControl is TwwDBComboBox) and not
            (TwwDBComboBox(ActiveControl).DataSource.State in dsEditModes) and not
            (Copy(UpperCase(Trim(ActiveControl.Name)), 1, 7) = 'FILTROB') then   begin
            SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
         end;
      end;
   end;
end;

procedure TWGeneracionAsiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario         := nil;
   WGeneracionAsiento := nil;
end;

procedure TWGeneracionAsiento.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWGeneracionAsiento.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
