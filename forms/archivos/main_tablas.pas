unit main_tablas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPanels,
  Vcl.ExtCtrls;

type
  TFmMainTablas = class(TForm)
    Button1: TButton;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    Card3: TCard;
    StackPanel1: TStackPanel;
    Bc_Ciudades: TButton;
    BC_Vendedores: TButton;
    BC_FormasPAgo: TButton;
    Bc_Usuarios: TButton;
    Card4: TCard;
    procedure BC_VendedoresClick(Sender: TObject);
    procedure BC_FormasPAgoClick(Sender: TObject);
    procedure Bc_UsuariosClick(Sender: TObject);
    procedure Bc_CiudadesClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LiberarCard ( card : TCard);
  public
    { Public declarations }
  end;

var
  FmMainTablas: TFmMainTablas;



implementation
{$R *.dfm}
uses
  main,ciudades_fm,formaspago_fm,usuarios_fm,vendedores_fm;

Procedure TFmMainTablas.LiberarCard ( card : TCard);
var
  i: integer;
begin
  for i:=0 to  Card.ControlCount-1 do
    Card.Controls[i].free;
end;

procedure TFmMainTablas.BC_VendedoresClick(Sender: TObject);
begin
   LiberarCard(Card2);
  FmVendedores := TFmVendedores.create(Nil);
  FmVendedores.Parent := Card2;
  CardPanel1.ActiveCard := card2;
end;

procedure TFmMainTablas.Bc_CiudadesClick(Sender: TObject);
begin
  LiberarCard(Card1);
  FmCiudades := TFmCiudades.create(Nil);
  FmCiudades.Parent := Card1;
  CardPanel1.ActiveCard := card1;
end;

procedure TFmMainTablas.Bc_UsuariosClick(Sender: TObject);
begin
  LiberarCard(Card4);
  FmUsuarios := TFmUsuarios.create(Nil);
  FmUsuarios.Parent := Card4;
  CardPanel1.ActiveCard := card4;
end;

procedure TFmMainTablas.BC_FormasPAgoClick(Sender: TObject);
begin
  LiberarCard(Card3);
  FmFormasPago := TFmFormasPago.create(Nil);
  FmFormasPago.Parent := Card3;
  CardPanel1.ActiveCard := card3;
end;

end.
