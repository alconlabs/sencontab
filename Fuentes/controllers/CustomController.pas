unit CustomController;

interface

{TODO: Podemos hacer lo del showView, modal o no modal, desde aquí.}
{      El método en este nivel tendrá un mensaje que dirá que no existe la vista. Se sobreescribe en los demás niveles.}

uses Classes, DBController;
type
  TCustomController = class
  private
    FDBController :TDBController;
  protected
  public
    constructor Create(ADBController :TDBController); virtual; 
    destructor  Destroy; override;
    property DBCtlr :TDBController read FDBController;
  end;

implementation

constructor TCustomController.Create(ADBController :TDBController);
begin
   inherited Create;
   FDBController := ADBController;
end;

destructor TCustomController.Destroy;
begin

end;

end.
