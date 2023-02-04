unit uListaRelatoriosFuncao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmListaRelatorios = class(TForm)
    lblListaDeRelatorios: TLabel;
    cbbListaRelatorios: TComboBox;
    btnUsar: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CriarRelatorio;
    procedure btnUsarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vCodFuncao:Integer;
  end;

var
  frmListaRelatorios: TfrmListaRelatorios;

implementation

uses
  uFormularios, uRelatorioGeral;

{$R *.dfm}

procedure TfrmListaRelatorios.btnUsarClick(Sender: TObject);
begin
  CriarRelatorio;
end;

procedure TfrmListaRelatorios.CriarRelatorio;
begin
  CriarForm(TfrmRelatorioGeral,frmRelatorioGeral,'',False);
  frmRelatorioGeral.CriarRelatorio(GetValorComboInt(cbbListaRelatorios));
  Close;
end;

procedure TfrmListaRelatorios.FormActivate(Sender: TObject);
begin
  CarregarCombos(cbbListaRelatorios,'TB_RELATORIO','NOME_RELATORIO',' AND ID = '  + IntToStr(vCodFuncao));
end;

end.
