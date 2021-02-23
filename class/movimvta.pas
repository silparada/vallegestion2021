unit movimvta;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ,comprobvta;

type

  TMovimVta = class(TObject)
    Fecha : String[12];
    IDMovimiento : Integer;
    FechaVto : string[20];
    Comprobante : string[30];
    Importe : Real;
    Saldo : Real;
    SaldoNuevo : Real;
    DebCred : String[1];
    Observaciones : String[80];
   end;

Procedure MovimVtaLeerListado(IdCliente: String; Lista : TStringList);
procedure ComprobVtaAgregarMovim(ComprobVta : TComprobante);
Procedure ReadDb_ComprobAdeudados( IdCliente: String;var Lista : TStringList );
Procedure ActualizarSaldo( IdMovimiento:string; saldoNuevo:Double);

Implementation
uses
 main,UtilsFunc,importsdll;

procedure ComprobVtaAgregarMovim(ComprobVta : TComprobante);
var
  IdComprobante : LongInt;
  Tabla : TFDQuery;

begin

try
 Tabla := TFDQuery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.sql.add('SELECT * FROM movimvta');
 Tabla.Open;
 Tabla.Append;
  Tabla.FieldByName('Comprobante').AsString :=  ComprobVta.PtoVta+'-'+ComprobVta.Numero +' '+ ComprobVta.TipoComprob;
  Tabla.FieldByName('DebCred').AsString := ComprobVta.DebCred;
  Tabla.FieldByName('CondVta').AsInteger := ComprobVta.CondVta ;
  Tabla.FieldByName('Fecha').AsDateTime := ComprobVta.Fecha;
  Tabla.FieldByName('FechaVto').AsDateTime := ComprobVta.FechaVto;
  Tabla.FieldByName('IdCliente').AsInteger := ComprobVta.IdCliente;
  Tabla.FieldByName('Importe').AsFloat := ComprobVta.Importe;
  Tabla.FieldByName('Saldo').AsFloat := ComprobVta.Saldo;
  Tabla.FieldByName('Observaciones').AsString := ComprobVta.observaciones;
  Tabla.FieldByName('IdComprobante').AsInteger := ComprobVta.Id;
 Tabla.Post;
 Tabla.Close;
 except
  //  mensaje('Ha ocurrido un error grabando el comprobante',' Error DB', 2);
    on E : Exception do
     begin
      Mensaje('Error grabando Movimiento de Venta. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3)
     end;
 end;
 Tabla.Free;
end;

Procedure MovimVtaLeerListado(IdCliente: String; Lista : TStringList);
var
  Tabla : TFDquery;
  MovimVta : TMovimVta;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM movimvta Where IdCliente=' + IdCliente + ' Order by Fecha' ) ;
 Tabla.open;

 while not Tabla.EOF do
  begin
    MovimVta := TMovimVta.create ;
    MovimVta.Fecha:= FormatDateTime('dd/mm/yyyy', Tabla.FieldByName('Fecha').AsDateTime) ;
    MovimVta.FechaVto := Tabla.FieldByName('FechaVto').AsString ;
    MovimVta.Comprobante := Tabla.FieldByName('Comprobante').AsString ;
    MovimVta.DebCred := Tabla.FieldByName('DebCred').AsString;
    MovimVta.Importe  := Tabla.FieldByName('Importe').AsFloat;
    MovimVta.Saldo  := Tabla.FieldByName('Saldo').AsFloat ;
    MovimVta.Observaciones  := Tabla.FieldByName('Observaciones').AsString ;
    Lista.AddObject(Tabla.FieldByName('Id').AsString, MovimVta);
   Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;

end;

Procedure ActualizarSaldo( IdMovimiento:string; saldoNuevo:Double);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update movimvta Set Saldo='+ FloatToStr(SaldoNuevo) +' Where Id='+ IdMovimiento );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error grabando nuevo Saldo. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
end;

Procedure ReadDb_ComprobAdeudados( IdCliente: String;var Lista : TStringList );
var
 Tabla : TFDquery;
 MovimVta : TMovimVta;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM movimvta Where IdCliente='+IdCliente+' And Saldo>0 AND DebCred="D" Order By Fecha');
  Tabla.open;

 while not Tabla.EOF do
  begin
    MovimVta := TMovimVta.create;
    MovimVta.Fecha := Tabla.FieldByName('Fecha').AsString ;
    MovimVta.IdMovimiento := Tabla.FieldByName('Id').AsInteger ;
    MovimVta.Comprobante := Tabla.FieldByName('Comprobante').AsString;
    MovimVta.FechaVto := Tabla.FieldByName('FechaVto').AsString;
    MovimVta.Importe  := Tabla.FieldByName('Importe').AsFloat ;
    MovimVta.Saldo  := Tabla.FieldByName('Saldo').AsFloat;
    Lista.AddObject(Tabla.FieldByName('Comprobante').AsString, MovimVta);
    Tabla.next;
  end;

  Tabla.Free;

end;



end.

