unit UDetalleIVA;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids, DB,
     StdCtrls, Buttons, Wwkeycb, ExtCtrls, DBCtrls, Mask, IBDatabase, fcButton, fcImgBtn, wwSpeedButton,
     wwclearpanel, jpeg, IBSQL, ComCtrls, OvcBase, OvcEF, OvcPB, OvcNF, IBServices, StFileOp,
     ovccalc, ovcdbnf, fcImage, fcimageform;
type
   TWDetalleIVA = class(TForm)
      OvcController1: TOvcController;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtCerrar:   TfcImageBtn;
      gDatos:         TGroupBox;
      Label6:         TLabel;
      eTotal:         TOvcDbNumericField;
      pDatos:         TPanel;
      Label4:         TLabel;
      Label1:         TLabel;
      Label2:         TLabel;
      Label3:         TLabel;
      Label5:         TLabel;
      eImporte:       TOvcDbNumericField;
      OvcDbNumericField1: TOvcDbNumericField;
      OvcDbNumericField2: TOvcDbNumericField;
      OvcDbNumericField3: TOvcDbNumericField;
      OvcDbNumericField4: TOvcDbNumericField;
      SFichero:       TDataSource;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      procedure BtnEdtCerrarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure eImporteClick(Sender: TObject);
      procedure PonerDecimal(Sender: TObject; var Key: Char);
      procedure eImporteExit(Sender: TObject);
      procedure eTotalExit(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure RecalcularCuotas;
      procedure RecalcularTotalImporte;
   public
   end;

var WDetalleIVA: TWDetalleIVA;

implementation
uses DM, General, Globales, UCargaAsiento;
{$R *.DFM}

procedure TWDetalleIVA.RecalcularCuotas;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with SFichero.DataSet do begin
      if not (State in dsEditModes) then begin
         Edit;
      end;
      if RoundToDecimal(FieldByName('BASEIMPONIBLE').AsFloat, 3, True) <> 0 then  begin
         FieldByName('CUOTAIVA').AsFloat     :=
            RoundToDecimal(FieldByName('BASEIMPONIBLE').AsFloat * 0.01 *
            FieldByName('IVA').AsFloat, 3, True);
         FieldByName('CUOTARECARGO').AsFloat :=
            RoundToDecimal(FieldByName('BASEIMPONIBLE').AsFloat * 0.01 *
            FieldByName('RECARGO').AsFloat, 3, True);
      end;
   end;
   RecalcularTotalImporte;
end;

procedure TWDetalleIVA.RecalcularTotalImporte;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with SFichero.DataSet do begin
      if not (State in dsEditModes) then begin
         Edit;
      end;
      if DMRef.QParametros.FieldByName('RECARGO').AsString = 'S' then   begin
         if RoundToDecimal(FieldByName('CUOTARECARGO').AsFloat, 3, True) > 0 then   begin
            FieldByName('IMPORTE').AsFloat := RoundToDecimal(FieldByName('CUOTARECARGO').AsFloat, 3, True);
         end
         else begin
            FieldByName('IMPORTE').AsFloat := RoundToDecimal(FieldByName('CUOTAIVA').AsFloat, 3, True);
         end;
      end
      else begin
         FieldByName('IMPORTE').AsFloat := RoundToDecimal(FieldByName('CUOTAIVA').AsFloat +
            FieldByName('CUOTARECARGO').AsFloat, 3, True);
      end;
   end;
end;

procedure TWDetalleIVA.BtnEdtCerrarClick(Sender: TObject);
begin
   Perform(wm_NextDlgCtl, 0, 0);
   Close;
end;

procedure TWDetalleIVA.FormShow(Sender: TObject);
begin
   RecalcularCuotas;
   eImporte.Update;
   eTotal.SetFocus;
   eImporte.SetFocus;
end;

procedure TWDetalleIVA.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_F3, VK_ESCAPE: begin
         key := 0;
         BtnEdtCerrar.Click;
      end;
      VK_UP: begin
         SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
      end;
      VK_DOWN: begin
         SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
      end
   end;
end;

procedure TWDetalleIVA.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWDetalleIVA.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWDetalleIVA.eImporteClick(Sender: TObject);
begin
   if Sender is TOvcDbNumericField then begin
      TOvcDbNumericField(Sender).SelectAll;
   end;
end;

procedure TWDetalleIVA.PonerDecimal(Sender: TObject; var Key: Char);
begin
   if (key = '.') then begin
      key := ',';
   end;
end;

procedure TWDetalleIVA.eImporteExit(Sender: TObject);
begin
   RecalcularCuotas;
end;

procedure TWDetalleIVA.eTotalExit(Sender: TObject);
begin
   RecalcularTotalImporte;
end;

procedure TWDetalleIVA.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Si pulsamos enter pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWDetalleIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
