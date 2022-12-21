unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmPrincipal = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uLogin, uFormularios;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  CriarForm(TfrmLogin, frmLogin, Application.Title + ' | Login');
end;

end.
