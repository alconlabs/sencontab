unit ListOfProfileOptions;

interface

uses Contnrs, DBClient, ProfileOptionClass;

type
  TProfileOptionsList = class (TObjectList)
  private
  protected
    procedure SetObject(Index :Integer; Item: TProfileOption);
    function  GetObject(Index :Integer):TProfileOption;
  public
    constructor Create; overload;
    function  Add(Obj :TProfileOption):Integer;
    procedure Insert(Index :Integer; Obj :TProfileOption);
    property  Options[Index :Integer]:TProfileOption read GetObject write SetObject; default;
{    ----From TList
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
uses Classes;

{ TOptionsList }
constructor TProfileOptionsList.Create;
begin
   inherited Create;
   OwnsObjects := True;
end;

function TProfileOptionsList.Add(Obj: TProfileOption): Integer;
begin
   Result := inherited Add(Obj);
end;

function TProfileOptionsList.GetObject(Index: Integer): TProfileOption;
begin
   Result := inherited Items[Index] as TProfileOption;
end;

procedure TProfileOptionsList.Insert(Index: Integer; Obj: TProfileOption);
begin
   inherited Insert(Index, Obj);
end;

procedure TProfileOptionsList.SetObject(Index: Integer; Item: TProfileOption);
begin
   inherited Items[Index] := Item;
end;

end.
  

