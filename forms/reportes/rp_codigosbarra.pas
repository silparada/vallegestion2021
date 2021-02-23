{ Formumario codigo barras       }
{        Silvio Parada                  }
{         27-01-1998                    }
{         04-08-2015 actualizado        }
unit rp_codigosbarra;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
    FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client

  , StdCtrls, Buttons, frxClass, frxDBSet, ComCtrls, ToolWin,       frxBarcode2D,frxBarcode2DBase,
   frxExportPDF, frxBarcode, ExtCtrls, CheckLst, frxExportBaseDialog, frxBarcod,frxBarcodeQR;

type

  TFm_RpCodBarra = class(TForm)
    ChkList_Rubros: TCheckListBox;
    BC_SelAll: TSpeedButton;
    BC_SelNone: TSpeedButton;
    Cv_Descripcion: TCheckBox;
    Cb_Precio: TComboBox;
    Label1: TLabel;
    LV_Articulos: TListView;
    DSItems: TfrxUserDataSet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    CB_TipoCod: TComboBox;
    CB_TipoCodigo: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    BC_LoadDB: TButton;
    frxReport1: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxPDFExport1: TfrxPDFExport;
    BC_Imprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LlenarRubros;
    procedure BC_SelAllClick(Sender: TObject);
    procedure BC_SelNoneClick(Sender: TObject);
    procedure BC_LoadDBClick(Sender: TObject);
    procedure DSItemsGetValue(const VarName: string;
      var Value: Variant);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ChkList_RubrosClickCheck(Sender: TObject);
    procedure BC_ImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Fm_RpCodBarra: TFm_RpCodBarra;

Implementation
uses
   Rubros,articulos,
   main;
{$R *.DFM}

procedure TFm_RpCodBarra.FormCreate(Sender: TObject);
begin
 LlenarRubros;
End;

procedure TFm_RpCodBarra.DSItemsGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'Codigo') = 0 then
    case CB_TipoCodigo.ItemIndex of
     0 : Value := LV_Articulos.Items[DSItems.RecNo].Caption;
     1 : Value := LV_Articulos.Items[DSItems.RecNo].SubItems[0];
     2 : Value := LV_Articulos.Items[DSItems.RecNo].SubItems[1];
    end;

   if CompareText(VarName, 'Descripcion') = 0 then
    if Cv_Descripcion.Checked then
      Value := LV_Articulos.Items[DSItems.RecNo].SubItems[2]
     else
      Value := '';
   if CompareText(VarName, 'Precio') = 0 then
    Begin
     case Cb_Precio.ItemIndex of
       0 : ; //Value :=
       1 : Value := LV_Articulos.Items[DSItems.RecNo].SubItems[3];
       2 : Value := LV_Articulos.Items[DSItems.RecNo].SubItems[4];
      // 3 : Value := LV_Articulos.Items[DSItems.RecNo].SubItems[5];
     end;
    End;



end;

procedure TFm_RpCodBarra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_RpCodBarra.LlenarRubros;
var
 Lista : TStringList;
 I: INTEGER;
begin
 Lista := TStringList.create;
 RubrosLeerListado(Lista, 'activo');
// ChkList_Rubros.Items.Assign(Lista);
 for I := 0 to Lista.Count - 1 do
  ChkList_Rubros.Items.AddObject('('+ TRubro(Lista.Objects[i]).Id +') '+  TRubro(Lista.Objects[i]).descripcion ,  TRubro(Lista.Objects[i]) );
 Lista.Free;
end;

procedure TFm_RpCodBarra.SpeedButton1Click(Sender: TObject);
var i :integer;
begin
 For i:=0 to  LV_Articulos.Items.Count-1 do
    LV_Articulos.items[i].checked := True;
end;

procedure TFm_RpCodBarra.SpeedButton2Click(Sender: TObject);
var i :integer;
begin
 For i:=0 to  LV_Articulos.Items.Count-1 do
    LV_Articulos.items[i].checked  := false;
end;

procedure TFm_RpCodBarra.BC_SelAllClick(Sender: TObject);
var i :integer;
begin
 For i:=0 to  ChkList_Rubros.Items.Count-1 do
    ChkList_Rubros.Checked[i] := True;
end;

procedure TFm_RpCodBarra.BC_SelNoneClick(Sender: TObject);
var i :integer;
begin
  For i:=0 to  ChkList_Rubros.Items.Count-1 do
    ChkList_Rubros.Checked[i] := false;
end;

procedure TFm_RpCodBarra.BC_ImprimirClick(Sender: TObject);
var
 i: integer;
begin
  // borar todos los items del ListView no Checked para que no los tome el DS del Report
  for i := LV_Articulos.Items.Count - 1 downto 0 do
    if not LV_Articulos.Items[i].Checked then
       LV_Articulos.Items.Delete(i);

 DSItems.RangeEnd := reCount;
 DSItems.RangeEndCount := LV_Articulos.Items.Count;
   case CB_TipoCod.ItemIndex of
    0..1 :  frxReport1.LoadFromFile( ajusteObj.CarpReportes+'\etiquetas1d.fr3' );
    2..4 :  begin frxReport1.loadFromFile( ajusteObj.CarpReportes+'\etiquetas2d.fr3' );
                 TfrxBarCode2Dview(frxReport1.FindObject('Barcode2D1')).Zoom := 0.8;
            end;
   end;

   case CB_TipoCod.ItemIndex of
    0 : TfrxBarCodeview(frxReport1.FindObject('Barcode1')).BarType := bcCodeEAN13; // CB_TipoBid.text;
    1 : TfrxBarCodeview(frxReport1.FindObject('Barcode1')).BarType := bcCodeEAN8; // CB_TipoBid.text;
    2 : TfrxBarCode2Dview(frxReport1.FindObject('Barcode2D1')).BarType := bcCodeQR; // CB_TipoBid.text;
    3 : TfrxBarCode2Dview(frxReport1.FindObject('Barcode2D1')).BarType := bcCodePdf417; // CB_TipoBid.text;
    4 : TfrxBarCode2Dview(frxReport1.FindObject('Barcode2D1')).BarType := bcCodeDataMatrix; // CB_TipoBid.text;
   end;
 frxReport1.PrepareReport(false);
 frxReport1.ShowReport;

end;

procedure TFm_RpCodBarra.ChkList_RubrosClickCheck(Sender: TObject);
begin
 BC_LoadDBClick(Sender);
end;

procedure TFm_RpCodBarra.BC_LoadDBClick(Sender: TObject);
var
 CodRub: String;
 i : integer;
 Tabla : TFDQuery;
 LI : TListItem;
begin
 Tabla := TFDQuery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;

 LV_Articulos.clear;
 Screen.Cursor := crHourGlass;
 FOR i:= 0 to ChkList_Rubros.Items.Count-1 Do
 if ChkList_Rubros.Checked[i] then
 BEGIN
   CodRub := TRubro(ChkList_Rubros.Items.Objects[i]).ID;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('SELECT * FROM articulos Where IdRubro='+ quotedStr(CodRub) + ' Order By Descripcion');
   Tabla.open;


   While (not Tabla.EOF) do
   begin
    LI := LV_Articulos.items.Add;
    LI.Caption := Tabla.fieldbyname('Id').AsString;
    with LI do
     begin
      SubItems.Add( Tabla.fieldbyname('CodBarras').AsString );
      SubItems.Add( Tabla.fieldbyname('CodFabrica').AsString );
      SubItems.Add( Tabla.fieldbyname('Descripcion').AsString );
      SubItems.Add( FloatToStrF(Tabla.fieldbyname('Precio').AsCurrency, ffFixed,18,2 ) );
      SubItems.Add( FloatToStrF(Tabla.fieldbyname('Costo').AsCurrency, ffFixed,18,2 ) );
     // SubItems.Add( FloatToStrF(Tabla.fieldbyname('Precio3').AsCurrency, ffFixed,18,2 ) );
     end;
     Tabla.next;
   end;
 END;
  Screen.Cursor := crdefault;

 Tabla.destroy;
end;

end.
