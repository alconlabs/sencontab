unit ListOfOptions;

interface

uses Contnrs, DBClient, OptionClass;

type
  TOptionsList = class (TObjectList)
  private
    function CreateClientDataSet:TClientDataset;
  protected
    procedure SetObject(Index :Integer; Item: TOption);
    function  GetObject(Index :Integer):TOption;
  public
    constructor Create; overload;
    function LoadFromFile(prmFileName :string):Boolean;
    function SaveToFile(prmFileName :string):Boolean;
    function  Add(Obj :TOption):Integer;
    procedure Insert(Index :Integer; Obj :TOption);
    property  Options[Index :Integer]:TOption read GetObject write SetObject; default;
{
    ----From TList
    procedure Clear;
    procedure Pack;
    procedure Sort(Compare: TListSortCompare);
    property Capacity: Integer read FCapacity write SetCapacity;
    property Count: Integer read FCount write SetCount;

    ---From TObjectList
    function  Add(AObject: TObject): Integer;
    procedure Insert(Index: Integer; AObject: TObject);
    function  Extract(Item: TObject): TObject;
    function  Remove(AObject: TObject): Integer;

    function  First :TObject;
    function  Last  :TObject;

    function  IndexOf(AObject: TObject): Integer;
    function  FindInstanceOf(AClass: TClass; AExact: Boolean = True; AStartAt: Integer = 0): Integer;
}
  end;

implementation
uses Classes, DB, XMLDoc, XMLDom, XMLIntf;

{ TOptionsList }
constructor TOptionsList.Create;
begin
   inherited Create;
   OwnsObjects := True;
end;

function TOptionsList.Add(Obj: TOption): Integer;
begin
   Result := inherited Add(Obj);
end;

function TOptionsList.GetObject(Index: Integer): TOption;
begin
   Result := inherited Items[Index] as TOption;
end;

procedure TOptionsList.Insert(Index: Integer; Obj: TOption);
begin
   inherited Insert(Index, Obj);
end;

procedure TOptionsList.SetObject(Index: Integer; Item: TOption);
begin
   inherited Items[Index] := Item;
end;

function TOptionsList.CreateClientDataSet: TClientDataset;
begin
   Result := TClientDataset.Create(nil);

   Result.FieldDefs.Add('CD_OPTION'          , ftString, 100, True);
   Result.FieldDefs.Add('DS_OPTION'          , ftString, 100, False);
   Result.FieldDefs.Add('CD_PARENT_OPTION'   , ftString, 100, False);
   Result.FieldDefs.Add('NAME_IN_FONT_SOURCE', ftString, 100, False);
   Result.FieldDefs.Add('HELP_PAGE_LINK'     , ftString, 100, True);
   Result.FieldDefs.Add('APPLICATION'        , ftString,  15, True);

   Result.CreateDataSet;
   Result.Open;
end;

function TOptionsList.LoadFromFile(prmFileName: string): Boolean;
// Loads the values from a list in a XML File.
var XML    :TClientDataSet;
    Option :TOption;
    i      :Integer;
begin
   Self.Clear; {Delete all the previous items from the list}
   XML := CreateClientDataSet;
   XML.LoadFromFile(prmFileName);
   try
     for i := 0 to XML.RecordCount -1 do begin
         Option := TOption.Create;
         Option.CD_OPTION           := XML.FieldByName('CD_OPTION'          ).AsString;
         Option.CD_PARENT_OPTION    := XML.FieldByName('CD_PARENT_OPTION'   ).AsString;
         Option.DS_OPTION           := XML.FieldByName('DS_OPTION'          ).AsString;
         Option.NAME_IN_FONT_SOURCE := XML.FieldByName('NAME_IN_FONT_SOURCE').AsString;
         Option.HELP_PAGE_LINK      := XML.FieldByName('HELP_PAGE_LINK'     ).AsString;
         Option.APPLICATION         := XML.FieldByName('APPLICATION'        ).AsString;
         Self.Add(Option);
     end;
   finally
      XML.Free;
   end;
end;

function TOptionsList.SaveToFile(prmFileName: string): Boolean;
var XML :TClientDataset;
    i   :Integer;
begin
   XML := CreateClientDataset;
   try
      for i := 0 to Count -1 do begin
         XML.Append;
         XML.FieldByName('CD_OPTION'          ).AsString := Options[i].CD_OPTION;
         XML.FieldByName('DS_OPTION'          ).AsString := Options[i].DS_OPTION;
         XML.FieldByName('CD_PARENT_OPTION'   ).AsString := Options[i].CD_PARENT_OPTION;
         XML.FieldByName('NAME_IN_FONT_SOURCE').AsString := Options[i].NAME_IN_FONT_SOURCE;
         XML.FieldByName('HELP_PAGE_LINK'     ).AsString := Options[i].HELP_PAGE_LINK;
         XML.FieldByName('APPLICATION'        ).AsString := Options[i].APPLICATION;
         XML.Post;
      end;

      XML.SaveToFile(prmFileName, dfXMLUTF8);
   finally
      XML.Free;
   end;
end;

end.
  

