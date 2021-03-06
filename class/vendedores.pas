unit vendedores;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client ;

Type

 TVendedor = class(Tobject)
   IDVendedor : Integer;
   Nombre : String [120];
   Comision : real;
   observaciones : String;
   Activo : boolean;
  End;

Procedure VendedoresLeerListado (var Lista : TStringList; Estado: string);
Procedure VendedoresLeerVendedor( Vendedor : TVendedor);
Procedure VendedoresAgregar( Vendedor : TVendedor);
Procedure VendedoresEditar( Vendedor : TVendedor);
Procedure VendedoresBorrar( IdVendedor : Integer);


Implementation
uses
 main,UtilsFunc,importsdll;

Procedure VendedoresLeerListado (var Lista : TStringList; Estado: string);
var
 Tabla : TFDquery;
 Vendedor : TVendedor;
begin

  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  if Estado = 'Activo' then
    Tabla.SQL.ADD('SELECT * FROM vendedores Where Activo=true Order By nombre')
  else
    Tabla.SQL.ADD('SELECT * FROM vendedores Order By nombre');
  Tabla.open;

 while not Tabla.EOF do
  begin
    Vendedor := TVendedor.create ;
    Vendedor.IdVendedor := Tabla.FieldByName('Id').AsInteger ;
    Vendedor.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Vendedor.observaciones := Tabla.FieldByName('observaciones').AsString ;
    Vendedor.Comision := Tabla.FieldByName('Comision').AsFloat;
    Lista.AddObject(Tabla.FieldByName('Nombre').AsString, Vendedor);

    Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure VendedoresLeerVendedor( Vendedor : TVendedor);
var
 Table : TFDquery;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM vendedores Where  Id='+ IntToStr(Vendedor.IDVendedor) );
  Table.open;

   Vendedor.IdVendedor := Table.FieldByName('Id').AsInteger ;
   Vendedor.Nombre := Table.FieldByName('Nombre').AsString ;
   Vendedor.Comision := Table.FieldByName('Comision').AsFloat;
   Vendedor.observaciones := Table.FieldByName('observaciones').AsString ;

 Table.close;
 Table.Destroy;
end;

Procedure VendedoresEditar( Vendedor : TVendedor);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM vendedores Where Id='+ IntToStr( Vendedor.IdVendedor) );
  try
  Tabla.open;
  Tabla.Edit;
    //Tabla.FieldByName('IdCliente').AsInteger :=  Cliente.IdCLiente;
    Tabla.FieldByName('Id').AsInteger := Vendedor.idVendedor;
    Tabla.FieldByName('Nombre').AsString := Vendedor.Nombre;
    Tabla.FieldByName('Comision').AsFloat := Vendedor.Comision;
  Tabla.Post;
  except
  on E : Exception do
    Mensaje('Error editando vendedor. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
  end;
  Tabla.close;
  Tabla.free;
end;



Procedure VendedoresAgregar( Vendedor : TVendedor);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('SELECT * FROM vendedores');
  Tabla.open;
  Tabla.Append;
    Tabla.FieldByName('Id').AsInteger:=  Vendedor.IDVendedor;
    Tabla.FieldByName('Nombre').AsString := Vendedor.Nombre;
    Tabla.FieldByName('Comision').AsFloat := Vendedor.Comision;
  Tabla.Post;

 except
  on E : Exception do
    Mensaje('Error insertando vendedor Pago. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
 end;
  Tabla.close;
  Tabla.free;
end;


Procedure VendedoresBorrar( IdVendedor : Integer);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM vendedores Where Id='+ IntToStr(IdVendedor) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando Vendedor. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',3);
 end;
  Tabla.Free;
end;




end.

