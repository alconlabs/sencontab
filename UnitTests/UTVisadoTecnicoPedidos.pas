unit UTVisadoTecnicoPedidos;

interface
uses TestFramework;

type
  TTCVisadoTecnicoPedidos = class(TTestCase)
  published
    procedure InicializaTestVisadoTecnicoPedidos;
    procedure EditaTipoDato;
    procedure FinalizaTestVisadoTecnicoPedidos;
  end;

implementation
uses DataModulo, Forms, Dialogs, Classes, ccUtilesMDIForms, ccBtnPanel, SysUtils, SQLTimSt,
     TestMainForm, VisadoTecnicoPedidos;

procedure TTCVisadoTecnicoPedidos.InicializaTestVisadoTecnicoPedidos;
begin
   FormTestMainForm.Show;
   TForm(FormVisadoTecnicoPedidos) := ccGetInsertedForm(FormTestMainForm, TFormVisadoTecnicoPedidos);
   try with FormVisadoTecnicoPedidos do begin
            {Ya son CONFORME = 'S'}
          while HVntCabPedidosCD_DELEGACION.AsString = '90' do HVntCabPedidos.Next;
          HVntCabPedidos.Edit;
          HVntCabpedidosFC_SUMINISTRO.AsSQLTimeStamp := DateTimeToSQLTimeStamp(Date);
          if HVntCabPedidosFC_SUMINISTRO_OLD.IsNull then begin
             HVntCabPedidosFC_SUMINISTRO_OLD.AsSQLTimeStamp := DateTimeToSQLTimeStamp(Date);
          end;
          HVntCabPedidos.Post;
          HVntCabPedidos.ApplyUpdates(0);
      end;
   finally
   end;

   //FormVisadoTecnicoPedidos := TFormVisadoTecnicoPedidos.Create(nil);
   //with FormTipoDato do begin
   //   BtnNuevo.Click;
   //   EditCD_TIPODATO.SetFocus;
   //   DM.HTipoDatoCD_TIPODATO.Value := 'ARS';
   //   EditDS_TIPODATO.SetFocus;
   //   DM.HTipoDatoDS_TIPODATO.Value := 'PRUEBA DE ALTA EN TIPODATO';
   //   EditCD_TIPODATO.SetFocus;
   //   BtnAceptar.Click;
   //   BtnCerrar.Click;
   //end;
   //FormTipoDato.Free;
   //
   //Q := DM.DB.CreateQuery(['SELECT CD_TIPODATO, DS_TIPODATO ',
   //                        'FROM   TIPODATO                 ',
   //                        'WHERE  CD_TIPODATO = "ARS"      ']);
   //Q.Open;
   //Check(Q.FieldByName('DS_TIPODATO').AsString = 'PRUEBA DE ALTA EN TIPODATO',
   //      'Error en Nuevo TIPODATO');
   //Q.Free;
end;

procedure TTCVisadoTecnicoPedidos.EditaTipoDato;
//var Q :TccQuery;
begin
   //FormTipoDato := TFormTipoDato.Create(nil);
   //with FormTipoDato do begin
   //   DM.HTipoDato.Locate('CD_TIPODATO', 'ARS', []);
   //   Check(DM.HTipoDatoCD_TIPODATO.Value = 'ARS', 'locate erróneo en Edita TIPODATO');
   //   BtnEditar.Click;
   //   EditDS_TIPODATO.SetFocus;
   //   DM.HTipoDatoDS_TIPODATO.Value := 'PRUEBA DE EDICION EN TIPODATO';
   //   EditCD_TIPODATO.SetFocus;
   //   BtnAceptar.Click;
   //   BtnCerrar.Click;
   //end;
   //FormTipoDato.Free;
   //
   //Q := DM.DB.CreateQuery(['SELECT CD_TIPODATO, DS_TIPODATO ',
   //                        'FROM   TIPODATO                 ',
   //                        'WHERE  CD_TIPODATO = "ARS"      ']);
   //Q.Open;
   //Check(Q.FieldByName('DS_TIPODATO').AsString = 'PRUEBA DE EDICION EN TIPODATO',
   //      'Error en la Edición de TIPODATO');
   //Q.Free;
end;

procedure TTCVisadoTecnicoPedidos.FinalizaTestVisadoTecnicoPedidos;
begin
   FreeAndNil(FormVisadoTecnicoPedidos);
   Check(FormVisadoTecnicoPedidos = nil, 'El FormVisadoTecnicoPedidos no se cerró adecuadamente.');
   FormTestMainForm.Hide;
end;

initialization
   //TestFramework.RegisterTest(TTCVisadoTecnicoPedidos.Suite);
end.


