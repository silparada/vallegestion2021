object FmDashboard: TFmDashboard
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FmDashboard'
  ClientHeight = 499
  ClientWidth = 935
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 169
    Height = 84
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 982698
    Font.Height = -35
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
  end
  object Chart1: TChart
    Left = 16
    Top = 106
    Width = 169
    Height = 111
    AllowPanning = pmNone
    BackWall.Visible = False
    BottomWall.Visible = False
    LeftWall.Visible = False
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 0
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    AxisBehind = False
    Hover.Visible = False
    LeftAxis.Visible = False
    Pages.ScaleLastPage = False
    Panning.MouseWheel = pmwNone
    Shadow.Smooth = False
    Shadow.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Legend.Visible = False
      SeriesColor = clRed
      ShowInLegend = False
      LinePen.Color = clRed
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
