unit uLeXmlAtualiza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TfrmLeXmlAtualiza = class(TForm)
    lblLendoXml: TLabel;
    gLendoXml: TGauge;
    xmlAtualiza: TXMLDocument;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeXmlAtualiza: TfrmLeXmlAtualiza;
  vContaScripts:Integer=0;

implementation

{$R *.dfm}

procedure TfrmLeXmlAtualiza.FormActivate(Sender: TObject);
var
   Node : IXMLNode;
begin
  xmlAtualiza.FileName  :=  ExtractFilePath(Application.ExeName)+'atualiza.xml';
  Node  :=  xmlAtualiza.DocumentElement.ChildNodes.FindNode('script');
  if (Node <> nil) then
    vContaScripts :=  Node.ChildNodes.Count;
  ShowMessage(IntToStr(vContaScripts));
end;

end.
