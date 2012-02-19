unit UUtilEmpresas;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids, DB,
     StdCtrls, Buttons, Wwkeycb, ExtCtrls, DBCtrls, Mask, IBDatabase, fcButton, fcImgBtn, wwSpeedButton,
     wwclearpanel, jpeg, IBSQL, ComCtrls, OvcBase, OvcEF, OvcPB, OvcNF, IBServices, StFileOp, fcImage,
     fcimageform, CustomView;
type
   TWUtilEmpresas = class(TCustomView)
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
      lbNombreEmpresa: TLabel;
      IBBackup:        TIBBackupService;
      IBRestore:       TIBRestoreService;
      Memo1:           TMemo;
      RGOperacion:     TRadioGroup;
      Label1:          TLabel;
      BDMinima:        TIBDatabase;
      Transaccion:     TIBTransaction;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      procedure BtnEdtProcesarClick(Sender: TObject);
      procedure BtnEdtCancelarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcImageBtnMouseEnter(Sender: TObject);
      procedure fcImageBtnMouseLeave(Sender: TObject);
   private
   public
      cUbicacionEmpresa, cNombreServidor: String;
   end;

var WUtilEmpresas: TWUtilEmpresas;

implementation
uses DM, General, Globales, UActualizacionBD, UEspere, MenuPrincipal;
{$R *.DFM}
const CADENA_MANUAL = 'Seleccione AYUDA si desea obtener más información sobre el problema surgido';

procedure TWUtilEmpresas.BtnEdtProcesarClick(Sender: TObject);
var
   Caratula: TEspere;
   cUbicacionBackup: String;
   i: Word;
begin
   if (RgOperacion.ItemIndex <> 3) then Exit;

   if MessageDlg('¿Esta seguro de dejar la empresa con Plan Contable mínimo?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   Caratula := TEspere.Create(nil);
   case RgOperacion.ItemIndex of
        0: Caratula.Mensaje := 'Exportando Base Datos ...';
        1: Caratula.Mensaje := 'Importando Base Datos ...';
        2: Caratula.Mensaje := 'Reorganización Base Datos ...';
        3: Caratula.Mensaje := 'Plan contable mínimo ...';
        4: Caratula.Mensaje := 'Actualización Base Datos ...';
   end;
   Caratula.Ancho        := 300;
   Caratula.Alto         := 150;
   Caratula.Avi_Left     := 20;
   Caratula.Avi_Top      := 80;
   Caratula.Fuente.Color := clWhite;
   Caratula.Fuente.Name  := 'Arial';
   Caratula.Fuente.Size  := 14;
   Caratula.Mensaje_Left := 14;
   Caratula.Mensaje_Top  := 14;
   Caratula.Avi_Color    := $00A56D39;
   Caratula.ColorFondo   := $00A56D39;
   Caratula.MostrarMarco := True;
   Caratula.Avi_Predet   := Ninguno;
   Caratula.Avi_File     := gvDirImagenes + gcBarraProgreso;
   Caratula.Mostrar;

   if RgOperacion.ItemIndex = 0 then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with IBBackup do begin
         if Empty(cNombreServidor) then   begin
            ServerName := 'local';
            Protocol   := local;
         end
         else begin
            ServerName := cNombreServidor;
            Protocol   := TCP;
         end;

         LoginPrompt := False;
         Params.Add('user_name=sysdba');
         Params.Add('password=masterkey');
         Active := True;
         try
            Verbose      := True;
            Options      := [IgnoreLimbo];
            DatabaseName := cUbicacionEmpresa;
            for i := length(Databasename) downto 0 do begin
               if DatabaseName[i] = '.' then begin
                  Break;
               end;
            end;
            cUbicacionBackup := Copy(Databasename, 1, i) + 'gbk';
            BackupFile.Clear;
            BackupFile.add(cUbicacionBackup);
            ServiceStart;
            while not EOF do begin
               Memo1.Lines.Add(GetNextLine);
            end;
         finally
            Caratula.Cerrar;
            Caratula.Free;
            Active := False;

            MessageDlg('Exportacion finalizada correctamente', mtInformation, [mbOK], 0);
         end;
      end;
   end
   else
   if RgOperacion.ItemIndex = 1 then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with IBRestore do begin
         if Empty(cNombreServidor) then   begin
            ServerName := 'local';
            Protocol   := local;
         end
         else begin
            ServerName := cNombreServidor;
            Protocol   := TCP;
         end;
         LoginPrompt := False;
         Params.Add('user_name=sysdba');
         Params.Add('password=masterkey');
         Active := True;
         try
            Verbose     := True;
            Options     := [Replace];
            PageBuffers := 3000;
            PageSize    := 8192;
            DatabaseName.Clear;
            DatabaseName.add(cUbicacionEmpresa);
            for i := length(cUbicacionEmpresa) downto 0 do begin
               if cUbicacionEmpresa[i] = '.' then begin
                  Break;
               end;
            end;
            cUbicacionBackup := Copy(cUbicacionEmpresa, 1, i) + 'gbk';
            BackupFile.Clear;
            BackupFile.add(cUbicacionBackup);
            ServiceStart;
            while not EOF do begin
               Memo1.Lines.Add(GetNextLine);
            end;
         finally
            Active := False;
            Caratula.Cerrar;
            Caratula.Free;
            MessageDlg('Importacion finalizada correctamente', mtInformation, [mbOK], 0);
         end;
      end;
   end
   else
   if RgOperacion.ItemIndex = 2 then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with IBBackup do begin
         if Empty(cNombreServidor) then   begin
            ServerName := 'local';
            Protocol   := local;
         end
         else begin
            ServerName := cNombreServidor;
            Protocol   := TCP;
         end;
         LoginPrompt := False;
         Params.Add('user_name=sysdba');
         Params.Add('password=masterkey');
         Active := True;
         try
            Verbose      := True;
            Options      := [IgnoreLimbo];
            DatabaseName := cUbicacionEmpresa;
            for i := length(Databasename) downto 0 do begin
               if DatabaseName[i] = '.' then begin
                  Break;
               end;
            end;
            cUbicacionBackup := Copy(Databasename, 1, i) + 'gbk';
            BackupFile.Clear;
            BackupFile.add(cUbicacionBackup);
            ServiceStart;
            while not EOF do begin
               Memo1.Lines.Add(GetNextLine);
            end;
         finally
            Active := False;
         end;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with IBRestore do begin
         if Empty(cNombreServidor) then   begin
            ServerName := 'local';
            Protocol   := local;
         end
         else begin
            ServerName := cNombreServidor;
            Protocol   := TCP;
         end;
         LoginPrompt := False;
         Params.Add('user_name=sysdba');
         Params.Add('password=masterkey');
         Active := True;
         try
            Verbose     := True;
            Options     := [Replace];
            PageBuffers := 3000;
            PageSize    := 8192;
            DatabaseName.Clear;
            DatabaseName.add(cUbicacionEmpresa);
            for i := length(cUbicacionEmpresa) downto 0 do begin
               if cUbicacionEmpresa[i] = '.' then begin
                  Break;
               end;
            end;
            cUbicacionBackup := Copy(cUbicacionEmpresa, 1, i) + 'gbk';
            BackupFile.Clear;
            BackupFile.add(cUbicacionBackup);
            ServiceStart;
            while not EOF do begin
               Memo1.Lines.Add(GetNextLine);
            end;
         finally
            Active := False;
            Caratula.Cerrar;
            Caratula.Free;
            MessageDlg('Reorganización finalizada correctamente', mtInformation, [mbOK], 0);
         end;
      end;
   end
   else
   if RgOperacion.ItemIndex = 3 then begin
      // Abrir Database y transaction
      Transaccion.active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with BDMinima, params do begin
         connected := False;
         Clear;
         add('user_name=SYSDBA');
         add('password=masterkey');
         if empty(cNombreServidor) then begin
            DatabaseName := cUbicacionEmpresa;
         end
         else begin
            DatabaseName := Trim(cNombreServidor) + ':' + Trim(cUbicacionEmpresa);
         end;
         connected := True;
      end;
      Transaccion.active := True;

      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TibSql.Create(nil), sql do begin
         Close;
         Clear;
         Database := BdMinima;
         Add('Execute procedure Inicializar_BD_Minima');
         ExecQuery;
         Transaction.CommitRetaining;
         Close;
         Free;
      end;
      Transaccion.active := False;
      BdMinima.connected := False;

      Caratula.Cerrar;
      Caratula.Free;
      MessageDlg('Plan contable mínimo finalizado correctamente', mtInformation, [mbOK], 0);
   end

   // Actualización BD
   else
   if RgOperacion.ItemIndex = 4 then begin
      // Abrir Database y transaction
      Transaccion.active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with BDMinima, params do begin
         connected := False;
         Clear;
         add('user_name=SYSDBA');
         add('password=masterkey');
         if empty(cNombreServidor) then begin
            DatabaseName := cUbicacionEmpresa;
         end
         else begin
            DatabaseName := Trim(cNombreServidor) + ':' + Trim(cUbicacionEmpresa);
         end;
         connected := True;
      end;
      Transaccion.active := True;

      Caratula.Cerrar;
      Caratula.Free;

      if not Assigned(WActualizacionBD) then   begin
         WActualizacionBD := TWActualizacionBD.Create(nil);
      end;
      WActualizacionBD.ShowModal;

      Transaccion.active := False;
      BdMinima.connected := False;
   end;
end;

procedure TWUtilEmpresas.BtnEdtCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TWUtilEmpresas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   // Pasamos al siguiente control
   if (Key = Chr(VK_RETURN)) then  begin
      //Pasamos al siguiente control
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWUtilEmpresas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TWUtilEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Formulario.Free;
   Formulario    := nil;
   WUtilEmpresas := nil;
end;

procedure TWUtilEmpresas.fcImageBtnMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWUtilEmpresas.fcImageBtnMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

end.
