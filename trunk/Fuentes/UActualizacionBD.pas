unit UActualizacionBD;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids, DB,
     StdCtrls, Buttons, Wwkeycb, ExtCtrls, DBCtrls, Mask, IBDatabase, fcButton, fcImgBtn, wwSpeedButton,
     wwclearpanel, jpeg, IBSQL, ComCtrls, OvcBase, OvcEF, OvcPB, OvcNF, IBServices, StBase, StFileOp,
     fcImage, fcimageform, FileCtrl, CustomView;

type
   TWActualizacionBD = class(TCustomView)
      OvcController1: TOvcController;
      Datos:          TGroupBox;
      Shape1:         TShape;
      lTitulo:        TLabel;
      fcIBCerrar:     TfcImageBtn;
      Panel3:         TPanel;
      Panel4:         TPanel;
      Panel5:         TPanel;
      BtnEdtProcesar: TfcImageBtn;
      BtnEdtCancelar: TfcImageBtn;
      Label1:         TLabel;
      FileListBox:    TFileListBox;
      DriveComboBox1: TDriveComboBox;
      DirectoryListBox: TDirectoryListBox;
      eFichero:       TEdit;
      lVersion:       TLabel;
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
      procedure MostrarActualizacionActual;
   public
      cUbicacionEmpresa, cNombreServidor: String;
   end;

var WActualizacionBD: TWActualizacionBD;

implementation
uses General, Globales, MenuPrincipal, UUTilEmpresas;
{$R *.DFM}

procedure TWActualizacionBD.MostrarActualizacionActual;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBSQL.Create(nil), SQL do begin
      Close;
      Database := WUtilEmpresas.BDMinima;
      Clear;
      Add('SELECT * FROM SIAM');
      ExecQuery;

      lVersion.Caption := '(Última actualización: ' + FieldByName('ULTIMAACTUALIZACION').AsString + ')';

      Close;
      Free;
   end;
end;

procedure TWActualizacionBD.BtnEdtProcesarClick(Sender: TObject);
begin  {$Message Warn 'Falta de instalar el Componente TIBScript. Este código está comentado hasta entonces.'}
  (*if FileListBox.ItemIndex <> -1 then begin
    IBScript.Script.LoadFromFile(FileListBox.Items[FileListBox.ItemIndex]);
    IBScript.ExecuteScript;
    if IBScript.Transaction.Active then
      IBScript.Transaction.Commit;
    WPrincipal.MensajePrincipal.MensajeInformativo(
                      'Actualización "' + FileListBox.Items[FileListBox.ItemIndex] +
                      '" concluida con éxito.', Application.Title);
    Close;
  end;*)
end;

procedure TWActualizacionBD.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWActualizacionBD.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWActualizacionBD.FormShow(Sender: TObject);
begin
   MostrarActualizacionActual;
end;

procedure TWActualizacionBD.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWActualizacionBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario       := nil;
   WActualizacionBD := nil;
end;

procedure TWActualizacionBD.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWActualizacionBD.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
