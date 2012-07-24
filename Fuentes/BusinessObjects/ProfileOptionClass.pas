(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit ProfileOptionClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = PROFILE_OPTIONS  }
{=== Column Definition ===}
{ CD_PROFILE_OPTI	char      	 100	 NULL Allowed  No    }
{ CD_PARENT_PROFI	char      	 100	 NULL Allowed  YES   }
{ CD_PROFILE     	char      	  15	 NULL Allowed  No    }
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{ ALLOW_SEE      	char      	   1	 NULL Allowed  No    }
{ ALLOW_ACCESS   	char      	   1	 NULL Allowed  No    }
{ ALLOW_ADD      	char      	   1	 NULL Allowed  No    }
{ ALLOW_MODIFY   	char      	   1	 NULL Allowed  No    }
{ ALLOW_DELETE   	char      	   1	 NULL Allowed  No    }
{ ALLOW_REPORT   	char      	   1	 NULL Allowed  No    }
{ ALLOW_EXEC     	char      	   1	 NULL Allowed  No    }
{=== ================= ===}

type
   TProfileOptionField = (
      profileoptionCD_PROFILE_OPTION       , 
      profileoptionCD_PARENT_PROFILE_OPTION, 
      profileoptionCD_PROFILE              , 
      profileoptionAPPLICATION             , 
      profileoptionALLOW_SEE               , 
      profileoptionALLOW_ACCESS            , 
      profileoptionALLOW_ADD               , 
      profileoptionALLOW_MODIFY            , 
      profileoptionALLOW_DELETE            , 
      profileoptionALLOW_REPORT            , 
      profileoptionALLOW_EXEC              
   );

   TProfileOptionFieldNamesDef = array[profileoptionCD_PROFILE_OPTION..profileoptionALLOW_EXEC] of string;

const ProfileOptionFieldNames: TProfileOptionFieldNamesDef = (
            'CD_PROFILE_OPTION'       , 
            'CD_PARENT_PROFILE_OPTION', 
            'CD_PROFILE'              , 
            'APPLICATION'             , 
            'ALLOW_SEE'               , 
            'ALLOW_ACCESS'            , 
            'ALLOW_ADD'               , 
            'ALLOW_MODIFY'            , 
            'ALLOW_DELETE'            , 
            'ALLOW_REPORT'            , 
            'ALLOW_EXEC'              
            );
type
  TProfileOption = class(TPersistent)
  private
    FPrimaryKey  :array[TProfileOptionField] of Boolean;
    FNullFields  :array[TProfileOptionField] of Boolean;
    FRequired    :array[TProfileOptionField] of Boolean;
    FLengths     :array[TProfileOptionField] of Integer;
    FMasks       :array[TProfileOptionField] of string; 
    FHints       :array[TProfileOptionField] of string;  {for show help in status bar }
    FCharCase    :array[TProfileOptionField] of TEditCharCase;
    FChanged     :array[TProfileOptionField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TProfileOptionField] of Boolean;
    FNullOlds    :array[TProfileOptionField] of Boolean;
    procedure SetCD_PROFILE_OPTION       (const Value :string);
    procedure SetCD_PARENT_PROFILE_OPTION(const Value :string);
    procedure SetCD_PROFILE              (const Value :string);
    procedure SetAPPLICATION             (const Value :string);
    procedure SetALLOW_SEE               (const Value :string);
    procedure SetALLOW_ACCESS            (const Value :string);
    procedure SetALLOW_ADD               (const Value :string);
    procedure SetALLOW_MODIFY            (const Value :string);
    procedure SetALLOW_DELETE            (const Value :string);
    procedure SetALLOW_REPORT            (const Value :string);
    procedure SetALLOW_EXEC              (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TProfileOptionField);
    procedure SetChanged(prmField :TProfileOptionField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TProfileOptionField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TProfileOptionField);                                    
    procedure ClearValueField(Field :TProfileOptionField);                                      
    function GetVersion :string;                                                               
  protected
    FCD_PROFILE_OPTION             :string;
    FCD_PARENT_PROFILE_OPTION      :string;
    FCD_PROFILE                    :string;
    FAPPLICATION                   :string;
    FALLOW_SEE                     :string;
    FALLOW_ACCESS                  :string;
    FALLOW_ADD                     :string;
    FALLOW_MODIFY                  :string;
    FALLOW_DELETE                  :string;
    FALLOW_REPORT                  :string;
    FALLOW_EXEC                    :string;
    FOLD_CD_PROFILE_OPTION             :string;
    FOLD_CD_PARENT_PROFILE_OPTION      :string;
    FOLD_CD_PROFILE                    :string;
    FOLD_APPLICATION                   :string;
    FOLD_ALLOW_SEE                     :string;
    FOLD_ALLOW_ACCESS                  :string;
    FOLD_ALLOW_ADD                     :string;
    FOLD_ALLOW_MODIFY                  :string;
    FOLD_ALLOW_DELETE                  :string;
    FOLD_ALLOW_REPORT                  :string;
    FOLD_ALLOW_EXEC                    :string;
    function GetLength(prmField :TProfileOptionField):Integer;
    function GetHint(prmField :TProfileOptionField):string;
    function GetCharCase(prmField :TProfileOptionField):TEditCharCase;
    procedure SetNull(prmField :TProfileOptionField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TProfileOptionField):Boolean;
    function  IsChanged(prmField :TProfileOptionField):Boolean;
    function  FieldToString(prmField :TProfileOptionField):string;
    procedure CompareWith(prmData :TProfileOption);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TProfileOptionField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property CD_PROFILE_OPTION_OldValue        :string read FOLD_CD_PROFILE_OPTION       ;
    property CD_PARENT_PROFILE_OPTION_OldValue :string read FOLD_CD_PARENT_PROFILE_OPTION;
    property CD_PROFILE_OldValue               :string read FOLD_CD_PROFILE              ;
    property APPLICATION_OldValue              :string read FOLD_APPLICATION             ;
    property ALLOW_SEE_OldValue                :string read FOLD_ALLOW_SEE               ;
    property ALLOW_ACCESS_OldValue             :string read FOLD_ALLOW_ACCESS            ;
    property ALLOW_ADD_OldValue                :string read FOLD_ALLOW_ADD               ;
    property ALLOW_MODIFY_OldValue             :string read FOLD_ALLOW_MODIFY            ;
    property ALLOW_DELETE_OldValue             :string read FOLD_ALLOW_DELETE            ;
    property ALLOW_REPORT_OldValue             :string read FOLD_ALLOW_REPORT            ;
    property ALLOW_EXEC_OldValue               :string read FOLD_ALLOW_EXEC              ;
  published
    property CD_PROFILE_OPTION        :string read FCD_PROFILE_OPTION        write SetCD_PROFILE_OPTION       ;
    property CD_PARENT_PROFILE_OPTION :string read FCD_PARENT_PROFILE_OPTION write SetCD_PARENT_PROFILE_OPTION;
    property CD_PROFILE               :string read FCD_PROFILE               write SetCD_PROFILE              ;
    property APPLICATION              :string read FAPPLICATION              write SetAPPLICATION             ;
    property ALLOW_SEE                :string read FALLOW_SEE                write SetALLOW_SEE               ;
    property ALLOW_ACCESS             :string read FALLOW_ACCESS             write SetALLOW_ACCESS            ;
    property ALLOW_ADD                :string read FALLOW_ADD                write SetALLOW_ADD               ;
    property ALLOW_MODIFY             :string read FALLOW_MODIFY             write SetALLOW_MODIFY            ;
    property ALLOW_DELETE             :string read FALLOW_DELETE             write SetALLOW_DELETE            ;
    property ALLOW_REPORT             :string read FALLOW_REPORT             write SetALLOW_REPORT            ;
    property ALLOW_EXEC               :string read FALLOW_EXEC               write SetALLOW_EXEC              ;
  end;

implementation
uses SysUtils, TypInfo;

{ TProfileOption }
constructor TProfileOption.Create;
begin
   Initialize;
end;

destructor TProfileOption.Destroy;
begin
   inherited;
end;

procedure TProfileOption.Initialize;
var i :TProfileOptionField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TProfileOptionField) to High(TProfileOptionField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;

   FPrimaryKey[profileoptionCD_PROFILE_OPTION] := True;
   FPrimaryKey[profileoptionCD_PROFILE       ] := True;
   FPrimaryKey[profileoptionAPPLICATION      ] := True;

   FRequired[profileoptionCD_PROFILE_OPTION       ] := False;
   FRequired[profileoptionCD_PARENT_PROFILE_OPTION] := False;
   FRequired[profileoptionCD_PROFILE              ] := False;
   FRequired[profileoptionAPPLICATION             ] := False;
   FRequired[profileoptionALLOW_SEE               ] := False;
   FRequired[profileoptionALLOW_ACCESS            ] := False;
   FRequired[profileoptionALLOW_ADD               ] := False;
   FRequired[profileoptionALLOW_MODIFY            ] := False;
   FRequired[profileoptionALLOW_DELETE            ] := False;
   FRequired[profileoptionALLOW_REPORT            ] := False;
   FRequired[profileoptionALLOW_EXEC              ] := False;

   FLengths[profileoptionCD_PROFILE_OPTION       ] := 100;
   FLengths[profileoptionCD_PARENT_PROFILE_OPTION] := 100;
   FLengths[profileoptionCD_PROFILE              ] := 15;
   FLengths[profileoptionAPPLICATION             ] := 15;
   FLengths[profileoptionALLOW_SEE               ] := 1;
   FLengths[profileoptionALLOW_ACCESS            ] := 1;
   FLengths[profileoptionALLOW_ADD               ] := 1;
   FLengths[profileoptionALLOW_MODIFY            ] := 1;
   FLengths[profileoptionALLOW_DELETE            ] := 1;
   FLengths[profileoptionALLOW_REPORT            ] := 1;
   FLengths[profileoptionALLOW_EXEC              ] := 1;

   FHints[profileoptionCD_PROFILE_OPTION       ] := '';
   FHints[profileoptionCD_PARENT_PROFILE_OPTION] := '';
   FHints[profileoptionCD_PROFILE              ] := '';
   FHints[profileoptionAPPLICATION             ] := '';
   FHints[profileoptionALLOW_SEE               ] := '';
   FHints[profileoptionALLOW_ACCESS            ] := '';
   FHints[profileoptionALLOW_ADD               ] := '';
   FHints[profileoptionALLOW_MODIFY            ] := '';
   FHints[profileoptionALLOW_DELETE            ] := '';
   FHints[profileoptionALLOW_REPORT            ] := '';
   FHints[profileoptionALLOW_EXEC              ] := '';
end;

procedure TProfileOption.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TProfileOptionField); 
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

function TProfileOption.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TProfileOption.AcceptChanges();                                       
var Field :TProfileOptionField;                                                 
begin                                                                          
   for Field := Low(TProfileOptionField) to High(TProfileOptionField) do begin   
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

procedure TProfileOption.AcceptFieldChange(Field :TProfileOptionField);
begin
   case Field of
      profileoptionCD_PROFILE_OPTION        :FOLD_CD_PROFILE_OPTION        := FCD_PROFILE_OPTION       ;
      profileoptionCD_PARENT_PROFILE_OPTION :FOLD_CD_PARENT_PROFILE_OPTION := FCD_PARENT_PROFILE_OPTION;
      profileoptionCD_PROFILE               :FOLD_CD_PROFILE               := FCD_PROFILE              ;
      profileoptionAPPLICATION              :FOLD_APPLICATION              := FAPPLICATION             ;
      profileoptionALLOW_SEE                :FOLD_ALLOW_SEE                := FALLOW_SEE               ;
      profileoptionALLOW_ACCESS             :FOLD_ALLOW_ACCESS             := FALLOW_ACCESS            ;
      profileoptionALLOW_ADD                :FOLD_ALLOW_ADD                := FALLOW_ADD               ;
      profileoptionALLOW_MODIFY             :FOLD_ALLOW_MODIFY             := FALLOW_MODIFY            ;
      profileoptionALLOW_DELETE             :FOLD_ALLOW_DELETE             := FALLOW_DELETE            ;
      profileoptionALLOW_REPORT             :FOLD_ALLOW_REPORT             := FALLOW_REPORT            ;
      profileoptionALLOW_EXEC               :FOLD_ALLOW_EXEC               := FALLOW_EXEC              ;
   end;
end;

procedure TProfileOption.ClearValueField(Field :TProfileOptionField);
begin
   case Field of
      profileoptionCD_PROFILE_OPTION        :FCD_PROFILE_OPTION        := '';
      profileoptionCD_PARENT_PROFILE_OPTION :FCD_PARENT_PROFILE_OPTION := '';
      profileoptionCD_PROFILE               :FCD_PROFILE               := '';
      profileoptionAPPLICATION              :FAPPLICATION              := '';
      profileoptionALLOW_SEE                :FALLOW_SEE                := '';
      profileoptionALLOW_ACCESS             :FALLOW_ACCESS             := '';
      profileoptionALLOW_ADD                :FALLOW_ADD                := '';
      profileoptionALLOW_MODIFY             :FALLOW_MODIFY             := '';
      profileoptionALLOW_DELETE             :FALLOW_DELETE             := '';
      profileoptionALLOW_REPORT             :FALLOW_REPORT             := '';
      profileoptionALLOW_EXEC               :FALLOW_EXEC               := '';
   end;
end;

procedure TProfileOption.SetNotNull(prmField :TProfileOptionField);
begin
   FNullFields[prmField] := False;
end;

procedure TProfileOption.SetChanged(prmField :TProfileOptionField);
begin
   FChanged[prmField] := True;
end;

function TProfileOption.GetLength(prmField :TProfileOptionField):Integer;
begin
   Result := FLengths[prmField];
end;

function TProfileOption.GetHint(prmField :TProfileOptionField):string;
begin
   Result := FHints[prmField];
end;

function TProfileOption.GetCharCase(prmField :TProfileOptionField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TProfileOption.IsNull(prmField :TProfileOptionField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TProfileOption.SetNull(prmField :TProfileOptionField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TProfileOption.IsChanged(prmField :TProfileOptionField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TProfileOption.CompareWith(prmData :TProfileOption);
begin
   if CD_PROFILE_OPTION        <> prmData.CD_PROFILE_OPTION        then SetChanged(profileoptionCD_PROFILE_OPTION       );
   if CD_PARENT_PROFILE_OPTION <> prmData.CD_PARENT_PROFILE_OPTION then SetChanged(profileoptionCD_PARENT_PROFILE_OPTION);
   if CD_PROFILE               <> prmData.CD_PROFILE               then SetChanged(profileoptionCD_PROFILE              );
   if APPLICATION              <> prmData.APPLICATION              then SetChanged(profileoptionAPPLICATION             );
   if ALLOW_SEE                <> prmData.ALLOW_SEE                then SetChanged(profileoptionALLOW_SEE               );
   if ALLOW_ACCESS             <> prmData.ALLOW_ACCESS             then SetChanged(profileoptionALLOW_ACCESS            );
   if ALLOW_ADD                <> prmData.ALLOW_ADD                then SetChanged(profileoptionALLOW_ADD               );
   if ALLOW_MODIFY             <> prmData.ALLOW_MODIFY             then SetChanged(profileoptionALLOW_MODIFY            );
   if ALLOW_DELETE             <> prmData.ALLOW_DELETE             then SetChanged(profileoptionALLOW_DELETE            );
   if ALLOW_REPORT             <> prmData.ALLOW_REPORT             then SetChanged(profileoptionALLOW_REPORT            );
   if ALLOW_EXEC               <> prmData.ALLOW_EXEC               then SetChanged(profileoptionALLOW_EXEC              );
end;

function TProfileOption.IsPrimaryKey(Field :TProfileOptionField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TProfileOption.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'CD_PROFILE_OPTION'        then IsPrimaryKey(profileoptionCD_PROFILE_OPTION       ) else
   if Field = 'CD_PARENT_PROFILE_OPTION' then IsPrimaryKey(profileoptionCD_PARENT_PROFILE_OPTION) else
   if Field = 'CD_PROFILE'               then IsPrimaryKey(profileoptionCD_PROFILE              ) else
   if Field = 'APPLICATION'              then IsPrimaryKey(profileoptionAPPLICATION             ) else
   if Field = 'ALLOW_SEE'                then IsPrimaryKey(profileoptionALLOW_SEE               ) else
   if Field = 'ALLOW_ACCESS'             then IsPrimaryKey(profileoptionALLOW_ACCESS            ) else
   if Field = 'ALLOW_ADD'                then IsPrimaryKey(profileoptionALLOW_ADD               ) else
   if Field = 'ALLOW_MODIFY'             then IsPrimaryKey(profileoptionALLOW_MODIFY            ) else
   if Field = 'ALLOW_DELETE'             then IsPrimaryKey(profileoptionALLOW_DELETE            ) else
   if Field = 'ALLOW_REPORT'             then IsPrimaryKey(profileoptionALLOW_REPORT            ) else
   if Field = 'ALLOW_EXEC'               then IsPrimaryKey(profileoptionALLOW_EXEC              );
end;

procedure TProfileOption.SetCD_PROFILE_OPTION(const Value :string);
begin
   AssignString(Value, FCD_PROFILE_OPTION, FOLD_CD_PROFILE_OPTION, profileoptionCD_PROFILE_OPTION); 
end;

procedure TProfileOption.SetCD_PARENT_PROFILE_OPTION(const Value :string);
begin
   AssignString(Value, FCD_PARENT_PROFILE_OPTION, FOLD_CD_PARENT_PROFILE_OPTION, profileoptionCD_PARENT_PROFILE_OPTION); 
end;

procedure TProfileOption.SetCD_PROFILE(const Value :string);
begin
   AssignString(Value, FCD_PROFILE, FOLD_CD_PROFILE, profileoptionCD_PROFILE); 
end;

procedure TProfileOption.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, profileoptionAPPLICATION); 
end;

procedure TProfileOption.SetALLOW_SEE(const Value :string);
begin
   AssignString(Value, FALLOW_SEE, FOLD_ALLOW_SEE, profileoptionALLOW_SEE); 
end;

procedure TProfileOption.SetALLOW_ACCESS(const Value :string);
begin
   AssignString(Value, FALLOW_ACCESS, FOLD_ALLOW_ACCESS, profileoptionALLOW_ACCESS); 
end;

procedure TProfileOption.SetALLOW_ADD(const Value :string);
begin
   AssignString(Value, FALLOW_ADD, FOLD_ALLOW_ADD, profileoptionALLOW_ADD); 
end;

procedure TProfileOption.SetALLOW_MODIFY(const Value :string);
begin
   AssignString(Value, FALLOW_MODIFY, FOLD_ALLOW_MODIFY, profileoptionALLOW_MODIFY); 
end;

procedure TProfileOption.SetALLOW_DELETE(const Value :string);
begin
   AssignString(Value, FALLOW_DELETE, FOLD_ALLOW_DELETE, profileoptionALLOW_DELETE); 
end;

procedure TProfileOption.SetALLOW_REPORT(const Value :string);
begin
   AssignString(Value, FALLOW_REPORT, FOLD_ALLOW_REPORT, profileoptionALLOW_REPORT); 
end;

procedure TProfileOption.SetALLOW_EXEC(const Value :string);
begin
   AssignString(Value, FALLOW_EXEC, FOLD_ALLOW_EXEC, profileoptionALLOW_EXEC); 
end;


function TProfileOption.FieldToString(prmField: TProfileOptionField): string; 
begin                                                                       
   Result := ProfileOptionFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TProfileOptionField), Integer(prmField));          
end;                                                                        
                                                                            
function TProfileOption.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
