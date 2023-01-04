unit uLeXmlAtualiza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmLeXmlAtualiza = class(TForm)
    lblLendoXml: TLabel;
    gLendoXml: TGauge;
    xmlAtualiza: TXMLDocument;
    function  GetAlteracaoAnterior(pIDScript:String):Boolean;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeXmlAtualiza: TfrmLeXmlAtualiza;
  zqXml:TZQuery;

implementation

uses
  uDadosFuncoes, uFormularios, uDados;

{$R *.dfm}

procedure TfrmLeXmlAtualiza.FormActivate(Sender: TObject);
var
   NodeScript : IXMLNode;
   x:Integer;
   vArquivo:String;
begin
  vArquivo  :=  ExtractFilePath(Application.ExeName)+'atualiza.xml';
  if FileExists(vArquivo) then
  begin
    xmlAtualiza.LoadFromFile(vArquivo);
    NodeScript  :=  xmlAtualiza.ChildNodes.FindNode('script');
    if (NodeScript <> nil) then
    begin
      with gLendoXml do
      begin
        MaxValue  :=  NodeScript.ChildNodes.Count;
        Progress  :=  0;
      end;
      for x := 0 to NodeScript.ChildNodes.Count - 1 do
      begin
        if (not SqlTemRegistro('TB_ATUALIZACOES',
                               '*',
                               ' AND ID = ' +
                               NodeScript.ChildNodes[x].Attributes['id'])) then
        begin
          zqXml :=  TZQuery.Create(nil);
          try
            with zqXml do
            begin
              Connection  :=  DM.conDados;
              if Active then
                Close;
              SQL.Clear;
              SQL.Add(NodeScript.ChildNodes[x].NodeValue);
              ExecSQL;
              InsereDados('TB_ATUALIZACOES','SQL_ATUALIZACAO',
                          StringSql(NodeScript.ChildNodes[x].NodeValue),
                          False);
            end;
          except
            FreeAndNil(zqXml);
          end;
          FreeAndNil(zqXml);
          Sleep(500);
          gLendoXml.Progress  :=  gLendoXml.Progress  + 1;
          Application.ProcessMessages;
        end
        else
        begin
          gLendoXml.Progress  :=  gLendoXml.Progress  + 1;
          Application.ProcessMessages;
          Continue;
        end;
      end;
    end;
    DeleteFile(vArquivo);
  end;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

function TfrmLeXmlAtualiza.GetAlteracaoAnterior(pIDScript: String): Boolean;
begin
  zqXml :=  TZQuery.Create(nil);
  try
    with zqXml do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_ATUALIZACOES WHERE ID = :ID');
      ParamByName('ID').AsString  :=  pIDScript;
      Open; First; FetchAll;
      Result  :=  (RecordCount >= 1);
    end;
  except
    FreeAndNil(zqXml);
  end;
  FreeAndNil(zqXml);
end;

end.
