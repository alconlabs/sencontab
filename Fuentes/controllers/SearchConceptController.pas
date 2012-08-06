unit SearchConceptController;

interface

uses Classes, CustomController, ComCtrls, Controls, ExtCtrls, Forms, DBGrids,
     CustomSearchController;
type
  TSearchConceptController = class(TCustomSearchController)
  private
    { Property Fields }
    FID_CONCEPTOS   :string;
    FDESCRIPCION    :string;
    procedure InitializeView;          override;
    function  GetSQLOrderField:string; override;
    procedure OnClick_Accept(Sender :TObject); override;
  protected
  public
    { specific properties for the result set }
    property ID_CONCEPTOS   :string read FID_CONCEPTOS  write FID_CONCEPTOS;
    property DESCRIPCION    :string read FDESCRIPCION   write FDESCRIPCION;

  end;

implementation
uses SysUtils, Dialogs, DB, Windows, Messages, 
     CustomView;
     
procedure TSearchConceptController.InitializeView;
begin
   View.Caption := 'Conceptos de Contabilidad';

   View.Width  := 500;
   View.Height := 400;

   BaseQuery.Add('SELECT ID_CONCEPTOS,  '+
                 '       DESCRIPCION    '+
                 'FROM   CONCEPTOS      ');
   WhereQuery.Add('WHERE (RTRIM(LTRIM(           CONCEPTOS.ID_CONCEPTOS                 ))  + ''|''+  ');
   WhereQuery.Add('       RTRIM(LTRIM(ISNULL(    CONCEPTOS.DESCRIPCION            , ''''))))           ');

   AddColumn('ID_CONCEPTOS', 'Concepto'   );
   AddColumn('DESCRIPCION' , 'Descripcion');
end;

procedure TSearchConceptController.OnClick_Accept(Sender: TObject);
begin
   ID_CONCEPTOS := DM.Query.FieldByName('ID_CONCEPTOS').AsString;
   DESCRIPCION  := DM.Query.FieldByName('DESCRIPCION' ).AsString;
   inherited;
end;

function TSearchConceptController.GetSQLOrderField: string;
begin
   if OrderFieldName = 'ID_CONCEPTOS'      then Result := 'CONCEPTOS.ID_CONCEPTOS'    else
	  if OrderFieldName = 'DESCRIPCION'       then Result := 'CONCEPTOS.DESCRIPCION'     else
   raise Exception.Create('Bad definition on field list for the search.');
end;


end.
