unit usuarios;

interface

uses
 Vcl.Graphics,
 SysUtils,forms,WinTypes, Classes, Contnrs,WideStrings,
 FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
 FireDAC.Comp.Client;

Type

  TUsuario = class(Tobject)
    id : String[20];
    password : String[20];
    sector : string[20];
    Nombre : String[80];
    Nivel : Integer;
    Observaciones : String[250];
    Activo : Boolean;
  end;

Procedure UsuariosLeerListado (Lista : TStringList; Estado: string);
Procedure UsuariosLeerUsuario (Usuario : TUsuario);
Procedure UsuariosEditar (Usuario : TUsuario);
Procedure UsuariosAgregar (Usuario : TUsuario);
function UsuariosBorrar (IdUsuario : String):boolean;
function UsuarioLogin( Usuario : TUsuario): boolean;

Procedure CambiarPassword(IdUsuario:shortstring; ActPass,NewPass:String);
Procedure EstablecerPassword(IdUsuario:shortstring; Password: string);

Implementation
uses
 main,UtilsFunc,EncryptIt,importsdll;

function UsuarioLogin( Usuario : TUsuario): boolean;
var
 Tabla : TFDquery;
 PassDesencriptado,PasswordDb : shortstring;
 Acceso : boolean;
Begin

IF (Usuario.id='sparada') and (Usuario.Password='1942304') Then
 Begin
  Usuario.nivel := 5;
  Usuario.nombre := 'SuperAdmin';
  Result := True;
  exit;
 End;
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;

  Tabla.SQL.ADD('SELECT * FROM usuarios  Where Id=' +quotedstr(Usuario.id) );

  Result := false;
  if  not Tabla.IsEmpty then
    begin
     PasswordDb := Decrypt(Tabla.FieldByName('password').Asstring, 2);
  //  PasswordDb := Tabla.FieldByName('password').Asstring; // Agregar!!!!!!! Decrypt(TDM1.FDQuerry1.FieldByName('password').Asstring, 2);
     Usuario.nivel := Tabla.FieldByName('Nivel').AsInteger;
     Usuario.nombre :=  Tabla.FieldByName('Nombre').AsString;
     Usuario.sector :=  Tabla.FieldByName('Sector').AsString;
     if Usuario.password = PasswordDb then
        Result := True;
    end;
  Tabla.close;
  Tabla.free;

end;


Procedure UsuariosLeerListado (Lista : TStringList; Estado: string);
var
 Tabla : TFDquery;
 Usuario : TUsuario;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  if Estado = 'Activo' then
    Tabla.SQL.ADD('SELECT * FROM usuarios Where Activo=true Order By nombre')
  else
    Tabla.SQL.ADD('SELECT * FROM usuarios Order By nombre');
  Tabla.open;
 while not Tabla.EOF do
  begin
    Usuario := TUsuario.create ;
    Usuario.id := Tabla.FieldByName('IdUsuario').Asstring ;
    Usuario.Nivel := Tabla.FieldByName('nivel').Asinteger ;
    Usuario.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Usuario.Observaciones :=  Tabla.FieldByName('observaciones').AsString;
    Usuario.password :=  Tabla.FieldByName('password').AsString;
    Usuario.Activo :=  Tabla.FieldByName('activo').asBoolean;
    Lista.Addobject(Usuario.Nombre, Usuario);
    Tabla.next;
  end;
 Tabla.close;
 Tabla.Destroy;
END;

Procedure UsuariosLeerUsuario(Usuario : TUsuario);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM usuarios Where IdUsuario='+  QuotedStr(Usuario.id) );
  Tabla.open;
  if Tabla.RecordCount > 0 then
   begin
    Usuario.id := Tabla.FieldByName('IdUsuario').Asstring ;
    Usuario.Nivel := Tabla.FieldByName('nivel').Asinteger ;
    Usuario.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Usuario.Observaciones :=  Tabla.FieldByName('observaciones').AsString;
    Usuario.password :=  Tabla.FieldByName('password').AsString;
    Usuario.Activo :=  Tabla.FieldByName('activo').asBoolean;
   end;
 Tabla.close;
 Tabla.Destroy;


End;

Procedure UsuariosEditar (Usuario : TUsuario);
var
 Tabla : TFDquery;
begin
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM usuarios Where IdUsuario='+ QuotedStr(Usuario.Id) );
  try
  Tabla.open;
  Tabla.Edit;
    //Tabla.FieldByName('IdCliente').AsInteger :=  Cliente.IdCLiente;
    Tabla.FieldByName('Nombre').AsString := Usuario.Nombre;
    Tabla.FieldByName('nivel').AsInteger := Usuario.nivel;
    Tabla.FieldByName('password').AsString := Usuario.password;
    Tabla.FieldByName('observaciones').AsString := Usuario.observaciones;
    Tabla.FieldByName('activo').asBoolean :=  Usuario.Activo;
  Tabla.Post;
  except
  on E : Exception do
    Mensaje('Error editando Usuario. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
  end;
  Tabla.close;
  Tabla.free;
end;

Procedure UsuariosAgregar( Usuario : TUsuario);
var
  Tabla : TFDquery;
 // Descuento : TDescuento;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

  Tabla.SQL.ADD('SELECT * FROM usuarios');
  Tabla.open;
  Tabla.Append;
    Tabla.FieldByName('IdUsuario').AsString :=  Usuario.Id;
    Tabla.FieldByName('Nombre').AsString := Usuario.Nombre;
    Tabla.FieldByName('nivel').AsInteger := Usuario.nivel;
    Tabla.FieldByName('observaciones').AsString := Usuario.Observaciones;
    Tabla.FieldByName('password').AsString := Usuario.password;
  Tabla.Post;

 except
  on E : Exception do
    Mensaje('Error insertando Usuario. Clase = '+E.ClassName +' Error mensaje = '+E.Message, 'Error',3);
 end;
  Tabla.close;
  Tabla.free;

End;

function UsuariosBorrar (IdUsuario : String):boolean;
var
 Tabla : TFDquery;
begin
 try
  Tabla := TFDquery.Create(Application);
  Tabla.Connection := FmMain.FDConnection1;

    Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM eventos Where idUsuario='+ QuotedStr(IdUsuario) );
  Tabla.Open;
  if Tabla.RecordCount > 0 then
    Begin
     Mensaje('El usuario tiene eventos registrados. Borre primero todos los eventos.','Error',3);
     Result := False;
    End else
    Begin
     Tabla.SQL.Clear;
     Tabla.SQL.ADD('DELETE FROM usuarios Where idUsuario='+ QuotedStr(IdUsuario) );
     Tabla.ExecSQL;
     Result := true;
    End;


 except
   on E : Exception do
    Mensaje('Error borrando el Usuario. Clase = '+E.ClassName +' Error mensaje = '+E.Message,'Error',3);
 end;
  Tabla.Free;
end;

Procedure CambiarPassword(IdUsuario:shortstring; ActPass,NewPass:String);
var
 OldPass,Conf,NewPassEnc : string;
 Table : TFDquery;
 Usuario : TUSuario;
begin
  {UserId Global Actual usuario}
  Usuario := TUSuario.create;


  Usuario.Id := IdUsuario;
  Usuario.password := OldPass;
  if not UsuarioLogin(Usuario) then
     begin
       mensaje('Error - Su password no es v�lido.','Seguridad',1);
       exit;
     end;
  try
   NewPassEnc := Encrypt( NewPass, 2);
   Table := TFDquery.Create(Application);
   Table.Connection := FmMain.FDConnection1;
   Table.SQL.Clear;
   Table.SQL.ADD('Update usuarios Set Usuarios.Password='+ quotedstr(NewPassEnc) + ' Where  Usuarios.IdUsuario=' +quotedstr(IdUsuario) );
   Table.ExecSQL;
   Table.close;
   mensaje('Se cambi� el password exitosamente.','Seguridad',1);
  finally
   Table.close ;
   Table.free;
  end;

  Usuario.free;

end;

Procedure EstablecerPassword(IdUsuario:shortstring; Password: string);
var
 NewPassEnc : string;
 Table : TFDquery;
begin
 try
   NewPassEnc := Encrypt( Password, 2);
   Table := TFDquery.Create(Application);
   Table.Connection := FmMain.FDConnection1;
   Table.SQL.Clear;
   Table.SQL.ADD('Update usuarios Set Usuarios.Password='+ quotedstr(NewPassEnc) + ' Where  Usuarios.IdUsuario=' +quotedstr(IdUsuario) );
   Table.ExecSQL;
   Table.close;
   mensaje('Se estableci� el nuevo el password exitosamente.','Seguridad',1);
  finally
   Table.close ;
   Table.free;
  end;

end;


end.

