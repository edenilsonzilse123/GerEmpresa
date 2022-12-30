unit uOrdemServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lbledtCodigoExit(Sender: TObject);
    procedure CarregarOrdem(pCodigo:Integer);
    procedure CarregarCombosTela;
    procedure actNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServ: TfrmOrdemServ;

implementation

uses
  uFormularios, uDadosFuncoes, uDados;

{$R *.dfm}

procedure TfrmOrdemServ.actNovoExecute(Sender: TObject);
begin
  inherited;
  LimparTudo;
  CarregarCombosTela;
end;

procedure TfrmOrdemServ.actSalvarExecute(Sender: TObject);
var
  vCampos,vValores:String;
begin
  inherited;
  vCampos       :=  EmptyStr;
  vValores      :=  EmptyStr;
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
  end
  else
    ShowMessage('Atualizando...')
end;

procedure TfrmOrdemServ.CarregarCombosTela;
begin
  CarregarCombos(cbbEncPara,'TB_USUARIOS','USUARIO');
  CarregarCombos(cbbStatusOS,'TB_STATUSOSS','DS_STATUS');
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
end;

procedure TfrmOrdemServ.FormActivate(Sender: TObject);
begin
  inherited;
  CarregarCombosTela;
end;

procedure TfrmOrdemServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmOrdemServ  :=  nil;
end;

procedure TfrmOrdemServ.lbledtCodigoExit(Sender: TObject);
begin
  inherited;
  CarregarOrdem(StrToIntDef(lbledtCodigo.Text,0));
end;

end.
