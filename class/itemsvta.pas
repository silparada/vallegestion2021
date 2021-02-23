unit itemsvta;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;


Type
   TItemFact = class(TObject)
   IdItem : String;
   Codprov : string;
   Descripcion : string[120];
   Precio : Double;
   Cantidad : Double;
   Descuento :  Double;
   TasaIva : String[10];
   importe : Double;
  end;


Implementation
uses
 main,UtilsFunc,importsdll;



end.

