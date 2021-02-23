unit PrintComprob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxBarcode, frxExportPDF, frxExportBaseDialog;

type
  TFmPrintComprob = class(TForm)
    DSItems: TfrxUserDataSet;
    frxBarCodeObject1: TfrxBarCodeObject;
    DS_Valores: TfrxUserDataSet;
    DS_Aplicaciones: TfrxUserDataSet;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure DS_AplicacionesGetValue(const VarName: string;
      var Value: Variant);
    procedure DSItemsGetValue(const VarName: string; var Value: Variant);
    procedure DS_ValoresGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ImprimirComprobVta( IdComprobante : LongInt);
    Procedure ExportPDFComprobVta(IdComprobante : LongInt; ArchivoNombre: String);
    Procedure ImprimirRecibo( IdComprobante : LongInt);
   // Procedure SendFacturaPDF(IdComprobante : LongInt;  Cliente: TCliente );
  end;

var
 FmPrintComprob: TFmPrintComprob;
implementation
{$R *.dfm}
uses
 //class
   comprobvta, fondos, Itemsvta,clientes, categimpositiva,
   ComprobVtaDefinidos,UtilsFunc, importsdll, main,printers,ShellApi;
var
   Factura : TComprobante;
   Formato_impres, Formato_PDF,Impresora : String;


procedure TFmPrintComprob.ExportPDFComprobVta(IdComprobante : LongInt; ArchivoNombre: String);
var
  Memo: TfrxMemoView;
  Pie: TfrxPageFooter;
  FileName : TFileName;
  oExportfilter : TfrxCustomExportFilter;
  frxPdfExport2 : TfrxPdfExport;
Begin
   Factura := TComprobante.Create;
   ComprobVtaLeerComp(IdComprobante,Factura);
   ReadDb_FormatoImpresion( Factura.PtoVta, Factura.TipoComprob, Formato_impres, Formato_PDF, Impresora );

   If not frxReport1.LoadFromFile(  AjusteObj.CarpReportes+ '\comprobantes\'+ Formato_PDF) Then
   Begin
    Mensaje('El formato asociado a este tipo de comprobante no se ha encontrado. Verifique en Configuración / Comprob. Vta.','Formato de impresión',3 );
    exit;
   End;
   frxReport1.PrintOptions.Printer := Impresora;
   DSItems.RangeEnd := reCount;
   DSItems.RangeEndCount := Factura.ListaItems.Count;

   frxPdfExport2 := TfrxPdfExport.Create(nil);
   oExportfilter := TfrxCustomExportFilter(frxPDFExport2);

   FileName := AjusteObj.CarpExportacion+ '\' + ArchivoNombre;

   oExportFilter.ShowDialog := false;
   oExportFilter.FileName := FileName  ;
   oExportFilter.OverwritePrompt := FALSE;

   frxReport1.prepareReport(True);
   frxReport1.Export(oExportFilter);
   FrxPDFExport2.free;

End;

Procedure  TFmPrintComprob.ImprimirComprobVta(IdComprobante : LongInt);
var
  Memo: TfrxMemoView;
  Pie: TfrxPageFooter;
Begin
  Factura := TComprobante.Create;
  ComprobVtaLeerComp(IdComprobante,Factura);
  ReadDb_FormatoImpresion( Factura.PtoVta, Factura.TipoComprob, Formato_impres, Formato_PDF, Impresora );

  If not frxReport1.LoadFromFile(  AjusteObj.CarpReportes+'\comprobantes\'+ Formato_impres) Then
   Begin
    Mensaje('El formato asociado a este tipo de comprobante no se ha encontrado. Verifique en Configuración / Comprob. Vta.','Formato de impresión',3 );
    exit;
   End;

//  if Printer.Printers.IndexOf( Impres ) < 0 then
// Mensaje('Impresora no definida', 'error',3 );  else
//  Mensaje( IntToStr(Printer.Printers.IndexOf( Impres )), 'Nro Impresora',3 );

   frxReport1.PrintOptions.Printer := Impresora;
   DSItems.RangeEnd := reCount;
   DSItems.RangeEndCount := Factura.ListaItems.Count;

{  Pie := TfrxPageFooter(FmPrintComprob.frxReport1.FindObject('PageFooter1'));
   Memo := TfrxMemoView.Create(Pie);
   Memo.SetBounds(200, Pie.Height-20, 400, Pie.Height);
   Memo.Text := 'Comprobante emitido con Valle Gestión - www.vallesoft.com.ar';
   Memo.Font.Size := 7;        }

   frxReport1.ShowReport;
   Factura.Free;
 End;

Procedure  TFmPrintComprob.ImprimirRecibo( IdComprobante : LongInt);
Begin
   Factura := TComprobante.Create;
   ComprobVtaLeerComp(IdComprobante,Factura);
   ReadDb_FormatoImpresion( Factura.PtoVta, Factura.TipoComprob, Formato_impres, Formato_PDF, ImpresORA );

  If not frxReport1.LoadFromFile( AjusteObj.CarpReportes+'\comprobantes\recibos.fr3') Then
   Begin
    Mensaje('El formato asociado a este tipo de comprobante no se ha encontrado. Verifique en Configuración / Comprob. Vta.','Formato de impresión',3 );
    exit;
   End;
   //PrinterIndex := Printer.Printers.IndexOf(Impres);
   //FmPrintComprob.frxReport1.DesignReport; exit;

   frxReport1.PrintOptions.Printer := Impresora;
   DS_Valores.RangeEnd := reCount;
   DS_Valores.RangeEndCount := Factura.ListaFondos.Count;
   DS_Aplicaciones.RangeEnd := reCount;
   DS_Aplicaciones.RangeEndCount := Factura.ListaAplicac.Count;

   frxReport1.ShowReport;
   factura.Free;
End;

procedure TFmPrintComprob.DSItemsGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'IdArticulo') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).IdItem ;
  if CompareText(VarName, 'Descripcion') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).Descripcion;
   if CompareText(VarName, 'Precio') = 0 then
     Value := FloatToStr( TItemFact(Factura.ListaItems[DSItems.RecNo]).Precio );
  if CompareText(VarName, 'Cantidad') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).Cantidad;
   if CompareText(VarName, 'TasaIva') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).Tasaiva;
  if CompareText(VarName, 'Importe') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).Importe;
  if CompareText(VarName, 'Descuento') = 0 then
    Value := TItemFact(Factura.ListaItems[DSItems.RecNo]).Descuento;
end;

procedure TFmPrintComprob.DS_AplicacionesGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'Comprobante') = 0 then
    Value := TAplicacion(Factura.ListaAplicac[DS_Aplicaciones.RecNo]).Comprobante ;
   if CompareText(VarName, 'ImporteOrig') = 0 then
    Value := TAplicacion(Factura.ListaAplicac[DS_Aplicaciones.RecNo]).ImporteOrig;
   if CompareText(VarName, 'SaldoAct') = 0 then
    Value := TAplicacion(Factura.ListaAplicac[DS_Aplicaciones.RecNo]).SaldoAct;
  if CompareText(VarName, 'Aplicado') = 0 then
    Value := TAplicacion(Factura.ListaAplicac[DS_Aplicaciones.RecNo]).Aplicado;
  if CompareText(VarName, 'SaldoNue') = 0 then
    Value := TAplicacion(Factura.ListaAplicac[DS_Aplicaciones.RecNo]).SaldoNue;
end;

procedure TFmPrintComprob.DS_ValoresGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'Fecha') = 0 then
    Value := TFondo (Factura.ListaFondos[DS_Valores.RecNo]).Fecha ;
//  if CompareText(VarName, 'Tipo') = 0 then
 //   Value := TFondo(Factura.ListaFondos[DS_Valores.RecNo]).Tipo;
   if CompareText(VarName, 'Descripcion') = 0 then
    Value := TFondo(Factura.ListaFondos[DS_Valores.RecNo]).Descripcion;
  if CompareText(VarName, 'Comprobante') = 0 then
    Value := TFondo(Factura.ListaFondos[DS_Valores.RecNo]).Comprobante;
  if CompareText(VarName, 'Importe') = 0 then
    Value := TFondo(Factura.ListaFondos[DS_Valores.RecNo]).Importe;
  if CompareText(VarName, 'Observaciones') = 0 then
    Value := TFondo(Factura.ListaFondos[DS_Valores.RecNo]).Observaciones;
end;

procedure TFmPrintComprob.frxReport1GetValue(const VarName: string;
  var Value: Variant);
var
  CUIT : String; i: integer;
  Lista : TStringList;
begin
   // Encabezado

   if CompareText(VarName, 'Comprobante') = 0 then
    Value := Factura.TipoComprob;
   if CompareText(VarName, 'PtoVta') = 0 then
    Value := Factura.PtoVta;
   if CompareText(VarName, 'Numero') = 0 then
    Value := Factura.Numero;
   if CompareText(VarName, 'Fecha') = 0 then
    Value := Factura.Fecha;
   if CompareText(VarName, 'FechaVto') = 0 then
    Value := FormatDateTime('dd/mm/yyyy', Factura.FechaVto);
   //Cliente
   if CompareText(VarName, 'IdCliente') = 0 then
    Value := Factura.IdCliente;
   if CompareText(VarName, 'Nombre') = 0 then
    Value := Factura.Nombre;
   if CompareText(VarName, 'Direccion') = 0 then
    Value := Factura.Direccion;
   if CompareText(VarName, 'Ciudad') = 0 then
    Value := Factura.CodPostal +'  '+ Factura.Ciudad;

   if CompareText(VarName, 'CondVta') = 0 then
   If Factura.CondVta = 0 then
      Value := 'Contado' else Value := 'Cuenta Corriente';
   if CompareText(VarName, 'CondTrib') = 0 then
    Begin
       Lista := TStringList.create;
       ReadDb_LstCategImpos(Lista);
       For i:=0 to  Lista.Count-1 do
        if TcategImpos(Lista.Objects[i]).idcategoria = Factura.IdCategImpos then
         begin
           Value := TcategImpos(Lista.Objects[i]).Descripcion;
           Break;
         end;
        Lista.Free;
    End;

   if CompareText(VarName, 'CUIT') = 0 then
    Value := Factura.NroDoc;
   //SUbtotales
   if CompareText(VarName, 'Imp1') = 0 then
    Value := Factura.Imp1_Importe;
   if CompareText(VarName, 'Imp2') = 0 then
    Value := Factura.Imp2_Importe;
   if CompareText(VarName, 'Imp3') = 0 then
    Value := Factura.Imp3_Importe;

   if CompareText(VarName, 'Iva1') = 0 then
    Value := Factura.Iva1_Importe;
   if CompareText(VarName, 'Iva2') = 0 then
    Value := Factura.Iva2_Importe;
   if CompareText(VarName, 'Iva3') = 0 then
    Value := Factura.Iva3_Importe;
   if CompareText(VarName, 'SubTotal') = 0 then
    Value := Factura.Iva1_Neto + Factura.Iva2_Neto+Factura.Iva3_Neto;  // Factura.Subtotal; mando en subtotal los netos del IVA porque no se usa este campo

   if CompareText(VarName, 'Importe') = 0 then
    Value := Factura.Importe;

   //Pie
   if CompareText(VarName, 'CAE') = 0 then
     If Factura.CAE <> '' Then Value := Factura.CAE;
   if CompareText(VarName, 'CAE_Vto') = 0 then
     If Factura.CAE_VTO <> '' Then Value := Factura.CAE_VTO;
   CUIT := AjusteObj.EmpCUIT;
   if CUIT ='' then CUIT := '00000000';

   Solonumeros(CUIT);

   if CompareText(VarName, 'BC_CAE') = 0 then
    Value := CUIT + Factura.CAE + Factura.CAE_VTO;

  //  showmessage(CUIT + Factura.CAE + Factura.CAE_VTO);  //Ojo el cuit no puede ser vacio
  //  if CompareText(VarName, 'Logo') = 0 then
  //  TfrxPictureView(FmPrintComprob.frxReport1.FindObject('Logo') ).Picture.Graphic :=  Fm_Configuracion.Img_EmpLogo.picture.graphic;

end;

end.
