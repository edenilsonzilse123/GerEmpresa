unit uMostraHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMostraHistorico = class(TForm)
    lblDataCadDesc: TLabel;
    lblDataCadData: TLabel;
    lblDataAtualizaDesc: TLabel;
    lblDataAtualizaData: TLabel;
    lblTipoHist: TLabel;
    lblTipoHistDesc: TLabel;
    mmoHist: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure SetarInformacoes(pDataCad,pDataAtual:TDateTime;pTipo,pDesc:String);
  end;

var
  frmMostraHistorico: TfrmMostraHistorico;

implementation

{$R *.dfm}

{ TfrmMostraHistorico }

procedure TfrmMostraHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action  :=  TCloseAction.caFree;
  frmMostraHistorico  :=  nil;
end;

procedure TfrmMostraHistorico.SetarInformacoes(pDataCad, pDataAtual: TDateTime;
  pTipo, pDesc: String);
begin
  lblDataCadData.Caption      :=  DateTimeToStr(pDataCad);
  lblDataAtualizaData.Caption :=  DateTimeToStr(pDataAtual);
  lblTipoHistDesc.Caption     :=  pTipo;
  mmoHist.Clear;
  mmoHist.Lines.Add(pDesc);
end;

end.
