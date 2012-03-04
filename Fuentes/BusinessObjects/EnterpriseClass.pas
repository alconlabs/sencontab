(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit EnterpriseClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = ENTERPRISES  }
{=== Column Definition ===}
{ CD_ENTERPRISE  	char      	  12	 NULL Allowed  No    }
{ DS_ENTERPRISE  	varchar   	  80	 NULL Allowed  No    }
{ CLOSED         	char      	   1	 NULL Allowed  No    }
{ BLOCKED        	char      	   1	 NULL Allowed  No    }
{=== ================= ===}

type
   TEnterpriseField = (
      enterpriseCD_ENTERPRISE, 
      enterpriseDS_ENTERPRISE, 
      enterpriseCLOSED       , 
      enterpriseBLOCKED      
   );

   TEnterpriseFieldNamesDef = array[enterpriseCD_ENTERPRISE..enterpriseBLOCKED] of string;

const EnterpriseFieldNames: TEnterpriseFieldNamesDef = (
            'CD_ENTERPRISE', 
            'DS_ENTERPRISE', 
            'CLOSED'       , 
            'BLOCKED'      
            );
type
  TEnterprise = class(TCollectionItem)
  private
    FNullFields :array[TEnterpriseField] of Boolean;
    FRequired   :array[TEnterpriseField] of Boolean;
    FLengths    :array[TEnterpriseField] of Integer;
    FMasks      :array[TEnterpriseField] of string; 
    FHints      :array[TEnterpriseField] of string;  {for show help in status bar }
    FCharCase   :array[TEnterpriseField] of TEditCharCase;
    FChanged    :array[TEnterpriseField] of Boolean;
    procedure SetCD_ENTERPRISE(const Value :string);
    procedure SetDS_ENTERPRISE(const Value :string);
    procedure SetCLOSED       (const Value :string);
    procedure SetBLOCKED      (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TEnterpriseField);
    procedure SetChanged(prmField :TEnterpriseField);
  protected
    FCD_ENTERPRISE      :string;
    FDS_ENTERPRISE      :string;
    FCLOSED             :string;
    FBLOCKED            :string;
    function GetLength(prmField :TEnterpriseField):Integer;
    function GetHint(prmField :TEnterpriseField):string;
    function GetCharCase(prmField :TEnterpriseField):TEditCharCase;
    procedure SetNull(prmField :TEnterpriseField);
  public

    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TEnterpriseField):Boolean;
    function  IsChanged(prmField :TEnterpriseField):Boolean;
    procedure CompareWith(prmDato :TEnterprise);
  published
    property CD_ENTERPRISE :string read FCD_ENTERPRISE write SetCD_ENTERPRISE;
    property DS_ENTERPRISE :string read FDS_ENTERPRISE write SetDS_ENTERPRISE;
    property CLOSED        :string read FCLOSED        write SetCLOSED       ;
    property BLOCKED       :string read FBLOCKED       write SetBLOCKED      ;
  end;

implementation
uses SysUtils;

{ TEnterprise }
constructor TEnterprise.Create;
begin
   Initialize;
end;

destructor TEnterprise.Destroy;
begin
   inherited;
end;

procedure TEnterprise.Initialize;
var i :TEnterpriseField;
begin
   for i := Low(TEnterpriseField) to High(TEnterpriseField) do begin
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
   end;

   FRequired[enterpriseCD_ENTERPRISE] := False;
   FRequired[enterpriseDS_ENTERPRISE] := False;
   FRequired[enterpriseCLOSED       ] := False;
   FRequired[enterpriseBLOCKED      ] := False;

   FLengths[enterpriseCD_ENTERPRISE] := 12;
   FLengths[enterpriseDS_ENTERPRISE] := 80;
   FLengths[enterpriseCLOSED       ] := 1;
   FLengths[enterpriseBLOCKED      ] := 1;

   FHints[enterpriseCD_ENTERPRISE] := '';
   FHints[enterpriseDS_ENTERPRISE] := '';
   FHints[enterpriseCLOSED       ] := '';
   FHints[enterpriseBLOCKED      ] := '';
end;

procedure TEnterprise.SetNotNull(prmField :TEnterpriseField);
begin
   FNullFields[prmField] := False;
end;

procedure TEnterprise.SetChanged(prmField :TEnterpriseField);
begin
   FChanged[prmField] := True;
end;

function TEnterprise.GetLength(prmField :TEnterpriseField):Integer;
begin
   Result := FLengths[prmField];
end;

function TEnterprise.GetHint(prmField :TEnterpriseField):string;
begin
   Result := FHints[prmField];
end;

function TEnterprise.GetCharCase(prmField :TEnterpriseField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TEnterprise.IsNull(prmField :TEnterpriseField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TEnterprise.SetNull(prmField :TEnterpriseField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TEnterprise.IsChanged(prmField :TEnterpriseField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TEnterprise.CompareWith(prmDato :TEnterprise);
begin
   if CD_ENTERPRISE <> prmDato.CD_ENTERPRISE then SetChanged(enterpriseCD_ENTERPRISE);
   if DS_ENTERPRISE <> prmDato.DS_ENTERPRISE then SetChanged(enterpriseDS_ENTERPRISE);
   if CLOSED        <> prmDato.CLOSED        then SetChanged(enterpriseCLOSED       );
   if BLOCKED       <> prmDato.BLOCKED       then SetChanged(enterpriseBLOCKED      );
end;

procedure TEnterprise.SetCD_ENTERPRISE(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(enterpriseCD_ENTERPRISE) then begin
      FCD_ENTERPRISE := Value;
      SetNotNull(enterpriseCD_ENTERPRISE);
      SetChanged(enterpriseCD_ENTERPRISE);
   end;
end;

procedure TEnterprise.SetDS_ENTERPRISE(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(enterpriseDS_ENTERPRISE) then begin
      FDS_ENTERPRISE := Value;
      SetNotNull(enterpriseDS_ENTERPRISE);
      SetChanged(enterpriseDS_ENTERPRISE);
   end;
end;

procedure TEnterprise.SetCLOSED(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(enterpriseCLOSED) then begin
      FCLOSED := Value;
      SetNotNull(enterpriseCLOSED);
      SetChanged(enterpriseCLOSED);
   end;
end;

procedure TEnterprise.SetBLOCKED(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(enterpriseBLOCKED) then begin
      FBLOCKED := Value;
      SetNotNull(enterpriseBLOCKED);
      SetChanged(enterpriseBLOCKED);
   end;
end;

initialization
  RegisterClasses([TEnterprise]);

end.
