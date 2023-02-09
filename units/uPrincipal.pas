unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    pnlBotoesPrin: TPanel;
    btnOrdemServ: TBitBtn;
    actlstPrin: TActionList;
    ilPrin: TImageList;
    actCadOrders: TAction;
    btnCadParameters: TBitBtn;
    actCadParameters: TAction;
    pmPrin: TPopupMenu;
    Ordensdeservio1: TMenuItem;
    Parmetros1: TMenuItem;
    actCadReports: TAction;
    Relatrios1: TMenuItem;
    btnReports: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetarParametrosTela;
    procedure actCadOrdersExecute(Sender: TObject);
    procedure actCadParametersExecute(Sender: TObject);
    procedure AddHints;
    procedure actCadReportsExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uLogin, uFormularios, uOrdemServ, uLeXmlAtualiza, uListaOrdens, uDados, uDadosFuncoes, uCadParamentros, uCadRelatorios;

{$R *.dfm}

{
  Aten��o
    O Usu�rio windows n�o funcionar� para fazer login no sistema,
    Serve apenas para que tenha sempre um usu�rio vinculado nos logs.
  Senha usu�rio Windows: WINDOWSUSER;
}

procedure TfrmPrincipal.actCadOrdersExecute(Sender: TObject);
begin
  CriarForm(TfrmOrdemServ,frmOrdemServ, 'Ordens de servi�o',True,TFormBorderStyle.bsSingle);
end;

procedure TfrmPrincipal.actCadParametersExecute(Sender: TObject);
begin
  CriarForm(TfrmCadParamentros,frmCadParamentros, 'Par�metros',True,TFormBorderStyle.bsSingle);
end;

procedure TfrmPrincipal.actCadReportsExecute(Sender: TObject);
begin
  CriarForm(TfrmCadRelatorios,frmCadRelatorios,'Cadastro de relat�rios',True,bsSingle)
end;

procedure TfrmPrincipal.AddHints;
var
  x: Integer;
begin
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[x] is TButton) then
      TButton(Self.Components[x]).Hint  :=  TButton(Self.Components[x]).Action.Name;
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  CarregarParametros(GetParametros);
  SetarParametrosTela;
  AddHints;
  Caption             :=  Application.Title;
  pnlBotoesPrin.Align :=  alTop;
  Application.ProcessMessages;
  if (GetParametro(9) = 'S') then
  begin
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

procedure TfrmPrincipal.SetarParametrosTela;
begin
  actCadOrders.Enabled  :=  (GetParametro(12) = 'S');
end;

end.                     -
