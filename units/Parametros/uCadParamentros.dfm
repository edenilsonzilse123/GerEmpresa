inherited frmCadParamentros: TfrmCadParamentros
  Caption = 'frmCadParamentros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlOpcoes: TPanel
    object lbledtNomeParam: TLabeledEdit
      Left = 8
      Top = 20
      Width = 680
      Height = 21
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do par'#226'metro'
      TabOrder = 0
    end
    object grpOrdensServ: TGroupBox
      Left = 8
      Top = 47
      Width = 185
      Height = 105
      Caption = 'Ordens de servi'#231'o'
      TabOrder = 1
      object chkMarcarTodosOrdens: TCheckBox
        Left = 2
        Top = 15
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Marcar todos'
        TabOrder = 0
        OnClick = chkMarcarTodosOrdensClick
        ExplicitLeft = 40
        ExplicitTop = 48
        ExplicitWidth = 97
      end
      object chkListaOrdens: TCheckBox
        Left = 2
        Top = 32
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Listar ordens na tela inicial'
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 54
      end
      object chkCriarNovas: TCheckBox
        Left = 2
        Top = 49
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Criar novas ordens de servi'#231'o'
        TabOrder = 2
        ExplicitLeft = 48
        ExplicitTop = 72
        ExplicitWidth = 97
      end
    end
  end
end
