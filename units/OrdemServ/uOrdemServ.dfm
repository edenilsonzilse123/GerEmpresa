﻿inherited frmOrdemServ: TfrmOrdemServ
  Caption = 'Ordem de servi'#231'os'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnNovo: TBitBtn
      ExplicitLeft = 0
      ExplicitTop = 45
    end
    inherited btnDelete: TBitBtn
      ExplicitLeft = 0
      ExplicitTop = 152
    end
  end
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
    object lblContaCarac: TLabel
      Left = 57
      Top = 81
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
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
      OnChange = mmoDescricaoChange
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
        object lblDescHist: TLabel
          Left = 5
          Top = 43
          Width = 104
          Height = 13
          Caption = 'Descri'#231#227'o do hist'#243'rico'
        end
        object cbbTipoHist: TComboBox
          Left = 5
          Top = 19
          Width = 245
          Height = 21
          TabOrder = 0
        end
        object pnlListaHist: TPanel
          Left = 256
          Top = 0
          Width = 428
          Height = 310
          Align = alRight
          TabOrder = 1
          object dbgrdListaHist: TDBGrid
            Left = 1
            Top = 1
            Width = 426
            Height = 255
            Align = alClient
            DataSource = dsListaHist
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnlHistoricos: TPanel
            Left = 1
            Top = 256
            Width = 426
            Height = 53
            Align = alBottom
            TabOrder = 1
            object lblQtdHistEncontrados: TLabel
              Left = 8
              Top = 29
              Width = 309
              Height = 14
              Caption = 'Quantidade de hist'#243'ricos encontrados nessa OS: 0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chkOrdenarIdDesc: TCheckBox
              Left = 8
              Top = 6
              Width = 193
              Height = 17
              Caption = 'Mais recente primeiro'
              TabOrder = 0
              OnClick = chkOrdenarIdDescClick
            end
          end
        end
        object mmoDescHist: TMemo
          Left = 5
          Top = 59
          Width = 245
          Height = 89
          MaxLength = 4000
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object btnAdicHist: TBitBtn
          Left = 5
          Top = 154
          Width = 100
          Height = 25
          Action = actAdicHist
          Caption = 'Adicionar'
          TabOrder = 3
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
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
  object dsListaHist: TDataSource
    AutoEdit = False
    DataSet = cdsListahist
    Left = 456
    Top = 200
  end
  object cdsListahist: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 208
    object cdsListahistIdHist: TIntegerField
      FieldName = 'IdHist'
      Visible = False
    end
    object cdsListahistIdTipoHist: TIntegerField
      FieldName = 'IdTipoHist'
      Visible = False
    end
    object cdsListahistIdOrdem: TIntegerField
      FieldName = 'IdOrdem'
      Visible = False
    end
    object cdsListahistDescHist: TStringField
      DisplayLabel = 'Descri'#231#227'o do hist'#243'rico'
      DisplayWidth = 50
      FieldName = 'DescHist'
      Size = 4000
    end
    object cdsListahistDescTipoHist: TStringField
      DisplayLabel = 'Tipo de hist'#243'rico'
      FieldName = 'DescTipoHist'
      Size = 50
    end
    object cdsListahistUsuário: TStringField
      FieldName = 'Usu'#225'rio'
      Size = 50
    end
    object cdsListahistIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
      Visible = False
    end
  end
  object actlstAdicHist: TActionList
    Images = ilAdicList
    Left = 341
    Top = 384
    object actAdicHist: TAction
      Caption = 'Adicionar'
      ImageIndex = 0
      OnExecute = actAdicHistExecute
    end
  end
  object ilAdicList: TImageList
    Left = 357
    Top = 336
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
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B008585850000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B005C5C5C005B5B5B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B0000000000ACACAC005B5B5B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5B5B009898
      9800B4B4B400000000000000000000000000A3A3A3009B9B9B009B9B9B009B9B
      9B00989898005B5B5B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081818100B5B5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BBBBBB0083838300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD0075757500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD0075757500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      0000000000000000000000000000000000005B5B5B005B5B5B00C5C5C5000000
      000000000000CDCDCD0075757500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      0000000000000000000000000000000000005B5B5B005B5B5B005B5B5B006A6A
      6A0000000000CDCDCD0075757500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      000000000000000000000000000000000000C2C2C2005B5B5B005B5B5B005B5B
      5B00E1E1E100CDCDCD0075757500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500CDCDCD000000
      00000000000000000000000000000000000000000000636363005B5B5B005B5B
      5B005B5B5B00E5E5E5008B8B8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5B5B00A8A8
      A800BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00DDDDDD005B5B
      5B005B5B5B005B5B5B0067676700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009393
      93008585850085858500858585008585850085858500858585009D9D9D00DDDD
      DD005B5B5B005B5B5B005B5B5B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000646464005B5B5B005B5B5B00000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFF000000000000F3FF000000000000
      F1FF000000000000F4FF000000000000C7030000000000009FF9000000000000
      9FF90000000000009FF90000000000009F190000000000009F09000000000000
      9F010000000000009F81000000000000C001000000000000E001000000000000
      FFF1000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
