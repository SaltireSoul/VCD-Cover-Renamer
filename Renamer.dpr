program Renamer;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Results in 'Results.pas' {RenameForm},
  About in 'About.pas' {AboutForm},
  Prep in 'Prep.pas' {FormPrep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '.: VCD Cover Renamer :.';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TRenameForm, RenameForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TFormPrep, FormPrep);
  Application.Run;
end.
