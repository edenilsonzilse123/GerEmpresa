object frmLeXmlAtualiza: TfrmLeXmlAtualiza
  Left = 0
  Top = 0
  Caption = 'frmLeXmlAtualiza'
  ClientHeight = 58
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
  object lblLendoXml: TLabel
    Left = 8
    Top = 8
    Width = 174
    Height = 16
    Caption = 'Lendo xml de atualiza'#231#227'o...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gLendoXml: TGauge
    Left = 8
    Top = 27
    Width = 429
    Height = 25
    Progress = 0
  end
  object xmlAtualiza: TXMLDocument
    Active = True
    Left = 248
    Top = 8
  end
end
