object FmEventos: TFmEventos
  Left = 0
  Top = 0
  Align = alClient
  AlphaBlendValue = 150
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Eventos'
  ClientHeight = 593
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 828
    Height = 33
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Color = clHotLight
    GradientEndColor = clHotLight
    GradientStartColor = clAqua
    HotTrackColor = clMaroon
    Images = FmMain.VImg_24
    ParentColor = False
    TabOrder = 0
    Transparent = False
    object TB_readdb: TToolButton
      Left = 0
      Top = 0
      Hint = 'Actualizar'
      Caption = 'TB_readBd'
      ImageIndex = 28
      ParentShowHint = False
      ShowHint = True
      OnClick = TB_readdbClick
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Hint = 'Imprimir'
      Caption = 'Tb_Print'
      ImageIndex = 30
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object TB_Exit: TToolButton
      Left = 62
      Top = 0
      Hint = 'Salir'
      Caption = 'TB_exit'
      ImageIndex = 27
      ParentShowHint = False
      ShowHint = True
      OnClick = TB_ExitClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 73
    Width = 828
    Height = 501
    Align = alClient
    Columns = <
      item
        Caption = 'IdEvento'
        ImageIndex = 0
        Width = 80
      end
      item
        Caption = 'Fecha/Hora'
        Width = 150
      end
      item
        Caption = 'IdUsuario'
        Width = 150
      end
      item
        Caption = 'Descripci'#243'n'
        Width = 400
      end>
    GridLines = True
    HideSelection = False
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    ParentColor = True
    ShowWorkAreas = True
    TabOrder = 1
    ViewStyle = vsReport
    OnData = ListView1Data
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 828
    Height = 40
    Align = alTop
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Ed_Fecha: TDateTimePicker
      Left = 294
      Top = 13
      Width = 90
      Height = 23
      Date = 43578.000000000000000000
      Time = 0.929853483794431700
      TabOrder = 0
    end
    object Ed_busqueda: TEdit
      Left = 15
      Top = 13
      Width = 273
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      TextHint = 'BUSCAR...'
      OnChange = Ed_busquedaChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 574
    Width = 828
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Pn_Imprimir: TPanel
    Left = 31
    Top = 135
    Width = 244
    Height = 112
    Caption = 'Pn_Imprimir'
    Color = clMoneyGreen
    ParentBackground = False
    ShowCaption = False
    TabOrder = 4
    Visible = False
    object BC_AceptarPrint: TBitBtn
      Left = 130
      Top = 20
      Width = 100
      Height = 35
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Glyph.Data = {
        B6080000424DB608000000000000360400002800000030000000180000000100
        08000000000080040000120B0000120B000000010000B500000000660000F0F0
        F000ADADAD007C7C7C0042C375004A4A4A00C5C5C50000C63B007BAA86007474
        7400BDBDBD0037B64F000D9D42006BDE8F0075F0AC00D6D6D6008BA78B003D9E
        3E0000A125006BC374009FBEA4009FE3AC0027C44F0048B47200008C0A00CEEB
        D2009FD59F0007B34300BBFCDD0073BD770050DF8000FFFFFF008B8B8B007FD6
        9300CCCCCC00B5E3BD0092DFA5000F7B2700666666002C8C2C0018B95300E6E6
        E60047C0600051B05A0016C94B00C4D4C800A5A5A5002FDF7100AED0AE0020DB
        620060EB9A0007983B00B5B5B50093AD930048D67300288B410092F9C60000AB
        330074D1830004870D0038C06D00ADE5B9000189270006CE4600DEDEDE001BB7
        3E007EDF9A003EDB7300F7F7F70055E891003DAD490099CC9900848484005757
        57001AA550002FD4740099999900999999008EC4A10032BD5100E3F3E50052B9
        5C0089D38E004DCF71005FDD980022D45B0051D97B00C6E8C60084C78A000DD4
        500075A77F0044BA5A0084F6BA00439C5B0000BE320005A92300D8F0DC0008D7
        510055A56A0042E48100B7C7B80050BF65006ED68900006A0D0063D17F000572
        190028DD6B008AE3A500A8E2B50000CB40005BE2880072E2960047C47A000097
        170040D16B0026BD600000B337006CF0A40004D54900B2D8B2000EC7560099FF
        CC00BFE7C600D6DCD60016A14B0002BF46001C83340033934E0039E2790022AC
        5B008EB598005BBE6700C6EACD0038C778004ADE7B0019C045001FD055005EED
        970070DA8E0083DD9B00056507007AB88A003FA3440074C87E00A7BCA7004CDA
        8A004CC86A0005B834000099330094D6940067E09F001ECE66005CD67F0067AE
        790000B1230073D694001CCA5000EDF8EE009ADDA800DEEEDE00A1E5B40000D6
        420082D7950032E4760040B6530000A22700C1FEE300B6E9C2005DAB5D00C8DF
        C800B5E6B50023B341005DEA97003CD9700097C8A400E9F6EB003EC25A00B3CB
        B90093B99500C9EDD10044C57A00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F29174E1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F294C341F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F7B8196858D1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F7B202202021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        2D4A54381CB4991F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F2220062901024C1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1FB17C91897538A67062441F1F1F1F1F1F1F
        1F1F1F1F1F1F1F06480A220F29010220441F1F1F1F1F1F1F1F1F1F1F1F1F140C
        4B6A80AC0E5C79045D011F1F1F1F1F1F1F1F1F1F1F1F340334340A220F402902
        48011F1F1F1F1F1F1F1F1F1F1F82339776766A63453232753C7F291F1F1F1F1F
        1F1F1F1F1F0203022E2E34062222220F2E03291F1F1F1F1F1F1F1F1F0833786D
        6D6D61312F80802FA373377B1F1F1F1F1F1F1F1F4C032E4C4C4C02340A0A0A0A
        0A4C097B1F1F1F1F1F1F445A947D5E5E073F593131313159A161287E2D1F1F1F
        1F1F444C094C20204C2E0234343434022E024C26221F1F1F1F1F143E749A9316
        72565655436E1E86AD883F1B25641F1F1F1F34262048202E020A0A020A060A0A
        34022E2026061F1F1F1FAEA55F4F68668A8A9C8B36366F0D0D0D982C3969901F
        1F1F0A03034C340A06062E063434220606060A2E4849341F1F1FAF510B24218B
        9B87151F1F53536B42428B21161267351F1F014C4C2206060A4C0F1F1F020222
        222206062E03052E1F1F1F1F83656CA241AA1F1F1F1F9853A02424249EB0718C
        101F1F1F2E2E0F06200F1F1F1F1F0A020F222222222E09052E1F1F1F1F135BAB
        571F1F1F1F1F1F3A92A73D6C6C2365188C901F1F1F024C20401F1F1F1F1F1F0A
        02400F0F0F0F2E2605341F1F1F1F95191F1F1F1F1F1F1F1F522AB3847A7A198F
        3BB21F1F1F1F06291F1F1F1F1F1F1F1F0A2E29404040293426021F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1AA46060609D478E9F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F064C292929440A48291F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F7746501F5811
        441F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F2220011F3448441F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1FA92B1DA8441F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F0F4C2E4C1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F30271F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F06091F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F}
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BC_AceptarPrintClick
    end
    object BC_CancelarPrint: TBitBtn
      Left = 130
      Top = 61
      Width = 100
      Height = 35
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Glyph.Data = {
        B6080000424DB608000000000000360400002800000030000000180000000100
        08000000000080040000120B0000120B000000010000C2000000FFFFFF00F8F8
        FD00F9F9F900F5F5F500EDEDFF00F0F0F000EEEEEE00E3E3FC00E8E8E800E7E7
        E700E4E4F500E1E1FC00E6E6E600DEDEEE00E1E1E100DFDFDF00D8D8FD00DEDE
        DE00CCCCFF00D6D6D600D5D5D500D3D3D300D1D1DC00C6C6FB00D1D1D100CFCF
        CF00CDCDD700CCCCCC00CBCBCB00BEBEFF00C9C9C900BDBDFA00C6C6D600C4C4
        C400C4C4C800B6B6FB00C3C3C300B4B4FF00BEBEBE00ADADFF00BABAC100BBBB
        BB00A8A8FF00B9B9C200BABABA00B6B6B600B5B5BD00B3B3B300AEAEC6009B9B
        F6009999FF00AEAEAE009494FF00AAAAAA00A5A5A5008D8DFF00A2A2A2008B8B
        FA008484FF009E9E9E008484FA009D9D9D007B7BFF009797970095959F007373
        FF00909090008585B7007474F6008F8F8F008181BA007373EE008D8D8D008282
        B0008B8B8B006B6BFF008A8A8A008181A4006A6AFA00888888006A6AEF007E7E
        A700868686006666FF008080800079799C007272B5005A5AFF007D7D7D006C6C
        B2007A7A7A005656F90078787800767676005252FF004E4EFA00727272005E5E
        BA004B4BFF00717171006F6F6F005C5CB6005D5DB0006E6E6E004343FF006B6B
        6B00676767004646E2005050BC0066666600636363003A3AFF004E4EAE004141
        DE00626262005F5F5F004040D4005E5E5E003333FF004343B9005C5C5C005858
        58004242AC00565656002929FF003131D400535353003333C900525252002020
        FF003636B0004F4F4F003434AC004D4D4D002929D4003131B5001B1BFD004B4B
        4B002A2ABA001A1AF50048484800464646002020D3002121CC00454545001D1D
        D70044444400434343002727AF001919E0002424A4001A1ACA003F3F3F001212
        D7001010DD001C1CB0003B3B3B003A3A3A001212D100383838001515BA001111
        C700373737000909DE000C0CD300363636000808D0001E1E7D00323232001717
        8A002F2F2F002D2D2D00161684000000CC002B2B2B0016167D00292929000000
        C400282828000000BD00262626000000B400000096001F1F1F001E1E1E000000
        8D00000084001C1C1C001A1A1A0000007B00000074001818180000006F001717
        1700000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000001B4003
        0000000000000000000000000640140000000000001B3F030000000000000000
        00000000063F140000000000116C744301000000000000000000000356746509
        00000000116D7345020000000000000000000003547364090000001487996BAD
        590300000000000000000966AD71A67A09000014859C6AAE5A03000000000000
        00000967AE72A87909000677AD995091AD6606000000000000117AAD8E479EB1
        61000678AE9C5292AE67060000000000001179AE8D489DB0630020A0A4765E44
        8EAD7009000000001482AD8639415FA18A061E9FA5755D458DAE720900000000
        1483AE85384260A28C06208E8176765E448EAD7A1100002294AD7D3C4B5E5E6F
        7F061E8D8375755D458DAE791100002193AE7E3D4C5D5D6E80060D7C887C766F
        5E4E8FB184142B9BB17D3E535E6268765B010E7B897B756E5D4F90B085142C9C
        B07E3F525D6369755C02001F88817C766F62538FB3969BB37D41575E6268766F
        1000001E89837B756E635290B2989CB27E42585D6369756E0F000000177C817C
        766F685E97B5B586575E62686F76620700000000187B837B756E695D98B4B485
        585D63696E7563080000000000107688817C766F68A191626F6F6F767C5B0400
        00000000000F7589837B756E69A292636E6E6E757B5C05000000000000000B76
        76625E5757625E575E6F7C7C530100000000000000000C7575635D5858635D58
        5D6E7B7B52020000000000000000000457575757575353535353624100000000
        0000000000000005585858585852525252526342000000000000000000000000
        5195575757535353535E972E0000000000000000000000005293585858525252
        525D982D00000000000000000000004DB9B68B535353535357A3BAA92B000000
        000000000000004FB8B78C525252525258A5BBAA2C00000000000000000151BA
        B9A35E4B4B4B4B4B4B6FB1BAAC2B000000000000000252BBB8A55D4C4C4C4C4C
        4C6EB0BBAB2C0000000000000155BDBAA3573E41413E3E41413E68B3BDAF2800
        000000000254BCBBA5583F42423F3F42423F69B2BCAE29000000000155BEBEA3
        4B3A3A3A3A5E533A3A3A3A62B3BEAF280000000254BFBFA54C3B3B3B3B5D523B
        3B3B3B63B2BFAE2900000030BEBEA341343A3A345B233941343A3A345EB3BEA7
        0600002FBFBFA542353B3B355C213842353B3B355DB2BFA806000049BDA33E32
        343432571F00003C3E3234342A57B3C01600004ABCA53F33353533581E00003D
        3F3335352C58B2C1150000469A3A2A32322A531F000000003C3C2A32322757B5
        1A0000489C3B2C33332C521E000000003D3D2C33332658B419000031411D2A2A
        25531F0000000000003C37252A2A1D680A000033421C2C2C24521E0000000000
        003D36242C2C1C69090000013C321D1D4B1F00000000000000003C321D1D4123
        000000023D331C1C4C1E00000000000000003D331C1C4221000000000039323A
        120000000000000000000037323E1F00000000000038333B1300000000000000
        00000036333F1E000000000000006F3100000000000000000000000068320000
        0000000000006E33000000000000000000000000693300000000}
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BC_CancelarPrintClick
    end
  end
  object frxReport1: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42543.534872384300000000
    ReportOptions.LastChange = 43581.428106469910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 431
    Top = 206
    Datasets = <
      item
        DataSet = StringDS
        DataSetName = 'StringDS'
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
            'Eventos')
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
          Width = 65.048077070000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'IdEvento')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 76.386667070000000000
          Top = 15.118120000000000000
          Width = 135.754857450000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Fecha')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 348.204604530000000000
          Top = 15.118120000000000000
          Width = 275.245173320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descripci'#243'n')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 15.118120000000000000
          Width = 112.725383320000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'IdUsuario')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = StringDS
        DataSetName = 'StringDS'
        RowCount = 0
        object DS_ClientesIDCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'IdUsuario'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."IdUsuario"]')
          ParentFont = False
        end
        object DS_ClientesClientesNombre: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          DataField = 'Fecha'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Fecha"]')
          ParentFont = False
        end
        object DS_ClientesDireccion: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 226.771800000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Clipped = False
          DataField = 'IdUsuario'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."IdUsuario"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 351.496290000000000000
          Width = 362.834880000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Clipped = False
          DataField = 'Descripcion'
          DataSet = StringDS
          DataSetName = 'StringDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[StringDS."Descripcion"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 31.236240000000000000
        Top = 347.716760000000000000
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
    end
  end
  object StringDS: TfrxUserDataSet
    UserName = 'StringDS'
    Fields.Strings = (
      'IdEvento'
      'Fecha'
      'IdUsuario'
      'Descripcion')
    OnGetValue = StringDSGetValue
    Left = 432
    Top = 272
  end
end
