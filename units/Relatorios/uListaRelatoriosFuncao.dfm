object frmListaRelatorios: TfrmListaRelatorios
  Left = 0
  Top = 0
  Caption = 'frmListaRelatorios'
  ClientHeight = 81
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblListaDeRelatorios: TLabel
    Left = 8
    Top = 5
    Width = 85
    Height = 13
    Caption = 'Lista de relat'#243'rios'
  end
  object cbbListaRelatorios: TComboBox
    Left = 8
    Top = 21
    Width = 429
    Height = 21
    TabOrder = 0
  end
  object btnUsar: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 1
    OnClick = btnUsarClick
  end
end
