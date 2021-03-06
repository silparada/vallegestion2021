unit main_procesos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPanels,
  Vcl.ExtCtrls;

type
  TFmMainProcesos = class(TForm)
    Button1: TButton;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    Card3: TCard;
    StackPanel1: TStackPanel;
    Bc_CtaCte: TButton;
    BC_Comprobvta: TButton;
    Button3: TButton;
    Bc_RepCodBarras: TButton;
    procedure BC_ComprobvtaClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Bc_RepCodBarrasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMainProcesos: TFmMainProcesos;



implementation
{$R *.dfm}
uses
  main,actPrecios,ImportarExcel,ActPreciosExcel;

procedure TFmMainProcesos.BC_ComprobvtaClick(Sender: TObject);
begin
  FmImportExcel := TFmImportExcel.create(Nil);
  FmImportExcel.Parent := Card1;
  CardPanel1.ActiveCard := card1;
end;

procedure TFmMainProcesos.Bc_RepCodBarrasClick(Sender: TObject);
begin
   FmActPreciosExcel := TFmActPreciosExcel.create(Nil);
  FmActPreciosExcel.Parent := Card3;
  CardPanel1.ActiveCard := card3;
end;

procedure TFmMainProcesos.Button3Click(Sender: TObject);
begin
  FmActPrecios := TFmActPrecios.create(Nil);
  FmActPrecios.Parent := Card2;
  CardPanel1.ActiveCard := card2;
end;

end.
