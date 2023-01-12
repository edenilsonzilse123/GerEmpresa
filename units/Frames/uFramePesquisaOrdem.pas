unit uFramePesquisaOrdem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFramePesquisaOrdem = class(TFrame)
    pnlOpcoes: TPanel;
    rgPesqPor: TRadioGroup;
    grpPesqPor: TGroupBox;
    DBGrid1: TDBGrid;
    lbledtCodDescTit: TLabeledEdit;
    lblUsuariosStatus: TLabel;
    cbbInfoBusca: TComboBox;
    procedure rgPesqPorClick(Sender: TObject);
  private
    vCodigoPesquisado:Integer;
  public
    property pCodigoPesquisado:Integer  read vCodigoPesquisado;
    procedure SetarTextoCampo;
  end;

implementation

uses
  uFormularios, uDados, uDadosFuncoes;

{$R *.dfm}

{ TFramePesquisaOrdem }

procedure TFramePesquisaOrdem.rgPesqPorClick(Sender: TObject);
begin
  SetarTextoCampo;
  lbledtCodDescTit.Clear;
  case rgPesqPor.ItemIndex of
    0:begin
        lbledtCodDescTit.EditLabel.Caption  := rgPesqPor.Items[rgPesqPor.ItemIndex];
      end;
    3:CarregarCombos(cbbInfoBusca,'TB_USUARIOS','USUARIO','AND PODE_USAR = 1');
    4:CarregarCombos(cbbInfoBusca,'TB_STATUSOS','DS_STATUS');
  end;
  lbledtCodDescTit.Enabled  :=  (rgPesqPor.ItemIndex in [0,1,2]);
  lbledtCodDescTit.Color    :=  IfThenCores(rgPesqPor.ItemIndex in [0,1,2],clWhite,clBtnFace);
  cbbInfoBusca.Enabled      :=  (rgPesqPor.ItemIndex in [3,4]);
  cbbInfoBusca.Color        :=  IfThenCores(rgPesqPor.ItemIndex in [3,4],clWhite,clBtnFace);
end;

procedure TFramePesquisaOrdem.SetarTextoCampo;
begin
  grpPesqPor.Caption :=  'Pesquisar por: ' +
                         rgPesqPor.Items[rgPesqPor.ItemIndex];
end;

end.
