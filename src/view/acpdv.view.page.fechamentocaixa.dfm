object PageFechamentoCaixa: TPageFechamentoCaixa
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 240
  BorderStyle = bsNone
  Caption = 'PageFechamentoCaixa'
  ClientHeight = 710
  ClientWidth = 1190
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContainer: TPanel
    AlignWithMargins = True
    Left = 304
    Top = 128
    Width = 593
    Height = 474
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 593
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Confer'#234'ncia de Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7119398
      Font.Height = -53
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 53
      Width = 593
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Informe os Valores Recebidos no Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6708056
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 80
      Width = 587
      Height = 391
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 20
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 2
      ExplicitHeight = 326
      object Panel1: TPanel
        Left = 10
        Top = 20
        Width = 567
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel5: TPanel
          Left = 506
          Top = 0
          Width = 61
          Height = 61
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 416
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 61
            Height = 61
            Align = alClient
            Brush.Color = 7119398
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitTop = 24
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 61
            Height = 61
            Align = alClient
            Caption = '+'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton1Click
            ExplicitLeft = 16
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 506
          Height = 61
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 112
          ExplicitTop = 24
          ExplicitWidth = 185
          ExplicitHeight = 41
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 257
            Height = 61
            Align = alLeft
            BevelOuter = bvNone
            Padding.Left = 10
            Padding.Top = 15
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 0
            object ComboBox1: TComboBox
              Left = 10
              Top = 15
              Width = 237
              Height = 32
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel8: TPanel
            Left = 257
            Top = 0
            Width = 249
            Height = 61
            Align = alClient
            BevelOuter = bvNone
            Padding.Left = 10
            Padding.Top = 17
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 1
            ExplicitLeft = 328
            ExplicitTop = 16
            ExplicitWidth = 185
            ExplicitHeight = 41
            object Edit1: TEdit
              Left = 10
              Top = 17
              Width = 229
              Height = 34
              Align = alClient
              Alignment = taRightJustify
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 0
              Text = 'R$ 0,00'
              ExplicitTop = 15
              ExplicitHeight = 36
            end
          end
        end
      end
      object Panel9: TPanel
        Left = 10
        Top = 340
        Width = 567
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 144
        ExplicitTop = 152
        ExplicitWidth = 185
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 281
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Padding.Right = 5
          TabOrder = 0
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 276
            Height = 41
            Align = alClient
            Brush.Color = clSilver
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 64
            ExplicitTop = 24
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object SpeedButton3: TSpeedButton
            Left = 0
            Top = 0
            Width = 276
            Height = 41
            Align = alClient
            Caption = 'Cancelar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton3Click
            ExplicitLeft = 96
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel11: TPanel
          Left = 281
          Top = 0
          Width = 286
          Height = 41
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 5
          TabOrder = 1
          ExplicitLeft = 328
          ExplicitTop = 16
          ExplicitWidth = 185
          object Shape3: TShape
            Left = 5
            Top = 0
            Width = 281
            Height = 41
            Align = alClient
            Brush.Color = 7119398
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 40
            ExplicitTop = 16
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object SpeedButton2: TSpeedButton
            Left = 5
            Top = 0
            Width = 281
            Height = 41
            Align = alClient
            Caption = 'Confirmar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton2Click
            ExplicitLeft = 48
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object Panel12: TPanel
        Left = 10
        Top = 81
        Width = 567
        Height = 259
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 240
        ExplicitTop = 136
        ExplicitWidth = 185
        ExplicitHeight = 41
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 567
          Height = 259
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 64
          ParentColor = True
          TabOrder = 0
        end
      end
    end
  end
end
