unit ComprobVtaEstados;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;

Type
  TComprobVtaEstados = class(Tobject)
    Codigo : String;
    descripcion : string[150];
    color : string[20];
  end;

Procedure ComprobVtaEstadoLeerListado(Lista : TStringList );
Procedure ComprobVtaEstadoLeer( ComprobEstado : TComprobVtaEstados );
Procedure ComprobVtaEstadoEditar( ComprobEstado : TComprobVtaEstados );
Function  ComprobVtaEstadoBorrar( Codigo : String): Boolean;
Procedure ComprobVtaEstadoAgregar( ComprobEstado : TComprobVtaEstados );

Implementation
uses
 main,UtilsFunc,importsdll;

PRocedure ComprobVtaEstadoLeerListado(Lista : TStringList );
var
  Tabla : TFDquery;
  COmprobEstado : TComprobVtaEstados;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM comprob_vta_estados order by descripcion');
 Tabla.open;

 while not Tabla.EOF do
  begin
    COmprobEstado := TComprobVtaEstados.create ;
    COmprobEstado.Codigo := Tabla.FieldByName('Codigo').AsString ;
    COmprobEstado.Descripcion := Tabla.FieldByName('descripcion').AsString ;
    COmprobEstado.color := Tabla.FieldByName('color').AsString ;
    Lista.AddObject(Tabla.FieldByName('Codigo').AsString, COmprobEstado);
   Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure ComprobVtaEstadoLeer( ComprobEstado : TComprobVtaEstados );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  //UPDATE `coprob_vta_estados` SET `descripcion` = 'NORMAL 21' WHERE `coprob_vta_estados`.`id` = 1;
   Tabla.SQL.ADD('SELECT * FROM comprob_vta_estados WHERE Codigo='+ QuotedStr (COmprobEstado.Codigo) );
    Tabla.oPEN;
    COmprobEstado.Codigo := Tabla.FieldByName('Codigo').AsString ;
    COmprobEstado.Descripcion := Tabla.FieldByName('descripcion').AsString ;
    COmprobEstado.color := Tabla.FieldByName('color').AsString ;
    except
   on E : Exception do
    Mensaje('Error al leer estado. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;

Procedure ComprobVtaEstadoEditar( ComprobEstado : TComprobVtaEstados );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  //UPDATE `coprob_vta_estados` SET `descripcion` = 'NORMAL 21' WHERE `coprob_vta_estados`.`id` = 1;
   Tabla.SQL.ADD('UPDATE comprob_vta_estados SET descripcion='+ QuotedStr(COmprobEstado.descripcion) );
   Tabla.SQL.ADD(', color='+ QuotedStr(COmprobEstado.color) );
    Tabla.SQL.ADD(' WHERE Codigo='+ QuotedStr(COmprobEstado.Codigo) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error actualizando Estado de Comprobantes. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;

Function  ComprobVtaEstadoBorrar( Codigo : String): Boolean;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM comprob_vta_estados Where Codigo='+ QuotedStr(Codigo) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando Estado de Comprobante. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;

Procedure ComprobVtaEstadoAgregar( ComprobEstado : TComprobVtaEstados );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  //  INSERT INTO `coprob_vta_estados` (`id`, `descripcion`, `color`) VALUES (NULL, 'NORMAL', '32432432');
   Tabla.SQL.ADD('Insert into  comprob_vta_estados(Codigo,descripcion,color) values( ' );
   Tabla.SQL.ADD( QuotedStr(ComprobEstado.Codigo) +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobEstado.descripcion) +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobEstado.color)  +')' );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error insertando Estado de Comprobante. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;



end.

