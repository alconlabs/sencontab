unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, FMTBcd, ADODB,
  ComCtrls, ExtCtrls, DBXpress, SqlExpr, CRSQLConnection;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BtnConectarERPSystem: TBitBtn;
    BtnConectarEMP_TEST: TBitBtn;
    sADOConnection: TADOConnection;
    ListBoxTables: TListBox;
    ListBoxFields: TListBox;
    ListBoxFieldTypes: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBoxFieldLengths: TListBox;
    Label4: TLabel;
    ListBoxAllowNULL: TListBox;
    Label5: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabClass: TTabSheet;
    TabModel: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    MemoClass: TMemo;
    MemoModel: TMemo;
    BtnGeneraClass: TBitBtn;
    EditSingular: TLabeledEdit;
    EditPlural: TLabeledEdit;
    BtnGeneralModelo: TButton;
    SaveDialog: TSaveDialog;
    BtnSaveModel: TButton;
    BtnSaveClass: TButton;
    SQLServer: TCRSQLConnection;
    LabelSQLServer: TLabel;
    procedure BtnConectarERPSystemClick(Sender: TObject);
    procedure BtnConectarEMP_TESTClick(Sender: TObject);
    procedure ListBoxTablesClick(Sender: TObject);
    procedure BtnGeneraClassClick(Sender: TObject);
    procedure BtnGeneralModeloClick(Sender: TObject);
    procedure BtnSaveClassClick(Sender: TObject);
    procedure BtnSaveModelClick(Sender: TObject);
  private
    Singular   :string;
    Plural     :string;
    F          :Integer; {MaxLengthFieldName}
    L          :Integer;
    function RFill(StrData :string; Long :Integer):string;
    function LFill(StrData :string; Long :Integer):string;
    function GetMaxLengthFieldName:Integer;
    procedure PrepareGlobalData;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Math;

{$R *.dfm}


function TForm1.LFill(StrData :string; Long :Integer):string;
var Mascara :string;
    i       :Integer;
begin
   Mascara := '';
   for i := 1 to Long do Mascara := Mascara + ' ';

   if Length(Trim(StrData)) < Long then begin
      Result := Copy(Mascara, 1, Long-Length(StrData)) + StrData;
   end
   else begin
      Result := Copy(StrData, 1, Long);
   end;
end;

function TForm1.RFill(StrData :string; Long :Integer):string;
var Mascara :string;
    i       :Integer;
begin
   Mascara := '';
   for i := 1 to Long do Mascara := Mascara + ' ';

   if Length(Trim(StrData)) < Long then begin
      Result := StrData + Copy(Mascara, 1, Long-Length(StrData));
   end
   else begin
      Result := Copy(StrData, 1, Long);
   end;
end;

function TForm1.GetMaxLengthFieldName:Integer;
var i :Integer;
begin
   Result := 0;
   for i := 0 to ListBoxFields.Items.Count -1 do begin
      Result := Max(Length(ListBoxFields.Items[i]), Result);
   end;
end;

procedure TForm1.PrepareGlobalData;
begin
   Singular := Trim(EditSingular.Text);
   Plural   := Trim(EditPlural.Text);
   F        := GetMaxLengthFieldName;
   L        := F + Length(Singular);
end;

procedure TForm1.BtnConectarERPSystemClick(Sender: TObject);
var QTables  :TSQLQuery;
begin
   ListBoxTables.Items.Clear;
   SQLServer.Close;
   try
      //SQLServer.Params.Values['Database'] := 'TEST05';// Trim(EditDatabaseName.Text);
      SQLServer.Open;
      LabelSQLServer.Caption := 'CONNECTED';

      { Get the table names of the system }
      QTables := TSQLQuery.Create(Self);
      QTables.SQLConnection := SQLServer;
      try
         QTables.SQL.Add('SELECT NAME        ');
         QTables.SQL.Add('FROM   SYSOBJECTS  ');
         QTables.SQL.Add('WHERE  XTYPE=''u'' ');
         QTables.SQL.Add('ORDER BY NAME      ');
         QTables.Open;
         while not QTables.EOF do begin
            ListBoxTables.Items.Add(QTables.FieldByName('NAME').AsString);
            QTables.Next;
         end;
      finally
         QTables.Free;
      end;
   except
      LabelSQLServer.Caption := 'Not Connected';
   end;

end;

procedure TForm1.BtnConectarEMP_TESTClick(Sender: TObject);
begin
   //ADOConnection.Close;
   //ADOConnection.ConnectionString := 'Provider=SQLOLEDB.1;Password=masterkey;Persist Security Info=True;User ID=sa;Initial Catalog=EMP_TEST;Data Source=VM_DELPHI_7\SQLExpress';
   //ADOConnection.Open;
   //ADOConnection.GetTableNames(ListBoxTables.Items);
end;

procedure TForm1.ListBoxTablesClick(Sender: TObject);
var i :Integer;
    Q :TSQLQuery;
begin
   ListBoxFieldTypes.Items.Clear;
   ListBoxFieldLengths.Items.Clear;
   ListBoxAllowNULL.Items.Clear;
   if (ListBoxTables.Count > 0) then begin
      SQLServer.GetFieldNames(ListBoxTables.Items[ListBoxTables.ItemIndex], ListBoxFields.Items);
   end;


   Q := TSQLQuery.Create(nil);
   Q.SQLConnection := SQLServer;
   Q.SQL.Add('SELECT TABLE_CATALOG           ,    ');
   Q.SQL.Add('	      TABLE_SCHEMA            ,    ');
   Q.SQL.Add('       TABLE_NAME              ,    ');
   Q.SQL.Add('       COLUMN_NAME             ,    ');
   Q.SQL.Add('       ORDINAL_POSITION        ,    ');
   Q.SQL.Add('       COLUMN_DEFAULT          ,    ');
   Q.SQL.Add('       IS_NULLABLE             ,    ');
   Q.SQL.Add('       DATA_TYPE               ,    ');
   Q.SQL.Add('       CHARACTER_MAXIMUM_LENGTH,    ');
   Q.SQL.Add('       NUMERIC_PRECISION       ,    ');
   Q.SQL.Add('       NUMERIC_PRECISION_RADIX ,    ');
   Q.SQL.Add('       NUMERIC_SCALE           ,    ');
   Q.SQL.Add('       DATETIME_PRECISION           ');
   Q.SQL.Add('FROM  INFORMATION_SCHEMA.COLUMNS    ');
   Q.SQL.Add('WHERE TABLE_NAME  = :prmTABLE_NAME  ');
   Q.SQL.ADd('AND   COLUMN_NAME = :prmCOLUMN_NAME ');
   Q.SQL.Add('ORDER BY ORDINAL_POSITION           ');
   try
      for i := 0 to ListBoxFields.Items.Count -1 do begin
         Q.ParamByName('prmTABLE_NAME' ).Value := ListBoxTables.Items[ListBoxTables.ItemIndex];
         Q.ParamByName('prmCOLUMN_NAME').Value := ListBoxFields.Items[i];
         Q.Open;
         try
           ListBoxFieldTypes.Items.Add(Q.FieldByName('DATA_TYPE').AsString);
           ListBoxFieldLengths.Items.Add(Q.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsString);
           ListBoxAllowNULL.Items.Add(Q.FieldByName('IS_NULLABLE').AsString);
         finally Q.Close;
         end;
      end;
   finally Q.Free;
   end; 
end;

procedure TForm1.BtnGeneraClassClick(Sender: TObject);
var i          :Integer;
    {IsTheLast  :Boolean;} {$Message Warn 'En casi todos lo bucles hay que implementar IsTheLast'}
    IsTheFirst :Boolean;
begin
   PrepareGlobalData;
   MemoClass.Lines.Clear;
   with MemoClass.Lines do begin
     Add('(***********************************************************)');
     Add('(* Unit generated automaticaly. Modify width care, please. *)');
     Add('(* (c) 2012 by Juan C.Cilleruelo                           *)');
     Add('(* The result unit is GPL code                             *)');
     Add('(* contact with me at juanc.cilleruelo@gmail.com           *)');
     Add('(***********************************************************)');
     Add('unit '+Singular+'Class;');
     Add('');
     Add('interface');
     Add('');
     Add('uses Classes, StdCtrls;');
     Add('');
     Add('{ TABLE NAME = '+ListBoxTables.Items[ListBoxTables.ItemIndex]+'  }');
     Add('{=== Column Definition ===}');
     for i := 0 to ListBoxFields.Items.Count -1 do begin
        Add('{ '+RFill(ListBoxFields.Items[i]      , 15)+#9+
                 RFill(ListBoxFieldTypes.Items[i]  , 10)+#9+
                 LFill(ListBoxFieldLengths.Items[i],  4)+#9+' NULL Allowed  '+
                 RFill(ListBoxAllowNULL.Items[i]   ,  5)+' }');
     end;
     Add('{=== ================= ===}');
     Add('');
     Add('type');
     Add('   T'+Singular+'Field = (');
     IsTheFirst := True;
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if not IsTheFirst then
          MemoClass.Lines[MemoClass.Lines.Count - 1] := MemoClass.Lines[MemoClass.Lines.Count -1]+', '
        else IsTheFirst := False;
        Add('      '+RFill(Lowercase(Singular) + ListBoxFields.Items[i], L));
     end;
     Add('   );');
     Add('');
     Add('   T'+Singular+'FieldNamesDef = array['+LowerCase(Singular)+ListBoxFields.Items[0]+'..'+
           LowerCase(Singular)+ListBoxFields.Items[ListBoxFields.Items.Count - 1]+'] of string;');
     Add('');
     Add('const '+Singular+'FieldNames: T'+Singular+'FieldNamesDef = (');
     IsTheFirst := True;
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if not IsTheFirst then
          MemoClass.Lines[MemoClass.Lines.Count - 1] := MemoClass.Lines[MemoClass.Lines.Count -1]+', '
        else IsTheFirst := False;
        Add('            '''+RFill(ListBoxFields.Items[i]+'''', F+1));
     end;
     Add('            );');
     Add('type');
     Add('  T'+Singular+' = class(TPersistent)');
     Add('  private');
     Add('    FNullFields :array[T'+Singular+'Field] of Boolean;');
     Add('    FRequired   :array[T'+Singular+'Field] of Boolean;');
     Add('    FLengths    :array[T'+Singular+'Field] of Integer;');
     Add('    FMasks      :array[T'+Singular+'Field] of string; ');
     Add('    FHints      :array[T'+Singular+'Field] of string;  {for show help in status bar }');
     Add('    FCharCase   :array[T'+Singular+'Field] of TEditCharCase;');
     Add('    FChanged    :array[T'+Singular+'Field] of Boolean;');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'char'   )
        or (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'varchar') then begin
          Add('    procedure Set'+RFill(ListBoxFields.Items[i], F)+'(const Value :string);');
        end else
        if LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'int' then begin
          Add('    procedure Set'+RFill(ListBoxFields.Items[i], F)+'(const Value :Integer);');
        end;
     end;
     Add('    {------------------------------------------------}');
     Add('    procedure SetNotNull(prmField :T'+Singular+'Field);');
     Add('    procedure SetChanged(prmField :T'+Singular+'Field);');
     Add('  protected');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'char'   )
        or (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'varchar') then begin
          Add('    F'+RFill(ListBoxFields.Items[i], F+1)+'     :string;');
        end else
        if LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'int' then begin
          Add('    F'+RFill(ListBoxFields.Items[i], F+1)+'     :Integer;');
        end else
     end;
     Add('    function GetLength(prmField :T'+Singular+'Field):Integer;');
     Add('    function GetHint(prmField :T'+Singular+'Field):string;');
     Add('    function GetCharCase(prmField :T'+Singular+'Field):TEditCharCase;');
     Add('    procedure SetNull(prmField :T'+Singular+'Field);');
     Add('  public');
     Add('    constructor Create; virtual;');
     Add('    destructor Destroy; override;');
     Add('    procedure Initialize; virtual;');
     Add('    function  IsNull(prmField :T'+Singular+'Field):Boolean;');
     Add('    function  IsChanged(prmField :T'+Singular+'Field):Boolean;');
     Add('    procedure CompareWith(prmData :T'+Singular+');');
     Add('  published');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'char'   )
        or (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'varchar') then begin
          Add('    property '+RFill(ListBoxFields.Items[i], F)+' :string read F'
                             +RFill(ListBoxFields.Items[i], F)+' write Set'+RFill(ListBoxFields.Items[i], F)+';');
        end else
        if LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'int' then begin
          Add('    property '+RFill(ListBoxFields.Items[i], F)+' :Integer read F'
                             +RFill(ListBoxFields.Items[i], F)+' write Set'+RFill(ListBoxFields.Items[i], F)+';');
        end;
     end;
     Add('  end;');

     {---- End of Interface ----}
     Add('');
     Add('implementation');
     Add('uses SysUtils;');
     Add('');
     Add('{ T'+Singular+' }');
     Add('constructor T'+Singular+'.Create;');
     Add('begin');
     Add('   Initialize;');
     Add('end;');
     Add('');
     Add('destructor T'+Singular+'.Destroy;');
     Add('begin');
     Add('   inherited;');
     Add('end;');
     Add('');
     Add('procedure T'+Singular+'.Initialize;');
     Add('var i :T'+Singular+'Field;');
     Add('begin');
     Add('   for i := Low(T'+Singular+'Field) to High(T'+Singular+'Field) do begin');
     Add('      FNullFields[i] := True;');
     Add('      FChanged[i]    := False;');
     Add('      FMasks  [i]    := '''';');
     Add('      FCharCase[i]   := ecUpperCase;');
     Add('   end;');
     Add('');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if UpperCase(Trim(ListBoxAllowNULL.Items[i])) = 'YES' then begin
          Add('   FRequired['+LowerCase(Singular)+RFill(ListBoxFields.Items[i], F)+'] := False;');
        end else
        if UpperCase(Trim(ListBoxAllowNULL.Items[i])) = 'NO' then begin
          Add('   FRequired['+LowerCase(Singular)+RFill(ListBoxFields.Items[i], F)+'] := False;');
        end;
     end;
     Add('');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        Add('   FLengths['+LowerCase(Singular)+RFill(ListBoxFields.Items[i], F)+'] := '+Trim(LFill(ListBoxFieldLengths.Items[i], 4))+';');
     end;
     Add('');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        Add('   FHints['+LowerCase(Singular)+RFill(ListBoxFields.Items[i], F)+'] := '''';');
     end;
     Add('end;');
     Add('');
     Add('procedure T'+Singular+'.SetNotNull(prmField :T'+Singular+'Field);');
     Add('begin');
     Add('   FNullFields[prmField] := False;');
     Add('end;');
     Add('');
     Add('procedure T'+Singular+'.SetChanged(prmField :T'+Singular+'Field);');
     Add('begin');
     Add('   FChanged[prmField] := True;');
     Add('end;');
     Add('');
     Add('function T'+Singular+'.GetLength(prmField :T'+Singular+'Field):Integer;');
     Add('begin');
     Add('   Result := FLengths[prmField];');
     Add('end;');
     Add('');
     Add('function T'+Singular+'.GetHint(prmField :T'+Singular+'Field):string;');
     Add('begin');
     Add('   Result := FHints[prmField];');
     Add('end;');
     Add('');
     Add('function T'+Singular+'.GetCharCase(prmField :T'+Singular+'Field):TEditCharCase;');
     Add('begin');
     Add('   Result := FCharCase[prmField];');
     Add('end;');
     Add('');
     Add('function T'+Singular+'.IsNull(prmField :T'+Singular+'Field):Boolean;');
     Add('begin');
     Add('   Result := FNullFields[prmField];');
     Add('end;');
     Add('');
     Add('procedure T'+Singular+'.SetNull(prmField :T'+Singular+'Field);');
     Add('begin');
     Add('   FNullFields[prmField] := True;');
     Add('   FChanged[prmField]    := True;');
     Add('end;');
     Add('');
     Add('function T'+Singular+'.IsChanged(prmField :T'+Singular+'Field):Boolean;');
     Add('begin');
     Add('   Result := FChanged[prmField];');
     Add('end;');
     Add('');
     Add('procedure T'+Singular+'.CompareWith(prmData :T'+Singular+');');
     Add('begin');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        Add('   if '+RFill(ListBoxFields.Items[i], F)+' <> prmData.'
                    +RFill(ListBoxFields.Items[i], F)+' then SetChanged('
                    +Lowercase(Singular)+RFill(ListBoxFields.Items[i], F)+');');
     end;
     Add('end;');
     Add('');

     {---- Form here to the end of file, the Setters ----}

     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'char'   )
        or (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'varchar') then begin
          Add('procedure T'+Singular+'.Set'+ListBoxFields.Items[i]+'(const Value :string);');
          Add('begin');
          Add('   if (Trim(Value) <> '''') and IsNull('+LowerCase(Singular)+ListBoxFields.Items[i]+') then begin');
          Add('      F'+ListBoxFields.Items[i]+' := Value;');
          Add('      SetNotNull('+LowerCase(Singular)+ListBoxFields.Items[i]+');');
          Add('      SetChanged('+LowerCase(Singular)+ListBoxFields.Items[i]+');');
          Add('   end;');
          Add('end;');
          Add('');
        end else
        if LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'int' then begin
          Add('procedure T'+Singular+'.Set'+ListBoxFields.Items[i]+'(const Value :Integer);');
          Add('begin');
          Add('   if IsNull('+LowerCase(Singular)+ListBoxFields.Items[i]+') then begin');
          Add('      F'+ListBoxFields.Items[i]+' := Value;');
          Add('      SetNotNull('+LowerCase(Singular)+ListBoxFields.Items[i]+');');
          Add('      SetChanged('+LowerCase(Singular)+ListBoxFields.Items[i]+');');
          Add('   end;');
          Add('end;');
          Add('');
        end;
     end;
     Add('end.');
   end;
end;

procedure TForm1.BtnGeneralModeloClick(Sender: TObject);
var i          :Integer;
    IsTheFirst :Boolean; 
begin
   PrepareGlobalData;
   MemoModel.Lines.Clear;
   with MemoModel.Lines do begin
     Add('(***********************************************************)');
     Add('(* Unit generated automaticaly. Modify width care, please. *)');
     Add('(* (c) 2009 by Juan C.Cilleruelo                           *)');
     Add('(* The result unit is GPL code                             *)');
     Add('(* contact with me at juanc.cilleruelo@gmail.com           *)');
     Add('(***********************************************************)');
     Add('unit Custom'+Plural+'Model;');
     Add('');
     Add('interface');
     Add('');
     Add('uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,');
     Add('     '+Singular+'Class, CRSQLConnection;');
     Add('');
     Add('{ TABLE NAME = '+ListBoxTables.Items[ListBoxTables.ItemIndex]+'  }');
     Add('{=== Column Definition ===}');
     for i := 0 to ListBoxFields.Items.Count -1 do begin
        Add('{ '+RFill(ListBoxFields.Items[i]      ,   F)+#9+
                 RFill(ListBoxFieldTypes.Items[i]  ,  10)+#9+
                 LFill(ListBoxFieldLengths.Items[i],   4)+' NULL Allowed  '+#9+
                 RFill(ListBoxAllowNULL.Items[i]   ,   5)+' }');
     end;
     Add('{=== ================= ===}');
     Add('');
     Add('type');
     Add('  TCustom'+Plural+'Model = class');
     Add('  private');
     Add('    FConnection  :TCRSQLConnection;');
     Add('    FDataSet   :TSQLQuery;');
     Add('    FTableName :string;');
     Add('    FOrderBy   :string;');
     Add('    FLastError :string;');
     Add('    function GetRowsAffected:Integer;');
     Add('    function GetRowCount    :Integer;');
     Add('    function GetEOF :Boolean;');
     Add('    procedure ClearLastError;');
     Add('  public');
     Add('    constructor Create(prmConnection :TCRSQLConnection); reintroduce;');
     Add('    destructor  Destroy; override;');
     Add('    function  Open :Boolean;');
     Add('    function QueryByExample(prmValue :T'+Singular+'):Boolean;');
     Add('    function Save(prmData :T'+Singular+'):Boolean;');
     Add('    function Update(prmData, prmOldDato :T'+Singular+'):Boolean;');
     Add('    function Delete(prmData :T'+Singular+'):Boolean;');
     Add('    //function  ExistsChildrenKey(prmData :T'+Singular+'):Boolean;');
     Add('    //function  PreviouslyExistsKey(prmData :T'+Singular+'):Boolean;');
     Add('    function  Current :T'+Singular+';');
     Add('    function  First:Boolean;');
     Add('    function  Prior:Boolean;');
     Add('    function  Next:Boolean;');
     Add('    function  Last:Boolean;');
     Add('    function  Locate(prmData :T'+Singular+'):Boolean;');
     Add('    function  GetDefaults:T'+Singular+';');
     Add('    { Public properties}');
     Add('    property Connection :TCRSQLConnection  read FConnection;');
     Add('    property EOF :Boolean read GetEOF;');
     Add('    property RowsAffected :Integer read GetRowsAffected;');
     Add('    property RowCount     :Integer read GetRowCount;');
     Add('  end;');

     {---- End of Interface ----}
     Add('');
     Add('implementation');
     Add('uses TypInfo;');
     Add('');
     Add('constructor TCustom'+Plural+'Model.Create(prmConnection :TCRSQLConnection);');
     Add('begin');
     Add('   inherited Create;');
     Add('   FConnection := prmConnection; ');
     Add('   FTableName := '''+ListBoxTables.Items[ListBoxTables.ItemIndex]+''';');
     Add('   FOrderBy   := '''+ListBoxFields.Items[0]+''';');
     Add('   FDataSet := TSQLQuery.Create(nil);');
     Add('   FDataSet.SQLConnection := prmConnection;');
     Add('end;');
     Add('');
     Add('destructor TCustom'+Plural+'Model.Destroy;');
     Add('begin');
     Add('   FDataSet.Free;');
     Add('   FDataSet := nil;');
     Add('   inherited;');
     Add('end;');
     Add('');
     Add('procedure TCustom'+Plural+'Model.ClearLastError;');
     Add('begin');
     Add('   FLastError := '''';');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.GetRowsAffected:Integer;');
     Add('begin');
     Add('   {$Message Warn ''No funciona el RowsAffected con dbExpress''}');
     Add('   Result := FDataSet.RowsAffected;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.GetRowCount:Integer;');
     Add('begin');
     Add('   {$Message Warn ''No funciona RecordCount con dbExpress''}');
     Add('   Result := FDataSet.RecordCount;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.GetEOF:Boolean;');
     Add('begin');
     Add('   if FDataSet = nil  then');
     Add('      Result := True');
     Add('   else');
     Add('   if not FDataSet.Active then');
     Add('      Result := True');
     Add('   else Result := FDataSet.EOF;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Open:Boolean;');
     Add('begin');
     Add('   FDataSet.Close;');
     Add('   FDataSet.ParamCheck := True;');
     Add('   //FDataSet.LockType := ltReadOnly;');
     Add('   //FDataSet.CursorLocation := clUseClient;');
     Add('   FDataSet.SQL.Clear;');

     IsTheFirst := True;
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        Add('   FDataSet.SQL.Add(''       '+ListBoxFields.Items[i]);
        if IsTheFirst then begin
           MemoModel.Lines[MemoModel.Lines.Count - 1] := '   FDataSet.SQL.Add(''SELECT '+ListBoxFields.Items[i]+', '');';
           IsTheFirst := False;
        end
        else begin
           {IsTheLast}
           if i = (ListBoxFields.Items.Count -1) then begin
              MemoModel.Lines[MemoModel.Lines.Count - 1] := MemoModel.Lines[MemoModel.Lines.Count - 1]+' '');';
           end
           else MemoModel.Lines[MemoModel.Lines.Count - 1] := MemoModel.Lines[MemoModel.Lines.Count - 1]+', '');';
        end;
     end;
     Add('   FDataSet.SQL.Add(''FROM   '+ListBoxTables.Items[ListBoxTables.ItemIndex]+''');');
     Add('   FDataSet.SQL.Add(''ORDER BY '+ListBoxFields.Items[0]+' '');');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     FDataSet.Open;');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');

     Add('function TCustom'+Plural+'Model.QueryByExample(prmValue :T'+Singular+'):Boolean;');
     Add('var i :T'+Singular+'Field;');
     Add('    IsFirst  :Boolean;');
     Add('begin');
     Add('   //try');
     Add('     FDataSet.Close;');
     Add('     FDataSet.ParamCheck := True;');
     Add('     //FDataSet.LockType := ltReadOnly;');
     Add('     //FDataSet.CursorLocation := clUseClient;');
     Add('     FDataSet.SQL.Clear;');
     Add('     FDataSet.SQL.Add(''SELECT '');');
     Add('     try');
     Add('        IsFirst := True;');
     Add('        for i := Low(T'+Singular+'Field) to High(T'+Singular+'Field) do');
     Add('        begin');
     Add('           if not IsFirst then');
     Add('              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+'', '' ');
     Add('           else IsFirst := False;');
     Add('           FDataSet.SQL.Add(UpperCase('+Singular+'FieldNames[i]));');
     Add('        end;');
     Add('');
     Add('        FDataSet.SQL.Add('' FROM '' + FTableName + '' '');');
     Add('');
     Add('        IsFirst := True;');
     Add('        for i := Low(T'+Singular+'Field) to High(T'+Singular+'Field) do');
     Add('        begin');
     Add('           if not prmValue.IsNull(i) then');
     Add('           begin');
     Add('             FDataSet.SQL.Add('+Singular+'FieldNames[i] + '' = :prm'' + '+Singular+'FieldNames[i]);');
     Add('             FDataSet.ParamByName(''prm''+'+Singular+'FieldNames[i]).Value := GetPropValue(prmValue, '+Singular+'FieldNames[i]);');
     Add('             if not IsFirst then');
     Add('                FDataSet.SQL[FDataSet.SQL.Count - 1] := ''AND ''+FDataSet.SQL[FDataSet.SQL.Count - 1]');
     Add('             else begin');
     Add('                IsFirst := False;');
     Add('                FDataSet.SQL[FDataSet.SQL.Count - 1] := ''WHERE ''+FDataSet.SQL[FDataSet.SQL.Count - 1]');
     Add('             end;');
     Add('           end;');
     Add('        end;');
     Add('        if Trim(FOrderBy) <> '''' then');
     Add('           FDataSet.SQL.Add(''ORDER BY '' + FOrderBy);');
     Add('     finally');
     Add('     end;');
     Add('     FDataSet.Open;');
     Add('   //except');
     Add('   //  raise EDatabaseError.Create(''Error querying'');');
     Add('   //end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Save(prmData :T'+Singular+'):Boolean;');
     Add('var SQL     :TStringList;');
     Add('    Q       :TSQLQuery;');
     Add('    i       :T'+Singular+'Field;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   SQL := TStringList.Create;');
     Add('   try');
     Add('     SQL.Add(''INSERT INTO '+Plural+' ('');');
     Add('     for i := Low(T'+Singular+'Field) to High(T'+Singular+'Field) do');
     Add('     begin');
     Add('        if not prmData.IsNull(i) then');
     Add('        begin');
     Add('          SQL.Add('+Singular+'FieldNames[i]+'','');');
     Add('        end;');
     Add('     end;');
     Add('     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+'')'';');
     Add('     SQL.Add(''VALUES ('');');
     Add('     for i := Low(T'+Singular+'Field) to High(T'+Singular+'Field) do');
     Add('     begin');
     Add('        if not prmData.IsNull(i) then');
     Add('        begin');
     Add('          SQL.Add('':prm''+'+Singular+'FieldNames[i]+'','');');
     Add('        end;');
     Add('     end;');
     Add('     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+'')'';');
     Add('');
     Add('     Q := FConnection.CreateQuery(['''']);');
     Add('     Q.SQL.Assign(SQL);');
     Add('     try');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        Add('       if not prmData.IsNull('+RFill(Singular+ListBoxFields.Items[i], F+Length(Singular))+') then');
        Add('          Q.ParamByName(''prm'+RFill(ListBoxFields.Items[i]+'''', F+3{prm})+').Value := prmData.'+ListBoxFields.Items[i]+';');
     end;
     Add('       Result := True;');
     Add('       try Q.ExecSQL;');
     Add('       except');
     Add('         on E : Exception do begin');
     Add('           Result := False;');
     Add('           FLastError := E.Message;');
     Add('         end;');
     Add('       end;');
     Add('     finally Q.Free;');
     Add('     end;');
     Add('   finally');
     Add('     SQL.Free;');
     Add('   end;');
     Add('end;');
     Add('');

     Add('function TCustom'+Plural+'Model.Update(prmData, prmOldDato :T'+Singular+'):Boolean;');
     Add('var Q     :TStringList;');
     Add('    First :Boolean;');
     Add('');
     Add('    //procedure AQU(UpdateQueryRow :string);');
     Add('    //begin');
     Add('    //   if not First then Q.Add('','');');
     Add('    //   Q.Add(UpdateQueryRow);');
     Add('    //   First := False;');
     Add('    //end;');
     Add('begin');
     Add('   //Caso 1: Un campo que tenía un valor, ahora tiene un nulo.');
     Add('   //Caso 2: Un campo que no es nulo pero no ha cambiado.');
     Add('   //Caso 3: Nos llegan dos datos idénticos. Nada que actualizar.');
     Add('');
     Add('   //Esta query puede ser local. No tiene por qué utilizarse la global');
     Add('');
     Add('   ClearLastError;');
     Add('   //prmData.CompareWith(prmOldDato);');
     Add('');
     Add('   //First := True;');
     Add('   //Q := TStringList.Create;');
     Add('   //Q.Add(''UPDATE USUARIOS SET    '');');
     Add('   //{If PrimaryKey changed }');
     Add('   //if prmData.CD_USUARIO <> prmOldDato.CD_USUARIO then begin');
     Add('   //   Q.Add(''CD_USUARIO = :prmCD_USUARIO'');');
     Add('   //   First := False;');
     Add('   //end;');
     Add('   //if not prmData.IsChanged(usuarioDS_USUARIO) then AQU(''DS_USUARI = :prmDS_USUARIO '');');
     Add('   //Q.Add(''WHERE CD_USUARIO = :prmPK_CD_USUARIO '');');
     Add('');
     Add('   //FDataSet.Close;');
     Add('   //FDataSet.ParamCheck := True;');
     Add('   //FDataSet.SQL.Text := Q.Text;');
     Add('   //try');
     Add('   //  try');
     Add('   //    with FDataSet do begin');
     Add('   //      if prmData.CD_USUARIO <> prmOldDato.CD_USUARIO then begin');
     Add('   //         ParamByName(''prmCD_USUARIO'').Value := prmData.CD_USUARIO;');
     Add('   //      end;');
     Add('   //      {Primary Key, always shall be assigned }');
     Add('   //      ParamByName(''prmPK_CD_USUARIO'').Value := prmOldDato.CD_USUARIO;');
     Add('   //      if not prmData.IsNull('+Singular+'DS_USUARIO)');
     Add('   //         then ParamByName(''prmDS_USUARIO'').Value := prmData.DS_USUARIO;');
     Add('   //    end;');
     Add('   //    FDataSet.ExecSQL;');
     Add('   //    except on E:Exception do');
     Add('   //       raise Exception.CreateFmt(''Error %d : %s'', [0, E.Message]);');
     Add('   //    end;');
     Add('   //finally Q.Free;');
     Add('   //end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Delete(prmData :T'+Singular+'):Boolean;');
     Add('var Q :TSQLQuery;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   Q := FConnection.CreateQuery([''DELETE FROM '+ListBoxTables.Items[ListBoxTables.ItemIndex]+''',');
     Add('                                 ''WHERE '+ListBoxFields.Items[0]+' = :prm'+ListBoxFields.Items[0]+''']);');
     Add('   try');
     Add('     Q.ParamCheck := True;');
     Add('{Message Error ''change the primary key fields reference if necesary''}');
     Add('     Q.Params[0].Value := prmData.'+ListBoxFields.Items[0]+';');
     Add('     try');
     Add('       Q.ExecSQL;');
     Add('     except');
     Add('       on E : Exception do begin');
     Add('         Result     := False;');
     Add('         FLastError := E.Message;');
     Add('       end;');
     Add('     end;');
     Add('     if Result and (Q.RowsAffected = 0) then begin');
     Add('        Result     := False;');
     Add('        FLastError := ''Not deleted anything'';');
     Add('     end;');
     Add('   finally Q.Free;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Current :T'+Singular+';');
     Add('var Item :T'+Singular+';');
     Add('    //i   :TUsuarioField;');
     Add('begin');
     Add('   Item := T'+Singular+'.Create;');
     Add('   //for i := Low(TUsuarioField) to High(TUsuarioField) do');
     Add('   //begin');
     Add('   //   Item.CD_USUARIO := FDataSet.FieldByName(''CD_USUARIO'').AsString;');
     Add('   //end;');
     for i := 0 to ListBoxFields.Items.Count - 1 do begin
        if (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'char'   )
        or (LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'varchar') then begin
          Add('   if not(FDataSet.FieldByName('''+RFill(ListBoxFields.Items[i]+'''', F+1)+').IsNull) then');
          Add('      Item.'+RFill(ListBoxFields.Items[i], F)+' := Trim(FDataSet.FieldByName('''+ListBoxFields.Items[i]+''').AsString);');
        end else
        if LowerCase(Trim(ListBoxFieldTypes.Items[i])) = 'int' then begin
          Add('   if not(FDataSet.FieldByName('''+RFill(ListBoxFields.Items[i]+'''', F+1)+').IsNull) then');
          Add('      Item.'+ListBoxFields.Items[i]+' := FDataSet.FieldByName('''+ListBoxFields.Items[i]+''').AsInteger;');
        end;
     end;
     //Add('   if not(FDataSet.FieldByName(''CD_USUARIO'').IsNull) then');
     //Add('      Item.CD_USUARIO := FDataSet.FieldByName(''CD_USUARIO'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''DS_USUARIO'').IsNull) then');
     //Add('      Item.DS_USUARIO := FDataSet.FieldByName(''DS_USUARIO'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''PASSWORD'').IsNull) then');
     //Add('      Item.PASSWORD := FDataSet.FieldByName(''PASSWORD'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''CD_TIPOUSUARIO'').IsNull) then');
     //Add('      Item.CD_TIPOUSUARIO := FDataSet.FieldByName(''CD_TIPOUSUARIO'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''EMAIL_USUARIO'').IsNull) then');
     //Add('      Item.EMAIL_USUARIO := FDataSet.FieldByName(''EMAIL_USUARIO'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''TELEFONO'').IsNull) then');
     //Add('      Item.TELEFONO := FDataSet.FieldByName(''TELEFONO'').AsString;');
     //Add('   if not(FDataSet.FieldByName(''TELEFONO_MOVIL'').IsNull) then');
     //Add('      Item.TELEFONO_MOVIL := FDataSet.FieldByName(''TELEFONO_MOVIL'').AsString;');
     Add('');
     Add('   Result := Item;');
     Add('end;');

     Add('');
     Add('function TCustom'+Plural+'Model.First:Boolean;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     FDataSet.First;');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Prior:Boolean;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     FDataSet.Prior;');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Next:Boolean;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     FDataSet.Next;');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Last:Boolean;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     FDataSet.Last;');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.Locate(prmData :T'+Singular+'):Boolean;');
     Add('begin');
     Add('   ClearLastError;');
     Add('   Result := True;');
     Add('   try');
     Add('     //FDataSet.Locate(''ID_ZONA'', prmID_ZONA, []);');
     Add('   except');
     Add('     on E : Exception do begin');
     Add('       Result := False;');
     Add('       FLastError := E.Message;');
     Add('     end;');
     Add('   end;');
     Add('end;');
     Add('');
     Add('function TCustom'+Plural+'Model.GetDefaults:T'+Singular+';');
     Add('begin');
     Add('   Result := T'+Singular+'.Create;');
     Add('   //Result.CD_USUARIO := '';');
     Add('   //Result.DS_USUARIO := '';');
     Add('end;');
     Add('');
     Add('end.');
   end;
end;

procedure TForm1.BtnSaveClassClick(Sender: TObject);
begin
   PrepareGlobalData;
   SaveDialog.FileName := Singular+'Class.pas';
   SaveDialog.InitialDir := 'C:\ERPhoenix\Almacen\ModelLayer';
   if SaveDialog.Execute then begin
      MemoClass.Lines.SaveToFile(SaveDialog.FileName);
   end;
end;

procedure TForm1.BtnSaveModelClick(Sender: TObject);
begin
   PrepareGlobalData;
   SaveDialog.FileName := 'Custom'+Plural+'Model.pas';
   SaveDialog.InitialDir := 'C:\cviews\sencontab\Models';
   if SaveDialog.Execute then begin
      MemoModel.Lines.SaveToFile(SaveDialog.FileName);
   end;
end;



end.
