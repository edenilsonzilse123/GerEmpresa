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
  uFrameCadTipoOrdem in '..\units\Frames\uFrameCadTipoOrdem.pas' {FrameCadTipoOrdem: TFrame},
  uFramePesquisaOrdem in '..\units\Frames\uFramePesquisaOrdem.pas' {FramePesquisaOrdem: TFrame},
  uMostraHistorico in '..\units\OrdemServ\uMostraHistorico.pas' {frmMostraHistorico},
  uAbrePDF in '..\units\Arquivos\pdf\uAbrePDF.pas' {frmAbrePDF},
  uCadParamentros in '..\units\Parametros\uCadParamentros.pas' {frmCadParamentros},
  uRelatorioGeral in '..\units\Relatorios\uRelatorioGeral.pas' {frmRelatorioGeral},
  uListaRelatoriosFuncao in '..\units\Relatorios\uListaRelatoriosFuncao.pas' {frmListaRelatorios},
  uCadRelatorios in '..\units\Relatorios\Cadastrar\uCadRelatorios.pas' {frmCadRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadRelatorios, frmCadRelatorios);
  Application.Run;
end.
