(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit ProfileClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = PROFILES  }
{=== Column Definition ===}
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{ CD_SECTION     	char      	  15	 NULL Allowed  No    }
{ CD_MODULE      	char      	  50	 NULL Allowed  No    }
{ CD_PROFILE     	char      	  15	 NULL Allowed  No    }
{ DS_PROFILE     	char      	  80	 NULL Allowed  YES   }
{ ALLOW_ADD      	char      	   1	 NULL Allowed  No    }
{ ALLOW_MODIFY   	char      	   1	 NULL Allowed  No    }
{ ALLOW_DELETE   	char      	   1	 NULL Allowed  No    }
{ ALLOW_REPORT   	char      	   1	 NULL Allowed  No    }
{ ALLOW_EXEC     	char      	   1	 NULL Allowed  No    }
{=== ================= ===}

type
   TProfileField = (
      profileAPPLICATION , 
      profileCD_SECTION  , 
      profileCD_MODULE   , 
      profileCD_PROFILE  , 
      profileDS_PROFILE  , 
      profileALLOW_ADD   , 
      profileALLOW_MODIFY, 
      profileALLOW_DELETE, 
      profileALLOW_REPORT, 
      profileALLOW_EXEC  
   );

   TProfileFieldNamesDef = array[profileAPPLICATION..profileALLOW_EXEC] of string;

const ProfileFieldNames: TProfileFieldNamesDef = (
            'APPLICATION' , 
            'CD_SECTION'  , 
            'CD_MODULE'   , 
            'CD_PROFILE'  , 
            'DS_PROFILE'  , 
            'ALLOW_ADD'   , 
            'ALLOW_MODIFY', 
            'ALLOW_DELETE', 
            'ALLOW_REPORT', 
            'ALLOW_EXEC'  
            );
type
  TProfile = class(TPersistent)
  private
    FPrimaryKey  :array[TProfileField] of Boolean;
    FNullFields  :array[TProfileField] of Boolean;
    FRequired    :array[TProfileField] of Boolean;
    FLengths     :array[TProfileField] of Integer;
    FMasks       :array[TProfileField] of string; 
    FHints       :array[TProfileField] of string;  {for show help in status bar }
    FCharCase    :array[TProfileField] of TEditCharCase;
    FChanged     :array[TProfileField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TProfileField] of Boolean;
    FNullOlds    :array[TProfileField] of Boolean;
    procedure SetAPPLICATION (const Value :string);
    procedure SetCD_SECTION  (const Value :string);
    procedure SetCD_MODULE   (const Value :string);
    procedure SetCD_PROFILE  (const Value :string);
    procedure SetDS_PROFILE  (const Value :string);
    procedure SetALLOW_ADD   (const Value :string);
    procedure SetALLOW_MODIFY(const Value :string);
    procedure SetALLOW_DELETE(const Value :string);
    procedure SetALLOW_REPORT(const Value :string);
    procedure SetALLOW_EXEC  (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TProfileField);
    procedure SetChanged(prmField :TProfileField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TProfileField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TProfileField);                                    
    procedure ClearValueField(Field :TProfileField);                                      
    function GetVersion :string;                                                               
  protected
    FAPPLICATION       :string;
    FCD_SECTION        :string;
    FCD_MODULE         :string;
    FCD_PROFILE        :string;
    FDS_PROFILE        :string;
    FALLOW_ADD         :string;
    FALLOW_MODIFY      :string;
    FALLOW_DELETE      :string;
    FALLOW_REPORT      :string;
    FALLOW_EXEC        :string;
    FOLD_APPLICATION       :string;
    FOLD_CD_SECTION        :string;
    FOLD_CD_MODULE         :string;
    FOLD_CD_PROFILE        :string;
    FOLD_DS_PROFILE        :string;
    FOLD_ALLOW_ADD         :string;
    FOLD_ALLOW_MODIFY      :string;
    FOLD_ALLOW_DELETE      :string;
    FOLD_ALLOW_REPORT      :string;
    FOLD_ALLOW_EXEC        :string;
    function GetLength(prmField :TProfileField):Integer;
    function GetHint(prmField :TProfileField):string;
    function GetCharCase(prmField :TProfileField):TEditCharCase;
    procedure SetNull(prmField :TProfileField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TProfileField):Boolean;
    function  IsChanged(prmField :TProfileField):Boolean;
    function  FieldToString(prmField :TProfileField):string;
    procedure CompareWith(prmData :TProfile);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TProfileField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property APPLICATION_OldValue  :string read FOLD_APPLICATION ;
    property CD_SECTION_OldValue   :string read FOLD_CD_SECTION  ;
    property CD_MODULE_OldValue    :string read FOLD_CD_MODULE   ;
    property CD_PROFILE_OldValue   :string read FOLD_CD_PROFILE  ;
    property DS_PROFILE_OldValue   :string read FOLD_DS_PROFILE  ;
    property ALLOW_ADD_OldValue    :string read FOLD_ALLOW_ADD   ;
    property ALLOW_MODIFY_OldValue :string read FOLD_ALLOW_MODIFY;
    property ALLOW_DELETE_OldValue :string read FOLD_ALLOW_DELETE;
    property ALLOW_REPORT_OldValue :string read FOLD_ALLOW_REPORT;
    property ALLOW_EXEC_OldValue   :string read FOLD_ALLOW_EXEC  ;
  published
    property APPLICATION  :string read FAPPLICATION  write SetAPPLICATION ;
    property CD_SECTION   :string read FCD_SECTION   write SetCD_SECTION  ;
    property CD_MODULE    :string read FCD_MODULE    write SetCD_MODULE   ;
    property CD_PROFILE   :string read FCD_PROFILE   write SetCD_PROFILE  ;
    property DS_PROFILE   :string read FDS_PROFILE   write SetDS_PROFILE  ;
    property ALLOW_ADD    :string read FALLOW_ADD    write SetALLOW_ADD   ;
    property ALLOW_MODIFY :string read FALLOW_MODIFY write SetALLOW_MODIFY;
    property ALLOW_DELETE :string read FALLOW_DELETE write SetALLOW_DELETE;
    property ALLOW_REPORT :string read FALLOW_REPORT write SetALLOW_REPORT;
    property ALLOW_EXEC   :string read FALLOW_EXEC   write SetALLOW_EXEC  ;
  end;

implementation
uses SysUtils, TypInfo;

{ TProfile }
constructor TProfile.Create;
begin
   Initialize;
end;

destructor TProfile.Destroy;
begin
   inherited;
end;

procedure TProfile.Initialize;
var i :TProfileField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TProfileField) to High(TProfileField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;


   FPrimaryKey[profileAPPLICATION] := True;
   FPrimaryKey[profileCD_SECTION ] := True;
   FPrimaryKey[profileCD_MODULE  ] := True;
   FPrimaryKey[profileCD_PROFILE ] := True;

   FRequired[profileAPPLICATION ] := False;
   FRequired[profileCD_SECTION  ] := False;
   FRequired[profileCD_MODULE   ] := False;
   FRequired[profileCD_PROFILE  ] := False;
   FRequired[profileDS_PROFILE  ] := False;
   FRequired[profileALLOW_ADD   ] := False;
   FRequired[profileALLOW_MODIFY] := False;
   FRequired[profileALLOW_DELETE] := False;
   FRequired[profileALLOW_REPORT] := False;
   FRequired[profileALLOW_EXEC  ] := False;

   FLengths[profileAPPLICATION ] := 15;
   FLengths[profileCD_SECTION  ] := 15;
   FLengths[profileCD_MODULE   ] := 50;
   FLengths[profileCD_PROFILE  ] := 15;
   FLengths[profileDS_PROFILE  ] := 80;
   FLengths[profileALLOW_ADD   ] := 1;
   FLengths[profileALLOW_MODIFY] := 1;
   FLengths[profileALLOW_DELETE] := 1;
   FLengths[profileALLOW_REPORT] := 1;
   FLengths[profileALLOW_EXEC  ] := 1;

   FHints[profileAPPLICATION ] := '';
   FHints[profileCD_SECTION  ] := '';
   FHints[profileCD_MODULE   ] := '';
   FHints[profileCD_PROFILE  ] := '';
   FHints[profileDS_PROFILE  ] := '';
   FHints[profileALLOW_ADD   ] := '';
   FHints[profileALLOW_MODIFY] := '';
   FHints[profileALLOW_DELETE] := '';
   FHints[profileALLOW_REPORT] := '';
   FHints[profileALLOW_EXEC  ] := '';
end;

procedure TProfile.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TProfileField); 
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

function TProfile.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TProfile.AcceptChanges();                                       
var Field :TProfileField;                                                 
begin                                                                          
   for Field := Low(TProfileField) to High(TProfileField) do begin   
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

procedure TProfile.AcceptFieldChange(Field :TProfileField);
begin
   case Field of
      profileAPPLICATION  :FOLD_APPLICATION  := FAPPLICATION ;
      profileCD_SECTION   :FOLD_CD_SECTION   := FCD_SECTION  ;
      profileCD_MODULE    :FOLD_CD_MODULE    := FCD_MODULE   ;
      profileCD_PROFILE   :FOLD_CD_PROFILE   := FCD_PROFILE  ;
      profileDS_PROFILE   :FOLD_DS_PROFILE   := FDS_PROFILE  ;
      profileALLOW_ADD    :FOLD_ALLOW_ADD    := FALLOW_ADD   ;
      profileALLOW_MODIFY :FOLD_ALLOW_MODIFY := FALLOW_MODIFY;
      profileALLOW_DELETE :FOLD_ALLOW_DELETE := FALLOW_DELETE;
      profileALLOW_REPORT :FOLD_ALLOW_REPORT := FALLOW_REPORT;
      profileALLOW_EXEC   :FOLD_ALLOW_EXEC   := FALLOW_EXEC  ;
   end;
end;

procedure TProfile.ClearValueField(Field :TProfileField);
begin
   case Field of
      profileAPPLICATION  :FAPPLICATION  := '';
      profileCD_SECTION   :FCD_SECTION   := '';
      profileCD_MODULE    :FCD_MODULE    := '';
      profileCD_PROFILE   :FCD_PROFILE   := '';
      profileDS_PROFILE   :FDS_PROFILE   := '';
      profileALLOW_ADD    :FALLOW_ADD    := '';
      profileALLOW_MODIFY :FALLOW_MODIFY := '';
      profileALLOW_DELETE :FALLOW_DELETE := '';
      profileALLOW_REPORT :FALLOW_REPORT := '';
      profileALLOW_EXEC   :FALLOW_EXEC   := '';
   end;
end;

procedure TProfile.SetNotNull(prmField :TProfileField);
begin
   FNullFields[prmField] := False;
end;

procedure TProfile.SetChanged(prmField :TProfileField);
begin
   FChanged[prmField] := True;
end;

function TProfile.GetLength(prmField :TProfileField):Integer;
begin
   Result := FLengths[prmField];
end;

function TProfile.GetHint(prmField :TProfileField):string;
begin
   Result := FHints[prmField];
end;

function TProfile.GetCharCase(prmField :TProfileField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TProfile.IsNull(prmField :TProfileField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TProfile.SetNull(prmField :TProfileField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TProfile.IsChanged(prmField :TProfileField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TProfile.CompareWith(prmData :TProfile);
begin
   if APPLICATION  <> prmData.APPLICATION  then SetChanged(profileAPPLICATION );
   if CD_SECTION   <> prmData.CD_SECTION   then SetChanged(profileCD_SECTION  );
   if CD_MODULE    <> prmData.CD_MODULE    then SetChanged(profileCD_MODULE   );
   if CD_PROFILE   <> prmData.CD_PROFILE   then SetChanged(profileCD_PROFILE  );
   if DS_PROFILE   <> prmData.DS_PROFILE   then SetChanged(profileDS_PROFILE  );
   if ALLOW_ADD    <> prmData.ALLOW_ADD    then SetChanged(profileALLOW_ADD   );
   if ALLOW_MODIFY <> prmData.ALLOW_MODIFY then SetChanged(profileALLOW_MODIFY);
   if ALLOW_DELETE <> prmData.ALLOW_DELETE then SetChanged(profileALLOW_DELETE);
   if ALLOW_REPORT <> prmData.ALLOW_REPORT then SetChanged(profileALLOW_REPORT);
   if ALLOW_EXEC   <> prmData.ALLOW_EXEC   then SetChanged(profileALLOW_EXEC  );
end;

function TProfile.IsPrimaryKey(Field :TProfileField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TProfile.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'APPLICATION'  then IsPrimaryKey(profileAPPLICATION ) else
   if Field = 'CD_SECTION'   then IsPrimaryKey(profileCD_SECTION  ) else
   if Field = 'CD_MODULE'    then IsPrimaryKey(profileCD_MODULE   ) else
   if Field = 'CD_PROFILE'   then IsPrimaryKey(profileCD_PROFILE  ) else
   if Field = 'DS_PROFILE'   then IsPrimaryKey(profileDS_PROFILE  ) else
   if Field = 'ALLOW_ADD'    then IsPrimaryKey(profileALLOW_ADD   ) else
   if Field = 'ALLOW_MODIFY' then IsPrimaryKey(profileALLOW_MODIFY) else
   if Field = 'ALLOW_DELETE' then IsPrimaryKey(profileALLOW_DELETE) else
   if Field = 'ALLOW_REPORT' then IsPrimaryKey(profileALLOW_REPORT) else
   if Field = 'ALLOW_EXEC'   then IsPrimaryKey(profileALLOW_EXEC  );
end;

procedure TProfile.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, profileAPPLICATION); 
end;

procedure TProfile.SetCD_SECTION(const Value :string);
begin
   AssignString(Value, FCD_SECTION, FOLD_CD_SECTION, profileCD_SECTION); 
end;

procedure TProfile.SetCD_MODULE(const Value :string);
begin
   AssignString(Value, FCD_MODULE, FOLD_CD_MODULE, profileCD_MODULE); 
end;

procedure TProfile.SetCD_PROFILE(const Value :string);
begin
   AssignString(Value, FCD_PROFILE, FOLD_CD_PROFILE, profileCD_PROFILE); 
end;

procedure TProfile.SetDS_PROFILE(const Value :string);
begin
   AssignString(Value, FDS_PROFILE, FOLD_DS_PROFILE, profileDS_PROFILE); 
end;

procedure TProfile.SetALLOW_ADD(const Value :string);
begin
   AssignString(Value, FALLOW_ADD, FOLD_ALLOW_ADD, profileALLOW_ADD); 
end;

procedure TProfile.SetALLOW_MODIFY(const Value :string);
begin
   AssignString(Value, FALLOW_MODIFY, FOLD_ALLOW_MODIFY, profileALLOW_MODIFY); 
end;

procedure TProfile.SetALLOW_DELETE(const Value :string);
begin
   AssignString(Value, FALLOW_DELETE, FOLD_ALLOW_DELETE, profileALLOW_DELETE); 
end;

procedure TProfile.SetALLOW_REPORT(const Value :string);
begin
   AssignString(Value, FALLOW_REPORT, FOLD_ALLOW_REPORT, profileALLOW_REPORT); 
end;

procedure TProfile.SetALLOW_EXEC(const Value :string);
begin
   AssignString(Value, FALLOW_EXEC, FOLD_ALLOW_EXEC, profileALLOW_EXEC); 
end;


function TProfile.FieldToString(prmField: TProfileField): string; 
begin                                                                       
   Result := ProfileFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TProfileField), Integer(prmField));          
end;                                                                        
                                                                            
function TProfile.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
