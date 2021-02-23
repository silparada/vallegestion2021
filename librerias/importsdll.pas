unit importsdll;

interface
 uses
 Classes,grids,sysutils, types,WinTypes;

 {SNP003.DLL}
 Function  DialogoBox(Texto,Titulo: string; icon,BotonDefault : word): boolean;
 Procedure Mensaje(Texto,Titulo: string;icon :word);
 Function  InputCaja(Prompt,Titulo: string;NroCar,Letra : word;var Entrada : string): Boolean;
 Function  ChangePass(var OldPass,NewPass,Conf : string;ActualUsr : string): boolean;
 Function  LeerPass(var UserName,Password : shortstring): boolean;
 Procedure AcercaDe;


implementation


 Procedure Mensaje(Texto,Titulo: string;icon :word);external 'dialoglib.DLL';
 Function  DialogoBox(Texto,Titulo: string; icon,BotonDefault : word): boolean; external 'dialoglib.DLL';
 Function  InputCaja(Prompt,Titulo: string;NroCar,Letra : word;var Entrada : string): Boolean; external 'dialoglib.DLL';
 function  ChangePass(var OldPass,NewPass,Conf : string;ActualUsr : string): boolean;external 'dialoglib.DLL';
 Function  LeerPass(var UserName,Password : shortstring): boolean;external 'dialoglib.DLL';
 Procedure AcercaDe;external 'dialoglib.DLL';



end.







