object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoesPrin: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 65
    Align = alTop
    TabOrder = 0
    object btnOrdemServ: TBitBtn
      Left = 1
      Top = 1
      Width = 96
      Height = 63
      Align = alLeft
      Caption = 'Ordem Servi'#231'o'
      TabOrder = 0
      OnClick = btnOrdemServClick
    end
  end
end