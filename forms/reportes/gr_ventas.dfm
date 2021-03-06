object Fm_GRVentas: TFm_GRVentas
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Grafico de Ventas'
  ClientHeight = 505
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 1041
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = -2
      Width = 41
      Height = 15
      Caption = 'Periodo'
    end
    object Label2: TLabel
      Left = 88
      Top = 2
      Width = 30
      Height = 15
      Caption = 'T'#237'tulo'
    end
    object CC_Anio: TComboBox
      Left = 4
      Top = 13
      Width = 65
      Height = 23
      TabOrder = 0
      Text = '2006'
      Items.Strings = (
        '1996'
        '1997'
        '1998'
        '1999'
        '2000'
        '2001'
        '2002'
        '2003'
        '2004'
        '2005'
        '2006'
        '2007'
        '2008'
        '2009'
        '2010')
    end
    object Ed_Titulo: TEdit
      Left = 88
      Top = 15
      Width = 345
      Height = 21
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 1041
    Height = 432
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Ventas Totales'
      object GR_VentasTotales: TChart
        Left = 0
        Top = 0
        Width = 1033
        Height = 402
        LeftWall.Color = 16777088
        Legend.HorizMargin = 5
        Legend.Inverted = True
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsPlain
        Legend.Title.Brush.Gradient.Visible = True
        Legend.TopPos = 13
        Legend.VertSpacing = 1
        Legend.Visible = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'Ventas Totales')
        Chart3DPercent = 10
        View3D = False
        View3DOptions.Zoom = 102
        Align = alClient
        Color = clWhite
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          25
          15
          25)
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          BarBrush.Gradient.EndColor = clLime
          BarBrush.Gradient.MidColor = 16059031
          BarBrush.Gradient.StartColor = 14540754
          BarPen.Visible = False
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 13556735
          Marks.Brush.Gradient.MidColor = 14739177
          Marks.Brush.Gradient.StartColor = 16774122
          Marks.Font.Style = [fsBold]
          Marks.Shadow.Color = 8947848
          Marks.Shadow.Visible = False
          Marks.Style = smsValue
          Marks.BackColor = 8454143
          Marks.Symbol.Shadow.Visible = False
          Marks.Symbol.ShapeStyle = fosRoundRectangle
          Marks.Color = 8454143
          SeriesColor = 11599792
          ValueFormat = '0,0'
          BarStyle = bsArrow
          Gradient.EndColor = clLime
          Gradient.MidColor = 16059031
          Gradient.StartColor = 14540754
          Shadow.Color = 8947848
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            00060000003D0AD7A37084844000000000005C82400000000000D87D40000000
            0000A07E400000000000487C400000000000607840}
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ventas vs. Ingresos'
      ImageIndex = 1
      object Gr_VentasVsIngr: TChart
        Left = 0
        Top = 0
        Width = 1033
        Height = 402
        LeftWall.Color = 16777088
        Legend.HorizMargin = 10
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsPlain
        Legend.Title.Brush.Gradient.Visible = True
        Legend.TopPos = 13
        Legend.VertSpacing = 5
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold, fsItalic]
        Title.Text.Strings = (
          'Ventas vs. Ingresos')
        Chart3DPercent = 10
        View3D = False
        View3DOptions.Zoom = 102
        Align = alClient
        Color = clWhite
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          25
          15
          25)
        ColorPaletteIndex = 13
        object BarSeries2: TBarSeries
          BarBrush.Gradient.EndColor = clLime
          BarBrush.Gradient.StartColor = 4227072
          BarPen.Visible = False
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 13556735
          Marks.Brush.Gradient.MidColor = 14739177
          Marks.Brush.Gradient.StartColor = 16774122
          Marks.Font.Style = [fsBold]
          Marks.Shadow.Color = 8947848
          Marks.Shadow.Visible = False
          Marks.Style = smsValue
          Marks.BackColor = 8454143
          Marks.Symbol.Shadow.Visible = False
          Marks.Symbol.ShapeStyle = fosRoundRectangle
          Marks.Color = 8454143
          SeriesColor = 47872
          Title = 'Ventas'
          ValueFormat = '0,0'
          Gradient.EndColor = clLime
          Gradient.StartColor = 4227072
          Shadow.Color = 8947848
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            00060000003D0AD7A37084844000000000005C82400000000000E07D40000000
            0000A07E400000000000487C400000000000607840}
        end
        object BarSeries3: TBarSeries
          BarBrush.Gradient.EndColor = clRed
          BarBrush.Gradient.StartColor = 16711808
          BarPen.Visible = False
          Marks.Font.Style = [fsBold]
          Marks.Shadow.Color = 8553090
          Marks.Shadow.Visible = False
          Marks.BackColor = clAqua
          Marks.Color = clAqua
          SeriesColor = 33023
          Title = 'Ingresos'
          ValueFormat = '#,##0'
          Gradient.EndColor = clRed
          Gradient.StartColor = 16711808
          Shadow.Color = 8487297
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            0006000000B5847CD073D36840CAA145B6F3696040AAF1D24D62505C40F4FDD4
            78E99E5840D5C56D3400D35040E7FBA9F192706140}
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Contado vs. Cta. Cte.'
      ImageIndex = 2
      object Gr_ContadoCtaCte: TChart
        Left = 0
        Top = 0
        Width = 1033
        Height = 402
        LeftWall.Color = 16777088
        Legend.HorizMargin = 5
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsPlain
        Legend.Title.Brush.Gradient.Visible = True
        Legend.TopPos = 13
        Legend.VertSpacing = 1
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold, fsItalic]
        Title.Text.Strings = (
          'Ventas Contado vs. Cta.Cte.')
        Chart3DPercent = 10
        View3D = False
        View3DOptions.Zoom = 102
        Align = alClient
        Color = clWhite
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          25
          15
          25)
        ColorPaletteIndex = 13
        object BarSeries1: TBarSeries
          BarBrush.Gradient.EndColor = clLime
          BarBrush.Gradient.StartColor = 4227072
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 13556735
          Marks.Brush.Gradient.MidColor = 14739177
          Marks.Brush.Gradient.StartColor = 16774122
          Marks.Font.Style = [fsBold]
          Marks.Shadow.Color = 8947848
          Marks.Shadow.Visible = False
          Marks.Style = smsValue
          Marks.BackColor = 8454143
          Marks.Symbol.Shadow.Visible = False
          Marks.Symbol.ShapeStyle = fosRoundRectangle
          Marks.Color = 8454143
          SeriesColor = 11206570
          Title = 'Contado'
          ValueFormat = '0,0'
          Gradient.EndColor = clLime
          Gradient.StartColor = 4227072
          Shadow.Color = 8947848
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            00060000003D0AD7A37084844000000000005C82400000000000E07D40000000
            0000A07E400000000000487C400000000000607840}
        end
        object Series3: TBarSeries
          BarBrush.Gradient.EndColor = clAqua
          BarBrush.Gradient.StartColor = 8404992
          SeriesColor = 16777115
          Title = 'Cta.Cte.'
          Gradient.EndColor = clAqua
          Gradient.StartColor = 8404992
          Shadow.Color = 8487297
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            0006000000B5847CD073D36840CAA145B6F3696040AAF1D24D62505C40F4FDD4
            78E99E5840D5C56D3400D35040E7FBA9F192706140}
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1041
    Height = 33
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = FmMain.VImg_24
    TabOrder = 2
    object TB_LoadDB: TToolButton
      Left = 0
      Top = 0
      Caption = 'TB_LoadDB'
      ImageIndex = 28
      OnClick = TB_LoadDBClick
    end
    object TB_Copy: TToolButton
      Left = 31
      Top = 0
      Caption = 'TB_Copy'
      ImageIndex = 37
      OnClick = TB_CopyClick
    end
    object TB_Print: TToolButton
      Left = 62
      Top = 0
      Caption = 'TB_Print'
      ImageIndex = 30
      OnClick = TB_PrintClick
    end
  end
  object frxReport1: TfrxReport
    Version = '6.4.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42543.534872384300000000
    ReportOptions.LastChange = 43864.422689201390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReport1BeforePrint
    Left = 664
    Top = 32
    Datasets = <>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 83.149660000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object ME_ReportTitulo: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11425536
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'T'#237'tulo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Logo: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 226.771653540000000000
          Height = 75.590551180000000000
          Frame.Typ = []
          KeepAspectRatio = False
          HightQuality = False
          Transparent = True
          TransparentColor = clSkyBlue
        end
        object Me_EmpresaName: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EMPRESA')
          ParentFont = False
        end
        object Me_EmpresaDatos1: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Top = 41.574830000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'datos1')
          ParentFont = False
        end
        object Me_EmpresaDatos2: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Top = 58.582715000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'datos2')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 31.236240000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 1.000000000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#]')
          ParentFont = False
        end
      end
      object Picture1: TfrxPictureView
        AllowVectorExport = True
        Left = 3.779530000000000000
        Top = 162.519790000000000000
        Width = 1046.929810000000000000
        Height = 517.795610000000000000
        Frame.Typ = []
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
    end
  end
end
