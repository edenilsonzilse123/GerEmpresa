unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

end.
