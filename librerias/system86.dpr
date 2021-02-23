library system86;


Procedure ObtdatosEmpresa(var Nom,dom,Loc,tel,fax,email,pagweb,Cuit,ver: string);
Begin
 Nom := 'Neuquen Fly S.A';
 dom := 'La Rioja 1180';
 Loc := '8300 - Neuquén';
 tel := '0299 - 4431284';
 fax := '0299 - 4431284';
 Cuit := '30-71047192-0';
 email := 'info@neuquenflyshop.com ';
 pagweb := 'www.neuquenflyshop.com ';
 Ver := '3';
 { versiones 1 = reducida
             2 = standar
             3 = full
             5 = demo   }

end;

exports
 ObtdatosEmpresa;

begin
end.
