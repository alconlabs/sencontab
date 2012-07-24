(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomProfileOptionsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr, CustomModel,
     ProfileOptionClass, CRSQLConnection;

{ TABLE NAME = PROFILE_OPTIONS  }
{=== Column Definition ===}
{ CD_PROFILE_OPTION       	char      	 100 NULL Allowed  	No    }
{ CD_PARENT_PROFILE_OPTION	char      	 100 NULL Allowed  	YES   }
{ CD_PROFILE              	char      	  15 NULL Allowed  	No    }
{ APPLICATION             	char      	  15 NULL Allowed  	No    }
{ ALLOW_SEE               	char      	   1 NULL Allowed  	No    }
{ ALLOW_ACCESS            	char      	   1 NULL Allowed  	No    }
{ ALLOW_ADD               	char      	   1 NULL Allowed  	No    }
{ ALLOW_MODIFY            	char      	   1 NULL Allowed  	No    }
{ ALLOW_DELETE            	char      	   1 NULL Allowed  	No    }
{ ALLOW_REPORT            	char      	   1 NULL Allowed  	No    }
{ ALLOW_EXEC              	char      	   1 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomProfileOptionsModel = class(TCustomModel)
  private
    FConnection     :TCRSQLConnection;
    FTableName      :string;                                              
    FOrderFieldName :string;   { The real name for the order instruction }
    FSenseOrderBy   :string;     
    FSQLSearch      :TStringList;
    function GetRowsAffected:Integer;
    function GetRowCount    :Integer;
    function GetEOF :Boolean;
    function GetVersion :string;
    function GetSQLForUpdate(Value :TProfileOption):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    FDataSet        :TSQLQuery;
    FLastError      :string;
    procedure ClearLastError;
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TProfileOption):Boolean;
    function Save(prmData :TProfileOption):Boolean;
    function Update(prmData :TProfileOption):Boolean;
    function Delete(prmData :TProfileOption):Boolean;
    //function  ExistsChildrenKey(prmData :TProfileOption):Boolean;
    //function  PreviouslyExistsKey(prmData :TProfileOption):Boolean;
    function  Current :TProfileOption;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TProfileOption):Boolean;
    function  GetDefaults:TProfileOption;
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

constructor TCustomProfileOptionsModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'PROFILE_OPTIONS';
   FOrderFieldName  := 'CD_PROFILE_OPTION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomProfileOptionsModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomProfileOptionsModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomProfileOptionsModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomProfileOptionsModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomProfileOptionsModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomProfileOptionsModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT CD_PROFILE_OPTION, ');
   Result.Add('       CD_PARENT_PROFILE_OPTION, ');
   Result.Add('       CD_PROFILE, ');
   Result.Add('       APPLICATION, ');
   Result.Add('       ALLOW_SEE, ');
   Result.Add('       ALLOW_ACCESS, ');
   Result.Add('       ALLOW_ADD, ');
   Result.Add('       ALLOW_MODIFY, ');
   Result.Add('       ALLOW_DELETE, ');
   Result.Add('       ALLOW_REPORT, ');
   Result.Add('       ALLOW_EXEC ');
   Result.Add('FROM   PROFILE_OPTIONS');
end;

function TCustomProfileOptionsModel.Open:Boolean;
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

function TCustomProfileOptionsModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomProfileOptionsModel.QueryByExample(prmValue :TProfileOption):Boolean;
var i :TProfileOptionField;
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
        for i := Low(TProfileOptionField) to High(TProfileOptionField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(ProfileOptionFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TProfileOptionField) to High(TProfileOptionField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(ProfileOptionFieldNames[i] + ' = :prm' + ProfileOptionFieldNames[i]);
             FDataSet.ParamByName('prm'+ProfileOptionFieldNames[i]).Value := GetPropValue(prmValue, ProfileOptionFieldNames[i]);
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

function TCustomProfileOptionsModel.Save(prmData :TProfileOption):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TProfileOptionField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO ProfileOptions (');
     for i := Low(TProfileOptionField) to High(TProfileOptionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(ProfileOptionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TProfileOptionField) to High(TProfileOptionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+ProfileOptionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(ProfileOptionCD_PROFILE_OPTION       ) then
          Q.ParamByName('prmCD_PROFILE_OPTION'         ).Value := prmData.CD_PROFILE_OPTION;
       if not prmData.IsNull(ProfileOptionCD_PARENT_PROFILE_OPTION) then
          Q.ParamByName('prmCD_PARENT_PROFILE_OPTION'  ).Value := prmData.CD_PARENT_PROFILE_OPTION;
       if not prmData.IsNull(ProfileOptionCD_PROFILE              ) then
          Q.ParamByName('prmCD_PROFILE'                ).Value := prmData.CD_PROFILE;
       if not prmData.IsNull(ProfileOptionAPPLICATION             ) then
          Q.ParamByName('prmAPPLICATION'               ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ProfileOptionALLOW_SEE               ) then
          Q.ParamByName('prmALLOW_SEE'                 ).Value := prmData.ALLOW_SEE;
       if not prmData.IsNull(ProfileOptionALLOW_ACCESS            ) then
          Q.ParamByName('prmALLOW_ACCESS'              ).Value := prmData.ALLOW_ACCESS;
       if not prmData.IsNull(ProfileOptionALLOW_ADD               ) then
          Q.ParamByName('prmALLOW_ADD'                 ).Value := prmData.ALLOW_ADD;
       if not prmData.IsNull(ProfileOptionALLOW_MODIFY            ) then
          Q.ParamByName('prmALLOW_MODIFY'              ).Value := prmData.ALLOW_MODIFY;
       if not prmData.IsNull(ProfileOptionALLOW_DELETE            ) then
          Q.ParamByName('prmALLOW_DELETE'              ).Value := prmData.ALLOW_DELETE;
       if not prmData.IsNull(ProfileOptionALLOW_REPORT            ) then
          Q.ParamByName('prmALLOW_REPORT'              ).Value := prmData.ALLOW_REPORT;
       if not prmData.IsNull(ProfileOptionALLOW_EXEC              ) then
          Q.ParamByName('prmALLOW_EXEC'                ).Value := prmData.ALLOW_EXEC;
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

function TCustomProfileOptionsModel.Update(prmData :TProfileOption):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TProfileOptionField;                                              

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
       if not prmData.IsNull(ProfileOptionCD_PROFILE_OPTION       ) then
          Q.ParamByName('prmCD_PROFILE_OPTION'         ).Value := prmData.CD_PROFILE_OPTION;
       if not prmData.IsNull(ProfileOptionCD_PARENT_PROFILE_OPTION) then
          Q.ParamByName('prmCD_PARENT_PROFILE_OPTION'  ).Value := prmData.CD_PARENT_PROFILE_OPTION;
       if not prmData.IsNull(ProfileOptionCD_PROFILE              ) then
          Q.ParamByName('prmCD_PROFILE'                ).Value := prmData.CD_PROFILE;
       if not prmData.IsNull(ProfileOptionAPPLICATION             ) then
          Q.ParamByName('prmAPPLICATION'               ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ProfileOptionALLOW_SEE               ) then
          Q.ParamByName('prmALLOW_SEE'                 ).Value := prmData.ALLOW_SEE;
       if not prmData.IsNull(ProfileOptionALLOW_ACCESS            ) then
          Q.ParamByName('prmALLOW_ACCESS'              ).Value := prmData.ALLOW_ACCESS;
       if not prmData.IsNull(ProfileOptionALLOW_ADD               ) then
          Q.ParamByName('prmALLOW_ADD'                 ).Value := prmData.ALLOW_ADD;
       if not prmData.IsNull(ProfileOptionALLOW_MODIFY            ) then
          Q.ParamByName('prmALLOW_MODIFY'              ).Value := prmData.ALLOW_MODIFY;
       if not prmData.IsNull(ProfileOptionALLOW_DELETE            ) then
          Q.ParamByName('prmALLOW_DELETE'              ).Value := prmData.ALLOW_DELETE;
       if not prmData.IsNull(ProfileOptionALLOW_REPORT            ) then
          Q.ParamByName('prmALLOW_REPORT'              ).Value := prmData.ALLOW_REPORT;
       if not prmData.IsNull(ProfileOptionALLOW_EXEC              ) then
          Q.ParamByName('prmALLOW_EXEC'                ).Value := prmData.ALLOW_EXEC;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(ProfileOptionCD_PROFILE_OPTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionCD_PROFILE_OPTION)).Value := prmData.CD_PROFILE_OPTION_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionCD_PARENT_PROFILE_OPTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionCD_PARENT_PROFILE_OPTION)).Value := prmData.CD_PARENT_PROFILE_OPTION_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionCD_PROFILE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionCD_PROFILE)).Value := prmData.CD_PROFILE_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionAPPLICATION)).Value := prmData.APPLICATION_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_SEE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_SEE)).Value := prmData.ALLOW_SEE_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_ACCESS) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_ACCESS)).Value := prmData.ALLOW_ACCESS_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_ADD) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_ADD)).Value := prmData.ALLOW_ADD_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_MODIFY) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_MODIFY)).Value := prmData.ALLOW_MODIFY_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_DELETE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_DELETE)).Value := prmData.ALLOW_DELETE_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_REPORT) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_REPORT)).Value := prmData.ALLOW_REPORT_OldValue;

       if prmData.IsPrimaryKey(ProfileOptionALLOW_EXEC) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileOptionALLOW_EXEC)).Value := prmData.ALLOW_EXEC_OldValue;

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

function TCustomProfileOptionsModel.Delete(prmData :TProfileOption):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM PROFILE_OPTIONS',
                                 'WHERE CD_PROFILE_OPTION = :prmCD_PROFILE_OPTION']);
   try
     Q.ParamCheck := True;
{Message Error 'change the primary key fields reference if necesary'}
     Q.Params[0].Value := prmData.CD_PROFILE_OPTION;
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

function TCustomProfileOptionsModel.Current :TProfileOption;
var Item :TProfileOption;
    //i   :TUsuarioField;
begin
   Item := TProfileOption.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('CD_PROFILE_OPTION'       ).IsNull) then
      Item.CD_PROFILE_OPTION        := Trim(FDataSet.FieldByName('CD_PROFILE_OPTION').AsString);
   if not(FDataSet.FieldByName('CD_PARENT_PROFILE_OPTION').IsNull) then
      Item.CD_PARENT_PROFILE_OPTION := Trim(FDataSet.FieldByName('CD_PARENT_PROFILE_OPTION').AsString);
   if not(FDataSet.FieldByName('CD_PROFILE'              ).IsNull) then
      Item.CD_PROFILE               := Trim(FDataSet.FieldByName('CD_PROFILE').AsString);
   if not(FDataSet.FieldByName('APPLICATION'             ).IsNull) then
      Item.APPLICATION              := Trim(FDataSet.FieldByName('APPLICATION').AsString);
   if not(FDataSet.FieldByName('ALLOW_SEE'               ).IsNull) then
      Item.ALLOW_SEE                := Trim(FDataSet.FieldByName('ALLOW_SEE').AsString);
   if not(FDataSet.FieldByName('ALLOW_ACCESS'            ).IsNull) then
      Item.ALLOW_ACCESS             := Trim(FDataSet.FieldByName('ALLOW_ACCESS').AsString);
   if not(FDataSet.FieldByName('ALLOW_ADD'               ).IsNull) then
      Item.ALLOW_ADD                := Trim(FDataSet.FieldByName('ALLOW_ADD').AsString);
   if not(FDataSet.FieldByName('ALLOW_MODIFY'            ).IsNull) then
      Item.ALLOW_MODIFY             := Trim(FDataSet.FieldByName('ALLOW_MODIFY').AsString);
   if not(FDataSet.FieldByName('ALLOW_DELETE'            ).IsNull) then
      Item.ALLOW_DELETE             := Trim(FDataSet.FieldByName('ALLOW_DELETE').AsString);
   if not(FDataSet.FieldByName('ALLOW_REPORT'            ).IsNull) then
      Item.ALLOW_REPORT             := Trim(FDataSet.FieldByName('ALLOW_REPORT').AsString);
   if not(FDataSet.FieldByName('ALLOW_EXEC'              ).IsNull) then
      Item.ALLOW_EXEC               := Trim(FDataSet.FieldByName('ALLOW_EXEC').AsString);

   Result := Item;
end;

function TCustomProfileOptionsModel.First:Boolean;
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

function TCustomProfileOptionsModel.Prior:Boolean;
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

function TCustomProfileOptionsModel.Next:Boolean;
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

function TCustomProfileOptionsModel.Last:Boolean;
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

function TCustomProfileOptionsModel.Locate(prmData :TProfileOption):Boolean;
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

function TCustomProfileOptionsModel.GetDefaults:TProfileOption;
begin
   Result := TProfileOption.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomProfileOptionsModel.GetSQLForUpdate(Value: TProfileOption):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TProfileOptionField;                                                    
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
   for each := Low(TProfileOptionField) to High(TProfileOptionField) do begin           
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
   for each := Low(TProfileOptionField) to High(TProfileOptionField) do begin           
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

function TCustomProfileOptionsModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.01';                                                                
   { Improvements in 1.01:                                                          } 
   { FLastErrorl, FDataSet and procedure ClearLastError, has been translated to the } 
   { protected section of the class. It allows the descentants the use of this Items} 
end;                                                                                  

function TCustomProfileOptionsModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'CD_PROFILE_OPTION'        then Result := 'CD_PROFILE_OPTION'        else 
       if FOrderFieldName = 'CD_PARENT_PROFILE_OPTION' then Result := 'CD_PARENT_PROFILE_OPTION' else 
       if FOrderFieldName = 'CD_PROFILE'               then Result := 'CD_PROFILE'               else 
       if FOrderFieldName = 'APPLICATION'              then Result := 'APPLICATION'              else 
       if FOrderFieldName = 'ALLOW_SEE'                then Result := 'ALLOW_SEE'                else 
       if FOrderFieldName = 'ALLOW_ACCESS'             then Result := 'ALLOW_ACCESS'             else 
       if FOrderFieldName = 'ALLOW_ADD'                then Result := 'ALLOW_ADD'                else 
       if FOrderFieldName = 'ALLOW_MODIFY'             then Result := 'ALLOW_MODIFY'             else 
       if FOrderFieldName = 'ALLOW_DELETE'             then Result := 'ALLOW_DELETE'             else 
       if FOrderFieldName = 'ALLOW_REPORT'             then Result := 'ALLOW_REPORT'             else 
       if FOrderFieldName = 'ALLOW_EXEC'               then Result := 'ALLOW_EXEC'               else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomProfileOptionsModel.SetOrderFieldName(Value :string);                    
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
