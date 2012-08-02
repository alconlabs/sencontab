unit SearchAccountController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls, Forms, DBGrids,
     CustomSearchController;
type
  TSearchAccountController = class(TCustomSearchController)
  private
    { Property Fields }
    FSUBCUENTA      :string;
    FDESCRIPCION    :string;
    procedure InitializeView;          override;
    function  GetSQLOrderField:string; override;
    procedure OnClick_Accept(Sender :TObject); override;
  protected
  public
    { specific properties for the result set }
    property SUBCUENTA      :string read FSUBCUENTA     write FSUBCUENTA;
    property DESCRIPCION    :string read FDESCRIPCION   write FDESCRIPCION;
  end;

implementation
uses SysUtils, Dialogs, DB, Windows, Messages, ccStr, {Traer aquí la rutina StrReplaceCharWithStr}
     CustomView;
     
procedure TSearchAccountController.InitializeView;
begin
   View.Caption := 'Cuentas Contables';

   View.Width  := 500;
   View.Height := 400;

   BaseQuery.Add('SELECT SUBCUENTA,  '+
                 '       DESCRIPCION '+
                 'FROM   SUBCTAS     ');
   WhereQuery.Add('WHERE (RTRIM(LTRIM(           SUBCTAS.SUBCUENTA                     ))  + ''|''+  ');
   WhereQuery.Add('       RTRIM(LTRIM(ISNULL(    SUBCTAS.DESCRIPCION            , ''''))))           ');

   AddColumn('SUBCUENTA'  , 'Cuenta'     );
   AddColumn('DESCRIPCION', 'Descripcion');
   
   {$Message Warn 'IMPLEMENTAR EL MÉTODO ADD COLUMN'}
   {$Message Warn 'IMPLEMENTAR LA ORDENACIÓN ON CLICK'}
end;

procedure TSearchAccountController.OnClick_Accept(Sender: TObject);
begin
   SUBCUENTA   := DM.Query.FieldByName('SUBCUENTA'  ).AsString;
   DESCRIPCION := DM.Query.FieldByName('DESCRIPCION').AsString;
   inherited;
end;

function TSearchAccountController.GetSQLOrderField: string;
begin
   if OrderFieldName = 'SUBCUENTA'         then Result := 'SUBCTAS.SUBCUENTA'       else
	  if OrderFieldName = 'DESCRIPCION'       then Result := 'SUBCTAS.DESCRIPCION'     else
   raise Exception.Create('Bad definition on field list for the search.');
end;


end.
