program GerEmpresa;

uses
  Vcl.Forms,
  uPrincipal in '..\units\uPrincipal.pas' {frmPrincipal},
  uLogin in '..\units\uLogin.pas' {frmLogin},
  uFormularios in '..\units\uFormularios.pas',
  uBase in '..\units\Bases\uBase.pas' {frmBase},
  uDados in '..\units\Dados\uDados.pas' {DM: TDataModule},
  uOrdemServ in '..\units\OrdemServ\uOrdemServ.pas' {frmOrdemServ},
  uDadosFuncoes in '..\units\Dados\uDadosFuncoes.pas',
  uLeXmlAtualiza in '..\units\xml\uLeXmlAtualiza.pas' {frmLeXmlAtualiza},
  uListaOrdens in '..\units\OrdemServ\uListaOrdens.pas' {frmListaOrdens},
  uFrameCadTipoOrdem in '..\units\Frames\uFrameCadTipoOrdem.pas' {FrameCadTipoOrdem: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
