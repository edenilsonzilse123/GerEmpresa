inherited frmOrdemServ: TfrmOrdemServ
  Caption = 'Ordem de servi'#231'os'
  OnActivate = FormActivate
  ExplicitTop = -53
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlOpcoes: TPanel
    object lblDescricao: TLabel
      Left = 5
      Top = 81
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblEncPara: TLabel
      Left = 5
      Top = 189
      Width = 113
      Height = 13
      Caption = 'Encaminhar OS para....'
    end
    object lblStatusOS: TLabel
      Left = 157
      Top = 189
      Width = 48
      Height = 13
      Caption = 'Status OS'
    end
    object lbledtCodigo: TLabeledEdit
      Left = 5
      Top = 18
      Width = 84
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      TabOrder = 0
      OnExit = lbledtCodigoExit
    end
    object lbledtTitulo: TLabeledEdit
      Left = 5
      Top = 57
      Width = 683
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'T'#237'tulo'
      MaxLength = 50
      TabOrder = 1
    end
    object mmoDescricao: TMemo
      Left = 5
      Top = 97
      Width = 683
      Height = 89
      MaxLength = 4000
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object pgcOrdens: TPageControl
      Left = 1
      Top = 232
      Width = 692
      Height = 338
      ActivePage = tsHistorico
      Align = alBottom
      TabOrder = 3
      object tsHistorico: TTabSheet
        Caption = 'Hist'#243'rico da ordem de servi'#231'o'
        object lblTipoHist: TLabel
          Left = 5
          Top = 3
          Width = 78
          Height = 13
          Caption = 'Tipo de hist'#243'rico'
        end
        object cbbTipoHist: TComboBox
          Left = 5
          Top = 19
          Width = 145
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
  object cbbEncPara: TComboBox [2]
    Left = 5
    Top = 205
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object cbbStatusOS: TComboBox [3]
    Left = 156
    Top = 205
    Width = 145
    Height = 21
    DropDownCount = 30
    TabOrder = 3
  end
  inherited ilBase: TImageList
    Left = 704
    Top = 408
  end
  inherited actlstBase: TActionList
    Left = 736
    Top = 408
    inherited actSalvar: TAction
      OnExecute = actSalvarExecute
    end
    inherited actNovo: TAction
      OnExecute = actNovoExecute
    end
  end
end
