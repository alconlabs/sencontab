unit Provincias;
interface
uses Forms, Windows, ccFormHandler, ccSituation, Grids, DBGrids, ccDBGrid, StdCtrls, Mask, ccDBEdit,
     Buttons, Controls, Classes, ExtCtrls, DB, ComCtrls, ccResButton,
     ccBtnPanel, DBCtrls, ccCustomControls, IBCustomDataSet, IBTable, Messages,
     Graphics, ccChildForm, ccDBIntegrity, IBDataBase;
type
  TFormProvincias = class(TccFormChild)
    Navegador: TccBtnPanel;
    Shape1: TShape;
    Label4: TLabel;
    Panel1: TPanel;
    BtnEliminar: TccResButton;
    BtnEditar: TccResButton;
    BtnNuevo: TccResButton;
    BtnCancelar: TccResButton;
    BtnAceptar: TccResButton;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    EditPROVINCIA: TccDBEdit;
    EditNOMBRE: TccDBEdit;
    EditCODIGO: TccDBEdit;
    DBGrid: TccDBGrid;
    FormSituation: TccFormSituation;
    Timer: TTimer;
    HProvincias: TIBTable;
    HProvinciasPROVINCIA: TIBStringField;
    HProvinciasNOMBRE: TIBStringField;
    HProvinciasCODIGO: TIBStringField;
    SProvincias: TDataSource;
    LabelMensaje: TLabel;
    procedure NavegadorButtonAction(Sender: TObject; Button: TccNavResource);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnNuevoClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    function  FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure FormShow(Sender: TObject);
  protected
    procedure Paint; override;
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
    procedure CreateParams(var Params: TCreateParams); override;
  private
    FDataBase :TIBDataBase;
    IProvincias :TccDBIntegrity;
    FormHandler :TccFormHandler;
    procedure AsignaDataSources;
    function  ValidData :Boolean;
    procedure SetDefaultValues;
    //procedure SetTableFilter(prmValor :string);
    function  GetFirstCODIGO :string;
    function  GetLastCODIGO  :string;
    property  FirstCODIGO :string read GetFirstCODIGO;
    property  LastCODIGO  :string read GetLastCODIGO;
    procedure MuestraError(prmErrorMessage :string);
  public
  end;

var FormProvincias: TFormProvincias;

implementation
uses DM, Dialogs, SQLExpr, IBQuery, MenuPrincipal, Globales, SysUtils;
{$R *.DFM}

procedure TFormProvincias.AsignaDataSources;
begin
   EditPROVINCIA.DataSource := SProvincias;
   EditNOMBRE.DataSource    := SProvincias;
   EditCODIGO.DataSource    := SProvincias;
   DBGrid.DataSource        := SProvincias;
end;

procedure TFormProvincias.FormCreate(Sender: TObject);
begin
   //if FDataBase = nil then HProvincias.DataBase := FDataBase
   //                   else
   HProvincias.DataBase        := DMRef.IBDSiamCont;
   HProvincias.Transaction     := DMRef.IBDSiamCont.DefaultTransaction;

   FormHandler := TccFormHandler.Create(Self);
   IProvincias := TccDBIntegrity.Create(HProvincias);
   IProvincias.PrimaryKey := 'PROVINCIA';
   IProvincias.AddReference('PROVINCIA', 'SUBCTAS', 'PROVINCIA');

   LabelMensaje.Caption := '';
   AsignaDataSources;
   HProvincias.Open;
   FormHandler.Mode := fmEditing;
   FormHandler.Mode := fmNavigating;
   NavegadorButtonAction(Self, nrLast);
end;

procedure TFormProvincias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IProvincias.Free;
   HProvincias.Close;
   Action := caFree;
end;

function  TFormProvincias.ValidData:Boolean;
begin
   Result := True;
   if EditPROVINCIA.Text = '' then begin
      MuestraError('Falta el campo obligatorio CÓDIGO');
      EditPROVINCIA.SetFocus;
      Result := False;
   end else
   if EditNOMBRE.Text = '' then begin
      MuestraError('Falta el campo obligatorio NOMBRE');
      EditNOMBRE.SetFocus;
      Result := False;
   end else
   if EditCODIGO.Text = '' then begin
      MuestraError('Falta el campo obligatorio CODIGO');
      EditCODIGO.SetFocus;
      Result := False;
   end;
end;

procedure TFormProvincias.SetDefaultValues;
begin
   {No hay valores por defecto}
end;

//procedure TFormProvincias.SetTableFilter(prmValor :string);
//begin
//   HProvincias.Filter   := 'PROVINCIA = '''+prmValor+'''';
//   HProvincias.Filtered := True;
//end;

function TFormProvincias.GetFirstCODIGO:string;
var Q :TIBQuery;
begin
   Q := DMRef.CreateQuery(
          ['SELECT PROVINCIA                          ',
           'FROM   PROVINCIAS                         ',
           'WHERE  PROVINCIA = (SELECT MIN(PROVINCIA) ',
           '                    FROM   PROVINCIAS   ) ']);
   Q.Open;
   try  Result := Q.FieldByName('PROVINCIA').AsString;
   finally Q.Free;
   end;
end;

function TFormProvincias.GetLastCODIGO:string;
var Q :TIBQuery;
begin
   Q := DMRef.CreateQuery(
          ['SELECT PROVINCIA                          ',
           'FROM   PROVINCIAS                         ',
           'WHERE  PROVINCIA = (SELECT MAX(PROVINCIA) ',
           '                    FROM   PROVINCIAS   ) ']);
   Q.Open;
   try  Result := Q.FieldByName('PROVINCIA').AsString;
   finally Q.Free;
   end;
end;

procedure TFormProvincias.MuestraError(prmErrorMessage :string);
begin
   LabelMensaje.Font.Style := [fsBold];
   LabelMensaje.Caption := '      '+prmErrorMessage;
   MessageBeep(MB_ICONHAND);
   Timer.Enabled := True;
end;

procedure TFormProvincias.NavegadorButtonAction(Sender: TObject; Button: TccNavResource);
//var Q :TIBQuery;
begin
   case Button of
      nrHelp  : SendMessage(Self.Handle, WM_SYSCOMMAND, SC_CONTEXTHELP, 0);
      nrClose : Close;
      nrPrinter:begin
         //if DMControlRef.PermisoUsuario(gvID_Usuario, 'WProvincias', IMPRESION) then begin
            FormPrincipal.LanzarListado('LProvincias.rtm', SProvincias);
         //end;
      end;//DoShowReports('CLI', nil, nil, nil, False, False, False);
      nrRefresh:begin
         HProvincias.Refresh;
      end;
      nrFirst:begin
         //SetTableFilter(FirstCODIGO);
         HProvincias.First;
         Navegador.SetFirst;
      end;
      nrLast:begin
         //SetTableFilter(LastCODIGO);
         HProvincias.Last;
         Navegador.SetLast;
      end;
      nrPrior:begin
         if HProvinciasPROVINCIA.AsString = FirstCODIGO then begin
            Navegador.SetFirst;
            Exit;
         end
         else Navegador.SetMiddle;
         HProvincias.Prior;

         //Q := DMRef.CreateQuery(['SELECT PROVINCIA                 ',
         //                        'FROM   PROVINCIAS                ',
         //                        'WHERE  PROVINCIA < :prmPROVINCIA ',
         //                        'ORDER  BY PROVINCIA DESC         ',
         //                        'ROWS 1 TO 1                      ']);
         //Q.ParamByName('prmPROVINCIA').Value := HProvinciasPROVINCIA.AsString;
         //Q.Open;
         //try SetTableFilter(Q.FieldByName('PROVINCIA').AsString);
         //finally Q.Free;
         //end;
      end;
      nrNext:begin
         if HProvinciasPROVINCIA.AsString = LastCODIGO then begin
            Navegador.SetLast;
            Exit;
         end
         else Navegador.SetMiddle;
         HProvincias.Next;
         //Q := DMRef.CreateQuery(['SELECT PROVINCIA                 ',
         //                        'FROM   PROVINCIAS                ',
         //                        'WHERE  PROVINCIA > :prmPROVINCIA ',
         //                        'ORDER  BY PROVINCIA ASC          ',
         //                        'ROWS 1 TO 1                      ']);
         //Q.ParamByName('prmPROVINCIA').Value := HProvinciasPROVINCIA.AsString;
         //Q.Open;
         //
         //try SetTableFilter(Q.FieldByName('PROVINCIA').AsString);
         //finally Q.Free;
         //end;
      end;
   end;
end;

procedure TFormProvincias.TimerTimer(Sender: TObject);
begin
   LabelMensaje.Caption := '';
   Timer.Enabled := False;
end;

procedure TFormProvincias.BtnEliminarClick(Sender: TObject);
var TextoError :string;
    Borra      :Boolean;
begin
   //if not DMControlRef.PermisoUsuario(gvID_Usuario, 'WPROVINCIAS', BORRAR) then begin
   //   MuestraError('No tiene PERMISO para ELIMINAR registros.');
   //   Exit;
   //end;

   Borra := MessageDlg('¿Seguro que desea eliminar el elemento seleccionado?', mtConfirmation, [mbYes, mbNo], 1) = mrYes;

   if Borra then begin
      if IProvincias.Operation(okDelete, TextoError) then begin
         HProvincias.ApplyUpdates;
         HProvincias.Transaction.CommitRetaining;
         HProvincias.Refresh;
      end
      else MuestraError(TextoError);
   end;
end;

procedure TFormProvincias.BtnEditarClick(Sender: TObject);
begin
   //if not DMControlRef.PermisoUsuario(gvID_Usuario, 'WPROVINCIAS', MODIFICAR) then begin
   //   MuestraError('No tiene PERMISO para MODIFICAR registros.');
   //   Exit;
   //end;

   if IProvincias.Operation(okEdit) then begin
      //Transaction.StartTransaction;
      FormHandler.Mode := fmEditing;
      if IProvincias.Preserve then begin
         EditPROVINCIA.ForceChangeMode(fmNavigating);
         EditNOMBRE.SetFocus;
      end
      else EditPROVINCIA.SetFocus;
   end;
end;

procedure TFormProvincias.BtnNuevoClick(Sender: TObject);
begin
   //if not DMControlRef.PermisoUsuario(gvID_Usuario, 'WPROVINCIAS', ANIADIR) then begin
   //   MuestraError('No tiene PERMISO para AÑADIR registros.');
   //   Exit;
   //end;
   
   if IProvincias.Operation(okAppend) then begin
      //Transaction.StartTransaction;
      SetDefaultValues;
      FormHandler.Mode := fmEditing;
      EditPROVINCIA.SetFocus;
   end;
end;

procedure TFormProvincias.BtnCancelarClick(Sender: TObject);
begin
   if IProvincias.Operation(okCancel) then begin
      //DMControlRef.TransaccionControl.RollBack;
      EditPROVINCIA.ccMode := fmEditing;
      FormHandler.Mode     := fmNavigating;
   end;
end;

procedure TFormProvincias.BtnAceptarClick(Sender: TObject);
begin
   if not ValidData then Exit;
   //if //IProvincias.Operation(okPost) then begin
   //HProvincias.Transaction.StartTransaction;
   try try     HProvincias.Post;
               HProvincias.ApplyUpdates;
               EditPROVINCIA.ccMode := fmEditing;
               FormHandler.Mode     := fmNavigating;
               HProvincias.Refresh;
       finally HProvincias.Transaction.CommitRetaining;
       end;
   except //HProvincias.Transaction.RollBack;
          raise;
   end;
end;

procedure TFormProvincias.GridDblClick(Sender: TObject);
begin
   BtnEditar.Click;
end;

function TFormProvincias.FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
   Result := False;
   //ActivateHelp(Self, CallHelp);
end;

procedure TFormProvincias.FormShow(Sender: TObject);
begin
   //if not(HProvincias.State in dsEditModes) then
   //   NavegadorButtonAction(Self, nrLast);
end;

procedure TFormProvincias.WMNCHitTest(var Msg: TWMNCHitTest);
begin
   {move the form by draging anywhere on the client area }
   inherited;
   if Msg.Result = htClient then Msg.Result := htCaption;
end;

procedure TFormProvincias.Paint;
var Region :HRGN;
begin
   {BorderStyle := bsToolWindow}
   {BoderWidth  := 0           }
   {Hide Title Bar       }
   SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
   {Make borders rounded }
   Region := CreateRoundRectRgn(0, 0, Width, Height, 5, 5);
   SetWindowRgn(Handle, Region, True);
   Canvas.Pen.Width := 1;
   Canvas.Pen.Color := clNavy; //$004B4B4B;
   Canvas.RoundRect(0 , 0 , Width -1, Height, 5, 5);
   inherited;
end;

procedure TFormProvincias.CreateParams(var Params: TCreateParams);
//const
//  CS_DROPSHADOW = $00020000;
begin
  inherited;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;



end.

