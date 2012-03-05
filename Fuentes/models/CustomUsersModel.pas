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
    FConnection  :TCRSQLConnection;
    FDataSet   :TSQLQuery;
    FTableName :string;
    FOrderBy   :string;
    FLastError :string;
    function GetRowsAffected:Integer;
    function GetRowCount    :Integer;
    function GetEOF :Boolean;
    procedure ClearLastError;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function QueryByExample(prmValue :TUser):Boolean;
    function Save(prmData :TUser):Boolean;
    function Update(prmData, prmOldDato :TUser):Boolean;
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
    property Connection :TCRSQLConnection  read FConnection;
    property EOF :Boolean read GetEOF;
    property RowsAffected :Integer read GetRowsAffected;
    property RowCount     :Integer read GetRowCount;
  end;

implementation
uses TypInfo;

constructor TCustomUsersModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection; 
   FTableName := 'USERS';
   FOrderBy   := 'CD_USER';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
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

function TCustomUsersModel.Open:Boolean;
begin
   FDataSet.Close;
   FDataSet.ParamCheck := True;
   //FDataSet.LockType := ltReadOnly;
   //FDataSet.CursorLocation := clUseClient;
   FDataSet.SQL.Clear;
   FDataSet.SQL.Add('SELECT CD_USER, ');
   FDataSet.SQL.Add('       DS_USER, ');
   FDataSet.SQL.Add('       PASSWORD, ');
   FDataSet.SQL.Add('       ADMINISTRATOR ');
   FDataSet.SQL.Add('FROM   USERS');
   FDataSet.SQL.Add('ORDER BY CD_USER ');
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
        if Trim(FOrderBy) <> '' then
           FDataSet.SQL.Add('ORDER BY ' + FOrderBy);
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

function TCustomUsersModel.Update(prmData, prmOldDato :TUser):Boolean;
var Q     :TStringList;
    First :Boolean;

    //procedure AQU(UpdateQueryRow :string);
    //begin
    //   if not First then Q.Add(',');
    //   Q.Add(UpdateQueryRow);
    //   First := False;
    //end;
begin
   //Caso 1: Un campo que tenía un valor, ahora tiene un nulo.
   //Caso 2: Un campo que no es nulo pero no ha cambiado.
   //Caso 3: Nos llegan dos datos idénticos. Nada que actualizar.

   //Esta query puede ser local. No tiene por qué utilizarse la global

   ClearLastError;
   //prmData.CompareWith(prmOldDato);

   //First := True;
   //Q := TStringList.Create;
   //Q.Add('UPDATE USUARIOS SET    ');
   //{If PrimaryKey changed }
   //if prmData.CD_USUARIO <> prmOldDato.CD_USUARIO then begin
   //   Q.Add('CD_USUARIO = :prmCD_USUARIO');
   //   First := False;
   //end;
   //if not prmData.IsChanged(usuarioDS_USUARIO) then AQU('DS_USUARI = :prmDS_USUARIO ');
   //Q.Add('WHERE CD_USUARIO = :prmPK_CD_USUARIO ');

   //FDataSet.Close;
   //FDataSet.ParamCheck := True;
   //FDataSet.SQL.Text := Q.Text;
   //try
   //  try
   //    with FDataSet do begin
   //      if prmData.CD_USUARIO <> prmOldDato.CD_USUARIO then begin
   //         ParamByName('prmCD_USUARIO').Value := prmData.CD_USUARIO;
   //      end;
   //      {Primary Key, always shall be assigned }
   //      ParamByName('prmPK_CD_USUARIO').Value := prmOldDato.CD_USUARIO;
   //      if not prmData.IsNull(UserDS_USUARIO)
   //         then ParamByName('prmDS_USUARIO').Value := prmData.DS_USUARIO;
   //    end;
   //    FDataSet.ExecSQL;
   //    except on E:Exception do
   //       raise Exception.CreateFmt('Error %d : %s', [0, E.Message]);
   //    end;
   //finally Q.Free;
   //end;
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

end.
