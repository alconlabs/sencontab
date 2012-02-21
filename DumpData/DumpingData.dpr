program DumpingData;

uses
  Forms,
  DumpData in 'DumpData.pas' {FormDumpData};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDumpData, FormDumpData);
  Application.Run;
end.
