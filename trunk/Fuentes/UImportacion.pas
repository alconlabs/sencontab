unit UImportacion;
interface
uses Buttons, Classes, Controls, DB, DBTables, Dialogs, ExtCtrls, Forms, Graphics, IBDatabase, IBSQL,
     Messages, StdCtrls, SysUtils, Variants, Windows;

type
   TWImportacion = class(TForm)
      RgTipo:          TRadioGroup;
      QSubcuentas:     TTable;
      QProveedores:    TTable;
      BitBtn1:         TBitBtn;
      BitBtn2:         TBitBtn;
      QExiste:         TIBSQL;
      QActualiza:      TIBSQL;
      QInserta:        TIBSQL;
      QBuscaProvincia: TIBSQL;
      IBDatabase1:     TIBDatabase;
      IBTransaction1:  TIBTransaction;
      procedure BitBtn1Click(Sender: TObject);
   private
   public
   end;

var WImportacion: TWImportacion;

implementation
uses DM, MenuPrincipal;
{$R *.dfm}

procedure TWImportacion.BitBtn1Click(Sender: TObject);
var cProvincia: String;
begin
   if MessageDlg('Confirma procesar la importación', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      if RgTipo.ItemIndex = 0 then   begin
        {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QExiste, Sql do begin
            Close;
            Clear;
            Add('select count(*) as cuantos from subctas where subcuenta=:subcuenta');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QActualiza, Sql do begin
            Close;
            Clear;
            Add('update subctas set descripcion=:descripcion,nif=:nif where subcuenta=:subcuenta');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QInserta, Sql do begin
            Close;
            Clear;
            Add('insert into subctas(subcuenta,descripcion,profesional,arrendador,intracomunitario,obsoleto)');
            Add(' values(:subcuenta,:descripcion,"N","N","N","N",:nif)');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QSubcuentas do begin
            Close;
            Open;
            while not EOF do begin
               if (length(Trim(FieldByName('cta_codigo').AsString)) > 7) and
                  (Copy(Trim(FieldByName('cta_codigo').AsString), 1, 2) = '43') then   begin
                  // Ver si existe
                  QExiste.Close;
                  QExiste.ParamByName('Subcuenta').AsString := Trim(FieldByName('Cta_codigo').AsString);
                  QExiste.Execquery;
                  if QExiste.FieldByName('Cuantos').AsInteger > 0 then   begin
                     // Si existe se actualiza
                     QActualiza.Close;
                     QActualiza.ParamByName('Subcuenta').AsString   := Trim(FieldByName('Cta_codigo').AsString);
                     QActualiza.ParamByName('Descripcion').AsString :=
                        Copy(Trim(FieldByName('Cta_Nombre').AsString), 1, 80);
                     QActualiza.ParamByName('nif').AsString         := Trim(FieldByName('Cta_Nif').AsString);
                     QActualiza.Execquery;
                     QActualiza.Transaction.CommitRetaining;
                  end
                  else begin
                     // Si no existe se crea
                     QInserta.Close;
                     QInserta.ParamByName('Descripcion').AsString :=
                        Copy(Trim(FieldByName('Cta_Nombre').AsString), 1, 80);
                     QInserta.ParamByName('Subcuenta').AsString   := Trim(FieldByName('Cta_codigo').AsString);
                     QInserta.ParamByName('nif').AsString         := Trim(FieldByName('Cta_Nif').AsString);
                     QInserta.Execquery;
                     QInserta.Transaction.CommitRetaining;
                  end;
               end;
               Next;
            end;
         end;
      end
      else
      if RgTipo.ItemIndex = 1 then   begin
        {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QActualiza, Sql do begin
            Close;
            Clear;
            Add('update subctas set descripcion=:descripcion,direccion=:direccion,direccion1=:direccion1,');
            Add(' poblacion=:poblacion,codpostal=:codpostal,telefono=:telefono,nif=:nif,pais="ES",provincia=:provincia');
            Add('where subcuenta=:subcuenta');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QBuscaProvincia, Sql do begin
            Close;
            Clear;
            Add('select provincia from provincias where codigo=:codigo');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QProveedores do begin
            Close;
            Open;
            while not EOF do begin
               // Buscar provincia en codpostal
               QBuscaProvincia.Close;
               QBuscaProvincia.ParamByName('Codigo').AsString :=
                  Copy(Trim(FieldByName('P_codpost').AsString), 1, 2);
               QBuscaProvincia.Execquery;
               cProvincia := QBuscaProvincia.FieldByName('provincia').AsString;

               QActualiza.Close;
               QActualiza.ParamByName('Subcuenta').AsString   := Trim(FieldByName('P_cuentcontable').AsString);
               QActualiza.ParamByName('Descripcion').AsString :=
                  Copy(Trim(FieldByName('P_Nombre').AsString), 1, 80);
               QActualiza.ParamByName('Direccion').AsString   :=
                  Copy(Trim(FieldByName('P_Direccion').AsString), 1, 35);
               QActualiza.ParamByName('Direccion1').AsString  := '';
               QActualiza.ParamByName('Poblacion').AsString   :=
                  Copy(Trim(FieldByName('P_Poblacion').AsString), 1, 60);
               QActualiza.ParamByName('Codpostal').AsString   :=
                  Copy(Trim(FieldByName('P_Codpost').AsString), 1, 10);
               QActualiza.ParamByName('Telefono').AsString    :=
                  Copy(Trim(FieldByName('P_Telefono1').AsString), 1, 16);
               QActualiza.ParamByName('Provincia').AsString   := cProvincia;
               QActualiza.ParamByName('Nif').AsString         := Copy(Trim(FieldByName('P_Cif').AsString), 1, 20);
               QActualiza.Execquery;
               QActualiza.Transaction.CommitRetaining;
               Next;
            end;
         end;
      end
      else
      if RgTipo.ItemIndex = 2 then   begin
        {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QExiste, Sql do begin
            Close;
            Clear;
            Add('select count(*) as cuantos from cuentas where cuenta=:cuenta');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QActualiza, Sql do begin
            Close;
            Clear;
            Add('update cuentas set descripcion=:descripcion where cuenta=:cuenta');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QInserta, Sql do begin
            Close;
            Clear;
            Add('insert into cuentas(cuenta,descripcion,tipocuenta)');
            Add(' values(:cuenta,:descripcion,"O")');
         end;
         {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
         with QSubcuentas do begin
            Close;
            Open;
            while not EOF do begin
               if length(Trim(FieldByName('cta_codigo').AsString)) <= 3 then   begin
                  // Ver si existe
                  QExiste.Close;
                  QExiste.ParamByName('cuenta').AsString := copy(Trim(FieldByName('Cta_codigo').AsString), 1, 3);
                  QExiste.Execquery;
                  if QExiste.FieldByName('Cuantos').AsInteger > 0 then   begin
                     // Si existe se actualiza
                     QActualiza.Close;
                     QActualiza.ParamByName('cuenta').AsString      :=
                        Copy(Trim(FieldByName('Cta_codigo').AsString), 1, 3);
                     QActualiza.ParamByName('Descripcion').AsString :=
                        Copy(Trim(FieldByName('Cta_Nombre').AsString), 1, 50);
                     QActualiza.Execquery;
                     QActualiza.Transaction.CommitRetaining;
                  end
                  else begin
                     // Si no existe se crea
                     QInserta.Close;
                     QInserta.ParamByName('cuenta').AsString      := copy(Trim(FieldByName('Cta_codigo').AsString), 1, 3);
                     QInserta.ParamByName('Descripcion').AsString :=
                        Copy(Trim(FieldByName('Cta_Nombre').AsString), 1, 50);
                     QInserta.Execquery;
                     QInserta.Transaction.CommitRetaining;
                  end;
               end;
               Next;
            end;
         end;
      end
      else begin
         DatabaseError('Debe seleccionar un tipo de importación.');
      end;
      MessageDlg('Proceso finalizado correctamente', mtInformation, [mbOK], 0);
   end;
end;

end.
