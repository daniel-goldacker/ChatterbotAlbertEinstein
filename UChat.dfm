object frmJohnHammond: TfrmJohnHammond
  Left = 198
  Top = 158
  BorderStyle = bsSingle
  Caption = ' Albert Einstein - Vers'#227'o 1.0'
  ClientHeight = 426
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 426
    Align = alLeft
    BorderStyle = bsSingle
    TabOrder = 0
    object pnImagem: TPanel
      Left = 1
      Top = 1
      Width = 443
      Height = 368
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object WebBrowser: TWebBrowser
        Left = 1
        Top = 1
        Width = 437
        Height = 362
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C0000002A2D00006A2500000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object painel: TPanel
      Left = 1
      Top = 369
      Width = 443
      Height = 52
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel2: TPanel
        Left = 360
        Top = 2
        Width = 81
        Height = 48
        Align = alRight
        TabOrder = 0
        DesignSize = (
          81
          48)
        object btEnviar: TButton
          Left = 6
          Top = 9
          Width = 67
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Enviar'
          Default = True
          TabOrder = 0
          OnClick = btEnviarClick
        end
      end
      object mmPergunta: TMemo
        Left = 2
        Top = 2
        Width = 358
        Height = 48
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        WantReturns = False
      end
    end
  end
  object Panel3: TPanel
    Left = 449
    Top = 0
    Width = 640
    Height = 426
    Align = alClient
    TabOrder = 1
    object mmDados: TMemo
      Left = 1
      Top = 33
      Width = 638
      Height = 392
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 32
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 1
      object QtdPerguntas: TLabel
        Left = 136
        Top = 0
        Width = 20
        Height = 20
        Caption = 'as'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 3
        Width = 133
        Height = 16
        Caption = 'Foram carregadas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 192
        Top = 3
        Width = 74
        Height = 16
        Caption = 'perguntas.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 1064
    Top = 136
    object Sobre1: TMenuItem
      Caption = 'Sobre'
      OnClick = Sobre1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
