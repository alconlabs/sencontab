unit UCalculadora;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids, DB,
     StdCtrls, Buttons, Wwkeycb, ExtCtrls, DBCtrls, Mask, IBDatabase, fcButton, fcImgBtn, wwSpeedButton,
     wwclearpanel, jpeg, IBSQL, ComCtrls, OvcBase, OvcEF, OvcPB, OvcNF, IBServices, StFileOp, ovccalc,
     fcImage, fcimageform;
type
   TWCalculadora = class(TForm)
      OvcController1: TOvcController;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      Calculator:     TOvcCalculator;
      Panel1:         TPanel;
      Formulario:     TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FImporte: Double;
   public
      property Importe: Double Read FImporte;
   end;

var WCalculadora: TWCalculadora;
implementation
uses General, Globales;
{$R *.DFM}

procedure TWCalculadora.BtnEdtProcesarClick(Sender: TObject);
begin
   FImporte := Calculator.DisplayValue;
end;

procedure TWCalculadora.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWCalculadora.FormShow(Sender: TObject);
begin
   Calculator.DisplayValue := 0;
end;

procedure TWCalculadora.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWCalculadora.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWCalculadora.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWCalculadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
