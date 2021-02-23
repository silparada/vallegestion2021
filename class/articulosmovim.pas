unit articulosmovim;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;


Type
  TMovimArtic = class(TObject)
   IdMovimiento : LongInt;
   IdArticulo : String[30];
   Fecha : TdateTime;
   Comprobante : String[30];
   IdClieProv : Integer;
   nombre : string[60];
   EntSal : string[1];
   Precio  : Double;
   Cantidad  : Double;
   Observaciones : String[80];
  end;


Procedure MovimArticuloLeerListado(IdArticulo: String; Lista : TStringList);
Procedure MovimArticuloEditar( MovimArtic : TMovimArtic);
Procedure MovimArticuloAgregar( MovimArtic : TMovimArtic);
Procedure MovimArticuloBorrar( IdMovimiento: Longint);

Implementation
uses
 main,UtilsFunc,importsdll;

Procedure MovimArticuloLeerListado(IdArticulo: String; Lista : TStringList);
var
  Tabla : TFDquery;
  MovimPro : TMovimArtic;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM articulos_movimientos Where IdArticulo=' + quotedStr(IdArticulo) + ' Order by Fecha') ;
 Tabla.open;

 while not Tabla.EOF do
  begin
    MovimPro := TMovimArtic.create ;
    MovimPro.IdMovimiento := Tabla.FieldByName('Id').AsInteger ;
    MovimPro.Fecha:= Tabla.FieldByName('Fecha').AsDateTime ;
    MovimPro.Comprobante := Tabla.FieldByName('Comprobante').AsString ;
    MovimPro.Nombre := Tabla.FieldByName('Nombre').AsString;
    MovimPro.EntSal := Tabla.FieldByName('EntSal').AsString;
    MovimPro.Precio  := Tabla.FieldByName('Precio').AsFloat;
    MovimPro.Cantidad  := Tabla.FieldByName('Cantidad').AsFloat ;
   // MovimPro.Observaciones  := Tabla.FieldByName('Observaciones').Asstring ;
    Lista.AddObject(Tabla.FieldByName('Nombre').AsString, MovimPro);
   Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure MovimArticuloEditar( MovimArtic : TMovimArtic);
 var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin

  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update articulos_movimientos Set Fecha='+ QuotedStr( FormatDateTime('yyyy-mm-dd', MovimArtic.Fecha)) + ',');
   Tabla.SQL.ADD('Comprobante='+ QuotedStr(MovimArtic.Comprobante) + ',');
   Tabla.SQL.ADD('EntSal='+ QuotedStr(MovimArtic.EntSal) + ',');
   Tabla.SQL.ADD('Nombre='+ QuotedStr(MovimArtic.nombre) + ',');
   Tabla.SQL.ADD('Precio='+ FloatToStr(MovimArtic.Precio) + ',');
   Tabla.SQL.ADD('Cantidad='+ FloatToStr(MovimArtic.Cantidad ) + ',');
   Tabla.SQL.ADD(' Where  Id=' + IntToStr(MovimArtic.idMovimiento) );
   Tabla.ExecSQL;
   Tabla.close;
  finally
   Tabla.close ;
   Tabla.free;
  end;
end;
Procedure MovimArticuloAgregar( MovimArtic : TMovimArtic);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin

  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('INSERT INTO articulos_movimientos(id,Fecha,Comprobante, IdArticulo,IdClieProv, Nombre, Precio, Cantidad, EntSal) ' );
   Tabla.SQL.ADD('Values ( NULL, :Fecha, :Comprobante ,:IdArticulo,:IdClieProv, :Nombre, :Precio, :Cantidad, :EntSal) ');

   Tabla.ParamByName('Fecha').AsDateTime := MovimArtic.Fecha;
   Tabla.ParamByName('Comprobante').AsString := MovimArtic.Comprobante;
   Tabla.ParamByName('IdArticulo').AsString := MovimArtic.IdArticulo;
   Tabla.ParamByName('IdClieProv').AsInteger := MovimArtic.IdClieProv;
   Tabla.ParamByName('Nombre').AsString := MovimArtic.Nombre;
   Tabla.ParamByName('Precio').AsFloat := MovimArtic.precio;
   Tabla.ParamByName('Cantidad').AsFloat := MovimArtic.Cantidad;
   Tabla.ParamByName('EntSal').AsString := MovimArtic.EntSal;

   Tabla.ExecSQL;
   Tabla.close;
  except
    on E : Exception do
      Mensaje('Error grabando movimiento de artículo/servicio. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
  end;

   Tabla.close ;
   Tabla.free;

end;

Procedure MovimArticuloBorrar( IdMovimiento: Longint);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM articulos_movimientos Where Id='+ IntToStr(IdMovimiento) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando movimiento. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
end;




end.

