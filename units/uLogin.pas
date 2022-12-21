unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uFormularios;

var
  vFechaSistema:Boolean;

{$R *.dfm}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  vFechaSistema :=  True;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vFechaSistema then
    Application.Terminate;
  Action    :=  TCloseAction.caFree;
  frmLogin  :=  nil;
end;

end.
