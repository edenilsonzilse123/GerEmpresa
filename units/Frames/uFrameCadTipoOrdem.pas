unit uFrameCadTipoOrdem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.StrUtils;

type
  TFrameCadTipoOrdem = class(TFrame)
    ilBase: TImageList;
    actlstBase: TActionList;
    actSalvar: TAction;
    actNovo: TAction;
    actEdit: TAction;
    actDelete: TAction;
    cdsLista: TClientDataSet;
    dsLista: TDataSource;
    cdsListaId: TIntegerField;
    dtfldListaDtCadastro: TDateField;
    dtfldListaDtAtualizacao: TDateField;
    cdsListaDescTipo: TStringField;
    cdsListaIsAtivo: TStringField;
    pnlTitulo: TPanel;
    pnlListaCadas: TPanel;
    pnlBotoes: TPanel;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    pnlListaTipos: TPanel;
    pnlCadNovo: TPanel;
    dbgrdListaTipos: TDBGrid;
    pnlFechar: TPanel;
    lbledtDescTipo: TLabeledEdit;
    chkIsAtivo: TCheckBox;
    btnAdicHist: TBitBtn;
    actAddType: TAction;
    procedure CarregarTiposCad;
    procedure pnlFecharClick(Sender: TObject);
    procedure actAddTypeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDados, uFormularios;

{$R *.dfm}

procedure TFrameCadTipoOrdem.actAddTypeExecute(Sender: TObject);
begin
  ShowMessage('Adicionando');
end;

procedure TFrameCadTipoOrdem.CarregarTiposCad;
var
  zqLista:TZQuery;
begin
  cdsLista.Close;
  cdsLista.CreateDataSet;
  cdsLista.EmptyDataSet;
  cdsLista.Open;
  zqLista :=  TZQuery.Create(nil);
  try
    with zqLista do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_TIPOHISTORICO_OS');
      Open; First; FetchAll;
      while not Eof do
      begin
        cdsLista.Append;
        cdsListaId.AsInteger                :=  FieldByName('ID').AsInteger;
        dtfldListaDtCadastro.AsDateTime     :=  FieldByName('DT_CADASTRO').AsDateTime;
        dtfldListaDtAtualizacao.AsDateTime  :=  FieldByName('DT_ATUALIZACAO').AsDateTime;
        cdsListaDescTipo.AsString           :=  FieldByName('DS_TIPOHIST').AsString;
        cdsListaIsAtivo.AsString            :=  IfThen(
                                                FieldByName('IS_ATIVO').AsInteger = 1,
                                                'S',
                                                'N'
                                                );
        cdsLista.Post;
        zqLista.Next;
      end;
    end;
    FreeAndNil(zqLista);
  except
    FreeAndNil(zqLista);
  end;
end;

procedure TFrameCadTipoOrdem.pnlFecharClick(Sender: TObject);
begin
  if Self.GetParentComponent is TPanel then
    TPanel(Self.GetParentComponent).Visible :=  False;
end;

end.
