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
    FPrimaryKey  :array[TUserField] of Boolean;
    FNullFields  :array[TUserField] of Boolean;
    FRequired    :array[TUserField] of Boolean;
    FLengths     :array[TUserField] of Integer;
    FMasks       :array[TUserField] of string; 
    FHints       :array[TUserField] of string;  {for show help in status bar }
    FCharCase    :array[TUserField] of TEditCharCase;
    FChanged     :array[TUserField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TUserField] of Boolean;
    FNullOlds    :array[TUserField] of Boolean;
    procedure SetCD_USER      (const Value :string);
    procedure SetDS_USER      (const Value :string);
    procedure SetPASSWORD     (const Value :string);
    procedure SetADMINISTRATOR(const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TUserField);
    procedure SetChanged(prmField :TUserField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TUserField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TUserField);                                    
    procedure ClearValueField(Field :TUserField);                                      
    function GetVersion :string;                                                               
  protected
    FCD_USER            :string;
    FDS_USER            :string;
    FPASSWORD           :string;
    FADMINISTRATOR      :string;
    FOLD_CD_USER            :string;
    FOLD_DS_USER            :string;
    FOLD_PASSWORD           :string;
    FOLD_ADMINISTRATOR      :string;
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
    function  FieldToString(prmField :TUserField):string;
    procedure CompareWith(prmData :TUser);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TUserField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property CD_USER_OldValue       :string read FOLD_CD_USER      ;
    property DS_USER_OldValue       :string read FOLD_DS_USER      ;
    property PASSWORD_OldValue      :string read FOLD_PASSWORD     ;
    property ADMINISTRATOR_OldValue :string read FOLD_ADMINISTRATOR;
  published
    property CD_USER       :string read FCD_USER       write SetCD_USER      ;
    property DS_USER       :string read FDS_USER       write SetDS_USER      ;
    property PASSWORD      :string read FPASSWORD      write SetPASSWORD     ;
    property ADMINISTRATOR :string read FADMINISTRATOR write SetADMINISTRATOR;
  end;

implementation
uses SysUtils, TypInfo;

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
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TUserField) to High(TUserField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;

   FPrimaryKey[userCD_USER    ] := True;

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

procedure TUser.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TUserField); 
begin                                                                                            
   if not FOldAssigned[Field] then begin                                                         
      { IS the First Assignation }                                                               
      if IsNullOrEmpty(Value) then begin                                                         
         { The Value is Empty or NULL }                                                          
         if FEmptyStringToNull then begin                                                        
            FOldAssigned[Field]  := True;                                                        
            FNullOlds[Field]     := True;                                                        
            REF_OLD_VAR          := Value;                                                       
            FNullFields[Field]   := True;                                                        
            REF_VAR              := Value;                                                       
         end                                                                                     
         else begin                                                                              
            FOldAssigned[Field]  := True;                                                        
            FNullOlds[Field]     := False;                                                       
            REF_OLD_VAR          := Value;                                                       
            FNullFields[Field]   := False;                                                       
            REF_VAR              := Value;                                                       
         end;                                                                                    
      end                                                                                        
      else begin                                                                                 
         {NOT IS NULL or Empty}                                                                  
         FOldAssigned[Field]  := True;                                                           
         FNullOlds[Field]     := False;                                                          
         REF_OLD_VAR          := Value;                                                          
         FNullFields[Field]   := False;                                                          
         REF_VAR              := Value;                                                          
      end;                                                                                       
      { Because is the First Assignation we set the value unchanged }                            
      FChanged[Field] := False;                                                                  
   end                                                                                           
   else begin                                                                                    
      { NOT IS the First Assignation }                                                           
      if IsNullOrEmpty(Value) then begin                                                         
         { The Value is NULL or Empty}                                                           
         if FEmptyStringToNull then begin                                                        
            FNullFields[Field]  := True;                                                         
            REF_VAR             := Value;                                                        
         end                                                                                     
         else begin                                                                              
            FNullFields[Field]  := False;                                                        
            REF_VAR             := Value;                                                        
         end;                                                                                    
      end                                                                                        
      else begin                                                                                 
         {NOT IS NULL or Empty }                                                                 
         FNullFields[Field]  := False;                                                           
         REF_VAR             := Value;                                                           
      end;                                                                                       
      { Because is not the First Assignation we set the value CHANGED }                          
      FChanged[Field] := True;                                                                   
   end;                                                                                          
end;                                                                                             

function TUser.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TUser.AcceptChanges();                                       
var Field :TUserField;                                                 
begin                                                                          
   for Field := Low(TUserField) to High(TUserField) do begin   
      FOldAssigned[Field] := True;                                             
      FChanged[Field]     := False;                                            
      if IsNull(Field) then begin                                              
         FNullOlds[Field] := True;                                             
         ClearValueField(Field);                                               
      end                                                                      
      else begin                                                               
         FNullOlds[Field] := False;                                            
         AcceptFieldChange(Field);                                             
      end;                                                                     
   end;                                                                        
end;                                                                           

procedure TUser.AcceptFieldChange(Field :TUserField);
begin
   case Field of
      userCD_USER       :FOLD_CD_USER       := FCD_USER      ;
      userDS_USER       :FOLD_DS_USER       := FDS_USER      ;
      userPASSWORD      :FOLD_PASSWORD      := FPASSWORD     ;
      userADMINISTRATOR :FOLD_ADMINISTRATOR := FADMINISTRATOR;
   end;
end;

procedure TUser.ClearValueField(Field :TUserField);
begin
   case Field of
      userCD_USER       :FCD_USER       := '';
      userDS_USER       :FDS_USER       := '';
      userPASSWORD      :FPASSWORD      := '';
      userADMINISTRATOR :FADMINISTRATOR := '';
   end;
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

function TUser.IsPrimaryKey(Field :TUserField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TUser.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'CD_USER'       then IsPrimaryKey(userCD_USER      ) else
   if Field = 'DS_USER'       then IsPrimaryKey(userDS_USER      ) else
   if Field = 'PASSWORD'      then IsPrimaryKey(userPASSWORD     ) else
   if Field = 'ADMINISTRATOR' then IsPrimaryKey(userADMINISTRATOR);
end;

procedure TUser.SetCD_USER(const Value :string);
begin
   AssignString(Value, FCD_USER, FOLD_CD_USER, userCD_USER); 
end;

procedure TUser.SetDS_USER(const Value :string);
begin
   AssignString(Value, FDS_USER, FOLD_DS_USER, userDS_USER); 
end;

procedure TUser.SetPASSWORD(const Value :string);
begin
   AssignString(Value, FPASSWORD, FOLD_PASSWORD, userPASSWORD); 
end;

procedure TUser.SetADMINISTRATOR(const Value :string);
begin
   AssignString(Value, FADMINISTRATOR, FOLD_ADMINISTRATOR, userADMINISTRATOR); 
end;


function TUser.FieldToString(prmField: TUserField): string; 
begin                                                                       
   Result := UserFieldNames[prmField];                                      
   //GetEnumName(TypeInfo(TUserField), Integer(prmField));                  
end;                                                                        
                                                                            
function TUser.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
