object FmRp_Archivos: TFmRp_Archivos
  Left = 0
  Top = 0
  Caption = 'Reporte Clientes'
  ClientHeight = 198
  ClientWidth = 415
  Color = clWindow
  Ctl3D = False
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object Label13: TLabel
    Left = 8
    Top = 41
    Width = 31
    Height = 15
    Caption = 'T'#237'tulo'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 415
    Height = 33
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = FmMain.VImg_24
    TabOrder = 0
    object TB_Print: TToolButton
      Left = 0
      Top = 0
      Caption = 'TB_Print'
      ImageIndex = 30
      OnClick = TB_PrintClick
    end
    object TB_Excel: TToolButton
      Left = 31
      Top = 0
      Caption = 'TB_Excel'
      ImageIndex = 36
      OnClick = TB_ExcelClick
    end
    object TB_Pdf: TToolButton
      Left = 62
      Top = 0
      Caption = 'TB_Pdf'
      ImageIndex = 22
      OnClick = TB_PdfClick
    end
    object ToolButton5: TToolButton
      Left = 93
      Top = 0
      Width = 85
      Caption = 'ToolButton5'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object Tb_Exit: TToolButton
      Left = 178
      Top = 0
      Caption = 'Tb_Exit'
      ImageIndex = 27
    end
  end
  object Ed_Observ: TEdit
    Left = 8
    Top = 60
    Width = 389
    Height = 21
    Color = clSkyBlue
    Ctl3D = False
    MaxLength = 80
    ParentCtl3D = False
    TabOrder = 1
  end
  object frxReport1: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42543.534872384300000000
    ReportOptions.LastChange = 42549.446354131900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 144
    Datasets = <
      item
        DataSet = DS_Clientes
        DataSetName = 'DS_Clientes'
      end>
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
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Logo: TfrxPictureView
          AllowVectorExport = True
          Width = 196.535560000000000000
          Height = 71.811070000000000000
          Frame.Typ = []
          KeepAspectRatio = False
          HightQuality = False
          Transparent = True
          TransparentColor = clSkyBlue
        end
        object Me_EmpresaName: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
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
        object Me_EmpresaDirec: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 18.897650000000000000
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
        object Me_EmpresaTel: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 35.905535000000000000
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
        object Me_EmpresaWeb: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 52.913420000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'web / email')
          ParentFont = False
        end
        object ME_ReportTitulo: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Clientes')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = -3.779530000000000000
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
          Width = 38.591367070000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'IdCliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 46.150427070000000000
          Top = 15.118120000000000000
          Width = 158.432037450000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Nombre')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 208.361994530000000000
          Top = 15.118120000000000000
          Width = 165.638803320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Direcci'#243'n')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 566.096311160000000000
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
            'Contacto')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 15.118120000000000000
          Width = 101.386793320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel'#233'fono')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 15.118120000000000000
          Width = 78.709613320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ciudad')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = DS_Clientes
        DataSetName = 'DS_Clientes'
        RowCount = 0
        object DS_ClientesIDCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'IDCliente'
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."IDCliente"]')
          ParentFont = False
        end
        object DS_ClientesClientesNombre: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DataField = 'Clientes.Nombre'
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."Clientes.Nombre"]')
          ParentFont = False
        end
        object DS_ClientesDireccion: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 211.653680000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Clipped = False
          DataField = 'Direccion'
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."Direccion"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."Ciudades.Nombre"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataField = 'telefono'
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."telefono"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataField = 'Contacto1'
          DataSet = DS_Clientes
          DataSetName = 'DS_Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Clientes."Contacto1"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 31.236240000000000000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
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
          Left = 559.370440000000000000
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
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        Condition = 'Copy(<DS_Clientes."Clientes.Nombre">,1,1)'
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Copy(<DS_Clientes."Clientes.Nombre">,1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object DS_Clientes: TfrxDBDataset
    UserName = 'DS_Clientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IDCliente=IDCliente'
      'Tratamiento=Tratamiento'
      'Clientes.Nombre=Clientes.Nombre'
      'Direccion=Direccion'
      'Clientes.CodPostal=Clientes.CodPostal'
      'telefono=telefono'
      'FAX=FAX'
      'email=email'
      'TipoDoc=TipoDoc'
      'NroDoc=NroDoc'
      'HabCtaCte=HabCtaCte'
      'CategImpos=CategImpos'
      'UltimaVta=UltimaVta'
      'UltimoPago=UltimoPago'
      'ListaPrec=ListaPrec'
      'FormaPago=FormaPago'
      'DiasVto=DiasVto'
      'ShowObs=ShowObs'
      'Comprobxemail=Comprobxemail'
      'Contacto1=Contacto1'
      'TelCont1=TelCont1'
      'Contacto2=Contacto2'
      'TelCont2=TelCont2'
      'LimiteCredito=LimiteCredito'
      'Observaciones=Observaciones'
      'FechaAlta=FechaAlta'
      'UltimaAct=UltimaAct'
      'Ciudades.CodPostal=Ciudades.CodPostal'
      'Ciudades.Nombre=Ciudades.Nombre'
      'Provincia=Provincia')
    DataSet = ADODataSet1
    BCDToCurrency = False
    Left = 112
    Top = 96
  end
  object ADODataSet1: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'SELECT Clientes.*, Ciudades.* FROM Clientes INNER JOIN Ciudades ' +
      'ON Clientes.CodPostal=Ciudades.CodPostal '#13#10'ORDER BY Clientes.Nom' +
      'bre'
    CommandType = cmdUnknown
    Parameters = <>
    Left = 40
    Top = 144
    object ADODataSet1IDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object ADODataSet1Tratamiento: TWideStringField
      FieldName = 'Tratamiento'
      Size = 4
    end
    object ADODataSet1ClientesNombre: TWideStringField
      FieldName = 'Clientes.Nombre'
      Size = 80
    end
    object ADODataSet1Direccion: TWideStringField
      FieldName = 'Direccion'
      Size = 80
    end
    object ADODataSet1ClientesCodPostal: TWideStringField
      FieldName = 'Clientes.CodPostal'
      Size = 4
    end
    object ADODataSet1telefono: TWideStringField
      FieldName = 'telefono'
      Size = 50
    end
    object ADODataSet1FAX: TWideStringField
      FieldName = 'FAX'
    end
    object ADODataSet1email: TWideStringField
      FieldName = 'email'
      Size = 40
    end
    object ADODataSet1TipoDoc: TWideStringField
      FieldName = 'TipoDoc'
    end
    object ADODataSet1NroDoc: TWideStringField
      FieldName = 'NroDoc'
    end
    object ADODataSet1HabCtaCte: TBooleanField
      FieldName = 'HabCtaCte'
    end
    object ADODataSet1CategImpos: TSmallintField
      FieldName = 'CategImpos'
    end
    object ADODataSet1UltimaVta: TDateTimeField
      FieldName = 'UltimaVta'
    end
    object ADODataSet1UltimoPago: TDateTimeField
      FieldName = 'UltimoPago'
    end
    object ADODataSet1ListaPrec: TSmallintField
      FieldName = 'ListaPrec'
    end
    object ADODataSet1FormaPago: TSmallintField
      FieldName = 'FormaPago'
    end
    object ADODataSet1DiasVto: TSmallintField
      FieldName = 'DiasVto'
    end
    object ADODataSet1ShowObs: TBooleanField
      FieldName = 'ShowObs'
    end
    object ADODataSet1Comprobxemail: TBooleanField
      FieldName = 'Comprobxemail'
    end
    object ADODataSet1Contacto1: TWideStringField
      FieldName = 'Contacto1'
      Size = 60
    end
    object ADODataSet1TelCont1: TWideStringField
      FieldName = 'TelCont1'
    end
    object ADODataSet1Contacto2: TWideStringField
      FieldName = 'Contacto2'
      Size = 60
    end
    object ADODataSet1TelCont2: TWideStringField
      FieldName = 'TelCont2'
    end
    object ADODataSet1LimiteCredito: TFloatField
      FieldName = 'LimiteCredito'
    end
    object ADODataSet1Observaciones: TWideMemoField
      FieldName = 'Observaciones'
      BlobType = ftWideMemo
    end
    object ADODataSet1FechaAlta: TDateTimeField
      FieldName = 'FechaAlta'
    end
    object ADODataSet1UltimaAct: TDateTimeField
      FieldName = 'UltimaAct'
    end
    object ADODataSet1CiudadesCodPostal: TWideStringField
      FieldName = 'Ciudades.CodPostal'
      Size = 4
    end
    object ADODataSet1CiudadesNombre: TWideStringField
      FieldName = 'Ciudades.Nombre'
      Size = 50
    end
    object ADODataSet1Provincia: TWideStringField
      FieldName = 'Provincia'
    end
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'Clientes'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 352
    Top = 120
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ','
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 272
    Top = 96
  end
end
