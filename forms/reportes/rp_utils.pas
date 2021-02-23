unit rp_utils;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, frxClass, frxExportPDF;

Procedure SetUpReporte( Reporte : TfrxReport; Titulo:String);

implementation

uses Main;

Procedure SetUpReporte( Reporte : TfrxReport; Titulo:String);

var Band: TfrxReportTitle;
 Memo: TfrxMemoView;
 Pie: TfrxPageFooter;
 PAge : TfrxReportPage;
Begin
 Page := TfrxReportPage(Reporte.Pages[1]);
 Pie := TfrxPageFooter(Reporte.FindObject('PageFooter1'));
 Memo := TfrxMemoView.Create(Pie);
 Memo.SetBounds(200, 0, 400, 20);
 Memo.Text := 'Generado por vallesoft.com.ar';
 Memo.Font.Size := 7;
 if fileexists( AjusteObj.LogoPath) then
   TfrxPictureView(Reporte.FindObject('Logo') ).Picture.LoadFromFile(AjusteObj.LogoPath) ; //  FmMain.Img_Logo.picture.graphic;
 TfrxMemoView(Reporte.FindObject('Me_EmpresaName')).Text :=  AjusteObj.EmpNombre;
 TfrxMemoView(Reporte.FindObject('Me_EmpresaDatos1')).Text :=  AjusteObj.EmpDatos1;
 TfrxMemoView(Reporte.FindObject('Me_EmpresaDatos2')).Text :=  AjusteObj.EmpDatos2;

 TfrxMemoView(Reporte.FindObject('ME_ReportTitulo')).Text :=  Titulo;
End;


end.
