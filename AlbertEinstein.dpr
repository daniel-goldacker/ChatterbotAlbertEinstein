program AlbertEinstein;

uses
  Forms,
  UChat in 'UChat.pas' {frmJohnHammond},
  UBotLoader in 'UBotLoader.pas',
  UUtils in 'UUtils.pas',
  UPatternMatcher in 'UPatternMatcher.pas',
  UAIMLLoader in 'UAIMLLoader.pas',
  UElementFactory in 'UElementFactory.pas',
  UElements in 'UElements.pas',
  ULogging in 'ULogging.pas',
  UTemplateProcessor in 'UTemplateProcessor.pas',
  UVariables in 'UVariables.pas',
  USobre in 'USobre.pas' {frmSobre};

{$R *.RES}
begin


  Application.Initialize;

  Log:=TLog.Create;
  PatternMatcher:=TPatternMatcher.Create;
  TemplateProcessor:=TTemplateProcessor.Create;
  Memory:=Tmemory.create;
  AIMLLoader:=TAIMLLoader.create;
  BotLoader:=TBotLoader.Create;
  Preprocessor:=TSimpleSubstituter.create;
  //ElementFactory:=TElementFactory.Create; {auto create when loading units}
 // TBotloaderThread.Create(false);

  Application.Title := 'Albert Einstein - Versão 1.0';
  Application.CreateForm(TfrmJohnHammond, frmJohnHammond);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;


  PatternMatcher.Free;
  TemplateProcessor.Free;
  Memory.Free;
  AIMLLoader.Free;
  BotLoader.Free;
  ElementFactory.Free;
  log.Free;
  preprocessor.Free;

end.
