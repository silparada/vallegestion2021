object FmCtaCteClientes: TFmCtaCteClientes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cuenta Corriente'
  ClientHeight = 416
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object ListView1: TListView
    Left = 0
    Top = 73
    Width = 837
    Height = 306
    Align = alClient
    Columns = <
      item
        Caption = 'IdMovim'
        Width = 60
      end
      item
        Caption = 'Fecha'
        Width = 75
      end
      item
        Caption = 'FechaVto'
        Width = 75
      end
      item
        Caption = 'Tipo'
        Width = 20
      end
      item
        Caption = 'Comprobante'
        Width = 180
      end
      item
        Alignment = taRightJustify
        Caption = 'Importe'
        Width = 60
      end
      item
        Alignment = taRightJustify
        Caption = 'Saldo'
        Width = 60
      end
      item
        Caption = 'Observaciones'
        Width = 200
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GridLines = True
    HideSelection = False
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 837
    Height = 33
    ButtonHeight = 30
    ButtonWidth = 38
    Caption = 'ToolBar1'
    GradientEndColor = clHotLight
    GradientStartColor = clAqua
    HotTrackColor = clBtnFace
    Images = FmMain.VImg_24
    TabOrder = 1
    Transparent = False
    object TB_readdb: TToolButton
      Left = 0
      Top = 0
      Caption = 'TB_readBd'
      ImageIndex = 28
      OnClick = TB_readdbClick
    end
    object TB_Print: TToolButton
      Left = 38
      Top = 0
      Caption = 'TB_Print'
      ImageIndex = 30
      OnClick = TB_PrintClick
    end
    object BC_CSvExport: TToolButton
      Left = 76
      Top = 0
      Caption = 'BC_CSvExport'
      ImageIndex = 36
    end
    object TB_PdfExport: TToolButton
      Left = 114
      Top = 0
      Caption = 'TB_PdfExport'
      ImageIndex = 22
      OnClick = TB_PdfExportClick
    end
    object ToolButton1: TToolButton
      Left = 152
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 34
      OnClick = ToolButton1Click
    end
    object TB_Exit: TToolButton
      Left = 190
      Top = 0
      Caption = 'TB_exit'
      ImageIndex = 27
      OnClick = TB_ExitClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 837
    Height = 40
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    object Lb_idCliente: TLabel
      Left = 4
      Top = 19
      Width = 70
      Height = 15
      AutoSize = False
      Caption = 'Lb_idCliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Lb_NombreClie: TLabel
      Left = 80
      Top = 19
      Width = 441
      Height = 15
      AutoSize = False
      Caption = 'Lb_NombreClie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 379
    Width = 837
    Height = 37
    Align = alBottom
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 3
    object Label10: TLabel
      Left = 599
      Top = 16
      Width = 28
      Height = 15
      Caption = 'Total '
      Transparent = True
    end
    object Ed_Saldo: TEdit
      Left = 632
      Top = 6
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
  end
  object frxReport1: TfrxReport
    Version = '6.4.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42543.534872384300000000
    ReportOptions.LastChange = 44202.644400706020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 236
    Top = 176
    Datasets = <
      item
        DataSet = StringDS
        DataSetName = 'StringDS'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'SaldoTotal'
        Value = ''
      end
      item
        Name = 'NroCta'
        Value = ''
      end
      item
        Name = 'Nombre'
        Value = ''
      end>
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
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
        Height = 166.299320000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Logo: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 226.771653540000000000
          Height = 75.590551180000000000
          Frame.Typ = []
          KeepAspectRatio = False
          HightQuality = True
          Transparent = True
          TransparentColor = clSkyBlue
        end
        object Me_EmpresaName: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
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
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Me_EmpresaDatos1: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 26.456710000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Direcci'#243'n')
          ParentFont = False
        end
        object Me_EmpresaDatos2: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 43.464595000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel'#233'fonos')
          ParentFont = False
        end
        object ME_ReportTitulo: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Resumen de Cuenta')
          ParentFont = False
          VAlign = vaCenter
        end
        object Me_NroCta: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nro. Cta. [NroCta]')
          ParentFont = False
        end
        object Me_Nombre: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 136.063080000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nombre: [Nombre]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 52.913420000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 72.607137070000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 80.166197070000000000
          Top = 15.118120000000000000
          Width = 71.502847450000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Vencimiento')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 193.243874530000000000
          Top = 15.118120000000000000
          Width = 146.741153320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Comprobante')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 411.796097840000000000
          Top = 15.118120000000000000
          Width = 60.472443390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 346.883571160000000000
          Top = 15.118120000000000000
          Width = 60.472443390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Importe')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 15.118120000000000000
          Width = 33.355253320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 15.118120000000000000
          Width = 241.229403320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Observaciones')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        DataSet = StringDS
        DataSetName = 'StringDS'
        RowCount = 0
        OnMasterDetail = 'MasterData1OnMasterDetail'
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          DataSetName = 'Customers'
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = -370606080
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 72.607137070000000000
          Height = 15.118120000000000000
          DataField = 'Fecha'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Fecha"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Width = 61.268547070000000000
          Height = 15.118120000000000000
          DataField = 'Saldo'
          DataSet = StringDS
          DataSetName = 'StringDS'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StringDS."Saldo"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 72.607137070000000000
          Height = 15.118120000000000000
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = []
          Highlight.Condition = '(<StringDS."FechaVto"> < Now ) AND ( <StringDS."Saldo"> > 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."FechaVto"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Width = 34.811837070000000000
          Height = 15.118120000000000000
          DataField = 'Tipo'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Tipo"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Width = 148.197737070000000000
          Height = 15.118120000000000000
          DataField = 'Comprobante'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Comprobante"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Width = 61.268547070000000000
          Height = 15.118120000000000000
          DataSet = StringDS
          DataSetName = 'StringDS'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StringDS."Importe"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 242.685987070000000000
          Height = 15.118120000000000000
          DataField = 'Observaciones'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Observaciones"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 16.118120000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
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
          Left = 559.370440000000000000
          Top = 1.000000000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
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
        object Line2: TfrxLineView
          AllowVectorExport = True
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 3.779530000000000000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<StringDS."Saldo">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object StringDS: TfrxUserDataSet
    UserName = 'StringDS'
    Fields.Strings = (
      'Fecha'
      'FechaVto'
      'Tipo'
      'Comprobante'
      'Importe'
      'Saldo'
      'Observaciones')
    OnGetValue = StringDSGetValue
    Left = 344
    Top = 176
  end
  object frxUserDataSet1: TfrxUserDataSet
    UserName = 'frxUserDataSet1'
    OnGetValue = frxUserDataSet1GetValue
    Left = 424
    Top = 176
  end
end
