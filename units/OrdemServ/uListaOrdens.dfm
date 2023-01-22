inherited frmListaOrdens: TfrmListaOrdens
  Caption = 'frmListaOrdens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Visible = False
  end
  inherited pnlOpcoes: TPanel
    object pnlLegenda: TPanel
      Left = 568
      Top = 1
      Width = 125
      Height = 569
      Align = alRight
      TabOrder = 0
      object shpCriadas: TShape
        Left = 6
        Top = 25
        Width = 15
        Height = 15
        Brush.Color = clMoneyGreen
        Pen.Color = clMoneyGreen
      end
      object lblOSCriada: TLabel
        Left = 26
        Top = 26
        Width = 48
        Height = 13
        Caption = 'OS Criada'
      end
      object shpEmAndamento: TShape
        Left = 6
        Top = 63
        Width = 15
        Height = 15
        Brush.Color = 16776176
        Pen.Color = 16776176
      end
      object lblOSEmAndamento: TLabel
        Left = 26
        Top = 64
        Width = 88
        Height = 13
        Caption = 'OS Em andamento'
      end
      object shpSuspensa: TShape
        Left = 6
        Top = 44
        Width = 15
        Height = 15
        Brush.Color = clPurple
        Pen.Color = clPurple
      end
      object lblOSSuspensa: TLabel
        Left = 26
        Top = 45
        Width = 63
        Height = 13
        Caption = 'OS Suspensa'
      end
      object shpCancelada: TShape
        Left = 6
        Top = 84
        Width = 15
        Height = 15
        Brush.Color = clRed
        Pen.Color = clRed
      end
      object lblOSCancelada: TLabel
        Left = 27
        Top = 85
        Width = 67
        Height = 13
        Caption = 'OS Cancelada'
      end
      object shpFinalizada: TShape
        Left = 6
        Top = 6
        Width = 15
        Height = 15
        Brush.Color = clTeal
        Pen.Color = clTeal
      end
      object lblOSFinalizada: TLabel
        Left = 26
        Top = 7
        Width = 64
        Height = 13
        Caption = 'OS Finalizada'
      end
      object chkMostrarSomente: TCheckBox
        Left = 6
        Top = 104
        Width = 114
        Height = 73
        Caption = 'Mostrar somente OSs Criadas/Em andamento'
        TabOrder = 0
        WordWrap = True
        OnClick = chkMostrarSomenteClick
      end
    end
    object pnlListar: TPanel
      Left = 1
      Top = 1
      Width = 567
      Height = 569
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 200
      ExplicitTop = 304
      ExplicitWidth = 185
      ExplicitHeight = 41
      object dbgrdListaOrdens: TDBGrid
        Left = 0
        Top = 0
        Width = 567
        Height = 285
        Align = alTop
        DataSource = dsListaOrdens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgrdListaOrdensCellClick
        OnDrawColumnCell = dbgrdListaOrdensDrawColumnCell
        OnDblClick = dbgrdListaOrdensDblClick
      end
      object dbgrdListaHists: TDBGrid
        Left = 0
        Top = 285
        Width = 567
        Height = 284
        Align = alClient
        DataSource = dsListaHists
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  inherited ilBase: TImageList
    Left = 115
    Top = 16
  end
  inherited actlstBase: TActionList
    Left = 16
    Top = 16
  end
  object zqListaOrdens: TZQuery
    Connection = DM.conDados
    SQL.Strings = (
      'SELECT * FROM TB_ORDEMSERV_V')
    Params = <>
    Left = 181
    Top = 16
    object cdsListaOrdensid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 1
      FieldName = 'id'
      Required = True
    end
    object dtmfldListaOrdensdt_cadastro: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      DisplayWidth = 1
      FieldName = 'dt_cadastro'
    end
    object dtmfldListaOrdensdt_atualizacao: TDateTimeField
      DisplayLabel = #218'ltima atualiza'#231#227'o'
      DisplayWidth = 1
      FieldName = 'dt_atualizacao'
    end
    object wdstrngfldListaOrdenstitulo: TWideStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 35
      FieldName = 'titulo'
      Size = 50
    end
    object wdstrngfldListaOrdensdesc_os: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'desc_os'
      Size = 4000
    end
    object cdsListaOrdensenc_os_usuario: TIntegerField
      DisplayWidth = 30
      FieldName = 'enc_os_usuario'
      Visible = False
    end
    object cdsListaOrdensstatus: TIntegerField
      DisplayLabel = 'StatusNum'
      DisplayWidth = 1
      FieldName = 'status'
      Visible = False
    end
    object wdstrngfldListaOrdensds_status: TWideStringField
      DisplayLabel = 'Status'
      DisplayWidth = 8
      FieldName = 'ds_status'
      Size = 50
    end
  end
  object dsListaOrdens: TDataSource
    DataSet = zqListaOrdens
    Left = 82
    Top = 16
  end
  object zqListaHists: TZQuery
    Connection = DM.conDados
    Active = True
    SQL.Strings = (
      'SELECT * FROM TB_HISTORICOOS_LISTA_V')
    Params = <>
    Left = 148
    Top = 16
    object dtmfldListaHistsdt_cadastro: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      DisplayWidth = 1
      FieldName = 'dt_cadastro'
    end
    object cdsListaHistsid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object cdsListaHistsid_tipohist: TIntegerField
      FieldName = 'id_tipohist'
      Visible = False
    end
    object cdsListaHistsid_ordem: TIntegerField
      FieldName = 'id_ordem'
      Visible = False
    end
    object cdsListaHistsid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Visible = False
    end
    object wdstrngfldListaHistsdesc_historico: TWideStringField
      DisplayLabel = 'Descri'#231#227'o do hist'#243'rico'
      DisplayWidth = 35
      FieldName = 'desc_historico'
      Size = 4000
    end
    object dtmfldListaHistsdt_atualizacao: TDateTimeField
      DisplayWidth = 1
      FieldName = 'dt_atualizacao'
      Visible = False
    end
    object wdstrngfldListaHistsds_tipohist: TWideStringField
      DisplayLabel = 'Tipo de hist'#243'rico'
      DisplayWidth = 20
      FieldName = 'ds_tipohist'
      Size = 50
    end
    object wdstrngfldListaHistsusuario: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 20
      FieldName = 'usuario'
      Size = 50
    end
  end
  object dsListaHists: TDataSource
    DataSet = zqListaHists
    Left = 49
    Top = 16
  end
end
