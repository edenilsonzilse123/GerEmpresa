unit uCadRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uFrameCadRelatorioRelatorio, System.StrUtils;

type
  TfrmCadRelatorios = class(TfrmBase)
    pnlCadRelat: TPanel;
    lbledtNomeRelat: TLabeledEdit;
    cbbFuncaoSistema: TComboBox;
    lblFuncao: TLabel;
    pnlCamposRelat: TPanel;
    lblTipoCampo: TLabel;
    cbbTipoCampo: TComboBox;
    pnlRepOpt: TPanel;
    CadRelatorioRelatorio: TfrmCadRelatorioRelatorio;
    procedure CarregaCombos;
    procedure FormActivate(Sender: TObject);
    procedure cbbTipoCampoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRelatorios: TfrmCadRelatorios;

implementation

uses
  uFormularios, uDados;

{$R *.dfm}

procedure TfrmCadRelatorios.CarregaCombos;
begin
  CarregarCombos(cbbFuncaoSistema,'TB_FUNCOESSISTEMA','NOME_FUNCAO');
  CarregarCombos(cbbTipoCampo,'TB_TIPOCAMPORELAT','NOME_CAMPO');
  CadRelatorioRelatorio.CarregarTodosCombos;
end;

procedure TfrmCadRelatorios.cbbTipoCampoChange(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[x] is TFrame then
    begin
      TFrame(Self.Components[x]).Visible  :=  False;
      TFrame(Self.Components[x]).Parent   :=  nil;
    end;
  end;
  case GetValorComboInt(cbbTipoCampo) of
    1:begin
        CadRelatorioRelatorio.Parent  :=  pnlRepOpt;
        CadRelatorioRelatorio.Align   :=  alClient;
        CadRelatorioRelatorio.Visible :=  True;
      end;
  end;
end;

procedure TfrmCadRelatorios.FormActivate(Sender: TObject);
begin
  inherited;
  LimparTudo;
  CarregaCombos;
end;

end.
