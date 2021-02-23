unit ComprobVtaImpuestos;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;

const
 M = 40;
 msg1 = 'Texto encriptado';

Type
   TImpuesto = class(Tobject)
    Id_Impuesto : String[10];
    descripcion : string[80];
    tipo : string[20];
    tasa : Double;
    Orden : Integer;
    aplica : string[10];
    CodAfip : String[2];
    TipoComprob : String[20];
  end;


Procedure Impuestos_LeerListado(var Lista : TStringList);
Procedure Impuesto_UpdateDb( Impuesto : TImpuesto);
Procedure Impuesto_InsertDb( Impuesto : TImpuesto);
Procedure Impuesto_DeleteDb( IdImpuesto : String);


FUNCTION  CodigoIVA( IVA : string): integer;
procedure LeerTasaIva(CodIva: string ;var TasaIva: double);

procedure ReadDb_LstTasasIva(Lista : TStringList); //ver duplicado
procedure ReadDb_LstImpuestos(Lista:TStringList);  //ver duplicado

Implementation
uses
 main,UtilsFunc,importsdll;

 Procedure Impuestos_LeerListado(var Lista : TStringList);
var
 Table : TFDquery;
 Impuesto : TImpuesto;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM impuestos Order By Orden');
  Table.open;

  while not Table.EOF do
  begin
    Impuesto := TImpuesto.create ;
    Impuesto.id_impuesto := Table.FieldByName('id').AsString ;
    Impuesto.descripcion := Table.FieldByName('descripcion').AsString ;
    Impuesto.Tipo := Table.FieldByName('Tipo').AsString ;
    Impuesto.Tasa := Table.FieldByName('Tasa').AsFloat;
    Impuesto.Orden := Table.FieldByName('Orden').AsInteger;
    Impuesto.Aplica := Table.FieldByName('Aplica').AsString ;
    Impuesto.CodAfip := Table.FieldByName('CodAfip').AsString ;
    Lista.AddObject(Table.FieldByName('id').AsString, Impuesto);
    Table.next;
  end;
 Table.close;
 Table.Destroy;
end;
Procedure Impuesto_UpdateDb(Impuesto : TImpuesto);
var
 Table : TFDquery;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM impuestos WHERE id='+ QuotedStr(Impuesto.id_impuesto));
  Table.open;
  Table.edit;
   // Impuesto.id_impuesto := Table.FieldByName('id_impuesto').AsString ;
    Table.FieldByName('descripcion').AsString  := Impuesto.descripcion;
    Table.FieldByName('Tipo').AsString  := Impuesto.Tipo;
    Table.FieldByName('Tasa').AsFloat := Impuesto.Tasa;
    Table.FieldByName('Orden').AsInteger := Impuesto.Orden;
    Table.FieldByName('Aplica').AsString := Impuesto.Aplica;
    Table.FieldByName('CodAfip').AsString := Impuesto.CodAfip;
  Table.Post;
 Table.close;
 Table.Destroy;
end;
Procedure Impuesto_InsertDb( Impuesto : TImpuesto);
begin
   // sin implementar (impuestos Fijos)
end;
Procedure Impuesto_DeleteDb( IdImpuesto : String);
begin
    // sin implementar (impuestos Fijos)
end;

FUNCTION CodigoIVA( IVA : string): integer;
var
  Tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM impuestos Where Id='+ QuotedStr(IVA));
 Tabla.open;
 If Tabla.RecordCount>0 then
    Result := Tabla.FieldByName('CodAfip').AsInteger  else Mensaje('C�digo de IVA no encontrado','Iva',1);

 Tabla.close;
 Tabla.Destroy;
End;


procedure LeerTasaIva(CodIva: string ;var TasaIva: double);
var
 tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;
 Tabla.SQL.ADD('SELECT * FROM impuestos where id='+ QuotedStr(CodIva));
 Tabla.open;

 TasaIva :=  0;
 If Tabla.RecordCount>0 then
    TasaIva :=  Tabla.FieldByName('Tasa').AsFloat
   else
    mensaje('El art�culo no tiene definido la tasa de IVA','Tasa IVA',3);

 Tabla.Free;
end;

procedure ReadDb_LstTasasIva(Lista : TStringList);
var
  Tabla : TFDquery;
  Impuesto : TImpuesto;
begin
 Lista := TStringList.create;

 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM impuestos Where Tipo=''IVA'' ORDER BY orden');
 Tabla.open;

 while not Tabla.EOF do
  begin
     Impuesto := TImpuesto.Create;
     Impuesto.id_impuesto := Tabla.FieldByName('id').AsString ;
     Impuesto.descripcion := Tabla.FieldByName('descripcion').AsString ;
     Impuesto.tasa := Tabla.FieldByName('tasa').AsFloat ;
     Lista.addObject(Tabla.FieldByName('id').AsString, Impuesto);
     Tabla.next;
  end;

 Tabla.close;
 Tabla.Destroy;
end;

procedure ReadDb_LstImpuestos(Lista:TStringList);
var
 tabla : TFDquery;
 Impuesto : TImpuesto;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;
 Tabla.SQL.ADD('SELECT *  FROM impuestos order by orden');
 Tabla.open;

 While not Tabla.eof do
  begin
    Impuesto := TImpuesto.create;
    Impuesto.id_impuesto := Tabla.FieldByName('id').AsString;
    impuesto.descripcion := Tabla.FieldByName('descripcion').AsString;
  //  impuesto.formula := Tabla.FieldByName('formula').AsString;
    impuesto.tipo := Tabla.FieldByName('tipo').AsString;
    impuesto.tasa := Tabla.FieldByName('tasa').AsFloat;
    impuesto.aplica := Tabla.FieldByName('aplica').AsString;
    Lista.AddObject(Impuesto.id_impuesto, Impuesto );
    Tabla.Next;
  end;

 Tabla.Free;
end;

end.

