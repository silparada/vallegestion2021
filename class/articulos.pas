unit articulos;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client  ;

Type
  TArticulo = class(Tobject)
    IdArticulo : STRING[30];
    Descripcion : string[120];
    CodFabrica : String[30];
    CodBarras : String[30];
    Idrubro : string[20];
    Ubicacion : String[6];
    Costo  : Double;
    Utilidad : Double;
    Precio : Double;
    Habilitado : boolean;
    AdmStock: Boolean;
    Stock : LongInt;
    StockMin : LongInt;
    StockOpt : LongInt;
    IdProveedor : Integer;
    FechaAlta : TDateTime;
    UltimaCpra : TDateTime;
    UltimaVta : TDateTime;
    UltimaAct : TDateTime;
    UnidadMed : String[10];
    CodIva  : String[10];
    TasaIva : Double;
    Observaciones : String[250];
    imagenpath : string[50];
   end;

//Artículos
Procedure ArticulosLeerListado(var Lista : TStringList; Estado : String);
Procedure ArticulosLeerArticulo( Articulo : TArticulo);
Procedure ArticulosEditar( Articulo : TArticulo);
Procedure ArticulosAgregar( Articulo : TArticulo);
FUnction ArticulosBorrar(IdArticulo: string):boolean;

Procedure ArticuloActStock( IDArticulo: String; EntSal : string; Cantidad : Real);
Procedure ArticuloActPrecio(Articulo: TArticulo; CampoaAct : String);

Implementation
uses
 main,UtilsFunc,importsdll;


Procedure ArticulosLeerListado(var Lista : TStringList; Estado : String);
const
  c_UnassignedDate = -693594;
var
 Tabla : TFDquery;
 Articulo : TArticulo;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('SELECT Id,Descripcion,idrubro,precio,costo,stock,CodIva FROM articulos ');
  if Estado = 'Activo' then
    Tabla.SQL.ADD('WHERE articulos.activo=TRUE Order By Descripcion')
  else
    Tabla.SQL.ADD('Order By Descripcion');

  Tabla.open;

 while not Tabla.EOF do
  begin
    Articulo := TArticulo.create ;
    Articulo.IdArticulo := Tabla.FieldByName('Id').AsString ;
    Articulo.Descripcion := Tabla.FieldByName('Descripcion').AsString;
    Articulo.Idrubro := Tabla.FieldByName('IdRubro').AsString;
    Articulo.Precio := Tabla.FieldByName('Precio').AsFloat;
    Articulo.costo := Tabla.FieldByName('Costo').AsFloat;
    Articulo.Stock   := Tabla.FieldByName('Stock').AsInteger;
    Articulo.CodIva := Tabla.FieldByName('CodIva').AsString;

   Lista.AddObject(Articulo.Descripcion, Articulo);
    Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure ArticulosLeerArticulo( Articulo : TArticulo);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM articulos WHERE Id='+ quotedStr(Articulo.Idarticulo) );
  Tabla.open;
  if Tabla.RecordCount > 0 then
   Begin
    //Articulo.IdArticulo := Tabla.FieldByName('Id').AsString ;
    Articulo.Descripcion := Tabla.FieldByName('Descripcion').AsString;
    Articulo.Idrubro := Tabla.FieldByName('IdRubro').AsString;
    Articulo.Precio := Tabla.FieldByName('Precio').AsFloat;
    Articulo.Stock   := Tabla.FieldByName('Stock').AsInteger;
    Articulo.Costo := Tabla.FieldByName('Costo').AsFloat;
    Articulo.Utilidad := Tabla.FieldByName('Utilidad').AsFloat;
    Articulo.CodIva := Tabla.FieldByName('CodIva').AsString;
    Articulo.Habilitado := Tabla.FieldByName('Habilitado').AsBoolean;
    Articulo.AdmStock := Tabla.FieldByName('AdmStock').AsBoolean;
    Articulo.StockMin := Tabla.FieldByName('StockMin').AsInteger;
    Articulo.StockOpt := Tabla.FieldByName('StockOpt').AsInteger;
    Articulo.imagenpath := Tabla.FieldByName('imagen').AsString;
    Articulo.Ubicacion := Tabla.FieldByName('Ubicacion').AsString;
    Articulo.CodFabrica := Tabla.FieldByName('CodFabrica').AsString;
    Articulo.UnidadMed := Tabla.FieldByName('UnidadMed').AsString;
    Articulo.CodBarras := Tabla.FieldByName('CodBarras').AsString;
    Articulo.Observaciones := Tabla.FieldByName('Observaciones').AsString;
    Articulo.UltimaAct := Tabla.FieldByName('UltimaAct').AsDateTime;
    Articulo.FechaAlta := Tabla.FieldByName('FechaAlta').AsDateTime;
    Articulo.UltimaVta := Tabla.FieldByName('UltimaVta').AsDateTime;
    Articulo.UltimaCpra := Tabla.FieldByName('UltimaCpra').AsDateTime;
   end;

End;

// EDITAR ARTICULO
Procedure ArticulosEditar( Articulo : TArticulo);
var
  Tabla : TFDquery;
begin
 // screen.Cursor := crSQLWait;
  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.ADD('SELECT * FROM articulos WHERE Id='+QuotedStr(Articulo.IdArticulo));
   Tabla.open;
   Tabla.Edit;
   //showmessage('edisi{on');
  // Tabla.FieldByName('Id').AsString := Articulo.IdArticulo;
   Tabla.FieldByName('Descripcion').AsString := Articulo.Descripcion;
   Tabla.FieldByName('CodFabrica').AsString := Articulo.CodFabrica;
   Tabla.FieldByName('CodBarras').AsString := Articulo.CodBarras;
   Tabla.FieldByName('Idrubro').AsString := Articulo.Idrubro;
   Tabla.FieldByName('Ubicacion').AsString := Articulo.Ubicacion;
   Tabla.FieldByName('Costo').AsFloat := Articulo.Costo;
   Tabla.FieldByName('Utilidad').AsFloat := Articulo.Utilidad;
   Tabla.FieldByName('Precio').AsFloat := Articulo.Precio;
   if Articulo.Habilitado then Tabla.FieldByName('Habilitado').AsBoolean := True
    else Tabla.FieldByName('Habilitado').AsBoolean := False;
   if Articulo.AdmStock then Tabla.FieldByName('AdmStock').AsBoolean := true
    else Tabla.FieldByName('AdmStock').AsBoolean := false;
   Tabla.FieldByName('Stock').AsFloat := Articulo.Stock;
   Tabla.FieldByName('StockMin').AsFloat := Articulo.StockMin;
   Tabla.FieldByName('StockOpt').AsFloat := Articulo.StockOpt;
   Tabla.FieldByName('IdProveedor').AsInteger := Articulo.IdProveedor;
   //if TryStrToDate( Articulo.FechaAlta, fecha ) then
   Tabla.FieldByName('FechaAlta').AsDateTime := Articulo.FechaAlta;
   //if TryStrToDate( Articulo.UltimaCpra, fecha ) then
   Tabla.FieldByName('UltimaCpra').AsDateTime := Articulo.UltimaCpra;
   //if TryStrToDate( Articulo.UltimaVta, fecha ) then
   Tabla.FieldByName('UltimaVta').AsDateTime := Articulo.UltimaVta;
   if Articulo.UltimaAct > 0 then
      Tabla.FieldByName('UltimaAct').AsDateTime := Articulo.UltimaAct;
   Tabla.FieldByName('UnidadMed').AsString := Articulo.UnidadMed;
   Tabla.FieldByName('CodIva').AsString := Articulo.CodIva;
   Tabla.FieldByName('Observaciones').AsString := Articulo.Observaciones;
   Tabla.FieldByName('imagen').AsString := Articulo.imagenpath;
   Tabla.Post;
   Tabla.close;
 except
  //  mensaje('Ha ocurrido un error grabando el comprobante',' Error DB', 2);
    on E : Exception do
     begin
      Mensaje('Error grabando cambios en Artículos. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3)
     end;
 end;
 Tabla.free;
// screen.Cursor := crDefault;
end;

// AGREGAR ARTÍCULO
Procedure ArticulosAgregar( Articulo : TArticulo);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin

  //screen.Cursor := crSQLWait;
  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.ADD('SELECT * FROM articulos');
   Tabla.open;
   Tabla.Append;
   //showmessage('edisi{on');
   Tabla.FieldByName('Id').AsString := Articulo.IdArticulo;
   Tabla.FieldByName('Descripcion').AsString := Articulo.Descripcion;
   Tabla.FieldByName('CodFabrica').AsString := Articulo.CodFabrica;
   Tabla.FieldByName('CodBarras').AsString := Articulo.CodBarras;
   Tabla.FieldByName('Idrubro').AsString := Articulo.Idrubro;
   Tabla.FieldByName('Ubicacion').AsString := Articulo.Ubicacion;
   Tabla.FieldByName('Costo').AsFloat := Articulo.Costo;
   Tabla.FieldByName('Utilidad').AsFloat := Articulo.Utilidad;
   Tabla.FieldByName('Precio').AsFloat := Articulo.Precio;
   if Articulo.Habilitado then Tabla.FieldByName('Habilitado').AsBoolean := True
    else Tabla.FieldByName('Habilitado').AsBoolean := False;
   if Articulo.AdmStock then Tabla.FieldByName('AdmStock').AsBoolean := true
    else Tabla.FieldByName('AdmStock').AsBoolean := false;
   Tabla.FieldByName('Stock').AsFloat := Articulo.Stock;
   Tabla.FieldByName('StockMin').AsFloat := Articulo.StockMin;
   Tabla.FieldByName('StockOpt').AsFloat := Articulo.StockOpt;
   Tabla.FieldByName('IdProveedor').AsInteger := Articulo.IdProveedor;
   //if TryStrToDate( Articulo.FechaAlta, fecha ) then
   Tabla.FieldByName('FechaAlta').AsDateTime := Articulo.FechaAlta;
   //if TryStrToDate( Articulo.UltimaCpra, fecha ) then
   Tabla.FieldByName('UltimaCpra').AsDateTime := Articulo.UltimaCpra;
   //if TryStrToDate( Articulo.UltimaVta, fecha ) then
   Tabla.FieldByName('UltimaVta').AsDateTime := Articulo.UltimaVta;
   if Articulo.UltimaAct > 0 then
      Tabla.FieldByName('UltimaAct').AsDateTime := Articulo.UltimaAct;
   Tabla.FieldByName('UnidadMed').AsString := Articulo.UnidadMed;
   Tabla.FieldByName('CodIva').AsString := Articulo.CodIva;
   Tabla.FieldByName('Observaciones').AsString := Articulo.Observaciones;
   Tabla.FieldByName('imagen').AsString := Articulo.imagenpath;
   Tabla.Post;
   Tabla.close;
  except
    on E : Exception do
     begin
      Mensaje('Error insertándo articulos. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3)
     end;
  end;
   Tabla.close ;
   Tabla.free;
 //  screen.Cursor := crDefault;

end;
Function ArticulosBorrar(IdArticulo: string): boolean   ;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('SELECT id FROM articulos_movimientos Where idArticulo='+ QuotedStr(IdArticulo) );
   Tabla.open;
   if Tabla.RecordCount > 0  then
    Begin
     Mensaje('No sepuede borrar el artículo tiene movimeintos asociados', 'Error',3);
     result:=false;
     Exit;
    End;



  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM articulos Where id='+ QuotedStr(IdArticulo) );
   Tabla.ExecSQL;
   result:= true;
 except
   on E : Exception do
    Mensaje('Error borrando el artículo. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
end;

// ACTUALIZAR STOCK AL AGREGAR UN  MOVIMIENTO

Procedure ArticuloActStock( IDArticulo: String; EntSal : string; Cantidad : Real);
var
  TaArticulo : TFDQuery;
  TaMovimArt : TFDQuery;
  i:integer;
begin
 TaArticulo := TFDQuery.Create(Application);
 TaArticulo.Connection := FmMain.FDConnection1;
 try
    TaArticulo.Sql.Add('SELECT * FROM articulos where ID='+ QuotedStr(IdArticulo) ) ;
   TaArticulo.Open;

    TaArticulo.Edit;
    if EntSal = 'S'  then  //salida
     Begin
      TaArticulo.FieldByName('Stock').AsFloat := TaArticulo.FieldByName('Stock').AsFloat  + Cantidad;
      TaArticulo.FieldByName('UltimaVta').AsDateTime := now;
     End else // entrada
     Begin
      TaArticulo.FieldByName('Stock').AsFloat := TaArticulo.FieldByName('Stock').AsFloat  - Cantidad;
      TaArticulo.FieldByName('UltimaCpra').AsDateTime := now;
     End;

    TaArticulo.Post;
  finally
      TaArticulo.close;
 end;
 end;

//  ACTUALIZAR PRECIO

Procedure ArticuloActPrecio(Articulo: TArticulo; CampoaAct : String);
var
  Tabla : TFDquery;
begin
  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update articulos Set '+ CampoaAct+ '='+ QuotedStr(FloatToStrF(Articulo.Precio,fffixed,18,2)) + ' Where id=' + quotedStr(Articulo.IdArticulo) );
   Tabla.ExecSQL;
   Tabla.close;
  finally
   Tabla.close ;
   Tabla.free;
  end;
end;


end.

