object FmReportesVta: TFmReportesVta
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FmReportesVta'
  ClientHeight = 614
  ClientWidth = 1226
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 614
    Align = alLeft
    ControlCollection = <
      item
        Control = Bc_CtaCte
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = BC_Comprobvta
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = Button1
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = Bc_RepCodBarras
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end>
    TabOrder = 0
    object Bc_CtaCte: TButton
      AlignWithMargins = True
      Left = 4
      Top = 5
      Width = 129
      Height = 40
      Margins.Top = 4
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Cuenta Cte.'
      ImageIndex = 4
      TabOrder = 3
      OnClick = Bc_CtaCteClick
    end
    object BC_Comprobvta: TButton
      AlignWithMargins = True
      Left = 4
      Top = 49
      Width = 129
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Comprob. Vta.'
      TabOrder = 2
      OnClick = BC_ComprobvtaClick
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 93
      Width = 129
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'C'#243'digos de barra'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Bc_RepCodBarras: TButton
      AlignWithMargins = True
      Left = 4
      Top = 137
      Width = 129
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Lista de Precios'
      TabOrder = 0
      OnClick = Bc_RepCodBarrasClick
    end
  end
  object Panel1: TPanel
    Left = 137
    Top = 0
    Width = 1089
    Height = 614
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
  end
end
