unit registro_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  ComCtrls, pngimage, ExtCtrls;

type
  TFmRegistro = class(TForm)
    E1: TEdit;
    Label12: TLabel;
    E2: TEdit;
    Label17: TLabel;
    BC_Activar: TBitBtn;
    E6: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Image1: TImage;
    BitBtn2: TBitBtn;
    procedure BC_ActivarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FmRegistro: TFmRegistro;

implementation
uses EncryptIt,registry, Clipbrd, HASHES,UtilsFunc,importsdll;

{$R *.dfm}

procedure TFmRegistro.BC_ActivarClick(Sender: TObject);
var
  F: TextFile;
  Reg : TRegistry  ;
  ca1: string;
begin
{ if not (E6.text =  StrCheckSum('Valle Gesti�n - Versi�n Libre'+E1.TEXT+E2.TEXT)) then
    begin
     Mensaje('El c�digo de Activaci�n no es v�lido','Activaci�n',3);
     exit;
    end;   }
//  Reg := TRegIniFile.Create;
//  Reg.RootKey := HKEY_CLASSES_ROOT;
//  Reg.OpenKey('{AAAAAAAA-4458-410F-BD97-2EC6142542B5}',TRUE);
//  Reg.WriteBool('codeact',true) ;

  AssignFile( F, ExtractFilePath( Application.ExeName ) + 'bindcompdbx.dll' );
  Rewrite( F );
   WriteLn( F, 'fgfdgdfgf drS56URFGUA ALKHDHSA LKAFLKD HFKJHSDF KSDJHF KJSH DKSJDFHK');
   WriteLn( F, 'CODIGO: DFGDG FDGFDGJ6555DF 7768768 HK');
   WriteLn( F, 'Dname:VALLE GESTION');
   WriteLn( F, 'Demail:info@vallegestion.com.ar');
   WriteLn( F, 'Dcode:45463772');
   WriteLn( F, '879gfhf: drS56URFGUA ALKHDHSA LKAFLKD HFKJHSDF KSDJHF KJSH DKSJDFHK');
   WriteLn( F, 'CODryr67 DFGDG FDGFDGJ6555DF 7768768 HK');
   WriteLn( F, '45hfgh GTS576UERA ALKVVHDHSA 78768768 HFKJFFFHSDF KSDJHF KJSH 64654');
   WriteLn( F, 'fvbjhg6 57 ALKVVS3HDHSA LKAFLKD 7687 KSDJHFSDF KJSH 678768');
   WriteLn( F, '867876 GF56 FGHF LKAFLKD FGHGFH KSDJHVVF KJSH 5777');
  CloseFile( F );
  EncryptFile(ExtractFilePath( Application.ExeName) + 'bindcompdbx.dll', ExtractFilePath( Application.ExeName) + 'bindcompdbx.dll', 4512);
  Mensaje('El sistema se ha activado exitosamente !!. Reinicie para visualizar los cambios.','Activaci�n',3);
//  Reg.free;
end;

end.
