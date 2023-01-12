object FrameCadTipoOrdem: TFrameCadTipoOrdem
  Left = 0
  Top = 0
  Width = 418
  Height = 231
  TabOrder = 0
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 25
    Align = alTop
    Caption = 'CADASTRO DE TIPOS DE ORDEM DE SERVI'#199'O'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object pnlFechar: TPanel
      Left = 392
      Top = 1
      Width = 25
      Height = 23
      Align = alRight
      Caption = 'X'
      Color = clRed
      ParentBackground = False
      TabOrder = 0
      OnClick = pnlFecharClick
    end
  end
  object pnlListaCadas: TPanel
    Left = 0
    Top = 25
    Width = 418
    Height = 206
    Align = alClient
    TabOrder = 1
    object pnlBotoes: TPanel
      Left = 317
      Top = 1
      Width = 100
      Height = 204
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnSalvar: TBitBtn
        Left = 0
        Top = 0
        Width = 100
        Height = 50
        Action = actSalvar
        Align = alTop
        Caption = '&Salvar'
        TabOrder = 0
      end
      object btnNovo: TBitBtn
        Left = 0
        Top = 50
        Width = 100
        Height = 50
        Action = actNovo
        Align = alTop
        Caption = '&Novo'
        TabOrder = 1
      end
      object btnEdit: TBitBtn
        Left = 0
        Top = 100
        Width = 100
        Height = 50
        Action = actEdit
        Align = alTop
        Caption = '&Editar'
        TabOrder = 2
      end
      object btnDelete: TBitBtn
        Left = 0
        Top = 150
        Width = 100
        Height = 50
        Action = actDelete
        Align = alTop
        Caption = 'Excluir'
        TabOrder = 3
      end
    end
    object pnlListaTipos: TPanel
      Left = 1
      Top = 1
      Width = 316
      Height = 204
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlCadNovo: TPanel
        Left = 0
        Top = 0
        Width = 316
        Height = 67
        Align = alTop
        ParentColor = True
        TabOrder = 0
        object lbledtDescTipo: TLabeledEdit
          Left = 5
          Top = 17
          Width = 305
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 0
        end
        object chkIsAtivo: TCheckBox
          Left = 5
          Top = 41
          Width = 97
          Height = 17
          Caption = 'Ativo'
          TabOrder = 1
        end
        object btnAdicHist: TBitBtn
          Left = 210
          Top = 41
          Width = 100
          Height = 25
          Action = actAddType
          Caption = 'Adicionar'
          TabOrder = 2
        end
      end
      object dbgrdListaTipos: TDBGrid
        Left = 0
        Top = 67
        Width = 316
        Height = 137
        Align = alClient
        DataSource = dsLista
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdListaTiposDblClick
      end
    end
  end
  object ilBase: TImageList
    Left = 222
    Top = 176
    Bitmap = {
      494C010104000C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D5D500A5A9A700A5A8
      A800A5A8A800A5A8A800A5A9A900A7AAAA00A8ABAB00AAAEAD00DCDEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DAD9D900A38E7A00A28C7900A08B
      7700FFFFFF008F7966008F796600EEEEEE00FBFBFB00EAEAEA00EFEFEF00FDFD
      FD008F7966008F796600907B6700CECECE0000000000E4E1DD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D1D10012E0B70042F1DF003FF6
      EB0043F0DD0013DFB4000000000000000000C7CAC800646D6B0097A6A70096A4
      A50095A4A50095A4A50095A4A50096A4A50097A6A70098A7A80058615F00DCDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6917D00A58F7C00A38E7A00A28C
      7900FFFFFF008F7966008F796600EBEBEB00FDFDFD00ECECEC00EEEEEE00FBFB
      FB008F7966008F796600927C6900CECECE0000000000FFFFFF0096969600C2C2
      C20092929200B6B6B600AEAEAE00FFFFFF001ECD8A001AD9A60015E2BB00FFFF
      FF0015E1BA001BD9A4001ECC87000000000096999700B3C3C300DAECEF00C7D9
      DA00C4D6D700D9EAED00C1D2D30095A4A5008E9C9C00ABBABC009CABAB00AEB2
      B100000000000000000000000000000000000000000000000000000000000000
      0000E3DED600806840008068400080684000806840008068400080684000E3DE
      D60000000000000000000000000000000000A8927F00A6917D00A58F7C00A38E
      7A00FFFFFF008F7966008F796600EFEFEF00FEFEFE00EFEFEF00ECECEC00F9F9
      F9008F7966008F796600937E6A00CECECE0000000000FFFFFF00BEBEBE009E9E
      9E009E9E9E00A2A2A200A2A2A200B3B3B30023C375001DCE8C0019D49B00FFFF
      FF0019D49A001ECD8A0024C273000000000094989700B4C3C400B2C1C2007580
      7F00747F7E00BDCCCF007C8E92003F62800035474C003351560083929200ABB0
      AE00000000000000000000000000000000000000000000000000000000000000
      0000B7A99300CDC5B60000000000000000000000000000000000CDC5B600B7A9
      930000000000000000000000000000000000A9948000A8927F00A6917D00A58F
      7C00FFFFFF008F7966008F796600EDEDED00FCFCFC00F6F6F600F1F1F100FAFA
      FA008F7966008F796600957F6C00CECECE0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2E2E20035BC6500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0035BB64000000000094989700B4C3C400E0F3F600E0F3
      F600E0F3F600DFF2F50076868A003A4D520030A5C9002CB0E30032565C008F94
      9300000000000000000000000000000000000000000000000000000000000000
      0000AA9B8100DAD3C900A8997C00D3CBBD00D3CBBD00A8997C00DAD3C800AA9C
      810000000000000000000000000000000000B49F8C00A9948000A8927F00A691
      7D00FFFFFF00FCFCFC00E5E5E500ECECEC00FAFAFA00F8F8F800F1F1F100F9F9
      F9008F7966008F79660096806D00CECECE0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F10054BA610042B2580040B55E00FFFF
      FF0040B55E0042B2570054BA60000000000094989700B4C3C400B2C2C3007580
      7F0075807F008B989700839293003A64690034D1F4002FC5F4002CB0E3002F54
      5A00CDD0D2000000000000000000000000000000000000000000000000000000
      00009E8C6F00E6E2DC0089714C00C2B7A500C2B7A50089714C00E6E1DA009F8E
      6E0000000000000000000000000000000000BCA79300AA958100A9948000A892
      7F00A6917D00A58F7C00A38E7A00A28C7900A08B77009F8976009D8874009C86
      73009B8572009983700098826F00CECECE0000000000FFFFFF006E6E6E007676
      7600AAAAAA004E4E4E00626262007A7A7A003AA125007BC478007AC87E00FFFF
      FF007AC87E007CC4780039A023000000000094989700B4C3C400CBDCDE009FAD
      AD009FADAD00A5B3B400B8C9CA0091A6A7003C6E740034D1F3002FC5F4002CB0
      E30033565D00CDD0D20000000000000000000000000000000000000000000000
      0000927D5A000000000089714C00C2B7A500C2B7A50089714C0000000000937D
      5C0000000000000000000000000000000000BCA79400B9A49100FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE0099837000CECECE0000000000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0053A32C00B0D7A100AFD7
      A200B0D7A1003F981100000000000000000094989700B4C3C400BCCCCF008C9A
      99008C9A99008C9A990092A0A000E0F3F60091A6A7003C6E740034D1F3002FC5
      F4002CA5D50035464700B4B9B700000000000000000000000000000000000000
      000087724B000000000089714C00C2B7A500C2B7A50089714C00000000008972
      4C0000000000000000000000000000000000BDA89500BAA59100FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE009B857200CECECE0000000000FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00E5E5E500F0EFEF00E1E1
      E10000000000AFAFAF00000000000000000094989700B4C3C400ABBBBC005D67
      65005D6765005D6765005D6765005D676500ABBBBC008EA3A400376C730034C3
      E300405A5C007E8B8C00303A3600D7DAD8000000000000000000000000000000
      000089714C000000000089714C00C2B7A500C2B7A50089714C00000000008971
      4C0000000000000000000000000000000000BEA99500BBA59200FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE009C867300CECECE0000000000FCFCFB00757575007979
      7800ACACAC00949494008C8C8C00656565005D5D5D007D7D7D00FCFCFB00FFFF
      FE000000000000000000000000000000000094989700B4C3C400BACBCD00818D
      8D00818D8D00818D8D00818D8D00818D8D008B999800E0F3F6008FA3A4003744
      420099A6A800445659007A7BCB00676B71000000000000000000000000000000
      000089714C000000000089714C00C2B7A500C2B7A50089714C00000000008971
      4C0000000000000000000000000000000000BFA99600BBA69300E0E7FC00E0E7
      FC00E0E7FC00E0E7FC00E0E7FC00E0E7FC00E0E7FC00E0E7FC00E0E7FC00E0E7
      FC00E0E7FC00E0E7FC009D887400CECECE0000000000FAFAF9006F6F6F00D6D6
      D5008F8F8F00FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FFFF
      FF000000000000000000000000000000000094989700B4C3C400D0E2E400B0C0
      C100B0C0C100B0C0C100B0C0C100B0C0C100B8C9CA00E0F3F600DAEDF0006973
      7100333B39008383DF007375BF00767A7F000000000000000000000000000000
      000089724E0000000000DDD8CE000000000000000000DDD8CE00000000008972
      4C0000000000000000000000000000000000BFAA9700BCA79400FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE009F897600CECECE0000000000F7F6F500F7F6F500F7F6
      F500F7F6F500F7F6F500F7F6F500F7F6F500F7F6F500F7F6F500F7F6F500FFFF
      FF000000000000000000000000000000000094989700B4C3C400E0F3F600E0F3
      F600E0F3F600E0F3F600E0F3F600E0F3F600E0F3F600E0F3F6009CAAAB00AEB2
      B100AFB2B40054596000696E730000000000000000000000000000000000D5CE
      C00087724B00DAD3C800DAD3C800DAD3C800DAD3C800DAD3C800DAD3C8008771
      4C00D5CFC200000000000000000000000000C0AB9800BDA89400FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00A08B7700CECECE0000000000F3F2EF0083838200A6A5
      A4007F7F7E00B9B8B600A5A5A300A2A1A000C1C0BE00AAA9A700F3F2EF00FFFF
      FF000000000000000000000000000000000094989700B4C3C400ABBBBC005D67
      65005D6765005D6765005E686600CCDDDF00E0F3F600DCEEF200919E9E00ABB0
      AE0000000000000000000000000000000000000000000000000000000000B5A7
      8F00A4947700AA9C81007E643C00AA9C8100AA9C81007E643C00AA9C8100A494
      7700B5A78F00000000000000000000000000C1AC9800BEA89500FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFE00A28C7900CECECE0000000000EDEBE800EDEBE800ADAB
      A900B8B7B40075747300ADACA90079787700C0BEBC009E9D9B00EDEBE800FFFF
      FF000000000000000000000000000000000095989700B3C3C300E0F3F600E0F3
      F600E0F3F600E0F3F600E0F3F600E0F3F600DCEEF200CDDDE0008F9C9D00AEB4
      B100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A6967A00937D5C00937D5C00A6957B00000000000000
      000000000000000000000000000000000000C1AC990000000000C6D4FA00C6D4
      FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4
      FA00C6D4FA00C6D4FA00A3897300CECECE0000000000EAE8E500E4E1DD00E4E1
      DD00E4E1DD00E4E1DD00E4E1DD00E4E1DD00E4E1DD00E4E1DD00E4E1DD00FFFF
      FF0000000000000000000000000000000000C4C6C500666E6B009AA6A7009AA6
      A7009AA6A7009AA6A7009AA6A70095A2A3008D9A9A008C999A00565E5C00DDDE
      DD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1AC9900BFAA9600C6D4FA00C6D4
      FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4FA00C6D4
      FA00C6D4FA00C6D4FA00A58F7C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D1D2D200AAADAB00A9AD
      AB00A9ADAB00A9ADAB00A9ADAB00A9ADAB00A9ADAB00ADAFAE00DEDEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C0018007801FFFFF00000001000FFFFF
      00000001000FF00F00000000000FF3CF00000000000FF00F000000000007F00F
      000000010003F42F000000010001F42F000000030000F42F000000070000F42F
      000000070000F5AF000000070001E00700000007000FE00700000007000FFC3F
      40000007000FFFFF0001800F801FFFFF00000000000000000000000000000000
      000000000000}
  end
  object actlstBase: TActionList
    Images = ilBase
    Left = 182
    Top = 168
    object actSalvar: TAction
      Caption = '&Salvar'
      ImageIndex = 0
      OnExecute = actSalvarExecute
    end
    object actNovo: TAction
      Caption = '&Novo'
      ImageIndex = 1
      OnExecute = actNovoExecute
    end
    object actEdit: TAction
      Caption = '&Editar'
      ImageIndex = 2
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'Excluir'
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actAddType: TAction
      Caption = 'Adicionar'
      ImageIndex = 1
      OnExecute = actAddTypeExecute
    end
  end
  object cdsLista: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 104
    object cdsListaId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object dtfldListaDtCadastro: TDateField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DtCadastro'
      Visible = False
    end
    object dtfldListaDtAtualizacao: TDateField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DtAtualizacao'
      Visible = False
    end
    object cdsListaDescTipo: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 35
      FieldName = 'DescTipo'
      Size = 50
    end
    object cdsListaIsAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IsAtivo'
      Size = 1
    end
  end
  object dsLista: TDataSource
    AutoEdit = False
    DataSet = cdsLista
    Left = 192
    Top = 104
  end
end