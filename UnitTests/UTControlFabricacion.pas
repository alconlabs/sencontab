unit UTControlFabricacion;

interface
uses TestFramework;

type
  TTCControlFabricacion = class(TTestCase)
  published
    procedure NuevoTipoDato;
    procedure EditaTipoDato;
    procedure EliminaTipoDato;
  end;

implementation
uses DataModulo, Forms, Dialogs, Classes;

procedure TTCControlFabricacion.NuevoTipoDato;
//var Q :TccQuery;
begin
   //FormTipoDato := TFormTipoDato.Create(nil);
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

procedure TTCControlFabricacion.EditaTipoDato;
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

procedure TTCControlFabricacion.EliminaTipoDato;
//var Q :TccQuery;
begin
   //FormTipoDato := TFormTipoDato.Create(nil);
   //with FormTipoDato do begin
   //   DM.HTipoDato.Locate('CD_TIPODATO', 'ARS', []);
   //   Check(DM.HTipoDatoCD_TIPODATO.Value = 'ARS', 'locate erróneo en Edita TIPODATO');
   //   Integrity.Operation(okDelete);
   //   BtnCerrar.Click;
   //end;
   //FormTipoDato.Free;
   //
   //Q := DM.DB.CreateQuery(['SELECT COUNT(*) CONTADOR   ',
   //                        'FROM   TIPODATO            ',
   //                        'WHERE  CD_TIPODATO = "ARS" ']);
   //Q.Open;
   //Check(Q.FieldByName('CONTADOR').AsInteger = 0, 'Error en la Eliminacion de TIPODATO');
   //Q.Free;
end;

initialization
  TestFramework.RegisterTest(TTCControlFabricacion.Suite);
end.


 