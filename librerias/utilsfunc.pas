unit utilsfunc;

interface
  uses
  Classes,grids,sysutils,WinTypes,Vcl.Graphics,vcl.forms;

// Procedure ObtdatosEmpresa(var Nom,dom,Loc,tel,fax,email,pagweb,Cuit,ver: string);

 function LastMonthDay(Dat: TDateTime): TDateTime;
 function FirstMonthDay(Dat: TDateTime): TDateTime;
 Function MesesCadena(i : integer) : string;
 Function SigFecha ( F1 : TDateTime;Aumento: integer):TDatetime;
 Function SigMes (F1 : TDateTime): TDateTime ;
 Procedure VaciarGrilla(var Grilla : TStringGrid);
 Procedure Solonumeros(var Texto : String);


 Procedure SendMail(direccionemail,Subject,body,adjunto: string );
 FUNCTION emailValido(CONST Value: String): boolean;
 procedure FadeBitmap(ABitmap: TBitmap);

 function ArchivosCarpeta(Carpeta, Mascara: String; IncluirPath, IncluirOcultos: Boolean): tStringList;
 Procedure RunApp( AppPath : String);

implementation
uses
  //configuracion,
  main, IdSSLOpenSSLHeaders, // IdSSLOpenSSLHeaders agregado jul 18
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP,dialogs,  IdSSL, IdSSLOpenSSL, IdServerIOHandler,
  IdBaseComponent, IdMessage, IdComponent,IdAttachment,IdAttachmentFile, IdEMailAddress,
  WinProcs, Messages, Controls, ShellApi, ComObj , mapi, IdText;


// Procedure ObtdatosEmpresa(var Nom,dom,Loc,tel,fax,email,pagweb,Cuit,ver: string);external 'system86.dll';

function ArchivosCarpeta(Carpeta, Mascara: String; IncluirPath, IncluirOcultos: Boolean): tStringList;
var DirInfo: TSearchRec;
    I, TiposDeArchivo: Integer;
begin
  Result := tStringList.Create;
  TiposDeArchivo := faAnyfile -faSysFile -faDirectory;
  if not IncluirOcultos then TiposDeArchivo := TiposDeArchivo -faHidden;
  I := FindFirst(IncludeTrailingPathDelimiter(Carpeta) + Mascara, TiposDeArchivo, DirInfo);
  while I = 0 do
  begin
    if (DirInfo.Name <> '.') and (DirInfo.Name <> '..') then
    begin
      if IncluirPath then Result.Add(IncludeTrailingPathDelimiter(Carpeta) + DirInfo.Name)
      else Result.Add(DirInfo.Name);
    end;
    I := FindNext(DirInfo);
  end;
 // FindClose(DirInfo);
end;

Procedure SendMail(direccionemail,Subject,body,adjunto: string );
var
  // vari�veis e objetos necess�rios para o envio
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
 // sAnexo: string;
  Attachment: TIdAttachment;
begin
  // instancia��o dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create;
  IdSMTP := TIdSMTP.Create;
  IdMessage := TIdMessage.Create;

  try

    screen.Cursor := crHourGlass;
    // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configura��o do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := AjusteObj.EmailPortSMTP;
    IdSMTP.Host := AjusteObj.EmailHostSMTP;
    IdSMTP.Username := AjusteObj.EmailUser;
    IdSMTP.Password := AjusteObj.EmailPass;

    // Configura��o da mensagem (TIdMessage)
    IdMessage.From.Address := AjusteObj.emailAdress;
    IdMessage.From.Name := AjusteObj.Emailnombre;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := direccionemail;
    IdMessage.Subject := Subject;
    IdMessage.Encoding := meMIME;

    // Configura��o do corpo do email (TIdText)
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add( body);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    if Adjunto <> '' then
      Attachment := TIdAttachmentFile.Create(IdMessage.MessageParts, AjusteObj.CarpExportacion +'\'+ adjunto);

    // Conex�o e autentica��o
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Error de autenticaci�n: ' +
          E.Message, mtWarning, [mbOK], 0);
        Exit;
        screen.Cursor := crDefault;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Email enviado exitosamente!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Error envi�ndo el email: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    // libera��o dos objetos da mem�ria
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
    //if adjunto <> '' then
    //  FreeAndNil(Attachment);
    screen.Cursor := crDefault;
  end;
 FmMain.StatusBarMain.Panels[0].Text := 'Email enviado !!' ;

end;

procedure FadeBitmap(ABitmap: TBitmap);
type
  PRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[word] of TRGBTriple;
var
  SL: PRGBTripleArray;
  y: Integer;
  x: Integer;
begin
  ABitmap.PixelFormat := pf24bit;

  for y := 0 to ABitmap.Height - 1 do
  begin
    SL := ABitmap.ScanLine[y];
    for x := 0 to ABitmap.Width - 1 do
      with SL[x] do
        begin
          rgbtRed := rgbtRed div 2;
          rgbtGreen := rgbtGreen div 2;
          rgbtBlue := rgbtBlue div 2;
        end;
  end;
end;

Procedure Solonumeros(var Texto : String);
var
  Aux: String;i: integer;
Begin
  for I := 0 to Length(Texto) do
   if Texto[i] in ['0'..'9'] then
     Aux := Aux + Texto[i];
  TExto := Aux;
End;

function FirstMonthDay(Dat: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
  fecha: TDateTime;
begin
  DecodeDate(Dat, Year, Month, Day);
  Day := 1;                 //primer dia
  fecha := EncodeDate(Year, Month, Day);
  result := Fecha;
end;

function LastMonthDay(Dat: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
  fecha: TDateTime;
begin
  fecha := IncMonth(Dat,1); //mes siguiente
  DecodeDate(fecha, Year, Month, Day);
  Day := 1;                 //primer dia
  fecha := EncodeDate(Year, Month, Day) - 1;
  result := Fecha;
end;

FUNCTION SigMes (F1 : TDateTime): TDateTime ;
var
    Y1,M1,D1 : Word;
begin
   DecodeDate(F1,Y1,M1,D1);
   M1 := M1 + 1;
   if M1 > 12 then {SE PASA DE ANIO}
    begin
      M1 := 1;
      Y1 := Y1 + 1;
    end;
   try {ini bloque de protecci�n}
     Result := EncodeDate(Y1,M1,D1);
   except
     D1 := 28;
     Result := EncodeDate(Y1,M1,D1)
   end; {fin bloque de protecci�n}
end;


FUNCTION SigFecha (F1 : TDateTime;Aumento: integer): TDateTime ;
var
    Y1,M1,D1 : Word;
begin
   DecodeDate(F1,Y1,M1,D1);
   Inc(M1,Aumento);
   if M1 > 12 then {SE PASA DE ANIO}
    begin
      M1 := 1;
      Inc(Y1);
    end;
   try {ini bloque de protecci�n}
     Result := EncodeDate(Y1,M1,D1);
     if DayOfWeek(Result) = 1 then {CAE DOMINGO}
       begin
        DecodeDate(Result,Y1,M1,D1);
        Inc(D1);
        Result := EncodeDate(Y1,M1,D1)
       end;
   except
       Inc(M1);
       D1 := 1;
       if M1 > 12 then {SE PASA DE ANIO}
        begin
         M1 := 1;
         Inc(Y1);
        end;
       Result := EncodeDate(Y1,M1,D1)
   end; {fin bloque de protecci�n}
end;
function MesesCadena(i : integer) : string;
 begin
   case i of
      1 : result := 'Enero';
      2 : result := 'Febrero';
      3 : result := 'Marzo';
      4 : result := 'Abril';
      5 : result := 'Mayo';
      6 : result := 'Junio';
      7 : result := 'Julio';
      8 : result := 'Agosto';
      9 : result := 'Septiembre';
      10 : result := 'Octubre';
      11 : result := 'Noviembre';
      12 : result := 'Diciembre';
    else
       result := 'Error';
 end;
end;
Procedure VaciarGrilla(var Grilla : TStringGrid);
var
  Col,Row : Integer;
Begin
  for Col := 1 to Grilla.RowCount-1 DO
   For Row := 1 To Grilla.ColCount-1 do
      Grilla.Cells[row,col] := '';
End;

FUNCTION emailValido(CONST Value: String): boolean;
  FUNCTION CheckAllowed(CONST s: String): boolean;
  VAR i: Integer;
  BEGIN
  Result:= False;
  FOR i:= 1 TO Length(s) DO // illegal char in s -> no valid address
  IF NOT (s[i] IN ['a'..'z','A'..'Z','0'..'9','_','-','.']) THEN Exit;
  Result:= true;
  END;
VAR
  i,len: Integer;
  namePart, serverPart: String;
BEGIN // of IsValidEmail
  Result:= False;
  i:= Pos('@', Value);
  IF (i=0) OR (Pos('..',Value) > 0) THEN Exit;
  namePart:= Copy(Value, 1, i - 1);
  serverPart:= Copy(Value,i+1,Length(Value));
  len:=Length(serverPart);
  // must have dot and at least 3 places from end, 2 places from begin
  IF (len<4) OR
     (Pos('.',serverPart)=0) OR
     (serverPart[1]='.') OR
     (serverPart[len]='.') OR
     (serverPart[len-1]='.') THEN Exit;
  Result:= CheckAllowed(namePart) AND CheckAllowed(serverPart);
END;

Procedure RunApp( AppPath : String);
const
 Flags = SWP_SHOWWINDOW; //	SWP_NOMOVE OR SWP_NOSIZE;
var
  Info : TStartUpInfo;
  ProcInfo : TProcessInformation;
  mango: HWnd;
begin

 if AppPath ='' then
    exit;
  Mango:=FindWindow(nil,'Impresi�n');
  if mango=0 then
   Begin
    FillChar(info,SizeOf(Info),0);
    Info.Cb := SizeOf(Info);
    Info.dwFlags := STARTF_USESHOWWINDOW;
    Info.wShowWindow := SW_SHOWNORMAL;
    if not CREATEProcess(Pchar(AppPath), nil,nil,nil,False,0,nil,nil, Info, ProcInfo) then
       raise Exception.create('Error iniciando controlador de impresi�n fiscal. verifique la rura de acceso.');
   End
    else SetForeGroundWindow(Mango);
end;

end.







