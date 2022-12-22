program GerEmpresa;

uses
  Vcl.Forms,
  uPrincipal in '..\units\uPrincipal.pas' {frmPrincipal},
  uLogin in '..\units\uLogin.pas' {frmLogin},
  uFormularios in '..\units\uFormularios.pas',
  uBase in '..\units\Bases\uBase.pas' {frmBase},
  uDados in '..\units\Dados\uDados.pas' {DM: TDataModule},
  uOrdemServ in '..\units\OrdemServ\uOrdemServ.pas' {frmOrdemServ};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmOrdemServ, frmOrdemServ);
  Application.Run;
end.
