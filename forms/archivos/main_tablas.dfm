object FmMainTablas: TFmMainTablas
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FmMainTablas'
  ClientHeight = 512
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 113
    Height = 49
    Caption = 'Backup'
    Style = bsCommandLink
    TabOrder = 0
  end
  object CardPanel1: TCardPanel
    Left = 145
    Top = 0
    Width = 696
    Height = 512
    Align = alClient
    ActiveCard = Card3
    Caption = 'CardPanel1'
    TabOrder = 1
    object Card1: TCard
      Left = 1
      Top = 1
      Width = 694
      Height = 510
      Caption = 'Card1'
      CardIndex = 0
      TabOrder = 0
    end
    object Card2: TCard
      Left = 1
      Top = 1
      Width = 694
      Height = 510
      Caption = 'Card2'
      CardIndex = 1
      TabOrder = 1
    end
    object Card3: TCard
      Left = 1
      Top = 1
      Width = 694
      Height = 510
      Caption = 'Card3'
      CardIndex = 2
      TabOrder = 2
    end
    object Card4: TCard
      Left = 1
      Top = 1
      Width = 694
      Height = 510
      Caption = 'Card4'
      CardIndex = 3
      TabOrder = 3
    end
  end
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 512
    Align = alLeft
    ControlCollection = <
      item
        Control = Bc_Ciudades
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = BC_Vendedores
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = BC_FormasPAgo
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end
      item
        Control = Bc_Usuarios
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpTop
      end>
    TabOrder = 2
    object Bc_Ciudades: TButton
      AlignWithMargins = True
      Left = 4
      Top = 5
      Width = 137
      Height = 40
      Margins.Top = 4
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Ciudades'
      ImageIndex = 4
      TabOrder = 3
      OnClick = Bc_CiudadesClick
    end
    object BC_Vendedores: TButton
      AlignWithMargins = True
      Left = 4
      Top = 49
      Width = 137
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Vendedores'
      TabOrder = 2
      OnClick = BC_VendedoresClick
    end
    object BC_FormasPAgo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 93
      Width = 137
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Formas Pago'
      TabOrder = 1
      OnClick = BC_FormasPAgoClick
    end
    object Bc_Usuarios: TButton
      AlignWithMargins = True
      Left = 4
      Top = 137
      Width = 137
      Height = 40
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Caption = 'Usuarios'
      TabOrder = 0
      OnClick = Bc_UsuariosClick
    end
  end
end
