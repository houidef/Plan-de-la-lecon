program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  upreview in 'upreview.pas' {MainForm},
  Unit2 in 'Unit2.pas',
  _FormNouveauPlan in '_FormNouveauPlan.pas' {FormNouvelleClasse},
  Unit3 in '..\..\..\..\Public\Pictures\Sample Pictures\Unit3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
