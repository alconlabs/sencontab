(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit OptionClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = OPTIONS  }
{=== Column Definition ===}
{ CD_OPTION      	char      	 100	 NULL Allowed  No    }
{ CD_PARENT_OPTIO	char      	 100	 NULL Allowed  YES   }
{ DS_OPTION      	char      	 100	 NULL Allowed  YES   }
{ NAME_IN_FONT_SO	char      	 100	 NULL Allowed  YES   }
{ HELP_PAGE_LINK 	char      	 100	 NULL Allowed  No    }
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{=== ================= ===}

type
   TOptionField = (
      optionCD_OPTION          , 
      optionCD_PARENT_OPTION   , 
      optionDS_OPTION          , 
      optionNAME_IN_FONT_SOURCE, 
      optionHELP_PAGE_LINK     , 
      optionAPPLICATION        
   );

   TOptionFieldNamesDef = array[optionCD_OPTION..optionAPPLICATION] of string;

const OptionFieldNames: TOptionFieldNamesDef = (
            'CD_OPTION'          , 
            'CD_PARENT_OPTION'   , 
            'DS_OPTION'          , 
            'NAME_IN_FONT_SOURCE', 
            'HELP_PAGE_LINK'     , 
            'APPLICATION'        
            );
type
  TOption = class(TPersistent)
  private
    FPrimaryKey  :array[TOptionField] of Boolean;
    FNullFields  :array[TOptionField] of Boolean;
    FRequired    :array[TOptionField] of Boolean;
    FLengths     :array[TOptionField] of Integer;
    FMasks       :array[TOptionField] of string; 
    FHints       :array[TOptionField] of string;  {for show help in status bar }
    FCharCase    :array[TOptionField] of TEditCharCase;
    FChanged     :array[TOptionField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TOptionField] of Boolean;
    FNullOlds    :array[TOptionField] of Boolean;
    procedure SetCD_OPTION          (const Value :string);
    procedure SetCD_PARENT_OPTION   (const Value :string);
    procedure SetDS_OPTION          (const Value :string);
    procedure SetNAME_IN_FONT_SOURCE(const Value :string);
    procedure SetHELP_PAGE_LINK     (const Value :string);
    procedure SetAPPLICATION        (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TOptionField);
    procedure SetChanged(prmField :TOptionField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TOptionField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TOptionField);                                    
    procedure ClearValueField(Field :TOptionField);                                      
    function GetVersion :string;                                                               
  protected
    FCD_OPTION                :string;
    FCD_PARENT_OPTION         :string;
    FDS_OPTION                :string;
    FNAME_IN_FONT_SOURCE      :string;
    FHELP_PAGE_LINK           :string;
    FAPPLICATION              :string;
    FOLD_CD_OPTION                :string;
    FOLD_CD_PARENT_OPTION         :string;
    FOLD_DS_OPTION                :string;
    FOLD_NAME_IN_FONT_SOURCE      :string;
    FOLD_HELP_PAGE_LINK           :string;
    FOLD_APPLICATION              :string;
    function GetLength(prmField :TOptionField):Integer;
    function GetHint(prmField :TOptionField):string;
    function GetCharCase(prmField :TOptionField):TEditCharCase;
    procedure SetNull(prmField :TOptionField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TOptionField):Boolean;
    function  IsChanged(prmField :TOptionField):Boolean;
    function  FieldToString(prmField :TOptionField):string;
    procedure CompareWith(prmData :TOption);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TOptionField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property CD_OPTION_OldValue           :string read FOLD_CD_OPTION          ;
    property CD_PARENT_OPTION_OldValue    :string read FOLD_CD_PARENT_OPTION   ;
    property DS_OPTION_OldValue           :string read FOLD_DS_OPTION          ;
    property NAME_IN_FONT_SOURCE_OldValue :string read FOLD_NAME_IN_FONT_SOURCE;
    property HELP_PAGE_LINK_OldValue      :string read FOLD_HELP_PAGE_LINK     ;
    property APPLICATION_OldValue         :string read FOLD_APPLICATION        ;
  published
    property CD_OPTION           :string read FCD_OPTION           write SetCD_OPTION          ;
    property CD_PARENT_OPTION    :string read FCD_PARENT_OPTION    write SetCD_PARENT_OPTION   ;
    property DS_OPTION           :string read FDS_OPTION           write SetDS_OPTION          ;
    property NAME_IN_FONT_SOURCE :string read FNAME_IN_FONT_SOURCE write SetNAME_IN_FONT_SOURCE;
    property HELP_PAGE_LINK      :string read FHELP_PAGE_LINK      write SetHELP_PAGE_LINK     ;
    property APPLICATION         :string read FAPPLICATION         write SetAPPLICATION        ;
  end;

implementation
uses SysUtils, TypInfo;

{ TOption }
constructor TOption.Create;
begin
   Initialize;
end;

destructor TOption.Destroy;
begin
   inherited;
end;

procedure TOption.Initialize;
var i :TOptionField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TOptionField) to High(TOptionField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;

   FPrimaryKey[optionCD_OPTION        ] := True;
   FPrimaryKey[optionAPPLICATION      ] := True;

   FRequired[optionCD_OPTION          ] := True;
   FRequired[optionCD_PARENT_OPTION   ] := False;
   FRequired[optionDS_OPTION          ] := True;
   FRequired[optionNAME_IN_FONT_SOURCE] := False;
   FRequired[optionHELP_PAGE_LINK     ] := False;
   FRequired[optionAPPLICATION        ] := True;

   FLengths[optionCD_OPTION          ] := 100;
   FLengths[optionCD_PARENT_OPTION   ] := 100;
   FLengths[optionDS_OPTION          ] := 100;
   FLengths[optionNAME_IN_FONT_SOURCE] := 100;
   FLengths[optionHELP_PAGE_LINK     ] := 100;
   FLengths[optionAPPLICATION        ] := 15;

   FHints[optionCD_OPTION          ] := '';
   FHints[optionCD_PARENT_OPTION   ] := '';
   FHints[optionDS_OPTION          ] := '';
   FHints[optionNAME_IN_FONT_SOURCE] := '';
   FHints[optionHELP_PAGE_LINK     ] := '';
   FHints[optionAPPLICATION        ] := '';
end;

procedure TOption.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TOptionField); 
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

function TOption.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TOption.AcceptChanges();                                       
var Field :TOptionField;                                                 
begin                                                                          
   for Field := Low(TOptionField) to High(TOptionField) do begin   
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

procedure TOption.AcceptFieldChange(Field :TOptionField);
begin
   case Field of
      optionCD_OPTION           :FOLD_CD_OPTION           := FCD_OPTION          ;
      optionCD_PARENT_OPTION    :FOLD_CD_PARENT_OPTION    := FCD_PARENT_OPTION   ;
      optionDS_OPTION           :FOLD_DS_OPTION           := FDS_OPTION          ;
      optionNAME_IN_FONT_SOURCE :FOLD_NAME_IN_FONT_SOURCE := FNAME_IN_FONT_SOURCE;
      optionHELP_PAGE_LINK      :FOLD_HELP_PAGE_LINK      := FHELP_PAGE_LINK     ;
      optionAPPLICATION         :FOLD_APPLICATION         := FAPPLICATION        ;
   end;
end;

procedure TOption.ClearValueField(Field :TOptionField);
begin
   case Field of
      optionCD_OPTION           :FCD_OPTION           := '';
      optionCD_PARENT_OPTION    :FCD_PARENT_OPTION    := '';
      optionDS_OPTION           :FDS_OPTION           := '';
      optionNAME_IN_FONT_SOURCE :FNAME_IN_FONT_SOURCE := '';
      optionHELP_PAGE_LINK      :FHELP_PAGE_LINK      := '';
      optionAPPLICATION         :FAPPLICATION         := '';
   end;
end;

procedure TOption.SetNotNull(prmField :TOptionField);
begin
   FNullFields[prmField] := False;
end;

procedure TOption.SetChanged(prmField :TOptionField);
begin
   FChanged[prmField] := True;
end;

function TOption.GetLength(prmField :TOptionField):Integer;
begin
   Result := FLengths[prmField];
end;

function TOption.GetHint(prmField :TOptionField):string;
begin
   Result := FHints[prmField];
end;

function TOption.GetCharCase(prmField :TOptionField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TOption.IsNull(prmField :TOptionField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TOption.SetNull(prmField :TOptionField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TOption.IsChanged(prmField :TOptionField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TOption.CompareWith(prmData :TOption);
begin
   if CD_OPTION           <> prmData.CD_OPTION           then SetChanged(optionCD_OPTION          );
   if CD_PARENT_OPTION    <> prmData.CD_PARENT_OPTION    then SetChanged(optionCD_PARENT_OPTION   );
   if DS_OPTION           <> prmData.DS_OPTION           then SetChanged(optionDS_OPTION          );
   if NAME_IN_FONT_SOURCE <> prmData.NAME_IN_FONT_SOURCE then SetChanged(optionNAME_IN_FONT_SOURCE);
   if HELP_PAGE_LINK      <> prmData.HELP_PAGE_LINK      then SetChanged(optionHELP_PAGE_LINK     );
   if APPLICATION         <> prmData.APPLICATION         then SetChanged(optionAPPLICATION        );
end;

function TOption.IsPrimaryKey(Field :TOptionField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TOption.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'CD_OPTION'           then IsPrimaryKey(optionCD_OPTION          ) else
   if Field = 'CD_PARENT_OPTION'    then IsPrimaryKey(optionCD_PARENT_OPTION   ) else
   if Field = 'DS_OPTION'           then IsPrimaryKey(optionDS_OPTION          ) else
   if Field = 'NAME_IN_FONT_SOURCE' then IsPrimaryKey(optionNAME_IN_FONT_SOURCE) else
   if Field = 'HELP_PAGE_LINK'      then IsPrimaryKey(optionHELP_PAGE_LINK     ) else
   if Field = 'APPLICATION'         then IsPrimaryKey(optionAPPLICATION        );
end;

procedure TOption.SetCD_OPTION(const Value :string);
begin
   AssignString(Value, FCD_OPTION, FOLD_CD_OPTION, optionCD_OPTION); 
end;

procedure TOption.SetCD_PARENT_OPTION(const Value :string);
begin
   AssignString(Value, FCD_PARENT_OPTION, FOLD_CD_PARENT_OPTION, optionCD_PARENT_OPTION); 
end;

procedure TOption.SetDS_OPTION(const Value :string);
begin
   AssignString(Value, FDS_OPTION, FOLD_DS_OPTION, optionDS_OPTION); 
end;

procedure TOption.SetNAME_IN_FONT_SOURCE(const Value :string);
begin
   AssignString(Value, FNAME_IN_FONT_SOURCE, FOLD_NAME_IN_FONT_SOURCE, optionNAME_IN_FONT_SOURCE); 
end;

procedure TOption.SetHELP_PAGE_LINK(const Value :string);
begin
   AssignString(Value, FHELP_PAGE_LINK, FOLD_HELP_PAGE_LINK, optionHELP_PAGE_LINK); 
end;

procedure TOption.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, optionAPPLICATION); 
end;


function TOption.FieldToString(prmField: TOptionField): string; 
begin                                                                       
   Result := OptionFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TOptionField), Integer(prmField));          
end;                                                                        
                                                                            
function TOption.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
