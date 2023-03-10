unit uRelatorioGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLRichText, RLBarcode,
  RLPreview, RLParser, RLFilters, RLDraftFilter, RLRichFilter, RLHTMLFilter,
  RLPDFFilter, RLXLSXFilter, RLXLSFilter, RLPreviewForm, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmRelatorioGeral = class(TForm)
    rlrprt1: TRLReport;
    rlbnd1: TRLBand;
    rlbl1: TRLLabel;
    procedure CriarRelatorio(pCodRelatorio:Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioGeral: TfrmRelatorioGeral;
  vRelatorio:TRLReport;
  vBanda:TRLBand;
  vTipoBandaRelatorio:TRLBandType;
  vDetailGrid:TRLDetailGrid;
  vGrupo:TRLGroup;
  vSubDetalhe:TRLSubDetail;
  vLabel:TRLLabel;
  vLabelAngulada:TRLAngleLabel;
  vDBText:TRLDBText;
  vMemo:TRLMemo;
  vDBMemo:TRLDBMemo;
  vRichText:TRLRichText;
  vDBRichText:TRLDBRichText;
  vImagem:TRLImage;
  vInfoSistema:TRLSystemInfo;
  vDraw:TRLDraw;
  vPanel:TRLPanel;
  vDBResult:TRLDBResult;
  vBarcode:TRLBarcode;
  vDBBarcode:TRLDBBarcode;
  vPreview:TRLPreview;
  vExpressionParser:TRLExpressionParser;
  vDraftFilter:TRLDraftFilter;
  vRichFilter:TRLRichFilter;
  vHTMLFilter:TRLHTMLFilter;
  vPDFFilter:TRLPDFFilter;
  vXLSFilter:TRLXLSFilter;
  vXLSXFilter:TRLXLSXFilter;
  vPreviewSetup:TRLPreviewSetup;
  vQueryBuscaRelatorio,vQueryBuscaDados:TZQuery;

const
  cSqlBuscaRelatorios:String = ' SELECT * FROM TB_CAMPOSRELATORIO WHERE 1=1 ';

implementation

uses
  uDados, uDadosFuncoes, uFormularios;

{$R *.dfm}

procedure TfrmRelatorioGeral.CriarRelatorio(pCodRelatorio: Integer);
begin
  vQueryBuscaRelatorio  :=  TZQuery.Create(nil);
  with vQueryBuscaRelatorio do
  begin
    Connection  :=  DM.conDados;
    if Active then
      Close;
    SQL.Clear;
    SQL.Add(cSqlBuscaRelatorios + ' AND ID_RELAT = :REL ORDER BY ID_CAMPO ASC');
    ParamByName('REL').AsInteger  :=  pCodRelatorio;
    Open; First; FetchAll;
    while not Eof do
    begin
      case (FieldByName('ID_CAMPO').AsInteger) of
        1:begin
            vRelatorio        :=  TRLReport.Create(Self);
            vRelatorio.Parent :=  Self;
            vRelatorio.Top    :=  FieldByName('TOPVALUE').AsInteger;
            vRelatorio.Left   :=  FieldByName('LEFTVALUE').AsInteger;
          end;
        2:begin
            if vRelatorio = nil then
            begin
              MensagensSistema(1,'Voc? deve incluir ao menos um campo do tipo relat?rio.');
              Abort;
            end;
            case (FieldByName('ID_TIPOBANDA').AsInteger) of
              1:vTipoBandaRelatorio :=  btColumnFooter;
              2:vTipoBandaRelatorio :=  btColumnHeader;
              3:vTipoBandaRelatorio :=  btDetail;
              4:vTipoBandaRelatorio :=  btFooter;
              5:vTipoBandaRelatorio :=  btHeader;
              6:vTipoBandaRelatorio :=  btSummary;
              7:vTipoBandaRelatorio :=  btTitle;
            end;
            vBanda          :=  TRLBand.Create(nil);
            vBanda.BandType :=  vTipoBandaRelatorio;
            vBanda.Parent   :=  vRelatorio;
          end;
        6:begin
            if vBanda = nil then
            begin
              MensagensSistema(1,'Voc? deve incluir ao menos um campo do tipo banda.');
              Abort;
            end;
            vLabel  :=  TRLLabel.Create(nil);
            vLabel.Caption  :=  FieldByName('TEXTO_LABEL').AsString;
            vLabel.Parent   :=  vBanda;
          end;
      end;
      Next;
    end;
  end;
  vRelatorio.Preview();
end;

end.
