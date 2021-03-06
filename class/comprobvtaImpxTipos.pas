unit comprobvtaImpxTipos;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;


Type
  TComprob_Impuesto = class(Tobject)
    id_impuesto : String[10];
    id_Comprobante : LongInt;
    Importe : Double;
  end;

  // los metodos estan en el form

procedure ReadDb_LstComprobImpuestos(Lista:TStringList);

Implementation
uses
 main, ComprobVtaImpuestos, UtilsFunc,inifiles,importsdll;


procedure ReadDb_LstComprobImpuestos(Lista:TStringList);
var
 tabla : TFDquery;
 Impuesto : TImpuesto;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;
 Tabla.SQL.ADD('SELECT impuestos.*, comprob_vta_tipos_impuestos.* ');
 Tabla.SQL.ADD('FROM impuestos INNER JOIN comprob_vta_tipos_impuestos ON impuestos.id = comprob_vta_tipos_impuestos.id_impuesto ');
 Tabla.SQL.ADD('ORDER BY impuestos.orden' );
 Tabla.open;

 While not Tabla.eof do
  begin
    Impuesto := TImpuesto.create;
    Impuesto.id_impuesto := Tabla.FieldByName('id').AsString;
    impuesto.descripcion := Tabla.FieldByName('descripcion').AsString;
    impuesto.TipoComprob := Tabla.FieldByName('id_tipocomp').AsString;
    impuesto.tipo := Tabla.FieldByName('tipo').AsString;
    impuesto.tasa := Tabla.FieldByName('tasa').AsFloat;
    Lista.AddObject(Impuesto.id_impuesto, Impuesto );
    Tabla.Next;
  end;
 Tabla.Free;
end;




end.

