inherited frmTipoOrdens: TfrmTipoOrdens
  Caption = 'frmTipoOrdens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlOpcoes: TPanel
    ExplicitLeft = -5
    ExplicitTop = -8
    object pnlCadNovo: TPanel
      Left = 1
      Top = 1
      Width = 692
      Height = 94
      Align = alTop
      TabOrder = 0
    end
    object dbgrdListaTipos: TDBGrid
      Left = 1
      Top = 95
      Width = 692
      Height = 475
      Align = alClient
      DataSource = dsListaTipoHist
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object cdsListaTipoHist: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 256
  end
  object dsListaTipoHist: TDataSource
    DataSet = cdsListaTipoHist
    Left = 344
    Top = 312
  end
end
