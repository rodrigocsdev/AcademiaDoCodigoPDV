object ComponentListaFechamentoCaixa: TComponentListaFechamentoCaixa
  Left = 0
  Top = 0
  Width = 500
  Height = 40
  TabOrder = 0
  object Shape1: TShape
    AlignWithMargins = True
    Left = 0
    Top = 37
    Width = 500
    Height = 1
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Align = alBottom
    ExplicitTop = -25
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 37
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    ExplicitLeft = 120
    ExplicitTop = 16
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel2: TPanel
      Left = 468
      Top = 5
      Width = 27
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 310
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 27
        Height = 27
        Align = alClient
        Caption = '-'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clScrollBar
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = 16
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlTipoPagamento: TPanel
      Left = 5
      Top = 5
      Width = 228
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Dinheiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clScrollBar
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pnlValor: TPanel
      Left = 233
      Top = 5
      Width = 235
      Height = 27
      Align = alClient
      BevelOuter = bvNone
      Caption = 'R$ 15.000,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clScrollBar
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 280
      ExplicitTop = 8
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
end
