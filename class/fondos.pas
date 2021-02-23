unit fondos;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;

type
  TFondo = class(TObject)
   Id : Integer;
   Fecha : TDateTime;
   //Tipo : string[20];
   Descripcion : String[80];
   Comprobante : String[30];
   Importe : Double;
   Observaciones : string[80];
   IdComprobante : LongInt;  //puede ser comprob Vta o Comprob Cpra.
   IngEgr : String[1];
  end;

 Procedure FondosLeerListado( Lista : TStringList; Desde,Hasta: TDate );
 Procedure FondosLeerFondo(Fondo : TFondo);
 Procedure FondosBorrar(IdFondo:Integer);
 Procedure FondosAgregar(Fondo : TFondo);
 Procedure FondosEditar(Fondo : TFondo);



Implementation
uses
 main,UtilsFunc,importsdll;

Procedure FondosLeerListado( Lista : TStringList; Desde,Hasta: TDate );
var
  Tabla : TFDquery;
  Fondo : TFondo;
  FechaDesde,FechaHasta : String;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;



 DatetimeToString(FechaDesde,'yyyy-mm-dd', Desde );
 DatetimeToString(FechaHasta,'yyyy-mm-dd', Hasta );

 Tabla.SQL.ADD('SELECT * FROM fondos Where fecha>=:desde AND fecha<=:hasta ');
 Tabla.ParamByName('Desde').AsDatetime := Desde;
 Tabla.ParamByName('hasta').AsDatetime := Hasta; // VER NO FUNCIONA;
 //Tabla.SQL.Clear;
 //Tabla.SQL.ADD('SELECT * FROM fondos');

 Tabla.open;
 While not Tabla.eof do
  Begin
    Fondo := TFondo.Create;
    Fondo.Id := Tabla.FieldByName('Id').AsInteger;
    Fondo.Descripcion := Tabla.FieldByName('descripcion').AsString ;
    Fondo.Fecha := Tabla.FieldByName('fecha').Asdatetime;
    Fondo.Importe := Tabla.FieldByName('importe').AsFloat;
    //Fondo.Tipo := Tabla.FieldByName('Tipo').AsString;
    Fondo.Comprobante := Tabla.FieldByName('Comprobante').AsString;
    Fondo.IdComprobante := Tabla.FieldByName('IdComprobante').AsInteger;
    Fondo.IngEgr := Tabla.FieldByName('IngEgr').AsString;
    Fondo.Observaciones := Tabla.FieldByName('Observaciones').Asstring ;
    Lista.AddObject(Tabla.FieldByName('Descripcion').AsString, Fondo);
    Tabla.next;
  End;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure FondosLeerFondo(Fondo : TFondo);
var
  Tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM fondos Where Id='+inttostr(Fondo.id ));
 Tabla.open;

    Fondo.Id := Tabla.FieldByName('Id').AsInteger;
    Fondo.Descripcion := Tabla.FieldByName('descripcion').AsString ;
    Fondo.Fecha := Tabla.FieldByName('fecha').Asdatetime;
    Fondo.Importe := Tabla.FieldByName('importe').AsFloat;
    //Fondo.Tipo := Tabla.FieldByName('Tipo').AsString;
    Fondo.Comprobante := Tabla.FieldByName('Comprobante').AsString;
    Fondo.IdComprobante := Tabla.FieldByName('IdComprobante').AsInteger;
    Fondo.Observaciones := Tabla.FieldByName('Observaciones').Asstring ;
    Fondo.IngEgr := Tabla.FieldByName('IngEgr').AsString;

 Tabla.close;
 Tabla.Destroy;
end;


Procedure FondosBorrar(IdFondo:Integer);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM fondos Where Id='+ IntToStr(IdFondo) );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando fondo. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error', 3);
 end;
  Tabla.Free;
end;

Procedure FondosAgregar(Fondo : TFondo);
var
  Tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM fondos');
 Tabla.open;
 Tabla.append;
    //Tabla.FieldByName('IdFondo').AsInteger  :=  Fondo.IdFondo;
    Tabla.FieldByName('descripcion').AsString  := Fondo.Descripcion;
    Tabla.FieldByName('fecha').Asdatetime := Fondo.Fecha;
    Tabla.FieldByName('importe').AsFloat := Fondo.Importe;
    //Tabla.FieldByName('Tipo').Asstring := Fondo.Tipo ;
    Tabla.FieldByName('Comprobante').AsString := Fondo.Comprobante;
    Tabla.FieldByName('IdComprobante').AsInteger := Fondo.IdComprobante ;
    Tabla.FieldByName('Observaciones').AsString := Fondo.Observaciones ;
    Tabla.FieldByName('IngEgr').AsString  := Fondo.IngEgr;
  Tabla.post;
 Tabla.close;
 Tabla.Destroy;
end;


Procedure FondosEditar(Fondo : TFondo);
var
  Tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM fondos Where Id='+inttostr(Fondo.id ));
 Tabla.open;
 Tabla.edit;
    //Tabla.FieldByName('IdFondo').AsInteger  :=  Fondo.IdFondo;
    Tabla.FieldByName('descripcion').AsString  := Fondo.Descripcion;
    Tabla.FieldByName('fecha').Asdatetime := Fondo.Fecha;
    Tabla.FieldByName('importe').AsFloat := Fondo.Importe;
    //Tabla.FieldByName('Tipo').AsString := Fondo.Tipo ;
    Tabla.FieldByName('Comprobante').AsString := Fondo.Comprobante;
    Tabla.FieldByName('IdComprobante').AsInteger := Fondo.IdComprobante ;
    Tabla.FieldByName('Observaciones').AsString := Fondo.Observaciones ;
    Tabla.FieldByName('IngEgr').AsString  := Fondo.IngEgr;
  Tabla.post;
 Tabla.close;
 Tabla.Destroy;
end;



end.

