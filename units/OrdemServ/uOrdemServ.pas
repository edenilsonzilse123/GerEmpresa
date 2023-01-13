unit uOrdemServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.ComCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,
  MidasLib, System.StrUtils, uFrameCadTipoOrdem, Vcl.Menus, uFramePesquisaOrdem;

type
  TfrmOrdemServ = class(TfrmBase)
    lbledtCodigo: TLabeledEdit;
    lbledtTitulo: TLabeledEdit;
    lblDescricao: TLabel;
    mmoDescricao: TMemo;
    lblEncPara: TLabel;
    cbbEncPara: TComboBox;
    lblStatusOS: TLabel;
    cbbStatusOS: TComboBox;
    pgcOrdens: TPageControl;
    tsHistorico: TTabSheet;
    lblTipoHist: TLabel;
    cbbTipoHist: TComboBox;
    lblContaCarac: TLabel;
    pnlListaHist: TPanel;
    dbgrdListaHist: TDBGrid;
    dsListaHist: TDataSource;
    cdsListahist: TClientDataSet;
    cdsListahistIdTipoHist: TIntegerField;
    cdsListahistIdOrdem: TIntegerField;
    cdsListahistDescHist: TStringField;
    cdsListahistDescTipoHist: TStringField;
    lblDescHist: TLabel;
    mmoDescHist: TMemo;
    actlstAdicHist: TActionList;
    ilAdicList: TImageList;
    actAdicHist: TAction;
    btnAdicHist: TBitBtn;
    cdsListahistIdHist: TIntegerField;
    cdsListahistUsu�rio: TStringField;
    cdsListahistIdUsuario: TIntegerField;
    pnlHistoricos: TPanel;
    chkOrdenarIdDesc: TCheckBox;
    lblQtdHistEncontrados: TLabel;
    pnl1: TPanel;
    pmCadopcoes: TPopupMenu;
    actTipoOrdem: TAction;
    Adicionar1: TMenuItem;
    ipodeordemdeservio1: TMenuItem;
    FrameCadTipoOrdem1: TFrameCadTipoOrdem;
    tmrOrdens: TTimer;
    dtfldListahistDtCadastro: TDateField;
    dtfldListahistDtAtualizacao: TDateField;
    pnlPesquisa: TPanel;
    FramePesquisaOrdem: TFramePesquisaOrdem;
    btnPesquisar: TBitBtn;
    actPesquisar: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lbledtCodigoExit(Sender: TObject);
    procedure CarregarOrdem(pCodigo:Integer);
    procedure CarregarCombosTela;
    procedure actNovoExecute(Sender: TObject);
    procedure mmoDescricaoChange(Sender: TObject);
    procedure CarregarHistorico(pCodigo: Integer);
    procedure actAdicHistExecute(Sender: TObject);
    procedure chkOrdenarIdDescClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actTipoOrdemExecute(Sender: TObject);
    procedure tmrOrdensTimer(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure FramePesquisaOrdemactUsarExecute(Sender: TObject);
    procedure dbgrdListaHistCellClick(Column: TColumn);
    procedure dbgrdListaHistDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServ: TfrmOrdemServ;

implementation

uses
  uFormularios, uDadosFuncoes, uDados, uMostraHistorico;

{$R *.dfm}

procedure TfrmOrdemServ.actAdicHistExecute(Sender: TObject);
begin
  inherited;
  cdsListahist.Append;
  cdsListahistIdHist.AsInteger      :=  0;
  cdsListahistIdTipoHist.AsInteger  :=  GetValorComboInt(cbbTipoHist);
  cdsListahistIdOrdem.AsInteger     :=  StrToIntDef(lbledtCodigo.Text,0);
  cdsListahistDescHist.AsString     :=  mmoDescHist.Text;
  cdsListahistDescTipoHist.AsString :=  GetTextoCombo(cbbTipoHist);
  cdsListahistUsu�rio.AsString      :=  GetNomeUsuario;
  cdsListahistIdUsuario.AsInteger   :=  GetIdUsuario;
  cdsListahist.Post;
end;

procedure TfrmOrdemServ.actDeleteExecute(Sender: TObject);
var
  vMensagem:String;
begin
  inherited;
  vMensagem :=  EmptyStr;
  vMensagem :=  vMensagem + 'Deseja mesmo apagar esta OS?' + #13#10;
  vMensagem :=  vMensagem + 'Todos os hist�ricos desta OS tamb�m ser�o exclu�dos';
  if (MensagemPergunta(3,PWideChar(vMensagem))) then
  begin
    ExcluirDados('TB_ORDEMSERV',' AND ID = '  + lbledtCodigo.Text);
    LimparTudo;
  end;
end;

procedure TfrmOrdemServ.actNovoExecute(Sender: TObject);
begin
  inherited;
  LimparTudo;
  CarregarCombosTela;
  ContarCaracteresMemo(mmoDescricao,lblContaCarac);
end;

procedure TfrmOrdemServ.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  FramePesquisaOrdem.ClicarPesquisa;
  pnlPesquisa.Visible :=  True;
  CentralizarPanel(Self,pnlPesquisa);
end;

procedure TfrmOrdemServ.actSalvarExecute(Sender: TObject);
var
  vCampos,vValores:String;
  procedure LimparVariaveis;
  begin
    vCampos   :=  EmptyStr;
    vValores  :=  EmptyStr;
  end;
  procedure GravaHistorico;
  begin
    if (cdsListahist.Active) then
    begin
      if (cdsListahist.RecordCount >= 1) then
      begin
        LimparVariaveis;
        vCampos :=  vCampos + 'ID_USUARIO,';
        vCampos :=  vCampos + 'ID_TIPOHIST,';
        vCampos :=  vCampos + 'ID_ORDEM,';
        vCampos :=  vCampos + 'DESC_HISTORICO';
        cdsListahist.First;
        while not cdsListahist.Eof do
        begin
          if cdsListahistIdHist.AsInteger = 0 then
          begin
            vValores  :=  vValores  + GetIdUsuarioStr                 + ','     ;
            vValores  :=  vValores  + cdsListahistIdTipoHist.AsString + ','     ;
            vValores  :=  vValores  + cdsListahistIdOrdem.AsString    + ','     ;
            vValores  :=  vValores  + StringSql(cdsListahistDescHist.AsString)  ;
            InsereDados('TB_HISTORICOOS',vCampos,vValores,False);
          end;
          cdsListahist.Next;
        end;
      end;
    end;
  end;
  procedure GravaHistoricoAtualiza;
  begin
    LimparVariaveis;
    vCampos :=  vCampos + 'ID_USUARIO,'                                 ;
    vCampos :=  vCampos + 'ID_TIPOHIST,'                                ;
    vCampos :=  vCampos + 'ID_ORDEM,'                                   ;
    vCampos :=  vCampos + 'DESC_HISTORICO'                              ;
    vValores  :=  vValores  + '2,'                                      ;
    vValores  :=  vValores  + '2,'                                      ;
    vValores  :=  vValores  + StringSql(lbledtCodigo.Text)  + ','       ;
    vValores  :=  vValores  + StringSql('Ordem de servi�o atualizada')  ;
    InsereDados('TB_HISTORICOOS',vCampos,vValores,False)                ;
  end;
begin
  inherited;
  LimparVariaveis;
  if (StrToIntDef(lbledtCodigo.Text,0) = 0) then
  begin
    vCampos   :=  vCampos + 'TITULO,';
    vCampos   :=  vCampos + 'DESC_OS,';
    vCampos   :=  vCampos + 'ENC_OS_USUARIO,';
    vCampos   :=  vCampos + 'STATUS';
    vValores  :=  vValores  + StringSql(lbledtTitulo.Text)  + ',';
    vValores  :=  vValores  + StringSql(mmoDescricao.Text)  + ',';
    vValores  :=  vValores  + GetValorCombo(cbbEncPara)     + ',';
    vValores  :=  vValores  + GetValorCombo(cbbStatusOS);
    InsereDados('TB_ORDEMSERV',vCampos,vValores);
    GravaHistorico;
  end
  else
  begin
    vValores  :=  vValores  + ' TITULO = '  + StringSql(lbledtTitulo.Text)      + ',';
    vValores  :=  vValores  + ' DESC_OS = '  + StringSql(mmoDescricao.Text)     + ',';
    vValores  :=  vValores  + ' ENC_OS_USUARIO = '  + GetValorCombo(cbbEncPara) + ',';
    vValores  :=  vValores  + ' STATUS = '  + GetValorCombo(cbbStatusOS);
    AtualizaDados('TB_ORDEMSERV',vValores,' AND ID = ' + lbledtCodigo.Text);
    GravaHistoricoAtualiza;
    GravaHistorico;
  end;
  CarregarOrdem(StrToIntDef(lbledtCodigo.Text,0));
end;

procedure TfrmOrdemServ.actTipoOrdemExecute(Sender: TObject);
begin
  inherited;
  if (not pnl1.Visible) then
  begin
    CentralizarPanel(Self,pnl1);
    FrameCadTipoOrdem1.CarregarTiposCad;
    pnl1.Visible  :=  True;
  end;
end;

procedure TfrmOrdemServ.CarregarCombosTela;
begin
  CarregarCombos(cbbEncPara,'TB_USUARIOS','USUARIO','AND PODE_USAR = 1');
  CarregarCombos(cbbStatusOS,'TB_STATUSOSS','DS_STATUS');
  CarregarCombos(cbbTipoHist,'TB_TIPOHISTORICO_OS','DS_TIPOHIST','AND IS_ATIVO = 1');
end;

procedure TfrmOrdemServ.CarregarHistorico(pCodigo: Integer);
var
  zqHist:TZQuery;
begin
  cdsListahist.Close;
  cdsListahist.CreateDataSet;
  cdsListahist.EmptyDataSet;
  cdsListahist.Open;
  try
    zqHist  :=  TZQuery.Create(nil);
    with zqHist do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_HISTORICOOS_LISTA_V WHERE ID_ORDEM = :IDORDEM');
      SQL.Add(' ORDER BY ID ' + IfThen(chkOrdenarIdDesc.Checked,'DESC','ASC'));
      ParamByName('IDORDEM').AsInteger :=  pCodigo;
      Open; First; FetchAll;
      while not Eof do
      begin
        cdsListahist.Append;
        cdsListahistIdHist.AsInteger        :=  FieldByName('ID').AsInteger;
        cdsListahistIdTipoHist.AsInteger    :=  FieldByName('ID_TIPOHIST').AsInteger;
        cdsListahistIdOrdem.AsInteger       :=  FieldByName('ID_ORDEM').AsInteger;
        cdsListahistDescHist.AsString       :=  FieldByName('DESC_HISTORICO').AsString;
        cdsListahistDescTipoHist.AsString   :=  FieldByName('DS_TIPOHIST').AsString;
        cdsListahistUsu�rio.AsString        :=  FieldByName('USUARIO').AsString;
        dtfldListahistDtCadastro.AsDateTime :=  FieldByName('DT_CADASTRO').AsDateTime;
        cdsListahist.Post;
        zqHist.Next;
      end;
    end;
    FreeAndNil(zqHist);
  except
    FreeAndNil(zqHist);
  end;
  lblQtdHistEncontrados.Caption :=  'Quantidade de hist�ricos encontrados nessa OS: ' +
                                    IntToStr(cdsListahist.RecordCount);
end;

procedure TfrmOrdemServ.CarregarOrdem(pCodigo: Integer);
var
  zqListaOs:TZQuery;
begin
  LimparTudo;
  lbledtCodigo.Text :=  IntToStr(pCodigo);
  CarregarCombosTela;
  zqListaOs :=  TZQuery.Create(nil);
  with zqListaOs do
  begin
    try
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('select * from tb_ordemserv where id = :id');
      ParamByName('id').AsInteger :=  pCodigo;
      Open; First; FetchAll;
      lbledtTitulo.Text :=  FieldByName('titulo').AsString;
      mmoDescricao.Lines.Add(FieldByName('desc_os').AsString);
      SetValorCombo(cbbEncPara,FieldByName('enc_os_usuario').AsInteger);
      SetValorCombo(cbbStatusOS,FieldByName('status').AsInteger);
      FreeAndNil(zqListaOs);
    except
      FreeAndNil(zqListaOs);
    end;
  end;
  CarregarHistorico(pCodigo);
end;

procedure TfrmOrdemServ.chkOrdenarIdDescClick(Sender: TObject);
begin
  inherited;
  CarregarHistorico(StrToIntDef(lbledtCodigo.Text,0));
end;

procedure TfrmOrdemServ.dbgrdListaHistCellClick(Column: TColumn);
begin
  inherited;
  dbgrdListaHist.Hint :=  cdsListahistDescHist.AsString;
end;

procedure TfrmOrdemServ.dbgrdListaHistDblClick(Sender: TObject);
begin
  inherited;
  CriarForm(TfrmMostraHistorico,frmMostraHistorico,cdsListahistDescTipoHist.AsString,False);
  frmMostraHistorico.SetarInformacoes(
    dtfldListahistDtCadastro.AsDateTime,
    dtfldListahistDtAtualizacao.AsDateTime,
    cdsListahistDescTipoHist.AsString,
    cdsListahistDescHist.AsString
  );
  frmMostraHistorico.ShowModal;
end;

procedure TfrmOrdemServ.FormActivate(Sender: TObject);
begin
  inherited;
  ContarCaracteresMemo(mmoDescricao,lblContaCarac);
  CarregarCombosTela;
  FrameCadTipoOrdem1.vAtualizaTela  :=  False;
end;

procedure TfrmOrdemServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmOrdemServ  :=  nil;
end;

procedure TfrmOrdemServ.FramePesquisaOrdemactUsarExecute(Sender: TObject);
begin
  inherited;
  FramePesquisaOrdem.actUsarExecute(Sender);
  pnlPesquisa.Visible :=  False;
  CarregarOrdem(FramePesquisaOrdem.cdsPesquisaId.AsInteger);
end;

procedure TfrmOrdemServ.lbledtCodigoExit(Sender: TObject);
begin
  inherited;
  CarregarOrdem(StrToIntDef(lbledtCodigo.Text,0));
end;

procedure TfrmOrdemServ.mmoDescricaoChange(Sender: TObject);
begin
  inherited;
  ContarCaracteresMemo(mmoDescricao,lblContaCarac);
end;

procedure TfrmOrdemServ.tmrOrdensTimer(Sender: TObject);
begin
  inherited;
  if FrameCadTipoOrdem1.vAtualizaTela then
  begin
    CarregarCombos(cbbTipoHist,'TB_TIPOHISTORICO_OS','DS_TIPOHIST','AND IS_ATIVO = 1');
    FrameCadTipoOrdem1.vAtualizaTela  :=  False;
  end;
end;

end.
