unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, Data.DB,
  Datasnap.DBClient;

type
  TfrmBase = class(TForm)
    pnlBotoes: TPanel;
    pnlOpcoes: TPanel;
    ilBase: TImageList;
    btnSalvar: TBitBtn;
    actlstBase: TActionList;
    actSalvar: TAction;
    btnNovo: TBitBtn;
    actNovo: TAction;
    actEdit: TAction;
    btnEdit: TBitBtn;
    actDelete: TAction;
    btnDelete: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimparTudo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  :=  TCloseAction.caFree;
end;

procedure TfrmBase.LimparTudo;
var
  x:Integer;
begin
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[x] is TLabeledEdit) then
      TLabeledEdit(Self.Components[x]).Clear
    else if (Self.Components[x] is TMemo) then
      TMemo(Self.Components[x]).Lines.Clear
    else if (Self.Components[x] is TComboBox) then
    begin
      TComboBox(Self.Components[x]).Clear;
      TComboBox(Self.Components[x]).ItemIndex :=  -1;
    end
    else if (Self.Components[x] is TClientDataSet) then
    begin
      if TClientDataSet(Self.Components[x]).Active then
        TClientDataSet(Self.Components[x]).EmptyDataSet;
    end;
  end;
end;

end.
