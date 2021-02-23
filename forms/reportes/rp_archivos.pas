unit rp_archivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, frxClass, frxDBSet, ComCtrls, ToolWin,
   frxExportPDF, frxExportBaseDialog, frxExportCSV;

type
  TFmRp_Archivos = class(TForm)
    frxReport1: TfrxReport;
    DS_Clientes: TfrxDBDataset;
    ADODataSet1: TADODataSet;
    ToolBar1: TToolBar;
    TB_Print: TToolButton;
    Tb_Exit: TToolButton;
    TB_Excel: TToolButton;
    TB_Pdf: TToolButton;
    ToolButton5: TToolButton;
    frxPDFExport1: TfrxPDFExport;
    Ed_Observ: TEdit;
    Label13: TLabel;
    ADODataSet1IDCliente: TIntegerField;
    ADODataSet1Tratamiento: TWideStringField;
    ADODataSet1ClientesNombre: TWideStringField;
    ADODataSet1Direccion: TWideStringField;
    ADODataSet1ClientesCodPostal: TWideStringField;
    ADODataSet1telefono: TWideStringField;
    ADODataSet1FAX: TWideStringField;
    ADODataSet1email: TWideStringField;
    ADODataSet1TipoDoc: TWideStringField;
    ADODataSet1NroDoc: TWideStringField;
    ADODataSet1HabCtaCte: TBooleanField;
    ADODataSet1CategImpos: TSmallintField;
    ADODataSet1UltimaVta: TDateTimeField;
    ADODataSet1UltimoPago: TDateTimeField;
    ADODataSet1ListaPrec: TSmallintField;
    ADODataSet1FormaPago: TSmallintField;
    ADODataSet1DiasVto: TSmallintField;
    ADODataSet1ShowObs: TBooleanField;
    ADODataSet1Comprobxemail: TBooleanField;
    ADODataSet1Contacto1: TWideStringField;
    ADODataSet1TelCont1: TWideStringField;
    ADODataSet1Contacto2: TWideStringField;
    ADODataSet1TelCont2: TWideStringField;
    ADODataSet1LimiteCredito: TFloatField;
    ADODataSet1Observaciones: TWideMemoField;
    ADODataSet1FechaAlta: TDateTimeField;
    ADODataSet1UltimaAct: TDateTimeField;
    ADODataSet1CiudadesCodPostal: TWideStringField;
    ADODataSet1CiudadesNombre: TWideStringField;
    ADODataSet1Provincia: TWideStringField;
    frxCSVExport1: TfrxCSVExport;
    procedure TB_ExcelClick(Sender: TObject);
    procedure TB_PrintClick(Sender: TObject);
    procedure TB_PdfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmRp_Archivos: TFmRp_Archivos;

implementation

{$R *.dfm}
Uses Main, rp_utils;

procedure TFmRp_Archivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TFmRp_Archivos.TB_ExcelClick(Sender: TObject);
begin
 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\reports\clientes.fr3');
 SetUpReporte(frxReport1,'Clientes');
 frxReport1.PrepareReport;
 frxReport1.Export(frxCSVExport1);
end;

procedure TFmRp_Archivos.TB_PrintClick(Sender: TObject);
begin
  ADODataSet1.close;
  ADODataSet1.CommandText := '';
  ADODataSet1.CommandText := 'SELECT Clientes.*, Ciudades.* FROM Clientes INNER JOIN Ciudades ON Clientes.CodPostal=Ciudades.CodPostal ';
  ADODataSet1.CommandText := ADODataSet1.CommandText + ' ORDER BY Clientes.Nombre';
  ADODataSet1.open;
  SetUpReporte(frxReport1,'Clientes');
  frxReport1.ShowReport;
end;

procedure TFmRp_Archivos.TB_PdfClick(Sender: TObject);
begin
 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\reports\clientes.fr3');
 SetUpReporte(frxReport1,'Clientes');
 frxReport1.PrepareReport;
 frxReport1.Export(frxPDFExport1);
end;

end.
