unit EAN13Util;

interface
uses
  Windows, SysUtils, Forms, Dialogs, Graphics, StdCtrls, ExtCtrls, Classes, Controls, printers,
    shellapi;
const
  EAN_izqA : array[0..9] of PChar=('0001101','0011001','0010011','0111101','0100011','0110001','0101111','0111011','0110111','0001011');
  EAN_izqB : array[0..9] of PChar=('0100111','0110011','0011011','0100001','0011101','0111001','0000101','0010001','0001001','0010111');
  EAN_dcha : array[0..9] of PChar=('1110010','1100110','1101100','1000010','1011100','1001110','1010000','1000100','1001000','1110100');
  CodificaIzq : array[0..9] of PChar=('AAAAA','ABABB','ABBAB','ABBBA','BAABB','BBAAB','BBBAA','BABAB','BABBA','BBABA');


Function ObtenerCodigoEAN13(Nro:string ; ImgPar: TImage):boolean;
procedure Codifica(num : string);
procedure Dibujar(matrix : string);

var
  Imagen : TImage;
  Numero : string[13];

implementation
uses UtilsFunc,importsdll;

Function ObtenerCodigoEAN13(Nro:string ; ImgPar: TImage):boolean;
begin
   Imagen := TImage.Create(Application);
   Numero := Nro;
   Codifica(Nro);
   ImgPar.Picture :=  Imagen.Picture;
   Imagen.Free;
end;

procedure EANCorrecto(var num : string);
var
  i,N : byte;
  sum : integer;
  flag : byte;
begin
  sum:=0;
  N:=Length(num)-1;
  for i:=1 to N do
  begin
    if (i mod 2)=0 then
    begin
      if N=12 then
        sum:=sum+StrToInt(num[i])*3
      else
        sum:=sum+StrToInt(num[i]);
    end
    else
    begin
      if N=12 then
        sum:=sum+StrToInt(num[i])
      else
        sum:=sum+StrToInt(num[i])*3;
    end;
  end;
  if sum>99 then
    Flag:=10-(sum mod 100)
  else
    Flag:=10-(sum mod 10);
  if Flag=10 then Flag:=0;
  if not(StrToInt(num[N+1])=flag) then
  begin
    Mensaje('El dígito de control no es válido y será cambiado'+#13+' El dígito correcto es '+IntToStr(Flag),'Error Código EAN13',3 ) ;
    num:=copy(num,1,length(num)-1)+IntToStr(Flag);
  end;
end;

procedure Codifica(num : string);
var
  matrix : string;
  i : integer;
begin
  //num:=Edit1.Text;
  matrix:='';
  case Length(num) of
  13: begin
    EANCorrecto(num);
   // Edit1.Text:=num;
    matrix:=matrix+'x0x'; // barra inicio
    matrix:=matrix+EAN_izqA[StrToInt(num[2])];
    for i:=3 to 7 do
      if CodificaIzq[StrToInt(num[1])][i-3]='A' then
        matrix:=matrix+EAN_izqA[StrToInt(num[i])]
      else
        matrix:=matrix+EAN_izqB[StrToInt(num[i])];
    matrix:=matrix+'0x0x0'; // barra central
    matrix:=matrix+EAN_dcha[StrToInt(num[8])];
    matrix:=matrix+EAN_dcha[StrToInt(num[9])];
    matrix:=matrix+EAN_dcha[StrToInt(num[10])];
    matrix:=matrix+EAN_dcha[StrToInt(num[11])];
    matrix:=matrix+EAN_dcha[StrToInt(num[12])];
    matrix:=matrix+EAN_dcha[StrToInt(num[13])];
    matrix:=matrix+'x0x'; // barra final
    Dibujar(Matrix);
  end;
  8: begin
    EANCorrecto(num);
   // Edit1.Text:=num;
    matrix:=matrix+'x0x';
    matrix:=matrix+EAN_izqA[StrToInt(num[1])];
    matrix:=matrix+EAN_izqA[StrToInt(num[2])];
    matrix:=matrix+EAN_izqA[StrToInt(num[3])];
    matrix:=matrix+EAN_izqA[StrToInt(num[4])];
    matrix:=matrix+'0x0x0';
    matrix:=matrix+EAN_dcha[StrToInt(num[5])];
    matrix:=matrix+EAN_dcha[StrToInt(num[6])];
    matrix:=matrix+EAN_dcha[StrToInt(num[7])];
    matrix:=matrix+EAN_dcha[StrToInt(num[8])];
    matrix:=matrix+'x0x';
    Dibujar(Matrix);
  end
  else
    Mensaje('LONGITUD DE CODIGO NO VALIDA', 'Error', 3);
  end;
end;

procedure Dibujar(matrix : string);
var
  i : integer;
begin
  Imagen.Canvas.Brush.Color:=clWhite;
  Imagen.Canvas.FillRect(Rect(0,0,Imagen.Width,Imagen.Height));
  Imagen.Canvas.Pen.Color:=clBlack;
  for i:=1 to Length(Matrix) do
    if matrix[i]='1' then
      Imagen.Canvas.PolyLine([Point(10+i,10),Point(10+i,50)])
    else
      if matrix[i]='x' then
        Imagen.Canvas.PolyLine([Point(10+i,10),Point(10+i,55)]);
      if Length(Numero)=13 then
      begin
        Imagen.Canvas.TextOut(3,50,Numero[1]); Imagen.Canvas.TextOut(17,50,copy(Numero,2,6));
        Imagen.Canvas.TextOut(63,50,copy(Numero,8,6));
      end
      else
      if Length(Numero)=8 then
      begin
        Imagen.Canvas.TextOut(16,50,copy(Numero,1,4));
        Imagen.Canvas.TextOut(48,50,copy(Numero,5,4));
      end;
end;


end.
