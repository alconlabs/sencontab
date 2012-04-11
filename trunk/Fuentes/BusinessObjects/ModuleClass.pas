(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit ModuleClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = MODULES  }
{=== Column Definition ===}
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{ CD_SECTION     	char      	  15	 NULL Allowed  No    }
{ CD_MODULE      	char      	  50	 NULL Allowed  No    }
{ DS_MODULE      	varchar   	  80	 NULL Allowed  No    }
{ HELP_PAGE_LINK 	char      	  80	 NULL Allowed  No    }
{=== ================= ===}

type
   TModuleField = (
      moduleAPPLICATION   , 
      moduleCD_SECTION    , 
      moduleCD_MODULE     , 
      moduleDS_MODULE     , 
      moduleHELP_PAGE_LINK
   );

   TModuleFieldNamesDef = array[moduleAPPLICATION..moduleHELP_PAGE_LINK] of string;

const ModuleFieldNames: TModuleFieldNamesDef = (
            'APPLICATION'   , 
            'CD_SECTION'    , 
            'CD_MODULE'     , 
            'DS_MODULE'     , 
            'HELP_PAGE_LINK'
            );
type
  TModule = class(TPersistent)
  private
    FPrimaryKey  :array[TModuleField] of Boolean;
    FNullFields  :array[TModuleField] of Boolean;
    FRequired    :array[TModuleField] of Boolean;
    FLengths     :array[TModuleField] of Integer;
    FMasks       :array[TModuleField] of string; 
    FHints       :array[TModuleField] of string;  {for show help in status bar }
    FCharCase    :array[TModuleField] of TEditCharCase;
    FChanged     :array[TModuleField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TModuleField] of Boolean;
    FNullOlds    :array[TModuleField] of Boolean;
    procedure SetAPPLICATION   (const Value :string);
    procedure SetCD_SECTION    (const Value :string);
    procedure SetCD_MODULE     (const Value :string);
    procedure SetDS_MODULE     (const Value :string);
    procedure SetHELP_PAGE_LINK(const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TModuleField);
    procedure SetChanged(prmField :TModuleField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TModuleField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TModuleField);                                    
    procedure ClearValueField(Field :TModuleField);                                      
    function GetVersion :string;                                                               
  protected
    FAPPLICATION         :string;
    FCD_SECTION          :string;
    FCD_MODULE           :string;
    FDS_MODULE           :string;
    FHELP_PAGE_LINK      :string;
    FOLD_APPLICATION         :string;
    FOLD_CD_SECTION          :string;
    FOLD_CD_MODULE           :string;
    FOLD_DS_MODULE           :string;
    FOLD_HELP_PAGE_LINK      :string;
    function GetLength(prmField :TModuleField):Integer;
    function GetHint(prmField :TModuleField):string;
    function GetCharCase(prmField :TModuleField):TEditCharCase;
    procedure SetNull(prmField :TModuleField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TModuleField):Boolean;
    function  IsChanged(prmField :TModuleField):Boolean;
    function  FieldToString(prmField :TModuleField):string;
    procedure CompareWith(prmData :TModule);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TModuleField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property APPLICATION_OldValue    :string read FOLD_APPLICATION   ;
    property CD_SECTION_OldValue     :string read FOLD_CD_SECTION    ;
    property CD_MODULE_OldValue      :string read FOLD_CD_MODULE     ;
    property DS_MODULE_OldValue      :string read FOLD_DS_MODULE     ;
    property HELP_PAGE_LINK_OldValue :string read FOLD_HELP_PAGE_LINK;
  published
    property APPLICATION    :string read FAPPLICATION    write SetAPPLICATION   ;
    property CD_SECTION     :string read FCD_SECTION     write SetCD_SECTION    ;
    property CD_MODULE      :string read FCD_MODULE      write SetCD_MODULE     ;
    property DS_MODULE      :string read FDS_MODULE      write SetDS_MODULE     ;
    property HELP_PAGE_LINK :string read FHELP_PAGE_LINK write SetHELP_PAGE_LINK;
  end;

implementation
uses SysUtils, TypInfo;

{ TModule }
constructor TModule.Create;
begin
   Initialize;
end;

destructor TModule.Destroy;
begin
   inherited;
end;

procedure TModule.Initialize;
var i :TModuleField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TModuleField) to High(TModuleField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;


   FPrimaryKey[moduleAPPLICATION] := True;
   FPrimaryKey[moduleCD_SECTION ] := True;
   FPrimaryKey[moduleCD_MODULE  ] := True;

   FRequired[moduleAPPLICATION   ] := False;
   FRequired[moduleCD_SECTION    ] := False;
   FRequired[moduleCD_MODULE     ] := False;
   FRequired[moduleDS_MODULE     ] := False;
   FRequired[moduleHELP_PAGE_LINK] := False;

   FLengths[moduleAPPLICATION   ] := 15;
   FLengths[moduleCD_SECTION    ] := 15;
   FLengths[moduleCD_MODULE     ] := 50;
   FLengths[moduleDS_MODULE     ] := 80;
   FLengths[moduleHELP_PAGE_LINK] := 80;

   FHints[moduleAPPLICATION   ] := '';
   FHints[moduleCD_SECTION    ] := '';
   FHints[moduleCD_MODULE     ] := '';
   FHints[moduleDS_MODULE     ] := '';
   FHints[moduleHELP_PAGE_LINK] := '';
end;

procedure TModule.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TModuleField); 
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

function TModule.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TModule.AcceptChanges();                                       
var Field :TModuleField;                                                 
begin                                                                          
   for Field := Low(TModuleField) to High(TModuleField) do begin   
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

procedure TModule.AcceptFieldChange(Field :TModuleField);
begin
   case Field of
      moduleAPPLICATION    :FOLD_APPLICATION    := FAPPLICATION   ;
      moduleCD_SECTION     :FOLD_CD_SECTION     := FCD_SECTION    ;
      moduleCD_MODULE      :FOLD_CD_MODULE      := FCD_MODULE     ;
      moduleDS_MODULE      :FOLD_DS_MODULE      := FDS_MODULE     ;
      moduleHELP_PAGE_LINK :FOLD_HELP_PAGE_LINK := FHELP_PAGE_LINK;
   end;
end;

procedure TModule.ClearValueField(Field :TModuleField);
begin
   case Field of
      moduleAPPLICATION    :FAPPLICATION    := '';
      moduleCD_SECTION     :FCD_SECTION     := '';
      moduleCD_MODULE      :FCD_MODULE      := '';
      moduleDS_MODULE      :FDS_MODULE      := '';
      moduleHELP_PAGE_LINK :FHELP_PAGE_LINK := '';
   end;
end;

procedure TModule.SetNotNull(prmField :TModuleField);
begin
   FNullFields[prmField] := False;
end;

procedure TModule.SetChanged(prmField :TModuleField);
begin
   FChanged[prmField] := True;
end;

function TModule.GetLength(prmField :TModuleField):Integer;
begin
   Result := FLengths[prmField];
end;

function TModule.GetHint(prmField :TModuleField):string;
begin
   Result := FHints[prmField];
end;

function TModule.GetCharCase(prmField :TModuleField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TModule.IsNull(prmField :TModuleField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TModule.SetNull(prmField :TModuleField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TModule.IsChanged(prmField :TModuleField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TModule.CompareWith(prmData :TModule);
begin
   if APPLICATION    <> prmData.APPLICATION    then SetChanged(moduleAPPLICATION   );
   if CD_SECTION     <> prmData.CD_SECTION     then SetChanged(moduleCD_SECTION    );
   if CD_MODULE      <> prmData.CD_MODULE      then SetChanged(moduleCD_MODULE     );
   if DS_MODULE      <> prmData.DS_MODULE      then SetChanged(moduleDS_MODULE     );
   if HELP_PAGE_LINK <> prmData.HELP_PAGE_LINK then SetChanged(moduleHELP_PAGE_LINK);
end;

function TModule.IsPrimaryKey(Field :TModuleField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TModule.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'APPLICATION'    then IsPrimaryKey(moduleAPPLICATION   ) else
   if Field = 'CD_SECTION'     then IsPrimaryKey(moduleCD_SECTION    ) else
   if Field = 'CD_MODULE'      then IsPrimaryKey(moduleCD_MODULE     ) else
   if Field = 'DS_MODULE'      then IsPrimaryKey(moduleDS_MODULE     ) else
   if Field = 'HELP_PAGE_LINK' then IsPrimaryKey(moduleHELP_PAGE_LINK);
end;

procedure TModule.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, moduleAPPLICATION); 
end;

procedure TModule.SetCD_SECTION(const Value :string);
begin
   AssignString(Value, FCD_SECTION, FOLD_CD_SECTION, moduleCD_SECTION); 
end;

procedure TModule.SetCD_MODULE(const Value :string);
begin
   AssignString(Value, FCD_MODULE, FOLD_CD_MODULE, moduleCD_MODULE); 
end;

procedure TModule.SetDS_MODULE(const Value :string);
begin
   AssignString(Value, FDS_MODULE, FOLD_DS_MODULE, moduleDS_MODULE); 
end;

procedure TModule.SetHELP_PAGE_LINK(const Value :string);
begin
   AssignString(Value, FHELP_PAGE_LINK, FOLD_HELP_PAGE_LINK, moduleHELP_PAGE_LINK); 
end;


function TModule.FieldToString(prmField: TModuleField): string; 
begin                                                                       
   Result := ModuleFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TModuleField), Integer(prmField));          
end;                                                                        
                                                                            
function TModule.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
