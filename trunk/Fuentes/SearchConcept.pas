unit SearchConcept;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,Forms, Dialogs, Grids,
     DB, DBTables, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask,
     DBGrids, DBClient, IBCustomDataSet, IBDatabase, IBTableSet, IBQuery;

type
  TFormSearchConcept = class(TForm)
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
    QueryID_CONCEPTOS: TIBStringField;
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
    FID_Concept     :string;
    FDS_Concept     :string;
    FTimer          :TTimer;
    FTextSearched   :string;
    FOrderFieldName :string;
    procedure ExecuteSearch;
    procedure SetTextSearched(Value :string);
    function  GetTextSearched:string;
    function  GetSQLOrderField:string;
    property SQLOrderField  :string read GetSQLOrderField;
  public
    property ID_Concept     :string read FID_Concept     write FID_Concept;
    property DS_Concept     :string read FDS_Concept     write FDS_Concept;
    property DelayTimer     :TTimer read FTimer;
    property TextSearched   :string read GetTextSearched write SetTextSearched;
    property OrderFieldName :string read FOrderFieldName write FOrderFieldName;
    constructor Create(ADBConnection :TIBDatabase); reintroduce;
  end;

implementation
{$R *.DFM}
uses ccStr;

constructor TFormSearchConcept.Create(ADBConnection :TIBDatabase);
begin
   inherited Create(Application);
   Query.Database    := ADBConnection;
   Query.Transaction := ADBConnection.DefaultTransaction;
end;

procedure TFormSearchConcept.SetTextSearched(Value :string);
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

function TFormSearchConcept.GetTextSearched: string;
begin
  Result := Trim(StrReplaceCharWithStr(FTextSearched, '%', ' '));
end;

function TFormSearchConcept.GetSQLOrderField: string;
begin
   if FOrderFieldName = 'ID_CONCEPTOS'      then Result := 'CONCEPTOS.ID_CONCEPTOS'  else
	  if FOrderFieldName = 'DESCRIPCION'       then Result := 'CONCEPTOS.DESCRIPCION'   else
   raise Exception.Create('Bad definition on field list for the search.');
end;

procedure TFormSearchConcept.BtnAcceptClick(Sender: TObject);
begin
   FID_CONCEPT := QueryID_CONCEPTOS.AsString;
   FDS_CONCEPT := QueryDESCRIPCION.AsString;

   ModalResult := mrOK;
end;

procedure TFormSearchConcept.BtnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFormSearchConcept.FormCreate(Sender: TObject);
var i :Word;
begin
   FTimer := TTimer.Create(Self);
   FTimer.Enabled  := False;
   FTimerInterval  := 400;
   FTimer.Interval := FTimerInterval;
   FTimer.OnTimer  := OnEditTimerEvent;

   LabelTabla.Caption := 'Conceptos Contables';
   DBGrid.DataSource  := DataSource;

   CurrentQueryText := TStringList.Create;
   PreviusQueryText := TStringList.Create;
   
   PreviusQueryText.Add(Query.SQL.Text);
   for i := 0 to DBGrid.Columns.Count -1 do begin
       DBGrid.Columns[i].DropDownRows := i;
   end;

   FOrderFieldName := Query.Fields[0].FieldName;
end;

procedure TFormSearchConcept.FormShow(Sender: TObject);
begin
   EditSearchText.Text := TextSearched;
   EditSearchText.SetFocus;
   EditSearchText.SelectAll;
   ExecuteSearch;
end;

procedure TFormSearchConcept.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(FTimer);
   Query.SQL.Text := PreviusQueryText.Text;
   PreviusQueryText.Free;
   CurrentQueryText.Free;
end;

procedure TFormSearchConcept.ExecuteSearch;
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
             'WHERE (CONCEPTOS.ID_CONCEPTOS   ||''|''||  '+
             '       CONCEPTOS.DESCRIPCION)              ');
             {$Message Warn 'The correct version for this is the SQL version'}

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

procedure TFormSearchConcept.DBGridTitleClick(Column: TColumn);
begin
   OrderFieldName := Column.FieldName;
   ExecuteSearch;
end;

procedure TFormSearchConcept.EditSearchTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFormSearchConcept.DBGridDblClick(Sender: TObject);
begin
   BtnAccept.Click;
end;

procedure TFormSearchConcept.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   EditSearchText.SetFocus;
   EditSearchText.SelLength := 0;
   EditSearchText.SelStart  := Length(EditSearchText.Text);
end;

procedure TFormSearchConcept.OnEditTimerEvent(Sender: TObject);
begin
   if EditSearchText.Text <> tmpSearchText then begin
      tmpSearchText := EditSearchText.Text;
      ExecuteSearch;
   end;
end;

procedure TFormSearchConcept.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

