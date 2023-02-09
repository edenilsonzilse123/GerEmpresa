object frmCadRelatorioRelatorio: TfrmCadRelatorioRelatorio
  Left = 0
  Top = 0
  Width = 690
  Height = 157
  Align = alClient
  TabOrder = 0
  object pgcOpcoes: TPageControl
    Left = 0
    Top = 25
    Width = 686
    Height = 128
    ActivePage = tsBordas
    TabOrder = 0
    object tsBandas: TTabSheet
      Caption = 'Bandas permitidas'
      object chkBandasPermitidasTipoHeader: TCheckBox
        Left = 3
        Top = 3
        Width = 120
        Height = 17
        Caption = 'Cabe'#231'alho'
        TabOrder = 0
      end
      object chkBandasPermitidasTipoTitulo: TCheckBox
        Left = 129
        Top = 3
        Width = 120
        Height = 17
        Caption = 'T'#237'tulo'
        TabOrder = 1
      end
      object chkBandasPermitidasTipoColumnHeader: TCheckBox
        Left = 255
        Top = 3
        Width = 120
        Height = 17
        Caption = 'Cabe'#231'alho da coluna'
        TabOrder = 2
      end
      object chkBandasPermitidasTipoDetalhe: TCheckBox
        Left = 381
        Top = 3
        Width = 120
        Height = 17
        Caption = 'Detalhe'
        TabOrder = 3
      end
      object chkBandasPermitidasTipoColumnFooter: TCheckBox
        Left = 507
        Top = 3
        Width = 120
        Height = 17
        Caption = 'Rodap'#233' da coluna'
        TabOrder = 4
      end
      object chkBandasPermitidasTipoSummary: TCheckBox
        Left = 3
        Top = 26
        Width = 120
        Height = 17
        Caption = 'Resumo'
        TabOrder = 5
      end
      object chkBandasPermitidasTipoFooter: TCheckBox
        Left = 129
        Top = 26
        Width = 120
        Height = 17
        Caption = 'Rodap'#233
        TabOrder = 6
      end
    end
    object tsBackGround: TTabSheet
      Caption = 'Background'
      ImageIndex = 1
      object lblAlinhamentoBack: TLabel
        Left = 3
        Top = 3
        Width = 59
        Height = 13
        Caption = 'Alinhamento'
      end
      object lblArranjoBack: TLabel
        Left = 154
        Top = 3
        Width = 36
        Height = 13
        Caption = 'Arranjo'
      end
      object imgRelatBack: TImage
        Left = 386
        Top = 44
        Width = 50
        Height = 50
      end
      object cbbAlinhamento: TComboBox
        Left = 3
        Top = 19
        Width = 145
        Height = 21
        TabOrder = 0
        Items.Strings = (
          'faBottom'
          'faBottomOnly'
          'faCenter'
          'faCenterBottom'
          'faCenterLeft'
          'faCenterRight'
          'faCenterTop'
          'faClient'
          'faClientBottom'
          'faClientLeft'
          'faClientRight'
          'faClientTop'
          'faHeight'
          'faLeft'
          'faLeftBottom'
          'faLeftMost'
          'faLeftOnly'
          'faLeftTop'
          'faNone'
          'faRight'
          'faRightBottom'
          'faRightMost'
          'faRightOnly'
          'faRightTop'
          'faTop'
          'faTopOnly'
          'faWidth')
      end
      object cbbArranjo: TComboBox
        Left = 154
        Top = 19
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object chkAutoSize: TCheckBox
        Left = 305
        Top = 21
        Width = 120
        Height = 17
        Caption = 'Tamanho autom'#225'tico'
        TabOrder = 2
      end
      object lbledtImagem: TLabeledEdit
        Left = 3
        Top = 64
        Width = 296
        Height = 21
        Color = clBtnFace
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = 'Imagem de fundo'
        Enabled = False
        TabOrder = 4
      end
      object btnBuscarImagem: TButton
        Left = 305
        Top = 61
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 5
        OnClick = btnBuscarImagemClick
      end
      object lbledtComprimento: TLabeledEdit
        Left = 431
        Top = 19
        Width = 66
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Comprimento'
        NumbersOnly = True
        TabOrder = 3
      end
    end
    object tsBordas: TTabSheet
      Caption = 'Bordas'
      ImageIndex = 2
      object shpCorEscolhida: TShape
        Left = 84
        Top = 3
        Width = 125
        Height = 25
        Pen.Color = clWhite
      end
      object btnBuscarCor: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Buscar cor'
        TabOrder = 0
        OnClick = btnBuscarCorClick
      end
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 25
    TabOrder = 1
    object chkMargensAjustaveis: TCheckBox
      Left = 3
      Top = 3
      Width = 160
      Height = 17
      Caption = 'Margens Ajustaveis'
      TabOrder = 0
    end
  end
  object dlgOpenPicRelat: TOpenPictureDialog
    Filter = 'Imagem jpg|*.jpg|Imagem jpeg|*.jpeg'
    Left = 540
    Top = 33
  end
  object dlgColorRelat: TColorDialog
    Left = 156
    Top = 89
  end
end
