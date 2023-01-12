object FramePesquisaOrdem: TFramePesquisaOrdem
  Left = 0
  Top = 0
  Width = 501
  Height = 240
  TabOrder = 0
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 97
    Align = alTop
    TabOrder = 0
    object rgPesqPor: TRadioGroup
      Left = 387
      Top = 1
      Width = 113
      Height = 95
      Align = alRight
      Caption = 'Campo a pesquisar'
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'T'#237'tulo'
        'Descri'#231#227'o'
        'Usu'#225'rio destino'
        'Status')
      TabOrder = 0
      OnClick = rgPesqPorClick
      ExplicitLeft = 377
      ExplicitTop = 3
      ExplicitHeight = 105
    end
    object grpPesqPor: TGroupBox
      Left = 1
      Top = 1
      Width = 386
      Height = 95
      Align = alClient
      Caption = 'grpPesqPor'
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitWidth = 368
      ExplicitHeight = 105
      object lblUsuariosStatus: TLabel
        Left = 3
        Top = 56
        Width = 82
        Height = 13
        Caption = 'lblUsuariosStatus'
        Enabled = False
      end
      object lbledtCodDescTit: TLabeledEdit
        Left = 3
        Top = 32
        Width = 206
        Height = 21
        Color = clBtnFace
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = 'lbledtCodDescTit'
        Enabled = False
        TabOrder = 0
      end
      object cbbInfoBusca: TComboBox
        Left = 3
        Top = 72
        Width = 206
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 501
    Height = 143
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
