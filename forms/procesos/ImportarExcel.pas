unit ImportarExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, DB, ADODB, ComCtrls, Gauges,
  ExtCtrls;

type
  TFmImportExcel = class(TForm)
    BC_ReadFile: TBitBtn;
    OD_Archivo: TOpenDialog;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    SG_Excel: TStringGrid;
    BitBtn3: TBitBtn;
    SG_CamposDb: TStringGrid;
    Memo1: TMemo;
    CB_opcionTitulos: TCheckBox;
    CB_destino: TComboBox;
    Gauge1: TGauge;
    BC_CopyMemoText: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    lb_3344: TLabel;
    Label2: TLabel;
    procedure BC_ReadFileClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG_CamposDbKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CB_destinoChange(Sender: TObject);
    procedure BC_CopyMemoTextClick(Sender: TObject);
    procedure ProcesarArticulos;
    procedure ProcesarClientes;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmImportExcel: TFmImportExcel;

implementation
{$R *.dfm}
uses
  Articulos,rubros,clientes,
ComObj,ExcelXP,UtilsFunc, importsdll;

procedure TFmImportExcel.ProcesarArticulos;
var
  Col : integer;
  ValorEntero,i: Integer;
  Articulo : TArticulo;
  ValorReal : double;
begin
  if (SG_CamposDb.Cells[1,1] = '0') or (SG_CamposDb.Cells[1,2] = '0') then
   begin
     Mensaje('Los campos IdArticulo y Descripcion son obligatorios.','Importación de clientes',2);
     exit;
   end;

  Articulo := TArticulo.create;
   for i:= 1 to SG_Excel.RowCount - 1 do
    begin
      Col := StrToInt(SG_CamposDb.Cells[1,1]) ; // id producto
       Articulo.IdArticulo  := Trim(SG_Excel.Cells[col,i]);
      Col := StrToInt(SG_CamposDb.Cells[1,2]); //descripcion
       Articulo.Descripcion := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,3]); //Cod FAbrica
      Articulo.CodFabrica := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,4]); //Cod barras
       Articulo.CodBarras := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,5]); //IdRubro
      if Col > 0  then  Articulo.idRubro := SG_Excel.Cells[col,i]
                  else  Articulo.idRubro := SG_CamposDb.Cells[2,5];
      Col :=StrToInt (SG_CamposDb.Cells[1,6]); //precio1
      if Col > 0  then
       if TryStrToFloat(SG_Excel.Cells[col,i], ValorReal ) then
        Articulo.Precio := ValorReal else Begin  Articulo.Precio := 0; Memo1.Lines.Add('Error de conversión. Fila: '+ IntToStr(i) +' - Precio1 - Se asignó 0 (cero) ' );end;
      Col :=StrToInt (SG_CamposDb.Cells[1,7]); //Costo1
      if Col > 0  then
       if TryStrToFloat(SG_Excel.Cells[col,i], ValorReal ) then
        Articulo.Costo := ValorReal else Begin  Articulo.Costo := 0; Memo1.Lines.Add('Error de conversión. Fila: '+ IntToStr(i) +' - Costo1 - Se asignó 0 (cero) ' );end;
      Col :=StrToInt (SG_CamposDb.Cells[1,8]); //IVA
      Articulo.CodIva := SG_CamposDb.Cells[2,8];
      {if Col > 0  then
         if TryStrToFloat(SG_Excel.Cells[col,i], ValorReal ) then
           Articulo.Tasaiva := FloatToStr(ValorReal) else Begin  Articulo.Tasaiva := '?'; Memo1.Lines.Add('Error de conversión Fila: '+ IntToStr(i) +' - IVA - Se asignó 0 (cero) ' );end;
     } Col :=StrToInt (SG_CamposDb.Cells[1,9]); //proveedor
      if Col > 0  then
       if TryStrToInt(SG_Excel.Cells[col,i], ValorEntero ) then
        Articulo.IdProveedor := ValorEntero else Begin  Articulo.IdProveedor := 0; Memo1.Lines.Add('Error de conversión Fila: '+ IntToStr(i) +' - IVA - Se asignó 0 (cero) ' );end;

      ArticulosAgregar(Articulo);
      Gauge1.Progress :=  trunc( (i  /  SG_Excel.RowCount)*100);
    end;
     Gauge1.Progress := 100;
     Memo1.Lines.Add('Se importaron '+ IntToStr(SG_Excel.RowCount-1) +' Artículos');
  Articulo.free;
end;

procedure TFmImportExcel.ProcesarClientes;
var
  Col : integer;
  ValorEntero,i: Integer;
  Cliente : TCliente;
  ValorReal : double;
begin

  if (SG_CamposDb.Cells[1,1] = '0') or (SG_CamposDb.Cells[1,2] = '0') then
   begin
     Mensaje('Los campos IdCliente y Nombre son obligatorios.','Importación de clientes',2);
     exit;
   end;
  Cliente := TCliente.create;
   for i:= 1 to SG_Excel.RowCount - 1 do
    begin
      Col := StrToInt(SG_CamposDb.Cells[1,1]) ; // id cliente
       Cliente.Id := StrToInt(SG_Excel.Cells[col,i]);
      Col := StrToInt(SG_CamposDb.Cells[1,2]); // razon social
       Cliente.nombre := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,3]); // tel.
      Cliente.telefono := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,4]); // domicilio
       Cliente.Direccion := SG_Excel.Cells[col,i];
      Col := StrToInt(SG_CamposDb.Cells[1,5]); // cod postal
       Cliente.CodPosTal := SG_Excel.Cells[col,i];
      Col := StrToInt (SG_CamposDb.Cells[1,6]); // email
       Cliente.email := SG_Excel.Cells[col,i];
      Col := StrToInt (SG_CamposDb.Cells[1,7]); //cat impos
       Cliente.CategImpos := SG_Excel.Cells[col,i];
      Col := StrToInt (SG_CamposDb.Cells[1,8]); // cuit
       Cliente.NroDoc := SG_CamposDb.Cells[col,i];
      Col := StrToInt (SG_CamposDb.Cells[1,9]); // forma pago.
       Cliente.FormaPago := SG_Excel.Cells[col,i];

       ClienteAgregar(Cliente);
      Gauge1.Progress :=  trunc( (i  /  SG_Excel.RowCount)*100);
    end;
     Gauge1.Progress := 100;
     Memo1.Lines.Add('Se importaron '+ IntToStr(SG_Excel.RowCount-1) +' clientes');
  Cliente.free;
end;

procedure TFmImportExcel.BC_CopyMemoTextClick(Sender: TObject);
begin
   Memo1.SelectAll;
   MEmo1.CopyToClipboard;
end;

procedure TFmImportExcel.BC_ReadFileClick(Sender: TObject);
var
   Excel, WrkS, WrkB : OLEVariant;
   Row, Col : Integer;
   Rows, Cols ,i: Integer;
begin


   Excel := CreateOleObject('Excel.Application');
   Excel.Workbooks.Open( Edit1.Text );

   WrkS := Excel.Worksheets[1];
   Cols := WrkS.UsedRange.Columns.Count;
   Rows := WrkS.UsedRange.Rows.Count;

   for Row:= 0 to SG_Excel.RowCount do
         SG_Excel.Rows[Row].Clear;

   SG_Excel.FixedRows := 1;
   SG_Excel.FixedCols := 1;
   SG_Excel.RowCount := Rows;
   SG_Excel.ColCount := Cols + 1;

   if CB_opcionTitulos.Checked then
   Begin
   for Row:= 0 to SG_Excel.RowCount-1 do
      for Col:= 1 to SG_Excel.ColCount  do
         SG_Excel.Cells[Col,Row]:= Excel.ActiveSheet.Cells[Row+1,Col].Value;
   end else
   begin
   for Row:= 1 to SG_Excel.RowCount-1 do
      for Col:= 1 to SG_Excel.ColCount  do
         SG_Excel.Cells[Col,Row]:= Excel.ActiveSheet.Cells[Row,Col].Value;
   end;

   for i:= 1 to SG_Excel.ColCount-1 do
      SG_Excel.cells[i,0] := SG_Excel.cells[i,0] +'('+ intToStr(i) +')';

   Excel.Quit;
end;

procedure TFmImportExcel.BitBtn2Click(Sender: TObject);
begin
 if OD_Archivo.Execute then
  begin
   Edit1.Text := OD_Archivo.FileName;
  // BC_ReadFileClick(Sender);
  end;
end;

procedure TFmImportExcel.BitBtn3Click(Sender: TObject);
begin
  case CB_Destino.Itemindex of
   0 : ProcesarArticulos;
   1 : ProcesarClientes;
  end;
end;

procedure TFmImportExcel.CB_destinoChange(Sender: TObject);
begin
 case Cb_Destino.ItemIndex of
  0 : begin
      SG_CamposDb.rOWCOUNT := 10;
  SG_CamposDb.cells[0,0] := 'Campos';
  SG_CamposDb.cells[0,1] := 'IdArticulo';
  SG_CamposDb.cells[0,2] := 'Descripcion';
  SG_CamposDb.cells[0,3] := 'CodFabrica';
  SG_CamposDb.cells[0,4] := 'CodBarras';
  SG_CamposDb.cells[0,5] := 'IdRubro' ;
  SG_CamposDb.cells[0,6] := 'Precio1';
  SG_CamposDb.cells[0,7] := 'Costo1';
  SG_CamposDb.cells[0,8] := 'IVA';
  SG_CamposDb.cells[0,9] := 'IdProveedor';

  SG_CamposDb.cells[1,0] := 'Nº Col.Excel';
  SG_CamposDb.cells[1,1] := '0';
  SG_CamposDb.cells[1,2] := '0';
  SG_CamposDb.cells[1,3] := '0';
  SG_CamposDb.cells[1,4] := '0';
  SG_CamposDb.cells[1,5] := '0' ;
  SG_CamposDb.cells[1,6] := '0';
  SG_CamposDb.cells[1,7] := '0';
  SG_CamposDb.cells[1,8] := '0';
  SG_CamposDb.cells[1,9] := '0';

  SG_CamposDb.cells[2,0] := 'Valor Defecto';
  SG_CamposDb.cells[2,1] := '';
  SG_CamposDb.cells[2,2] := '';
  SG_CamposDb.cells[2,3] := '';
  SG_CamposDb.cells[2,4] := '';
  SG_CamposDb.cells[2,5] := 'SINRUBRO' ;
  SG_CamposDb.cells[2,6] := '0';
  SG_CamposDb.cells[2,7] := '0';
  SG_CamposDb.cells[2,8] := '21';
  SG_CamposDb.cells[2,9] := '0';
  end;
  1 : begin
  SG_CamposDb.RowCOUNT := 10;
  SG_CamposDb.cells[0,0] := 'Campos';
  SG_CamposDb.cells[0,1] := 'IdCliente';
  SG_CamposDb.cells[0,2] := 'Razon Social';
  SG_CamposDb.cells[0,3] := 'Tel.';
  SG_CamposDb.cells[0,4] := 'Domicilio';
  SG_CamposDb.cells[0,5] := 'Cod Postal' ;
  SG_CamposDb.cells[0,6] := 'email';
  SG_CamposDb.cells[0,7] := 'Categ.Impos.';
  SG_CamposDb.cells[0,8] := 'CUIT';
  SG_CamposDb.cells[0,9] := 'Forma Pago.';

  SG_CamposDb.cells[1,0] := 'Nº Col.Excel';
  SG_CamposDb.cells[1,1] := '0';
  SG_CamposDb.cells[1,2] := '0';
  SG_CamposDb.cells[1,3] := '0';
  SG_CamposDb.cells[1,4] := '0';
  SG_CamposDb.cells[1,5] := '0' ;
  SG_CamposDb.cells[1,6] := '0';
  SG_CamposDb.cells[1,7] := '0';
  SG_CamposDb.cells[1,8] := '0';
  SG_CamposDb.cells[1,9] := '0';

  SG_CamposDb.cells[2,0] := 'Valor Defecto';
  SG_CamposDb.cells[2,1] := '';
  SG_CamposDb.cells[2,2] := '';
  SG_CamposDb.cells[2,3] := '';
  SG_CamposDb.cells[2,4] := '';
  SG_CamposDb.cells[2,5] := '' ;
  SG_CamposDb.cells[2,6] := '0';
  SG_CamposDb.cells[2,7] := '5';
  SG_CamposDb.cells[2,8] := '00-0000000000-0';
  SG_CamposDb.cells[2,9] := '0';
  end;




 end;
end;

procedure TFmImportExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := cafree;
end;

procedure TFmImportExcel.FormCreate(Sender: TObject);
begin
  SG_Excel.ColWidths[0] := 20;

end;

procedure TFmImportExcel.SG_CamposDbKeyPress(Sender: TObject; var Key: Char);
begin
  if SG_CamposDB.Col = 0 then
    Key := #0;
  if SG_CamposDB.Col = 1 then
   if not (key in ['0'..'9', #13 , #8 ]) then
     key := #0;

end;

end.
