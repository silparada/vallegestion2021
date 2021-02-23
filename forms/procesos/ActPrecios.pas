unit ActPrecios;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB,  CheckLst, Gauges,

   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client

  ;

type
  TFmActPrecios = class(TForm)
    GOP_Operac: TRadioGroup;
    Label2: TLabel;
    BC_Aceptar: TBitBtn;
    GOP_UsarPrec: TRadioGroup;
    GOP_PreACal: TRadioGroup;
    ChkList_Rubros: TCheckListBox;
    Gauge1: TGauge;
    Ed_Valor: TEdit;
    procedure BC_AceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ChkList_RubrosData(Control: TWinControl; Index: Integer;
      var Data: string);
    procedure ChkList_RubrosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
    procedure LlenarRubros;
  public
    { Public declarations }
  end;

var
  FmActPrecios: TFmActPrecios;
implementation
{$R *.DFM}
uses articulos,rubros, importsdll,
     UtilsFunc,main;
        {********** CALCULO  PRINCIPAL *************}
procedure TFmActPrecios.BC_AceptarClick(Sender: TObject);
var
 Operacion : String;
 PrecioUsado,valor :double;
 IdRubro : String;
 i,NroAct : integer;
 Tabla : TFDQuery;
 Articulo : TArticulo;
begin

If not DialogoBox('Esta seguro que actualiza precios ?','Actualizar Precios',2,3) Then
  exit;
try
 Valor := StrToFloat(Ed_Valor.Text);
except
 mensaje('El valor no es un n�mero real v�lido','Calcular precios',3);
 exit;
end;

 screen.Cursor := -11;
 Tabla := TFDQuery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Articulo := TArticulo.create;
 Gauge1.Progress := 0;
FOR i:= 0 to ChkList_Rubros.Items.Count-1 Do
if ChkList_Rubros.Checked[i] then
 BEGIN
  NroAct := 0;
  IdRubro := TRubro(ChkList_Rubros.Items.Objects[i]).Id;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('SELECT * FROM articulos Where IdRubro='+ quotedStr(IdRubro) + ' Order By Descripcion');
  Tabla.open;
  while not Tabla.Eof do
   begin
     Articulo.IdArticulo := Tabla.fieldByName('Id').AsString;
     case GOP_UsarPrec.itemindex of
      0 : PrecioUsado := Tabla.fieldByName('Precio').AsFloat;
      1 : PrecioUsado := Tabla.fieldByName('Costo').AsFloat;
     end;
     case GOP_Operac.ItemIndex of
      0 :  Articulo.Precio := PrecioUsado + Valor;
      1 :  Articulo.Precio := PrecioUsado - Valor;
      2 :  Articulo.Precio := PrecioUsado * Valor;
      3 :  Articulo.Precio := PrecioUsado / Valor;
     end;


     //Edit1.text := GOP_PreACal.Items[GOP_PreACal.ItemIndex] ;
     ArticuloActPrecio(Articulo, GOP_PreACal.Items[GOP_PreACal.ItemIndex] );
     Gauge1.Progress :=  trunc( (NroAct  /  Tabla.RecordCount)*100);
     Inc(NroAct,1);
     Tabla.next;
   end;
   //LlamarUpdateRubro();
 end;

 Gauge1.Progress := 100;
 screen.Cursor := 0;
 Tabla.Free;
 Articulo.free;

end;

procedure TFmActPrecios.ChkList_RubrosData(Control: TWinControl; Index: Integer;
  var Data: string);
begin
//  Edit1.text := data;
end;

procedure TFmActPrecios.ChkList_RubrosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   ChkList_Rubros.Items[index] := TRubro(ChkList_Rubros.Items[index]).Descripcion;
    ChkList_Rubros.Canvas.TextOut(100,100,'hkhsdfkjsdf');
end;

procedure TFmActPrecios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmActPrecios.FormCreate(Sender: TObject);
begin
  LlenarRubros;
end;
procedure TFmActPrecios.LlenarRubros;
var
 Lista : TStringList;
begin
 Lista := TStringList.create;
 RubrosLeerListado(Lista,'activo');
 ChkList_Rubros.Items.Assign(Lista);
 Lista.Free;
end;

end.
