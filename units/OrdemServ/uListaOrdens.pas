unit uListaOrdens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Datasnap.DBClient;

type
  TfrmListaOrdens = class(TfrmBase)
    zqListaOrdens: TZQuery;
    cdsListaOrdensid: TIntegerField;
    dtmfldListaOrdensdt_cadastro: TDateTimeField;
    dtmfldListaOrdensdt_atualizacao: TDateTimeField;
    wdstrngfldListaOrdenstitulo: TWideStringField;
    wdstrngfldListaOrdensdesc_os: TWideStringField;
    cdsListaOrdensenc_os_usuario: TIntegerField;
    cdsListaOrdensstatus: TIntegerField;
    dsListaOrdens: TDataSource;
    wdstrngfldListaOrdensds_status: TWideStringField;
    pnlLegenda: TPanel;
    shpCriadas: TShape;
    lblOSCriada: TLabel;
    shpEmAndamento: TShape;
    lblOSEmAndamento: TLabel;
    shpSuspensa: TShape;
    lblOSSuspensa: TLabel;
    shpCancelada: TShape;
    lblOSCancelada: TLabel;
    shpFinalizada: TShape;
    lblOSFinalizada: TLabel;
    chkMostrarSomente: TCheckBox;
    pnlListar: TPanel;
    dbgrdListaOrdens: TDBGrid;
    dbgrdListaHists: TDBGrid;
    zqListaHists: TZQuery;
    dsListaHists: TDataSource;
    cdsListaHistsid: TIntegerField;
    cdsListaHistsid_tipohist: TIntegerField;
    cdsListaHistsid_ordem: TIntegerField;
    cdsListaHistsid_usuario: TIntegerField;
    wdstrngfldListaHistsdesc_historico: TWideStringField;
    dtmfldListaHistsdt_cadastro: TDateTimeField;
    dtmfldListaHistsdt_atualizacao: TDateTimeField;
    wdstrngfldListaHistsds_tipohist: TWideStringField;
    wdstrngfldListaHistsusuario: TWideStringField;
    procedure FormActivate(Sender: TObject);
    procedure dbgrdListaOrdensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkMostrarSomenteClick(Sender: TObject);
    procedure dbgrdListaOrdensDblClick(Sender: TObject);
    procedure dbgrdListaOrdensCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    procedure CarregarOrdens;
    procedure CarregarHistoricos(pOrdem:Integer);
  end;

var
  frmListaOrdens: TfrmListaOrdens;

const
  cSqlListaOrdens:String = 'SELECT * FROM TB_ORDEMSERV_V';
  cSqlListaHists:String = ' SELECT * FROM TB_HISTORICOOS_LISTA_V WHERE 1=1 ';

implementation

uses
  uDados, uFormularios;

{$R *.dfm}

{ TfrmListaOrdens }

procedure TfrmListaOrdens.CarregarHistoricos(pOrdem: Integer);
begin
  with zqListaHists do
  begin
    Close;
    SQL.Clear;
    SQL.Add(cSqlListaHists  + ' AND ID_ORDEM = :IDORD');
    ParamByName('IDORD').AsInteger  :=  pOrdem;
    Active  :=  True;
  end;
end;

procedure TfrmListaOrdens.CarregarOrdens;
begin
  with zqListaOrdens do
  begin
    Active  :=  False;
    SQL.Clear;
    SQL.Add(cSqlListaOrdens+' WHERE 1=1 AND ENC_OS_USUARIO = '  + GetIdUsuarioStr);
    if chkMostrarSomente.Checked then
      SQL.Add(' AND STATUS IN (1,2) ');
    Active  :=  True;
    CarregarHistoricos(FieldByName('ID').AsInteger);
  end;
end;

procedure TfrmListaOrdens.chkMostrarSomenteClick(Sender: TObject);
begin
  inherited;
  CarregarOrdens;
end;

procedure TfrmListaOrdens.dbgrdListaOrdensCellClick(Column: TColumn);
begin
  inherited;
  CarregarHistoricos(cdsListaOrdensid.AsInteger);
end;

procedure TfrmListaOrdens.dbgrdListaOrdensDblClick(Sender: TObject);
begin
  inherited;
  SetarCodigoOs(cdsListaOrdensid.AsInteger);
  SetCarregarOrdem(True);
  Close;
end;

procedure TfrmListaOrdens.dbgrdListaOrdensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  case zqListaOrdens.FieldByName('status').AsInteger of
    1:PintarLinhas(shpCriadas.Brush.Color,Sender,Rect,DataCol,Column,State);
    2:PintarLinhas(shpEmAndamento.Brush.Color,Sender,Rect,DataCol,Column,State);
    3:PintarLinhas(shpSuspensa.Brush.Color,Sender,Rect,DataCol,Column,State);
    4:PintarLinhas(shpCancelada.Brush.Color,Sender,Rect,DataCol,Column,State);
    5:PintarLinhas(shpFinalizada.Brush.Color,Sender,Rect,DataCol,Column,State);
  end;
end;

procedure TfrmListaOrdens.FormActivate(Sender: TObject);
begin
  inherited;
  CarregarOrdens;
  SetCarregarOrdem(False);
end;
end.
