{ Formumario Informe dcomprob vta        }
{        Silvio Parada                  }
{         01-7-2016       }
unit rp_comprobvta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, frxClass,  DB, ADODB, frxDBSet, ComCtrls,
  ToolWin, StdCtrls, CheckLst, frxExportBaseDialog, frxExportCSV,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportXLS, frxExportPDF;

type

  TFmRp_CompVta = class(TForm)
    Ed_titulo: TEdit;
    Label5: TLabel;
    CV_Agrupar: TCheckBox;
    ChkList_TipoComp: TCheckListBox;
    BC_SelAll: TSpeedButton;
    BC_SelNone: TSpeedButton;
    ToolBar1: TToolBar;
    TB_print: TToolButton;
    TB_excel: TToolButton;
    Tb_PDF: TToolButton;
    DS_Comprob: TfrxDBDataset;
    ed_FechaHasta: TDateTimePicker;
    ed_FechaDesde: TDateTimePicker;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LlenarTiposCOmpr;
    procedure BC_SelAllClick(Sender: TObject);
    procedure BC_SelNoneClick(Sender: TObject);
    procedure TB_printClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConsultaDB;
    procedure TB_excelClick(Sender: TObject);
    procedure Tb_PDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FmRp_CompVta: TFmRp_CompVta;

Implementation
uses
  ComprobVtaTipos,
  rp_utils,main;
{$R *.DFM}

procedure TFmRp_CompVta.ConsultaDB;
var
  // Desde,Hasta : TDateTime;
 FechaIni,FechaFin : string;
 SetOfTipoComp : string;
 i:integer;
begin

 SetOfTipoComp := '';
 i:= 0;
 SetOfTipoComp := '';
 For  i:=0 to  ChkList_TipoComp.Items.Count-1 do
    IF ChkList_TipoComp.Checked[i] = True then
       IF SetOfTipoComp ='' THEN
         SetOfTipoComp :=  QuotedStr(TComprobVtaTipos(ChkList_TipoComp.Items.Objects[i]).Id_tipocompr)   ELSE  SetOfTipoComp := SetOfTipoComp +','+ QuotedStr(TComprobVtaTipos(ChkList_TipoComp.Items.Objects[i]).Id_tipocompr);

 FechaIni := FormatDateTime('yyyy-mm-dd', ed_FechaDesde.date );
 FechaFin := FormatDateTime('yyyy-mm-dd', ed_FechaHasta.date );

 FDQuery1.SQL.Clear;
 FDQuery1.Sql.add('SELECT comprob_vta.*, clientes.* FROM comprob_vta INNER JOIN clientes ON comprob_vta.IdCliente=clientes.Id ');
 FDQuery1.Sql.add(' WHERE Fecha BETWEEN :desde and :hasta');
 FDQuery1.Sql.add(' AND TipoComprob  IN ('+ SetOfTipoComp +')' );
 FDQuery1.Sql.add(' ORDER BY TipoComprob,Fecha, PtoVta, Numero');
 FDQuery1.ParamByName('desde').value := FechaIni;
 FDQuery1.ParamByName('hasta').value := FechaFin ;
 FDQuery1.Open;



end;

procedure TFmRp_CompVta.FormCreate(Sender: TObject);
begin
 LlenarTiposCOmpr;
End;

procedure TFmRp_CompVta.FormShow(Sender: TObject);
begin
  ed_FechaHasta.Date := now;
end;

procedure TFmRp_CompVta.FormClose(Sender: TObject;   var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmRp_CompVta.LlenarTiposCOmpr;
var
 Lista : TStringList;
 i: integer;
begin
 Lista := TStringList.create;
 TiposComprobVtaLeerListado(Lista);
 for I := 0 to Lista.Count - 1 do
    ChkList_TipoComp.Items.AddObject( TComprobVtaTipos(Lista.Objects[i]).Id_tipocompr +'-'+  TComprobVtaTipos(Lista.Objects[i]).descripcion ,  TComprobVtaTipos(Lista.Objects[i]) );
 Lista.Free;
end;

procedure TFmRp_CompVta.TB_printClick(Sender: TObject);
begin
 frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\comprob_venta.fr3');
 ConsultaDB;
 TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_Agrupar.Checked ;
 SetUpReporte(frxReport1,'Comprobantes de Venta');
 frxReport1.ShowReport;
end;

procedure TFmRp_CompVta.TB_excelClick(Sender: TObject);
begin
 ConsultaDB;
 frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\comprob_venta.fr3');
 TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_Agrupar.Checked ;

 frxXLSExport1.FileName := 'comprobventa.xlsx';
 frxXLSExport1.DefaultPath := ajusteObj.CarpExportacion;

 frxReport1.PrepareReport(True);
 SetUpReporte(frxReport1,'Comprobantes de Venta');
 frxReport1.Export(frxXLSExport1);
end;

procedure TFmRp_CompVta.Tb_PDFClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(ajusteObj.CarpReportes+ '\comprob_venta.fr3');
  TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_Agrupar.Checked;
  frxPdfExport1.FileName := 'Lista de precios.pdf';
  frxPdfExport1.DefaultPath := ajusteObj.CarpExportacion;
  SetUpReporte(frxReport1,'Comprobantes de Venta');
  frxReport1.Export(frxPdfExport1);
end;

procedure TFmRp_CompVta.BC_SelAllClick(Sender: TObject);
var i :integer;
begin
 For i:=0 to  ChkList_TipoComp.Items.Count-1 do
    ChkList_TipoComp.Checked[i] := True;
end;

procedure TFmRp_CompVta.BC_SelNoneClick(Sender: TObject);
var i :integer;
begin
  For i:=0 to  ChkList_TipoComp.Items.Count-1 do
    ChkList_TipoComp.Checked[i] := false;

end;

end.
