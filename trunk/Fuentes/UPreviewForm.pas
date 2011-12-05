unit UPreviewForm;
interface
uses Buttons, Classes, comctrls, Controls, DB, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImgBtn,
     Forms, Graphics, Grids, IBDatabase, IBQuery, IBSQL, jpeg, Mask, Messages, OvcBase, OvcEF, OvcNF,
     OvcPB, ppTypes, ppUtils, ppViewr, StdCtrls, SysUtils, MenuPrincipal, WinProcs, WinTypes, wwclearpanel,
     Wwdatsrc, Wwdbcomb, wwdbedit, Wwdotdot, Wwkeycb, wwSpeedButton;
type
   TWPreviewForm = class(TForm)
      PanelVisor:       TPanel;
      pnlPreviewBar:    TPanel;
      spbPreviewPrint:  TSpeedButton;
      spbPreviewWhole:  TSpeedButton;
      spbPreviewFirst:  TSpeedButton;
      spbPreviewPrior:  TSpeedButton;
      spbPreviewNext:   TSpeedButton;
      spbPreviewLast:   TSpeedButton;
      spbPreviewWidth:  TSpeedButton;
      spbPreview100Percent: TSpeedButton;
      mskPreviewPercentage: TMaskEdit;
      mskPreviewPage:   TMaskEdit;
      Panel5:           TPanel;
      spbPreviewClose:  TSpeedButton;
      spbPreviewAsiento: TSpeedButton;
      ppViewer:         TppViewer;
      pnlStatusBar:     TPanel;
      spbPreviewBorrar: TSpeedButton;
      spbPreviewCobroPago: TSpeedButton;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure spbPreviewPrintClick(Sender: TObject);
      procedure spbPreviewWholeClick(Sender: TObject);
      procedure spbPreviewWidthClick(Sender: TObject);
      procedure spbPreview100PercentClick(Sender: TObject);
      procedure spbPreviewFirstClick(Sender: TObject);
      procedure spbPreviewPriorClick(Sender: TObject);
      procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
      procedure spbPreviewNextClick(Sender: TObject);
      procedure spbPreviewLastClick(Sender: TObject);
      procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
      procedure spbPreviewCloseClick(Sender: TObject);
      procedure ppViewerPageChange(Sender: TObject);
      procedure ppViewerPrintStateChange(Sender: TObject);
      procedure ppViewerStatusChange(Sender: TObject);
      procedure spbPreviewAsientoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure ppViewerClick(Sender: TObject);
      procedure spbPreviewBorrarClick(Sender: TObject);
      procedure spbPreviewCobroPagoClick(Sender: TObject);
   private
      FTipoListado: Integer;
   public
      FAsiento:           Integer;
      FAsientoModificado: Boolean;
      FNombreArchivo:     String;
   end;

var WPreviewForm: TWPreviewForm;

implementation
uses DM, DMConta, General, Globales, UCargaAsiento, UFiltroLibroFacturasEmitidas;
{$R *.DFM}

procedure TWPreviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action       := caFree;
   WPreviewForm := nil;
end;

procedure TWPreviewForm.spbPreviewPrintClick(Sender: TObject);
begin
   ppViewer.Print;
end;

procedure TWPreviewForm.spbPreviewWholeClick(Sender: TObject);
begin
   ppViewer.ZoomSetting := zsWholePage;

   mskPreviewPercentage.Text := IntToStr(ppViewer.CalculatedZoom);

   pnlPreviewBar.SetFocus;
end;

procedure TWPreviewForm.spbPreviewWidthClick(Sender: TObject);
begin
   ppViewer.ZoomSetting := zsPageWidth;

   mskPreviewPercentage.Text := IntToStr(ppViewer.CalculatedZoom);

   pnlPreviewBar.SetFocus;
end;

procedure TWPreviewForm.spbPreview100PercentClick(Sender: TObject);
begin
   ppViewer.ZoomSetting := zs100Percent;

   mskPreviewPercentage.Text := IntToStr(ppViewer.CalculatedZoom);

   pnlPreviewBar.SetFocus;
end;

procedure TWPreviewForm.spbPreviewFirstClick(Sender: TObject);
begin
   ppViewer.FirstPage;
end;

procedure TWPreviewForm.spbPreviewPriorClick(Sender: TObject);
begin
   ppViewer.PriorPage;
end;

procedure TWPreviewForm.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
   liPage: Longint;
begin
   if (Key = #13) then  begin
      liPage := StrToInt(mskPreviewPage.Text);
      ppViewer.GotoPage(liPage);
   end;
end;

procedure TWPreviewForm.spbPreviewNextClick(Sender: TObject);
begin
   ppViewer.NextPage;
end;

procedure TWPreviewForm.spbPreviewLastClick(Sender: TObject);
begin
   ppViewer.LastPage;
end;

procedure TWPreviewForm.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
var
   liPercentage: Integer;
begin
   if (Key = #13) then  begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down      := False;
      spbPreviewWidth.Down      := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer.CalculatedZoom);
   end;
end;

procedure TWPreviewForm.ppViewerPageChange(Sender: TObject);
begin
   mskPreviewPage.Text       := IntToStr(ppViewer.AbsolutePageNo);
   mskPreviewPercentage.Text := IntToStr(ppViewer.CalculatedZoom);
end;

procedure TWPreviewForm.ppViewerPrintStateChange(Sender: TObject);
var
   lPosition: TPoint;
begin
   if ppViewer.Busy then  begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled       := False;

      pnlPreviewBar.Cursor := crHourGlass;

      ppViewer.Cursor := crHourGlass;

      pnlStatusBar.Cursor := crHourGlass;

      spbPreviewClose.Cursor := crArrow;

      spbPreviewClose.Caption := ppLoadStr(ppMsgCancel);
   end

   else begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled       := True;

      pnlPreviewBar.Cursor := crDefault;

      ppViewer.Cursor := crDefault;

      pnlStatusBar.Cursor := crDefault;

      spbPreviewClose.Cursor := crDefault;

      spbPreviewClose.Caption := ppLoadStr(ppMsgClose);
   end;

   GetCursorPos(lPosition);
   SetCursorPos(lPosition.X, lPosition.Y);
end;

procedure TWPreviewForm.ppViewerStatusChange(Sender: TObject);
begin
   pnlStatusBar.Caption := ppViewer.Status;
end;

procedure TWPreviewForm.spbPreviewCloseClick(Sender: TObject);
begin
   if FormPrincipal.InformePrincipal.Printing then ppViewer.Cancel
                                              else Close;
end;

procedure TWPreviewForm.spbPreviewAsientoClick(Sender: TObject);
var
   WAsiento: TWCargaAsiento;
   Existe:   Boolean;
begin
   if FAsiento <> 0 then  begin
     {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('SELECT FECHA FROM DIARIO WHERE ASIENTO = :ASIENTO');
         ParamByName('ASIENTO').AsInteger := FAsiento;
         Open;
         Existe := not EOF;
         if Existe and DMContaRef.AsientoBloqueado(FieldByName('FECHA').AsDateTime) then
         begin
            DatabaseError('No se puede modificar un asiento bloqueado.');
         end;
         Close;
         Free;
      end;

      if Existe then   begin
         WAsiento          := TWCargaAsiento.Create(nil);
         WAsiento.FModoArranque := MODIFICACION_INFORME;
         WAsiento.FAsiento := FAsiento;
         WAsiento.ShowModal;
      end
      else begin
         DatabaseError('El asiento ha sido borrado.');
      end;
   end;
end;

procedure TWPreviewForm.spbPreviewCobroPagoClick(Sender: TObject);
var
   WAsiento: TWCargaAsiento;
   Existe:   Boolean;
begin
   if FAsiento <> 0 then  begin
     {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBQuery.Create(nil), SQL do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('SELECT FECHA FROM DIARIO WHERE ASIENTO = :ASIENTO');
         ParamByName('ASIENTO').AsInteger := FAsiento;
         Open;
         Existe := not EOF;
         Close;
         Free;
      end;

      if Existe then   begin
         WAsiento := TWCargaAsiento.Create(nil);
         if UpperCase(spbPreviewCobroPago.Caption) = 'COBRO' then   begin
            WAsiento.FModoArranque := COBRO_FACTURA;
         end
         else begin
            WAsiento.FModoArranque := PAGO_FACTURA;
         end;
         WAsiento.FAsientoFactura := FAsiento;
         WAsiento.ShowModal;
      end
      else begin
         DatabaseError('El asiento ha sido borrado.');
      end;
   end;
end;

procedure TWPreviewForm.FormShow(Sender: TObject);
begin
   FTipoListado := 0;

   spbPreviewAsiento.Enabled := False;
   spbPreviewBorrar.Enabled  := False;

   spbPreviewCobroPago.Visible :=
      (UpperCase(FNombreArchivo) = 'LLIBROFACTURASEMITIDAS.RTM') or
      (UpperCase(FNombreArchivo) = 'LLIBROFACTURASTIPOIVA.RTM') or
      (UpperCase(FNombreArchivo) = 'LLIBROFACTURASEMITIDASSUBCTA.RTM');
   spbPreviewCobroPago.Enabled := False;

   if Assigned(WFiltroLibroFactEmitidas) then  begin
      FTipoListado := WFiltroLibroFactEmitidas.TipoListado;
      if FTipoListado = INF_FACTURAS_EMITIDAS then   begin
         spbPreviewCobroPago.Caption := 'Cobro';
      end
      else
      if FTipoListado = INF_FACTURAS_RECIBIDAS then   begin
         spbPreviewCobroPago.Caption := 'Pago';
      end;
   end;

   Self.Top  := 0;
   Self.Left := 0;

   FAsiento := 0;
end;

procedure TWPreviewForm.ppViewerClick(Sender: TObject);
begin
   spbPreviewAsiento.Enabled   := (FAsiento <> 0);
   spbPreviewBorrar.Enabled    := (FAsiento <> 0);
   spbPreviewCobroPago.Enabled := False;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with TIBQuery.Create(nil), SQL do begin
      Close;
      Database := DMRef.IBDSiamCont;
      Clear;
      Add('SELECT TIPOASIENTO FROM DIARIO WHERE ASIENTO = :ASIENTO');
      ParamByName('ASIENTO').AsInteger := FAsiento;
      Open;
      spbPreviewCobroPago.Visible := not EOF and
         ((FieldByName('TIPOASIENTO').AsInteger = ASIENTO_FACTURA_COMPRA) or
         (FieldByName('TIPOASIENTO').AsInteger = ASIENTO_FACTURA_VENTA));
      if spbPreviewCobroPago.Visible then   begin
         if FieldByName('TIPOASIENTO').AsInteger = ASIENTO_FACTURA_COMPRA then   begin
            spbPreviewCobroPago.Caption := 'Pago';
         end
         else begin
            spbPreviewCobroPago.Caption := 'Cobro';
         end;
         spbPreviewCobroPago.Enabled := True;
      end;
      Close;
      Free;
   end;
end;

procedure TWPreviewForm.spbPreviewBorrarClick(Sender: TObject);
var
   Existe:         Boolean;
   AsientoBorrado: Boolean;
   PaginaActual:   Integer;
begin
   if FAsiento <> 0 then  begin
      AsientoBorrado := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with TIBSQL.Create(nil), SQL do begin
         Database := DMRef.IBDSiamCont;
         Close;
         Clear;
         Add('SELECT FECHA FROM DIARIO WHERE ASIENTO = :ASIENTO');
         ParamByName('ASIENTO').AsInteger := FAsiento;
         ExecQuery;

         Existe := not EOF;
         if Existe then   begin
            if DMContaRef.AsientoBloqueado(FieldByName('FECHA').AsDateTime) then   begin
               DatabaseError('No se puede borrar un asiento bloqueado.');
            end
            else
            if MessageDlg('¿Desea borrar el asiento ' + FormatFloat('###,###,###', FAsiento) + ' ?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
               AsientoBorrado := True;

               Close;
               Clear;
               Add('DELETE FROM DIARIO WHERE ASIENTO = :ASIENTO');
               ParamByName('ASIENTO').AsInteger := FAsiento;
               ExecQuery;
               Transaction.CommitRetaining;
               MessageDlg('Se ha borrado el asiento ' + FormatFloat('###,###,###', FAsiento), mtInformation, [mbOK], 0);
            end;
         end
         else begin
            DatabaseError('El asiento ha sido borrado.');
         end;

         Close;
         Free;
      end;

      if AsientoBorrado then   begin
         // Almacenar la página actual
         PaginaActual := ppViewer.AbsolutePageNo;

         // Borrar asiento
         if FormPrincipal.Enlace1.DataSource.DataSet is TClientDataSet then   begin
            while FormPrincipal.Enlace1.DataSource.DataSet.Locate('ASIENTO', FAsiento, []) do begin
               FormPrincipal.Enlace1.DataSource.DataSet.Delete;
            end;
         end
         else begin
            FormPrincipal.Enlace1.DataSource.DataSet.Close;
            FormPrincipal.Enlace1.DataSource.DataSet.Open;
         end;

         // Cerrar asientos desplegados
         FormPrincipal.InformePrincipal.CollapseDrillDowns;

         // Refrescar impresión
         FormPrincipal.InformePrincipal.PrintToDevices;

         // Posicionar en página actual
         ppViewer.GotoPage(PaginaActual);
      end;
   end;
end;

end.
