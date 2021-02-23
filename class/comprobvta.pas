unit comprobvta;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;

Type

 TComprobante = class(Tobject)
   Id : LongInt;
   PtoVta : string[4];
   Numero : string[8];
   Letra : CHAR;
   TipoComprob : String[30];
   TipoCompAfip : String[2];
   Fecha : TdateTime;
   FechaHasta : TDateTime;
   FechaVto : TdateTime;
   Movim : Integer;
   DebCred : char;
   TipoStock  : char; //S-suma  R-Resta

   IdCliente : Integer;
   Nombre : String[60];
   Direccion : String[60];
   email : string[100];
   CodPostal : String[4];
   Ciudad : String[60];
   Provincia : String[60];
   TipoDoc : Integer;
   NroDoc : string[20];
   IdCategImpos :  String[3];
   CondVta : Integer;   // 0-ctdo 1_cta cte
   IdFormaPago : String[3];

   IdVendedor : Integer;
   ListaItems : TObjectlist;
   Observaciones : string[150];
   CAE : String[14];
   CAE_VTO : String[12];
// ListaImpuestos: TObjectlist;

   Subtotal : Real;
   Iva1_Neto : Real;
   Iva2_Neto : Real;
   Iva3_Neto : Real;
   NoGr_neto : Real;
   Exen_neto : Real;
   Iva1_Importe : Real;  // campos importes no se guardan en la Db se calculan con las tasas actuales.
   Iva2_Importe : Real;
   Iva3_Importe : Real;
   Imp1_Neto : Real;
   Imp2_Neto  : Real;
   Imp3_Neto  : Real;
   Imp1_Importe  : Real;
   Imp2_Importe  : Real;
   Imp3_Importe  : Real;
   Descuento : Real;
   Importe : Real;
   Saldo : Real;

   ListaAplicac: TObjectlist;
   ListaFondos : TObjectlist;
   Fondos : Real;
   CodEstado : string[10];
  end;



   TAplicacion = class(TObject)
    IdAplicacion : LongInt;
    IdComprobante : LongInt ;
    Comprobante : String ;
    ImporteOrig : Double;
    Aplicado : Double;
    SaldoAct : Double;
    SaldoNue : Double;
   end;

Procedure ComprobVtaLeerListado( Lista : TStringList; TipoComprob, Estado, CantRec: string );
Procedure ComprobVtaLeerComp( IdComprobante: LongInt ; ComprobVta : TComprobante);
procedure ComprobVtaAgregar(ComprobVta : TComprobante);
procedure ComprobVtaBorrar(IdComprobante : LongInt);
procedure ComprobVtaAgregarItem(ComprobVta : TComprobante; IdComprobante : LongInt);

Procedure ComprobVtaActEstado( IdComprobante: LongInt ; CodEstado,Observaciones : String);
Procedure ComprovVtaCopiar( IdOriginal: LongInt; TipoComprob: String);

Procedure LeerNroComp( PtoVta, IdTipoComp : string; var numero : String);

procedure ComprobVtaLeerCAE(Factura : TComprobante);
procedure ComprobVtaGrabarAplicaciones(Aplicacion:TAplicacion);

Implementation

uses
   Fondos,ItemsVta,articulos,ciudades, movimvta,articulosmovim,  ajustes,
   main,UtilsFunc,importsdll ;

Procedure ComprobVtaLeerListado( Lista : TStringList; TipoComprob, Estado, CantRec: string );
var
 Tabla : TFDquery;
 Comprob : TComprobante;
Begin

 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;

 Tabla.SQL.ADD('SELECT CV.*, clientes.id As IdClie,clientes.nombre As Nombre FROM comprob_vta CV INNER JOIN clientes ON CV.IdCliente=clientes.id');

 IF TipoComprob <> 'TODOS' then
  Begin
   Tabla.SQL.ADD(' WHERE TipoComprob='+ QuotedStr(TipoComprob) );
   if Estado <> 'TODOS' then
    Tabla.SQL.ADD(' AND CodEstado='+ QuotedStr(Estado) );
  end else
      begin
       if Estado <> 'TODOS' then
       Tabla.SQL.ADD(' WHERE CodEstado='+ QuotedStr(Estado) );
      end;

 Tabla.SQL.ADD(' Order By CV.Id DESC ');

 if CantRec <>'' then Tabla.SQL.ADD('LIMIT '+ CantRec);

 Tabla.open;

  while not Tabla.eof do
   begin
    Comprob := TComprobante.Create;
    Comprob.Id :=  Tabla.FieldByName('Id').AsInteger;
    Comprob.PtoVta := Tabla.FieldByName('PtoVta').AsString;
    Comprob.Numero := Tabla.FieldByName('Numero').AsString;
    Comprob.TipoComprob := Tabla.FieldByName('TipoComprob').AsString;
    Comprob.Fecha := Tabla.FieldByName('Fecha').AsdateTime;
    Comprob.IdCliente := Tabla.FieldByName('IdClie').AsInteger ;
    Comprob.Nombre := Tabla.FieldByName('Nombre').AsString;
    Comprob.Importe := Tabla.FieldByName('Importe').AsFloat;
    Comprob.CAE :=  Tabla.FieldByName('CAE').AsString ;
    Comprob.CodEstado := Tabla.FieldByName('CodEstado').AsString;
    Comprob.Observaciones := Tabla.FieldByName('Observaciones').AsString;
    Lista.AddObject(Tabla.FieldByName('Id').AsString, Comprob );
    Tabla.Next;
   end;

   Tabla.close;
   Tabla.free;

  //   ShowMessage('OK');
End;

Procedure ComprobVtaLeerComp( IdComprobante: LongInt ; ComprobVta : TComprobante);
var
  TaFactura,TaItem,TaFondos,TaAplicaciones : TFDquery;
  Item : TItemFact;
  Aplicacion : TAplicacion;
  Fondo : TFondo;
  TasaIva1,TasaIva2,TasaIva3 : REal;
  Ciudad : TCiudad;
begin
 TaFactura := TFDquery.Create(Application);
 TaFactura.Connection := FmMain.FDConnection1;
// TaFactura.CommandText := 'SELECT * FROM ComprVta join  where IdComprobante='+IntToStr(IdComprobante) ;
 TaFactura.sql.Text := 'SELECT CV.id As IdComp, CV.*, C.id as ClieId, C.* FROM comprob_vta CV LEFT JOIN clientes C ON CV.IdCliente = C.id '+
   'WHERE CV.Id=' + IntToStr(IdComprobante);

 TaFactura.Open;
  if TaFactura.RecordCount > 0 then
   Begin
      ComprobVta.PtoVta := TaFactura.FieldByName('PtoVta').AsString;
      ComprobVta.Numero := TaFactura.FieldByName('Numero').AsString;
      ComprobVta.TipoComprob :=  TaFactura.FieldByName('TipoComprob').AsString;
      ComprobVta.Fecha := TaFactura.FieldByName('Fecha').AsDateTime;
      ComprobVta.FechaVto := TaFactura.FieldByName('FechaVto').AsDateTime;
      ComprobVta.IdCliente := TaFactura.FieldByName('ClieId').AsInteger;
      ComprobVta.Nombre := TaFactura.FieldByName('Nombre').AsString;
      ComprobVta.NroDoc := TaFactura.FieldByName('NroDoc').AsString;
      ComprobVta.Direccion := TaFactura.FieldByName('Direccion').AsString;


      ComprobVta.CodPostal := TaFactura.FieldByName('CodPostal').AsString;
      Ciudad := TCiudad.create;
      Ciudad.CodPostal := TaFactura.FieldByName('CodPostal').AsString;
      if CiudadesBuscar(Ciudad) then
       begin
        ComprobVta.Ciudad := Ciudad.Nombre;
        ComprobVta.Provincia := Ciudad.Provincia;
       end;

      Ciudad.Free;

      ComprobVta.IdCategImpos := TaFactura.FieldByName('CategImpos').AsString;
      ComprobVta.CondVta := TaFactura.FieldByName('CondVta').AsInteger;
      ComprobVta.IdFormaPago := TaFactura.FieldByName('IdFormaPago').AsString;
      ComprobVta.IDVEndedor := TaFactura.FieldByName('IDVEndedor').AsInteger;

      ComprobVta.Iva1_neto := TaFactura.FieldByName('iva1_neto').AsFloat;
      ComprobVta.Iva2_neto := TaFactura.FieldByName('iva2_neto').AsFloat;
      ComprobVta.Iva3_neto := TaFactura.FieldByName('iva3_neto').AsFloat;
      ComprobVta.nogr_neto := TaFactura.FieldByName('nogr_neto').AsFloat;
      ComprobVta.exen_neto := TaFactura.FieldByName('exen_neto').AsFloat;
      ComprobVta.iva1_importe := TaFactura.FieldByName('iva1_importe').AsFloat;
      ComprobVta.iva2_importe := TaFactura.FieldByName('iva2_importe').AsFloat;
      ComprobVta.iva3_importe := TaFactura.FieldByName('iva3_importe').AsFloat;

      ComprobVta.imp1_neto := TaFactura.FieldByName('imp1_neto').AsFloat;
      ComprobVta.imp2_neto := TaFactura.FieldByName('imp2_neto').AsFloat;
      ComprobVta.imp3_neto := TaFactura.FieldByName('imp3_neto').AsFloat;
      ComprobVta.imp1_importe := TaFactura.FieldByName('imp1_importe').AsFloat;
      ComprobVta.imp2_importe := TaFactura.FieldByName('imp2_importe').AsFloat;
      ComprobVta.imp3_importe := TaFactura.FieldByName('imp3_importe').AsFloat;

      ComprobVta.SubTotal := TaFactura.FieldByName('SubTotal').AsFloat;
      ComprobVta.Descuento := Tafactura.FieldByName('Descuento').AsFloat;
      ComprobVta.Importe := TaFactura.FieldByName('Importe').AsFloat;
      ComprobVta.Id := TaFactura.FieldByName('IdComp').AsInteger;
      ComprobVta.CAE := TaFactura.FieldByName('CAE').AsString;
      ComprobVta.CAE_VTO := TaFactura.FieldByName('CAE_VTO').AsString;
      ComprobVta.CodEstado := TaFactura.FieldByName('CodEstado').AsString;
      ComprobVta.Observaciones := TaFactura.FieldByName('Observaciones').AsString;

      TaFactura.Close;
   End else Mensaje('Comprobante no encontrado. Id Comprobnate: '+ IntToStr(IdComprobante), 'Obtener comprob. VTA', 3 );

    //items
      TaItem := TFDquery.Create(Application);
      TaItem.Connection := FmMain.FDConnection1;
      TaItem.Sql.add('SELECT * FROM comprob_vta_items Where IdComprobaNte='+ IntToStr(IdComprobante)) ;
      TaItem.Open;

      ComprobVta.ListaItems := TObjectList.Create;
      While not TaItem.EOf do
       begin
        Item := TItemFact.create;
        Item.IdItem := TaItem.FieldByName('IdArticulo').AsString;
        Item.Descripcion := TaItem.FieldByName('Descripcion').AsString ;
        Item.Precio := TaItem.FieldByName('Precio').AsFloat ;
        Item.Cantidad :=  TaItem.FieldByName('Cantidad').AsFloat ;
        Item.Descuento :=TaItem.FieldByName('Descuento').AsFloat ;
        Item.Importe := TaItem.FieldByName('Importe').AsFloat ;
        Item.Tasaiva :=  TaItem.FieldByName('Tasa_Iva').AsString;
        ComprobVta.ListaItems.Add(Item);
        TaItem.Next;
      end;
      TaItem.Close;
  // /****** FONDOS
  TaFondos := TFDquery.Create(Application);
  TaFondos.Connection := FmMain.FDConnection1;
  TaFondos.SQL.Add('SELECT * FROM fondos Where IdComprobante='+ IntToStr(IdComprobante)) ;           //ojo falta tipo I o ...0E
  TaFondos.Open;

  ComprobVta.ListaFondos := TObjectList.Create;
  While not TaFondos.EOf do
   begin
    Fondo := TFondo.create;
    Fondo.Fecha := TaFondos.FieldByName('Fecha').AsDateTime;
    //Fondo.Tipo := TaFondos.FieldByName('Tipo').AsString;
    Fondo.Descripcion := TaFondos.FieldByName('Descripcion').AsString;
    Fondo.Comprobante :=  TaFondos.FieldByName('Comprobante').AsString;
    Fondo.Importe := TaFondos.FieldByName('Importe').AsFloat ;
    Fondo.Observaciones := TaFondos.FieldByName('Observaciones').AsString;
    Fondo.IdComprobante :=  TaFondos.FieldByName('IdComprobante').AsInteger;
    ComprobVta.ListaFondos.Add(Fondo);
    TaFondos.Next;
  end;
  TaFondos.Close;

  // /****** APLICACIONES.
  TaAplicaciones:= TFDquery.Create(Application);
  TaAplicaciones.Connection := FmMain.FDConnection1;
  TaAplicaciones.SQL.Add('SELECT * FROM cobros_aplicaciones Where IdComprobante='+ IntToStr(IdComprobante)) ;
  TaAplicaciones.Open;

  ComprobVta.ListaAplicac := TObjectList.Create;
  While not TaAplicaciones.EOf do
   begin
    Aplicacion := TAplicacion.create;
    Aplicacion.IdAplicacion :=  TaAplicaciones.FieldByName('Id').AsInteger ;
    Aplicacion.IdComprobante :=  TaAplicaciones.FieldByName('IdComprobante').AsInteger ;
    Aplicacion.Comprobante :=  TaAplicaciones.FieldByName('Comprobante').AsString ;
    Aplicacion.ImporteOrig := TaAplicaciones.FieldByName('ImporteOrig').AsFloat ;
    Aplicacion.Aplicado :=  TaAplicaciones.FieldByName('ImporteAplicado').AsFloat  ;
    Aplicacion.SaldoAct :=TaAplicaciones.FieldByName('SaldoActual').AsFloat ;
    Aplicacion.SaldoNue := TaAplicaciones.FieldByName('SaldoNuevo').AsFloat ;
    ComprobVta.ListaAplicac.Add(Aplicacion);
    TaAplicaciones.Next;
  end;
  TaAplicaciones.Close;
 {    TaImpuestos := TADODataSet.Create(Application);
      TaImpuestos.Connection := FmMain.FDConnection1;
      TaImpuestos.CommandText := 'SELECT * FROM comprob_vta_impuestos Where id_comprobante='+ IntToStr(IdComprobante) ;
      TaImpuestos.Open;

{      ComprobVta.ListaImpuestos := TObjectList.Create;      While not TaImpuestos.EOf do
       begin
        Comprob_Impuesto := TComprob_Impuesto.create;
        Comprob_Impuesto.id_comprobante := TaImpuestos.FieldByName('id_comprobante').AsInteger;
        Comprob_Impuesto.id_impuesto := TaImpuestos.FieldByName('id_impuesto').AsString ;
        Comprob_Impuesto.importe := TaImpuestos.FieldByName('Importe').AsFloat ;
        ComprobVta.ListaImpuestos.Add(Comprob_Impuesto);
        TaImpuestos.Next;
      end;
      TaImpuestos.Close;    }
  TaFactura.free;
  TaFondos.free;
  TaAplicaciones.Free;
  TaItem.free;
end;

procedure ComprobVtaAgregar(ComprobVta : TComprobante);
var
  IdComprobante : LongInt;
  TaFactura : TFDQuery;
  MovimArtic : TMovimArtic;
  i : integer;
begin

try
 TaFactura := TFDQuery.Create(Application);
 TaFactura.Connection := FmMain.FDConnection1;
// TaFactura.Sql.add('SELECT * FROM comprob_vta');
 TaFactura.Sql.add('INSERT INTO comprob_vta (`id`, `TipoComprob`, `PtoVta`, `Numero`, `Fecha`, `FechaVto`, `IdCliente`, `CondVta`, `IdFormaPago`, ');
 TaFactura.Sql.add('`IdVendedor`, `CAE`, `CAE_VTO`, `nogr_neto`, `exen_neto`, `iva1_neto`, `iva2_neto`, `iva3_neto`,');
 TaFactura.Sql.add('`iva1_importe`, `iva2_importe`, `iva3_importe`, `imp1_neto`, `imp2_neto`, `imp3_neto`, `imp1_importe`, `imp2_importe`, `imp3_importe`, ');
 TaFactura.Sql.add('`Descuento`, `Importe`, `SubTotal`, `CodEstado`, `Observaciones`) ');
 TaFactura.Sql.add('VALUES (NULL, :TipoComprob, :PtoVta, :Numero, :Fecha, :FechaVto, :IdCliente, :CondVta, :IdFormaPago, :IDVEndedor, NULL, NULL, :nogr_neto, :exen_neto,');
 TaFactura.Sql.add(':iva1_neto, :iva2_neto, :iva3_neto, :iva1_importe, :iva2_importe, :iva3_importe, :imp1_neto, :imp2_neto,:imp3_neto, :imp1_importe, :imp2_importe, :imp3_importe,');
 TaFactura.Sql.add(':Descuento, :Importe, :SubTotal, :CodEstado, :Observaciones) ');

  TaFactura.ParamByName('PtoVta').AsString := ComprobVta.PtoVta;
  TaFactura.ParamByName('Numero').AsString := ComprobVta.Numero;
  TaFactura.ParamByName('TipoComprob').AsString := ComprobVta.TipoComprob;
  TaFactura.ParamByName('Fecha').AsDateTime := ComprobVta.Fecha;
  TaFactura.ParamByName('FechaVto').AsDateTime := ComprobVta.FechaVto;
  TaFactura.ParamByName('IdCliente').AsInteger := ComprobVta.IdCliente;
  TaFactura.ParamByName('CondVta').AsInteger := ComprobVta.CondVta;
  TaFactura.ParamByName('IdFormaPago').AsString := ComprobVta.IdFormaPago;

  TaFactura.ParamByName('IDVEndedor').AsInteger := ComprobVta.IDVEndedor;
  TaFactura.ParamByName('nogr_neto').AsFloat := ComprobVta.nogr_neto;
  TaFactura.ParamByName('exen_neto').AsFloat := ComprobVta.exen_neto;

  TaFactura.ParamByName('iva1_neto').AsFloat := ComprobVta.Iva1_neto;
  TaFactura.ParamByName('iva2_neto').AsFloat := ComprobVta.Iva2_neto;
  TaFactura.ParamByName('iva3_neto').AsFloat := ComprobVta.Iva3_neto;

  TaFactura.ParamByName('iva1_importe').AsFloat := ComprobVta.Iva1_importe;
  TaFactura.ParamByName('iva2_importe').AsFloat := ComprobVta.Iva2_importe;
  TaFactura.ParamByName('iva3_importe').AsFloat := ComprobVta.Iva3_importe;

  TaFactura.ParamByName('imp1_neto').AsFloat := ComprobVta.imp1_neto;
  TaFactura.ParamByName('imp2_neto').AsFloat := ComprobVta.imp2_neto;
  TaFactura.ParamByName('imp3_neto').AsFloat := ComprobVta.imp3_neto;
  TaFactura.ParamByName('imp1_importe').AsFloat := ComprobVta.imp1_importe;
  TaFactura.ParamByName('imp2_importe').AsFloat := ComprobVta.imp2_importe;
  TaFactura.ParamByName('imp3_importe').AsFloat := ComprobVta.imp3_importe;

  TaFactura.ParamByName('Descuento').AsFloat := ComprobVta.Descuento;
  TaFactura.ParamByName('Importe').AsFloat := ComprobVta.Importe;
  TaFactura.ParamByName('SubTotal').AsFloat := ComprobVta.Subtotal;
  TaFactura.ParamByName('CodEstado').AsString := ComprobVta.CodEstado;

  TaFactura.ParamByName('Observaciones').AsString := ComprobVta.Observaciones;
//TaFactura.ParamByName('Saldo').AsFloat := ComprobVta.Saldo;
  TaFactura.ExecSQL;

  IdComprobante :=  UltimoId('comprob_vta');
  TaFactura.Close;
  ComprobVta.Id := IdComprobante;
//Agregar Item
  ComprobVtaAgregarItem(ComprobVta,IdComprobante);

  // Agregar MovimArt y Act Stock       // en recibos no esta creado
  MovimArtic := TMovimArtic.create;
  if ComprobVta.TipoStock <> 'N' then // S-salida E-entrada N-No aplica
   for i:=0 to ComprobVta.ListaItems.Count-1 do
    begin
     MovimArtic.Fecha := ComprobVta.Fecha;
     MovimArtic.Comprobante := ComprobVta.TipoComprob+' '+ComprobVta.PtoVta+'-'+ComprobVta.Numero ;
     MovimArtic.IdArticulo := TItemFact(ComprobVta.ListaItems[i]).IdItem;
     MovimArtic.IdClieProv :=  ComprobVta.IdCliente;
     MovimArtic.Nombre := ComprobVta.Nombre;
     MovimArtic.precio := TItemFact(ComprobVta.ListaItems[i]).Precio;
     MovimArtic.cantidad := TItemFact(ComprobVta.ListaItems[i]).Cantidad;
     MovimArtic.EntSal := ComprobVta.TipoStock;

     MovimArticuloAgregar( MovimArtic);
     ArticuloActStock(MovimArtic.IdArticulo, MovimArtic.EntSal, MovimArtic.cantidad );
    end;

 except
  //  mensaje('Ha ocurrido un error grabando el comprobante',' Error DB', 2);
    on E : Exception do
       Mensaje('Error grabando comprobante de venta. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
 TaFactura.Free;
 MovimArtic.free;
end;


procedure ComprobVtaAgregarItem(ComprobVta : TComprobante; IdComprobante : LongInt);
var
  TaItem : TFDQuery;
  i:integer;
begin

try
 TaItem := TFDQuery.Create(Application);
 TaItem.Connection := FmMain.FDConnection1;
 TaItem.SQL.Add('INSERT INTO `comprob_vta_items` (`id`, `IdArticulo`, `Descripcion`, `Cantidad`, `Precio`, `Descuento`, `Importe`, `tasa_iva`, `IdComprobante`) ');
 TaItem.SQL.Add('VALUES (NULL, :IdArticulo,:Descripcion, :Cantidad, :Precio, :Descuento, :Importe, :Tasa_Iva, :IdComprobante) ');

 if not(ComprobVta.ListaItems = nil) then
 for i:=0 to ComprobVta.ListaItems.Count-1 do
  begin
   TaItem.PARAMByName('IdArticulo').AsString := TItemFact(ComprobVta.ListaItems[i]).IdItem;
    TaItem.PARAMByName('Descripcion').AsString := TItemFact(ComprobVta.ListaItems[i]).Descripcion;
    TaItem.PARAMByName('Cantidad').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Cantidad;
    TaItem.PARAMByName('Precio').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Precio;
    TaItem.PARAMByName('Descuento').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Descuento;
    TaItem.PARAMByName('Importe').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Importe;
    TaItem.PARAMByName('Tasa_Iva').AsString := TItemFact(ComprobVta.ListaItems[i]).TasaIva;
    TaItem.PARAMByName('IdComprobante').AsInteger := IdComprobante;
    TaItem.ExecSQL;
  end;
  TaItem.Close;
except
  //  mensaje('Ha ocurrido un error grabando el comprobante',' Error DB', 2);
    on E : Exception do
        Mensaje('Error grabando Item. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',2);
   end;
 TaItem.Free;
end;


procedure ComprobVtaBorrar(IdComprobante : LongInt);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM comprob_vta Where id='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;

  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM comprob_vta_Items Where idComprobante='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;

  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM movimvta Where idComprobante='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;


 except
   on E : Exception do
    Mensaje('Error borrando el comprobante. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
End;

Procedure ComprobVtaActEstado( IdComprobante: LongInt ; CodEstado,Observaciones : String);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update comprob_vta Set CodEstado='+ QuotedStr(CodEstado)+', Observaciones='+ QuotedStr(Observaciones) + ' Where Id='+ IntToStr(IdComprobante) );
   Tabla.ExecSQL;
  Mensaje('Se actualiz� el estado del comprobante', 'Actualizar estado',3);
 except
   on E : Exception do
    Mensaje('Error actualizando estado de comprobante. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;

End;

Procedure ComprovVtaCopiar( IdOriginal: LongInt; TipoComprob: String);
var
  COmproVta : TComprobante;
Begin

   ComproVta := TComprobante.create;
   ComprobVtaLeerComp( IdOriginal, ComproVta );

   ComproVta.TipoComprob :=  TipoComprob;

   ComprobVtaAgregar(ComproVta);

   COmproVta.free;
End;


procedure ComprobVtaGrabarAplicaciones(Aplicacion:TAplicacion);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into cobros_aplicaciones(IdComprobante,Comprobante,ImporteOrig,SaldoActual,SaldoNuevo,ImporteAplicado) values ( ');
  Tabla.SQL.add( QuotedStr( IntToStr(Aplicacion.IdComprobante) ) +','+ QuotedStr(Aplicacion.Comprobante) +','  );
  Tabla.SQL.add( QuotedStr( FloatToStr(Aplicacion.ImporteOrig)) +','+ QuotedStr( FloatToStr(Aplicacion.SaldoAct) )+','  ) ;
  Tabla.SQL.add( QuotedStr(  FloatToStr(Aplicacion.SaldoNue) ) +','+ QuotedStr(  FloatToStr(Aplicacion.Aplicado) ) +')'  );
  Tabla.ExecSQL;
//Tabla.sql.EndUpdate;
 Finally
  Tabla.close;
  Tabla.free;
 end;
End;


procedure ComprobVtaLeerCAE(Factura : TComprobante);
var
  IdComprobante : LongInt;
  TaFactura : TFDquery;
begin
     TaFactura := TFDquery.Create(Application);
     TaFactura.Connection := FmMain.FDConnection1;
     TaFactura.Sql.Add('SELECT * FROM comprob_vta Where Id='+ IntToStr(Factura.Id)) ;
     TaFactura.Open;
     TaFactura.edit;
      TaFactura.FieldByName('CAE').AsString := Factura.CAE;
      TaFactura.FieldByName('CAE_VTO').AsString := Factura.CAE_VTO;
     TaFactura.Post;
     TaFactura.Close;
     TaFactura.Destroy;
End;

Procedure LeerNroComp( PtoVta, IdTipoComp: string; var numero : String);
var
  Tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM comprob_vta_definidos where tipo_comprob='+ QuotedStr(IdTipoComp) + ' and pto_vta=' + QuotedStr(PtoVta) );
 Tabla.open;
 if tabla.RecordCount > 0  then
  Numero := Tabla.FieldByName('nro_actual').AsString else
  Mensaje('No se ha encontrado comprobante definido del tipo '+ IdTipoComp +' para el punto de venta '+PtoVta ,'Numeraci�n de comprobantes',3);
 Tabla.close;
 Tabla.Destroy;
end;


end.

