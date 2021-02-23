﻿unit ajustes;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;

Type
  TAjuste = class(Tobject)
    NombreET : string;
    DbPath  : string;
    AccesoAct : boolean;
    BAseDatos : String;
    Servidor : string;
    Usuario : String;
    Password : String;

    EmpNombre :string;
    EmpEmail : string;
    LogoPath : string;
    //logo : tPicture;
    EmpDatos1 : string;
    EmpDatos2 : string;
    EmpCUIT : string;

    AdvertenciaStock  : boolean;
    VendedorId : string;
    VendedorNombre : string;
    PtoVtaDefecto : string;

    SoftImpFiscalPath : string;
    SoftFactElectPath : String;
    SoftPadronAfip : String;
    PuertoImpFiscal : string;

    ImpresPorDefecto : integer;
    CarpExportacion : String;
    CarpReportes : String;

    Emailnombre : string;
    EmailAdress : string;
    EmailPortSMTP : Integer;
    EmailUser : string;
    EmailPass: string;
    EmailHostSMTP : string;
//  EmailCarpAdj : string;       // uso para todo CarpExportacion

    ToolMainB1Comprob : string;
    ToolMainB1Titulo : string;
    ToolMainB2Comprob : string;
    ToolMainB2Titulo : string;
    ToolMainB3Comprob : string;
    ToolMainB3Titulo : string;
    ToolMainB4Comprob : string;
    ToolMainB4Titulo : string;

    AccRap1Texto : string;
    AccRap2Texto : string;
    AccRap3Texto : string;
    AccRap1Link : string;
    AccRap2Link: string;
    AccRap3Link : string;
    EstiloInterfaz : String;

  end;


 procedure AjustesLeerIni( Ajustes : TAjuste  );
 procedure AjustesGrabarIni( Ajustes : TAjuste  );
 procedure readlicencia(Ajustes : TAjuste );
 function UltimoID( TAbla: string ): Longint;


Implementation
uses
 main,UtilsFunc,inifiles;

procedure readlicencia(Ajustes : TAjuste );
var
  i:integer;
  StringDec : TStringList;
  StreamDec : TMemoryStream;
begin
  StringDec := TStringList.create;
  StreamDec := TMemoryStream.create;
//  DecryptFile(ExtractFilePath(Application.ExeName) + 'bindcompdbx.dll', StreamDec ,4512);

 //TextoDec.SaveToFile( ExtractFilePath(Application.ExeName) + 'AAADEco.txt' );

  StreamDec.Position := 0;
  StringDec.LoadFromStream(StreamDec);

   for i:=0 to StringDec.Count-1 do
    Begin

     If Pos('Dname', StringDec[i]) > 0 then
       Ajustes.EmpNombre :=  Copy(StringDec[i],7, Length(StringDec[i]) ) ;
     If Pos('Demail', StringDec[i]) > 0 then
       Ajustes.EmpEmail :=  Copy(StringDec[i],8 , Length(StringDec[i]) ) ;
     End;
  StringDec.Free;
  StreamDec.Free;
end;

Function UltimoID( TAbla: string ): Longint;
var
 UltimoID : LongInt;
 Table : TFDquery;
Begin
  Table := TFDquery.Create(Application);
  Table.Connection := FmMain.FDConnection1;
  Table.SQL.Clear;
  Table.SQL.ADD('SELECT Max(id) AS ultimo FROM '+ tabla +' WHERE 1' );
  Table.OPEN;

  Result := Table.FieldByName('ultimo').AsInteger;

  Table.close;
  Table.Free;

End;

procedure AjustesGrabarIni( Ajustes : TAjuste  );
var
  ArchivoIni : TIniFile;
Begin
  ArchivoIni := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'vallegestion.ini');

 //Conexion
   ArchivoIni.WriteString('General','NombreET',Ajustes.NombreET);

   IF Ajustes.AccesoAct Then
     ArchivoIni.WriteBool('General','AccesoAct',True)
   else ArchivoIni.WriteBool('General','AccesoAct',false);


   ArchivoIni.WriteString('DB','Servidor', Ajustes.Servidor );
   ArchivoIni.WriteString('DB','BaseDatos',Ajustes.BaseDatos);
   ArchivoIni.WriteString('DB','Usuario',Ajustes.Usuario);
   ArchivoIni.WriteString('DB','passWord', Ajustes.password );


   ArchivoIni.WriteString('General','DBPath', Ajustes.DbPath); // para SqlLite
 //Empresa
   ArchivoIni.WriteString('Empresa','Nombre', Ajustes.EmpNombre);
   ArchivoIni.WriteString('Empresa','Email', Ajustes.EmpEmail);
   ArchivoIni.WriteString('Empresa','LogoPath', Ajustes.LogoPath);
   ArchivoIni.WriteString('Empresa','Datos1', Ajustes.EmpDatos1);
   ArchivoIni.WriteString('Empresa','Datos2',Ajustes.EmpDatos2);
   ArchivoIni.WriteString('Empresa','CUIT', Ajustes.EmpCUIT);

 //Facturaci�n
  ArchivoIni.WriteBool('Facturacion','AdvertenciaStock',Ajustes.AdvertenciaStock );

  ArchivoIni.WriteString('Facturacion','VendedorId', Ajustes.VendedorId  );
  ArchivoIni.WriteString('Facturacion','VendedorNombre', Ajustes.VendedorNombre );
  ArchivoIni.WriteString('Facturacion','PtoVtaDefecto', Ajustes.PtoVtaDefecto);

 // fiscal
  ArchivoIni.WriteString('Fiscal','SoftImpFiscalPath', Ajustes.SoftImpFiscalPath );
  ArchivoIni.WriteString('Fiscal','SoftFactElectPath', Ajustes.SoftFactElectPath );
  ArchivoIni.WriteString('Fiscal','SoftPadronAfip', Ajustes.SoftPadronAfip );
  ArchivoIni.WriteString('Fiscal','PuertoImpFiscal', Ajustes.PuertoImpFiscal );

 //impresion
   ArchivoIni.WriteInteger('Impresion','ImpresPorDefecto', Ajustes.ImpresPorDefecto);
   ArchivoIni.WriteString('Impresion','CarpExportacion', Ajustes.CarpExportacion);
   ArchivoIni.WriteString('Impresion','CarpReportes', Ajustes.CarpReportes);

 // Email
  ArchivoIni.WriteString('email','EmailAdress', Ajustes.EmailAdress );
  ArchivoIni.WriteString('email','NOMBRE', Ajustes.Emailnombre );
  ArchivoIni.WriteString('email','HostSMtp',Ajustes.EmailHostSMTP);
  ArchivoIni.WriteInteger('email','PortSMTP', Ajustes.EmailPortSMTP);
  ArchivoIni.WriteString('email','User', Ajustes.EmailUser);
  ArchivoIni.WriteString('email','Password',Ajustes.EmailPass);
  //ArchivoIni.WriteString('email','CarpTempAdjuntos', Ed_CarpTempAdjuntos.text);

  //OPC VISUALES

   ArchivoIni.WriteString('Opc. Visuales','AccesoRap1Link', Ajustes.AccRap1Link);
   ArchivoIni.WriteString('Opc. Visuales','AccesoRap2Link', Ajustes.AccRap2Link);
   ArchivoIni.WriteString('Opc. Visuales','AccesoRap3Link', Ajustes.AccRap3Link);

   ArchivoIni.WriteString('Opc. Visuales','AccesoRap1Texto', Ajustes.AccRap1Texto);
   ArchivoIni.WriteString('Opc. Visuales','AccesoRap2Texto', Ajustes.AccRap2Texto);
   ArchivoIni.WriteString('Opc. Visuales','AccesoRap3Texto', Ajustes.AccRap3Texto);


ArchivoIni.Free;


end;

procedure AjustesLeerIni( Ajustes : TAjuste  );
var
  ArchivoIni : TIniFile;
begin
   ArchivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'vallegestion.ini');

  //CONEXION
   Ajustes.NombreET := ArchivoIni.ReadString('General','NombreET','EMPRESA EJEMPLO');
   Ajustes.AccesoAct := ArchivoIni.ReadBool('General','AccesoActivado',TRUE);
   Ajustes.DbPath :=  ArchivoIni.ReadString('General','DbPath',' ');

   Ajustes.Servidor := ArchivoIni.ReadString('DB','Servidor','localhost' );
   Ajustes.BaseDatos := ArchivoIni.ReadString('DB','BaseDatos','vallegestion');
   Ajustes.Usuario := ArchivoIni.ReadString('DB','Usuario','root');
   Ajustes.password := ArchivoIni.ReadString('DB','passWord', '123456' );


  //Empresa
   Ajustes.EmpNombre := ArchivoIni.ReadString('Empresa','Nombre','VALLE SOFT');
   Ajustes.EmpEmail:= ArchivoIni.ReadString('Empresa','email','vallesofttech@gmail.com');
   Ajustes.LogoPath := ArchivoIni.ReadString('Empresa','LogoPath','');
   Ajustes.EmpDatos1 := ArchivoIni.ReadString('Empresa','Datos1','');
   Ajustes.EmpDatos2 := ArchivoIni.ReadString('Empresa','Datos2','');
   Ajustes.EmpCUIT := ArchivoIni.ReadString('Empresa','CUIT','10-121212121-3');

   {
    if fileexists( Ajustes.LogoPath) then
     Begin
      Ajustes.logo.LoadFromFile(Ajustes.LogoPath);
     End;
   }

  //FACTURACION
   Ajustes.AdvertenciaStock := ArchivoIni.ReadBool('Facturacion','AdvertenciaStock',False);

   Ajustes.PtoVtaDefecto :=  ArchivoIni.ReadString('Facturacion','PtoVtaDefecto','0') ;
   Ajustes.VendedorId := ArchivoIni.ReadString('Facturacion','VendedorId','0');

   if Ajustes.VendedorId ='' then
      Ajustes.VendedorId := '0';


  //IMPRESION OTROS COMPROBANTES
   Ajustes.ImpresPorDefecto := ArchivoIni.ReadInteger('Impresion','ImpresPorDefecto',0);
   Ajustes.CarpExportacion := ArchivoIni.ReadString('Impresion','CarpExportacion','c:');
   Ajustes.CarpReportes := ArchivoIni.ReadString('Impresion','CarpReportes','');

  // FISCAL
   Ajustes.SoftImpFiscalPath := ArchivoIni.ReadString('Fiscal','SoftImpFiscalPath','');
   Ajustes.SoftFactElectPath := ArchivoIni.ReadString('Fiscal','SoftFactElectPath','');
   Ajustes.PuertoImpFiscal := ArchivoIni.ReadString('Fiscal','PuertoImpFiscal','1');
   Ajustes.SoftPadronAfip := ArchivoIni.ReadString('Fiscal','SoftPadronAfip','');

  //email
    Ajustes.EmailAdress := ArchivoIni.ReadString('email','EmailAdress','' );
    Ajustes.Emailnombre := ArchivoIni.ReadString('email','Nombre','' );
    Ajustes.EmailHostSMTP := ArchivoIni.ReadString('email','HostSMtp','');
    Ajustes.EmailPortSMTP := ArchivoIni.ReadInteger('email','PortSMTP',555);
    Ajustes.EmailUser := ArchivoIni.ReadString('email','User','');
    Ajustes.EmailPass := ArchivoIni.ReadString('email','Password','');
  //RecConfig.EmailCarpAdj := ArchivoIni.ReadString('email','CarpTempAdjuntos','');

  //Op VISUALES
   Ajustes.AccRap1link := ArchivoIni.ReadString('Opc. Visuales','AccesoRap1Link','');
   Ajustes.AccRap2link := ArchivoIni.ReadString('Opc. Visuales','AccesoRap2Link','');
   Ajustes.AccRap3link := ArchivoIni.ReadString('Opc. Visuales','AccesoRap3Link','');
   Ajustes.AccRap1Texto := ArchivoIni.ReadString('Opc. Visuales','AccesoRap1Texto','Acceso 1');
   Ajustes.AccRap2Texto := ArchivoIni.ReadString('Opc. Visuales','AccesoRap2Texto','Acceso 2');
   Ajustes.AccRap3Texto := ArchivoIni.ReadString('Opc. Visuales','AccesoRap3Texto','Acceso 3');


   Ajustes.EstiloInterfaz := ArchivoIni.ReadString('Opc. Visuales','EstiloInterfaz','Windows');

 ArchivoIni.Free;
end;


end.


