(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit SectionClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = SECTIONS  }
{=== Column Definition ===}
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{ CD_SECTION     	char      	  15	 NULL Allowed  No    }
{ DS_SECTION     	varchar   	  25	 NULL Allowed  YES   }
{=== ================= ===}

type
   TSectionField = (
      sectionAPPLICATION, 
      sectionCD_SECTION , 
      sectionDS_SECTION 
   );

   TSectionFieldNamesDef = array[sectionAPPLICATION..sectionDS_SECTION] of string;

const SectionFieldNames: TSectionFieldNamesDef = (
            'APPLICATION', 
            'CD_SECTION' , 
            'DS_SECTION' 
            );
type
  TSection = class(TPersistent)
  private
    FPrimaryKey  :array[TSectionField] of Boolean;
    FNullFields  :array[TSectionField] of Boolean;
    FRequired    :array[TSectionField] of Boolean;
    FLengths     :array[TSectionField] of Integer;
    FMasks       :array[TSectionField] of string; 
    FHints       :array[TSectionField] of string;  {for show help in status bar }
    FCharCase    :array[TSectionField] of TEditCharCase;
    FChanged     :array[TSectionField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TSectionField] of Boolean;
    FNullOlds    :array[TSectionField] of Boolean;
    procedure SetAPPLICATION(const Value :string);
    procedure SetCD_SECTION (const Value :string);
    procedure SetDS_SECTION (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TSectionField);
    procedure SetChanged(prmField :TSectionField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TSectionField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TSectionField);                                    
    procedure ClearValueField(Field :TSectionField);                                      
    function GetVersion :string;                                                               
  protected
    FAPPLICATION      :string;
    FCD_SECTION       :string;
    FDS_SECTION       :string;
    FOLD_APPLICATION      :string;
    FOLD_CD_SECTION       :string;
    FOLD_DS_SECTION       :string;
    function GetLength(prmField :TSectionField):Integer;
    function GetHint(prmField :TSectionField):string;
    function GetCharCase(prmField :TSectionField):TEditCharCase;
    procedure SetNull(prmField :TSectionField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TSectionField):Boolean;
    function  IsChanged(prmField :TSectionField):Boolean;
    function  FieldToString(prmField :TSectionField):string;
    procedure CompareWith(prmData :TSection);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TSectionField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property APPLICATION_OldValue :string read FOLD_APPLICATION;
    property CD_SECTION_OldValue  :string read FOLD_CD_SECTION ;
    property DS_SECTION_OldValue  :string read FOLD_DS_SECTION ;
  published
    property APPLICATION :string read FAPPLICATION write SetAPPLICATION;
    property CD_SECTION  :string read FCD_SECTION  write SetCD_SECTION ;
    property DS_SECTION  :string read FDS_SECTION  write SetDS_SECTION ;
  end;

implementation
uses SysUtils, TypInfo;

{ TSection }
constructor TSection.Create;
begin
   Initialize;
end;

destructor TSection.Destroy;
begin
   inherited;
end;

procedure TSection.Initialize;
var i :TSectionField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TSectionField) to High(TSectionField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;


   FPrimaryKey[sectionAPPLICATION] := True;
   FPrimaryKey[sectionCD_SECTION ] := True;

   FRequired[sectionAPPLICATION] := False;
   FRequired[sectionCD_SECTION ] := False;
   FRequired[sectionDS_SECTION ] := False;

   FLengths[sectionAPPLICATION] := 15;
   FLengths[sectionCD_SECTION ] := 15;
   FLengths[sectionDS_SECTION ] := 25;

   FHints[sectionAPPLICATION] := '';
   FHints[sectionCD_SECTION ] := '';
   FHints[sectionDS_SECTION ] := '';
end;

procedure TSection.AssignString(Value :string; var REF_VAR :string;                         
                                               var REF_OLD_VAR :string; Field :TSectionField); 
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

function TSection.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TSection.AcceptChanges();                                       
var Field :TSectionField;                                                 
begin                                                                          
   for Field := Low(TSectionField) to High(TSectionField) do begin   
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

procedure TSection.AcceptFieldChange(Field :TSectionField);
begin
   case Field of
      sectionAPPLICATION :FOLD_APPLICATION := FAPPLICATION;
      sectionCD_SECTION  :FOLD_CD_SECTION  := FCD_SECTION ;
      sectionDS_SECTION  :FOLD_DS_SECTION  := FDS_SECTION ;
   end;
end;

procedure TSection.ClearValueField(Field :TSectionField);
begin
   case Field of
      sectionAPPLICATION :FAPPLICATION := '';
      sectionCD_SECTION  :FCD_SECTION  := '';
      sectionDS_SECTION  :FDS_SECTION  := '';
   end;
end;

procedure TSection.SetNotNull(prmField :TSectionField);
begin
   FNullFields[prmField] := False;
end;

procedure TSection.SetChanged(prmField :TSectionField);
begin
   FChanged[prmField] := True;
end;

function TSection.GetLength(prmField :TSectionField):Integer;
begin
   Result := FLengths[prmField];
end;

function TSection.GetHint(prmField :TSectionField):string;
begin
   Result := FHints[prmField];
end;

function TSection.GetCharCase(prmField :TSectionField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TSection.IsNull(prmField :TSectionField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TSection.SetNull(prmField :TSectionField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TSection.IsChanged(prmField :TSectionField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TSection.CompareWith(prmData :TSection);
begin
   if APPLICATION <> prmData.APPLICATION then SetChanged(sectionAPPLICATION);
   if CD_SECTION  <> prmData.CD_SECTION  then SetChanged(sectionCD_SECTION );
   if DS_SECTION  <> prmData.DS_SECTION  then SetChanged(sectionDS_SECTION );
end;

function TSection.IsPrimaryKey(Field :TSectionField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TSection.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'APPLICATION' then IsPrimaryKey(sectionAPPLICATION) else
   if Field = 'CD_SECTION'  then IsPrimaryKey(sectionCD_SECTION ) else
   if Field = 'DS_SECTION'  then IsPrimaryKey(sectionDS_SECTION );
end;

procedure TSection.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, sectionAPPLICATION); 
end;

procedure TSection.SetCD_SECTION(const Value :string);
begin
   AssignString(Value, FCD_SECTION, FOLD_CD_SECTION, sectionCD_SECTION); 
end;

procedure TSection.SetDS_SECTION(const Value :string);
begin
   AssignString(Value, FDS_SECTION, FOLD_DS_SECTION, sectionDS_SECTION); 
end;


function TSection.FieldToString(prmField: TSectionField): string; 
begin                                                                       
   Result := SectionFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TSectionField), Integer(prmField));          
end;                                                                        
                                                                            
function TSection.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
