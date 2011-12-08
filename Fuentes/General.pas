unit General;
interface
uses Buttons, Classes, ComCtrls, Controls, db, dbCtrls, Forms, IBTableSet, StdCtrls, SysUtils,
     wwdbdatetimepicker, UMensaje;

type TModo        = (Naveg, Edita);
     TTipoMensaje = (UnBoton, DosBotones);

var MascaraImportes, MascaraImportesORPHEUS: String;

procedure PonerTipoConta(TipoConcepto: String);
procedure ActivarTransacciones(Ventana: TForm);
procedure CargaImagenesMensaje(Mensaje: TMensaje);
procedure FibQueryOpen(Query: TIBTableSet; select: String);
procedure FIbQueryRefresh(Query: TIBTableSet);
procedure Modo(Formulario: TForm; Modo: TModo);
procedure QueryOpen(Query: TIBTableSet; select: String);
procedure Moneda(Formulario: TForm; Moneda: String);
function ConversionImporte(Importe: Double; MonedaActual, MonedaFinal: String): Double;
function RoundToDecimal(Value :Extended; Places :Integer; Bankers :Boolean):Extended;
  {-Rounds a real value to the specified number of decimal places}
{--- Funciones de clipper ---}
function Empty(prmCadena :string):Boolean;
function Year (prmDate :TDateTime):Integer;
function Month(prmDate :TDateTime):Integer;
function Day  (prmDate :TDateTime):Integer;
function Replicate(prmChar :Char; prmLength :Integer):string;
function PadR(prmString :string; prmLength :Integer):string;
function Space(prmLength :Integer):string;

function CMonth(prmDate :TDateTime):string;

implementation
uses fcImgBtn, fctreeview, Globales, IBDataBase, IBQuery, NavegadorNotarios, OvcDbDat, OvcNbk, OvcPrCbx,
     ppCtrls, Math, Graphics, OvcDbNF, OvcDbSF, OvcDbPF, TypInfo, wwdbcomb, wwDBEdit, wwdbdlg, Wwdbgrid,
     wwdblook, wwdbspin,wwkeycb, wwRiched;

procedure ActivarTransacciones(Ventana :TForm);
var
   j: Word;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with Ventana do begin
      for j := 0 to (ComponentCount - 1) do begin
         if (Components[j] is TibTransaction) then begin
            TibTransaction(Components[j]).Active := False;
            TibTransaction(Components[j]).Params.Clear;
            TibTransaction(Components[j]).Params.Add('Read_committed');
            TibTransaction(Components[j]).Params.Add('Rec_version');
            TibTransaction(Components[j]).Params.Add('Write');
            TibTransaction(Components[j]).Active := True;
         end;
      end;
   end;
end;

procedure CargaImagenesMensaje(Mensaje: TMensaje);
begin
   Mensaje.Imagenes.Fondo     := gvDirImagenes + 'FormErrores.bmp';
   Mensaje.Imagenes.Si_Arriba := gvDirImagenes + gcMnsBtnSi_Arriba;
   Mensaje.Imagenes.No_Arriba := gvDirImagenes + gcMnsBtnNo_Arriba;
   Mensaje.Imagenes.Ok_Arriba := gvDirImagenes + gcMnsBtnOk_Arriba;
end;

procedure FibQueryOpen(Query :TibTableSet; Select :String);
begin
   Query.Close;
   Query.SelectSql.Text := Select;
   Query.Open;
end;

procedure FIbQueryRefresh(Query: TIbTableSet);
begin
   Query.Close;
   Query.Open;
end;

procedure Modo(Formulario: TForm; Modo: TModo);
var
   i, j: Integer;
begin
   if Formulario <> nil then begin
      case Modo of
         Edita: begin
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Formulario do begin
               for i := 0 to (ComponentCount - 1) do begin
                  if (Components[i] is TGroupBox) then   begin
                     if UpperCase(Copy(TGroupBox(Components[i]).Name, 1, 6)) = 'FILTRO' then begin
                        TGroupBox(Components[i]).Cursor  := crNo;
                        TGroupBox(Components[i]).Enabled := False;
                     end;
                  end;
                  if (Components[i] is Tfctreeview) then   begin
                     Tfctreeview(Components[i]).Color := clWhite;
                  end
                  else
                  if (Components[i] is TSpeedButton) and
                     (UpperCase(Copy(TSpeedButton(Components[i]).Name, 1, 4)) <> 'PERM') then
                  begin
                     TSpeedButton(Components[i]).Visible := False;
                  end
                  else
                  if (Components[i] is TovcDbPictureField) then   begin
                     if (UpperCase(Copy(TovcDbPictureField(Components[i]).Name, 1, 6)) <> 'FILTRO')
                     then   begin
                        TovcDbPictureField(Components[i]).Cursor     := crHandPoint;
                        TovcDbPictureField(Components[i]).Color      := clWhite;
                        TovcDbPictureField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcNoteBook) then   begin
                     for j := 0 to (TOvcNoteBook(Components[i]).PageCount - 1) do
                     begin
                        TOvcNoteBook(Components[i]).Pages[j].PageVisible := TOvcNoteBook(Components[i]).Pages[j].Tag = 1;
                     end;
                  end
                  else
                  if (Components[i] is TovcDbNumericField) then   begin
                     if UpperCase(Copy(TovcDbNumericField(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TovcDbNumericField(Components[i]).Cursor     := crHandPoint;
                        TovcDbNumericField(Components[i]).Color      := clWhite;
                        TovcDbNumericField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TovcDbSimpleField) then   begin
                     if UpperCase(Copy(TovcDbSimpleField(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then
                     begin
                        TovcDbSimpleField(Components[i]).Cursor     := crHandPoint;
                        TovcDbSimpleField(Components[i]).Color      := clWhite;
                        TovcDbSimpleField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBEdit) then   begin
                     if Copy(TwwDBEdit(Components[i]).Name, 1, 8) =
                        'EditNEdt' then begin
                        TwwDBEdit(Components[i]).Visible := True;
                     end;
                     if UpperCase(Copy(TwwDBEdit(Components[i]).Name, 1, 6)) <> 'FILTRO' then begin
                        TwwDBEdit(Components[i]).Cursor     := crHandPoint;
                        TwwDBEdit(Components[i]).Color      := clWhite;
                        TwwDBEdit(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TDBEdit) then   begin
                     if UpperCase(Copy(TDBEdit(Components[i]).Name, 1, 6)) <> 'FILTRO' then
                     begin
                        TDBEdit(Components[i]).Cursor     := crHandPoint;
                        TDBEdit(Components[i]).Color      := clWhite;
                        TDBEdit(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBSpinEdit) then begin
                     TwwDBSpinEdit(Components[i]).Cursor     := crHandPoint;
                     TwwDBSpinEdit(Components[i]).Color      := clWhite;
                     TwwDBSpinEdit(Components[i]).Font.Color := clBlack;
                  end
                  else
                  if (Components[i] is TwwDBLookUpCombo) then begin
                     if Copy(TwwDBLookupCombo(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBLookupCombo(Components[i]).Visible := True;
                     end;
                     if UpperCase(Copy(TwwDBLookUpCombo(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then
                     begin
                        TwwDBLookupCombo(Components[i]).Cursor          := crHandPoint;
                        TwwDBLookupCombo(Components[i]).Color           := clWhite;
                        TwwDBLookupCombo(Components[i]).Grid.Color      := clWhite;
                        TwwDBLookupCombo(Components[i]).Font.Color      := clBlack;
                        TwwDBLookupCombo(Components[i]).Grid.Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcPrinterComboBox) then begin
                     if UpperCase(Copy(TOvcPrinterComboBox(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TOvcPrinterComboBox(Components[i]).Cursor       := crHandPoint;
                        TOvcPrinterComboBox(Components[i]).Color        := clWhite;
                        TOvcPrinterComboBox(Components[i]).Font.Color   := clBlack;
                        TOvcPrinterComboBox(Components[i]).MRUListColor := clWhite;
                        TOvcPrinterComboBox(Components[i]).Enabled      := True;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBDateTimePicker) then begin
                     if UpperCase(Copy(TwwDBDateTimePicker(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TwwDBDateTimePicker(Components[i]).Cursor     := crHandPoint;
                        TwwDBDateTimePicker(Components[i]).Color      := clWhite;
                        TwwDBDateTimePicker(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcDBDateEdit) then begin
                     if UpperCase(Copy(TOvcDBDateEdit(Components[i]).Name, 1, 6)) <> 'FILTRO' then
                     begin
                        TOvcDBDateEdit(Components[i]).Cursor     := crHandPoint;
                        TOvcDBDateEdit(Components[i]).Color      := clWhite;
                        TOvcDBDateEdit(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBLookUpComboDlg) then begin
                     if Copy(TwwDBLookupComboDlg(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBLookupComboDlg(Components[i]).Visible := True;
                     end;
                     if UpperCase(Copy(TwwDBLookUpComboDlg(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TwwDBLookupComboDlg(Components[i]).Cursor          := crHandPoint;
                        TwwDBLookupComboDlg(Components[i]).Color           := clWhite;
                        TwwDBLookupComboDlg(Components[i]).Grid.Color      := clWhite;
                        TwwDBLookupComboDlg(Components[i]).Font.Color      := clBlack;
                        TwwDBLookupComboDlg(Components[i]).Grid.Font.Color := clBlack;
                        TwwDBLookUpComboDlg(Components[i]).AutoDropDown    := True;
                        TwwDBLookUpComboDlg(Components[i]).ShowButton      := True;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBComboBox) then begin
                     if Copy(TwwDBComboBox(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBComboBox(Components[i]).Visible := True;
                     end;
                     TwwDBComboBox(Components[i]).Cursor     := crHandPoint;
                     TwwDBComboBox(Components[i]).Color      := clWhite;
                     TwwDBComboBox(Components[i]).Font.Color := clBlack;
                  end
                  else
                  if (Components[i] is TDBCheckBox) then begin
                     TDBCheckBox(Components[i]).Cursor := crHandPoint;
                  end
                  else
                  if (Components[i] is TwwDBRichEdit) then begin
                     TwwDBRichEdit(Components[i]).Cursor     := crHandPoint;
                     TwwDBRichEdit(Components[i]).Color      := clWhite;
                     TwwDBRichEdit(Components[i]).Font.Color := clBlack;
                  end
                  else
                  if (Components[i] is TDBMemo) then begin
                     TDBMemo(Components[i]).Cursor     := crHandPoint;
                     TDBMemo(Components[i]).Color      := clWhite;
                     TDBMemo(Components[i]).Font.Color := clBlack;
                  end
                  else
                  //=========================
                        {IF (Components[i] IS TEsMenuButton) THEN BEGIN
                           IF Copy(TEsMenuButton(Components[i]).Name,1,6) = 'BtnEdt'
                              THEN TEsMenuButton(Components[i]).Visible := True
                              ELSE TEsMenuButton(Components[i]).Visible := False;
                        END ELSE}
                  if (Components[i] is TLabel) then begin
                     if Copy(TLabel(Components[i]).Name, 1, 5) =
                        'LbNav' then begin
                        TLabel(Components[i]).Visible := False;
                     end;
                     if Copy(TLabel(Components[i]).Name, 1, 8) =
                        'LabelEdt' then begin
                        TLabel(Components[i]).Visible := True;
                     end;
                  end
                  else
                  if (Components[i] is TCheckBox) then begin
                     if Copy(TCheckBox(Components[i]).Name, 1, 5) =
                        'CbNav' then begin
                        TCheckBox(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TAnimate) then begin
                     if Copy(TAnimate(Components[i]).Name, 1, 3) =
                        'Nav' then begin
                        TAnimate(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TfcImageBtn) then begin
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 7) =
                        'BtnPerm' then begin
                        TfcImageBtn(Components[i]).Visible := True;
                     end
                     else
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 6) = 'BtnNav' then   begin
                        TfcImageBtn(Components[i]).Visible := False;
                     end
                     else
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 6) = 'BtnEdt' then begin
                        TfcImageBtn(Components[i]).Visible := True;
                     end
                     else begin
                        TfcImageBtn(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TDBNavegadorNotarios) then begin
                     TDBNavegadorNotarios(Components[i]).Visible := False;
                  end
                  else
                  if (Components[i] is TwwIncrementalSearch) then begin
                     TwwIncrementalSearch(Components[i]).Enabled := False;
                     TwwIncrementalSearch(Components[i]).Color   := $00C7C0AB;
                  end
                  else
                  if (Components[i] is TwwDBGrid) then begin
                     if (Copy(TwwDBGrid(Components[i]).Name, 1, 7) = 'GridEdt') or
                        (Copy(TwwDBGrid(Components[i]).Name, 1, 8) = 'GridPerm') then
                     begin
                        TwwDBGrid(Components[i]).Enabled         := True;
                        TwwDBGrid(Components[i]).Color           := gcClRejilla;
                        TwwDBGrid(Components[i]).Font.Color      := gcClFuente;
                        TwwDBGrid(Components[i]).FooterCellColor := gcClRejilla;
                     end
                     else begin
                        TwwDBGrid(Components[i]).Enabled := False;
                        TwwDBGrid(Components[i]).Color   := $00C7C0AB;
                     end;
                  end
                  else
                  if (Components[i] is TwwKeyCombo) then begin
                     TwwKeyCombo(Components[i]).Enabled := False;
                     TwwKeyCombo(Components[i]).Color   := $00C7C0AB;
                  end;
               end;
            end;
         end;
         //========================================================================================
         Naveg: begin
            {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
            with Formulario do begin
               for i := 0 to (ComponentCount - 1) do begin
                  if (Components[i] is TGroupBox) then   begin
                     if UpperCase(Copy(TGroupBox(Components[i]).Name, 1, 6)) = 'FILTRO' then begin
                        TGroupBox(Components[i]).Cursor  := crHandPoint;
                        TGroupBox(Components[i]).Enabled := True;
                     end;
                  end;
                  if (Components[i] is TfcTreeView) then   begin
                     Tfctreeview(Components[i]).Color := clInfoBk;
                  end
                  else
                  if (Components[i] is TSpeedButton) then   begin
                     TSpeedButton(Components[i]).Visible := True;
                  end
                  else
                  if (Components[i] is TwwDBEdit) then begin
                     if (UpperCase(Copy(TwwDBEdit(Components[i]).Name, 1, 6)) <> 'FILTRO') and
                        (UpperCase(Copy(TwwDBEdit(Components[i]).Name, 1, 5)) <> 'EPERM') then
                     begin
                        TwwDBEdit(Components[i]).Cursor     := crNo;
                        TwwDBEdit(Components[i]).Color      := gcClNaveg;
                        TwwDBEdit(Components[i]).Font.Color := clBlack;
                     end;
                     if Copy(TwwDBEdit(Components[i]).Name, 1, 8) =
                        'EditNEdt' then begin
                        TwwDBEdit(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBDateTimePicker) then   begin
                     if (UpperCase(Copy(TwwDBDateTimePicker(Components[i]).Name, 1, 6)) <>
                        'FILTRO') and (UpperCase(
                        Copy(TwwDBDateTimePicker(Components[i]).Name, 1, 5)) <> 'EPERM') then   begin
                        TwwDBDateTimePicker(Components[i]).Cursor     := crNo;
                        TwwDBDateTimePicker(Components[i]).Color      := gcClNaveg;
                        TwwDBDateTimePicker(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TDBEdit) then   begin
                     if (UpperCase(Copy(TDBEdit(Components[i]).Name, 1, 6)) <> 'FILTRO') and
                        (UpperCase(Copy(TDBEdit(Components[i]).Name, 1, 5)) <> 'EPERM') then
                     begin
                        TDBEdit(Components[i]).Cursor     := crNo;
                        TDBEdit(Components[i]).Color      := gcClNaveg;
                        TDBEdit(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcNoteBook) then   begin
                     for j := 0 to (TOvcNoteBook(Components[i]).PageCount - 1) do
                     begin
                        TOvcNoteBook(Components[i]).Pages[j].PageVisible :=
                           TOvcNoteBook(Components[i]).Pages[j].Name <> 'PageOculta';
                     end;
                  end
                  else
                  if (Components[i] is TOvcDbPictureField) then begin
                     if (UpperCase(Copy(TOvcDbPictureField(Components[i]).Name, 1, 6)) <>
                        'FILTRO') and (UpperCase(
                        Copy(TOvcDbPictureField(Components[i]).Name, 1, 5)) <> 'EPERM') then begin
                        TOvcDbPictureField(Components[i]).Cursor     := crNo;
                        TOvcDbPictureField(Components[i]).Color      := gcClNaveg;
                        TOvcDbPictureField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcDbNumericField) then begin
                     if (UpperCase(Copy(TOvcDbNumericField(Components[i]).Name, 1, 6)) <>
                        'FILTRO') and (UpperCase(
                        Copy(TOvcDbNumericField(Components[i]).Name, 1, 5)) <> 'EPERM') then begin
                        TOvcDbNumericField(Components[i]).Cursor     := crNo;
                        TOvcDbNumericField(Components[i]).Color      := gcClNaveg;
                        TOvcDbNumericField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TOvcDbSimpleField) then begin
                     if UpperCase(Copy(TOvcDBSimpleField(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TOvcDbSimpleField(Components[i]).Cursor     := crNo;
                        TOvcDbSimpleField(Components[i]).Color      := gcClNaveg;
                        TOvcDbSimpleField(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBLookupCombo) then begin
                     if (UpperCase(Copy(TwwDBLookUpCombo(Components[i]).Name, 1, 6)) <>
                        'FILTRO') and (UpperCase(
                        Copy(TwwDBLookUpCombo(Components[i]).Name, 1, 5)) <> 'EPERM') then begin
                        TwwDBLookupCombo(Components[i]).Cursor          := crNo;
                        TwwDBLookupCombo(Components[i]).Color           := gcClNaveg;
                        TwwDBLookupCombo(Components[i]).Grid.Color      := gcClNaveg;
                        TwwDBLookupCombo(Components[i]).Font.Color      := clBlack;
                        TwwDBLookupCombo(Components[i]).Grid.Font.Color := clBlack;
                     end;
                     if Copy(TwwDBLookupCombo(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBLookupCombo(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBComboBox) then begin
                     if (UpperCase(Copy(TwwDBComboBox(Components[i]).Name, 1, 6)) <> 'FILTRO') then
                     begin
                        TwwDBComboBox(Components[i]).Cursor     := crNo;
                        TwwDBComboBox(Components[i]).Color      := gcClNaveg;
                        TwwDBComboBox(Components[i]).Font.Color := clBlack;
                     end;
                     if Copy(TwwDBComboBox(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBComboBox(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBSpinEdit) then begin
                     if (UpperCase(Copy(TwwDBSpinEdit(Components[i]).Name, 1, 6)) <> 'FILTRO') then
                     begin
                        TwwDBSpinEdit(Components[i]).Cursor     := crNo;
                        TwwDBSpinEdit(Components[i]).Color      := gcClNaveg;
                        TwwDBSpinEdit(Components[i]).Font.Color := clBlack;
                     end;
                     if Copy(TwwDBSpinEdit(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBSpinEdit(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TOvcPrinterComboBox) then begin
                     if UpperCase(Copy(TOvcPrinterComboBox(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TOvcPrinterComboBox(Components[i]).Cursor       := crNo;
                        TOvcPrinterComboBox(Components[i]).Color        := gcClNaveg;
                        TOvcPrinterComboBox(Components[i]).Font.Color   := clBlack;
                        TOvcPrinterComboBox(Components[i]).MRUListColor := gcClNaveg;
                        TOvcPrinterComboBox(Components[i]).Enabled      := False;
                     end;
                  end
                  else
                  if (Components[i] is TOvcDBDateEdit) then begin
                     if UpperCase(Copy(TOvcDBDateEdit(Components[i]).Name, 1, 6)) <> 'FILTRO' then
                     begin
                        TOvcDBDateEdit(Components[i]).Cursor     := crNo;
                        TOvcDBDateEdit(Components[i]).Color      := gcClNaveg;
                        TOvcDBDateEdit(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBLookupComboDlg) then begin
                     if UpperCase(Copy(TwwDBLookUpComboDlg(Components[i]).Name, 1, 6)) <>
                        'FILTRO' then begin
                        TwwDBLookupComboDlg(Components[i]).Cursor          := crNo;
                        TwwDBLookupComboDlg(Components[i]).Color           := gcClNaveg;
                        TwwDBLookupComboDlg(Components[i]).Grid.Color      := gcClNaveg;
                        TwwDBLookupComboDlg(Components[i]).Font.Color      := clBlack;
                        TwwDBLookupComboDlg(Components[i]).Grid.Font.Color := clBlack;
                        TwwDBLookUpComboDlg(Components[i]).AutoDropDown    := False;
                        TwwDBLookUpComboDlg(Components[i]).ShowButton      := False;
                     end;
                     if Copy(TwwDBLookupComboDlg(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBLookupComboDlg(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBComboBox) then   begin
                     if UpperCase(Copy(TwwDBComboBox(Components[i]).Name, 1, 6)) <> 'FILTRO' then
                     begin
                        TwwDBComboBox(Components[i]).Cursor     := crNo;
                        TwwDBComboBox(Components[i]).Color      := gcClNaveg;
                        TwwDBComboBox(Components[i]).Font.Color := clBlack;
                     end;
                     if Copy(TwwDBComboBox(Components[i]).Name, 1, 8) =
                        'ComboEdt' then begin
                        TwwDBComboBox(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TDBCheckBox) then begin
                     if (UpperCase(Copy(TwwDBEdit(Components[i]).Name, 1, 5)) <> 'EPERM') then begin
                        TDBCheckBox(Components[i]).Cursor := crNo;
                     end;
                  end
                  else
                  if (Components[i] is TwwDBRichEdit) then begin
                     TwwDBRichEdit(Components[i]).Cursor     := crNo;
                     TwwDBRichEdit(Components[i]).Color      := gcClNaveg;
                     TwwDBRichEdit(Components[i]).Font.Color := clBlack;
                  end
                  else
                  if (Components[i] is TDBMemo) then begin
                     if (UpperCase(Copy(TOvcDbPictureField(Components[i]).Name, 1, 5)) <>
                        'EPERM') then
                     begin
                        TDBMemo(Components[i]).Cursor     := crNo;
                        TDBMemo(Components[i]).Color      := gcClNaveg;
                        TDBMemo(Components[i]).Font.Color := clBlack;
                     end;
                  end
                  else
                  if (Components[i] is TCheckBox) then begin
                     if Copy(TCheckBox(Components[i]).Name, 1, 5) =
                        'CbNav' then begin
                        TCheckBox(Components[i]).Visible := True;
                     end;
                  end
                  else
                  if (Components[i] is TAnimate) then begin
                     if Copy(TAnimate(Components[i]).Name, 1, 3) =
                        'Nav' then begin
                        TAnimate(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TLabel) then begin
                     if Copy(TLabel(Components[i]).Name, 1, 5) =
                        'LbNav' then begin
                        TLabel(Components[i]).Visible := True;
                     end;
                     if Copy(TLabel(Components[i]).Name, 1, 8) =
                        'LabelEdt' then begin
                        TLabel(Components[i]).Visible := False;
                     end;
                  end
                  else
                  if (Components[i] is TfcImageBtn) then begin
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 7) =
                        'BtnPerm' then begin
                        TfcImageBtn(Components[i]).Visible := True;
                     end
                     else
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 6) = 'BtnNav' then   begin
                        TfcImageBtn(Components[i]).Visible := True;
                     end
                     else
                     if Copy(TfcImageBtn(Components[i]).Name, 1, 6) = 'BtnEdt' then begin
                        TfcImageBtn(Components[i]).Visible := False;
                     end
                     else begin
                        TfcImageBtn(Components[i]).Visible := (Copy(TfcImageBtn(Components[i]).Name, 1, 3) <> 'Aux');
                     end;
                  end
                  else
                  if (Components[i] is TDBNavegadorNotarios) then begin
                     TDBNavegadorNotarios(Components[i]).Visible := True;
                  end
                  else
                  if (Components[i] is TwwIncrementalSearch) then begin
                     TwwIncrementalSearch(Components[i]).Enabled := True;
                     TwwIncrementalSearch(Components[i]).Color   := clWhite;
                  end
                  else
                  if (Components[i] is TwwDBGrid) then begin
                     TwwDBGrid(Components[i]).Enabled := True;
                     if (Copy(TwwDBGrid(Components[i]).Name, 1, 7) = 'Despleg') then
                     begin
                        TwwDBGrid(Components[i]).Color := gcClRejillaDesplegable;
                     end
                     else begin
                        TwwDBGrid(Components[i]).Color := gcClRejilla;
                     end;
                     TwwDBGrid(Components[i]).Font.Color      := gcClFuente;
                     TwwDBGrid(Components[i]).FooterCellColor := gcClRejilla;
                  end
                  else
                  if (Components[i] is TwwKeyCombo) then begin
                     TwwKeyCombo(Components[i]).Enabled := True;
                     TwwKeyCombo(Components[i]).Color   := clWhite;
                  end;
               end;
            end;
         end; // Naveg
      end; // case
   end; // if
end;

procedure QueryRefresh(Query: TIBQuery);
begin
   Query.Close;
   Query.Open;
end;

procedure PonerTipoConta(TipoConcepto: String);
begin
   if TipoConcepto = 'N' then begin
      gvTipoConta := '';
   end
   else
   if TipoConcepto = 'E' then begin
      gvTipoConta := '-';
   end
   else begin
      gvTipoConta := '+';
   end;
end;

procedure QueryOpen(Query :TIBTableSet; Select :String);
begin
   Query.Close;
   if Trim(Select) <> '' then begin
      Query.SelectSQL.Clear;
      Query.SelectSQL.Add(Select);
   end;
   Query.Open;
end;

function ConversionImporte(Importe: Double;
   MonedaActual, MonedaFinal: String): Double;
begin
   if UpperCase(MonedaActual) = UpperCase(MonedaFinal) then   begin
      Result := Importe;
   end
   else
   if (UpperCase(MonedaActual) = 'P') and (UpperCase(MonedaFinal) = 'E') then   begin
      Result := RoundToDecimal((Importe / gcValorEuro), 3, True);
   end
   else
   if (UpperCase(MonedaActual) = 'E') and (UpperCase(MonedaFinal) = 'P') then   begin
      Result := RoundToDecimal((Importe * gcValorEuro), 0, True);
   end
   else begin
      Result := Importe;
   end;
end;

procedure Moneda(Formulario: TForm; Moneda: String);
var
   i: Integer;
begin
   if Formulario <> nil then begin
      if moneda = 'P' then   begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with Formulario do begin
            for i := 0 to (ComponentCount - 1) do begin
               if (Components[i] is TppDBText) then   begin
                  if (UpperCase(Copy(TppDBText(Components[i]).Name, 3, 7)) = 'IMPORTE') or
                     (UpperCase(Copy(TppDBText(Components[i]).UserName, 1, 7)) = 'IMPORTE') then   begin
                     TppDBText(Components[i]).DisplayFormat := '###,###,###';
                  end
                  else
                  if (UpperCase(Copy(TppDBText(Components[i]).Name, 3, 4)) = 'SUMA') or
                     (UpperCase(Copy(TppDBText(Components[i]).UserName, 1, 4)) = 'SUMA') then   begin
                     TppDBText(Components[i]).DisplayFormat := '###,###,###,###';
                  end;
               end;
            end;
            if FindComponent('ppSuma1') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma1')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma2') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma2')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma3') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma3')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma4') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma4')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma5') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma5')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma6') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma6')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma7') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma7')).DisplayFormat := '###,###,###,###';
            end;
            if FindComponent('ppSuma8') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma8')).DisplayFormat := '###,###,###,###';
            end;
         end;
      end
      else begin
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with Formulario do begin
            for i := 0 to (ComponentCount - 1) do begin
               if (Components[i] is TppDBText) then   begin
                  if (UpperCase(Copy(TppDBText(Components[i]).Name, 3, 7)) = 'IMPORTE') or
                     (UpperCase(Copy(TppDBText(Components[i]).UserName, 1, 7)) = 'IMPORTE') then   begin
                     TppDBText(Components[i]).DisplayFormat := '###,###,##0.#0';
                  end
                  else
                  if (UpperCase(Copy(TppDBText(Components[i]).Name, 3, 4)) = 'SUMA') or
                     (UpperCase(Copy(TppDBText(Components[i]).UserName, 1, 4)) = 'SUMA') then   begin
                     TppDBText(Components[i]).DisplayFormat := '###,###,###,##0.#0';
                  end;
               end;
            end;
            if FindComponent('ppSuma1') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma1')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma2') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma2')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma3') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma3')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma4') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma4')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma5') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma5')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma6') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma6')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma7') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma7')).DisplayFormat := '###,###,###,##0.#0';
            end;
            if FindComponent('ppSuma8') <> nil then   begin
               TppDbCalc(FindComponent('ppSuma8')).DisplayFormat := '###,###,###,##0.#0';
            end;
         end;
      end;
   end;
end;

function Exp10(Exponent : Extended) : Extended;
  {-Returns 10^Exponent}
begin
  Result := Power(10.0, Exponent);
end;

function RoundToDecimal(Value : Extended;
                        Places : Integer;
                        Bankers : Boolean):Extended;
var
  Val, IV, N, F :Extended;
  T             :Integer;
begin
   IV := 0;
   N := Exp10(Places);
   if (Places > 0) then IV := Int(Value);
   Val := (Value - IV) * N;
   T := Trunc(Val);
   F := (Val - T);
   if Bankers then Val := Round(Val) / N        {Delphi's Round does Bankers}
   else begin
      if Abs(Round(10.0 * F)) >= 5 then begin
        if (F > 0) then Val := (T + 1.0) / N
                   else Val := (T - 1.0) / N;
      end
      else Val := T / N;
   end;
   Result := Val + IV;
end;

function Empty(prmCadena :string):Boolean;
begin
   Result := Trim(prmCadena) = '';
end;

function Year(prmDate :TDateTime):Integer;
{returns the year}
var Year, Month, Day: Word;
begin
  DecodeDate(prmDate, Year, Month, Day);
  Result := Year;
end;

function Month(prmDate :TDateTime):Integer;
{returns the month of the year}
var Year, Month, Day: Word;
begin
  DecodeDate(prmDate, Year, Month, Day);
  Result := Month;
end;

function Day(prmDate :TDateTime):Integer;
{returns the day of the month}
var Year, Month, Day :Word;
begin
   DecodeDate(prmDate, Year, Month, Day);
   Result := Day;
end;

function Replicate(prmChar :Char; prmLength :Integer): string;
{return a string containing nLen times the character c}
var i :Integer;
begin
  Result := '';
  for i := 1 to prmLength do begin
      Result := Result + prmChar;
  end;
end;

function Space(prmLength :Integer): string;
{return the number of spaces asked for}
begin
   Result := Replicate(' ', prmLength);
end;

function PadR(prmString :string; prmLength :Integer): string;
{make certain the string is exactly nLen character}
begin
  if (Length(prmString) <> prmLength) then begin
     if Length(prmString) > prmLength then begin
        {length is smaller than string, so cut string to fit}
        Result := Copy(prmString, 1, prmLength);
     end
     else begin
       {length is bigger than string, so add spaces}
       Result := prmString + Space(prmLength - Length(prmString));
     end;
  end
  else Result := prmString;
end;

function CMonth(prmDate :TDateTime): string;
{returns the month as a character string}
begin
  Result := FormatDateTime('mmmm', prmDate);
end;

end.
