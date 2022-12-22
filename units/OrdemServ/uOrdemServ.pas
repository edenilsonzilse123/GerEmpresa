unit uOrdemServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmOrdemServ = class(TfrmBase)
    lbledtCodigo: TLabeledEdit;
    lbledtTitulo: TLabeledEdit;
    lblDescricao: TLabel;
    mmoDescricao: TMemo;
    lblEncPara: TLabel;
    cbbEncPara: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSalvarExecute(Sender: TObject);
    procedure CarregarUsuarios;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServ: TfrmOrdemServ;

implementation

uses
  uFormularios;

{$R *.dfm}

procedure TfrmOrdemServ.actSalvarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Salvar');
end;

procedure TfrmOrdemServ.CarregarUsuarios;
begin
  CarregarCombos(cbbEncPara,'TB_USUARIOS','USUARIO',1);
end;

procedure TfrmOrdemServ.FormActivate(Sender: TObject);
begin
  inherited;
  CarregarUsuarios;
end;

procedure TfrmOrdemServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmOrdemServ  :=  nil;
end;

end.