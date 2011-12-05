unit UTraspasoApuntes;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBSQL, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB,
     OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot;
type
   TWTraspasoApuntes = class(TForm)
      Panel5:          TPanel;
      Panel4:          TPanel;
      Panel3:          TPanel;
      lTitulo:         TLabel;
      Shape1:          TShape;
      GroupBox1:       TGroupBox;
      BtnEdtAceptar:   TfcImageBtn;
      BtnEdtSalir:     TfcImageBtn;
      CDSFiltro:       TClientDataSet;
      DSFiltro:        TDataSource;
      OvcController1:  TOvcController;
      fcIBCerrar:      TfcImageBtn;
      Label5:          TLabel;
      CBSUBCUENTAOrigen: TwwDBLookupCombo;
      CBDESCSUBCUENTAOrigen: TwwDBLookupCombo;
      CBSUBCUENTADestino: TwwDBLookupCombo;
      CBDESCSUBCUENTADestino: TwwDBLookupCombo;
      Label7:          TLabel;
      Label1:          TLabel;
      BtnEdtSubcuenta: TfcImageBtn;
      oBorrarOrigen:   TCheckBox;
      Panel1:          TPanel;
      Formulario:      TfcImageForm;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure BtnEdtSubcuentaClick(Sender: TObject);
      procedure CBSUBCUENTADestinoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; var Accept: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
      procedure TraspasarApuntes;
   public
   end;

var WTraspasoApuntes: TWTraspasoApuntes;
implementation
uses General, DM, DMConta, Globales, UNuevaSubcuenta, MenuPrincipal;
{$R *.DFM}

procedure TWTraspasoApuntes.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('SubcuentaOrigen', ftString, 10, False);
         Add('SubcuentaDestino', ftString, 10, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWTraspasoApuntes.InicializarFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('SubcuentaDestino').AsString := Replicate('9', 10);
   end;
end;

procedure TWTraspasoApuntes.TraspasarApuntes;
var
   Msg: String;
begin
   Msg := '¿Desea traspasar todos los apuntes de la subcuenta ORIGEN ' +
      CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString + #13 +
      'a la subcuenta DESTINO ' + CDSFiltro.FieldByName('SUBCUENTADESTINO').AsString;
   if oBorrarOrigen.Checked then   begin
      Msg := Msg + ', ' + #13 + 'y borrar la subcuenta ORIGEN ?';
   end
   else begin
      Msg := Msg + '?';
   end;

   if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         Database := DmRef.IBDSiamCont;

         // Actualizar DIARIO
         Close;
         Clear;
         Add('UPDATE DIARIO SET');
         Add('   SUBCUENTA = :SUBCUENTA_DESTINO');
         Add('WHERE SUBCUENTA = :SUBCUENTA_ORIGEN');

         Params.ByName('SUBCUENTA_ORIGEN').AsString  := CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString;
         Params.ByName('SUBCUENTA_DESTINO').AsString := CDSFiltro.FieldByName('SUBCUENTADESTINO').AsString;

         ExecQuery;
         Transaction.CommitRetaining;

         // Actualizar DIARIO
         Close;
         Clear;
         Add('UPDATE DIARIO SET');
         Add('   CONTRAPARTIDA = :CONTRAPARTIDA_DESTINO');
         Add('WHERE CONTRAPARTIDA = :CONTRAPARTIDA_ORIGEN');

         Params.ByName('CONTRAPARTIDA_ORIGEN').AsString  :=
            CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString;
         Params.ByName('CONTRAPARTIDA_DESTINO').AsString :=
            CDSFiltro.FieldByName('SUBCUENTADESTINO').AsString;

         ExecQuery;
         Transaction.CommitRetaining;

         if oBorrarOrigen.Checked then   begin
            // Borrar la subcuenta ORIGEN
            Close;
            Clear;
            Add('DELETE FROM SUBCTAS WHERE SUBCUENTA = :SUBCUENTA_ORIGEN');

            Params.ByName('SUBCUENTA_ORIGEN').AsString := CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString;

            ExecQuery;
            Transaction.CommitRetaining;

            // Refrescar subcuentas
            DMContaRef.RefrescarSubcuentas(CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString);
            DMContaRef.RefrescarSubcuentas(CDSFiltro.FieldByName('SUBCUENTADESTINO').AsString);
         end;

         Close;
         Free;
      end;

      CDSFiltro.FieldByName('SUBCUENTAORIGEN').AsString := '';

      MessageDlg('Proceso concluido con éxito', mtInformation, [mbOK], 0);
   end;
end;

procedure TWTraspasoApuntes.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;
end;

procedure TWTraspasoApuntes.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWTraspasoApuntes.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   DMContaRef.QInformesConta.EmptyDataset;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   TraspasarApuntes;

   CBDESCSUBCUENTAOrigen.SetFocus;
end;

procedure TWTraspasoApuntes.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWTraspasoApuntes.FormCreate(Sender: TObject);
begin
   //DMContaRef.FijarLongitudSubcuentas(Self);
   CBSUBCUENTADestino.MaxLength := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
   CBSUBCUENTAOrigen.MaxLength  := DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger;
end;

procedure TWTraspasoApuntes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
      VK_UP: begin
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
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
         if not (ActiveControl is TwwDBLookupCombo) and not
            (ActiveControl is TwwDBComboBox) then
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

procedure TWTraspasoApuntes.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWTraspasoApuntes.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWTraspasoApuntes.BtnEdtSubcuentaClick(Sender: TObject);
begin
   if not Assigned(WNuevaSubcuenta) then   begin
      WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
   end;
   WNuevaSubcuenta.ShowModal;
   if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
      CDSFiltro.FieldByName('SUBCUENTADESTINO').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
   end;
   CBDESCSUBCUENTADestino.SetFocus;
   WNuevaSubcuenta := nil;
end;

procedure TWTraspasoApuntes.CBSUBCUENTADestinoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := False;

   if (Trim(NewValue) <> '') then  begin
      if Length(NewValue) < DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsInteger then begin
         MessageDlg('La longitud de subcuenta es menor de ' + DMRef.QParametros.FieldByName('LONGITUD_SUBCUENTAS').AsString +
                    ' caracteres.', mtInformation, [mbOK], 0);
         CBSUBCUENTADestino.SetFocus;
         Exit;
      end;

      if  MessageDlg('Subcuenta no existente. ¿Quiere añadirla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         if not Assigned(WNuevaSubcuenta) then   begin
            WNuevaSubcuenta := TWNuevaSubcuenta.Create(nil);
         end;
         WNuevaSubcuenta.FNuevaSubcuenta := NewValue;
         WNuevaSubcuenta.ShowModal;
         if WNuevaSubcuenta.FNuevaSubcuenta <> '' then   begin
            if not (CDSFiltro.State in dsEditModes) then   begin
               CDSFiltro.Edit;
            end;
            CDSFiltro.FieldByName('SubcuentaDestino').AsString := WNuevaSubcuenta.FNuevaSubcuenta;
            Accept := True;
         end;
         WNuevaSubcuenta := nil;
      end;
      CBSUBCUENTAOrigen.SetFocus;
   end;
end;

procedure TWTraspasoApuntes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
