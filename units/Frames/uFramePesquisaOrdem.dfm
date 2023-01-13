object FramePesquisaOrdem: TFramePesquisaOrdem
  Left = 0
  Top = 0
  Width = 501
  Height = 240
  Align = alClient
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
    end
    object grpPesqPor: TGroupBox
      Left = 1
      Top = 1
      Width = 386
      Height = 95
      Align = alClient
      Caption = 'grpPesqPor'
      TabOrder = 1
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
        Width = 295
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
        Width = 295
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
      end
      object btnPesquisar: TBitBtn
        Left = 304
        Top = 30
        Width = 79
        Height = 25
        Action = actPesquisar
        Caption = 'Pesquisar'
        TabOrder = 2
      end
      object btnUsar: TBitBtn
        Left = 304
        Top = 70
        Width = 79
        Height = 25
        Action = actUsar
        Caption = 'Usar'
        TabOrder = 3
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 501
    Height = 143
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object actlstPesqPor: TActionList
    Images = ilPesqOrdem
    Left = 187
    Top = 106
    object actPesquisar: TAction
      Caption = 'Pesquisar'
      ImageIndex = 0
      OnExecute = actPesquisarExecute
    end
    object actUsar: TAction
      Caption = 'Usar'
      ImageIndex = 1
      OnExecute = actUsarExecute
    end
  end
  object ilPesqOrdem: TImageList
    Left = 286
    Top = 106
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAE5E100E2DB
      D500E1DBD500E0D9D100DFD7CD00E0D7CB00E4DACD00E4DCD100E5DDD500E6DF
      D900EFEAE800D5C6B600DCCEC10000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFDBD9D800000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0EDEA00F6F4F200F1EE
      EA00EEEBE700F3F1EF00EDEAE600EDEAE600F2F1EF00F4F2EF00F2EFEB00F3F0
      EC00DBCEBE00F1E7D900D8C8B90000000000000000FF000000FFC2C0BC00504C
      4200D4D2D000000000FF47423700BAB7B300000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E3DF00F6F3F100EDE9
      E400EFEAE600F3F2F000E9E5E100E8E3DF00F1EEEC00EAE6E100E5DED700D1C0
      AE00F1E7D900DAC9B7000000000000000000000000FF000000FFCAC9C6003832
      26004A463B008F8B870038322600817E7800000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3EFEC00FAF7F100F2E9
      DA00F2E9DA00E8DFD500D9C7B800D9C8B800DCCDC000E3D7CA00CCB9A500DDCC
      BC00D7C8B700F5EEE0000000000000000000000000FF000000FF000000FFA3A1
      9C003832260038322600383226004C483C00000000FF000000FF000000FF5954
      4900D5D4D200000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCF9F500FCFAF600F6F0
      E600DBCDBD00EADEC900EADFA200E5D99700E8DEA600E2D5BF00D6C4B600D2C1
      B100ECE3D800F9F2E400F7F3EC0000000000000000FF000000FF9C999200605B
      510038322600383226003832260038322600D7D6D500000000FF817E7800928E
      8800000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5EFE700FBF9F100E1D6
      C000ECE0C400E5D68700E8DB9500E9DD9B00E5D99700E4D99600E6DAC400EAE3
      D400E3DBD000F3EADC00EADFD40000000000000000FFDBD9D800545043003832
      260038322600383226003832260038322600A09D9900CCCBC800625E54000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8DED100F6F4E200DDCD
      B500E4D78600E8DC9500EDE3AC00EEE5B300E8DC9800E5D99700E7DCA300DBCD
      B900E1D7CC00F5EEE000FAF3E80000000000000000FF000000FF000000FFC1C0
      BB00615B53003832260038322600383226006B675E00000000FF000000FF0000
      00FFBDBBB600A6A39F00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8DDD200F6F4E200E1D3
      B800E3D47F00E5D68700E7DA9000E7DB9200ECE2A900E8DC9800E5D99700DCD0
      BB00F6F0E800F5EEE000F5F0E40000000000000000FF000000FF000000FF0000
      00FF000000FFC7C7C2006B665D00383226003A362A00000000FF000000FF908E
      88007D7A7100BBB9B500000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6DBD000F6F4E200F5EE
      D700E4D68400E3D47F00E3D48000E7DA9000EBE0A200E9DD9B00E9DE9F00DFD1
      BE00F7F2EA00F5EEE000F6F0E80000000000000000FF000000FF000000FF0000
      00FF000000FFBAB7B300000000FFD5D2D0008F8B8500000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E0D800F6F4E200F0E9
      CA00F3EAC800E3D47F00E3D47F00E3D48000E7DA9000E5D88900F5EED300DED2
      BA00F7F3EA00F5EEE000F6F4EF0000000000000000FF000000FF000000FFDEDD
      DB005450450085827A00E3E2E200000000FF000000FF000000FF000000FF6C67
      5F00E0E0DD00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E3DF00FAF9F400F4F1
      E500EFE9DE00F3EBD200E5D88700E3D47F00E6D88B00F2EAD700F2ECE200F6F4
      ED00F0E9DF00F7F0E4000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF918E8800000000FFDFDEDC00000000FFBCBA
      B6004E493F00B4B3AF00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E2DE00F9F5F000F7F1
      E800FAF5EE00E4D9CF00E4D7CD00E3D8CA00E2D7CC00E5DBCF00F4F0E600F4F1
      EA00E7DCD100ECE5DF00E9E4E00000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF6B655B00B3B1AD00000000FF615E5600DEDDDB000000
      00FF000000FF78746E00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E4DF00E9E1E300E8EB
      E400F3ECD500F7EFE000F7EFDF00F7EEDF00F7EEDF00F7EEDF00F7EEDF00F7EF
      DF00E6DDD300000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF98948E00817C7500000000FF000000FF98959000A6A59F000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E1D900E6DE
      D700EFE8E300EFE6DD00E6DCCF00E5D9CC00E5D9CC00E6DBCF00E6DDD100EEE9
      E300F6F4F200000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFB1ADAA00000000FF000000FF000000FF000000FFDDDDDA000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C001FDFF00000000
      8001C4FF000000008003C0FF000000008003E0E7000000008001C04F00000000
      8001801F000000008001E073000000008001F863000000008001FA7F00000000
      8001E1E7000000008003FEA3000000008001FC9B000000008007F99F00000000
      C007FBDF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 106
    object cdsPesquisaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 1
      FieldName = 'Id'
    end
    object cdsPesquisaTitulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 35
      FieldName = 'Titulo'
      Size = 50
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisa
    Left = 253
    Top = 106
  end
end
