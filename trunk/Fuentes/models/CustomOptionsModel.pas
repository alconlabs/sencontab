(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomOptionsModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr, CustomModel,
     OptionClass, CRSQLConnection;

{ TABLE NAME = OPTIONS  }
{=== Column Definition ===}
{ CD_OPTION          	char      	 100 NULL Allowed  	No    }
{ CD_PARENT_OPTION   	char      	 100 NULL Allowed  	YES   }
{ DS_OPTION          	char      	 100 NULL Allowed  	YES   }
{ NAME_IN_FONT_SOURCE	char      	 100 NULL Allowed  	YES   }
{ HELP_PAGE_LINK     	char      	 100 NULL Allowed  	No    }
{ APPLICATION        	char      	  15 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomOptionsModel = class(TCustomModel)
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
    function GetSQLForUpdate(Value :TOption):TStringList;
    function GetOrderFieldName:string;
    procedure SetOrderFieldName(Value :string);
  protected
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function Refresh:Boolean;
    function QueryByExample(prmValue :TOption):Boolean;
    function Save(prmData :TOption):Boolean;
    function Update(prmData :TOption):Boolean;
    function Delete(prmData :TOption):Boolean;
    //function  ExistsChildrenKey(prmData :TOption):Boolean;
    //function  PreviouslyExistsKey(prmData :TOption):Boolean;
    function  Current :TOption;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TOption):Boolean;
    function  GetDefaults:TOption;
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

constructor TCustomOptionsModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'OPTIONS';
   FOrderFieldName  := 'CD_OPTION';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   FSQLSearch := TStringList.Create; 
   FSenseOrderBy := 'ASC';         
end;

destructor TCustomOptionsModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomOptionsModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomOptionsModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomOptionsModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomOptionsModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomOptionsModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT CD_OPTION, ');
   Result.Add('       CD_PARENT_OPTION, ');
   Result.Add('       DS_OPTION, ');
   Result.Add('       NAME_IN_FONT_SOURCE, ');
   Result.Add('       HELP_PAGE_LINK, ');
   Result.Add('       APPLICATION ');
   Result.Add('FROM   OPTIONS');
end;

function TCustomOptionsModel.Open:Boolean;
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

function TCustomOptionsModel.Refresh:Boolean;
begin                                           
   FDataSet.Close;                              
   ClearLastError;                              
   Result := True;                              
   Open;                                        
end;                                            

function TCustomOptionsModel.QueryByExample(prmValue :TOption):Boolean;
var i :TOptionField;
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
        for i := Low(TOptionField) to High(TOptionField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(OptionFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TOptionField) to High(TOptionField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(OptionFieldNames[i] + ' = :prm' + OptionFieldNames[i]);
             FDataSet.ParamByName('prm'+OptionFieldNames[i]).Value := GetPropValue(prmValue, OptionFieldNames[i]);
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

function TCustomOptionsModel.Save(prmData :TOption):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TOptionField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Options (');
     for i := Low(TOptionField) to High(TOptionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(OptionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TOptionField) to High(TOptionField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+OptionFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(OptionCD_OPTION          ) then
          Q.ParamByName('prmCD_OPTION'            ).Value := prmData.CD_OPTION;
       if not prmData.IsNull(OptionCD_PARENT_OPTION   ) then
          Q.ParamByName('prmCD_PARENT_OPTION'     ).Value := prmData.CD_PARENT_OPTION;
       if not prmData.IsNull(OptionDS_OPTION          ) then
          Q.ParamByName('prmDS_OPTION'            ).Value := prmData.DS_OPTION;
       if not prmData.IsNull(OptionNAME_IN_FONT_SOURCE) then
          Q.ParamByName('prmNAME_IN_FONT_SOURCE'  ).Value := prmData.NAME_IN_FONT_SOURCE;
       if not prmData.IsNull(OptionHELP_PAGE_LINK     ) then
          Q.ParamByName('prmHELP_PAGE_LINK'       ).Value := prmData.HELP_PAGE_LINK;
       if not prmData.IsNull(OptionAPPLICATION        ) then
          Q.ParamByName('prmAPPLICATION'          ).Value := prmData.APPLICATION;
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

function TCustomOptionsModel.Update(prmData :TOption):Boolean;
var Q     :TSQLQuery;                                                       
    SQL   :TStringList;                                                     
    each  :TOptionField;                                              

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
       if not prmData.IsNull(OptionCD_OPTION          ) then
          Q.ParamByName('prmCD_OPTION'            ).Value := prmData.CD_OPTION;
       if not prmData.IsNull(OptionCD_PARENT_OPTION   ) then
          Q.ParamByName('prmCD_PARENT_OPTION'     ).Value := prmData.CD_PARENT_OPTION;
       if not prmData.IsNull(OptionDS_OPTION          ) then
          Q.ParamByName('prmDS_OPTION'            ).Value := prmData.DS_OPTION;
       if not prmData.IsNull(OptionNAME_IN_FONT_SOURCE) then
          Q.ParamByName('prmNAME_IN_FONT_SOURCE'  ).Value := prmData.NAME_IN_FONT_SOURCE;
       if not prmData.IsNull(OptionHELP_PAGE_LINK     ) then
          Q.ParamByName('prmHELP_PAGE_LINK'       ).Value := prmData.HELP_PAGE_LINK;
       if not prmData.IsNull(OptionAPPLICATION        ) then
          Q.ParamByName('prmAPPLICATION'          ).Value := prmData.APPLICATION;
                                                                                               
       //for each := Low(TUserField) to High(TUserField) do begin                              
       //   if prmData.IsPrimaryKey(each) then begin                                           
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;                                                                               
       //end;                                                                                  

       if prmData.IsPrimaryKey(OptionCD_OPTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionCD_OPTION)).Value := prmData.CD_OPTION_OldValue;

       if prmData.IsPrimaryKey(OptionCD_PARENT_OPTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionCD_PARENT_OPTION)).Value := prmData.CD_PARENT_OPTION_OldValue;

       if prmData.IsPrimaryKey(OptionDS_OPTION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionDS_OPTION)).Value := prmData.DS_OPTION_OldValue;

       if prmData.IsPrimaryKey(OptionNAME_IN_FONT_SOURCE) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionNAME_IN_FONT_SOURCE)).Value := prmData.NAME_IN_FONT_SOURCE_OldValue;

       if prmData.IsPrimaryKey(OptionHELP_PAGE_LINK) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionHELP_PAGE_LINK)).Value := prmData.HELP_PAGE_LINK_OldValue;

       if prmData.IsPrimaryKey(OptionAPPLICATION) then
          Q.ParamByName('prmPK_'+prmData.FieldToString(OptionAPPLICATION)).Value := prmData.APPLICATION_OldValue;

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

function TCustomOptionsModel.Delete(prmData :TOption):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM OPTIONS',
                                 'WHERE CD_OPTION = :prmCD_OPTION']);
   try
     Q.ParamCheck := True;
{Message Error 'change the primary key fields reference if necesary'}
     Q.Params[0].Value := prmData.CD_OPTION;
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

function TCustomOptionsModel.Current :TOption;
var Item :TOption;
    //i   :TUsuarioField;
begin
   Item := TOption.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('CD_OPTION'          ).IsNull) then
      Item.CD_OPTION           := Trim(FDataSet.FieldByName('CD_OPTION').AsString);
   if not(FDataSet.FieldByName('CD_PARENT_OPTION'   ).IsNull) then
      Item.CD_PARENT_OPTION    := Trim(FDataSet.FieldByName('CD_PARENT_OPTION').AsString);
   if not(FDataSet.FieldByName('DS_OPTION'          ).IsNull) then
      Item.DS_OPTION           := Trim(FDataSet.FieldByName('DS_OPTION').AsString);
   if not(FDataSet.FieldByName('NAME_IN_FONT_SOURCE').IsNull) then
      Item.NAME_IN_FONT_SOURCE := Trim(FDataSet.FieldByName('NAME_IN_FONT_SOURCE').AsString);
   if not(FDataSet.FieldByName('HELP_PAGE_LINK'     ).IsNull) then
      Item.HELP_PAGE_LINK      := Trim(FDataSet.FieldByName('HELP_PAGE_LINK').AsString);
   if not(FDataSet.FieldByName('APPLICATION'        ).IsNull) then
      Item.APPLICATION         := Trim(FDataSet.FieldByName('APPLICATION').AsString);

   Result := Item;
end;

function TCustomOptionsModel.First:Boolean;
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

function TCustomOptionsModel.Prior:Boolean;
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

function TCustomOptionsModel.Next:Boolean;
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

function TCustomOptionsModel.Last:Boolean;
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

function TCustomOptionsModel.Locate(prmData :TOption):Boolean;
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

function TCustomOptionsModel.GetDefaults:TOption;
begin
   Result := TOption.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomOptionsModel.GetSQLForUpdate(Value: TOption):TStringList;
var Query :TStringList;                                                           
    First :Boolean;                                                               
    Comma :string;                                                                
    each  :TOptionField;                                                    
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
   for each := Low(TOptionField) to High(TOptionField) do begin           
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
   for each := Low(TOptionField) to High(TOptionField) do begin           
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

function TCustomOptionsModel.GetVersion: string;                                   
begin                                                                                 
   Result := '1.00';                                                                
end;                                                                                  

function TCustomOptionsModel.GetOrderFieldName: string;                            
begin                                                                                 
       if FOrderFieldName = 'CD_OPTION'           then Result := 'CD_OPTION'           else 
       if FOrderFieldName = 'CD_PARENT_OPTION'    then Result := 'CD_PARENT_OPTION'    else 
       if FOrderFieldName = 'DS_OPTION'           then Result := 'DS_OPTION'           else 
       if FOrderFieldName = 'NAME_IN_FONT_SOURCE' then Result := 'NAME_IN_FONT_SOURCE' else 
       if FOrderFieldName = 'HELP_PAGE_LINK'      then Result := 'HELP_PAGE_LINK'      else 
       if FOrderFieldName = 'APPLICATION'         then Result := 'APPLICATION'         else 
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';                    
end;                                                                                  

procedure TCustomOptionsModel.SetOrderFieldName(Value :string);                    
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
