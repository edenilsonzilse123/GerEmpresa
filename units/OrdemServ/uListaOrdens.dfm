inherited frmListaOrdens: TfrmListaOrdens
  Caption = 'frmListaOrdens'
  OnActivate = FormActivate
  ExplicitTop = -101
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Visible = False
  end
  inherited pnlOpcoes: TPanel
    object dbgrdListaOrdens: TDBGrid
      Left = 1
      Top = 1
      Width = 692
      Height = 509
      Align = alClient
      DataSource = dsListaOrdens
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdListaOrdensDrawColumnCell
      OnDblClick = dbgrdListaOrdensDblClick
    end
    object pnlLegenda: TPanel
      Left = 1
      Top = 510
      Width = 692
      Height = 60
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = -4
      ExplicitTop = 516
      object shpCriadas: TShape
        Left = 5
        Top = 6
        Width = 15
        Height = 15
        Brush.Color = clMoneyGreen
        Pen.Color = clMoneyGreen
      end
      object lblOSCriada: TLabel
        Left = 26
        Top = 7
        Width = 48
        Height = 13
        Caption = 'OS Criada'
      end
      object shpEmAndamento: TShape
        Left = 5
        Top = 26
        Width = 15
        Height = 15
        Brush.Color = 16776176
        Pen.Color = 16776176
      end
      object lblOSEmAndamento: TLabel
        Left = 26
        Top = 27
        Width = 88
        Height = 13
        Caption = 'OS Em andamento'
      end
      object shpSuspensa: TShape
        Left = 120
        Top = 6
        Width = 15
        Height = 15
        Brush.Color = clPurple
        Pen.Color = clPurple
      end
      object lblOSSuspensa: TLabel
        Left = 141
        Top = 6
        Width = 63
        Height = 13
        Caption = 'OS Suspensa'
      end
      object shpCancelada: TShape
        Left = 120
        Top = 27
        Width = 15
        Height = 15
        Brush.Color = clRed
        Pen.Color = clRed
      end
      object lblOSCancelada: TLabel
        Left = 141
        Top = 28
        Width = 67
        Height = 13
        Caption = 'OS Cancelada'
      end
      object shpFinalizada: TShape
        Left = 214
        Top = 6
        Width = 15
        Height = 15
        Brush.Color = clTeal
        Pen.Color = clTeal
      end
      object lblOSFinalizada: TLabel
        Left = 235
        Top = 6
        Width = 64
        Height = 13
        Caption = 'OS Finalizada'
      end
      object chkMostrarSomente: TCheckBox
        Left = 312
        Top = 6
        Width = 241
        Height = 17
        Caption = 'Mostrar somente OSs Criadas/Em andamento'
        TabOrder = 0
        OnClick = chkMostrarSomenteClick
      end
    end
  end
  object zqListaOrdens: TZQuery
    Connection = DM.conDados
    Active = True
    SQL.Strings = (
      'SELECT * FROM TB_ORDEMSERV_V')
    Params = <>
    Left = 280
    Top = 120
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
    Left = 424
    Top = 320
  end
end
