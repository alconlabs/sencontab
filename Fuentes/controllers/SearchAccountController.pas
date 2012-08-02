unit SearchAccountController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls, Forms, DBGrids,
     DBController,
     CurrentConfigClass,
     DMSearch,
     SearchView;
type
  TSearchAccountController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModuleSearch;
    FView          :TSearchView;

    FTextSearched   :string;
    FTimer          :TTimer;

    tmpSearchText  :string;
    FOrderFieldName :string;

    PreviusQueryText :TStringList;
    CurrentQueryText :TStringList;
    FTimerInterval   :Integer;
    { Property Fields }
    FSUBCUENTA      :string;
    FDESCRIPCION    :string;

    procedure InitializeView;
    procedure SetTextSearched(Value :string);
    function  GetTextSearched:string;
    procedure ExecuteSearch;
    function  GetSQLOrderField:string;
  protected
    {Delegate declarations}
    procedure OnShowForm    (Sender :TObject);
    procedure On_FormClose  (Sender: TObject; var Action: TCloseAction);
    procedure OnKeyDown_Form(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure OnTimerEvent(Sender: TObject);

    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);

    procedure OnDoubleClick_DBGrid(Sender: TObject);
    procedure OnTitleClick_DBGrid(Column: TColumn);
    procedure OnKeyDown_DBGrid(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure OnKeyDown_EditSearchText(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function ShowView:Boolean;
    property TextSearched   :string read GetTextSearched write SetTextSearched;
    property OrderFieldName :string read FOrderFieldName write FOrderFieldName;
    property SQLOrderField  :string read GetSQLOrderField;
    property DelayTimer     :TTimer read FTimer;
    { specific properties for the result set }
    property SUBCUENTA      :string read FSUBCUENTA     write FSUBCUENTA;
    property DESCRIPCION    :string read FDESCRIPCION   write FDESCRIPCION;
  end;

implementation
uses SysUtils, Dialogs, DB, Windows, Messages, ccStr, {Traer aquí la rutina StrReplaceCharWithStr} 
     CustomView;

constructor TSearchAccountController.Create(prmConfig :TCurrentConfig);
var i :Integer;
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleSearch, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TSearchView, FView);

   CurrentQueryText := TStringList.Create;
   PreviusQueryText := TStringList.Create;

   DM.Query.DataSet.CommandText := 'select SUBCUENTA, DESCRIPCION from SUBCTAS';
   PreviusQueryText.Add(DM.Query.DataSet.CommandText);
   for i := 0 to FView.DBGrid.Columns.Count -1 do begin
       FView.DBGrid.Columns[i].DropDownRows := i;
   end;

   DM.Query.Open;
   DM.Query.FieldDefs.Update;
   FOrderFieldName := DM.Query.Fields[0].FieldName;

   FView.DataSource.DataSet  := DM.Query;

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TSearchAccountController.Destroy;
begin
   CurrentQueryText.Free;
   PreviusQueryText.Free;

   DM.Free;
   FView.Free;
end;

function TSearchAccountController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Cuentas Contables';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow                  := OnShowForm;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.OnClose   := On_FormClose;
   FView.OnKeyDown := OnKeyDown_Form;

   FTimer := TTimer.Create(nil);
   FTimer.Enabled  := False;
   FTimerInterval  := 400;
   FTimer.Interval := FTimerInterval;
   FTimer.OnTimer  := OnTimerEvent;

   FView.DBGrid.OnDblClick   := OnDoubleClick_DBGrid;
   FView.DBGrid.OnTitleClick := OnTitleClick_DBGrid;
   FView.DBGrid.OnKeyDown    := OnKeyDown_DBGrid;

   FView.EditSearchText.OnKeyDown := OnKeyDown_EditSearchText;

   Result := True;
   FView.ShowModal;
end;

procedure TSearchAccountController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.DataSource  := FView.DataSource;
   FView.EditSearchText.Text := TextSearched;
   FView.EditSearchText.SetFocus;
   FView.EditSearchText.SelectAll;
   ExecuteSearch;
end;

procedure TSearchAccountController.InitializeView;
begin
   //
end;

procedure TSearchAccountController.OnClick_Accept(Sender: TObject);
begin
   FSUBCUENTA   := DM.Query.FieldByName('SUBCUENTA'  ).AsString;
   FDESCRIPCION := DM.Query.FieldByName('DESCRIPCION').AsString;

   FView.ModalResult := mrOK;
end;

procedure TSearchAccountController.OnClick_Cancel(Sender: TObject);
begin
   FView.ModalResult := mrCancel;
end;

procedure TSearchAccountController.On_FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(FTimer);
   DM.Query.Dataset.CommandText := PreviusQueryText.Text;
end;

procedure TSearchAccountController.OnDoubleClick_DBGrid(Sender: TObject);
begin
   FView.BtnAccept.Click;
end;

procedure TSearchAccountController.OnKeyDown_DBGrid(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   FView.EditSearchText.SetFocus;
   FView.EditSearchText.SelLength := 0;
   FView.EditSearchText.SelStart  := Length(FView.EditSearchText.Text);
end;

procedure TSearchAccountController.OnKeyDown_EditSearchText(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   FTimer.Enabled := False;
   FTimer.Interval := FTimerInterval;
   case Key of
      VK_UP , VK_DOWN , VK_HOME,
      VK_END, VK_PRIOR, VK_NEXT :SendMessage(FView.DBGrid.Handle, WM_KEYDOWN, Key         , 0);
      VK_RIGHT                  :SendMessage(FView.DBGrid.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
      VK_LEFT                   :SendMessage(FView.DBGrid.Handle, WM_HSCROLL, SB_LINELEFT , 0);
   end;
   FTimer.Enabled := True;
end;

procedure TSearchAccountController.OnKeyDown_Form(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         Key := 0;
         FView.BtnCancel.Click;
      end;
      VK_RETURN :begin
         Key := 0;
         if DM.Query.RecordCount > 0 then begin
            FView.BtnAccept.Click;
         end;
      end;
   end;
end;

procedure TSearchAccountController.OnTimerEvent(Sender: TObject);
begin
   if FView.EditSearchText.Text <> tmpSearchText then begin
      tmpSearchText := FView.EditSearchText.Text;
      ExecuteSearch;
   end;
end;

procedure TSearchAccountController.OnTitleClick_DBGrid(Column: TColumn);
begin
   OrderFieldName := Column.FieldName;
   ExecuteSearch;
end;

function TSearchAccountController.GetTextSearched: string;
begin
   Result := Trim(StrReplaceCharWithStr(FTextSearched, '%', ' '));
end;

procedure TSearchAccountController.SetTextSearched(Value: string);
var i :Integer;
begin
   tmpSearchText := Value;
   if Length(Trim(Value)) <> 0 then begin
      {Si el campo es alfanumérico se sustituyen '*' por '%', y '?' por '_'}
      for i := 1 to Length(Value) do begin
         if Value[i] = '*' then Value[i] := '%';
         if Value[i] = '?' then Value[i] := '_';
      end;
      {Si no hay % se buscará la cadena exacta y todas las cadenas que la contengan}
      if Pos('%', Value) = 0 then begin
         Value := '%' + Value + '%';
      end;
   end;

   FTextSearched := StrReplaceCharWithStr(Value, ' ', '%');
end;

procedure TSearchAccountController.ExecuteSearch;
begin
   FTimer.Enabled := False;
   DM.Query.DisableControls;
   try DM.Query.Close;
       CurrentQueryText.Clear;
       CurrentQueryText.Assign(PreviusQueryText);
       TextSearched := FView.EditSearchText.Text;
       if Length(FTextSearched) > 0 then begin
         CurrentQueryText.Add(
             {Versión for SQL Server}
             'WHERE (RTRIM(LTRIM(           SUBCTAS.SUBCUENTA                     ))  + ''|''+  '+
             '       RTRIM(LTRIM(ISNULL(    SUBCTAS.DESCRIPCION            , ''''))))           ');
             {Versión for InterBase - FireBird}
             //'WHERE (SUBCTAS.SUBCUENTA   ||''|''||  '+
             //'       SUBCTAS.DESCRIPCION)           ');

             {$Message Warn 'The correct version for this is the SQL version'}


             //'       RTRIM(LTRIM(ISNULL(    ARTICULOS.CD_TIPOARTICULO      , ''''))) + ''|''+  '+
             //'       RTRIM(LTRIM(ISNULL(    ARTICULOS.CD_UNIDAD_COMPRA     , ''''))) + ''|''+  '+
             //'       RTRIM(LTRIM(ISNULL(    ARTICULOS.CD_UNIDAD_CONSUMO    , ''''))) + ''|''+  '+
             //'       RTRIM(LTRIM(ISNULL(    ARTICULOS.CD_MADERA            , ''''))) + ''|''+  '+
             //'       RTRIM(LTRIM(STR(ISNULL(ARTICULOS.ALTO           , 0), 10, 0) )) + ''|''+  '+
             //'       RTRIM(LTRIM(STR(ISNULL(ARTICULOS.ANCHO          , 0), 10, 0) )) + ''|''+  '+
             //'       RTRIM(LTRIM(STR(ISNULL(ARTICULOS.GRUESO         , 0), 10, 0) )) + ''|''+  '+
             //'       RTRIM(LTRIM(STR(ISNULL(ARTICULOS.PRECIO_ESTANDAR, 0), 10, 2) )))          ');
          CurrentQueryText.Add('LIKE '''+FTextSearched+''' ');
       end;

       CurrentQueryText.Add('ORDER BY ' + SQLOrderField);
       if FView.MemoQuery.Visible then FView.MemoQuery.Lines := CurrentQueryText;
       DM.Query.DataSet.CommandText := CurrentQueryText.Text;
       DM.Query.Open;
   finally
      DM.Query.EnableControls;
   end;
end;

function TSearchAccountController.GetSQLOrderField: string;
begin
   if FOrderFieldName = 'SUBCUENTA'         then Result := 'SUBCTAS.SUBCUENTA'       else
	  if FOrderFieldName = 'DESCRIPCION'       then Result := 'SUBCTAS.DESCRIPCION'     else
   raise Exception.Create('Bad definition on field list for the search.');

   //if prmFieldName = 'CD_UNIDAD_COMPRA'  then Result := 'ARTICULOS.CD_UNIDAD_COMPRA'  else
   //if prmFieldName = 'CD_UNIDAD_CONSUMO' then Result := 'ARTICULOS.CD_UNIDAD_CONSUMO' else
   //if prmFieldName = 'CD_MADERA'         then Result := 'ARTICULOS.CD_MADERA'         else
   //if prmFieldName = 'ALTO'              then Result := 'ARTICULOS.ALTO'              else
   //if prmFieldName = 'ANCHO'             then Result := 'ARTICULOS.ANCHO'             else
   //if prmFieldName = 'GRUESO'            then Result := 'ARTICULOS.GRUESO'            else
   //if prmFieldName = 'PRECIO_ESTANDAR'   then Result := 'ARTICULOS.PRECIO_ESTANDAR'   else
   //if prmFieldName = 'CD_TIPOARTICULO'   then Result := 'ARTICULOS.CD_TIPOARTICULO'   else
   //Result := '***(COMPRUEBA EL NOMBRE DEL CAMPO)*** ERROR';
end;

end.
