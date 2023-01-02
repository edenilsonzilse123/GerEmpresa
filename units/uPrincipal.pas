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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uLogin, uFormularios, uOrdemServ, uLeXmlAtualiza, uListaOrdens;

{$R *.dfm}

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
  Application.ProcessMessages;
  if GetCarregarOrdem then
  begin
    CriarForm(TfrmOrdemServ,frmOrdemServ, 'Ordens de servi�o',False,TFormBorderStyle.bsSingle);
    frmOrdemServ.CarregarOrdem(GetCodigoOs);
    frmOrdemServ.lbledtCodigo.Enabled :=  False;
    frmOrdemServ.ShowModal;
  end;
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

  CriarForm(TfrmLogin, frmLogin, Application.Title + ' | Login');
  CriarForm(TfrmListaOrdens, frmListaOrdens, Application.Title + ' | Lista de ordens');
end;

end.
