unit afiputils;

interface
uses
 Graphics,ExtCtrls,math;

Procedure GenerarCodigo(Codigo: String; Imagen : Timage);
Function DigitoVerificador(Numero: string): string;

implementation

uses
  main,ActiveX,  SysUtils, Clientebuscar, UtilsFunc;

function DigitoVerificador(Numero: string): string;
var
  i, par, non, sum : Integer;
begin
  par:= 0;
  non:= 0;
  for i:= 1 to Length(Numero) do
    if i mod 2 = 0 then
      Inc(par, StrToInt(Numero[i]))
    else
      Inc(non, StrToInt(Numero[i]));

  non:= non * 3;
  sum:= non + par;

  for i:= 0 to 9 do
    if (sum + i) mod 10 = 0 then
    begin
      Result:= Numero + IntToStr(i);//Result:= IntToStr(i); (si queres solo el díg.)
      Exit;
    end;
end;

Procedure GenerarCodigo(Codigo: String; Imagen : Timage);
const
  digitos : array['0'..'9'] of string[5]= ('00110', '10001', '01001', '11000',
  '00101', '10100', '01100', '00011', '10010', '01010');
var s : string;
    i, j, x, t : Integer;
begin
  // Gerar o valor para desenhar o código de barras
  // Caracter de início
  s := '0000';
  for i := 1 to length(codigo) div 2 do
    for j := 1 to 5 do
      s := s + Copy(Digitos[codigo[i * 2 - 1]], j, 1) + Copy(Digitos[codigo[i * 2]], j, 1);
  // Caracter de fim
  s := s + '100';
  // Desenhar em um objeto canvas
  // Configurar os parâmetros iniciais
  x := 0;
  // Pintar o fundo do código de branco
  Imagen.Canvas.Brush.Color := clwhite;
  Imagen.Canvas.Pen.Color := clwhite;
  Imagen.Canvas.Rectangle(0,0, 500, 79);
  // Definir as cores da caneta
  Imagen.Canvas.Brush.Color := clBlack;
  Imagen.Canvas.Pen.Color := clBlack;
  // Escrever o código de barras no canvas
  for i := 1 to length(s) do
  begin
    // Definir a espessura da barra
    t := strToInt(s[i]) * 2 + 1;
    // Imprimir apenas barra sim barra não (preto/branco - intercalado);
    if i mod 2 = 1 then
      Imagen.Canvas.Rectangle(x, 0, x + t, 79);
    // Passar para a próxima barra
    x := x + t;
  end;
end;


end.
