unit SearchAccount;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,Forms, Dialogs, Grids,
     DB, DBTables, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask,
     DBGrids, DBClient, IBCustomDataSet, IBDatabase, IBTableSet, IBQuery, DM, CustomView;

type
  TFormSearchAccount = class(TCustomView)
    DBGrid: TDBGrid;
    PanelArriba: TPanel;
    EditSearchText: TEdit;
    MemoQuery: TMemo;
    Panel1: TPanel;
    DataSource: TDataSource;
    ccResButton1: TSpeedButton;
    LabelTabla: TLabel;
    Query: TIBQuery;
    BtnAccept: TSpeedButton;
    BtnCancel: TSpeedButton;
    QuerySUBCUENTA: TIBStringField;
    QueryDESCRIPCION: TIBStringField;
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditSearchTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnEditTimerEvent(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    PreviusQueryText :TStringList;
    CurrentQueryText :TStringList;
    FTimerInterval   :Integer;
    tmpSearchText    :string;
    { Property Fields }
    FCD_Account     :string;
    FDS_Account     :string;
    FTimer          :TTimer;
    FTextSearched   :string;
    FOrderFieldName :string;
    procedure ExecuteSearch;
    procedure SetTextSearched(Value :string);
    function  GetTextSearched:string;
    function  GetSQLOrderField:string;
    property SQLOrderField  :string read GetSQLOrderField;
  public
    property CD_Account     :string read FCD_Account     write FCD_Account;
    property DS_Account     :string read FDS_Account     write FDS_Account;
    property DelayTimer     :TTimer read FTimer;
    property TextSearched   :string read GetTextSearched write SetTextSearched;
    property OrderFieldName :string read FOrderFieldName write FOrderFieldName;
    constructor Create(ADBConnection :TIBDatabase); reintroduce;
  end;

implementation
{$R *.DFM}
uses ccStr;

constructor TFormSearchAccount.Create(ADBConnection :TIBDatabase);
begin
   inherited Create(Application);
   Query.Database    := ADBConnection;
   Query.Transaction := ADBConnection.DefaultTransaction;
end;

procedure TFormSearchAccount.SetTextSearched(Value :string);
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

function TFormSearchAccount.GetTextSearched: string;
begin
  Result := Trim(StrReplaceCharWithStr(FTextSearched, '%', ' '));
end;

function TFormSearchAccount.GetSQLOrderField: string;
begin
   if FOrderFieldName = 'SUBCUENTA'         then Result := 'SUBCTAS.SUBCUENTA'       else
	  if FOrderFieldName = 'DESCRIPCION'       then Result := 'SUBCTAS.DESCRIPCION'     else
   raise Exception.Create('Bad definition on field list for the search.');
end;

procedure TFormSearchAccount.BtnAcceptClick(Sender: TObject);
begin
   FCD_ACCOUNT := QuerySUBCUENTA.AsString;
   FDS_ACCOUNT := QueryDESCRIPCION.AsString;

   ModalResult := mrOK;
end;

procedure TFormSearchAccount.BtnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFormSearchAccount.FormCreate(Sender: TObject);
var i :Word;
begin
   FTimer := TTimer.Create(Self);
   FTimer.Enabled  := False;
   FTimerInterval  := 400;
   FTimer.Interval := FTimerInterval;
   FTimer.OnTimer  := OnEditTimerEvent;

   LabelTabla.Caption := 'Cuentas Contables';
   DBGrid.DataSource  := DataSource;

   CurrentQueryText := TStringList.Create;
   PreviusQueryText := TStringList.Create;
   
   PreviusQueryText.Add(Query.SQL.Text);
   for i := 0 to DBGrid.Columns.Count -1 do begin
       DBGrid.Columns[i].DropDownRows := i;
   end;

   FOrderFieldName := Query.Fields[0].FieldName;
end;

procedure TFormSearchAccount.FormShow(Sender: TObject);
begin
   EditSearchText.Text := TextSearched;
   EditSearchText.SetFocus;
   EditSearchText.SelectAll;
   ExecuteSearch;
end;

procedure TFormSearchAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(FTimer);
   Query.SQL.Text := PreviusQueryText.Text;
   PreviusQueryText.Free;
   CurrentQueryText.Free;
end;

procedure TFormSearchAccount.ExecuteSearch;
begin
   FTimer.Enabled := False;
   Query.DisableControls;
   try Query.Close;
       CurrentQueryText.Clear;
       CurrentQueryText.Assign(PreviusQueryText);
       TextSearched := EditSearchText.Text;
       if Length(FTextSearched) > 0 then begin
         CurrentQueryText.Add(
             {Versión for SQL Server}
             //'WHERE (RTRIM(LTRIM(           SUBCTAS.SUBCUENTA                     ))  + ''|''+  '+
             //'       RTRIM(LTRIM(ISNULL(    SUBCTAS.DESCRIPCION            , ''''))))           ');
             {Versión for InterBase - FireBird}
             'WHERE (SUBCTAS.SUBCUENTA   ||''|''||  '+
             '       SUBCTAS.DESCRIPCION)           ');

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

       CurrentQueryText.Add('ORDER BY '+SQLOrderField);
       if MemoQuery.Visible then MemoQuery.Lines := CurrentQueryText;
       Query.SQL.Text := CurrentQueryText.Text;
       Query.Open;
   finally
      Query.EnableControls;
   end;
end;

procedure TFormSearchAccount.DBGridTitleClick(Column: TColumn);
begin
   OrderFieldName := Column.FieldName;
   ExecuteSearch;
end;

procedure TFormSearchAccount.EditSearchTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   FTimer.Enabled := False;
   FTimer.Interval := FTimerInterval;
   case Key of
      VK_UP , VK_DOWN , VK_HOME,
      VK_END, VK_PRIOR, VK_NEXT :SendMessage(DBGrid.Handle, WM_KEYDOWN, Key         , 0);
      VK_RIGHT                  :SendMessage(DBGrid.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
      VK_LEFT                   :SendMessage(DBGrid.Handle, WM_HSCROLL, SB_LINELEFT , 0);
   end;
   FTimer.Enabled := True;
end;

procedure TFormSearchAccount.DBGridDblClick(Sender: TObject);
begin
   BtnAccept.Click;
end;

procedure TFormSearchAccount.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   EditSearchText.SetFocus;
   EditSearchText.SelLength := 0;
   EditSearchText.SelStart  := Length(EditSearchText.Text);
end;

procedure TFormSearchAccount.OnEditTimerEvent(Sender: TObject);
begin
   if EditSearchText.Text <> tmpSearchText then begin
      tmpSearchText := EditSearchText.Text;
      ExecuteSearch;
   end;
end;

procedure TFormSearchAccount.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         Key := 0;
         BtnCancel.Click;
      end;
      VK_RETURN :begin
         Key := 0;
         if Query.RecordCount > 0 then begin
            BtnAccept.Click;
         end;
      end;
   end;
end;

end.

