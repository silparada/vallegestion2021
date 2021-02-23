unit Accessdb_comprobantes;

interface
 uses WinTypes,valletypes,

  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client

  ,forms,sysUtils,Contnrs,Classes,Messages,dialogs,main ,libreria

 ;

procedure GrabarOtroMP( Deposito : TDeposito);
procedure GrabarCuponTC( Cupon : TCupon);
procedure GrabarDeposito( Deposito : TDeposito);
procedure GrabarCheque( Cheque : TCheque);

Procedure LeerCtasBco(var Lista : TStringList);
Procedure LeerTarjetasCred(var Lista : TStringList);

Procedure ComprobVtaLeerListado( Lista : TStringList; TipoComprob, CantRec: string );
Procedure ComprobVtaLeerComp( IdComprobante: LongInt ; ComprobVta : TComprobante);
procedure ComprobVtaAgregar(ComprobVta : TComprobante);
procedure ComprobVtaBorrar(IdComprobante : LongInt);
procedure ComprobVtaAgregarItem(ComprobVta : TComprobante; IdComprobante : LongInt);
procedure ComprobVtaAgregarMovim(ComprobVta : TComprobante);


procedure WriteDb_Aplicaciones(Aplicacion:TAplicacion);
procedure WriteDb_ComprobVtaCAE(Factura : TComprobante);

Procedure MovimVtaLeerListado(IdCliente: String; Lista : TStringList);

Procedure ReadDb_ComprobAdeudados( IdCliente: String;var Lista : TStringList );
Procedure ActualizarSaldo( IdMovimiento:string; saldoNuevo:Double);


//Procedure ReadDb_LstCamposImpresion(Lista : TStringList ; Formato: String );
Procedure ReadDb_FormatoImpresion(PtoVta, TipoComprob:string; var Formato_Impres,Formato_Pdf,impresora:String);

// procedure ReadDb_LstComprobImpuestos(TipoComprob:string;Lista:TStringList);

procedure ReadDb_LstComprobImpuestos(Lista:TStringList); // se carga toda la lista de imp en Main / Luego cada tipos de com  filtra los suyos (En FmComprobVta )
procedure ReadDb_LstImpuestos(Lista:TStringList);
procedure ReadDb_TasaIva(CodIva: string ;var TasaIva: double);

Function ReadDb_Cliente_RubroDesc( Idrubro: string; IdCliente: Integer; var PorcDesc: Real): boolean;

implementation
uses
  accessdb_Archivos;

{*********************************************************************************************************************}
{********************************************* GRABAR MEDIO DE PAGO EN COMPROB ANTE **********************************}
{*********************************************************************************************************************}

procedure GrabarOtroMP( Deposito : TDeposito);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into fondos_OtrosMP(Numero,Fecha,Concepto,Importe,Observaciones) values ( ');
  Tabla.SQL.add( QuotedStr(Deposito.NroComprob) +','+ QuotedStr( DateToStr(Deposito.Fecha)) +','  );
  Tabla.SQL.add( QuotedStr(Deposito.Concepto) +','+ QuotedStr( FloatToStr(Deposito.Importe) )+','  ) ;
  Tabla.SQL.add( QuotedStr(Deposito.Observaciones)  +')'  );

  Tabla.ExecSQL;
//Tabla.sql.EndUpdate;
 Finally
  Tabla.close;
  Tabla.free;
 end;
end;

procedure GrabarCuponTC( Cupon : TCupon);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into fondos_cupones(IdTarjeta,NroCupon,NroTarjeta,TipoNroDoc,Telefono,Fecha,Importe,Presentado,Cuotas,ValorCuota,Observaciones) values ( ');
  Tabla.SQL.add( QuotedStr(Cupon.IdTarjeta) +','+ QuotedStr(Cupon.NroCupon) +','  );
  Tabla.SQL.add( QuotedStr(Cupon.nroTarjeta) +','+ QuotedStr(Cupon.TipoNroDoc )+','  ) ;
  Tabla.SQL.add( QuotedStr( Cupon.Telefono ) +','+ QuotedStr( DateToStr(Cupon.Fecha) ) +','  ) ;
  Tabla.SQL.add( QuotedStr( FloatToStr(Cupon.Importe) ) +','+ QuotedStr('0') +','  ) ;
  Tabla.SQL.add( QuotedStr( IntToStr(Cupon.Cuotas)) +','+  QuotedStr( FloatToStr(Cupon.ValorCuota) ) +','+ QuotedStr(Cupon.Observaciones) +')'  );
  Tabla.ExecSQL;
//Tabla.sql.EndUpdate;
 Finally
  Tabla.close;
  Tabla.free;
 end;
end;

procedure GrabarDeposito( Deposito : TDeposito);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into fondos_depositos(NroComprob,Fecha,Concepto,NroCtaBco,Importe,Estado,Observaciones) values ( ');
  Tabla.SQL.add( QuotedStr(Deposito.NroComprob) +','+ QuotedStr( DateToStr(Deposito.Fecha)) +','  );
  Tabla.SQL.add( QuotedStr(Deposito.Concepto) +','+ QuotedStr(Deposito.NroCtabco )+','  ) ;
  Tabla.SQL.add( QuotedStr(FloatToStr(Deposito.Importe)) +','+ QuotedStr( IntToStr(Deposito.Estado) ) +','  ) ;
  Tabla.SQL.add( QuotedStr(Deposito.Observaciones)  +')'  );
  Tabla.ExecSQL;
//Tabla.sql.EndUpdate;
 Finally
  Tabla.close;
  Tabla.free;
 end;
End;

procedure GrabarCheque( Cheque : TCheque);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into fondos_cheques(Numero,Banco,FechaEm,FechaAC,Importe,Estado,Observaciones,Origen,NroCta,CUIT,Titular) values ( ');
  Tabla.SQL.add( QuotedStr(Cheque.Numero) +','+ QuotedStr(Cheque.Banco) +','  );
  Tabla.SQL.add( QuotedStr( DateToStr(Cheque.FechaEm)) +','+ QuotedStr( DateToStr(Cheque.FechaAc) )+','  ) ;
  Tabla.SQL.add( QuotedStr(  FloatToStr(Cheque.Importe)) +','+ QuotedStr( IntToStr(Cheque.Estado) ) +','  ) ;
  Tabla.SQL.add( QuotedStr( Cheque.Observaciones) +','+ QuotedStr( Cheque.Origen ) +','  ) ;
  Tabla.SQL.add( QuotedStr( Cheque.NroCta) +','+  QuotedStr(Cheque.CUIT) +','+ QuotedStr(Cheque.Titular) +')'  );
  Tabla.ExecSQL;
//Tabla.sql.EndUpdate;
 Finally
  Tabla.close;
  Tabla.free;
 end;
End;

{*********************************************************************************************************************}
{********************************************* LEER CTAS BCO Y TARJETAS***********************************************}
{*********************************************************************************************************************}

Procedure LeerCtasBco(var Lista : TStringList);
var
 Table : TFDquery;
 CuentaBco : TCuentaBco;
begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM BancoCuentas Order By Descripcion');
  Table.open;
  while not Table.EOF do
  begin
    CuentaBco := TCuentaBco.create ;
    CuentaBco.IdCuenta := Table.FieldByName('IdCuenta').AsString ;
    CuentaBco.Descripcion := Table.FieldByName('Descripcion').AsString ;
    Lista.AddObject(Table.FieldByName('Descripcion').AsString, CuentaBco);
    Table.next;
  end;
  Table.close;
 Table.Destroy;
end;


Procedure LeerTarjetasCred(var Lista : TStringList);
var
 Table : TFDquery;
 TarjetaCred : TTarjetaCred;
begin

  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT * FROM TarjetasCredito Order By Descripcion');
  Table.open;
  while not Table.EOF do
  begin
    TarjetaCred := TTarjetaCred.create ;
    TarjetaCred.IdTarjeta := Table.FieldByName('IdTarjeta').AsString ;
    TarjetaCred.Descripcion := Table.FieldByName('Descripcion').AsString ;
    Lista.AddObject(Table.FieldByName('Descripcion').AsString, TarjetaCred);
    Table.next;
  end;
  Table.close;
 Table.Destroy;
end;

{*********************************************************************************************************************}
{********************************************* COMPROBANTE DE VTA*****************************************************}
{*********************************************************************************************************************}

Procedure ComprobVtaLeerListado( Lista : TStringList; TipoComprob, CantRec: string );
var
 Tabla : TFDquery;
 Comprob : TComprobante;
Begin

 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;

 IF TipoComprob = 'TODOS' then
   Tabla.SQL.ADD('SELECT Comprob_vta.*, clientes.id As IdClie,clientes.nombre As Nombre FROM Comprob_Vta INNER JOIN Clientes ON Comprob_vta.IdCliente=Clientes.id Order By Comprob_Vta.Id DESC LIMIT '+ CantRec)
  else
   Tabla.SQL.ADD('SELECT  Comprob_vta.*, clientes.id,clientes.nombre FROM Comprob_Vta INNER JOIN Clientes ON Comprob_vta.IdCliente=Clientes.id where TipoComprob='+ QuotedStr(TipoComprob)+ ' Order By Comprob_Vta.id DESC LIMIT '+ CantRec);

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
begin
 TaFactura := TFDquery.Create(Application);
 TaFactura.Connection := FmMain.FDConnection1;
// TaFactura.CommandText := 'SELECT * FROM ComprVta join  where IdComprobante='+IntToStr(IdComprobante) ;
 TaFactura.sql.Text := 'SELECT Comprob_Vta.id As IdComp, Comprob_Vta.*, C.id as ClieId, C.*, Ciudades.nombre as CiuNombre, Ciudades.*, Comprob_Vta.Id '+
   'FROM (Ciudades INNER JOIN Clientes C ON Ciudades.CodPostal = C.CodPostal) INNER JOIN Comprob_Vta ON C.Id = Comprob_Vta.IDCliente '+
   'WHERE Comprob_Vta.Id=' + IntToStr(IdComprobante);

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
      ComprobVta.Ciudad := TaFactura.FieldByName('CiuNombre').AsString;
      ComprobVta.Provincia := TaFactura.FieldByName('Provincia').AsString;

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

      TaFactura.Close;
   End else Mensaje('Comprobante no encontrado. Id Comprobnate: '+ IntToStr(IdComprobante), 'Obtener comprob. VTA', 3 );

    //items
      TaItem := TFDquery.Create(Application);
      TaItem.Connection := FmMain.FDConnection1;
      TaItem.Sql.add('SELECT * FROM Comprob_Vta_Items Where IdComprobaNte='+ IntToStr(IdComprobante)) ;
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
  TaFondos.SQL.Add('SELECT * FROM Fondos Where IdComprobante='+ IntToStr(IdComprobante)) ;           //ojo falta tipo I o ...0E
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
  TaAplicaciones.SQL.Add('SELECT * FROM Cobros_Aplicaciones Where IdComprobante='+ IntToStr(IdComprobante)) ;
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
 TaFactura.Sql.add('SELECT * FROM Comprob_Vta');
 TaFactura.Open;
 TaFactura.Append;
  TaFactura.FieldByName('PtoVta').AsString := ComprobVta.PtoVta;
  TaFactura.FieldByName('Numero').AsString := ComprobVta.Numero;
  TaFactura.FieldByName('TipoComprob').AsString := ComprobVta.TipoComprob;
  TaFactura.FieldByName('Fecha').AsDateTime := ComprobVta.Fecha;
  TaFactura.FieldByName('FechaVto').AsDateTime := ComprobVta.FechaVto;
  TaFactura.FieldByName('IdCliente').AsInteger := ComprobVta.IdCliente;
  TaFactura.FieldByName('CondVta').AsInteger := ComprobVta.CondVta;
  TaFactura.FieldByName('IdFormaPago').AsString := ComprobVta.IdFormaPago;

  TaFactura.FieldByName('IDVEndedor').AsInteger := ComprobVta.IDVEndedor;
//TaFactura.FieldByName('SubTotal').AsFloat := ComprobVta.SubTotal;
  TaFactura.FieldByName('exen_neto').AsFloat := ComprobVta.exen_neto;
  TaFactura.FieldByName('nogr_neto').AsFloat := ComprobVta.nogr_neto;
  TaFactura.FieldByName('iva1_neto').AsFloat := ComprobVta.Iva1_neto;
  TaFactura.FieldByName('iva2_neto').AsFloat := ComprobVta.Iva2_neto;
  TaFactura.FieldByName('iva3_neto').AsFloat := ComprobVta.Iva3_neto;

  TaFactura.FieldByName('iva1_importe').AsFloat := ComprobVta.Iva1_importe;
  TaFactura.FieldByName('iva2_importe').AsFloat := ComprobVta.Iva2_importe;
  TaFactura.FieldByName('iva3_importe').AsFloat := ComprobVta.Iva3_importe;

  TaFactura.FieldByName('imp1_neto').AsFloat := ComprobVta.imp1_neto;
  TaFactura.FieldByName('imp2_neto').AsFloat := ComprobVta.imp2_neto;
  TaFactura.FieldByName('imp3_neto').AsFloat := ComprobVta.imp3_neto;
  TaFactura.FieldByName('imp1_importe').AsFloat := ComprobVta.imp1_importe;
  TaFactura.FieldByName('imp2_importe').AsFloat := ComprobVta.imp2_importe;
  TaFactura.FieldByName('imp3_importe').AsFloat := ComprobVta.imp3_importe;

  TaFactura.FieldByName('Descuento').AsFloat := ComprobVta.Descuento;
  TaFactura.FieldByName('SubTotal').AsFloat := ComprobVta.Subtotal;
  TaFactura.FieldByName('Importe').AsFloat := ComprobVta.Importe;
//  TaFactura.FieldByName('Saldo').AsFloat := ComprobVta.Saldo;



  TaFactura.Post;
  IdComprobante := TaFactura.FieldByName('Id').AsInteger;
  TaFactura.Close;

  ComprobVta.Id := IdComprobante;
  // Agregar Itema
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

procedure ComprobVtaBorrar(IdComprobante : LongInt);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM Comprob_vta Where id='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;

  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM Comprob_vta_Items Where idComprobante='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;

  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM MovimVta Where idComprobante='+ IntToStr(IdComprobante) );
  Tabla.ExecSQL;


 except
   on E : Exception do
    Mensaje('Error borrando el comprobante. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;

End;



{*********************************************************************************************************************}
{********************************************* GRABAR APLICACIONES EN COMPROB VTA*************************************}
{*********************************************************************************************************************}
procedure WriteDb_Aplicaciones(Aplicacion:TAplicacion);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.add('Insert into Cobros_Aplicaciones(IdComprobante,Comprobante,ImporteOrig,SaldoActual,SaldoNuevo,ImporteAplicado) values ( ');
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

{*********************************************************************************************************************}
{********************************************* ACTUALIZAR SALDO DE UN MOVIM VTA.****************************************}
{*********************************************************************************************************************}
Procedure ActualizarSaldo( IdMovimiento:string; saldoNuevo:Double);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update MovimVta Set Saldo='+ FloatToStr(SaldoNuevo) +' Where Id='+ IdMovimiento );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error grabando nuevo Saldo. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
end;

{*********************************************************************************************************************}
{********************************************* LEER COMPROB ADEUDADOS        ****************************************}
{*********************************************************************************************************************}
Procedure ReadDb_ComprobAdeudados( IdCliente: String;var Lista : TStringList );
var
 Tabla : TFDquery;
 MovimVta : TMovimVta;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM MovimVta Where IdCliente='+IdCliente+' And Saldo>0 AND DebCred="D" Order By Fecha');
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
{*********************************************************************************************************************}
{********************************************* MOVIMIENTOS VTA.****************************************}
{*********************************************************************************************************************}
procedure ComprobVtaAgregarMovim(ComprobVta : TComprobante);
var
  IdComprobante : LongInt;
  Tabla : TFDQuery;

begin

try
 Tabla := TFDQuery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.sql.add('SELECT * FROM MovimVta');
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
 Tabla.SQL.add('SELECT * FROM MovimVta Where IdCliente=' + IdCliente + ' Order by Fecha' ) ;
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



procedure WriteDb_ComprobVtaCAE(Factura : TComprobante);
var
  IdComprobante : LongInt;
  TaFactura : TFDquery;
begin
     TaFactura := TFDquery.Create(Application);
     TaFactura.Connection := FmMain.FDConnection1;
     TaFactura.Sql.Add('SELECT * FROM Comprob_Vta Where Id='+ IntToStr(Factura.Id)) ;
     TaFactura.Open;
     TaFactura.edit;
      TaFactura.FieldByName('CAE').AsString := Factura.CAE;
      TaFactura.FieldByName('CAE_VTO').AsString := Factura.CAE_VTO;
     TaFactura.Post;
     TaFactura.Close;
     TaFactura.Destroy;
End;

{*********************************************************************************************************************}
{********************************************* GRABAR ITEMAS   DE COMP VTA ****************************************}
{*********************************************************************************************************************}

procedure ComprobVtaAgregarItem(ComprobVta : TComprobante; IdComprobante : LongInt);
var
  TaItem : TFDQuery;
  i:integer;
begin

try
 TaItem := TFDQuery.Create(Application);
 TaItem.Connection := FmMain.FDConnection1;
 TaItem.SQL.Add('SELECT * FROM Comprob_vta_items');
 TaItem.Open;
 if not(ComprobVta.ListaItems = nil) then
 for i:=0 to ComprobVta.ListaItems.Count-1 do
  begin
    TaItem.Append;
    TaItem.FieldByName('IdArticulo').AsString := TItemFact(ComprobVta.ListaItems[i]).IdItem;
    TaItem.FieldByName('Descripcion').AsString := TItemFact(ComprobVta.ListaItems[i]).Descripcion;
    TaItem.FieldByName('Cantidad').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Cantidad;
    TaItem.FieldByName('Precio').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Precio;
    TaItem.FieldByName('Descuento').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Descuento;
    TaItem.FieldByName('Importe').AsFloat := TItemFact(ComprobVta.ListaItems[i]).Importe;
    TaItem.FieldByName('Tasa_Iva').AsString := TItemFact(ComprobVta.ListaItems[i]).TasaIva;
    TaItem.FieldByName('IdComprobante').AsInteger := IdComprobante;
    TaItem.Post;
  end;
  TaItem.Close;
except
  //  mensaje('Ha ocurrido un error grabando el comprobante',' Error DB', 2);
    on E : Exception do
        Mensaje('Error grabando Item. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',2);
   end;
 TaItem.Free;
end;

{*********************************************************************************************************************}
{********************************************* LEER FORMATOS DE IMPRESION   ****************************************}
{*********************************************************************************************************************}
Procedure ReadDb_FormatoImpresion(PtoVta, TipoComprob:string; var Formato_Impres,Formato_Pdf,impresora:String);
var
 tabla : TFDquery;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;
 Tabla.SQL.ADD('SELECT * FROM comprob_vta_definidos Where pto_vta=' + QuotedStr(PtoVta) +' and tipo_comprob=' + QuotedStr(TipoComprob)  );
 Tabla.open;
 if Tabla.RecordCount = 1 then
  begin
    Formato_Impres := Tabla.FieldByName('formato_impres').AsString;
    Formato_pdf := Tabla.FieldByName('formato_pdf').AsString;
    Impresora :=  Tabla.FieldByName('impresora').AsString;
  end else Mensaje('No hay formato de impresión definido para el tipo de comprobante '+TipoComprob+' en el punto de venta: '+ PtoVta ,'Error',3 );
 Tabla.Free;
end;

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



{procedure ReadDb_LstComprobImpuestos(TipoComprob:string;Lista:TStringList);
var
 tabla : TFDquery;
 Impuesto : TImpuesto;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.Clear;
 Tabla.SQL.ADD('SELECT impuestos.*, comprob_vta_tipos_impuestos.*, comprob_vta_tipos_impuestos.id_tipocomp ');
 Tabla.SQL.ADD('FROM impuestos INNER JOIN comprob_vta_tipos_impuestos ON impuestos.id_impuesto = comprob_vta_tipos_impuestos.id_impuesto ');
 Tabla.SQL.ADD('WHERE comprob_vta_tipos_impuestos.id_tipocomp='+ QuotedStr(TipoComprob) + ' ORDER BY impuestos.orden' );
 Tabla.open;

 While not Tabla.eof do
  begin
    Impuesto := TImpuesto.create;
    Impuesto.id_impuesto := Tabla.FieldByName('impuestos.id_impuesto').AsString;
    impuesto.descripcion := Tabla.FieldByName('descripcion').AsString;
//  impuesto.formula := Tabla.FieldByName('formula').AsString;
    impuesto.tipo := Tabla.FieldByName('tipo').AsString;
    impuesto.tasa := Tabla.FieldByName('tasa').AsFloat;
    Lista.AddObject(Impuesto.id_impuesto, Impuesto );
    Tabla.Next;
  end;
 Tabla.Free;
end;  }

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
procedure ReadDb_TasaIva(CodIva: string ;var TasaIva: double);
var
 tabla : TFDquery;
 Impuesto : TImpuesto;
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
    mensaje('El artículo no tiene definido la tasa de IVA','Tasa IVA',3);

 Tabla.Free;
end;

{*********************************************************************************************************************}
{********************************************* LEER DESC. POR RUBROS           ****************************************}
{*********************************************************************************************************************}
Function ReadDb_Cliente_RubroDesc( Idrubro: string; IdCliente: Integer ;var PorcDesc: Real): boolean;
var
  Tabla : TFDquery;
  Descuento : TDescuento;
begin
  try
   Tabla := TFDquery.Create(Application);
   Tabla.Connection := FmMain.FDConnection1;
   Tabla.SQL.add('SELECT * FROM Clientes_Descuentos where IdRubro='+ QuotedStr(IDRubro) +' AND '+ 'idcliente='+ IntToStr(IdCliente) );
   Tabla.open;
   PorcDesc := 0;
   If Tabla.RecordCount >= 1 then
     PorcDesc := Tabla.FieldByName('Porcentaje').AsFloat ;

  finally
   Tabla.close ;
   Tabla.free;
  end;
end;

end.
