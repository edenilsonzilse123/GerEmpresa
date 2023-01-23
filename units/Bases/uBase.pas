unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.OleCtrls,
  AcroPDFLib_TLB;

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
    actImprimir: TAction;
    btnImprimir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimparTudo;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;
  vTempoHint:Integer=15000;

implementation

{$R *.dfm}

procedure TfrmBase.FormActivate(Sender: TObject);
begin
  Application.HintHidePause :=  vTempoHint;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
var
  x:Integer;
begin
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[x] is TAcroPDF) then
      TAcroPDF(Self.Components[x]).ControlInterface._AddRef;
  end;
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
    end
    else if (Self.Components[x] is TDBGrid) then
      TDBGrid(Self.Components[x]).Options :=  TDBGrid(Self.Components[x]).Options - [dgEditing]
    else if (Self.Components[x] is TPageControl) then
      TPageControl(Self.Components[x]).ActivePageIndex  :=  0;
  end;
end;

end.
