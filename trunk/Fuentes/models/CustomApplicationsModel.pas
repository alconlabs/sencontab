(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomApplicationsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,
     ApplicationClass, CRSQLConnection;

{ TABLE NAME = APPLICATIONS  }
{=== Column Definition ===}
{ APPLICATION	char      	  15 NULL Allowed  	No    }
{ DB_VERSION 	char      	   5 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomApplicationsModel = class
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
    function GetSQLForUpdate(Value :TApplication):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TApplication):Boolean;
    function Save(prmData :TApplication):Boolean;
    function Update(prmData :TApplication):Boolean;
    function Delete(prmData :TApplication):Boolean;
    //function  ExistsChildrenKey(prmData :TApplication):Boolean;
    //function  PreviouslyExistsKey(prmData :TApplication):Boolean;
    function  Current :TApplication;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TApplication):Boolean;
    function  GetDefaults:TApplication;
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

constructor TCustomApplicationsModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'APPLICATIONS';
   FOrderFieldName  := 'APPLICATION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomApplicationsModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomApplicationsModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomApplicationsModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomApplicationsModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomApplicationsModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomApplicationsModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT APPLICATION, ');
   Result.Add('       DB_VERSION ');
   Result.Add('FROM   APPLICATIONS');
end;

function TCustomApplicationsModel.Open:Boolean;
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

function TCustomApplicationsModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomApplicationsModel.QueryByExample(prmValue :TApplication):Boolean;
var i :TApplicationField;
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
        for i := Low(TApplicationField) to High(TApplicationField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(ApplicationFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TApplicationField) to High(TApplicationField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(ApplicationFieldNames[i] + ' = :prm' + ApplicationFieldNames[i]);
             FDataSet.ParamByName('prm'+ApplicationFieldNames[i]).Value := GetPropValue(prmValue, ApplicationFieldNames[i]);
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

function TCustomApplicationsModel.Save(prmData :TApplication):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TApplicationField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Applications (');
     for i := Low(TApplicationField) to High(TApplicationField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(ApplicationFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TApplicationField) to High(TApplicationField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+ApplicationFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(ApplicationAPPLICATION) then
          Q.ParamByName('prmAPPLICATION'  ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ApplicationDB_VERSION ) then
          Q.ParamByName('prmDB_VERSION'   ).Value := prmData.DB_VERSION;
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

function TCustomApplicationsModel.Update(prmData :TApplication):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TApplicationField;                                              

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
       if not prmData.IsNull(ApplicationAPPLICATION) then
          Q.ParamByName('prmAPPLICATION'  ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ApplicationDB_VERSION ) then
          Q.ParamByName('prmDB_VERSION'   ).Value := prmData.DB_VERSION;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(ApplicationAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ApplicationAPPLICATION)).Value := prmData.APPLICATION_OldValue;

       if prmData.IsPrimaryKey(ApplicationDB_VERSION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ApplicationDB_VERSION)).Value := prmData.DB_VERSION_OldValue;

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

function TCustomApplicationsModel.Delete(prmData :TApplication):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM APPLICATIONS',
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

function TCustomApplicationsModel.Current :TApplication;
var Item :TApplication;
    //i   :TUsuarioField;
begin
   Item := TApplication.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('APPLICATION').IsNull) then
      Item.APPLICATION := Trim(FDataSet.FieldByName('APPLICATION').AsString);
   if not(FDataSet.FieldByName('DB_VERSION' ).IsNull) then
      Item.DB_VERSION  := Trim(FDataSet.FieldByName('DB_VERSION').AsString);

   Result := Item;
end;

function TCustomApplicationsModel.First:Boolean;
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

function TCustomApplicationsModel.Prior:Boolean;
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

function TCustomApplicationsModel.Next:Boolean;
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

function TCustomApplicationsModel.Last:Boolean;
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

function TCustomApplicationsModel.Locate(prmData :TApplication):Boolean;
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

function TCustomApplicationsModel.GetDefaults:TApplication;
begin
   Result := TApplication.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomApplicationsModel.GetSQLForUpdate(Value: TApplication):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TApplicationField;                                                    
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
   for each := Low(TApplicationField) to High(TApplicationField) do begin           
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
   for each := Low(TApplicationField) to High(TApplicationField) do begin           
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

function TCustomApplicationsModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.00';                                                                
end;                                                                                  

function TCustomApplicationsModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'APPLICATION' then Result := 'APPLICATION' else 
       if FOrderFieldName = 'DB_VERSION'  then Result := 'DB_VERSION'  else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomApplicationsModel.SetOrderFieldName(Value :string);                    
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
