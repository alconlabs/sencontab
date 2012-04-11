(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomProfilesModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,
     ProfileClass, CRSQLConnection;

{ TABLE NAME = PROFILES  }
{=== Column Definition ===}
{ APPLICATION 	char      	  15 NULL Allowed  	No    }
{ CD_SECTION  	char      	  15 NULL Allowed  	No    }
{ CD_MODULE   	char      	  50 NULL Allowed  	No    }
{ CD_PROFILE  	char      	  15 NULL Allowed  	No    }
{ DS_PROFILE  	char      	  80 NULL Allowed  	YES   }
{ ALLOW_ADD   	char      	   1 NULL Allowed  	No    }
{ ALLOW_MODIFY	char      	   1 NULL Allowed  	No    }
{ ALLOW_DELETE	char      	   1 NULL Allowed  	No    }
{ ALLOW_REPORT	char      	   1 NULL Allowed  	No    }
{ ALLOW_EXEC  	char      	   1 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomProfilesModel = class
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
    function GetSQLForUpdate(Value :TProfile):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TProfile):Boolean;
    function Save(prmData :TProfile):Boolean;
    function Update(prmData :TProfile):Boolean;
    function Delete(prmData :TProfile):Boolean;
    //function  ExistsChildrenKey(prmData :TProfile):Boolean;
    //function  PreviouslyExistsKey(prmData :TProfile):Boolean;
    function  Current :TProfile;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TProfile):Boolean;
    function  GetDefaults:TProfile;
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

constructor TCustomProfilesModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'PROFILES';
   FOrderFieldName  := 'APPLICATION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomProfilesModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomProfilesModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomProfilesModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomProfilesModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomProfilesModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomProfilesModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT APPLICATION, ');
   Result.Add('       CD_SECTION, ');
   Result.Add('       CD_MODULE, ');
   Result.Add('       CD_PROFILE, ');
   Result.Add('       DS_PROFILE, ');
   Result.Add('       ALLOW_ADD, ');
   Result.Add('       ALLOW_MODIFY, ');
   Result.Add('       ALLOW_DELETE, ');
   Result.Add('       ALLOW_REPORT, ');
   Result.Add('       ALLOW_EXEC ');
   Result.Add('FROM   PROFILES');
end;

function TCustomProfilesModel.Open:Boolean;
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

function TCustomProfilesModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomProfilesModel.QueryByExample(prmValue :TProfile):Boolean;
var i :TProfileField;
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
        for i := Low(TProfileField) to High(TProfileField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(ProfileFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TProfileField) to High(TProfileField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(ProfileFieldNames[i] + ' = :prm' + ProfileFieldNames[i]);
             FDataSet.ParamByName('prm'+ProfileFieldNames[i]).Value := GetPropValue(prmValue, ProfileFieldNames[i]);
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

function TCustomProfilesModel.Save(prmData :TProfile):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TProfileField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Profiles (');
     for i := Low(TProfileField) to High(TProfileField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(ProfileFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TProfileField) to High(TProfileField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+ProfileFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(ProfileAPPLICATION ) then
          Q.ParamByName('prmAPPLICATION'   ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ProfileCD_SECTION  ) then
          Q.ParamByName('prmCD_SECTION'    ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(ProfileCD_MODULE   ) then
          Q.ParamByName('prmCD_MODULE'     ).Value := prmData.CD_MODULE;
       if not prmData.IsNull(ProfileCD_PROFILE  ) then
          Q.ParamByName('prmCD_PROFILE'    ).Value := prmData.CD_PROFILE;
       if not prmData.IsNull(ProfileDS_PROFILE  ) then
          Q.ParamByName('prmDS_PROFILE'    ).Value := prmData.DS_PROFILE;
       if not prmData.IsNull(ProfileALLOW_ADD   ) then
          Q.ParamByName('prmALLOW_ADD'     ).Value := prmData.ALLOW_ADD;
       if not prmData.IsNull(ProfileALLOW_MODIFY) then
          Q.ParamByName('prmALLOW_MODIFY'  ).Value := prmData.ALLOW_MODIFY;
       if not prmData.IsNull(ProfileALLOW_DELETE) then
          Q.ParamByName('prmALLOW_DELETE'  ).Value := prmData.ALLOW_DELETE;
       if not prmData.IsNull(ProfileALLOW_REPORT) then
          Q.ParamByName('prmALLOW_REPORT'  ).Value := prmData.ALLOW_REPORT;
       if not prmData.IsNull(ProfileALLOW_EXEC  ) then
          Q.ParamByName('prmALLOW_EXEC'    ).Value := prmData.ALLOW_EXEC;
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

function TCustomProfilesModel.Update(prmData :TProfile):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TProfileField;                                              

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
       if not prmData.IsNull(ProfileAPPLICATION ) then
          Q.ParamByName('prmAPPLICATION'   ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ProfileCD_SECTION  ) then
          Q.ParamByName('prmCD_SECTION'    ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(ProfileCD_MODULE   ) then
          Q.ParamByName('prmCD_MODULE'     ).Value := prmData.CD_MODULE;
       if not prmData.IsNull(ProfileCD_PROFILE  ) then
          Q.ParamByName('prmCD_PROFILE'    ).Value := prmData.CD_PROFILE;
       if not prmData.IsNull(ProfileDS_PROFILE  ) then
          Q.ParamByName('prmDS_PROFILE'    ).Value := prmData.DS_PROFILE;
       if not prmData.IsNull(ProfileALLOW_ADD   ) then
          Q.ParamByName('prmALLOW_ADD'     ).Value := prmData.ALLOW_ADD;
       if not prmData.IsNull(ProfileALLOW_MODIFY) then
          Q.ParamByName('prmALLOW_MODIFY'  ).Value := prmData.ALLOW_MODIFY;
       if not prmData.IsNull(ProfileALLOW_DELETE) then
          Q.ParamByName('prmALLOW_DELETE'  ).Value := prmData.ALLOW_DELETE;
       if not prmData.IsNull(ProfileALLOW_REPORT) then
          Q.ParamByName('prmALLOW_REPORT'  ).Value := prmData.ALLOW_REPORT;
       if not prmData.IsNull(ProfileALLOW_EXEC  ) then
          Q.ParamByName('prmALLOW_EXEC'    ).Value := prmData.ALLOW_EXEC;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(ProfileAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileAPPLICATION)).Value := prmData.APPLICATION_OldValue;

       if prmData.IsPrimaryKey(ProfileCD_SECTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileCD_SECTION)).Value := prmData.CD_SECTION_OldValue;

       if prmData.IsPrimaryKey(ProfileCD_MODULE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileCD_MODULE)).Value := prmData.CD_MODULE_OldValue;

       if prmData.IsPrimaryKey(ProfileCD_PROFILE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileCD_PROFILE)).Value := prmData.CD_PROFILE_OldValue;

       if prmData.IsPrimaryKey(ProfileDS_PROFILE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileDS_PROFILE)).Value := prmData.DS_PROFILE_OldValue;

       if prmData.IsPrimaryKey(ProfileALLOW_ADD) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileALLOW_ADD)).Value := prmData.ALLOW_ADD_OldValue;

       if prmData.IsPrimaryKey(ProfileALLOW_MODIFY) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileALLOW_MODIFY)).Value := prmData.ALLOW_MODIFY_OldValue;

       if prmData.IsPrimaryKey(ProfileALLOW_DELETE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileALLOW_DELETE)).Value := prmData.ALLOW_DELETE_OldValue;

       if prmData.IsPrimaryKey(ProfileALLOW_REPORT) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileALLOW_REPORT)).Value := prmData.ALLOW_REPORT_OldValue;

       if prmData.IsPrimaryKey(ProfileALLOW_EXEC) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ProfileALLOW_EXEC)).Value := prmData.ALLOW_EXEC_OldValue;

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

function TCustomProfilesModel.Delete(prmData :TProfile):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM PROFILES',
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

function TCustomProfilesModel.Current :TProfile;
var Item :TProfile;
    //i   :TUsuarioField;
begin
   Item := TProfile.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('APPLICATION' ).IsNull) then
      Item.APPLICATION  := Trim(FDataSet.FieldByName('APPLICATION').AsString);
   if not(FDataSet.FieldByName('CD_SECTION'  ).IsNull) then
      Item.CD_SECTION   := Trim(FDataSet.FieldByName('CD_SECTION').AsString);
   if not(FDataSet.FieldByName('CD_MODULE'   ).IsNull) then
      Item.CD_MODULE    := Trim(FDataSet.FieldByName('CD_MODULE').AsString);
   if not(FDataSet.FieldByName('CD_PROFILE'  ).IsNull) then
      Item.CD_PROFILE   := Trim(FDataSet.FieldByName('CD_PROFILE').AsString);
   if not(FDataSet.FieldByName('DS_PROFILE'  ).IsNull) then
      Item.DS_PROFILE   := Trim(FDataSet.FieldByName('DS_PROFILE').AsString);
   if not(FDataSet.FieldByName('ALLOW_ADD'   ).IsNull) then
      Item.ALLOW_ADD    := Trim(FDataSet.FieldByName('ALLOW_ADD').AsString);
   if not(FDataSet.FieldByName('ALLOW_MODIFY').IsNull) then
      Item.ALLOW_MODIFY := Trim(FDataSet.FieldByName('ALLOW_MODIFY').AsString);
   if not(FDataSet.FieldByName('ALLOW_DELETE').IsNull) then
      Item.ALLOW_DELETE := Trim(FDataSet.FieldByName('ALLOW_DELETE').AsString);
   if not(FDataSet.FieldByName('ALLOW_REPORT').IsNull) then
      Item.ALLOW_REPORT := Trim(FDataSet.FieldByName('ALLOW_REPORT').AsString);
   if not(FDataSet.FieldByName('ALLOW_EXEC'  ).IsNull) then
      Item.ALLOW_EXEC   := Trim(FDataSet.FieldByName('ALLOW_EXEC').AsString);

   Result := Item;
end;

function TCustomProfilesModel.First:Boolean;
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

function TCustomProfilesModel.Prior:Boolean;
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

function TCustomProfilesModel.Next:Boolean;
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

function TCustomProfilesModel.Last:Boolean;
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

function TCustomProfilesModel.Locate(prmData :TProfile):Boolean;
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

function TCustomProfilesModel.GetDefaults:TProfile;
begin
   Result := TProfile.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomProfilesModel.GetSQLForUpdate(Value: TProfile):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TProfileField;                                                    
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
   for each := Low(TProfileField) to High(TProfileField) do begin           
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
   for each := Low(TProfileField) to High(TProfileField) do begin           
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

function TCustomProfilesModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.00';                                                                
end;                                                                                  

function TCustomProfilesModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'APPLICATION'  then Result := 'APPLICATION'  else 
       if FOrderFieldName = 'CD_SECTION'   then Result := 'CD_SECTION'   else 
       if FOrderFieldName = 'CD_MODULE'    then Result := 'CD_MODULE'    else 
       if FOrderFieldName = 'CD_PROFILE'   then Result := 'CD_PROFILE'   else 
       if FOrderFieldName = 'DS_PROFILE'   then Result := 'DS_PROFILE'   else 
       if FOrderFieldName = 'ALLOW_ADD'    then Result := 'ALLOW_ADD'    else 
       if FOrderFieldName = 'ALLOW_MODIFY' then Result := 'ALLOW_MODIFY' else 
       if FOrderFieldName = 'ALLOW_DELETE' then Result := 'ALLOW_DELETE' else 
       if FOrderFieldName = 'ALLOW_REPORT' then Result := 'ALLOW_REPORT' else 
       if FOrderFieldName = 'ALLOW_EXEC'   then Result := 'ALLOW_EXEC'   else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomProfilesModel.SetOrderFieldName(Value :string);                    
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
