(***********************************************************)
(* Unit generated automaticaly. Modify width care, please. *)
(* (c) 2009 by Juan C.Cilleruelo                           *)
(* The result unit is GPL code                             *)
(* contact with me at juanc.cilleruelo@gmail.com           *)
(***********************************************************)
unit CustomEnterprisesModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, db, SQLExpr, CustomModel,
     EnterpriseClass, CRSQLConnection;

{ TABLE NAME = ENTERPRISES  }
{=== Column Definition ===}
{ CD_ENTERPRISE	char      	  12 NULL Allowed  	No    }
{ DS_ENTERPRISE	varchar   	  80 NULL Allowed  	No    }
{ CLOSED       	char      	   1 NULL Allowed  	No    }
{ BLOCKED      	char      	   1 NULL Allowed  	No    }
{=== ================= ===}

type
  TCustomEnterprisesModel = class(TCustomModel)
  private
    FConnection :TCRSQLConnection;
    FTableName  :string;
    FOrderBy    :string;
    function GetRowsAffected:Integer;
    function GetRowCount    :Integer;
    function GetEOF :Boolean;
  protected
    FLastError  :string;
    FDataSet :TSQLQuery;
    procedure ClearLastError;
  public
    constructor Create(prmConnection :TCRSQLConnection); reintroduce;
    destructor  Destroy; override;
    function  Open :Boolean;
    function  QueryByExample(prmValue :TEnterprise):Boolean;
    function  Save(prmData :TEnterprise):Boolean;
    function  Update(prmData, prmOldDato :TEnterprise):Boolean;
    function  Delete(prmData :TEnterprise):Boolean;
    //function  ExistsChildrenKey(prmData :TEnterprise):Boolean;
    //function  PreviouslyExistsKey(prmData :TEnterprise):Boolean;
    function  Current :TEnterprise;       overload;
    procedure Current(Item :TEnterprise); overload;
    function  First:Boolean;
    function  Prior:Boolean;
    function  Next:Boolean;
    function  Last:Boolean;
    function  Locate(prmData :TEnterprise):Boolean;
    function  GetDefaults:TEnterprise;
    { Public properties}
    property Connection   :TCRSQLConnection  read FConnection;
    property EOF          :Boolean read GetEOF;
    property RowsAffected :Integer read GetRowsAffected;
    property RowCount     :Integer read GetRowCount;
  end;

implementation
uses TypInfo;

constructor TCustomEnterprisesModel.Create(prmConnection :TCRSQLConnection);
begin
   inherited Create;
   FConnection := prmConnection;
   FTableName := 'ENTERPRISES';
   FOrderBy   := 'CD_ENTERPRISE';
   FDataSet := TSQLQuery.Create(nil);
   FDataSet.SQLConnection := prmConnection;
end;

destructor TCustomEnterprisesModel.Destroy;
begin
   FDataSet.Free;
   FDataSet := nil;
   inherited;
end;

procedure TCustomEnterprisesModel.ClearLastError;
begin
   FLastError := '';
end;

function TCustomEnterprisesModel.GetRowsAffected:Integer;
begin
   {$Message Warn 'No funciona el RowsAffected con dbExpress'}
   Result := FDataSet.RowsAffected;
end;

function TCustomEnterprisesModel.GetRowCount:Integer;
begin
   {$Message Warn 'No funciona RecordCount con dbExpress'}
   Result := FDataSet.RecordCount;
end;

function TCustomEnterprisesModel.GetEOF:Boolean;
begin
   if FDataSet = nil  then
      Result := True
   else
   if not FDataSet.Active then
      Result := True
   else Result := FDataSet.EOF;
end;

function TCustomEnterprisesModel.Open:Boolean;
begin
   FDataSet.Close;
   //FDataSet.ParamCheck := True;
   //FDataSet.LockType := ltReadOnly;
   //FDataSet.CursorLocation := clUseClient;
   FDataSet.SQL.Clear;
   FDataSet.SQL.Add('SELECT CD_ENTERPRISE, ');
   FDataSet.SQL.Add('       DS_ENTERPRISE, ');
   FDataSet.SQL.Add('       CLOSED, ');
   FDataSet.SQL.Add('       BLOCKED ');
   FDataSet.SQL.Add('FROM   ENTERPRISES');
   FDataSet.SQL.Add('ORDER BY CD_ENTERPRISE ');
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

function TCustomEnterprisesModel.QueryByExample(prmValue :TEnterprise):Boolean;
var i :TEnterpriseField;
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
        for i := Low(TEnterpriseField) to High(TEnterpriseField) do
        begin
           if not IsFirst then
              FDataSet.SQL[FDataSet.SQL.Count - 1] := FDataSet.SQL[FDataSet.SQL.Count - 1]+', ' 
           else IsFirst := False;
           FDataSet.SQL.Add(UpperCase(EnterpriseFieldNames[i]));
        end;

        FDataSet.SQL.Add(' FROM ' + FTableName + ' ');

        IsFirst := True;
        for i := Low(TEnterpriseField) to High(TEnterpriseField) do
        begin
           if not prmValue.IsNull(i) then
           begin
             FDataSet.SQL.Add(EnterpriseFieldNames[i] + ' = :prm' + EnterpriseFieldNames[i]);
             FDataSet.ParamByName('prm'+EnterpriseFieldNames[i]).Value := GetPropValue(prmValue, EnterpriseFieldNames[i]);
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

function TCustomEnterprisesModel.Save(prmData :TEnterprise):Boolean;
var SQL     :TStringList;
    Q       :TSQLQuery;
    i       :TEnterpriseField;
begin
   ClearLastError;
   SQL := TStringList.Create;
   try
     SQL.Add('INSERT INTO Enterprises (');
     for i := Low(TEnterpriseField) to High(TEnterpriseField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(EnterpriseFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := System.Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';
     SQL.Add('VALUES (');
     for i := Low(TEnterpriseField) to High(TEnterpriseField) do
     begin
        if not prmData.IsNull(i) then
        begin
          SQL.Add(':prm'+EnterpriseFieldNames[i]+',');
        end;
     end;
     SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1, Length(SQL[SQL.Count - 1])-1)+')';

     //Q := FConnection.CreateQuery('
     //Q := FDataSet.Connection;
     Q.SQL.Assign(SQL);
     Q.ParamCheck := True;
     //Q.Refresh;
     //Q.Parameters.ParseSQL(Q.SQL.Text, True);
     //ShowMessage(Q.SQL.Text);
     try
       //if not prmData.IsNull(EnterpriseCD_E) then
       //   QParameters.ParamByName('prmCD_ENTERPRISE).Value := prmData.CD_ENTERPRISE;
       //if not prmData.IsNull(EnterpriseDS_E) then
       //   QParameters.ParamByName('prmDS_ENTERPRISE).Value := prmData.DS_ENTERPRISE;
       //if not prmData.IsNull(EnterpriseCLOS) then
       //   QParameters.ParamByName('prmCLOSED'      ).Value := prmData.CLOSED;
       //if not prmData.IsNull(EnterpriseBLOC) then
       //   QParameters.ParamByName('prmBLOCKED'     ).Value := prmData.BLOCKED;
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

function TCustomEnterprisesModel.Update(prmData, prmOldDato :TEnterprise):Boolean;
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
   //      if not prmData.IsNull(EnterpriseDS_USUARIO)
   //         then ParamByName('prmDS_USUARIO').Value := prmData.DS_USUARIO;
   //    end;
   //    FDataSet.ExecSQL;
   //    except on E:Exception do
   //       raise Exception.CreateFmt('Error %d : %s', [0, E.Message]);
   //    end;
   //finally Q.Free;
   //end;
end;

function TCustomEnterprisesModel.Delete(prmData :TEnterprise):Boolean;
var Q :TSQLQuery;
begin
   ClearLastError;
   Result := True;
   //Q := TADOQuery.Create(nil);
   try
     //Q.Connection := FDataSet.Connection;
     //Q.SQL.Add('DELETE FROM ENTERPRISES');
     //Q.SQL.Add('WHERE CD_ENTERPRISE = :prmCD_ENTERPRISE);
     //Q.ParamCheck := True;
{Message Error 'change the primary key fields reference if necesary'}
     //Q.Parameters.Refresh;
     //Q.Parameters[0].Value := prmData.CD_ENTERPRISE;
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

function TCustomEnterprisesModel.Current :TEnterprise;
var Item :TEnterprise;
begin
   Item := TEnterprise.Create;
   if not(FDataSet.FieldByName('CD_ENTERPRISE').IsNull) then
      Item.CD_ENTERPRISE := Trim(FDataSet.FieldByName('CD_ENTERPRISE').AsString);
   if not(FDataSet.FieldByName('DS_ENTERPRISE').IsNull) then
      Item.DS_ENTERPRISE := Trim(FDataSet.FieldByName('DS_ENTERPRISE').AsString);
   if not(FDataSet.FieldByName('CLOSED'       ).IsNull) then
      Item.CLOSED        := Trim(FDataSet.FieldByName('CLOSED').AsString);
   if not(FDataSet.FieldByName('BLOCKED'      ).IsNull) then
      Item.BLOCKED       := Trim(FDataSet.FieldByName('BLOCKED').AsString);

   Result := Item;
end;

procedure TCustomEnterprisesModel.Current(Item :TEnterprise); 
begin
   if not(FDataSet.FieldByName('CD_ENTERPRISE').IsNull) then
      Item.CD_ENTERPRISE := Trim(FDataSet.FieldByName('CD_ENTERPRISE').AsString);
   if not(FDataSet.FieldByName('DS_ENTERPRISE').IsNull) then
      Item.DS_ENTERPRISE := Trim(FDataSet.FieldByName('DS_ENTERPRISE').AsString);
   if not(FDataSet.FieldByName('CLOSED'       ).IsNull) then
      Item.CLOSED        := Trim(FDataSet.FieldByName('CLOSED').AsString);
   if not(FDataSet.FieldByName('BLOCKED'      ).IsNull) then
      Item.BLOCKED       := Trim(FDataSet.FieldByName('BLOCKED').AsString);
end;

function TCustomEnterprisesModel.First:Boolean;
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

function TCustomEnterprisesModel.Prior:Boolean;
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

function TCustomEnterprisesModel.Next:Boolean;
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

function TCustomEnterprisesModel.Last:Boolean;
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

function TCustomEnterprisesModel.Locate(prmData :TEnterprise):Boolean;
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

function TCustomEnterprisesModel.GetDefaults:TEnterprise;
begin
   Result := TEnterprise.Create;
   //Result.CD_USUARIO := ';
   //Result.DS_USUARIO := ';
end;

end.
