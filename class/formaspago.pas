unit formaspago;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;


Type

 TFormaPago= class(Tobject)
   Id : String[10];
   Descripcion : String[120];
   DiasVto : Integer;
   Activo : boolean;
 end;

  Procedure FormaPagoLeerListado(Lista : TStringList; Estado: String);
  Procedure FormaPagoLeerFormaPago( FormaPago : TFormaPago);
  Procedure FormaPagoEditar( FormaPago : TFormaPago);
  Procedure FormaPagoAgregar( FormaPago : TFormaPago);
  Function FormaPagoBorrar( IdFormaPAgo : string):boolean;



Implementation
uses
 main,UtilsFunc,importsdll;

Procedure FormaPagoLeerListado(Lista : TStringList; Estado: String);
var
  Table : TFDquery;
  FormaPAgo : TFormaPago;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  if Estado = 'Activo' then
    Table.SQL.ADD('SELECT * FROM formaspago Where Activo=true Order By Descripcion')
  else
    Table.SQL.ADD('SELECT * FROM formaspago Order By Descripcion');
  Table.open;


  while not Table.EOF do
  begin
    FormaPAgo := TFormaPago.Create;
    FormaPago.Id := Table.FieldByName('Id').Asstring;
    FormaPago.Descripcion := Table.FieldByName('Descripcion').AsString;
    FormaPago.DiasVto := Table.FieldByName('DiasVto').AsInteger;
    FormaPago.activo := Table.FieldByName('activo').AsBoolean;
    Lista.AddObject( Table.FieldByName('Descripcion').AsString, FormaPago);
    Table.next;
  end;
 Table.close;
 Table.Destroy;
end;

Procedure FormaPagoLeerFormaPago( FormaPago : TFormaPago);
var
  Table : TFDquery;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM formaspago Where Id='+ QuotedStr(FormaPago.Id) );
  Table.open;

    FormaPago.Id := Table.FieldByName('Id').Asstring;
    FormaPago.Descripcion := Table.FieldByName('Descripcion').AsString;
    FormaPago.DiasVto := Table.FieldByName('DiasVto').AsInteger;
    FormaPago.activo := Table.FieldByName('activo').asboolean;

 Table.close;
 Table.Destroy;
end;
Procedure FormaPagoEditar( FormaPago : TFormaPago);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM formaspago Where Id='+ QuotedStr(FormaPago.Id) );
  try
  Tabla.open;
  Tabla.edit;
    Tabla.FieldByName('Id').AsString := FormaPago.Id;
    Tabla.FieldByName('descripcion').AsString := FormaPago.Descripcion;
    Tabla.FieldByName('diasVto').AsInteger := FormaPago.DiasVto;
    Tabla.FieldByName('activo').AsBoolean := FormaPago.activo;
  Tabla.Post;
  except
  on E : Exception do
    Mensaje('Error editando Forma de Pago. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
  end;
  Tabla.close;
  Tabla.free;
end;

Procedure FormaPagoAgregar( FormaPago : TFormaPago);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('SELECT * FROM formaspago');
  Tabla.open;
  Tabla.Append;
    Tabla.FieldByName('Id').AsString :=  FormaPago.Id;
    Tabla.FieldByName('descripcion').AsString := FormaPago.descripcion;
    Tabla.FieldByName('diasvto').AsInteger := FormaPago.diasVto;
    Tabla.FieldByName('activo').AsBoolean := FormaPago.activo;
  Tabla.Post;

 except
  on E : Exception do
    Mensaje('Error insertando Forma Pago. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
 end;
  Tabla.close;
  Tabla.free;

End;

function FormaPagoBorrar( IdFormaPAgo : string): boolean;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM formasPago Where id='+ QuotedStr(IdFormaPAgo) );
  Result := true;
   Tabla.ExecSQL;
 except
   on E : Exception do
     Begin
      Mensaje('Error borrando el Forma de Pago. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',3);
      Result := false;
     End;
 end;
  Tabla.Free;

end;


end.

