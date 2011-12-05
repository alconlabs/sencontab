unit UPunteoDiario;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBQuery, IBSQL, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF,
     OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit, wwdblook, Wwdotdot;
type
   TWPunteoDiario = class(TForm)
      Panel5:           TPanel;
      Panel4:           TPanel;
      Panel3:           TPanel;
      lTitulo:          TLabel;
      Shape1:           TShape;
      GroupBox1:        TGroupBox;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtSalir:      TfcImageBtn;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      fcIBCerrar:       TfcImageBtn;
      OvcController1:   TOvcController;
      RGTipoPunteo:     TRadioGroup;
      RGOperacion:      TRadioGroup;
      Label3:           TLabel;
      FiltroCBDESCSUBCUENTADesde: TwwDBLookupCombo;
      FiltroCBSUBCUENTADesde: TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Label2:           TLabel;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      procedure FormShow(Sender: TObject);
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFiltro;
      procedure InicializarFiltro;
   public
      TipoListado: Integer;
   end;

var WPunteoDiario: TWPunteoDiario;

implementation
uses Cadenas, DM, DMConta, Globales, InfBalanceSumasSaldos, UEspere, MenuPrincipal,
     General;
{$R *.DFM}

procedure TWPunteoDiario.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('Subcuenta1', ftString, 10, False);
         Add('Subcuenta2', ftString, 10, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWPunteoDiario.InicializarFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      FieldByName('Subcuenta1').AsString := '';
      FieldByName('Subcuenta2').AsString := '';
   end;
end;

procedure TWPunteoDiario.FormShow(Sender: TObject);
begin
   CrearFiltro;
   InicializarFiltro;
end;

procedure TWPunteoDiario.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWPunteoDiario.BtnEdtAceptarClick(Sender: TObject);
var
   Caratula:  TEspere;
   Subcuenta_hasta, Subcuenta_desde: String;
   QModifica: TIbSql;
   QConsulta, QConsultaCuantos: TIBQuery;
begin
   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   if MessageDlg('¿Confirma el punteo de asientos seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Caratula := TEspere.Create(nil);
      if RgOperacion.ItemIndex = 0 then Caratula.Mensaje := 'Punteando asientos ...'
                                   else Caratula.Mensaje := 'Eliminando punteo ...';
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

      subcuenta_desde := CdsFiltro.FieldByName('subcuenta1').AsString;
      subcuenta_hasta := CdsFiltro.FieldByName('subcuenta2').AsString;

      if subcuenta_hasta = '' then begin
         subcuenta_hasta := subcuenta_desde;
      end;

      if length(subcuenta_desde) < gvlongitudsubcuenta then   begin
         subcuenta_desde := BackChar(subcuenta_desde, '0', gvlongitudsubcuenta);
      end;
      if length(subcuenta_hasta) < gvlongitudsubcuenta then   begin
         subcuenta_hasta := Backchar(subcuenta_hasta, '9', gvlongitudsubcuenta);
      end;

      QModifica := TIBSQL.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QModifica, SQL do begin
         database := DmRef.IBDSiamCont;
         Clear;
         Add('update diario set punteo=:punteo,asientopunteo=:asiento');
         Add('where id_diario=:id_diario');
         prepare;
      end;

      QConsultaCuantos := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QConsultaCuantos, SQL do begin
         database := DmRef.IBDSiamCont;
         Clear;
         Add('select count(*) as cuantos from diario');
         Add('where subcuenta=:subcuenta and');
         Add('  importe>=:importedesde and importe<=:importehasta');
         Add(' and debehaber=:debehaber ');
         if RgOperacion.ItemIndex = 0 then begin
            Add(' and (punteo is null or punteo<>"S") ');
         end
         else begin
            Add(' and punteo="S" ');
         end;
         if RGTipoPunteo.ItemIndex = 1 then   begin
            Add('and numerofactura = :numerofactura');
         end;
         prepare;
      end;

      QConsulta := TIBQuery.Create(nil);
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with QConsulta, SQL do begin
         database := DmRef.IBDSiamCont;
         Clear;
         Add('select id_diario,asiento from diario');
         Add('where subcuenta=:subcuenta and');
         Add('  importe>=:importedesde and importe<=:importehasta');
         Add(' and debehaber=:debehaber ');
         if RgOperacion.ItemIndex = 0 then begin
            Add(' and (punteo is null or punteo<>"S") ');
         end
         else begin
            Add(' and punteo="S" ');
         end;
         if RGTipoPunteo.ItemIndex = 1 then   begin
            add('and numerofactura = :numerofactura');
         end;
         prepare;
      end;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         database := DmRef.IBDSiamCont;
         Clear;
         Add('select id_diario,asiento,subcuenta,importe,debehaber,numerofactura');
         Add('from diario');
         Add('where subcuenta>=:subcuenta1');
         Add(' and SUBCUENTA<=:SUBCUENTA2');
         if RgOperacion.ItemIndex = 0 then begin
            Add(' and (punteo is null or punteo<>"S") ');
         end
         else begin
            Add(' and punteo="S" ');
         end;
         Add(' order by Subcuenta ');
         parambyname('Subcuenta1').AsString := Subcuenta_Desde;
         parambyname('Subcuenta2').AsString := Subcuenta_Hasta;
         Open;
         while not EOF do begin
            parambyname('Subcuenta1').AsString := FieldByName('subcuenta').AsString;
            // Se busca si para esta subcuenta existe
            // un unico, solo uno, apunte de igual importe y debehaber contrario
            QConsultaCuantos.Close;
            QConsultaCuantos.parambyname('subcuenta').AsString   := FieldByName('subcuenta').AsString;
            QConsultaCuantos.parambyname('importedesde').AsFloat :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True) - 0.001;
            QConsultaCuantos.parambyname('importehasta').AsFloat :=
               RoundToDecimal(FieldByName('importe').AsFloat, 2, True) + 0.001;
            if FieldByName('debehaber').AsString = 'D' then   begin
               QConsultaCuantos.parambyname('debehaber').AsString := 'H';
            end
            else begin
               QConsultaCuantos.parambyname('debehaber').AsString := 'D';
            end;
            if RGTipoPunteo.ItemIndex = 1 then   begin
               QConsultaCuantos.ParamByName('numerofactura').AsString := FieldByName('numerofactura').AsString;
            end;
            QConsultaCuantos.Open;
            if QConsultaCuantos.FieldByName('Cuantos').AsInteger > 0 then   begin
               QConsulta.Close;
               QConsulta.parambyname('subcuenta').AsString   := FieldByName('subcuenta').AsString;
               QConsulta.parambyname('importedesde').AsFloat :=
                  RoundToDecimal(FieldByName('importe').AsFloat, 2, True) - 0.001;
               QConsulta.parambyname('importehasta').AsFloat :=
                  RoundToDecimal(FieldByName('importe').AsFloat, 2, True) + 0.001;
               if FieldByName('debehaber').AsString = 'D' then   begin
                  QConsulta.parambyname('debehaber').AsString := 'H';
               end
               else begin
                  QConsulta.parambyname('debehaber').AsString := 'D';
               end;
               if RGTipoPunteo.ItemIndex = 1 then   begin
                  QConsulta.ParamByName('numerofactura').AsString := FieldByName('numerofactura').AsString;
               end;
               QConsulta.Open;
               // Se modifica punteo y asiento
               QModifica.Close;
               QModifica.parambyname('asiento').AsInteger := FieldByName('asiento').AsInteger;
               if RgOperacion.ItemIndex = 0 then begin
                  QModifica.parambyname('punteo').AsString := 'S';
               end
               else begin
                  QModifica.parambyname('punteo').AsString := '';
               end;
               QModifica.parambyname('id_diario').AsInteger :=
                  QConsulta.FieldByName('id_diario').AsInteger;
               QModifica.ExecQuery;
               QModifica.Transaction.CommitRetaining;
               // Ahora del actual
               QModifica.Close;
               QModifica.parambyname('asiento').AsInteger := QConsulta.FieldByName('asiento').AsInteger;
               if RgOperacion.ItemIndex = 0 then begin
                  QModifica.parambyname('punteo').AsString := 'S';
               end
               else begin
                  QModifica.parambyname('punteo').AsString := '';
               end;
               QModifica.parambyname('id_diario').AsInteger :=
                  FieldByName('id_diario').AsInteger; // el actual
               QModifica.ExecQuery;
               QModifica.Transaction.CommitRetaining;
               // Hacemos nuevamente la consulta para que vea los cambios producidos
               // El parametro subcuenta1 se va actualizando cada vez que hacemos el
               // bucle, de esta manera se va reduciendo el numero de registros devueltos
               Close;
               Open;
               Continue;
            end;
            Next;
         end;
         Close;
         Free;
      end;

      QModifica.Close;
      QModifica.Free;

      QConsulta.Close;
      QConsulta.Free;

      QConsultaCuantos.Close;
      QConsultaCuantos.Free;

      Caratula.Cerrar;
      Caratula.Free;

      MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
      Close;
   end;
end;

procedure TWPunteoDiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWPunteoDiario.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
   end;
end;

procedure TWPunteoDiario.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWPunteoDiario.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWPunteoDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
