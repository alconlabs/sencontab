(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit UserClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = USERS  }
{=== Column Definition ===}
{ CD_USER        	char      	  12	 NULL Allowed  No    }
{ DS_USER        	varchar   	  80	 NULL Allowed  YES   }
{ PASSWORD       	varchar   	  40	 NULL Allowed  No    }
{ ADMINISTRATOR  	char      	   1	 NULL Allowed  No    }
{=== ================= ===}

type
   TUserField = (
      userCD_USER      , 
      userDS_USER      , 
      userPASSWORD     , 
      userADMINISTRATOR
   );

   TUserFieldNamesDef = array[userCD_USER..userADMINISTRATOR] of string;

const UserFieldNames: TUserFieldNamesDef = (
            'CD_USER'      , 
            'DS_USER'      , 
            'PASSWORD'     , 
            'ADMINISTRATOR'
            );
type
  TUser = class(TPersistent)
  private
    FNullFields :array[TUserField] of Boolean;
    FRequired   :array[TUserField] of Boolean;
    FLengths    :array[TUserField] of Integer;
    FMasks      :array[TUserField] of string; 
    FHints      :array[TUserField] of string;  {for show help in status bar }
    FCharCase   :array[TUserField] of TEditCharCase;
    FChanged    :array[TUserField] of Boolean;
    procedure SetCD_USER      (const Value :string);
    procedure SetDS_USER      (const Value :string);
    procedure SetPASSWORD     (const Value :string);
    procedure SetADMINISTRATOR(const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TUserField);
    procedure SetChanged(prmField :TUserField);
  protected
    FCD_USER            :string;
    FDS_USER            :string;
    FPASSWORD           :string;
    FADMINISTRATOR      :string;
    function GetLength(prmField :TUserField):Integer;
    function GetHint(prmField :TUserField):string;
    function GetCharCase(prmField :TUserField):TEditCharCase;
    procedure SetNull(prmField :TUserField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TUserField):Boolean;
    function  IsChanged(prmField :TUserField):Boolean;
    procedure CompareWith(prmData :TUser);
  published
    property CD_USER       :string read FCD_USER       write SetCD_USER      ;
    property DS_USER       :string read FDS_USER       write SetDS_USER      ;
    property PASSWORD      :string read FPASSWORD      write SetPASSWORD     ;
    property ADMINISTRATOR :string read FADMINISTRATOR write SetADMINISTRATOR;
  end;

implementation
uses SysUtils;

{ TUser }
constructor TUser.Create;
begin
   Initialize;
end;

destructor TUser.Destroy;
begin
   inherited;
end;

procedure TUser.Initialize;
var i :TUserField;
begin
   for i := Low(TUserField) to High(TUserField) do begin
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
   end;

   FRequired[userCD_USER      ] := False;
   FRequired[userDS_USER      ] := False;
   FRequired[userPASSWORD     ] := False;
   FRequired[userADMINISTRATOR] := False;

   FLengths[userCD_USER      ] := 12;
   FLengths[userDS_USER      ] := 80;
   FLengths[userPASSWORD     ] := 40;
   FLengths[userADMINISTRATOR] := 1;

   FHints[userCD_USER      ] := '';
   FHints[userDS_USER      ] := '';
   FHints[userPASSWORD     ] := '';
   FHints[userADMINISTRATOR] := '';
end;

procedure TUser.SetNotNull(prmField :TUserField);
begin
   FNullFields[prmField] := False;
end;

procedure TUser.SetChanged(prmField :TUserField);
begin
   FChanged[prmField] := True;
end;

function TUser.GetLength(prmField :TUserField):Integer;
begin
   Result := FLengths[prmField];
end;

function TUser.GetHint(prmField :TUserField):string;
begin
   Result := FHints[prmField];
end;

function TUser.GetCharCase(prmField :TUserField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TUser.IsNull(prmField :TUserField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TUser.SetNull(prmField :TUserField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TUser.IsChanged(prmField :TUserField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TUser.CompareWith(prmData :TUser);
begin
   if CD_USER       <> prmData.CD_USER       then SetChanged(userCD_USER      );
   if DS_USER       <> prmData.DS_USER       then SetChanged(userDS_USER      );
   if PASSWORD      <> prmData.PASSWORD      then SetChanged(userPASSWORD     );
   if ADMINISTRATOR <> prmData.ADMINISTRATOR then SetChanged(userADMINISTRATOR);
end;

procedure TUser.SetCD_USER(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(userCD_USER) then begin
      FCD_USER := Value;
      SetNotNull(userCD_USER);
      SetChanged(userCD_USER);
   end;
end;

procedure TUser.SetDS_USER(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(userDS_USER) then begin
      FDS_USER := Value;
      SetNotNull(userDS_USER);
      SetChanged(userDS_USER);
   end;
end;

procedure TUser.SetPASSWORD(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(userPASSWORD) then begin
      FPASSWORD := Value;
      SetNotNull(userPASSWORD);
      SetChanged(userPASSWORD);
   end;
end;

procedure TUser.SetADMINISTRATOR(const Value :string);
begin
   if (Trim(Value) <> '') and IsNull(userADMINISTRATOR) then begin
      FADMINISTRATOR := Value;
      SetNotNull(userADMINISTRATOR);
      SetChanged(userADMINISTRATOR);
   end;
end;

end.
