(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomUsersModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr,
     UserClass, CRSQLConnection;

{ TABLE NAME = USERS  }
{=== Column Definition ===}
{ CD_USER      	char      	  12 NULL Allowed  	No    }
{ DS_USER      	varchar   	  80 NULL Allowed  	YES   }
{ PASSWORD     	varchar   	  40 NULL Allowed  	No    }
{ ADMINISTRATOR	char      	   1 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomUsersModel = class
  private
    FConnection     :TCRSQLConnection;
    FTableName      :string;
    FOrderFieldName :string;   { The real name for the order instruction }
    FDataSet        :TSQLQuery;
    FLastError      :string;
    { New }
    FSenseOrderBy   :string;
    { New }
    FSQLSearch      :TStringList;
    procedure ClearLastError;
    function GetRowsAffected:Integer;
    function GetRowCount    :Integer;
    function GetEOF :Boolean;

    { New }
    function GetVersion :string;
    { New }
    function GetSQLForUpdate(Value :TUser):TStringList;
    { New }
    function GetOrderFieldName:string;
    { New }
    procedure SetOrderFieldName(Value :string);
  protected { New section too }
    { New }
    function GetBaseSQLForSelect:TStringList;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;                     //overload;
    { New }
    function Refresh:Boolean;
    function QueryByExample(prmValue :TUser):Boolean;
    function Save(prmData :TUser):Boolean;
    function Update(prmData :TUser):Boolean;
    function Delete(prmData :TUser):Boolean;
    //function  ExistsChildrenKey(prmData :TUser):Boolean;
    //function  PreviouslyExistsKey(prmData :TUser):Boolean;
    function  Current :TUser;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TUser):Boolean;
    function  GetDefaults:TUser;
    { Public properties}
    { New }
    property Version        :string            read GetVersion;
    property Connection     :TCRSQLConnection  read FConnection;
    property EOF            :Boolean           read GetEOF;
    property RowsAffected   :Integer           read GetRowsAffected;
    property RowCount       :Integer           read GetRowCount;
    { New }
    property OrderFieldName :string            read GetOrderFieldName write SetOrderFieldName;
    { New }
    property SQLSearch      :TStringList       read FSQLSearch        write FSQLSearch;
  end;

implementation
uses TypInfo;

constructor TCustomUsersModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection;
   FTableName      := 'USERS';
   FOrderFieldName := 'CD_USER';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
   { New }
   FSQLSearch := TStringList.Create;
   { New }
   FSenseOrderBy := 'ASC';
end;

destructor TCustomUsersModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomUsersModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomUsersModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomUsersModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomUsersModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomUsersModel.GetBaseSQLForSelect: TStringList;
begin
   Result := TStringList.Create;
   Result.Add('SELECT CD_USER,      ');
   Result.Add('       DS_USER,      ');
   Result.Add('       PASSWORD,     ');
   Result.Add('       ADMINISTRATOR ');
   Result.Add('FROM   USERS');
end;

{ Updated }
function TCustomUsersModel.Open:Boolean;
var SQL :TStringList;
begin
   SQL := GetBaseSQLForSelect;
   SQL.AddStrings(FSQLSearch);
   SQL.Add('ORDER BY ' + OrderFieldName + ' '+ FSenseOrderBy);

   FDataSet.Close;
   FDataSet.ParamCheck := True;
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

function TCustomUsersModel.Refresh:Boolean;
begin
   FDataSet.Close;
   ClearLastError;
   Result := True;
   Open;
end;

function TCustomUsersModel.QueryByExample(prmValue :TUser):Boolean;
var i :TUserField;
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
        for i := Low(TUserField) to High(TUserField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(UserFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TUserField) to High(TUserField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(UserFieldNames[i] + ' = :prm' + UserFieldNames[i]);
             FDataSet.ParamByName('prm'+UserFieldNames[i]).Value := GetPropValue(prmValue, UserFieldNames[i]);
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

function TCustomUsersModel.Save(prmData :TUser):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TUserField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Users (');
     for i := Low(TUserField) to High(TUserField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(UserFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TUserField) to High(TUserField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+UserFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(UserCD_USER      ) then
          Q.ParamByName('prmCD_USER'        ).Value := prmData.CD_USER;
       if not prmData.IsNull(UserDS_USER      ) then
          Q.ParamByName('prmDS_USER'        ).Value := prmData.DS_USER;
       if not prmData.IsNull(UserPASSWORD     ) then
          Q.ParamByName('prmPASSWORD'       ).Value := prmData.PASSWORD;
       if not prmData.IsNull(UserADMINISTRATOR) then
          Q.ParamByName('prmADMINISTRATOR'  ).Value := prmData.ADMINISTRATOR;
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

{ New }
function TCustomUsersModel.Update(prmData :TUser):Boolean;
var Q     :TSQLQuery;
    SQL   :TStringList;
    each  :TUserField;
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
   //ShowMessage(SQL.Text);
   try
     Q := FConnection.CreateQuery(['']);
     Q.SQL.Assign(SQL);
     try
       if not prmData.IsNull(userCD_USER      ) then
          Q.ParamByName('prmCD_USER'        ).Value := prmData.CD_USER;
       if not prmData.IsNull(UserDS_USER      ) then
          Q.ParamByName('prmDS_USER'        ).Value := prmData.DS_USER;
       if not prmData.IsNull(UserPASSWORD     ) then
          Q.ParamByName('prmPASSWORD'       ).Value := prmData.PASSWORD;
       if not prmData.IsNull(UserADMINISTRATOR) then
          Q.ParamByName('prmADMINISTRATOR'  ).Value := prmData.ADMINISTRATOR;

       //for each := Low(TUserField) to High(TUserField) do begin
       //   if prmData.IsPrimaryKey(each) then begin
       //      Q.ParamByName('prmPK_'+prmData.FieldToString(each)).Value := prmData.el valor;
       //   end;
       //end;

        if prmData.IsPrimaryKey(userCD_USER) then
           Q.ParamByName('prmPK_'+prmData.FieldToString(userCD_USER)).Value := prmData.CD_USER;

        if prmData.IsPrimaryKey(userDS_USER) then
           Q.ParamByName('prmPK_'+prmData.FieldToString(userDS_USER)).Value := prmData.DS_USER;

        if prmData.IsPrimaryKey(userPASSWORD) then
           Q.ParamByName('prmPK_'+prmData.FieldToString(userPASSWORD)).Value := prmData.PASSWORD;

        if prmData.IsPrimaryKey(userADMINISTRATOR) then
           Q.ParamByName('prmPK_'+prmData.FieldToString(userADMINISTRATOR)).Value := prmData.ADMINISTRATOR;
           
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

function TCustomUsersModel.Delete(prmData :TUser):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   Q := FConnection.CreateQuery(['DELETE FROM USERS',
                                 'WHERE CD_USER = :prmCD_USER']);
   try
     Q.ParamCheck := True;
{Message Error 'change the primary key fields reference if necesary'}
     Q.Params[0].Value := prmData.CD_USER;
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

function TCustomUsersModel.Current :TUser;
var Item :TUser;
    //i   :TUsuarioField;
begin
   Item := TUser.Create;
   //for i := Low(TUsuarioField) to High(TUsuarioField) do
   //begin
   //   Item.CD_USUARIO := FDataSet.FieldByName('CD_USUARIO').AsString;
   //end;
   if not(FDataSet.FieldByName('CD_USER'      ).IsNull) then
      Item.CD_USER       := Trim(FDataSet.FieldByName('CD_USER').AsString);
   if not(FDataSet.FieldByName('DS_USER'      ).IsNull) then
      Item.DS_USER       := Trim(FDataSet.FieldByName('DS_USER').AsString);
   if not(FDataSet.FieldByName('PASSWORD'     ).IsNull) then
      Item.PASSWORD      := Trim(FDataSet.FieldByName('PASSWORD').AsString);
   if not(FDataSet.FieldByName('ADMINISTRATOR').IsNull) then
      Item.ADMINISTRATOR := Trim(FDataSet.FieldByName('ADMINISTRATOR').AsString);

   Result := Item;
end;

function TCustomUsersModel.First:Boolean;
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

function TCustomUsersModel.Prior:Boolean;
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

function TCustomUsersModel.Next:Boolean;
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

function TCustomUsersModel.Last:Boolean;
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

function TCustomUsersModel.Locate(prmData :TUser):Boolean;
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

function TCustomUsersModel.GetDefaults:TUser;
begin
   Result := TUser.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

function TCustomUsersModel.GetSQLForUpdate(Value: TUser):TStringList;
var Query :TStringList;
    First :Boolean;
    Comma :string;
    each  :TUserField;
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
   for each := Low(TUserField) to High(TUserField) do begin
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
   for each := Low(TUserField) to High(TUserField) do begin
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

function TCustomUsersModel.GetVersion: string;
begin
   Result := '1.00';
end;

function TCustomUsersModel.GetOrderFieldName: string;
begin
   if FOrderFieldName = 'CD_USER'        then Result := 'CD_USER'       else
   if FOrderFieldName = 'DS_USER'        then Result := 'DS_USER'       else
   if FOrderFieldName = 'PASSWORD'       then Result := 'PASSWORD'      else
   if FOrderFieldName = 'ADMINISTRATOR'  then Result := 'ADMINISTRATOR' else
   Result := '***(CHECK THE NAME FOR THE ORDER FIELD)*** ERROR';
end;

procedure TCustomUsersModel.SetOrderFieldName(Value :string);
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
