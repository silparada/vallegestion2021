unit comprobvtaPtosVta;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;


Type
  TPuntoVta = class(Tobject)
    id_ptovta : String[20];
    descripcion : string[80];
    Tipo_Facturacion: string[20];
  end;

Procedure PuntosVta_LeerListado(Lista : TStringList );
Procedure PuntosVta_UpdateDb( PuntoVta : TPuntoVta );
Procedure PuntosVta_DeleteDb( Id : String);
Procedure PuntosVta_InsertDb( PuntoVta : TPuntoVta );

Implementation
uses
 main,UtilsFunc,importsdll;

Procedure PuntosVta_LeerListado(Lista : TStringList );
var
  Tabla : TFDquery;
  PuntoVta : TPuntoVta;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM comprob_vta_puntosvta order by Id_ptovta');
 Tabla.open;

 while not Tabla.EOF do
  begin
    PuntoVta := TPuntoVta.create ;
    PuntoVta.Id_ptovta := Tabla.FieldByName('Id_ptovta').AsString ;
    PuntoVta.Descripcion := Tabla.FieldByName('Descripcion').AsString ;
    PuntoVta.Tipo_Facturacion := Tabla.FieldByName('Tipo_Facturacion').AsString ;
    Lista.AddObject(Tabla.FieldByName('Id_ptovta').AsString, PuntoVta);
   Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure PuntosVta_UpdateDb( PuntoVta : TPuntoVta );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update comprob_vta_puntosvta Set Id_ptovta='+QuotedStr(PuntoVta.Id_ptovta));
   Tabla.SQL.ADD(', descripcion='+ QuotedStr(PuntoVta.descripcion) );
   Tabla.SQL.ADD(', tipo_facturacion='+ QuotedStr(PuntoVta.Tipo_Facturacion) );
   Tabla.SQL.ADD(' Where Id_ptovta='+ QuotedStr(PuntoVta.Id_ptovta) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error actualizando Punto de Venta. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',2);
 end;
  Tabla.Free;
end;

Procedure PuntosVta_DeleteDb( Id : String);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM comprob_vta_puntosvta Where Id_ptovta='+ QuotedStr(Id) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando Punto de Venta. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;

Procedure PuntosVta_InsertDb( PuntoVta : TPuntoVta );
var
 Tabla : TFDquery;
begin
 try

  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Insert into  comprob_vta_puntosvta(id_ptovta,descripcion,tipo_facturacion) values( ' );
   Tabla.SQL.ADD( QuotedStr(PuntoVta.id_ptovta) +',');
   Tabla.SQL.ADD( QuotedStr(PuntoVta.descripcion) +',' );
   Tabla.SQL.ADD( QuotedStr(PuntoVta.Tipo_Facturacion) +')' );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error insertando Punto de Venta. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;



end.

