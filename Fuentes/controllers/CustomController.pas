unit CustomController;

interface

{TODO: Podemos hacer lo del showView, modal o no modal, desde aquí.}
{      El método en este nivel tendrá un mensaje que dirá que no existe la vista. Se sobreescribe en los demás niveles.}

uses Classes, DBController, DBGrids;
type
  TCustomController = class
  private
    FDBController :TDBController;
  protected
  public
    constructor Create(ADBController :TDBController); virtual;
    destructor  Destroy; override;
    procedure AddColumnToDBGrid(prmDBGrid :TDBGrid; prmDBName, prmCaption: string; prmWidth :Integer = 0);
    property DBCtlr :TDBController read FDBController;
  end;

implementation

procedure TCustomController.AddColumnToDBGrid(prmDBGrid :TDBGrid; prmDBName, prmCaption: string; prmWidth: Integer);
var CurrentColumn :TColumn;
begin
   CurrentColumn := nil;

   CurrentColumn := prmDBGrid.Columns.Add;
   CurrentColumn.FieldName := prmDBName;
   if prmWidth <> 0 then begin
      CurrentColumn.Width := prmWidth;
   end;
   CurrentColumn.Title.Caption := prmCaption;
end;

constructor TCustomController.Create(ADBController :TDBController);
begin
   inherited Create;
   FDBController := ADBController;
end;

destructor TCustomController.Destroy;
begin

end;

end.
