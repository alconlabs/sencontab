unit CustomModel;

interface

uses Classes, SysUtils, Forms, Controls, Dialogs;
type
  TCustomModel = class
  private
    function GetApplicationNameConst :string;
  protected
    property ApplicationNameConst :string read GetApplicationNameConst;
  public

  end;

implementation

{ TCustomModel }

function TCustomModel.GetApplicationNameConst: string;
begin
   Result := 'ACCOUNTING';
end;

end.
