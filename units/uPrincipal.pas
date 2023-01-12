unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlBotoesPrin: TPanel;
    btnOrdemServ: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CarregarParametros(pParamCod:Integer);
    procedure FormActivate(Sender: TObject);
    procedure btnOrdemServClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uLogin, uFormularios, uOrdemServ, uLeXmlAtualiza, uListaOrdens, uDados, uDadosFuncoes;

{$R *.dfm}

{
  Aten��o
    O Usu�rio windows n�o funcionar� para fazer login no sistema,
    Serve apenas para que tenha sempre um usu�rio vinculado nos logs.
  Senha usu�rio Windows: WINDOWSUSER;
}

procedure TfrmPrincipal.btnOrdemServClick(Sender: TObject);
begin
  CriarForm(TfrmOrdemServ,frmOrdemServ, 'Ordens de servi�o',True,TFormBorderStyle.bsSingle);
end;

procedure TfrmPrincipal.CarregarParametros(pParamCod: Integer);
begin
  //
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  CarregarParametros(GetParametros);
  Caption             :=  Application.Title;
  pnlBotoesPrin.Align :=  alTop;
  Application.ProcessMessages;
  if (SqlTemRegistro('TB_ORDEMSERV',
                     '*',
                     ' AND ENC_OS_USUARIO = '  + GetIdUsuarioStr)) then
    CriarForm(TfrmListaOrdens, frmListaOrdens,'Lista de ordens');
  if GetCarregarOrdem then
  begin
    CriarForm(TfrmOrdemServ,frmOrdemServ, 'Ordens de servi�o',False,TFormBorderStyle.bsSingle);
    frmOrdemServ.CarregarOrdem(GetCodigoOs);
    frmOrdemServ.lbledtCodigo.Enabled :=  False;
    frmOrdemServ.ShowModal;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (MensagemPergunta(3,'Deseja mesmo sair do sistema?')) then
  begin
    if CallTerminateProcs then
      PostQuitMessage(0);
  end
  else
    Action  :=  TCloseAction.caNone;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if (FileExists(ExtractFilePath(Application.ExeName)+'atualiza.xml')) then
    CriarForm(TfrmLeXmlAtualiza,
              frmLeXmlAtualiza,
              'Lendo xml de atualiza��o',
              True,
              TFormBorderStyle.bsSingle,
              True,
              poDesktopCenter,
              []);

  CriarForm(TfrmLogin, frmLogin,'Login');
end;

end.
