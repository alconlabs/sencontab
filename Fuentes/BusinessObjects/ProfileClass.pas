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
{ CD_PROFILE     	char      	  15	 NULL Allowed  No    }
{ DS_PROFILE     	char      	  80	 NULL Allowed  YES   }
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{=== ================= ===}

type
   TProfileField = (
      profileCD_PROFILE , 
      profileDS_PROFILE , 
      profileAPPLICATION
   );

   TProfileFieldNamesDef = array[profileCD_PROFILE..profileAPPLICATION] of string;

const ProfileFieldNames: TProfileFieldNamesDef = (
            'CD_PROFILE' , 
            'DS_PROFILE' , 
            'APPLICATION'
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
    procedure SetCD_PROFILE (const Value :string);
    procedure SetDS_PROFILE (const Value :string);
    procedure SetAPPLICATION(const Value :string);
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
    FCD_PROFILE       :string;
    FDS_PROFILE       :string;
    FAPPLICATION      :string;
    FOLD_CD_PROFILE       :string;
    FOLD_DS_PROFILE       :string;
    FOLD_APPLICATION      :string;
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
    property CD_PROFILE_OldValue  :string read FOLD_CD_PROFILE ;
    property DS_PROFILE_OldValue  :string read FOLD_DS_PROFILE ;
    property APPLICATION_OldValue :string read FOLD_APPLICATION;
  published
    property CD_PROFILE  :string read FCD_PROFILE  write SetCD_PROFILE ;
    property DS_PROFILE  :string read FDS_PROFILE  write SetDS_PROFILE ;
    property APPLICATION :string read FAPPLICATION write SetAPPLICATION;
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


   FPrimaryKey[profileCD_PROFILE ] := True;
   FPrimaryKey[profileAPPLICATION] := True;

   FRequired[profileCD_PROFILE ] := False;
   FRequired[profileDS_PROFILE ] := False;
   FRequired[profileAPPLICATION] := False;

   FLengths[profileCD_PROFILE ] := 15;
   FLengths[profileDS_PROFILE ] := 80;
   FLengths[profileAPPLICATION] := 15;

   FHints[profileCD_PROFILE ] := '';
   FHints[profileDS_PROFILE ] := '';
   FHints[profileAPPLICATION] := '';
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
      profileCD_PROFILE  :FOLD_CD_PROFILE  := FCD_PROFILE ;
      profileDS_PROFILE  :FOLD_DS_PROFILE  := FDS_PROFILE ;
      profileAPPLICATION :FOLD_APPLICATION := FAPPLICATION;
   end;
end;

procedure TProfile.ClearValueField(Field :TProfileField);
begin
   case Field of
      profileCD_PROFILE  :FCD_PROFILE  := '';
      profileDS_PROFILE  :FDS_PROFILE  := '';
      profileAPPLICATION :FAPPLICATION := '';
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
   if CD_PROFILE  <> prmData.CD_PROFILE  then SetChanged(profileCD_PROFILE );
   if DS_PROFILE  <> prmData.DS_PROFILE  then SetChanged(profileDS_PROFILE );
   if APPLICATION <> prmData.APPLICATION then SetChanged(profileAPPLICATION);
end;

function TProfile.IsPrimaryKey(Field :TProfileField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TProfile.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'CD_PROFILE'  then IsPrimaryKey(profileCD_PROFILE ) else
   if Field = 'DS_PROFILE'  then IsPrimaryKey(profileDS_PROFILE ) else
   if Field = 'APPLICATION' then IsPrimaryKey(profileAPPLICATION);
end;

procedure TProfile.SetCD_PROFILE(const Value :string);
begin
   AssignString(Value, FCD_PROFILE, FOLD_CD_PROFILE, profileCD_PROFILE); 
end;

procedure TProfile.SetDS_PROFILE(const Value :string);
begin
   AssignString(Value, FDS_PROFILE, FOLD_DS_PROFILE, profileDS_PROFILE); 
end;

procedure TProfile.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, profileAPPLICATION); 
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
