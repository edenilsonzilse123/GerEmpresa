unit uCadParamentros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadParamentros = class(TfrmBase)
    lbledtNomeParam: TLabeledEdit;
    grpOrdensServ: TGroupBox;
    chkMarcarTodosOrdens: TCheckBox;
    chkListaOrdens: TCheckBox;
    chkCriarNovas: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MarcarTodos(pCheckMarcaTodos:TCheckBox);
    procedure chkMarcarTodosOrdensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamentros: TfrmCadParamentros;

implementation

{$R *.dfm}

procedure TfrmCadParamentros.chkMarcarTodosOrdensClick(Sender: TObject);
begin
  inherited;
  MarcarTodos(chkMarcarTodosOrdens);
end;

procedure TfrmCadParamentros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadParamentros :=  nil;
end;

procedure TfrmCadParamentros.MarcarTodos(pCheckMarcaTodos: TCheckBox);
var
  x: Integer;
begin
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[x] is TCheckBox) then
    begin
      if (TCheckBox(Self.Components[x]).Parent = pCheckMarcaTodos.Parent) then
        TCheckBox(Self.Components[x]).Checked :=  pCheckMarcaTodos.Checked;
    end;
  end;
end;

end.
