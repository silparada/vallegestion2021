{ Formumario Informe de precios         }
{        Silvio Parada                  }
{         27-01-1998                    }
{         04-08-2015 actualizado        }
unit rp_ctacte;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls, Buttons, frxClass, frxDBSet, ComCtrls, ToolWin,
   frxExportPDF, frxBarcode, ExtCtrls, CheckLst, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxExportXLS, frxExportBaseDialog,
  Data.DB;

type

  TFm_RpCtaCte = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    GOP_Tipo: TRadioGroup;
    frxReport2: TfrxReport;
    CV_SinSaldar: TCheckBox;
    CV_Vencidos: TCheckBox;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    TB_Excel: TToolButton;
    Tb_Pdf: TToolButton;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure TB_ExcelClick(Sender: TObject);
    procedure Tb_PdfClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConsultarDb;
  public
    { Public declarations }
  end;

var
  Fm_RpCtaCte: TFm_RpCtaCte;

Implementation
uses
   Clientes, main, rp_utils;
{$R *.DFM}

procedure TFm_RpCtaCte.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_RpCtaCte.ConsultarDb;
begin
 if GOP_Tipo.ItemIndex = 0 then
  Begin
   FDQuery1.sql.clear;
   FDQuery1.sql.Add('SELECT clientes.id, clientes.Nombre, clientes.telefono, clientes.Direccion,ciudades.CodPostal, ciudades.Nombre, movimvta.Id,');
   FDQuery1.sql.Add(' movimvta.Comprobante, movimvta.DebCred, movimvta.Fecha, movimvta.FechaVto, movimvta.Importe, movimvta.Saldo, movimvta.Observaciones');
   FDQuery1.sql.Add(' FROM (clientes INNER JOIN movimvta ON clientes.ID = movimvta.IDCliente) INNER JOIN ciudades ON clientes.CodPostal = ciudades.CodPostal ');
   FDQuery1.sql.Add(' WHERE 1');
   if CV_SinSaldar.Checked then
      FDQuery1.sql.Add(' AND movimvta.Saldo>0 ');
   if CV_Vencidos.Checked then
      FDQuery1.sql.Add(' AND  movimvta.FechaVto>=CURDATE()');

   FDQuery1.sql.Add(' ORDER BY clientes.ID, movimvta.Fecha; ');
   FDQuery1.Open;

  End else
      begin
       FDQuery1.sql.clear;
       FDQuery1.sql.Add('SELECT clientes.id, clientes.nombre, DebCred,  Sum(Saldo) AS Total');
       FDQuery1.sql.Add(' FROM clientes INNER JOIN movimvta ON clientes.id = movimvta.idcliente ');
       FDQuery1.sql.Add(' WHERE DebCred='+ QuotedStr('D') );
       //if CV_SinSaldar.Checked then  // No aplica suma solamente saldos.
       //  FDQuery1.sql.Add(' AND MovimVta.Saldo>0 ');
       if CV_Vencidos.Checked then
         FDQuery1.sql.Add(' AND  movimvta.FechaVto>=CURDATE()');
       FDQuery1.sql.Add(' ORDER BY clientes.id, movimvta.Fecha; ');
       FDQuery1.Open;

      end;

end;


procedure TFm_RpCtaCte.TB_ExcelClick(Sender: TObject);
begin

 if GOP_Tipo.ItemIndex = 0 then
  Begin
   ConsultarDb;
   frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Detallado.fr3');

  End else
      begin
       ConsultarDb;
       frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Saldos.fr3');
      end;

 SetUpReporte( frxReport1, 'CUENTA CORRIENTE CLIENTES');
 frxXLSExport1.FileName := 'Cta_Cte.xls';
 frxXLSExport1.DefaultPath := ajusteObj.CarpExportacion;
 frxReport1.PrepareReport(True);
 frxReport1.Export(frxXLSExport1);
 FDQuery1.close;
end;

procedure TFm_RpCtaCte.Tb_PdfClick(Sender: TObject);
begin
  if GOP_Tipo.ItemIndex = 0 then
  Begin
   ConsultarDb;
   frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Detallado.fr3');
   End else
      begin
       ConsultarDb;
       frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Saldos.fr3');
       end;

  frxPdfExport1.FileName := 'Cta_Cte.pdf';
  frxPdfExport1.DefaultPath := ajusteObj.CarpExportacion;
  frxReport1.Export(frxPdfExport1);


 FDQuery1.close;
end;

procedure TFm_RpCtaCte.ToolButton1Click(Sender: TObject);
begin

 if GOP_Tipo.ItemIndex = 0 then
  Begin
   ConsultarDb;
   frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Detallado.fr3');
   SetUpReporte( frxReport1, 'CUENTA CORRIENTE CLIENTES');
   frxReport1.ShowReport;
   FDQuery1.close;
  End else
      begin
       ConsultarDb;
       frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\Vta_CtaCte_Saldos.fr3');
       SetUpReporte( frxReport1, 'LISTADO DE SALDOS CLIENTES');
       frxReport1.ShowReport;
       FDQuery1.close;
      end;
end;

end.

