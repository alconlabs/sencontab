(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomSectionsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,
     SectionClass, CRSQLConnection;

{ TABLE NAME = SECTIONS  }
{=== Column Definition ===}
{ APPLICATION	char      	  15 NULL Allowed  	No    }
{ CD_SECTION 	char      	  15 NULL Allowed  	No    }
{ DS_SECTION 	varchar   	  25 NULL Allowed  	YES   }
{=== ================= ===}

type
  TCustomSectionsModel = class
  private
    FConnection     :TCRSQLConnection;
    FTableName      :string;                                              
    FOrderFieldName :string;   { The real name for the order instruction }
    FDataSet        :TSQLQuery;
    FLastError      :string;
    FSenseOrderBy   :string;     
    FSQLSearch      :TStringList;
    procedure ClearLastError;
    function GetRowsAffected:Integer;
    function GetRowCount    :Integer;
    function GetEOF :Boolean;
    function GetVersion :string;
    function GetSQLForUpdate(Value :TSection):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TSection):Boolean;
    function Save(prmData :TSection):Boolean;
    function Update(prmData :TSection):Boolean;
    function Delete(prmData :TSection):Boolean;
    //function  ExistsChildrenKey(prmData :TSection):Boolean;
    //function  PreviouslyExistsKey(prmData :TSection):Boolean;
    function  Current :TSection;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TSection):Boolean;
    function  GetDefaults:TSection;
    { Public properties}
    property Version        :string            read GetVersion;
    property Connection     :TCRSQLConnection  read FConnection;
    property EOF            :Boolean           read GetEOF;
    property RowsAffected   :Integer           read GetRowsAffected;
    property RowCount       :Integer           read GetRowCount;
    property OrderFieldName :string            read GetOrderFieldName write SetOrderFieldName;
    property SQLSearch      :TStringList       read FSQLSearch        write FSQLSearch;
  end;

implementation
uses TypInfo;

constructor TCustomSectionsModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'SECTIONS';
   FOrderFieldName  := 'APPLICATION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomSectionsModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomSectionsModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomSectionsModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomSectionsModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomSectionsModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomSectionsModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT APPLICATION, ');
   Result.Add('       CD_SECTION, ');
   Result.Add('       DS_SECTION ');
   Result.Add('FROM   SECTIONS');
end;

function TCustomSectionsModel.Open:Boolean;
var SQL :TStringList;
begin
   SQL := GetBaseSQLForSelect;
   SQL.AddStrings(FSQLSearch);
   SQL.Add('ORDER BY ' + OrderFieldName + ' '+ FSenseOrderBy);
   FDataSet.Close;
   FDataSet.ParamCheck := True;
   //FDataSet.LockType := ltReadOnly;
   //FDataSet.CursorLocation := clUseClient;
   FDataSet.SQL.Clear;
   FDataSet.SQL.Assign(SQL);
   ClearLastError;
   Result := True;
   try
     FDataSet.Open;
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomSectionsModel.QueryByExample(prmValue :TSection):Boolean;
var i :TSectionField;
    IsFirst  :Boolean;
begin
   //try
     FDataSet.Close;
     FDataSet.ParamCheck := True;
     //FDataSet.LockType := ltReadOnly;
     //FDataSet.CursorLocation := clUseClient;
     FDataSet.SQL.Clear;
     FDataSet.SQL.Add('SELECT ');
     try
        IsFirst := True;
        for i := Low(TSectionField) to High(TSectionField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(SectionFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TSectionField) to High(TSectionField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(SectionFieldNames[i] + ' = :prm' + SectionFieldNames[i]);
             FDataSet.ParamByName('prm'+SectionFieldNames[i]).Value := GetPropValue(prmValue, SectionFieldNames[i]);
             if not IsFirst then
                FDataSet.SQL[FDataSet.SQL.Count - 1] := 'AND '+FDataSet.SQL[FDataSet.SQL.Count - 1]
             else begin
                IsFirst := False;
                FDataSet.SQL[FDataSet.SQL.Count - 1] := 'WHERE '+FDataSet.SQL[FDataSet.SQL.Count - 1]
             end;
           end;
        end;
        if Trim(FOrderFieldName) <> '' then
           FDataSet.SQL.Add('ORDER BY ' + FOrderFieldName);
     finally
     end;
     FDataSet.Open;
   //except
   //  raise EDatabaseError.Create('Error querying');
   //end;
end;

function TCustomSectionsModel.Save(prmData :TSection):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TSectionField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Sections (');
     for i := Low(TSectionField) to High(TSectionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(SectionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TSectionField) to High(TSectionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+SectionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(SectionAPPLICATION) then
          Q.ParamByName('prmAPPLICATION'  ).Value := prmData.APPLICATION;
       if not prmData.IsNull(SectionCD_SECTION ) then
          Q.ParamByName('prmCD_SECTION'   ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(SectionDS_SECTION ) then
          Q.ParamByName('prmDS_SECTION'   ).Value := prmData.DS_SECTION;
       Result := True;
       try Q.ExecSQL;
       except
         on E : Exception do begin
           Result := False;
           FLastError := E.Message;
         end;
       end;
     finally Q.Free;
     end;
   finally
     SQL.Free;
   end;
end;

function TCustomSectionsModel.Update(prmData :TSection):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TSectionField;                                              

begin
(*************************************************************************  
   TABLE OF TRUE                                                            
                                                                            
  CASE    OLD VALUE  --- VALUE                                              
  -----------------------------                                             
   A      NULL           NULL    this is the same and equal values          
   B      NULL           VALOR   this is diferent values                    
   C      VALOR          NULL    this is diferent values                    
   D      VALOR          VALOR   same value or diferent value               
                                                                            
  IsChanges is a check for B, C and D cases, but in D case has an exception.
    In case of D, the may be changed, but with the same value.              
    In this case we consider that is changed, because the final user can use
    this circunstance to make that collateral effects, like triggers, run   
    with the same data.                                                     
                                                                            
***************************************************************************)

   ClearLastError;

   SQL := GetSQLForUpdate(prmData);                      
   try                                                   
     Q := FConnection.CreateQuery(['']);               
     Q.SQL.Assign(SQL);                                  
     try                                                 
       if not prmData.IsNull(SectionAPPLICATION) then
          Q.ParamByName('prmAPPLICATION'  ).Value := prmData.APPLICATION;
       if not prmData.IsNull(SectionCD_SECTION ) then
          Q.ParamByName('prmCD_SECTION'   ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(SectionDS_SECTION ) then
          Q.ParamByName('prmDS_SECTION'   ).Value := prmData.DS_SECTION;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(SectionAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(SectionAPPLICATION)).Value := prmData.APPLICATION_OldValue;

       if prmData.IsPrimaryKey(SectionCD_SECTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(SectionCD_SECTION)).Value := prmData.CD_SECTION_OldValue;

       if prmData.IsPrimaryKey(SectionDS_SECTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(SectionDS_SECTION)).Value := prmData.DS_SECTION_OldValue;

       Result := True;                 
       try Q.ExecSQL;                  
       except                          
         on E : Exception do begin     
           Result := False;            
           FLastError := E.Message;    
         end;                          
       end;                            
     finally Q.Free;                   
     end;                              
   finally                             
     SQL.Free;                         
   end;                                

end;

function TCustomSectionsModel.Delete(prmData :TSection):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM SECTIONS',
                                 'WHERE APPLICATION = :prmAPPLICATION']);
   try
     Q.ParamCheck := True;
{Message Error 'change the primary key fields reference if necesary'}
     Q.Params[0].Value := prmData.APPLICATION;
     try
       Q.ExecSQL;
     except
       on E : Exception do begin
         Result     := False;
         FLastError := E.Message;
       end;
     end;
     if Result and (Q.RowsAffected = 0) then begin
        Result     := False;
        FLastError := 'Not deleted anything';
     end;
   finally Q.Free;
   end;
end;

function TCustomSectionsModel.Current :TSection;
var Item :TSection;
    //i   :TUsuarioField;
begin
   Item := TSection.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('APPLICATION').IsNull) then
      Item.APPLICATION := Trim(FDataSet.FieldByName('APPLICATION').AsString);
   if not(FDataSet.FieldByName('CD_SECTION' ).IsNull) then
      Item.CD_SECTION  := Trim(FDataSet.FieldByName('CD_SECTION').AsString);
   if not(FDataSet.FieldByName('DS_SECTION' ).IsNull) then
      Item.DS_SECTION  := Trim(FDataSet.FieldByName('DS_SECTION').AsString);

   Result := Item;
end;

function TCustomSectionsModel.First:Boolean;
begin
   ClearLastError;
   Result := True;
   try
     FDataSet.First;
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.Prior:Boolean;
begin
   ClearLastError;
   Result := True;
   try
     FDataSet.Prior;
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.Next:Boolean;
begin
   ClearLastError;
   Result := True;
   try
     FDataSet.Next;
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.Last:Boolean;
begin
   ClearLastError;
   Result := True;
   try
     FDataSet.Last;
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.Locate(prmData :TSection):Boolean;
begin
   ClearLastError;
   Result := True;
   try
     //FDataSet.Locate('ID_ZONA', prmID_ZONA, []);
   except
     on E : Exception do begin
       Result := False;
       FLastError := E.Message;
     end;
   end;
end;

function TCustomSectionsModel.GetDefaults:TSection;
begin
   Result := TSection.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomSectionsModel.GetSQLForUpdate(Value: TSection):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TSectionField;                                                    
begin                                                                             
  (***********************************************************************************
   TABLE OF TRUE                                                                      
                                                                                      
  CASE    OLD VALUE  --- VALUE                                                        
  -----------------------------                                                       
   A      NULL           NULL    this is the same and equal values                    
   B      NULL           VALOR   this is diferent values                              
   C      VALOR          NULL    this is diferent values                              
   D      VALOR          VALOR   same value or diferent value                         
                                                                                      
   IsChanges is a check for B, C and D cases, but in D case has an exception.         
      In case of D, the may be changed, but with the same value.                      
      In this case we consider that is changed, because the final user can use this   
      circunstance to make that collateral effects, like triggers, run with the same data.
                                                                                      
************************************************************************************) 

   First := True;                                                                     
   Query := TStringList.Create();                                                     
   Query.Append('UPDATE '+FTableName+' SET ');                                    
                                                                                      
   First := True;                                                                     
   for each := Low(TSectionField) to High(TSectionField) do begin           
      if Value.IsChanged(each) then begin                                             
         if First then comma := ''                                                  
                  else comma := ', ';                                               
         if Value.IsNull(each) then                                                   
            Query.Append(comma + Value.FieldToString(Each) + ' = NULL ')            
         else                                                                         
            Query.Append(comma + Value.FieldToString(Each) + ' = :prm'+ Value.FieldToString(Each));
         First := False;                                                              
      end;                                                                            
   end;                                                                               

   First := True;                                                                     
   for each := Low(TSectionField) to High(TSectionField) do begin           
      if Value.IsPrimaryKey(each) then begin                                          
         if First then comma := ' WHERE '                                           
                  else comma := ' AND   ';                                          
         if Value.IsNull(each) then                                                   
            Query.Append(comma + Value.FieldToString(each) + ' = NULL ')            
            // Show a Warning. A Primary Key field shall have value                   
         else                                                                         
            Query.Append(comma + Value.FieldToString(each) + ' = :prmPK_'+Value.FieldToString(each));
         First := False;                                                              
      end;                                                                            
   end;                                                                               
   Result := Query;                                                                   
end;                                                                                  

function TCustomSectionsModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.00';                                                                
end;                                                                                  

function TCustomSectionsModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'APPLICATION' then Result := 'APPLICATION' else 
       if FOrderFieldName = 'CD_SECTION'  then Result := 'CD_SECTION'  else 
       if FOrderFieldName = 'DS_SECTION'  then Result := 'DS_SECTION'  else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomSectionsModel.SetOrderFieldName(Value :string);                    
begin                                                                                 
   if FOrderFieldName <> Value then begin                                             
      FOrderFieldName := Value;                                                       
      FSenseOrderBy := 'ASC';                                                       
   end                                                                                
   else begin                                                                         
      if FSenseOrderBy = 'ASC' then FSenseOrderBy := 'DESC'                       
                               else FSenseOrderBy := 'ASC';                         
   end;                                                                               
end;                                                                                  

end.
