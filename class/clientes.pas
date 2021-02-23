unit clientes;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;

Type

  TCliente = class(Tobject)
    Id : LongInt;
    Nombre : String[80];
    Direccion : string[80];
    CodPostal :string[10];
    Ciudad : string[20];
    Provincia : string[20];
    Telefono : string[50];
    email : string[40];
    TipoDoc : string[20];
    NroDoc : String[20];
    CategImpos : String[3];
    HabCtaCte : Boolean;
    UltimaVta : TDate;
    UltimaPago : TDate;
    FormaPago : String[3];
    DiasVto : Integer;
    ShowObs : Boolean;
    Comprobxemail : Boolean;
    Contacto1 : string[100];
    TelCont1  : string[20];
    Contacto2 : string[100];
    TelCont2  : string[20];
    LimiteCredito : Double;
    FechaAlta : TDatetime;
    UltimaAct : TDateTime;
    Observaciones : String[250];
    activo : boolean;
   end;

    Procedure ClientesLeerListado(var Lista : TStringList; Estado: String);
    Procedure ClientesLeerCliente(var Cliente : TCliente);
    Procedure ClienteEditar( Cliente : TCliente);
    Procedure ClienteAgregar(Cliente : TCliente);
    Function  ClienteBorrar( IdCliente : Integer) : Boolean;

 //   Function  ClienteLeerCodAfip( IdCliente : Integer) : String;

Implementation
uses
 main,UtilsFunc,importsdll;

 Procedure ClientesLeerListado(var Lista : TStringList; Estado: String );
var
 Tabla : TFDquery;
 Cliente : TCliente;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT Id,Nombre,Direccion,telefono,CodPostal FROM clientes ');
//Tabla.SQL.ADD('SELECT * FROM clientes ');
  if Estado = 'Activo' then
    Tabla.SQL.ADD('WHERE CLIENTES.activo=TRUE Order By nombre LIMIT 50')
  else
    Tabla.SQL.ADD('Order By nombre');
  Tabla.open;
 while not Tabla.EOF do
  begin
    Cliente := TCliente.create ;
    Cliente.Id := Tabla.FieldByName('Id').AsInteger ;
    Cliente.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Cliente.Direccion :=  Tabla.FieldByName('Direccion').AsString;
    Cliente.CodposTal :=  Tabla.FieldByName('CodPostal').AsString;
    Cliente.Telefono :=  Tabla.FieldByName('Telefono').AsString;
    Lista.Addobject(Cliente.Nombre, Cliente);
    Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
END;

Procedure ClientesLeerCliente(var Cliente : TCliente);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM clientes WHERE Id='+ IntToStr(Cliente.Id) );
  Tabla.open;
  if Tabla.RecordCount > 0 then
   Begin
    Cliente.Id := Tabla.FieldByName('Id').AsInteger ;
    Cliente.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Cliente.Direccion :=  Tabla.FieldByName('Direccion').AsString;
    Cliente.CodposTal :=  Tabla.FieldByName('CodPostal').AsString;
    //Cliente.Ciudad :=  Tabla.FieldByName('CiudNombre').AsString;
    //Cliente.Provincia :=  Tabla.FieldByName('CiudProvincia').AsString;
    Cliente.Telefono :=  Tabla.FieldByName('Telefono').AsString;
    Cliente.email := Tabla.FieldByName('email').AsString;
    Cliente.TipoDoc :=  Tabla.FieldByName('TipoDoc').AsString;
    Cliente.NroDoc :=  Tabla.FieldByName('NroDoc').AsString;
    Cliente.HabCtaCte := Tabla.FieldByName('HabCtaCte').AsBoolean;
    Cliente.CategImpos := Tabla.FieldByName('CategImpos').AsString;
    Cliente.UltimaVta := Tabla.FieldByName('UltimaVta').AsDateTime;
    Cliente.UltimaPago := Tabla.FieldByName('UltimoPago').AsDateTime;
    Cliente.FormaPago  := Tabla.FieldByName('FormaPago').AsString ;
    Cliente.DiasVto := Tabla.FieldByName('DiasVto').AsInteger ;
    Cliente.showObs := Tabla.FieldByName('ShowObs').AsBoolean;
    Cliente.Comprobxemail := Tabla.FieldByName('Comprobxemail').AsBoolean;
    Cliente.Contacto1 := Tabla.FieldByName('Contacto1').AsString;
    Cliente.TelCont1 := Tabla.FieldByName('TelCont1').AsString;
    Cliente.Contacto2 := Tabla.FieldByName('Contacto2').AsString;
    Cliente.TelCont2 := Tabla.FieldByName('TelCont2').AsString;
    Cliente.LimiteCredito := Tabla.FieldByName('LimiteCredito').AsFloat;
    Cliente.Observaciones := Tabla.FieldByName('Observaciones').AsString;
    Cliente.activo := Tabla.FieldByName('activo').Asboolean;
  end else
    Cliente.Id := 0;
 Tabla.close;
 Tabla.Destroy;
END;

Procedure ClienteEditar( Cliente : TCliente);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM clientes Where Id='+  IntToStr(Cliente.Id) );
  try
  Tabla.open;
  Tabla.Edit;
    Tabla.FieldByName('Id').AsInteger :=  Cliente.Id;
    Tabla.FieldByName('Nombre').AsString := Cliente.Nombre;
    Tabla.FieldByName('Direccion').AsString := Cliente.Direccion;
    Tabla.FieldByName('CodPostal').AsString := Cliente.CodposTal;
    Tabla.FieldByName('Telefono').AsString := Cliente.Telefono;
    Tabla.FieldByName('email').AsString := Cliente.email;
    Tabla.FieldByName('TipoDoc').AsString := Cliente.TipoDoc;
    Tabla.FieldByName('NroDoc').AsString := Cliente.NroDoc;
    Tabla.FieldByName('HabCtaCte').AsBoolean := Cliente.HabCtaCte;
    Tabla.FieldByName('CategImpos').AsString := Cliente.CategImpos;
    Tabla.FieldByName('UltimaVta').AsDateTime := Cliente.UltimaVta;
    Tabla.FieldByName('UltimoPago').AsDateTime := Cliente.UltimaPago;
    Tabla.FieldByName('FormaPago').AsString := Cliente.FormaPago;
    Tabla.FieldByName('DiasVto').AsInteger := Cliente.DiasVto;
    Tabla.FieldByName('ShowObs').AsBoolean := Cliente.showObs;
    Tabla.FieldByName('Comprobxemail').AsBoolean := Cliente.Comprobxemail;
    Tabla.FieldByName('Contacto1').AsString := Cliente.Contacto1;
    Tabla.FieldByName('TelCont1').AsString := Cliente.TelCont1;
    Tabla.FieldByName('Contacto2').AsString := Cliente.Contacto2;
    Tabla.FieldByName('TelCont2').AsString := Cliente.TelCont2;
    Tabla.FieldByName('LimiteCredito').AsFloat := Cliente.LimiteCredito;
    Tabla.FieldByName('Observaciones').AsString := Cliente.Observaciones;
    Tabla.FieldByName('aCTIVO').Asboolean := Cliente.activo;
  Tabla.Post;
  except
  on E : Exception do
    Mensaje('Error editando cliente. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
  end;
  Tabla.close;
  Tabla.free;
end;

Procedure ClienteAgregar( Cliente : TCliente);
var
  Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('INSERT INTO `clientes`(`id`, `Nombre`, `Direccion`, `CodPostal`, `telefono`, `email`, `TipoDoc`, `NroDoc`, `HabCtaCte`, `CategImpos`, ');
  Tabla.SQL.ADD(' `UltimaVta`, `UltimoPago`, `FormaPago`, `DiasVto`, `ShowObs`, `Comprobxemail`, `Contacto1`, `TelCont1`, `Contacto2`, `TelCont2`, `LimiteCredito`, `Observaciones`, `FechaAlta`, `UltimaAct`, `ActivarObs`, `Activo`) ');
  Tabla.SQL.ADD(' VALUES (NULL, :Nombre, :Direccion, :CodPostal, :telefono, :email, :TipoDoc, :NroDoc, :HabCtaCte, :CategImpos, :UltimaVta, :UltimoPago, ');
  Tabla.SQL.ADD(' :FormaPago, :DiasVto, :ShowObs, :Comprobxemail, :Contacto1, :TelCont1, :Contacto2, :TelCont2, :LimiteCredito, :Observaciones, :FechaAlta, :UltimaAct, :ActivarObs, :Activo) ');

//    Tabla.ParamByName('Id').AsInteger :=  Cliente.Id;
    Tabla.ParamByName('Nombre').AsString := Cliente.Nombre;
    Tabla.ParamByName('Direccion').AsString := Cliente.Direccion;
    Tabla.ParamByName('CodPostal').AsString := Cliente.CodposTal;
    Tabla.ParamByName('Telefono').AsString := Cliente.Telefono;
    Tabla.ParamByName('email').AsString := Cliente.email;
    Tabla.ParamByName('TipoDoc').AsString := Cliente.TipoDoc;
    Tabla.ParamByName('NroDoc').AsString := Cliente.NroDoc;
    Tabla.ParamByName('HabCtaCte').AsBoolean := Cliente.HabCtaCte;
    Tabla.ParamByName('CategImpos').AsString := Cliente.CategImpos;


    Tabla.ParamByName('UltimaVta').AsDateTime := now;
    Tabla.ParamByName('UltimoPago').AsDateTime := now;
    Tabla.ParamByName('FechaAlta').AsDateTime := now;
    Tabla.ParamByName('UltimaAct').AsDateTime := now;

    Tabla.ParamByName('FormaPago').AsString := Cliente.FormaPago;
    Tabla.ParamByName('DiasVto').AsInteger := Cliente.DiasVto;
    Tabla.ParamByName('ShowObs').AsBoolean := Cliente.showObs;
    Tabla.ParamByName('Comprobxemail').AsBoolean := Cliente.Comprobxemail;
    Tabla.ParamByName('Contacto1').AsString := Cliente.Contacto1;
    Tabla.ParamByName('TelCont1').AsString := Cliente.TelCont1;
    Tabla.ParamByName('Contacto2').AsString := Cliente.Contacto2;
    Tabla.ParamByName('TelCont2').AsString := Cliente.TelCont2;
    Tabla.ParamByName('LimiteCredito').AsFloat := Cliente.LimiteCredito;
    Tabla.ParamByName('Observaciones').asString := Cliente.Observaciones;
    Tabla.ParamByName('aCTIVO').Asboolean := TRUE;
    Tabla.ParamByName('ActivarObs').Asboolean := FALSE;
    Tabla.ExecSQL;
    Mensaje('Se agregó el cliente a la base de datos', 'Agregar cliente',1);
 except
  on E : Exception do
    Mensaje('Error insertando cliente. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.close;
  Tabla.free;

End;

Function ClienteBorrar( IdCliente : Integer): Boolean;
var
 Tabla : TFDquery;
begin
 try
  Result := False;
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM movimvta Where idCliente='+ IntToStr(IdCliente) );
  Tabla.Open;
  if Tabla.RecordCount > 0 then
    Begin
     Mensaje('El cliente tiene movimientos asociados. Borre primero todos los moviemientos de venta.','Error',3);
     Result := False;
    End else
    Begin
     Tabla.SQL.Clear;
     Tabla.SQL.ADD('DELETE FROM clientes Where Id='+ IntToStr(IdCliente) );
     Tabla.ExecSQL;
     Result := true;
    End;

 except
   on E : Exception do
    Mensaje('Error borrando el cliente. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.Free;
end;




end.

