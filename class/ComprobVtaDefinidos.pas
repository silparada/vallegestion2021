unit ComprobVtaDefinidos;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client
 ;

Type
  TComprobDef = class(Tobject)
    Id : String[20];
    PtoVta : string[20];
    TipoComprob : string[20];
    TipoComprobDes : string[80];
    TipoNumer : string[20];
    NroActual : string[20];
    Formato_impres : string[30];
    Formato_pdf : string[30];
    Impresora : string[60];
  end;


Procedure ComprobDef_LeerListado(Lista : TStringList );
Procedure ComprobDef_UpdateDb( ComprobDef : TComprobDef );
Procedure ComprobDef_DeleteDb( Id : String);
Procedure ComprobDef_InsertDb( ComprobDef : TComprobDef );

Procedure ReadDb_FormatoImpresion(PtoVta, TipoComprob:string; var Formato_Impres,Formato_Pdf,impresora:String);

Procedure GuardarNroComp( PtoVta, IdTipoComp, numero : String);

Implementation
uses
 main,UtilsFunc,importsdll;
PRocedure ComprobDef_LeerListado(Lista : TStringList );
var
  Tabla : TFDquery;
  ComprobDef : TComprobDef;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM comprob_vta_definidos order by Pto_Vta,Tipo_comprob ');
 Tabla.open;

 while not Tabla.EOF do
  begin
    ComprobDef := TComprobDef.create ;
    ComprobDef.Id := Tabla.FieldByName('id').AsString ;
    ComprobDef.PtoVta := Tabla.FieldByName('pto_vta').AsString ;
    ComprobDef.TipoComprob := Tabla.FieldByName('Tipo_comprob').AsString ;
    ComprobDef.TipoNumer := Tabla.FieldByName('Tipo_Numeracion').AsString ;
    ComprobDef.NroActual := Tabla.FieldByName('nro_actual').AsString ;
    ComprobDef.Formato_impres := Tabla.FieldByName('formato_impres').AsString ;
    ComprobDef.Formato_pdf := Tabla.FieldByName('formato_pdf').AsString ;
    ComprobDef.Impresora := Tabla.FieldByName('impresora').AsString ;
    Lista.AddObject(Tabla.FieldByName('id').AsString, ComprobDef);
   Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
end;

Procedure ComprobDef_UpdateDb( ComprobDef : TComprobDef );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Update comprob_vta_definidos Set pto_vta='+ QuotedStr(ComprobDef.PtoVta) );
   Tabla.SQL.ADD(', tipo_comprob='+ QuotedStr(ComprobDef.TipoComprob) );
   Tabla.SQL.ADD(', tipo_numeracion='+ QuotedStr(ComprobDef.TipoNumer) );
   Tabla.SQL.ADD(', nro_actual='+ ComprobDef.NroActual );
   Tabla.SQL.ADD(', formato_impres='+ QuotedStr(ComprobDef.Formato_impres) );
   Tabla.SQL.ADD(', formato_pdf='+ QuotedStr(ComprobDef.Formato_pdf) );
   Tabla.SQL.ADD(', impresora='+ QuotedStr(ComprobDef.Impresora) );

   Tabla.SQL.ADD(' Where id='+ ComprobDef.Id );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error actualizando Comprobante definido. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;
Procedure ComprobDef_DeleteDb( Id : String);
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('DELETE FROM comprob_vta_definidos Where id='+ Id );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error borrando Comprobante definido. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;
Procedure ComprobDef_InsertDb( ComprobDef : TComprobDef );
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
   Tabla.SQL.ADD('Insert into  comprob_vta_definidos(pto_vta,tipo_comprob,tipo_numeracion, nro_actual,formato_impres,formato_pdf,impresora) values( ' );
   Tabla.SQL.ADD( QuotedStr(ComprobDef.PtoVta) +',');
   Tabla.SQL.ADD( QuotedStr(ComprobDef.TipoComprob) +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobDef.TipoNumer) +',' );
   Tabla.SQL.ADD( ComprobDef.NroActual +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobDef.Formato_impres) +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobDef.Formato_pdf) +',' );
   Tabla.SQL.ADD( QuotedStr(ComprobDef.Impresora) +')' );
   Tabla.ExecSQL;
 except
   on E : Exception do
    Mensaje('Error insertando Comprobante Definido. Clase = '+E.ClassName +' Error mensaje = '+E.Message ,'Error',2 );
 end;
  Tabla.Free;
end;

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

Procedure GuardarNroComp( PtoVta, IdTipoComp, numero : String);
var
  Tabla : TFDquery;
  newNro : LongInt;
begin
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 newNro := StrToInt(Numero);
 Inc(NewNro);
 Numero := IntToStr(NewNro);

 Tabla.SQL.add('update comprob_vta_definidos set nro_actual='+ QuotedStr(numero) +' where tipo_comprob='+ QuotedStr(IdTipoComp) + ' and pto_vta=' + QuotedStr(PtoVta) );
 Tabla.ExecSQL;
 Tabla.close;
 Tabla.Destroy;
end;



end.

