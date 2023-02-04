inherited frmCadParamentros: TfrmCadParamentros
  Caption = 'frmCadParamentros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnDelete: TBitBtn
      ExplicitLeft = 1
    end
    inherited btnImprimir: TBitBtn
      ExplicitLeft = 1
      ExplicitTop = 201
    end
  end
  inherited pnlOpcoes: TPanel
    ExplicitLeft = -5
    ExplicitTop = -4
    object lbledtNomeParam: TLabeledEdit
      Left = 8
      Top = 20
      Width = 600
      Height = 21
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do par'#226'metro'
      TabOrder = 0
    end
    object grpOrdensServ: TGroupBox
      Left = 9
      Top = 111
      Width = 185
      Height = 194
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
      end
      object chkListaOrdens: TCheckBox
        Left = 2
        Top = 32
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Listar ordens na tela inicial'
        TabOrder = 1
      end
      object chkCriarNovas: TCheckBox
        Left = 2
        Top = 66
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Criar novas ordens de servi'#231'o'
        TabOrder = 2
      end
      object chkAdicHist: TCheckBox
        Left = 2
        Top = 83
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Adicionar hist'#243'ricos em OSs'
        TabOrder = 3
      end
      object chkAdicAnexos: TCheckBox
        Left = 2
        Top = 100
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Adiciona anexos a OSs'
        TabOrder = 4
      end
      object chkAcessaFuncao: TCheckBox
        Left = 2
        Top = 49
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Acessa fun'#231#227'o'
        TabOrder = 5
      end
      object chkImprimeOrdem: TCheckBox
        Left = 2
        Top = 117
        Width = 181
        Height = 17
        Align = alTop
        Caption = 'Imprime ordem de servi'#231'o'
        TabOrder = 6
        ExplicitLeft = 1
        ExplicitTop = 140
      end
    end
    object btnPesqParam: TBitBtn
      Left = 614
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Pesquisa'
      ImageIndex = 0
      Images = ilAdicList
      TabOrder = 2
      OnClick = btnPesqParamClick
    end
    object grpLog: TGroupBox
      Left = 9
      Top = 49
      Width = 680
      Height = 56
      TabOrder = 3
      object lbledtCaminhoLog: TLabeledEdit
        Left = 6
        Top = 25
        Width = 444
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'Caminho do log'
        TabOrder = 0
      end
      object lbledtNomeLog: TLabeledEdit
        Left = 485
        Top = 25
        Width = 192
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do arquivo'
        TabOrder = 1
      end
      object btnBuscar: TBitBtn
        Left = 456
        Top = 22
        Width = 26
        Height = 25
        Action = actBuscaCaminho
        TabOrder = 2
      end
    end
    object chkPermiteLog: TCheckBox
      Left = 20
      Top = 42
      Width = 150
      Height = 17
      Caption = 'Permite gravar log de erros'
      TabOrder = 4
      OnClick = chkPermiteLogClick
    end
  end
  object pnlPesquisa: TPanel [2]
    Left = 1600
    Top = 170
    Width = 473
    Height = 223
    TabOrder = 2
    Visible = False
    object dbgrdListaResultados: TDBGrid
      Left = 1
      Top = 93
      Width = 471
      Height = 129
      Align = alBottom
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrdListaResultadosDblClick
    end
    object lbledtPesquisar: TLabeledEdit
      Left = 9
      Top = 64
      Width = 377
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Pesquisar por:'
      TabOrder = 1
    end
    object btnPesquisa: TBitBtn
      Left = 392
      Top = 62
      Width = 75
      Height = 25
      Caption = 'Pesquisa'
      ImageIndex = 0
      Images = ilAdicList
      TabOrder = 2
      OnClick = btnPesquisaClick
    end
    object rgPesqPor: TRadioGroup
      Left = 1
      Top = 0
      Width = 464
      Height = 47
      Caption = ' Forma de pesquisa '
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Igual'
        'Inicia com'
        'Cont'#233'm'
        'Termina com')
      TabOrder = 3
    end
  end
  inherited ilBase: TImageList
    Left = 717
    Top = 16
  end
  inherited actlstBase: TActionList
    Left = 585
    Top = 16
    inherited actSalvar: TAction
      OnExecute = actSalvarExecute
    end
    inherited actNovo: TAction
      OnExecute = actNovoExecute
    end
  end
  object ilAdicList: TImageList
    Left = 684
    Top = 16
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAE5E100E2DB
      D500E1DBD500E0D9D100DFD7CD00E0D7CB00E4DACD00E4DCD100E5DDD500E6DF
      D900EFEAE800D5C6B600DCCEC100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0EDEA00F6F4F200F1EE
      EA00EEEBE700F3F1EF00EDEAE600EDEAE600F2F1EF00F4F2EF00F2EFEB00F3F0
      EC00DBCEBE00F1E7D900D8C8B900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E3DF00F6F3F100EDE9
      E400EFEAE600F3F2F000E9E5E100E8E3DF00F1EEEC00EAE6E100E5DED700D1C0
      AE00F1E7D900DAC9B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3EFEC00FAF7F100F2E9
      DA00F2E9DA00E8DFD500D9C7B800D9C8B800DCCDC000E3D7CA00CCB9A500DDCC
      BC00D7C8B700F5EEE00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCF9F500FCFAF600F6F0
      E600DBCDBD00EADEC900EADFA200E5D99700E8DEA600E2D5BF00D6C4B600D2C1
      B100ECE3D800F9F2E400F7F3EC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5EFE700FBF9F100E1D6
      C000ECE0C400E5D68700E8DB9500E9DD9B00E5D99700E4D99600E6DAC400EAE3
      D400E3DBD000F3EADC00EADFD400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8DED100F6F4E200DDCD
      B500E4D78600E8DC9500EDE3AC00EEE5B300E8DC9800E5D99700E7DCA300DBCD
      B900E1D7CC00F5EEE000FAF3E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8DDD200F6F4E200E1D3
      B800E3D47F00E5D68700E7DA9000E7DB9200ECE2A900E8DC9800E5D99700DCD0
      BB00F6F0E800F5EEE000F5F0E400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6DBD000F6F4E200F5EE
      D700E4D68400E3D47F00E3D48000E7DA9000EBE0A200E9DD9B00E9DE9F00DFD1
      BE00F7F2EA00F5EEE000F6F0E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E0D800F6F4E200F0E9
      CA00F3EAC800E3D47F00E3D47F00E3D48000E7DA9000E5D88900F5EED300DED2
      BA00F7F3EA00F5EEE000F6F4EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E3DF00FAF9F400F4F1
      E500EFE9DE00F3EBD200E5D88700E3D47F00E6D88B00F2EAD700F2ECE200F6F4
      ED00F0E9DF00F7F0E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E2DE00F9F5F000F7F1
      E800FAF5EE00E4D9CF00E4D7CD00E3D8CA00E2D7CC00E5DBCF00F4F0E600F4F1
      EA00E7DCD100ECE5DF00E9E4E000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E4DF00E9E1E300E8EB
      E400F3ECD500F7EFE000F7EFDF00F7EEDF00F7EEDF00F7EEDF00F7EEDF00F7EF
      DF00E6DDD3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E1D900E6DE
      D700EFE8E300EFE6DD00E6DCCF00E5D9CC00E5D9CC00E6DBCF00E6DDD100EEE9
      E300F6F4F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000C001000000000000
      8001000000000000800300000000000080030000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000000000000
      C007000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 618
    Top = 16
    object cdsPesquisaId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object cdsPesquisaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisa
    Left = 651
    Top = 16
  end
  object actlstAcoesAdic: TActionList
    Images = ilAdicList
    Left = 552
    Top = 16
    object actBuscaCaminho: TAction
      ImageIndex = 0
      OnExecute = actBuscaCaminhoExecute
    end
  end
  object dlgOpenPicOrdens: TOpenPictureDialog
    Left = 750
    Top = 16
  end
end