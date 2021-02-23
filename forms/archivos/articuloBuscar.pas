unit articuloBuscar;

interface

uses SysUtils,WinTypes,WinProcs,Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Grids, DBGrids, dialogs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  articulos;

type
  TFmFindaRTICULO = class(TForm)
    Ed_busqueda: TEdit;
    ListView1: TListView;
    BC_Aceptar: TButton;
    Button2: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure Ed_busquedaChange(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
  public
    { Public declarations }
  end;

var
  FmFindaRTICULO: TFmFindaRTICULO;
  Function ShowArticuloList (var Articulo : TArticulo): boolean; export;
  Function FindArticuloId(var Articulo : TArticulo): boolean; export;

implementation
{$R *.DFM}
uses main, Contnrs,importsdll;
var
  ListaCompleta : TStringList;
  ListaActiva : TStringList;

Function ShowArticuloList(var Articulo : TArticulo): boolean;
begin
  Result := false;
  FmFindArticulo := TFmFindArticulo.Create(Application);
  if FmFindArticulo.ShowModal = mrOK then
   begin
    Articulo := TArticulo( ListaActiva.Objects[ FmFindArticulo.ListView1.ItemIndex]);
    Result := true;
   end;
end;

procedure TFmFindaRTICULO.ApplyFilter(const S: string);
var
  I: Integer;
begin
  ListView1.Items.BeginUpdate;
  try
    ListView1.Clear;
    ListaActiva.Clear;
    //SHOWMESSAGE('OKA');
    for I := 0 to ListaCompleta.Count - 1 do
      if (S = '') or (Pos(UpperCase(S), UpperCase(ListaCompleta[i]) )  <> 0 ) then
        ListaActiva.AddObject(ListaCompleta[I], ListaCompleta.Objects[i] );
    ListView1.Items.Count := ListaActiva.Count;
  finally
    ListView1.Items.EndUpdate;
  end;
end;


Function FindArticuloId(var Articulo : TArticulo): boolean;

var
  Tabla : TFDQuery;
begin
  Tabla := TFDQuery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT *  FROM articulos Where Id='+ QuotedStr(Articulo.IdArticulo) );
  Tabla.open;

 result := false;
 If Tabla.RecordCount >= 1 then
  begin
    Articulo.IdArticulo := Tabla.FieldByName('Id').AsString ;
    Articulo.Descripcion := Tabla.FieldByName('Descripcion').AsString ;
    Articulo.Precio := Tabla.FieldByName('Precio').AsFloat;
    Articulo.Utilidad := Tabla.FieldByName('Utilidad').AsFloat;
    Articulo.Costo  := Tabla.FieldByName('Costo').AsFloat ;
    Articulo.Codiva  := Tabla.FieldByName('Codiva').AsString;
    Articulo.TasaIva  := 0;
    Articulo.Idrubro  := Tabla.FieldByName('idrubro').AsString;
    result := true;
  end;
 Tabla.close  ;
 Tabla.Destroy;

End;


procedure TFmFindaRTICULO.DBGrid1DblClick(Sender: TObject);
begin
  FmFindArticulo.ModalResult := mrok;
end;

procedure TFmFindaRTICULO.Ed_busquedaChange(Sender: TObject);
begin
 ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmFindaRTICULO.FormCreate(Sender: TObject);
begin
 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;
 ListaCompleta.Clear;
 ArticulosLeerListado(ListaCompleta, 'activo');
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);

end;

procedure TFmFindaRTICULO.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_down) or ( key = VK_up) then
    ListView1.SetFocus;
end;

procedure TFmFindaRTICULO.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
 if Sender.Items[item.index].Selected then
    Sender.Canvas.Font.Color := clRed;
 if Sender.Items[item.index].Selected then
    Sender.Canvas.Brush.Color := clBlue;
end;

procedure TFmFindaRTICULO.ListView1Data(Sender: TObject; Item: TListItem);
var
 Articulo : TArticulo;
begin
  Articulo := TArticulo(ListaActiva.objects[Item.Index]);
  with Item do
   begin
    Caption :=  Articulo.IdArticulo;
    SubItems.Add( Articulo.Descripcion );
    SubItems.Add( FloatToStrF(Articulo.Precio, fffixed,18,2));
    SubItems.Add( FloatToStrF(Articulo.Stock, fffixed,18,2));
   end;
end;

procedure TFmFindaRTICULO.ListView1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     BC_Aceptar.Click;
end;

end.

