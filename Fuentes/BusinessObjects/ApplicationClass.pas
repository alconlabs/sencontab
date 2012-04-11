(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2012 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit ApplicationClass;

interface

uses Classes, StdCtrls;

{ TABLE NAME = APPLICATIONS  }
{=== Column Definition ===}
{ APPLICATION    	char      	  15	 NULL Allowed  No    }
{ DB_VERSION     	char      	   5	 NULL Allowed  No    }
{=== ================= ===}

type
   TApplicationField = (
      applicationAPPLICATION, 
      applicationDB_VERSION 
   );

   TApplicationFieldNamesDef = array[applicationAPPLICATION..applicationDB_VERSION] of string;

const ApplicationFieldNames: TApplicationFieldNamesDef = (
            'APPLICATION', 
            'DB_VERSION' 
            );
type
  TApplication = class(TPersistent)
  private
    FPrimaryKey  :array[TApplicationField] of Boolean;
    FNullFields  :array[TApplicationField] of Boolean;
    FRequired    :array[TApplicationField] of Boolean;
    FLengths     :array[TApplicationField] of Integer;
    FMasks       :array[TApplicationField] of string; 
    FHints       :array[TApplicationField] of string;  {for show help in status bar }
    FCharCase    :array[TApplicationField] of TEditCharCase;
    FChanged     :array[TApplicationField] of Boolean;
    FEmptyStringToNull :Boolean;                       
    FOldAssigned :array[TApplicationField] of Boolean;
    FNullOlds    :array[TApplicationField] of Boolean;
    procedure SetAPPLICATION(const Value :string);
    procedure SetDB_VERSION (const Value :string);
    {------------------------------------------------}
    procedure SetNotNull(prmField :TApplicationField);
    procedure SetChanged(prmField :TApplicationField);
    function IsNullOrEmpty(prmValue :string):Boolean;                                          
    procedure AssignString(Value :string; var REF_VAR :string;                                 
                                          var REF_OLD_VAR :string; Field :TApplicationField); 
    procedure AcceptChanges();                                                                 
    procedure AcceptFieldChange(Field :TApplicationField);                                    
    procedure ClearValueField(Field :TApplicationField);                                      
    function GetVersion :string;                                                               
  protected
    FAPPLICATION      :string;
    FDB_VERSION       :string;
    FOLD_APPLICATION      :string;
    FOLD_DB_VERSION       :string;
    function GetLength(prmField :TApplicationField):Integer;
    function GetHint(prmField :TApplicationField):string;
    function GetCharCase(prmField :TApplicationField):TEditCharCase;
    procedure SetNull(prmField :TApplicationField);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    function  IsNull(prmField :TApplicationField):Boolean;
    function  IsChanged(prmField :TApplicationField):Boolean;
    function  FieldToString(prmField :TApplicationField):string;
    procedure CompareWith(prmData :TApplication);
    property EmptyStringToNull :Boolean read FEmptyStringToNull write FEmptyStringToNull; {default True} 
    function IsPrimaryKey(Field :TApplicationField):Boolean; overload;                                  
    function IsPrimaryKey(Field :string):Boolean; overload;                                              
    property Version :string read GetVersion;                                                            
    property APPLICATION_OldValue :string read FOLD_APPLICATION;
    property DB_VERSION_OldValue  :string read FOLD_DB_VERSION ;
  published
    property APPLICATION :string read FAPPLICATION write SetAPPLICATION;
    property DB_VERSION  :string read FDB_VERSION  write SetDB_VERSION ;
  end;

implementation
uses SysUtils, TypInfo;

{ TApplication }
constructor TApplication.Create;
begin
   Initialize;
end;

destructor TApplication.Destroy;
begin
   inherited;
end;

procedure TApplication.Initialize;
var i :TApplicationField;
begin
   FEmptyStringToNull := True; {Default Value}    
                                                  
   for i := Low(TApplicationField) to High(TApplicationField) do begin
      FPrimaryKey[i] := False;
      FNullFields[i] := True;
      FChanged[i]    := False;
      FMasks  [i]    := '';
      FCharCase[i]   := ecUpperCase;
      FOldAssigned[i] := False;     
      FNullOlds[i]    := False;     
   end;

   FPrimaryKey[applicationAPPLICATION] := True;

   FRequired[applicationAPPLICATION] := False;
   FRequired[applicationDB_VERSION ] := False;

   FLengths[applicationAPPLICATION] := 15;
   FLengths[applicationDB_VERSION ] := 5;

   FHints[applicationAPPLICATION] := '';
   FHints[applicationDB_VERSION ] := '';
end;

procedure TApplication.AssignString(Value :string; var REF_VAR :string;                         
                                            var REF_OLD_VAR :string; Field :TApplicationField); 
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

function TApplication.IsNullOrEmpty(prmValue :string):Boolean;                
begin                                                                          
   Result := Trim(prmValue) = '';                                            
end;                                                                           

procedure TApplication.AcceptChanges();                                       
var Field :TApplicationField;                                                 
begin                                                                          
   for Field := Low(TApplicationField) to High(TApplicationField) do begin   
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

procedure TApplication.AcceptFieldChange(Field :TApplicationField);
begin
   case Field of
      applicationAPPLICATION :FOLD_APPLICATION := FAPPLICATION;
      applicationDB_VERSION  :FOLD_DB_VERSION  := FDB_VERSION ;
   end;
end;

procedure TApplication.ClearValueField(Field :TApplicationField);
begin
   case Field of
      applicationAPPLICATION :FAPPLICATION := '';
      applicationDB_VERSION  :FDB_VERSION  := '';
   end;
end;

procedure TApplication.SetNotNull(prmField :TApplicationField);
begin
   FNullFields[prmField] := False;
end;

procedure TApplication.SetChanged(prmField :TApplicationField);
begin
   FChanged[prmField] := True;
end;

function TApplication.GetLength(prmField :TApplicationField):Integer;
begin
   Result := FLengths[prmField];
end;

function TApplication.GetHint(prmField :TApplicationField):string;
begin
   Result := FHints[prmField];
end;

function TApplication.GetCharCase(prmField :TApplicationField):TEditCharCase;
begin
   Result := FCharCase[prmField];
end;

function TApplication.IsNull(prmField :TApplicationField):Boolean;
begin
   Result := FNullFields[prmField];
end;

procedure TApplication.SetNull(prmField :TApplicationField);
begin
   FNullFields[prmField] := True;
   FChanged[prmField]    := True;
end;

function TApplication.IsChanged(prmField :TApplicationField):Boolean;
begin
   Result := FChanged[prmField];
end;

procedure TApplication.CompareWith(prmData :TApplication);
begin
   if APPLICATION <> prmData.APPLICATION then SetChanged(applicationAPPLICATION);
   if DB_VERSION  <> prmData.DB_VERSION  then SetChanged(applicationDB_VERSION );
end;

function TApplication.IsPrimaryKey(Field :TApplicationField):Boolean;
begin
   Result := FPrimaryKey[Field];
end;

function TApplication.IsPrimaryKey(Field :string):Boolean;
begin
   if Field = 'APPLICATION' then IsPrimaryKey(applicationAPPLICATION) else
   if Field = 'DB_VERSION'  then IsPrimaryKey(applicationDB_VERSION );
end;

procedure TApplication.SetAPPLICATION(const Value :string);
begin
   AssignString(Value, FAPPLICATION, FOLD_APPLICATION, applicationAPPLICATION); 
end;

procedure TApplication.SetDB_VERSION(const Value :string);
begin
   AssignString(Value, FDB_VERSION, FOLD_DB_VERSION, applicationDB_VERSION); 
end;


function TApplication.FieldToString(prmField: TApplicationField): string; 
begin                                                                       
   Result := ApplicationFieldNames[prmField];                              
   //GetEnumName(TypeInfo(TApplicationField), Integer(prmField));          
end;                                                                        
                                                                            
function TApplication.GetVersion: string;                                  
begin                                                                       
   Result := '1.00';                                                      
end;                                                                        

end.
