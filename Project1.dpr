program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fmMark};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMark, fmMark);
  Application.Run;
end.
