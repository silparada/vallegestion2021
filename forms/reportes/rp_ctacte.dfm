�
 TFM_RPCTACTE 0<. TPF0TFm_RpCtaCteFm_RpCtaCteLeft7TophAlignalClientBorderIcons BorderStylebsNoneCaptionCuenta CorrienteClientHeight� ClientWidth�Color	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameSegoe UI
Font.Style OldCreateOrder	Position	poDefaultVisible	OnClose	FormClosePixelsPerInch`
TextHeight TToolBarToolBar1Left Top Width�Height!ButtonHeightButtonWidthCaptionToolBar1ImagesFmMain.VImg_24TabOrder  TToolButtonToolButton1Left Top CaptionToolButton1
ImageIndexOnClickToolButton1Click  TToolButtonTB_ExcelLeftTop CaptionTB_Excel
ImageIndex$OnClickTB_ExcelClick  TToolButtonTb_PdfLeft>Top CaptionTb_Pdf
ImageIndexOnClickTb_PdfClick   TRadioGroupGOP_TipoLeftTop/Width� HeightBCaptionTipo	ItemIndex Items.StringsDetallado de comprobantesListado de saldos TabOrder  	TCheckBoxCV_SinSaldarLeftTop� Width� HeightCaptionSolo comprobantes sin saldarTabOrder  	TCheckBoxCV_VencidosLeftTop� Width� HeightCaptionSolo comprobantes vencidosTabOrder  
TfrxReport
frxReport1Version6.4.11DotMatrixReportIniFile\Software\Fast ReportsPreviewOptions.ButtonspbPrintpbLoadpbSavepbExportpbZoompbFind	pbOutlinepbPageSetuppbToolspbEditpbNavigatorpbExportQuick PreviewOptions.Zoom       ��?PrintOptions.PrinterPor defectoPrintOptions.PrintOnSheet ReportOptions.CreateDate ���2�@ReportOptions.LastChange 8�A�9�@ScriptLanguagePascalScriptScriptText.Stringsvar  Saldo : Real;9procedure MasterData1OnAfterPrint(Sender: TfrxComponent);begin( if <frxDBDataset1."DebCred"> = 'D' then+   Saldo := Saldo + <frxDBDataset1."Saldo"> else,   Saldo := Saldo + <frxDBDataset1."Saldo">;end;    9procedure frxReport1OnStartReport(Sender: TfrxComponent);begin    end;    ;procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);begin$   Memo10.text := FloatToStr(Saldo);end;    :procedure GroupHeader1OnAfterPrint(Sender: TfrxComponent);begin   Saldo := 0;end;    begin    end. OnStartReportfrxReport1OnStartReportLeft� Top� DatasetsDataSetfrxDBDataset1DataSetNamefrxDBDataset1  	Variables Style  TfrxDataPageDataHeight       �@Width       �@  TfrxReportPagePage1
PaperWidth       �@PaperHeight      ��@	PaperSize	
LeftMargin       �@RightMargin       �@	TopMargin       �@BottomMargin       �@ColumnsColumnWidth       �@ColumnPositions.Strings0 	Frame.Typ 
MirrorMode  TfrxMasterDataMasterData1FillTypeftBrush	Frame.Typ Height�j����@Top�rh��|��@Widthh��s���@OnAfterPrintMasterData1OnAfterPrintDataSetfrxDBDataset1DataSetNamefrxDBDataset1RowCount  TfrxMemoViewfrxDBDataset1IdMovimientoAllowVectorExport	Left�j����@Top�j���� @Width���u��@Height�j����@DataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Id_1"] 
ParentFont  TfrxMemoViewfrxDBDataset1FechaAllowVectorExport	Left֨�ht��@Width.�&�@Height�j����@	DataFieldFechaDataSetfrxDBDataset1DataSetNamefrxDBDataset1DisplayFormat.FormatStr
dd-mm-yyyyDisplayFormat.Kind
fkDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Fecha"] 
ParentFont  TfrxMemoViewfrxDBDataset1ImporteAllowVectorExport	Left��K���P�@Width�j����@Height�j����@	DataFieldImporteDataSetfrxDBDataset1DataSetNamefrxDBDataset1DisplayFormat.FormatStr%2.2fDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ HAlignhaRight
Memo.UTF8W[frxDBDataset1."Importe"] 
ParentFont  TfrxMemoViewfrxDBDataset1SaldoAllowVectorExport	Left��m��p�@Width�j����@Height�j����@	DataFieldSaldoDataSetfrxDBDataset1DataSetNamefrxDBDataset1DisplayFormat.FormatStr%2.2fDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ HAlignhaRight
Memo.UTF8W[frxDBDataset1."Saldo"] 
ParentFont  TfrxMemoViewfrxDBDataset1ComprobanteAllowVectorExport	Left��M�#��@Width��	K<�L�@Height�j����@	DataFieldComprobanteDataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Comprobante"] 
ParentFont  TfrxMemoViewfrxDBDataset2ObservacionesAllowVectorExport	Left��ǘ��H�@Width�	K<�l2�@Height�j����@	DataFieldObservacionesDataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Observaciones"] 
ParentFont  TfrxMemoViewMemo8AllowVectorExport	Left.�&�@Width.�&�@Height�j����@	DataFieldFechaVtoDataSetfrxDBDataset1DataSetNamefrxDBDataset1DisplayFormat.FormatStr
dd-mm-yyyyDisplayFormat.Kind
fkDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."FechaVto"] 
ParentFont  TfrxMemoViewfrxDBDataset1DebCredIndexTagAllowVectorExport	Left�c�]K���@Width�	�c.�@Height�j����@	DataFieldDebCredDataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ HAlignhaCenter
Memo.UTF8W[frxDBDataset1."DebCred"] 
ParentFont   TfrxGroupHeaderGroupHeader1FillTypeftBrush	Frame.Typ Height���u��@Top����W��@Widthh��s���@OnAfterPrintGroupHeader1OnAfterPrint	Condition<frxDBDataset1."id"> TfrxMemoViewfrxDBDataset1ClientesIDClienteAllowVectorExport	Left�j����@Width�	�c.�@Height�	�c.�@DataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."id"] 
ParentFont  TfrxMemoViewfrxDBDataset1NombreAllowVectorExport	Left���u��@Width�c�]K���@Height�	�c.�@DataSetfrxDBDataset1DataSetNamefrxDBDataset1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Nombre"] 
ParentFont  TfrxMemoViewMemo2AllowVectorExport	Left�j����@Top�j����@Width���u��@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WId 
ParentFont  TfrxMemoViewMemo3AllowVectorExport	Left֨�ht��@Top�j����@Width.�&�@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WFecha 
ParentFont  TfrxMemoViewMemo5AllowVectorExport	Left��K���P�@Top�j����@Width�j����@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom HAlignhaRight
Memo.UTF8WImporte 
ParentFont  TfrxMemoViewMemo7AllowVectorExport	Left��m��p�@Top�j����@Width�j����@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom HAlignhaRight
Memo.UTF8WSaldo 
ParentFont  TfrxMemoViewMemo6AllowVectorExport	Left��M�#��@Top�j����@Width��	K<�L�@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WComprobante 
ParentFont  TfrxMemoViewMemo1AllowVectorExport	Left.�&�@Top�j����@Width֨�ht��@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WVto. 
ParentFont  TfrxMemoViewfrxDBDataset2telefonoAllowVectorExport	Left��ǘ��H�@Width����=�T�@Height�	�c.�@DataSetNamefrxDBDataset2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."telefono"] 
ParentFont  TfrxMemoViewfrxDBDataset2DireccionAllowVectorExport	Left��4�R��@Width��	K<�L�@Height�	�c.�@DataSetNamefrxDBDataset2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8W[frxDBDataset1."Direccion"] 
ParentFont  TfrxMemoViewfrxDBDataset2CiudadesNombreAllowVectorExport	LeftEdX��Ɍ@Width2��Y��f�@Height�	�c.�@DataSetNamefrxDBDataset2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
ParentFont  TfrxMemoViewMemo9AllowVectorExport	Left��ǘ��H�@Top�j����@Width�	K<�l2�@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WObservaciones 
ParentFont  TfrxMemoViewMemo11AllowVectorExport	LeftE*�-9�@Top�j����@Width>�
Y�j�@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8WD/C 
ParentFont   TfrxGroupFooterGroupFooter1FillTypeftBrush	Frame.Typ Height.�&�@Top���QI��@Widthh��s���@OnBeforePrintGroupFooter1OnBeforePrint TfrxMemoViewMemo10AllowVectorExport	Left�	�c.�@Width�J�h��@Height�	�c.�@DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ HAlignhaRight
Memo.UTF8WSaldo Total: 
ParentFont   TfrxPageFooterPageFooter1FillTypeftBrush	Frame.Typ Height>�
Y�j�@Top�c�]K���@Widthh��s���@  TfrxReportTitleReportTitle1FillTypeftBrush	Frame.Typ Height��ǘ��H�@Top�	�c.�@Widthh��s���@ TfrxLineViewLine1AllowVectorExport	Top��	K<�L�@Widthh��s���@ColorclBlack	Frame.TypftTop Frame.Width       � @  TfrxMemoViewME_ReportTituloAlignbaWidthAllowVectorExport	TopE*�-9�@Widthh��s���@Height>�
Y�j�@Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ Fill.BackColor��� HAlignhaCenter
Memo.UTF8W   Título 
ParentFontVAlignvaCenter  TfrxPictureViewLogoAllowVectorExport	Left�j���� @Top k���� @WidthB�$���@Height׬mi�\.�@	Frame.Typ KeepAspectRatioPicture.Data
D�  	TPngImage�PNG

   IHDR  ,   d   <�   sBIT|d�   	pHYs  -�  -���J�   tEXtSoftware Adobe Fireworks CS5q��6  �prVWx��M�E�kӛ���N&;��T�K�$�IVA<J �ͫW�I���&����M<ٛ%!�/�^r��8�DQ<x��H��EI��^U�T��3�S5����j����_U���yp�;�Nm`��7����;(EA��X�Y��ż����e969�ɱy����,�#o�.������������O}}z�g�A��C���z�♿���g������<t�ؓ��7^a��/?�/����k��a_����חf�&�������V{�/?;��x�v ��!>����9�߹���s���� ��+�������e��v���G��7���s�{��?/����灿�vr��@��+�
��Y˽�]���>�+`7�߫�������ʆf�������!�x��R���}U�ϵo>CT
M��O57J+g�}v3���=�~�62_
ډ���g3߀�M�����F����o��fڝ�{�����l�+¶Ev�6m��hL�y��wװͶ�_Z�pN81O�����4�ML�9��a���˫2�(��$f,S�J(B�=�:�اU�=͏@Sz���U�� <Jiߍ�J�4�aSK�� 8�ʺ�vHTtG7��j�>MApP{���m-X��~=Eg���>b�i��&��(�t E�ʤ��E�./@�T��J�}ב�=� �G-
xL��O!�c�w���
�{�'�7������Bi�����-1����c0��c,h��.�EV�����Vj��xY�k��=8؀���$9���Dcz"�����|���(��
&�ּ����%�+�iO�^�U�m4l�\�����2��e4������=Ƥw�IWv�t���#��Fr4Ό�
������/J��z���'����@X�-�>�2�Mf�2�v���)SU�Wxw�BO�����B�PH'&�N��/��&]��f�V;��Q�� �W1�n�%�R3�HV^�ѿK�w����� d�>��餀2搃��;E����R 17]^&�|���g��� ��j��hEʱ�;���;����
2��5�����9������Xb\��r���;��4E���<���d�~Nq��;������<�?���y��������|ՙ���_���������ė��<�w���}��~�7�v*6m|�����f�j�Y�i�������>/��|�>X�i0��<�'��Ev���I�8{��_O���)�e�   HmkBF����                                                                   )�3�  9�mkTSx��}�s�ƒ>6'�-Y��d��þ�j�W�����ˣH��J�!)[΋	�[�ʒ������pp%ER6$[Cbp|��MwOp�[�n��ןLm�U�d2ռv�*z�<�µ���j�E��NU�+^�ܩ�������j�w�w�z���^�u��?��~�C8�K?^�ӹ�6��?�<U����(o��2V.��D����@�6�\B�����/���k����t�}h�1�y��1��q��BA7���N�6����hthc�7*���m���N�}k��8e��ɴ^�V9`g��EN��Xq���<�V�^�L�LkP�x�֙AE6�P�0��2!�2d�=e����_��(m�3ԌV��� f�}a��cv�\.���Pw���16�lT)6��FM�Ʃ1l=7:���<6����1xj^��;\e�����j���l �� 6�+P�+�T�.�gL81��[Ih��4-	MA����N��R�@��6XM��aH�pH�'��}���.��҃O��m��k�Xj���~k8������a��1:��פn����~�cȁ�z?�<��fA�Y�H�~�v�zXa��V�Ys��)�E�'�`����	��7Ԣ!�|2N��r��"���&`I<T�����t��f��X�M����ʠQ4*�FeШ5#4ϥ*4#���@��hW���c��!?	!�!d1�����J[�S�<H�Q��3��b0�&��uVv8L�Ѕ�ato��[���������a�C�TLէT3��|�D�-#�!�3�L���2�Çb�x|x���<�~� T�/��[��%#)��@ju�>Lr�E(s�υ�������`6A�>P�]n�"�=���r�:bh���/�ڒ���֨^˂b^����OP�	�AȴB�Џa�� ��0r��͵��D�:�S��x�} E�f�x���F3}+�gH~IϮ��D���j��_�,�AHb�&Ei�bQ��b/���m}�:���0�H��
j%XI�4�G_;�Q|����9����U���M�n�%U�I�È��̳�~���G���0�2���F�<�)��el0�? �l4�?�87䇸I�	�]�,B�;R�0�:�����h�cl��{9:`4��tn$GfyP��6՟ �sk꘏x0�HQ�������i�8�&cV�@��"͔�C���00�-�A�0̆�6�L�A�]�#ۤ��E|��kF.B��uJ�kܼ#�$#Z�.C��Ъ0�*���މ��@�8��r��8p'l叔Hd��Xg(�mBQ]E���TL
#�	"�z�������%u�$W�
׼�f03����8�r@�Î�G�^�I+��r��Ό��p��G��a�^x�f�x�z�٦D�h`h\ջ%�SN���r�Ea� �Y�,!�8�$�27��#2��c2vGd�����{2$����4N�z����F���.�Lh������]v���h'�(^�D/ő��'ef���M���73�?�1X���q�/�;��1ܧ.'�(G7�3c~�`�Irb0h�6!N��iJ��`��fKM�Vڪ	Q+�f��|Dvt��q+�Y�)c��Ыq�j?��9A�&������O��|���N�练�y�\&���f8�hO��N���̊Ȥ��:rm!�ŵ�FL#S��S.��IZ|R�hܚ�=�����w�5�!���@o�t>�vAX��I���N�H��D�s&������m�v��M�L��$I�1�14+�1|��+�
c��+�1����l��nr��dHC�J�JB�uy)-���K���Y�`;���L|̈�����c��ܟf����jj	j�p`�S�u<�~��
���&;(���8~�I�<�A	��S�m�Y����l����i�Jz�PhC�:D0g�:Y����Yk�a-d��c���r���Q]u�%1�v�[]�r2c+l ��8m�]O�9�zM�#s�Z�����+��j5d@R�q\r�,���x�|T�%o%ӥ!�N�n�:����R"�����C
�R�!!Wz��>0[	|#f+��C+*3�h���ݝ���0����h��ś	�~��3�'�5 e�9���15d�:5��Y�nT��8�f��䇌3��!	a�x}c	\*.�8�*����D�sPdEڹUY�fq�"�<~׎.��yߦҠ�)^��+")���7 IP�L�i�1��E��P��)�=�%��G�ø���Y�f��B׵ɗL�D�h@�����!''�D -�D�����l{�}�ةr[��X���D�G̵�哝~�4Vߒ����Ⱦ"�ѡ\�ϴvC���h���1O?yR�c��Y焌t�҉B4�ϻ�f.w��Bώ�����߹���!N�k�Dr�kQ_>&�/N /�1�e[�a�C���&}1hR�tdF�X�����='q��kr������?+���?�s�JR�6�h`Е��<f"Lw:r喙�
�YH�J8$�Ї�Z��+����7�V�9�j�M�l#j�Z[-�R�=b�T��!�����-�Ҥf��ne��
���
^���(��C�=��w���̑�I>3Fmzm�:����)/���s�"l���b-��e=2*�S=�G���#�?�w�Ӡ{D3��!�� Lֹ�Jⵚ4�*!����1�t���y�'���QDh��G�1�\�+�t���$�G̠�\s��,#�I��߈�r�	o����\(��{�N�n���uI}��MB+]��)=0�#I�<��ˤ� i3Ul3�jh�^�v��X�+.���a׎5�/�ENhR��<��X�t�$(����8�(F�ٹ	=O�s��>Æ���j�?��}�
�?m�����.>�����ҏ���*���{�u����
�¯����S.�&�Hr�W����A�רpM1�L|F)������@�4�V�	B�D%��<�>�k3�ڥ`v;����4l���_w�PWL�&�Y
p���qC��k6�g��9ϰ�B��i�dHvf~�� �Y>��������Ťf1�Y��Z��M'�j���C�y��bB�2�UK�- �63
`�3�~����jLh�Rh���퀯g�D��_�q1��8Oݣ�H�L��R�D����A����Yo7XTv�Aqk1q9L\N)���
�B�9�Y�??���YM1э��F���^S��xněm?��^Lhc&�q)�|��l�9p
�;2\w�PWL�.�i�N�Mce��H"�iBܟ1�G�?O�/�H�G��li!`�-=�͈|3#�L �/��?������ҕ74_Ʀg:kH���C=�(�Kk�mI��p-�(�}]dy�^��!��mqH���e���ȅ�he]<2�%_h͈��}@��4=GF��RG��Ț���m��R���ڰ^Ն�Z3�H�.|��V�ʊ=vT-ZY��O��-���f����B8�r��fH=膖5�|%U@U5jxrTU�nW��"[I:��p�&�(S����Y/�s�`�B��i#Y��^T�Ƕ^&���Ȇ��	�W��t���e��ҙJ���U�a��t Y�<���ϸ='�n���S�����ch��>��Q��Y�c�nz8�9��Pj+�>�*�����3��v=MX�T��TB�ꃺ���R�D�{6@�Ԛ*A��Ru54@�U��r���8:��׍n���_�G���o��3�X��l���)�w�I�nԡ�q
g���pCkh���T�5y�p�1�J�@%�e��6��kֆ��6|�9[�(��:o"���9��[�|Ѹ�)�?�~���x`m_b\��ݺ��Cөc҈cJ�ƨN��ѣm�&�D:���1H_g�G�W�t�w�V� ��F��UЃ;lگş1cS���k5_����@�BG>W�����lyᄿƆ�=��q��g��M����}�TK8� zX���Z
%��Ǵ�������.���F�zx�g����+�|&G�o���s��	s�'�]y�_j3!6���	G�UC����X�/@��k�]w��3�'�VQ[Fs�o��j��P\ᎏ��H>������lt�Ui��2Nm�x/O#�wBO;VZ����LA����t���W�O�mD�r���*԰kX�g�jP�߼�U�B��/(������VxBt[��{�G�Ά4���VH��v�NGd'0�P�-!Y	G�iшtFvd�l��H<���?LF��Gp��}�)�uK�_���nb��
XK�V�������h
c�9gp��{��G@�X������?ek��U��xx/��D�98�1��6[�Z�s��%;��,�T���s��ߕ�\�s��_5;[%;?v�
�����R/�d蒡�f�����:�.�d蒡�j��J�~0���w���p�w�^rt��%G�m��`8ڷ�C]2t��%C�m��a-�e�]��%g������2�n�=닋pv�yW�s���;��w���̻��Kv�ع̼{8�\fޕ]2����e���c�2�d蒡��.3�C��w%G���qt�y�p8�̼+�d�o���̻Mc�셲
�<'�1��i�o#{�l���4����;��Ֆ�c��H�嶐��9:-�5�/{��KE�%��|�3�n,�;�Gč�Օ螯O{]ɫ{�5�9]����Zm��c��1ڶ˵-<�����o�W�_�-l���J[t5�����Vm�[�ۢ��k�ݙ�)0tH�`�\aB��]2�Cd�͏��[2�����f|��9�y�=������A��P]����;���	�ހv�tW��B��I�C���7�=#'�+h�#��=���G��S��N=cL=�$��{z}6��Ћ|����w������G�-h�w��%��p���O��Z}�4�ђ�����Ŕ,Ζ.�$�i~M���>IFGԈ�]�d��bJ��qʘҼ)Ӗ"��9�_�plɊ �t;�,h{�Wt�35�K�Qԇ�5�G������\���&��;гF`'ܒ��Pe��Cx��ƌ�#������dI"�@�uYX�yr�Ѳ�ҺD�ˇ�����6�}D����b�p/�G���]�5/�*����j�|P.C�YlD��ԴH���E%+H��ҷHڞ���V�G��3��� _ߦ��T��o�l(#<w��|���ɺz��5
4K_@�v��?�}���Z������ݭK��J>����?�hۏPsE�r�N��������q����7���8�L�w�ɘ���$-��g�vc�$���]z�d��P_`���J�B�g�J�=�c#�I�4;*�=�_)��+�J��?�^)���h�W*�]��w��]i���ڷ{"�|���i�{��"����؊�C�Ż�V��2~��1�\���o)��nG��!���6K�.�d�o���8ru,�[��w$�͚{��O��2���{�R&��� �awp7��4��oX�Ͷ�Ŷ�O�%�य़g��yΧ��,���e���f>�ޞm�ZֺK�;y;�*�?4>��7b�%���Y,�E#mn�,�N����1�;2�M��9��u�s�%Ų�}Ŏe�����m:��#�e��9�㌺G��a4�&���l��(M�C[E���'܏$�1M��6��ϖ�,�y�]�p)D%y���K�ֳM�$�}$�~_}B�c��YM������A�K6��=��^���g�%c�K!�s���=�v�l��nм�I��S��qL��h�@tQ:����BI����ܓ�_�':���o_Kc����DG��c��_(m�Cdl��1Uy?��M�w���l���b�Z`Y�q��g�|�Ӥ��.i�3ea6Z�5�Þ�8�K��$�"��6��TOՄ�w�t�qc������*����:�!��\!�rH�s���ɦD[d2��2���^H�,�?*�p�-�INHw���v���g�� ��'��K����gn�q�A��ظ�>]j�R�
��#$�%���aq�lq�P����g�]S��e��1�uS�wO�&0���,�|޷��y�,��D�n��cn�N�-��U�1�:��~Vݺ���2�$��/iE��2W9�����Y+�R<�3���ɸj'/���fiR��"��-c�N:��F���GpwW
[G���}��f5��76�����p�H�eG��R\��.��֩��;���C�h���pK�Z�����E�zL�9���8Y����F3��g�W�GW��n�8뙾�P�H[g�^C�tq�c�Ұ\iȤ��/�_�����XA�}̪	9�χ;����>?��pV�lϯ,���⒋7���5r����cF�����M����5y���q�z(㔭�V�7d]�}_����E��	j��?�P��5��{l�I8ʥ��z�� �gwpM��,���RќN��NR�Ьn="�!���#R��.�����,��W~�̋/�Ul���lr�0w� ��Eg��Y�(��_�k]ZW<�Ĩ+��d��-�e߱d�g���%#Z\Va��}���uɩ��~��fqm��~ͼ��L6#ڶ��y�2��2�&
���C&�z+h����d��� eRIT)#�J�Q��Bc�E��*d2�aT"O	�1�
��g�����dy�P?{��g{�oqG�*|�y�$�Wg�O#�������͘|��/�����l�J��ST�D�۰u����U�)��s�!z������n�hv&S׭Џ�f���ݐć�i���p��`Hq�&�!l���:NU��:��?���hO��qr2����͚�x��|0�lC	�����Ua��)?�A�*z*�ڻݣo�v��djPi��\��%}ڭBE�����Sl��δ�T�A�C	�AE��P�0��w���t������uˆ-�,\���'4Q�v�@� Bw.Tv[��m�A��h������k�.��;b���q7e~^$�Z.A;~�����>5�;�� oLS��1���5�Vݑ��t�ࢽ�yݻi�d�������v�N����R�.V�I���м�n�}����&}�oQ���u;-<�C:�k�����e�}=cE�?lc�k���<`_x�_���%DO�q��n��ϱh���'	4�'x�AU�;}��o�>};��Xk��O*)�ݻhӾ'��A�NGbq�ڧ��/��wzb�M�v1*\Vh�P��6��cyT��v�Wٹ�/u^T�6q��>��A�5x#��l��>�i]��O[[���ur7���T}iy��.��;�[g��׼ ���Sh��i���uO���*6�M{0�����V��MkV�4���:�_h�5x6(Z7Ubu�?\#���i,�f��>H	Z�w�p߀�;�o�3;��=ҹ說�C�_��k��!�N���I�N�:&hv����p�A��y���_��<o�z*�����q���E��f����a���M˫X^l���QoF���\1Yw�E{��8�\s��<v�:F��t��o��L�������z�����������}�fT�|�J6
��?pD,��]��[��u����
/t�'2>듲{�V.ۃ�k{�z'�������Sl�b��]����-�;�΁t�;�S�^Y�׍���Ӱu���Pc�@h���Cv�.&�W���M�.l���[c��l��j�h���j��ժl����j恚���56N�l���8�{^&d�C�--�$���ؔ�0Z%fR�&f�}a��c�F�O���IؘP��*��%����6��0D	��c3xj����L?g�,?,ц`�������/d�q�NLh�V�v4sX҂����!���5�5}V�!}�!mP�/t2@�	�=�珐��V�%�K���S���y�mF;�#r�F�m���~�cȁ�z?�<��fA�Y�H�~�v�zXa��V�Ys��)�E�'���0|B5������p�7����4��ا���t����(=au�X�M����ʠQ4*�FeШ5#4ϥ*4#���@��hW���c��!?	!�!d1��������ٛj4jQw�b0Y&��d3�����i�{�5-qxL�1��u3lx��� ��T�jf�o�h��e�!֏b�x|x���<�~3N�����Φ�!��@ju�>Lr�E(s�υ�������p֏=k�7|��bn�e�ꈡYsx���$jK#[�٦��b�w����9�0B��҆~ˌ�T����o��%��!�*ܔ���(�<׷�z֠�Գ��@ Q32;��j�W5Ke����IQ��XT����C����r�Cߨ�g�n��T���$o�࣯��(�GA���gK:�e�sQ��y��]��(��T�!��t�9Ha}E.c���qe�����#�[^��W�ؑ��рYi�M�'�ܚ:�#�0R��(� <}<f�'��ɘ1��H3%��9z~�cKg�1�a��3ScЅuW��6i�B�n�,ꚑ�P0b���7��)Ɉ���Ъ0�*�
믬w⇡+�"�1��8>�	[�#%Yc(��dۆPTE�d(2�s�,�+G�G���a�:G�+^�k^Ō3����t�s��J9��aG�#O/Τ����ZRg�Qd�t��Q���d/<f�Q<^=}�lS"��1�(�$Q�kP�=�K��eP�< k�8KHF>N/�z��M�7��L�����_�8{���?�N�����lt���Rτ���}��e���Ζ��+��8Ҁ����,����Y��f� �g2k�x>����r�3�������Xbf��3INL��meY�1�GE�l�	���A[5!j��7��Ȏ.X�#n2k=e�z5_����T#�#���?���I3���oBv{|��|p���r�(~���<��7�6S[-��I��u��B��k�9��F�L�+�\�����$�Ѹ5�{4n��=>���8�k.CZsS���|6X킰����!����3���LN-���[��6C�����'I�Nc�bhV2c�4�W��(Wc@�����䦻ɐ4�$���$��RZ k	5���1��r�v /{\�%-��`h��o�O�ǋ��q5�5�a8��)�:\��g�Ns�� L�g���!<�~ȓ��2�,��Vg�yfS�4E%=_(�!M�"�3g�,y�C�,��ʰ2@�1�ck�\Wݨ����uQ�^��.s9��6OS��ɮ�ٜw�&����D-�}wÏ�YٕTn�2 )�8.9Y��qZ�R>
*Ȓ���Ґa'L�JKC�n)u�k��L�!\)Đ�+=��`������١�K4�����F�l���dmz�Q�������<�{�Z�P���?SC��S��u�F�y��^a��I~Ȩ139����7���p	�K��eF��j�e-�(�"�ܪ�s��f�D�kG�n�oSiP������{�
�$(Q&�4�I���y(����g��E���a\���ɬs3��΀���U4	 �`�|Ɛ��c"��R"no��m�=�d�T��Se��wc"�#�Z����Η��5��.0d���5��_��?<���g�L@Jcvl27뜐��X:�A���y����q[��ٱP����;w3�8�	4bm�hB�|-���$��	�E0F}�l��1,y�4SҤ/M꘎�H˖ڣ�8��$�\zM��� 5?�g�4����tn^I��F��RR��L��NG��2s@\�8	rB	���p�U��v%��8���*0_ͣ�I�mD�Ak���C��G̗ʃ�?ı'�~Ȱ0J�������=B*@VO7�)x��Z2`�XП��Z�7`Rn��H�$��6��R�	L���@�T!1�Y���nJ�1Ӳ�Z�#��?�Ïp�-�>��yG<�gA4������ϩkֵ�Jⵚ4�*!����1�t���y�'���QDh��G�1�\�+�t���$�G̠�\s��,#�I��߈�r�	o����\(��{�N�n�qϋj�];� ��]8�I��ؚbM�Y��8Z����qg�&�<��A�w�������*ڇ� x|���>���s�=��P��W��`��S?�V�~|'輈�r�5iE�C}�_�U����5��g0���
�o���ǟ����n *�>��)&X�	�.[@��A��8,��a���h���b4� �R��L�M"Wd0q؄�)��<�>Q����- ٙ�e��f��.c���c���Ťf�B[@h]27�Ъu�G���1ۋ	�ʄV-���������pf��c�Z�	�V
��Оq����������3.&��{i���^���Hs�6hr�s0���ʮ�>(n-&.���)�U@\[�S�=�=3K��g5�??�)&�ݨ�#�k�=�[�f��c�ژ	m\
m_�;�q�����ם'����F�h>��EyO�����=b�yJ}�Fj<z�eK�n�oF��6`8��xm�1����W������26�8�YC�(uU�aE�'�ږ��ע�B��E���p~!�B�����Y[��n�q0�\��V��#�^�֌���4�K�s�atH)upT��j8�&�/��_��Um�5����·Hmů��cGբ�U+�Ě�"Q���k֍op�.��.�	k�ԃnhY��WRTU���!W@U��v5N��+ⱕ�C�	�jb�2���n����9�f-��6�ŏء�_��z����"�2&,_Q�ҍrƗ�Kg*���V=�a�ҁd��l�<>��4�|�Mn\:N�γf��B����Qx�ǔ5�^5+�`�MG5G�jAm���ZEz?cw4tF�Ю�	k��6�J�Q}P�2����P5���C�l��TD]Px`U����-<<��_��u���!�����Q5�����<��<�c}zJ��cR��uh�:��)��C-F���Acn4�_)�䵬��F7���4ІO<g%�1�A�MD=\9�@�v�v��/�0 ��'��[��K�+�[w��{���t�*ǔx�Q���\~"AM������#��A�w*��UЃ;lگş1cSʃ�F�ޖ��m��s����9��u?��Y �ۙ��%�y6@�C����-|F/�{G���:�K:�sp�9b�^�Y�#v�
���Q���[D�O�c�=����R�	��-M8����~������۩�;��ݥ��ɽUԖ���[p��5W��#�2����~�3<��$>pU�䩌S�!�K����T[��r�;��M�x%=xW7�ʱ۪��n��hO|˫5�͋\u+��@���ь�О�i�'���7�o��(�ِB_�
i��]����ʴ%$+��>� ��Ȏ���6�G������(���O�[��B6`\t��V�Z"����v��!�11w�~�9�͖���\�s��_5;�8����ܣ��w%;��\��W��V�����v����K�.�d诙�+%C?8�E�K�.�d诚����Cos�����;\㝢�]rt��_5G�%G?����G�]2t��_5C%CoCK�m�yWrv��k�lmC8�̼[g���"�]fޕ�\����e���c�2�d璝�v.3�;��w%C���1t�y���̼+�d�o���̻���e�]��%G{]f�=�.3�J�.�[c�2�n��{��Bxωf={����^"[/¹�=�ͯ+&���|����d-{�-� mG�N�u�˞�:�R�n	�;���K���q#du%����^DW��?G�G�oN�*BDxy�V[����o���rm��5������9kۢ�p��]�-��f�Uۢ��V񶨨Ee��òDwf|
���W�.%C��z�"���2���*�D�~Aq������C$f�'|'T>�%��q���7��.�c����k�8�?��Mp����
Z������QC��T��S�S�2�m��^��.�"��ǽk�݅~5���=�b��c	�8)#��e�V+M�E�d'�6t}1%���K<�lZ�_�����OC҃Q�5bb���u���%a�2�4oEʴ���mG���=[�"�)��3�^����L�p�!dM����*i�4W��r��j����	��'{!T���^��1c�$c�(�:Y�Ȇ#��h]��B�D����내�GQ��a�w��:�MyQ�!��;�����o�uWp�ˠ��|�.� �ːz�� 5-��~gQ�
R���-��'p�#����х|�̧+/������8��[:���!�%�f��G���f���Ь��t߁},�V�mm�q�tw���,��O��������1��#�\ѵ�62�-��B/���p�{�y�G��Fk#4��]b2f�k IK2B�G����a�m�^�(r;�cf�ҳ��ٯO���b�=͎�~O�W�����J����ϥWʢ�"��
{Wj��e;bW���1��m���>ᯨAZ�a���/��<�b�Pxo�.�0���nL�7;?��[����Q2t�����͒�K�.�c�8�\Ko�<��p�����8🌅��@+���	y����.�v��M/:M|c�Vx�m�e����t�4x���٦e��5K=�}�/�O��g[�����R�N�ΰ�"�O4���|	z�|�@KbD�H��8�S>f4v�=Ǝ�u��<el�%s��?F	F��_�c���2��g��)��cY�sN�8���џp�cc�ɀ�(9��sJ��P�֟E�l�	�#�tLӤ�M-���,�g��_�$\�QI.��Ҭ�lFS%I`�j��W���E��`V�a?��9xkP�c~�?��{��v��RF�`�uϯ�0jD�4om���jd�f9,9]��uu��P.!��d<��������������wp/ё��أ�J[���CmL�Dޏd�G���|6�2�������X�h���+ę.��4�7��K�E�C����v����,��ҥ$�D�Hq���(�S5aG�]�'�|�X>��:(�J�?��ø�gH2D)Wȶ��\�6u�)�Y�㱌z���{���#�r���!wKs�ҝu��;����6�z�	�����_�[�b�j�46n�O�Z�Է����kI��fX\�[\2��?�kה�|�}�n����	��b��8��-�kE^D0�;ѭ�������i�i̫�i��U�.���"��p�KZ�j���U�8�qv֊�O�L��o2����f��Y�T��H<v����/���9;��ݕ�֑������YMl�M{��k�{&\7�nّ��W��<��Ƥu*e�)��>dc;�¿���s~Ѳ�}���j�'N�"��u��q��G���B�������.�z��3Ԅ#���א7]\�X�4,W2iE3�����k��*VP|�jB�����N��8���p>�U:����kK..������bk�\��������j-�mS�!.�aM�px���8e+�U�YWp�ת�0~ѻt��y�5����[��_�ri濞A�/���\'"��m��G4�S%ƫ��+4�[�H}H3t����K��f�.��Յ�(��o[-�>�7��<brљ���xm�< �_#���ZG��#1�
e"4w��w,Y��j�iɈ�U�>�yf�|]r���'�Y\F[d�_3o�+�͈��f�mŨL~�̾��f!�І	���
Zha�<�e�=H�TAUʈ�Rf���Xi�u�
��c��S�~L��hG�ٰ�*�.Y�7���+�ٞ�[�Q�
_{�*����Y��ӈ턼���D8s3&��%����t�/'���*��?QA�6lj0erʇ4�t�w�F�3��n�~�6�fЏ�膤<��N���8�����C��4��`��x���p�z���	���׼F�x2�x����tl�t�k���	eJ(��ht���o�
{5O�Y�T�P�n���};�St'S�4�J6�
�.1��n�*��8��֞b�T�u�M�zJJ(*ڰՄBg��E��;���{�>~�F�.�[6l�f����g@>������0�s���n�
�F�H�ot��^�v��X�+.����)��#���r�������>5�;�� oLS��1���5�Vݑ���ࢽ�yݻi�d�������v�N���;|!E�b��;��	���vX�Ǜ��oҷ���Z���;�3�v�9�ZX���3Vt����1��q��u����� `;]B�w���N��+:}�@���4Qս�7}���ӷ�i�р��V�����ڽ�6�{qB���tp$�}:y�N�x�'���`��e��
U(�l���>�G�c�}�����R�A��i��S�t_cq�7�y��9��l��5����O�Z'w�N{�N՗�78��c��q�?x���;9�杜��^��<ޮb�x����		�{�a�������H�M\=$�Ѥ���6�% ��B[0kT��+��#蚝>���w�� Y�v��9�1i���=MWl�c8�C�0�8iR�:&�7;�x��o����9>96\��im+�+�~1=�Vșԯ*&�W�h����k�>�ǮV�p�`�^¯X�</�&�@b�)|M�KnOK���ki�Z[0�A`{�kF��e�s�z�a����v��+��O�y�'����S�7�Q�   �mkBSx�]N��0���� ���Æ�����	WM�����- �2�����*5X�|D�Z�=�f��Lc��(�F?
������h�Ҷ��B�L�r��Gp�od�g�d/�e>�f
9��]�W��A�\��\L�f�[xi�lϣ���Ts1�H	�Q�l�H�اE����t����(S�AZ���_Y �X  �mkBT���� ~�                                                                    x����M�0`V�
]� V`V�
���+0��
]�+"�Rd�'I�65�>	A ����v^N��            P�������_K6�ﳐ�Z�M8d��ɾ	o�~�v�~ӎ�~�����}���Z��M����֭���ld Z7���������}3�.�:�γ3�\���An���0r<Xznx��f�\s_k�rk���|�A�����<�X�]Z05�����_'���Z�t��u�u���|V��J����>��1u8��������W�d�3W���H��p�����ۍ�r��j������������1W���?����cK�����^�{wz�e����������9WT�k&�3�� ��@����3h�h����(���|_8�:������ ��}�(��x>�/K��_5t_:�T���K���a����ڥ�۴F˿S�9Z��}��6��M�m�+��:��l�ז���]�I�t�_�����+�瑶���<ϓ���eg���Y��9���M����_p�C�����ʍ�_�(�1J������ߥ����p�>�h_���1�}��Ҿ�ק˱������;��Kw���Nk���q�_���:�׃��n��}l                          �e?>M�Ɗ_$  
�mkBT���� W�                                                                    x�흍��8FSHI!)$����FRHn��w��H�Y��x3��ꇤ� ���s�a�a�a�axI�����Ǐ��'U�{�������o��_����ھg�W9���������������o'�GW{>~����J���l�����o߾�����������)*/���N�\��ϱ�o��v�[iZ_ձa�JΝ�/:�����6�O�-���92b?�T�����l�k�%?������_2������1�B��s��Y��5�>�:�> �c=1������O�w��y�^�- �ڶ,��X��z ����u��sM�#גU]�>H_���y�Y��v�!ۉ���_m�i�Ru��s�]�X�m�_g�)YY�)�m�]�y,���m� z�1��a�a�axE�ߓG�ק��o/�Y���\�k�6��x����j��gH������������|�y��u��.�������\���a�æ�M&�w����k�#�ϐ�$?�]�M�o��\��Ⱦ,�/��ڥ���Q�@��~6s?)}��,� l�����gX #�v�Q���g���B�����ٙ^��u��の�uh��m?�}{]��.~�}�v_��J;�x�o�gJ���Y]�޳�@��.�)��oqC����?}�>@��X���ߘ�'-� ����(�W�?�����������������	�źv�Ɣ����O�ʙ�R������v�[K?[A}�?-�w����m�Ց�}<G�c�K���1}���u��x�LzަU��0�0�Pc[��<>�g\=��c��}�M������ggg�����	�Ǆ����-B^��k_g?��F?���� ����v0||؎��=ǧH�P���g�s��/�hؑ�I�t��~�{����n^�}���Z���yD������5����X���Wv����O)�"��c0��vY������Z��|~�_%/�,��p\��ɹyΰ�Z�/���;/x����s��_��9?��P�ܯ5ݻ\�[��y|�����č8������g ����ʱL{�?�0�0�_�k3���>���������z����_������\S��|<�)�b|�����7��a�a�axn.��t�a?l��^C��vk��ؽ#����~e���)��3<3^�����k�dl�c�&�jK+���o"e��<.�ʞ`���^(3z�����u
���l�+6���v��<���ï��k7]�/l�c[`�O����n}���򚄫��G��뎱���zt��^v��2)?;Wm�r�5��o�c����Iz�?�����O��zx��{�&��!��e�z.����������"ѯ������1������Gg���{+ҏ���l�w<�=}Gݽ��Fƨ�^�)�����zIp�G�����K� �֜�{�{���e����G��12��ۭ��q���iumf��>�.����}�����~�a�?�0�0��[u���+�7�Svq�����֭�y΅�
�?ނ��}���X��w�Ŷ��v�?��ߩ��D�����Zۓ�-q/�?߳�=��<��~����#�������>���Fk���"q��z�r��Q�o	9��r�,��n�Y[;��o�:)@�-`ק-�7��({��߯�S������@�µ����K��9���֠�ɸ�>:�n�3��
_[�_*�mt�cm��C>�q��S���L���<�?�<n��ѯn!��>=���<�6�;��ǫ�s�����a�a�a�{�xˌ�\�ފ���px�?0׋�#�5����z��я��c�]����x^��l�򼠕��(�f���:~����٣^l�i�n�59����W��~�\;�?v�n������6e�r������UbS~v����^��UO7O(�|;+�S��G��4|?�f������*?�r���W~�2�o�N��ٟ���S�9��~d�a�����և���mH�6��m�X�[��J����~�s.��y����m�4ٶO���|B��d�����/������b5��ɿ�y����U�?�0�0�0�0�0�0�0�.�P�~�*��1@G\⟿��K����rKX���s2�(ߥ�纎J���8���'>�X@▼�Q��Q�b���q��wx��b�)����_�K|���v� ��1��M�6ke�e-2Ǜ��5��9��?K^�E��~�9�ϱQﱮY��F�8��N?�~;:=J<������-�t �ĒyNA���g��C��	\��N��X�K�s)'�^K�g\~��2}�6�}Գ����)��n]O��r�^���j�~�"��{p���29w�6��/�.�z-v�:�+�����M{�W����JY��Z���굢`%���Ҥl9����ힶ�կ�#O�Uz+��U�?;���s���d�~v��N���D��7*.Y�+v:�ye;��8�}�~���|���+ÑޅN�9����}�{Bƞ#t���x��խs�Xɿk��S�V��/��uJ=o�G���<�ջL'����L��:�D]�6�j�f���gL��z�/�+ؽ[{����r��C�M�Y�q�~��[�{�y������y	c�zA��������;��w���9��z�szW���H�����V�ax3� ��� �%�  �mkBT���� �-                                                                    x��ە�0���>�ZpZp������@.!n�-�A{�Wh57	c����$ K�u�ьȯa~                                x(U��_72�\G�����_ϳ���M���^��=8F�{:��#����G�3�s{ �(�������w�q����u�(��о���R8?���7���K���M��} 7�w���(�߯�i�W8�{9J���o�����_Ķp?�gK1�Tf�?���-��p��ަ�i���o�g��>x�2�.8���&1^*�!ٽ{��
�e���Po?��Q���aT?,y����ϧp��/�����R�B��c���5�l]�C4�9��1�3hs��_;��u@��Xʼ���{���:��gcPZR��99}�D�q\~��_��{�F��Lm�m��H�p6�v<=C�I�c���`��V�9{����^��9�>l@��B�޻Nv?�7X� i_���x�E�6s���Syt�������X�s_6�)���Mпe�&x~7�j�h�?�Ɔ�˧��<�c�*?�Pu���S��qғ[K�ḵ��W�;B�C���h���r�kڛj3��X�����kr˳�o�J����0^b�5��a��S}����w8�$�����QB�&c?�y���.A��J��������{�L���N�O��ҹNꝳ�wv�k�L��9c2�3�u�=��ï����&�?��}f�3�6s���6k})@�#8\]5����~�����tV$����>ӶY����Z�_OZC�Y�Kq+K�=�%�O��r�/œ���,�ђڿ���|�9g����s�)(� �o[�S��8R~�;����&8���sg�~����5����
�o����TJ�XRw���=��8��;���F��QJ�tI�%�������7Tݹ�����Q�)�g)����K��|�oB*�c���­��y*�Zj����-�eNsϦbչ����П�����Ip��X'M�hX6����hR��蟺��[W���5����sR<')����iB���Ͻs��g���$.�#��T�\�|�ǡ.����7c�qy]gahv�E#+���������0v@���Q��M3�C�����~(����) ��lO�1�#b���(W�%r��u>�<����+��Y-��[����+��[�բWN�s��T�J����
����}�_���J�o��֝�m<q��n���)�5��SM���ڜ��#u^�s�D�]mNɣ������w���s�j3wfT2R��%����x������1`�B�<��˷�U!M-����\ʿ�w�5���>y+������C����U��%��}�y�k��j�7�8��%�Y��=�j{�~�����g��>K�y��Ǘ?�H�=�=�ę�6\��Zq�]5�q��ƾ�䨘���O�}�-��~%�d�K��6)m}|M㯝��Kc=K���>��R�Z�����)9��1�_���s�|�l���h�>�J;��zk����q����������8�                                                  ����IP�,  �mkBT���� ��                                                                    x�흍�)��q ĉ8�D�^��>׻gI@���X�jjg�iЃ����`0��`0���?������ϟ|�:����s�� e����Q����3|����ӧO|�:�2|�����.�}��;�7e��GF������O��6����_�Q�v��������]T��]�^�ˮg��{>pj�z���k�u��o{�y���ye����?��{�-�������x���/D:��3D��&򈼹e�^H��y�i#/OG�z��Ϫ��߯_��~�
:�sMe��#M��3Y�#=�2��Q�����Й���[\s=E��8�}E>�Gȩ�T���ڲ��T�g-��}������Vf���������o�SVw�zV}�.�/�>�~�<Vrv�@>�!?�U���������1����<�#������}����=�F[ ��~���QڋB�N�.�.+푹^ed���Lo+[\�-��k���d�W����(}����6�q��$�#�?z�6��Bө�i����?�L���7�!�3�O_Q}Пu���o����[�=��tk�ȋ��M�����!'}/�Ƈd��r2��_�C���ﲨ�:������`0:8�����o�=��+8-�4}�۞�c�ĥX�dq�{bU�����q��©ή��m�!�ƶ�g*Ϊ�U\z��[��GA��=^�+ru��{��LV����	�U�?)�V>�ғ��)��x��|�Y�ҁ��gi��\�yi�^c�U���o��*=�����!�����T���Y��?rf�g�����W��s�ʽV�n���*�V��X�#�=��F����ϫ��+[���F�~�yH�\L�~��[���O҇��h�5�ݵ����T����o��w�|Sf����ӟ�+���)���;���F���;:x�������)/�OS�y��U���o��2��e�)Ve3'w���gGg��=�J��^��`0��
ľ����u k�U,�Ks���ؑ5�nY�,��bXw{���w�&�����3�Qה��N��Qev�	�]��Ʒ���gcH��˞��i����{���A�3���I�8��h��w��d��u�w�����UI��W�q���8�����I�>�+���@��p��Qş���Gc�Z�����\ƪ������U���ߝ�]���/�:�����3d�;ɫ:gB9�R�����|GW~����w�2��;�fz<AǏ�ߊg��_��l����y����������=����U���y3=� ��[�6_�����3]U�_�������k�]���]�ײ�2��;��j���->��t|��+�i5���n����Οg�Z�Y|<�1NyŬ|E7�k���������?����z/k���>�<���=�Α}N����΅���>�u�Wy�d�ʬ���dz��`0*��\?W8�G������Y����:����Dg��c�g<���2+��������'�W��6��qn؟{�r�u�"w�<�Tk��.��\�r���n�O����>U쏘~c�#T?��+��y��{�Q��,�,^�qF/X��v8�.֩g��3}�ȸ�OP��~n%�hU�G4���(_��sn|W}Tg&x^c���,F��������ѭ����+�<���#+}/�Uw8B�Rh_�����|�33!m�r\7U9�m��({�ѝp���ve��w��[���x��G�������]�߱?g;�,�n�ҽ�ow8�]���ו����b�����?��OV�=��Z�_������#�ve�?��v��N_W��������r�YL���o;�����1�g�9pV^�G�~>�[_��v�NO�S��3��`0������Q����[�����	veO\k^8 ֔��v<�Zbz����\��O�p���b�n$~�}���o�z�3�јmK���vU���]^�i�N���WA��#��x�딫���j��t���q��:���E=�z%օ�q�)Cc��Y�E����q����yRG�-�+u(K\�h�P�'��*^ء��^���q�=m=y|K���vūe���\��rȊ�4���=���{W���1����;=ݷ��x��p�;o@>���Ș�T\Ԏ�+C��=*�ɫ|��G�JO�C��W]��x�1.��ﵠ9_E�б����V�q�����)v�(��ʑ}��[G���w����Ǻ���{-�o���Sdו_˞��׃���2��;iT&�w*��w�����:�����g׭��S�O��s���j����%Z�[~_˯d�֮���+�������w]��7��`0����]��k��I�u��+e�L]���ւ�oA^���;=GR��?� �v쯱�;<��y�� o�$N�1紈=:ߥP�V��u��<�� <&����3K�yC��/�4��r�)i=��*/|Ύ^�]�Q�NН1q�G���w>ù{��<F������V��r�2�n��lo�؍ا�|�m�o��'�qb���Ӌ��r�`e��ef����6
0�lz��sA�_������x7��췣*�U}��R�%�+���C�����_�	�ڟ~I\�Q��~�k�y��#_��jo~DyU���^���`5���p����k��o�?:��ˮ��C����w�������>?�Kv��:A���}E:���_�n+{��u��=����r����q͓�̳]>>��d�}+�����|L������0���1��`0�l���e������g:��׺񶊝�`W��,3�O�?���]��\9�P����~�[��kO��W�i�Gc~�)��-<�w��.��3q�}��'v�u�w$V���n��v��(�r������5��2���S;W����k�_�K�ϔ�8B/���h��E�ՠ�'�9�w?K;�x:�x�<��|@��c��Ͻ����V��y���c��@ۖ�Sw�8B��q����]��=��2�l�B�e6V}e��������R�(�������	V��e��ZT��4���ad��e2ޒ�+n�Y����B�����Tq��S�����ߔ�<�����[&�=�f��[|�����s�z�P�)G������}{Zׅ�3���n7�j�p�W��wf�t��E�w���[ǽ�;�����`l?��`0��`0��`���{������~��������i`oL�y�>uo���i\q��K�|}�� ��7��Svu9�G���쯿c¾#���>�,�jo��w{�Ն���ݲ�L��=�mW����2u_�����8د���jo�?���k��D���߱��m����w�>���#��}������E:��OۡO;<���s��y����}�ڛ�k�}~����|�M���'8CT����o+�[W���������U����Q���r'����\��'�t�TY��w��z.D�=��W|��~q=_�� y��M������������Ǐk�t��bS=2��|�ұ�y�N�_}O��e���摽ۏ����tL��S6�q`C���jf��3�#��ܰ�?z�1���H���]������\"�W���]�����O;�2'@���@~tG��:�����{��u����7m1��Q]�PW�V�2�S���z]ϥz��s������3��]v�����xwҞ��:ڗ>�y��`���$j��w�  ymkBT���� �6                                                                    x�횉m�0]HI!)$����FR�?6�c<lHٱd��t���C"��+��RJ)��RJ��������kJ�߃��L��_SU��n7���s����s~�u�U�-U�yy9�c���������/Ju�z?��i�����>>>~� sm��+�v�u�Ց�νY�u�8����uN�?�WP>�1Js��WiV�����_uK�E��ϸ�/r����_�gK�W]ױ���EY�cl��,[��T�YH�T��������������}x���L#}A� ����G��V�7���^�}>�iҞ��-�����i���;}�LJ���X�&�T�P�3�T�#��ߨg���J��l e��'�=���?�͘o���n���a�����|7��>��?ǐ�U�%�;�������/�m���N/��I����f�Qփ�z{��<�d��6�d�n�;������Q��m�{{�5�$���iѦx��g<�$�"�^�%=����RJ)��S����t�e/�֔� ��a};k���_��y�?�9Ԛ�l�z���}m#��G��Kk!����k(�9�G��1�����z��,�Q�&�l�iV濊����#_�<���3�Ξm$�^9g�{9&�w�&��:˙�u��f֚��R��:ֽL+mW���W^���z%�I���2���lo���Z�f?�k4�W���-�#��	?V/�c^��!�!{u̵ʴU���ٷ�A�����Ge>G}�?�����v✽��3��X~j����{�zT��A�O^��ʰ�>��?s�y��|����G)�P�</1�1~2�ў׆�R/�7�� Ӿsm�sr����"�(�����2��c�Ϲ;�~�u-��)}����<�U�1�g���:�a�p�b�5{��3�(���k�!m'mʞ����2��.�~[�)}G�κb��XE�L��������p�aԃ���7���7���Fy�0�@ߋL?󞕹��Khi�@=���RJ)��RJ)��RJ]M;�;����j�;��  SmkBT���� ��                                                                    x����i�`�Qqqqq�����!��	�C�O��Ml�S�$I�$I�$I�$I�$I�$I�q��O�9˵w���O�o]�s�s������,�Խu˲<^�0��t�c�}�av���=��7����_��{V9��z�}��ٿ�^���s��_���y~�?���}e�z���۶�������������@��w��E՟�k�$I�$I�$I��                                         �@?
���R�*f  *mkBT���� ��                                                                   x��}+��(���H,��"�H$��"#�X$������,�Q������ԈZs�>U{�	�.�.T��}6� ڳ�-��F`���p]�k ߅~��b��
�
О$�wݓٱ����|s��Co ���A+�q3��lO�x�@�(�0�a��+?�	��T,�_��7��s\���Ϙ^Bl1)�C��+�k�(�FyN"8��dPC�_9��>O0&l�4��Im+���n�w��G�rŰ����<Q��q	�	+����H�}����e��q���~~�[).�5c��6,�������m�uO���9p\���<//?����N�:��Mp)� �Ĝ-�2p�'�uKq`���_������/���6�4<~ ��77S����N��BQ�����맨�uM��{���5�%.B�NɊk:	k�N��m�9���*�u�U�|2���%;������]F�aג)��RE%HWc0Mg�>��)/tih�f���	ѸX�>����E����)��<,�6�s4����5�z�b�?��J���\<OM%O#(7�6�:�=	����ӋYA��H���L�s6��M�X���BcX�&ǘJ�te�.�����	3.je(��?�<?�-1�$p�O= �x����	]<Jt¡�Vg��`|I,<丕}�F�Qj]�o%[Pa���6�XY��<��?�Yoh �F��067ၭ6JF�G[��wv)��7?,�@w�
�nM�Ǧ�m��k>?���L�j��=���%w�Z�izFTx��$��kP�8�E��m��	jAO�����ހ��>~������؆���B9���	�֤8U��KC�v�jb�L���C��y����;�mjP.� ����Dk���w��U�E�3�ܨ�����8x�U��J���s����\���ɟ�+;}s�F�Q(KI����Xݛ�ƨ
�1���+K����dX�];Jģ��c�x$��D�׷���X`i� ���@l̏�rn�m$���^�9΄�zBGϞ�Q=�nf�k�D���e;
<���a��>,�⢞�j��k�0B�[p(��$� ��Ǡ����p�4n��q`�XƓ�	�vϵ���.x�Hn���or�J���5�����H�u����뇗�f����a����[Z:><�M@J�9����$�q]� }=H�k��3�����鲺t�Q�=�,	7���߻����s�>��3�����6[��g���RL�؍����?�(�&w�.7C#~B{�]��
��U�W�7��1jk~�e�cG��r�����D�.=��K�����@�W�ǱM�0倐�����0�\��x��v�q�NZ�>#�����BE�	��)���&y�A}t�?B��Y�m(�WIp�ɱ���|�2�+���\2�� ��)�l�8��tl�@Z.B�����e񅋍�RS��ƃm>d�I���l���'Na�dĢG3�%���#�)?��$s�	_5=��Y�BR#-k"qGP-�e�"�f����%֩-ϓ37�����8�M9��ϊ�,���_*n;H����EBƱ��cl�~����˝[��/sa�g�IE2�,z�1�t�:�kL��������ș壋G)��{7�o���nd������{@r�P�>�k�w�k׽��#�kXfy��E����A��B�9�uM���4P=�_�l���gW��؇�N��#�_n��G�pp,Z��Uu�6ȓ��V��Ӱ��0EK�7*|��]�{��75F\�Զ��zQ��z!��	uH�>���up�����T٣�o3P)���[�^�6�����` -�d&�*=�%���fY�<�^��ط`_6����|h���3ء>��2 P��q��7ώ����,Ns�j�F�=B���`�큳�C���i�U�)R鐏@L��Ү�����ǧmb<2FH�Rq��ùF�����X�i�䎲�Om�GA�����}:�*��u�f�:@ʫRH�.��6���6�j���c�GOpO-��6H�����K��J��U���:�Jǃ�����v<gz���� ��1F*qm�-;�I� 7?��O�(Yr�de�
��F��	��ѥ��r��H���a���ۡ�>� ,����3��D�Z��E��Ʈ�qq���7p�?��Ȍ�K����%ȧ$�;�?�Q�r�6�pP7`�a����^=����R�_����)m���>�D3#£�_'�I��ɭu͋C��-R�ne㯄����ss���L��<ȭ/��R)|Lt_1����<u�}E
D�zl��$H�+�N_2�scۯ-�rH�V.��������֏'���(}�o	��:]謧�6�Fhlw���@��z�{6�P_�?�E����h���߹���v��K�/�B�"M���h;������б�o��)gRm �$�5�, �E�x�(?�:�g�U뵅F�4���� 	���߹�E4��!��q?l���A����Yv��s:mR�(G��Z�y�Gq�+w0)Nz����u�Y�-�&�����"�Y	='I����8��{��m�L/~�����!�����.�B�����A=���缱Y��|z��:f�#¬oh�2Xj��ǼI|1��i3A(|��vf1���NK���L�ͫ�.����?�r�]�qBS�^#o��.l�%z�⁋���Y��~i�䔃P� �q�u&7(��U;B��l zF�x׎����M����,|PfV�֠�k��'�N��b̔/�$EN���
HA�i��Q=�u-/T�QAD9����g��W���%YZ�\���aԥ��5�O�jr�����u"9��B�zp�̬�vl��l=��ɸY���y�ܾ5t�����mE��z�+���M���>�L�k�=�rr4�����/g��E�r��~P��nB�[��\g[{����g��Y�vR�W'��
{Fe�m1���{�w�L��;�7�&$���x�c����0����n�����&��u�@5sC�Cձm��8H��ef���t��<PJZ��@����������4�K|��#`}a�kRN���'�~IU!�k�W��L��Z��D�NK����̡U��������;��g��L~a(]��!Bjv�(�f�������\��B�}�AuH�R���� �g����M��<7�O��:���[�m6u�v����;3��=���w�w�n����������3pK��M�������{�. t�"��nt�?��di�b�C6��=��E	�����,��ѮO�
���0�h�v��G��;=���MV%����ʪ�r�� ���4�H8r���K썀�x��A�:�2�e�.���ݟ0N<g�����'�����6��%��G�1�ַm}�^j�n�ҽ�S�0Cz���LX�3���U���M;^��^~Xc����a�vGHu"��1��kN�K�T�?,���r�=�܎�X}6CBW6ۻ �F��\�3�m{4!]9�ử��J4n��5J�s�w��^�D��h����z�������8���P�]�z���1�x��~ ��J8#c�%�Ͼ��cF{d�����o��@w�0�QsP���_́� ?3yB2Đ{|��5����}�>x{q(a���тa�?����Q�%��l���4�ςxmWI׆�G���C����1���k�Q���3iJh�,�������K��R����������O`���ʲ���<!�[��Nw���a�����Z���x�\Rtv��^ZJ��a\(��Z�PE����� 1��ޣ�h�����y0�S �L!�y�QP̞�#R@ӱ&4�a�9'2��ċ�I�E�8X��Ir��
4��*y��b��˼�/#�x����;�2R~ ������O7���h�՘U��^�k�����(侠,���2���)�C�:(ِ;�Q3>��4�)�%���b6�B8�\�� p�����e<��S������+�js��p����%<&t{3?���|N)p7b�����?�a�i�D�Wl�����X���Z�>;u��)�ko)#W���S�n�cR�x��{[�sXv1��95�_��0K�����ՙ7�>� Tp�5���ٴ�l3�S�"؝�LX��睫[�5m�����Q ="u}���pϘ*x�b�Չ����#iM+��@�Z!�	��Ϯ~j��Y�ݬ����$?5���mt�u�] �%�@��݅:4h8ۃ����tu�3�;�
ΑO�1A/r����
��R*5������i�&j#Y2:�$Z(a�d�@�>'z
���L�����뇶��6Z���8|`�6�"�X1�_�z'�F-���я�?��X^�A:?1�;��h/K�VB'��vOn�FS���Ƥ����Q{=kh7��M��wXQ�p�\v�͓�O/��.����
�N3��HKR��l�K�"�q��^W��h��1wt��h@���3�e6�N|������I;y��?8t[�[�!����$,ήL��e�"�z��%IކA�k��R�l!3u�8�ځy��?_�W��)�AbC����O�!rz��a��5S��n֗���#�<�43y��6"���R����߃C��Q�&>�[��#
B H�ǽ�{v�e��kO��T�lq(�UH�͵h��ݔ8�,@t�����ՂL�{p����/�*�L"�d_y��k,4�G̖��bD>,��.ok"�D;�|7�[.�D�C�A���#�i���l����ϟ�I֬�����D�q�]+�eE	��_�--����ڰc�����^���L��q�1~�C��C�����C�9��gN��������H�8Bkh��J��#Z�-`�V�o��M�a 9r$ �պZ-�h�kh�
?C�$�	�^��tď��9d(�8P݅]ڶ���w[�wl��;��d��n�׆�o�K��d�H�ބ(D������In�I� M���_( ��������5)6H/���Y�1�� �QR�k,n���XH��ʉ�����?>��df��&6����^EJ�m���t��{�C�����C�c`���0ʅv5��x<��\9Y���c�����}1�06"״!֏��9�dl:'��1H"�<HN�&]�5���6�9�!I�1;"����YxA��K-�y�m|h�d�"]������U�.ak�gbbw24�������j-� Q��� Od�-���:N�	dG��˥M��������I	V�G=�W�!r6�w�H3����p"��ۋ����#g6*x�9��k{H��<W�����BQߍO�MV��{Kh��^<�F�W<�L����:w$|�oY��-Q]<ʫ��!�!垹��F�q@}3f�R�%���oĿM���r�D����+�N|�Y�Y���6�j�r1�1k4��i'X��f�\:�e�޼� �~�P9���1�ߍ��
��&7�8Q�ape�������5 9os�M�y�	�K-��u��u9��Bdx7H�V����&�_���!C�lgL �04���yS��}|�qٳ�k������b�s:f�'/����㼳@!�]%���z#�=�J�s�`3�W ez<�PIG�C����0�@�4�������5�5g��x�c��T�G���U�#�R�CC�?tdx���L`�Ɓ8����dgsT�?M6},_��� �\�k٬���lt΄l�s��:m"2��5�be\]\�˛��{xa�Lo��Q�lPwK7���?M ^a,�_�lb(��1�?�����3��݌^7���:���ރ��^�us�ϚqB�8*���h�Gx��Y�C�m5�M~�{Sg�9n�RX�C}[����hO�tC��1#W3�*��:;�&_�G�ۂ�&�H|������5�L���<4Ƀ��\b�������D?]fM{V6*�S�<����e��0,�!��A��ؾ�������K��m��m���ߍ�r���O�oC������2�
���#��p'$�F�˿@!�{0�V��YW���oe�,��'��H'���`�r�1�����#�ͿMRS��Y����ZB�h�|�x��H�@6�YziWl�wQ��}�yqs��!`��~y#�-O�Ց����I�X���m������y�����|��*0o@��]ۓ�^(`P�q��v��ef���v�'�OA=B����݂p��C�J#
��֞����q��5�R������wV&�)ԩ��n@po��]��{3�v�:�������Y���f*aW��_�&'
Jk0n����D�x���\/H����D�u�qZ�\ڌG+啵X�Z�T>z'7�Q��q������Ɍ�#K�R.�/C��V��g�Q�Ȭ�����\��`��?d��1y���uM�6Ƶ8ZX]8��^p��wQ�E��&�1frR��Ki����$G�����ݜ����Е���h3'���������{���;;�~F��K�37�k���u<p��dʎ��+C�����R���Mz�Ə�7)n Ҁ���� lEGy�l��:̑�I���o�B�<A\���\6�d���F��q�ϡɅQ�[�1<k���N�>���S%|��Е�sTu�le���b�A}A�����ʹ�1��0�A{�K��ʘӺ�tj����dLI=r�	�PRg����_Lb�R���Ş�l?�␔�)!��[��F��o��wi&k^�CV(t@p�W2����{h�x�H�GRn�͉�eCb�xԉ����6G�������Q��d27\�ثd�S��=\�F�f*�0�ۣ �OP���5(r�ZߙxQ�Z>�~G�AeN-����jY��7�Ҿn;�n?ӹ"P��x�}���/�N�� �W:݊&��׾��:x"ꭥу;��R�펔���c䛅љ�������ElmG§a=�h�¨BG_�u���YnZ쫭FYs �U�"zM&�:��Gn��u�.�DX���5Xn�����;�}�ԫ%XO?�~2&����Frjj���8��yA���*�W	������I�����9/��u�b)��Z�l:�s�� 8�5��J��>~�i�������I<�k��¶�٤�^�S�x�[����s��GD����(� +��"E���HnֆA_��\F�Z���%������?��4`���w��_{�7��"��0�Y��@�f}�������PEj�m��v:�Q������rN��[w���z�*���5�c?�j������f�7���?K_�P��', sZ(oT|��Ó\-%�蔒�h���y������\	cK/	˧YGԻڐ����z&c"*�(,�����y�E�q(�y�[���q`�a�7Xļ��~�����R���/��{h�h���"�g��=w���ݠ�՗���?����̶�uNh{�g��?tq���m�,�u�[�Y���ot��+�!�hf��.2]�ݹ?�&��wA�R���F�ľ붾Ue���%��d��l�i�����q��Ms&�6�X�w-&�Y���3(���G9��{cׁ�֬ǿM��;����v����n�"���b��)�<�׾���e_�1���p����}��11��F#��YX��p�q]��s��,[�%*&��@�D�f��ҹA�ٙfs���,���>��3Y�ԕ;�:#hEL�ם[ROd��^G�A�˩f�~Y!����E���n���0�~��/�A��
�K�m���>^��WY�q�"���<цF����*c��:x�w�|�͞w��%�ehRg�������d�9��̕���v�3�vDg��h�>>?��3�h�YDk�gC�(ʹ�ԕ���S����Ԝ|�2Q��94�(�?OG�Q34�f�cc��PopT�Ya��W(�>��@�t�X4�`�LG�ٞp��Ʉ�a��Űl\�[9�c�26��UM6f,���� '����C���4�i<D�n��#�x��гHz5�[�
�_������Qt��m�vN�C_��`��x����~Mbs �PEx���؇;���cW��*n\��?���׿v�:O��3@f����R�&�e������m�[mٜC���5f(�M����Ni��YX�xШ���=�4
y�HO�<�0|���3����[��B	:d1�"Z�O$+Kx�i̒=�s��J����g���~�i[Rz'����G�#�v��}�>�?W~p�sϠ?��k��A��K�rŵ���k@�I�|>^x�s�?�\��`,D���̒�����5��W����^����w�D��M���Xf_8<%| 8_왉pP�1����W��lm߃���f?4����:��́�_�Ԕv ���M�;k�:p�����_���sj؎qw]$F��}���y����,b'��N���=�o�����0,
�������~��M����
Y�R���4�6+!��}@~u�j�ct�C����P.�Y(�x�׎����z�?70�WXFܣ�o�����3z����0���c8�R��G��g�0���T�U��򄽻��w�"/4��֏�����C�Q`[{O���c�n�]��+�{�{�����N!�3��<���V��yx�,!C
�b�.��lf�����'���\ ן�����gu,μ���w-/��3ۥ����N���X(�c����o�MD�s��a�#�#0{c����%�uDWCB�Z�A��Z6�,؏��x�(Z%�����w����HbhTb2��<$��*c���nk���_�א�����#{D+B<�!���S/�g�Ï`�9��.^]��ß��C��+>��3�+��5��]�q����p�j'
r�9��FDȬ)~:�����9Gm��x2���-?s�raG"yvU��pa;R�����ă� �A�\&���
�?�#��n	��0�ee����d~o�q嶭�! !ǲP^H)>�o��ȑ.�ļ�Զ=Hy�7�S�-M�
�?���8y�c���ߧq�|�#�5"�2Б�l�m#��U������e�Τ�V���bM���͘�jA�c7�Z
�]>4�gb�
����s	2WRsKg�6���'s8qz�TT[�R�[w� �)I��9�5x���Wj��#�!nN+zP��ڔ�	�Kg���TE�,�����?��{�^R�Dݥ=�R�u^zîc������&D��'i74�S�J�ߔ��&H��U�G�[���cr�ͦ��<����׿~��4}څ��h���;���lpAZ�%�X�Z;t�Q?������y��k1+Ƴu6�[������D��c4�Ɯ����*d��B#!}��e>�samh����G3c^��8u9󼵕⸈߂�U�y��B;f"Y�i=�D�=����4��&�����|�C���3����g]�~���WgjhSIXU��"1A5Fr4�{����A��lj�w�T����t6<�/N�� �\����R�t���a|�i���>�T.�Wo>>�x��ϯ�Y���{緷 m,J�{gg}�v~)�]��s!?w���X�����G�F��l!7��U��|Cn�fﳅ:.@mq%��臔����Ru?.��:��aB�ֺ��E#G�g'yX�D��u�SW��ǊD)��21�ѵ�V��agW��P���q����Ȓ��s�?¶�@�g")����s\�T���{��f3g��o���^w:^�" ��{��d#�!φt�}�,n�yWFKv�X�4��|<��B+���8�i=�-;��X	5l=/xl��w����n�]� 
�+S�Ӽ,{՞ �/Д�V ���+<<�����o �����ԇeNp�^O������OvqR� �wHF3�݁�=o��;�`~k�R�wC�����u¦�k�jE�|��qϩ���KV,���*?���xk��}Q�x�U���/M������=��հp����=犐�^x�Bˏ���Kx���@�[���I���YB]T��➐������Kq�.ὀP��w����AG\��W�ϋ���9���2S���A\�Y\��y=Ǩ�Gj������բ�M�@�tԂ��vD���z�+���Bĺ\������լ����6��k�6L��ʦ�R�_r�n�l|UAϯ<
���|��!��;��8�_1�g�sލ��C����� >�VB�~�,����˘_�&f���jp�/W�ԍ�wa �O ���H3�����I`���u�����1�ͤ��������+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W��|�+_��W����ݚ�w)��  �mkBT���� ��                                                                    x��;n#9���N70p0P�\�6�#�
:�F�'R����.��N`�ڮ���d���0c5�����"�o���                            0����c���t�u:NgGw��c	��8V�f��O��'w?��t�;��x.ְ�I�.��)1a;���ٟ�,��>w�����!o�+��1�ߍ�{��+�-��;�[��Wj��_L �k��Z�|h_�����ul`��O��Oew%6�*�ϝ_��k
װ��z�����(^]Ú�����gw�]L�<9��0��k����Y���������|v�v0�>��_{﷤���K������?�������ڀ�L� �_[%���}7���׎�޻~�x��a�o	���=��G����<��>a��F�����̸�q�3����q�<���k�|,����)��i~�ȼ��o���Uύ{q�n�=��$(��[�V�|JՄdG)�8����{a��f�0���̍'�K���5���ԄC�)�{��V����)����^s��H6b����ʜـ�O�ʹ��V�Yc�K�3U�0fџ�C������&jo=۹r��c�ڽ%?�j@.������T=S�O��!{�Z{[��dk���� �>���<�~��7�~N��Kk������L�5�����e��j}�Oߙ�ܳ��o��R=3�� �S	�K��Ҟ����z��Sm5��`���O�=c�g
�o����k��ބ��ANS"�����r�/vϩ���]D���Zߗҟ��s9]�N��G����Ŕ)�O1ZZ�c��Ϋ�}��\?�)��
Z�>�,i:%�	�܀�GE������u�S�=A�g[_AB���~�|�������p�\�'�s|����zR�w�`nV��� ����D.���Kҟ��Y�����x�����U߇��e�O3d�������h}��Z���</�=�s���;Z�w���V���JXc��=�TR�q>��0��?�#��	���t}i�k�{�1�"�{N	��^��8�Y�>�4�劖��|����Vq�H�I׋�I�3u?�����B����������և��o�%����;sAy�E��'�0�~c�_x���͇['�ֿv�%V���$;�ഈ��/�3R��z���'j�bx�n�ω��~!�����Ij�_�C�k���u����-�n<Ֆa����j��}��������=_Kϔ���t��jC�%)�p���5���wj�!ڞ�i/ȓ{F?�����˾4��i*C�[����{=��J�֚��<�sL�v&-m�.<�2t߷��5}�e�G;�����-g=S��^g�w[�?���4%�U?)����#������O��O,'�a.9}~�<����v��>�y�ӵ��D�Z��}��<v���Ǟץۀ�}D�um� �����������,g���@�X��:��obP�B�$�.��� ��|R���P�)�ƛ&���5���⠵���Ԋ'gGk����b剭��!+�9�                                                    �U�������o  2!iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?>
<x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        ">
   <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
      <rdf:Description rdf:about=""
            xmlns:xmp="http://ns.adobe.com/xap/1.0/">
         <xmp:CreatorTool>Adobe Fireworks CS5 11.0.0.484 Windows</xmp:CreatorTool>
         <xmp:CreateDate>2019-12-24T16:35:47Z</xmp:CreateDate>
         <xmp:ModifyDate>2019-12-24T16:36:58Z</xmp:ModifyDate>
      </rdf:Description>
      <rdf:Description rdf:about=""
            xmlns:dc="http://purl.org/dc/elements/1.1/">
         <dc:format>image/png</dc:format>
      </rdf:Description>
   </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                            
<?xpacket end="w"?> �r\  �IDATx��1s�ǡ����,���2bz"��v���.���Y�#wS�j�"R�B̘�ŉ<�V�|q���wN�=��,{{��fvn�[�{��=<<<\��  L�k, �T�` & 0 X �� � L `2@�  �� �, �d�` & 0 X �� � L `2@�  �� �, �d�` &Cs���?{Ͼ�����_��t� Xo,+N;���������7����)V�ތ|�  kBu��"u߾��'���\��� W�*��y��xhtVT)d}�p��9 L�_}���}��������t��g�w����[Ƕ�Z_co��b�k_��:֔��Z�z��3ג�ᯏ��C������k}���
�u���w���q�
�Y�z�Yyy떭���u�*�I������V�.Flè@� a���^{YB�޷��f�߇�ν1��H��Xؗ?���ߛKѺ��VXȺ�{ϊK��j��^F�ź"����H~9Fc|iE��؍hV\��/י��K���Χ��A�ߣYW�Z��X�0�b5�0�3+Z�c7�%,@Xq�:��;#��YW�J����Դu��r�D�����ه�eS�²��L�W��j]Z��0Æ+��ʈks��A�1��oJ�E�s�r�v��r[��oT�ȱ���z�|fE�`�Fk�p�	ܱ4;�,:�i�l�ȵỾ�A���o�������F��Y3s�پ�L!�a�U4�lCL�F����(�������O7}���Y�,o�Q$.�KD�E����Y��Ӛ��}������)WhM����ܼ[4�߱��f�G��K�e���?��/��Z'k���ځ��U X��%��#�죢aՎ}��֊�k����E����'WyY��, X2��XW!$$Z��.N����Fm&����g�+2cF�c
�|\˧��w���6���g��N�"_�YP��);�`u�������ޓ�g���|o�`~�D�~¯%��Y{��9��u��7G��8�]�r'8|g9sǱmo2:y��u����Q�v�ߗ��ܣ�#,�ݒf�\�kt��P��(G]��S����:��\I�}_�p�B��x�h��pY|[��o��s�r�Z3���} ��7��*{M;�R�|{Ķ�2\,�o�?�RΠ;���m�[�Ϡ/R�(��ٳ��殮`ٲ�Nn���$�0{�ͥh�\O"fI#*u�!*J�Ʊ�Y7(�'Y[\{�-.o����_YR�k��CR�uj�-�����9V���,��վ����(K7�-���-O(�=p��ܞ����&�(�8�j%X�"���%��	o��s��`e�a���b{��Ҝ�����	V�Xy�%?B{��[��m���x�:5y"�[�0Fg�*:�)��}mx��#/!z߶�"Q�&kf�n1e���,�Ä����ZќF-�]_Q'����gk� X�%�b?�U�w)O�X�Ŭ��
�О}��K�ܵ�j��!G��)��R�tC���Ol��$���d[���K�e˜'DMý�O��`wri���jϗ�uR�S+�b:'�(����>�LkVuA�\{�?0K�(	m�����h��,\���zU�*�w�]*�¶�~�^���%�L6j�ZYCV�~h��ZY=�&+0�˞顡����uΒv���8�c�����,��T�g�CA�u`ʳ���ȗ���>�l0a;���k�}o��^�n��Z���qId��T-@���;���J�H!��E�v;����䝻Ln������AݜJ���4g�z$K�O�/�F��wKC�s�fnԱԎ��w�S��I��>��ܛV��ץ���ĊUj�V#�K���������j��S��I�a���x�-?7�CD�oǝ�L���̵�ĝ'vr{޶I��,Z��<"X�P��q�JC���5�=/��ԙ�N�w�Yk��{m�`%&	V|S	+rE��5s�C�u'q�BI�.L�\W�̡ҟ��Y�NAC�����O�>�����O��p��	 =���Y?���X+��#�)v�԰P؝e~ݹ����}G�����U�,��@����+��VG�R����8�=�`��I5���5|��+V)������&+�Ss;��"�ĺ�XxV��s�B�W��0��|$��M:1N�w���i�$�b�j���,�Gy%� (#YY]!�h%�V���.X�+�P�po2�Ygu[
]Ȍ��m�t� BĒ�] 1n+���:�,��>��2aX�&���#t1u0Ӧ��$�$y^+���7E����HۻB.	֊�ʰ��^Dk
!w��ם�B

M,*%)X����������������W�����R@(s����\��?����vR�2PT&��)K�\N�i�R��D��t��rݸ2I���ւ��P[�hhxC�5<5�,1|a ���R�8�'��~p�+���,�Y�%XчG�|'kI$�vǗ��5;�!�`�f�<��������~���^t��j��P�E�y�+�+V�2�Г�ꏕ���
g9-u>��0��$�j'�f
C��!XAQ mVr�p#�*�߮���5%�"���v}� >�.Z�b�T߱���Q�Ynŝ��`U��e�cY�V��>��Y� .�n$X}�����`��Y��9��2��ͰhK���8�N�K\4����&��iIWvs�8�E$4C\A�����k��Y�iz�����,~^ ��/�H�r���DVZ�H$�Hq,F�w�d�vtI�m�|sJx%PR1Ě'�s�l�/+�\e�����%KK+Z+����`i�Δ���l�80��s���<*XE� N�1��`N�u����t�Dk)�a�D�;v?�����w�u�]�fx��o!X���!X�f	�pb!�C4�[y�����=YX=%�S/�=�z� ���q�k-��̑�&Y[K�K�{���K��1�	�&;B�� �5Lu��2P g,`0&@�k�A��mb���,��|�ut+���Y�ڤ�XLW�*ԕ&��+ �,�qt(�;�:�ݦ�9�gk�� ���b�+Ujp��
�IĖ"�rK>#6MG���Rъז���-Z�8��95kH?V4i�Ksa����_��n"�
u¨�F��'8�ג�\)�W,�Ԇ���M�j�tmj�)!X�5x�\�`%��E�H���5k����|o�h'��Fc�A{w�/�f�@���K�乹�S$ҝ,	�&�oG��!P��H��&�>lF[n�snQ[K->�|�ט�TaP�<��v�r��d]e��j��{�}�*&l)XbǑ3��H����ļ��$e3�z���>rgy1�.r:bt�11�Iõ3w-�	���=ߩ)#�_l�`p�:0�Y<K���U��`��uu�'2��\�Yp�����`�s��\HD8��9)v)��DK��<>��7��?�t4�vS$"�A��\��>�M�,}NN��G}��a�[��b�?ؚ��Z�á܈��5J��C=t3�.�7Kc���ɵ�*EEEfJ-�Y�q^ܦ��u؄"��\����$��2l�/�"��ѐ���S�w`.��J'��*f��$3˦��@O\^(�p���;�J���-̓H6m�K��*�/�$m����Z
�;�w'�ܛ0G�c3�s���Ac�U�FTr�k�����1�r�/XĀ�Q�%���vv�6�ȴ���Y%]��ջ��A(�K�atn��w�sY���ԫJ
Xi���%��	1��i(*n����ЙHn8�������`��;T�pS��F�~ϭ�gc�\��׳bQd����TA�+��`�f�sz����`�vP��C��D�UuJ��j��e���M0�	���%�7�pS����e.��C�~V�@���z�V/}��Hv��>�u�
Mf����]_r'�>�\�#�����kH�zn'X���d��u {�`��Z��D�l�S�K�}y��+[��c�5�#XA$
~#���8w�ǩM$���x���}��th2q~�G��&%��:�9�?/�'�^��0����`#��ՠ(��%N4�j��!���~U'J�<��w�:XOD�"&&Z����� �Ab{�&��A{��ELD�^�cb5mH�4Ü��:��Q	aE��YGf=��}V`��Br3h4�ѷR>'0MԂE8G��i�p/�.<�9�%�K͗,u-%��� �M�`yFX�㕹�7�kk0�g�n��%��L�"�"��Ek[.�!`Um06��pp�),��D��/\$T$�O�X�Lz.$&V�΀͢�`y��E��9_�1OC�#XT�O�u~4���j��&X!nFq���o�q�簦�=3�D��i1�`uq��O��]�qN��uu��buEh"X hq�B-�zE�퍽�������/�����'�f�z@�  �� �, �d�` & 0 X �� � L `2@�  �� �, �d�` & 0 X �� � L `2@�  ���#�0^r��    IEND�B`�HightQualityTransparent	TransparentColor	clSkyBlue  TfrxMemoViewMe_EmpresaNameAllowVectorExport	Left�j����@Top�j���� @Width�<I�f���@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8WEMPRESA 
ParentFont  TfrxMemoViewMe_EmpresaDatos1AllowVectorExport	Left�j����@Top>�
Y�j�@Width�<I�f���@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8Wdatos1 
ParentFont  TfrxMemoViewMe_EmpresaDatos2AllowVectorExport	Left�j����@TopUގpZ�r�@Width�<I�f���@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8Wdatos2 
ParentFont     TfrxDBDatasetfrxDBDataset1UserNamefrxDBDataset1CloseDataSourceFieldAliases.Stringsid=idNombre=Nombretelefono=telefonoDireccion=DireccionCodPostal=CodPostalNombre_1=Nombre_1	Id_1=Id_1Comprobante=ComprobanteDebCred=DebCredFecha=FechaFechaVto=FechaVtoImporte=ImporteSaldo=SaldoObservaciones=Observaciones DataSetFDQuery1BCDToCurrencyLeft� Top`  
TfrxReport
frxReport2Version6.4.11DotMatrixReportIniFile\Software\Fast ReportsPreviewOptions.ButtonspbPrintpbLoadpbSavepbExportpbZoompbFind	pbOutlinepbPageSetuppbToolspbEditpbNavigatorpbExportQuick PreviewOptions.Zoom       ��?PrintOptions.PrinterPor defectoPrintOptions.PrintOnSheet ReportOptions.CreateDate ���2�@ReportOptions.LastChange �w�����@ScriptLanguagePascalScriptScriptText.Strings    :procedure MasterData1OnBeforePrint(Sender: TfrxComponent);begin    end;    6procedure Footer1OnBeforePrint(Sender: TfrxComponent);begin    end;    9procedure frxReport1OnStartReport(Sender: TfrxComponent);begin    end;    begin    end. OnStartReportfrxReport1OnStartReportLeftPTop� DatasetsDataSetfrxDBDataset2DataSetNamefrxDBDataset2  	Variables Style  TfrxDataPageDataHeight       �@Width       �@  TfrxReportPagePage1
PaperWidth       �@PaperHeight      ��@	PaperSize	
LeftMargin       �@RightMargin       �@	TopMargin       �@BottomMargin       �@ColumnsColumnWidth       �@ColumnPositions.Strings0 	Frame.Typ 
MirrorMode  TfrxMasterDataMasterData1FillTypeftBrush	Frame.Typ Height�j����@Top֨�ht��@Widthh��s���@OnBeforePrintMasterData1OnBeforePrintDataSetfrxDBDataset2DataSetNamefrxDBDataset2RowCount  TfrxMemoViewMemo8AllowVectorExport	Widthh��s���@Height�j����@	Frame.Typ Highlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclBlackHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition(<Line#> mod 2) = 0Highlight.FillTypeftBrushHighlight.Fill.BackColor��� Highlight.Frame.Typ   TfrxMemoViewfrxDBDataset1IdMovimientoAllowVectorExport	Width�	�c.�@Height�j����@	DataFieldidDataSetfrxDBDataset2DataSetNamefrxDBDataset2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset2."id"] 
ParentFont  TfrxMemoViewfrxDBDataset1ClientesNombreAllowVectorExport	Left>�
Y�j�@Width�����@Height�j����@	DataFieldNombreDataSetfrxDBDataset2DataSetNamefrxDBDataset2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8W[frxDBDataset2."Nombre"] 
ParentFont  TfrxMemoViewfrxDBDataset1SumaDeSaldoAllowVectorExport	Left6v�ꭁ��@Width6v�ꭁ��@Height�j����@	DataFieldTotalDataSetfrxDBDataset2DataSetNamefrxDBDataset2DisplayFormat.FormatStr%2.2fDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ HAlignhaRight
Memo.UTF8W[frxDBDataset2."Total"] 
ParentFont   
TfrxFooterFooter1FillTypeftBrush	Frame.Typ Height�	�c.�@Top2��Y��f�@Widthh��s���@OnBeforePrintFooter1OnBeforePrint TfrxMemoViewMemo1AllowVectorExport	Left���)�D��@Top�j���� @Widths�,&6��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBoldfsItalic 	Frame.Typ HAlignhaRight
ParentFont  TfrxMemoViewMemo9AllowVectorExport	LeftI�L���n�@Top�j���� @Width���)�D��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	Frame.Typ HAlignhaRight
Memo.UTF8W*[SUM(<frxDBDataset1."Total">,MasterData1)] 
ParentFont   
TfrxHeaderHeader1FillTypeftBrush	Frame.Typ Height>�
Y�j�@Top����W��@Widthh��s���@ TfrxMemoViewMemo2AllowVectorExport	Left�j���� @Top�j���� @Width.�&�@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WId 
ParentFont  TfrxMemoViewMemo3AllowVectorExport	Left>�
Y�j�@Top�j���� @Width6v�ꭁ��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WNombre 
ParentFont  TfrxMemoViewMemo4AllowVectorExport	Left6v�ꭁ��@Top�j���� @Width�<I�f���@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8W
   Dirección 
ParentFont  TfrxMemoViewMemo5AllowVectorExport	Left�j����@Top�j���� @Width���)�D��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WCiudad 
ParentFont  TfrxMemoViewMemo7AllowVectorExport	Left6v�ꭁ��@Top�j���� @Width��	K<�L�@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8WSaldo 
ParentFont  TfrxMemoViewMemo6AllowVectorExport	Left����W��@Top�j���� @Width�C�l����@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.TypftBottom 
Memo.UTF8W	   Teléfono 
ParentFont   TfrxReportTitleReportTitle1FillTypeftBrush	Frame.Typ Height��ǘ��H�@Top�	�c.�@Widthh��s���@ TfrxLineViewLine1AllowVectorExport	Top��	K<�L�@Widthh��s���@ColorclBlack	Frame.TypftTop Frame.Width       � @  TfrxMemoViewME_ReportTituloAlignbaWidthAllowVectorExport	TopE*�-9�@Widthh��s���@Height>�
Y�j�@Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ Fill.BackColor��� HAlignhaCenter
Memo.UTF8W   Título 
ParentFontVAlignvaCenter  TfrxPictureViewLogoAllowVectorExport	Left�j����@Top�j���� @WidthB�$���@Height׬mi�\.�@	Frame.Typ KeepAspectRatioHightQualityTransparent	TransparentColor	clSkyBlue  TfrxMemoViewMe_EmpresaNameAllowVectorExport	Left��N@a��@Top�j���� @Width�<I�f���@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.StylefsBold 	Frame.Typ 
Memo.UTF8WEMPRESA 
ParentFont  TfrxMemoViewMe_EmpresaDatos1AllowVectorExport	Left��N@a��@Top>�
Y�j�@Width�<I�f���@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8Wdatos1 
ParentFont  TfrxMemoViewMe_EmpresaDatos2AllowVectorExport	Left��N@a��@TopUގpZ�r�@Width�<I�f���@Height�j����@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameCalibri
Font.Style 	Frame.Typ 
Memo.UTF8Wdatos2 
ParentFont     TFDQueryFDQuery1
ConnectionFmMain.FDConnection1SQL.Strings|SELECT Clientes.id, Clientes.Nombre, Clientes.telefono, Clientes.Direccion,Ciudades.CodPostal, Ciudades.Nombre, Movimvta.Id,�   Movimvta.Comprobante, Movimvta.DebCred, Movimvta.Fecha, Movimvta.FechaVto, Movimvta.Importe, Movimvta.Saldo, Movimvta.Observaciones� FROM (Clientes INNER JOIN Movimvta ON Clientes.ID = Movimvta.IDCliente) INNER JOIN Ciudades ON Clientes.CodPostal = Ciudades.CodPostala  WHERE Movimvta.Saldo>0  AND  Movimvta.FechaVto<=CURDATE()  ORDER BY Clientes.ID, Movimvta.Fecha Left� Top(  TFDQueryFDQuery2
ConnectionFmMain.FDConnection1SQL.Strings8SELECT Clientes.id, Clientes.Nombre, Sum(Saldo) AS TotalH FROM (Clientes INNER JOIN Movimvta ON Clientes.ID = Movimvta.IDCliente)W WHERE Movimvta.Saldo>0 GROUP BY Clientes.Id ORDER BY Clientes.Nombre, Movimvta.Fecha;  LeftPTop(  TfrxDBDatasetfrxDBDataset2UserNamefrxDBDataset2CloseDataSourceFieldAliases.Stringsid=idNombre=NombreTotal=Total DataSetFDQuery2BCDToCurrencyLeftPTop`  TfrxPDFExportfrxPDFExport1UseFileCache	ShowProgress	OverwritePromptDataOnlyOpenAfterExportPrintOptimizedOutline
BackgroundHTMLTags	Quality_TransparencyAuthor
FastReportSubjectFastReport PDF exportProtectionFlagsePrinteModifyeCopyeAnnot HideToolbarHideMenubarHideWindowUI	FitWindowCenterWindowPrintScalingPdfAPDFStandardpsNone
PDFVersionpv17Left� Top�   TfrxXLSExportfrxXLSExport1UseFileCache	ShowProgress	OverwritePromptDataOnly	ExportEMF	AsText
Background	
FastExport	
PageBreaks	
EmptyLines	SuppressPageHeadersFootersLeft@Top�    