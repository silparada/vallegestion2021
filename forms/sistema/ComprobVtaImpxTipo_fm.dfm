object FmComprobImpuestos: TFmComprobImpuestos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Comprobantes / Impuestos'
  ClientHeight = 344
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label13: TLabel
    Left = 8
    Top = 40
    Width = 116
    Height = 15
    Caption = 'Tipo de Comprobante'
  end
  object Lv_ImpComp: TListView
    Left = 8
    Top = 81
    Width = 537
    Height = 255
    Checkboxes = True
    Columns = <
      item
        Caption = 'id Impuesto'
        Width = 80
      end
      item
        Caption = 'Tipo'
        Width = 120
      end
      item
        Caption = 'Descripci'#243'n'
        Width = 300
      end>
    Ctl3D = False
    GridLines = True
    Groups = <
      item
        GroupID = 0
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        GroupID = 1
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        GroupID = 2
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        GroupID = 3
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end>
    HideSelection = False
    Items.ItemData = {
      05720000000100000000000000FFFFFFFFFFFFFFFF04000000FFFFFFFF000000
      0007520045004300490042004F005300034E002F004400000000000D53004900
      4E00200049004D0050005200450053004900D3004E000000000006500052004F
      005000490041000000000001300000000000FFFFFFFFFFFFFFFF}
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object CB_TipoComp: TComboBox
    Left = 8
    Top = 54
    Width = 185
    Height = 23
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clWhite
    Ctl3D = False
    ItemIndex = 0
    ParentCtl3D = False
    Sorted = True
    TabOrder = 1
    Text = 'Seleccionar Tipo de Comprobante'
    OnChange = CB_TipoCompChange
    Items.Strings = (
      'Seleccionar Tipo de Comprobante')
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 561
    Height = 33
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = FmMain.VImg_24
    TabOrder = 2
    object TB_Grabar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Grabar cambios'
      Caption = 'TB_Grabar'
      ImageIndex = 11
      OnClick = TB_GrabarClick
    end
    object TB_Exit: TToolButton
      Left = 31
      Top = 0
      Caption = 'TB_Exit'
      ImageIndex = 6
      OnClick = TB_ExitClick
    end
  end
end
