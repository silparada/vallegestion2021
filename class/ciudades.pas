unit ciudades;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;



Type

 TCiudad = Class(TObject)
   CodPostal : String[4];
   Nombre : String [50];
   Provincia : String [20];
  End;

Procedure CiudadesLeerListado( Lista : TStringList);
Procedure CiudadesLeer( Ciudad : TCiudad);
Procedure CiudadesAgregar( Ciudad : TCiudad);
Procedure CiudadesEditar( Ciudad : TCiudad);
function CiudadesBorrar( CodPostal : String): Boolean;
function CiudadesBuscar( Ciudad : TCiudad): Boolean;


Implementation
uses
 main,UtilsFunc,importsdll;

Procedure CiudadesLeerListado( Lista : TStringList);
var
 Table : TFDquery;
 Ciudad : TCiudad;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM ciudades Order By Nombre');
  Table.open;

  while not Table.EOF do
  begin
    Ciudad := TCiudad.create ;
    Ciudad.CodPostal := Table.FieldByName('CodPostal').AsString ;
    Ciudad.Nombre := Table.FieldByName('Nombre').AsString ;
    Ciudad.Provincia := Table.FieldByName('Provincia').AsString ;
    Lista.AddObject(Table.FieldByName('Nombre').AsString, Ciudad);
    Table.next;
  end;
 Table.close;
 Table.Destroy;
end;

Procedure CiudadesLeer( Ciudad : TCiudad);
var
 Table : TFDquery;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM ciudades  Where CodPostal='+ QuotedStr(Ciudad.CodPostal) );
  Table.open;
    Ciudad.CodPostal := Table.FieldByName('CodPostal').AsString ;
    Ciudad.Nombre := Table.FieldByName('Nombre').AsString ;
    Ciudad.Provincia := Table.FieldByName('Provincia').AsString ;
 Table.close;
 Table.Destroy;
end;

Procedure CiudadesEditar( Ciudad : TCiudad);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM ciudades Where CodPostal='+ QuotedStr( Ciudad.CodPostal) );
  try
  Tabla.open;
  Tabla.Edit;
    //Tabla.FieldByName('IdCliente').AsInteger :=  Cliente.IdCLiente;
    Tabla.FieldByName('CodPostal').AsString := Ciudad.CodPostal;
    Tabla.FieldByName('Nombre').AsString := Ciudad.Nombre;
    Tabla.FieldByName('Provincia').AsString := Ciudad.Provincia;
  Tabla.Post;
  except
  on E : Exception do
    Mensaje('Error editando ciudad. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
  end;
  Tabla.close;
  Tabla.free;
end;

Procedure CiudadesAgregar( Ciudad : TCiudad);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('SELECT * FROM ciudades');
  Tabla.open;
  Tabla.Append;
    Tabla.FieldByName('CodPostal').AsString :=  Ciudad.CodPostal;
    Tabla.FieldByName('Nombre').AsString := Ciudad.Nombre;
    Tabla.FieldByName('Provincia').AsString := Ciudad.Provincia;
  Tabla.Post;

 except
  on E : Exception do
    Mensaje('Error insertando ciudad Pago. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
 end;
  Tabla.close;
  Tabla.free;
end;

function CiudadesBorrar( CodPostal : String): Boolean;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM ciudades Where CodPostal='+ QuotedStr(Codpostal) );
   Tabla.ExecSQL;

   Result := true;
 except
   on E : Exception do
    Begin
     Mensaje('Error borrando ciudad. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',3);
     Result := false;
    End;
 end;
  Tabla.Free;
end;

Function CiudadesBuscar( Ciudad : TCiudad): boolean;
var
 Table : TFDquery;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM ciudades  Where CodPostal='+ QuotedStr(Ciudad.CodPostal) );
  Table.open;
  if Table.RecordCount>0 then
   Begin
    //Ciudad.CodPostal := Table.FieldByName('CodPostal').AsString ;
    Ciudad.Nombre := Table.FieldByName('Nombre').AsString ;
    Ciudad.Provincia := Table.FieldByName('Provincia').AsString ;
    Result:= true;
   End else
       begin
         Result := false;
       end;

 Table.close;
 Table.Destroy;
end;



end.

