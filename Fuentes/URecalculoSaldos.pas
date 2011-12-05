unit URecalculoSaldos;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, Grids, IBDatabase, IBSQL, jpeg, Mask, Messages, OvcBase, OvcEF, OvcNF,
     OvcPB, StdCtrls, SysUtils, WinProcs, WinTypes, wwclearpanel, Wwkeycb, wwSpeedButton;
type
   TWRecalculoSaldos = class(TForm)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      Label4:         TLabel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      eEjercicio:     TOvcNumericField;
      Label1:         TLabel;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
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
   end;

var WRecalculoSaldos: TWRecalculoSaldos;

implementation
uses DM, General, Globales, UEspere, MenuPrincipal;
{$R *.DFM}

const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWRecalculoSaldos.BtnEdtProcesarClick(Sender: TObject);
var
   Caratula: TEspere;
begin
   if eEjercicio.AsInteger = 0 then begin
      MessageDlg('Especifique el ejercicio que desea recalcular', mtInformation, [mbOK], 0);
   end
   else begin
      Caratula           := TEspere.Create(nil);
      Caratula.Mensaje   := 'Recalculando Saldos ...';
      Caratula.Ancho     := 300;
      Caratula.Alto      := 150;
      Caratula.Avi_Left  := 20;
      Caratula.Avi_Top   := 80;
      Caratula.Fuente.Color := clWhite;
      Caratula.Fuente.Name := 'Arial';
      Caratula.Fuente.Size := 14;
      Caratula.Mensaje_Left := 14;
      Caratula.Mensaje_Top := 14;
      Caratula.Avi_Color := $00A56D39;
      Caratula.ColorFondo := $00A56D39;
      Caratula.MostrarMarco := True;
      Caratula.Avi_Predet := Ninguno;
      Caratula.Avi_File  := gvDirImagenes + gcBarraProgreso;
      Caratula.Mostrar;

      try
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with TIBSQL.Create(nil), SQL do begin
            Database    := DMRef.IBDSiamCont;
            Transaction := DmRef.IBDSiamCont.DefaultTransaction;
            Clear;
            Add('execute procedure RecalculoSaldos (:EJERCICIO)');
            Params.ByName('EJERCICIO').AsInteger := eEjercicio.AsInteger;
            ExecQuery;
            Transaction.CommitRetaining;
            Close;
            Free;
         end;
      except
         DatabaseError('Por favor, revise los datos de entrada.');
      end;

      Caratula.Cerrar;
      Caratula.Free;
      MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
      Close;
   end;
end;

procedure TWRecalculoSaldos.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWRecalculoSaldos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWRecalculoSaldos.FormShow(Sender: TObject);
begin
   eEjercicio.AsInteger := Year(Date);
   eEjercicio.SetFocus;
end;

procedure TWRecalculoSaldos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
         SelectNext(ActiveControl, not (GetKeyState(VK_SHIFT) and $80 = 0), True);
      end;
      VK_DOWN: begin
         SelectNext(ActiveControl, GetKeyState(VK_SHIFT) and $80 = 0, True);
      end
   end;
end;

procedure TWRecalculoSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario       := nil;
   WRecalculoSaldos := nil;
end;

procedure TWRecalculoSaldos.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWRecalculoSaldos.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
