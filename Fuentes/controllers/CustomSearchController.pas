unit CustomSearchController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls, Forms, DBGrids,
     DBController,
     CurrentConfigClass,
     DMSearch,
     SearchView;
type
  TCustomSearchController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    FView          :TSearchView;

    FTextSearched   :string;
    FTimer          :TTimer;

    FSearchText  :string;
    FOrderFieldName :string;

    PreviusQueryText :TStringList;
    FWhereQuery      :TStringList;
    FBaseQuery       :TStringList;
    FTimerInterval   :Integer;

    procedure SetTextSearched(Value :string);
    function  GetTextSearched:string;
    procedure ExecuteSearch;
    function  StrReplaceCharWithStr(prmStr :string; RemoveChar: Char; ReplaceStr :string):string;
  protected
    DM :TDataModuleSearch;
    procedure InitializeView;           virtual;
    function  GetSQLOrderField:string;  virtual;
    {Delegate declarations}
    procedure OnShowForm    (Sender :TObject);
    procedure On_FormClose  (Sender: TObject; var Action: TCloseAction);
    procedure OnKeyDown_Form(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure OnTimerEvent(Sender: TObject);

    procedure OnClick_Accept(Sender :TObject); virtual;
    procedure OnClick_Cancel(Sender :TObject);

    procedure OnDoubleClick_DBGrid(Sender: TObject);
    procedure OnTitleClick_DBGrid(Column: TColumn);
    procedure OnKeyDown_DBGrid(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure OnKeyDown_EditSearchText(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    procedure   AddColumn(prmDBName, prmCaption :string; prmWidth :Integer = 0);
    function ShowView:Boolean;
    property TextSearched   :string      read GetTextSearched write SetTextSearched;
    property OrderFieldName :string      read FOrderFieldName write FOrderFieldName;
    property SQLOrderField  :string      read GetSQLOrderField;
    property DelayTimer     :TTimer      read FTimer;
    property View           :TSearchView read FView           write FView;
    property WhereQuery     :TStringList read FWhereQuery     write FWhereQuery;
    property BaseQuery      :TStringList read FBaseQuery      write FBaseQuery;
  end;

implementation
uses SysUtils, Dialogs, DB, Windows, Messages, 
     CustomView;

constructor TCustomSearchController.Create(prmConfig :TCurrentConfig);
var i :Integer;
begin
   inherited Create(prmConfig.DBConnection);

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModuleSearch, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TSearchView, FView);

   FBaseQuery        := TStringList.Create;
   FWhereQuery       := TStringList.Create;

   PreviusQueryText := TStringList.Create;

   FView.DataSource.DataSet  := DM.Query;

   FView.AppleIcons := [aiClose];
   FView.AppleIconsVisibles := [aiClose];

   FView.Caption     := '### Assign a text to the Caption property of the View ###';

   FView.DBGrid.Columns.Clear;

   InitializeView;

   DM.Query.DataSet.CommandText := BaseQuery.Text;

   DM.Query.Open;
   DM.Query.FieldDefs.Update;
   FOrderFieldName := DM.Query.Fields[0].FieldName;

   for i := 0 to FView.DBGrid.Columns.Count -1 do begin
       FView.DBGrid.Columns[i].DropDownRows := i;
   end;
end;

destructor TCustomSearchController.Destroy;
begin
   FWhereQuery.Free;
   FBaseQuery.Free;

   DM.Free;
   FView.Free;
end;

function TCustomSearchController.ShowView:Boolean;
begin
   {Assignament of Resources}
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

procedure TCustomSearchController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.DataSource  := FView.DataSource;
   FView.EditSearchText.Text := TextSearched;
   FView.EditSearchText.SetFocus;
   FView.EditSearchText.SelectAll;
   ExecuteSearch;
end;

procedure TCustomSearchController.OnClick_Accept(Sender: TObject);
begin
   FView.ModalResult := mrOK;
end;

procedure TCustomSearchController.OnClick_Cancel(Sender: TObject);
begin
   FView.ModalResult := mrCancel;
end;

procedure TCustomSearchController.On_FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(FTimer);
end;

procedure TCustomSearchController.OnDoubleClick_DBGrid(Sender: TObject);
begin
   FView.BtnAccept.Click;
end;

procedure TCustomSearchController.OnKeyDown_DBGrid(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   FView.EditSearchText.SetFocus;
   FView.EditSearchText.SelLength := 0;
   FView.EditSearchText.SelStart  := Length(FView.EditSearchText.Text);
end;

procedure TCustomSearchController.OnKeyDown_EditSearchText(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TCustomSearchController.OnKeyDown_Form(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TCustomSearchController.OnTimerEvent(Sender: TObject);
begin
   if FView.EditSearchText.Text <> FSearchText then begin
      FSearchText := FView.EditSearchText.Text;
      ExecuteSearch;
   end;
end;

procedure TCustomSearchController.OnTitleClick_DBGrid(Column: TColumn);
begin
   OrderFieldName := Column.FieldName;
   ExecuteSearch;
end;

function TCustomSearchController.GetTextSearched: string;
begin
   Result := Trim(StrReplaceCharWithStr(FTextSearched, '%', ' '));
end;

procedure TCustomSearchController.SetTextSearched(Value: string);
var i :Integer;
begin
   FSearchText := Value;
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

procedure TCustomSearchController.ExecuteSearch;
var QueryText :TStringList;
begin
   FTimer.Enabled := False;
   DM.Query.DisableControls;
   QueryText := TStringList.Create;
   try DM.Query.Close;
       QueryText.Assign(FBaseQuery);
       TextSearched := FView.EditSearchText.Text;  {$Message Warn 'tomar la propiedad'}
       if Length(FTextSearched) > 0 then begin
          QueryText.Add(FWhereQuery.Text);
          QueryText.Add('LIKE '''+FTextSearched+''' ');
       end;
       QueryText.Add('ORDER BY ' + SQLOrderField);
       if FView.MemoQuery.Visible then FView.MemoQuery.Lines := QueryText;
       DM.Query.DataSet.CommandText := QueryText.Text;
       DM.Query.Open;
   finally
      QueryText.Free;
      DM.Query.EnableControls;
   end;
end;

function TCustomSearchController.GetSQLOrderField: string;
begin

end;

procedure TCustomSearchController.InitializeView;
begin
   
end;

function TCustomSearchController.StrReplaceCharWithStr(prmStr: string; RemoveChar: Char; ReplaceStr: string): string;
var i :Integer;
begin
   Result := '';
   for i:= 1 to Length(prmStr) do begin
      if (prmStr[i] <> removeChar) then
         Result := Result + prmStr[i]
      else Result:= Result + ReplaceStr;
   end;
end;

procedure TCustomSearchController.AddColumn(prmDBName, prmCaption: string; prmWidth :Integer = 0);
var CurrentColumn :TColumn;
begin
   CurrentColumn := nil;

   CurrentColumn := FView.DBGrid.Columns.Add;
   CurrentColumn.FieldName := prmDBName;
   if prmWidth <> 0 then begin
      CurrentColumn.Width := prmWidth;
   end;
   CurrentColumn.Title.Caption := prmCaption;
end;

end.
