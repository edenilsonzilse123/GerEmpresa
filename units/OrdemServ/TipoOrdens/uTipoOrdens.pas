unit uTipoOrdens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmTipoOrdens = class(TfrmBase)
    pnlCadNovo: TPanel;
    dbgrdListaTipos: TDBGrid;
    cdsListaTipoHist: TClientDataSet;
    dsListaTipoHist: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoOrdens: TfrmTipoOrdens;

implementation

{$R *.dfm}

end.
