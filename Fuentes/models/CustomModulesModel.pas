(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomModulesModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,
     ModuleClass, CRSQLConnection;

{ TABLE NAME = MODULES  }
{=== Column Definition ===}
{ APPLICATION   	char      	  15 NULL Allowed  	No    }
{ CD_SECTION    	char      	  15 NULL Allowed  	No    }
{ CD_MODULE     	char      	  50 NULL Allowed  	No    }
{ DS_MODULE     	varchar   	  80 NULL Allowed  	No    }
{ HELP_PAGE_LINK	char      	  80 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomModulesModel = class
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
    function GetSQLForUpdate(Value :TModule):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TModule):Boolean;
    function Save(prmData :TModule):Boolean;
    function Update(prmData :TModule):Boolean;
    function Delete(prmData :TModule):Boolean;
    //function  ExistsChildrenKey(prmData :TModule):Boolean;
    //function  PreviouslyExistsKey(prmData :TModule):Boolean;
    function  Current :TModule;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TModule):Boolean;
    function  GetDefaults:TModule;
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

constructor TCustomModulesModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'MODULES';
   FOrderFieldName  := 'APPLICATION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomModulesModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomModulesModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomModulesModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomModulesModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomModulesModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomModulesModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT APPLICATION, ');
   Result.Add('       CD_SECTION, ');
   Result.Add('       CD_MODULE, ');
   Result.Add('       DS_MODULE, ');
   Result.Add('       HELP_PAGE_LINK ');
   Result.Add('FROM   MODULES');
end;

function TCustomModulesModel.Open:Boolean;
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

function TCustomModulesModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomModulesModel.QueryByExample(prmValue :TModule):Boolean;
var i :TModuleField;
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
        for i := Low(TModuleField) to High(TModuleField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(ModuleFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TModuleField) to High(TModuleField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(ModuleFieldNames[i] + ' = :prm' + ModuleFieldNames[i]);
             FDataSet.ParamByName('prm'+ModuleFieldNames[i]).Value := GetPropValue(prmValue, ModuleFieldNames[i]);
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

function TCustomModulesModel.Save(prmData :TModule):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TModuleField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Modules (');
     for i := Low(TModuleField) to High(TModuleField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(ModuleFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TModuleField) to High(TModuleField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+ModuleFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(ModuleAPPLICATION   ) then
          Q.ParamByName('prmAPPLICATION'     ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ModuleCD_SECTION    ) then
          Q.ParamByName('prmCD_SECTION'      ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(ModuleCD_MODULE     ) then
          Q.ParamByName('prmCD_MODULE'       ).Value := prmData.CD_MODULE;
       if not prmData.IsNull(ModuleDS_MODULE     ) then
          Q.ParamByName('prmDS_MODULE'       ).Value := prmData.DS_MODULE;
       if not prmData.IsNull(ModuleHELP_PAGE_LINK) then
          Q.ParamByName('prmHELP_PAGE_LINK'  ).Value := prmData.HELP_PAGE_LINK;
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

function TCustomModulesModel.Update(prmData :TModule):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TModuleField;                                              

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
       if not prmData.IsNull(ModuleAPPLICATION   ) then
          Q.ParamByName('prmAPPLICATION'     ).Value := prmData.APPLICATION;
       if not prmData.IsNull(ModuleCD_SECTION    ) then
          Q.ParamByName('prmCD_SECTION'      ).Value := prmData.CD_SECTION;
       if not prmData.IsNull(ModuleCD_MODULE     ) then
          Q.ParamByName('prmCD_MODULE'       ).Value := prmData.CD_MODULE;
       if not prmData.IsNull(ModuleDS_MODULE     ) then
          Q.ParamByName('prmDS_MODULE'       ).Value := prmData.DS_MODULE;
       if not prmData.IsNull(ModuleHELP_PAGE_LINK) then
          Q.ParamByName('prmHELP_PAGE_LINK'  ).Value := prmData.HELP_PAGE_LINK;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(ModuleAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ModuleAPPLICATION)).Value := prmData.APPLICATION_OldValue;

       if prmData.IsPrimaryKey(ModuleCD_SECTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ModuleCD_SECTION)).Value := prmData.CD_SECTION_OldValue;

       if prmData.IsPrimaryKey(ModuleCD_MODULE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ModuleCD_MODULE)).Value := prmData.CD_MODULE_OldValue;

       if prmData.IsPrimaryKey(ModuleDS_MODULE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ModuleDS_MODULE)).Value := prmData.DS_MODULE_OldValue;

       if prmData.IsPrimaryKey(ModuleHELP_PAGE_LINK) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(ModuleHELP_PAGE_LINK)).Value := prmData.HELP_PAGE_LINK_OldValue;

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

function TCustomModulesModel.Delete(prmData :TModule):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM MODULES',
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

function TCustomModulesModel.Current :TModule;
var Item :TModule;
    //i   :TUsuarioField;
begin
   Item := TModule.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('APPLICATION'   ).IsNull) then
      Item.APPLICATION    := Trim(FDataSet.FieldByName('APPLICATION').AsString);
   if not(FDataSet.FieldByName('CD_SECTION'    ).IsNull) then
      Item.CD_SECTION     := Trim(FDataSet.FieldByName('CD_SECTION').AsString);
   if not(FDataSet.FieldByName('CD_MODULE'     ).IsNull) then
      Item.CD_MODULE      := Trim(FDataSet.FieldByName('CD_MODULE').AsString);
   if not(FDataSet.FieldByName('DS_MODULE'     ).IsNull) then
      Item.DS_MODULE      := Trim(FDataSet.FieldByName('DS_MODULE').AsString);
   if not(FDataSet.FieldByName('HELP_PAGE_LINK').IsNull) then
      Item.HELP_PAGE_LINK := Trim(FDataSet.FieldByName('HELP_PAGE_LINK').AsString);

   Result := Item;
end;

function TCustomModulesModel.First:Boolean;
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

function TCustomModulesModel.Prior:Boolean;
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

function TCustomModulesModel.Next:Boolean;
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

function TCustomModulesModel.Last:Boolean;
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

function TCustomModulesModel.Locate(prmData :TModule):Boolean;
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

function TCustomModulesModel.GetDefaults:TModule;
begin
   Result := TModule.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomModulesModel.GetSQLForUpdate(Value: TModule):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TModuleField;                                                    
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
   for each := Low(TModuleField) to High(TModuleField) do begin           
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
   for each := Low(TModuleField) to High(TModuleField) do begin           
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

function TCustomModulesModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.00';                                                                
end;                                                                                  

function TCustomModulesModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'APPLICATION'    then Result := 'APPLICATION'    else 
       if FOrderFieldName = 'CD_SECTION'     then Result := 'CD_SECTION'     else 
       if FOrderFieldName = 'CD_MODULE'      then Result := 'CD_MODULE'      else 
       if FOrderFieldName = 'DS_MODULE'      then Result := 'DS_MODULE'      else 
       if FOrderFieldName = 'HELP_PAGE_LINK' then Result := 'HELP_PAGE_LINK' else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomModulesModel.SetOrderFieldName(Value :string);                    
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
