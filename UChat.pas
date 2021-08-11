{The user interface}
unit UChat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls,
  UBotloader,UUtils, OleCtrls, SHDocVw, Menus;

type
  TfrmJohnHammond = class(TForm)
    Panel1: TPanel;
    pnImagem: TPanel;
    WebBrowser: TWebBrowser;
    painel: TPanel;
    Panel2: TPanel;
    btEnviar: TButton;
    mmPergunta: TMemo;
    Panel3: TPanel;
    mmDados: TMemo;
    MainMenu: TMainMenu;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Panel4: TPanel;
    QtdPerguntas: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    _LoaderThread:TBotLoaderThread;
    _SentenceSplitter:TStringTokenizer;
    Procedure Add(s:string);
    { Private declarations }
  public
    Procedure AddUserInput(s:string);
    Procedure AddBotReply(s:string);
    Procedure AddLogMessage(s:string);
    { Public declarations }
  end;

var
  frmJohnHammond: TfrmJohnHammond;

implementation
Uses
  UPatternMatcher,UTemplateProcessor,UVariables,ULogging,LibXMLParser,
  USobre;

Procedure TfrmJohnHammond.Add(s:string);
begin
  mmDados.Lines.Add(s);
  mmDados.SelStart:=Length(mmDados.Text);
  SendMessage(mmDados.Handle,EM_SCROLLCARET,0,0);
end;

Procedure TfrmJohnHammond.AddUserInput(s:string);
var
  name:string;

begin

   Add('Você: ' + s);
   name := Memory.getVar('name');
   if name='' then
     name:='user';
     Log.chatlog(name,s);
   end;

  Procedure TfrmJohnHammond.AddBotReply(s:string);
  begin
    if (s = '') then exit;
    Add(s);
    Log.Chatlog(Memory.GetProp('name'), s);
  end;

  Procedure TfrmJohnHammond.AddLogMessage(s:string);
  begin
    Add(s);
  end;
{$R *.DFM}

procedure TfrmJohnHammond.btEnviarClick(Sender: TObject);
var
  reply:string;
  Match:TMatch;
  input:String;
  i:integer;
begin

  input := mmPergunta.Text;

  AddUserInput(input);
  Memory.setVar('input',input);
  input:=Trim(ConvertWS(Preprocessor.process(' '+input+' '),true));

  _SentenceSplitter.SetDelimiter(SentenceSplitterChars);
  _SentenceSplitter.Tokenize(input);

  for i:=0 to _SentenceSplitter._count-1 do begin
    input:=Trim(_SentenceSplitter._tokens[i]);
    Match:=PatternMatcher.MatchInput(input);
    reply:=TemplateProcessor.Process(match);
    match.free;
  end;

  if (input = '') then reply := 'Você deve me perguntar algo para que eu possa responder!!!';
  AddBotReply('Albert Einstein: ' + reply);
  Add('');
  reply:=PreProcessor.process(reply);
  _SentenceSplitter.SetDelimiter(SentenceSplitterChars);
  _SentenceSplitter.Tokenize(reply);

  Memory.setVar('that',_SentenceSplitter.GetLast);
  mmPergunta.Clear;
end;

procedure TfrmJohnHammond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmJohnHammond.FormCreate(Sender: TObject);
begin
  Log.Log('Iniciando Albert Einstein.');
  Log.Flush;
  _LoaderThread := TBotLoaderThread.Create(true);
  _LoaderThread.Resume;
  _SentenceSplitter := TStringTokenizer.Create(SentenceSplitterChars);
end;

procedure TfrmJohnHammond.Sair1Click(Sender: TObject);
begin
  frmJohnHammond.Close;
end;

procedure TfrmJohnHammond.Sobre1Click(Sender: TObject);
begin
  frmSobre.Show;
end;

procedure TfrmJohnHammond.FormActivate(Sender: TObject);
begin
  WebBrowser.Navigate(ExtractFilePath(Application.ExeName) + 'demaisArquivos\AlbertEinstein.html');
  mmPergunta.SetFocus;
end;

end.
