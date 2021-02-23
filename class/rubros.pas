unit rubros;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;

Type

  TRubro = class(Tobject)
   Id : String[20];
   Descripcion : String [120];
   Observaciones : String[250];
   Activo : boolean;
  End;


Procedure RubrosLeerListado(var Lista : TStringList; Estado : String);
Procedure RubrosLeerRubro( Rubro : TRubro);
Procedure RubrosEditar( Rubro : TRubro);
Procedure RubrosAgregar( Rubro : TRubro);
Function RubrosBorrar( IdRubro: string): Boolean;


Implementation
uses
 main,UtilsFunc, importsdll;

Procedure RubrosLeerListado(var Lista : TStringList; Estado : String);
var
 Tabla : TFDquery;
 Rubro : TRubro;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;

  Tabla.SQL.ADD('SELECT * FROM rubros ');
  if Estado = 'Activo' then
    Tabla.SQL.ADD('WHERE activo=TRUE Order By Descripcion')
  else
    Tabla.SQL.ADD('Order By Descripcion');

  Tabla.open;

 while not Tabla.EOF do
  begin
    Rubro := TRubro.create ;
    Rubro.id := Tabla.FieldByName('IdRubro').AsString ;
    Rubro.Descripcion := Tabla.FieldByName('Descripcion').AsString ;
    Rubro.Observaciones := Tabla.FieldByName('Observaciones').AsString;
    Lista.AddObject(Tabla.FieldByName('Descripcion').AsString, Rubro);
    Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure RubrosLeerRubro( Rubro : TRubro);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM rubros WHERE IdRubro='+ quotedStr(Rubro.Id) );
  Tabla.open;
  if Tabla.RecordCount > 0 then
   Begin
    //Articulo.IdArticulo := Tabla.FieldByName('Id').AsString ;
    Rubro.Descripcion := Tabla.FieldByName('Descripcion').AsString;
    Rubro.Activo := Tabla.FieldByName('Activo').AsBoolean;
    Rubro.Observaciones := Tabla.FieldByName('Observaciones').AsString;

   end;

End;

Procedure RubrosEditar( Rubro : TRubro);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin

  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('SELECT * FROM rubros WHERE IdRubro=' + QuotedStr(Rubro.Id) );
   Tabla.open;
   Tabla.Edit;
    Tabla.FieldByName('Activo').AsBoolean := Rubro.Activo;
    Tabla.FieldByName('Descripcion').AsString := Rubro.Descripcion;
    Tabla.FieldByName('observaciones').AsString := Rubro.Observaciones;
   tABLA.Post;
   Tabla.close;
  finally
   Tabla.close ;
   Tabla.free;
  end;

end;

Procedure RubrosAgregar( Rubro : TRubro);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin

  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.Clear;
   Tabla.SQL.ADD('Insert into  rubros(IDRubro, Descripcion, Observaciones) ' );
   Tabla.SQL.ADD('values ('+ QuotedStr(Rubro.id) +','+ QuotedStr(Rubro.Descripcion) +','+ QuotedStr(Rubro.Observaciones) +')' );
   Tabla.ExecSQL;
   Tabla.close;
  finally
   Tabla.close ;
   Tabla.free;
  end;

end;

Function RubrosBorrar(IdRubro: string): Boolean;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM rubros Where idRubro='+ QuotedStr(IdRubro) );
  Tabla.ExecSQL;
  Result := true;
 except
   on E : Exception do
    Begin
     Mensaje('Error borrando el rubro. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
     Result := false;
    End;
 end;
  Tabla.Free;
end;




end.

