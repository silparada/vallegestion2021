
{ UNIDAD CLIENTES:
LEE A TRAVES DE UN TSTRINGLIST la tabla Articulos (este procedimiento esta en ora unidad donde solo se accede a los datos)
Luego se carga el ListView en forma virtual, es decir por demanda, sino tarda mucho.
Cuando se ordena haceindo clik en las columnas del Listview, no se ordena el propio Listview, ya que el procedimiento
"custonSort" no funciona en modo virtual. En cambio se ordena el StrinList que queda cargado con los mismos datos
hasta que se lea nuevamente la DB.
Hay un CostomShor para cada columna, porque son campos de distintos tipo (String , numeros, fechas , etc) y se deben
comparar de distinta forma }

unit FormArchivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Datasnap.Provider, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.WinXCtrls, Vcl.WinXPickers, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;


type
  TFmArchivos = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    TB_add: TToolButton;
    TB_edit: TToolButton;
    TB_Delete: TToolButton;
    ListView1: TListView;
    TB_Exit: TToolButton;
    Panel2: TPanel;
    Ed_busqueda: TEdit;
    Pn_EditAdd: TPanel;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    TS_SoloActivos: TToggleSwitch;
    StatusBar1: TStatusBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Pn_Imprimir: TPanel;
    ADODataSet1: TADODataSet;
    frxReport1: TfrxReport;
    DS_Clientes: TfrxDBDataset;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_ExitClick(Sender: TObject);
    procedure Ed_busquedaChange(Sender: TObject);
    procedure d3_ListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
  end;

var
  FmArchivos: TFmArchivos;

implementation
{$R *.dfm}

uses main, ValleTypes, libreria, accessdb_main,AccessDb_Archivos,EAN13Util, rp_utils,
 System.Threading, JSON, system.net.httpclient,  clientesCtaCte;

var
 // BusqIndiceDesde : integer;
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmArchivos.Bloqueo;
begin
  //FmClientes
  BorderStyle := bsSingle;
  bm := GetFormImage;
  FadeBitmap(bm);
  pn := TPanel.Create(nil);
  img := TImage.Create(nil);
  img.Parent := pn;
     pn.BoundsRect := ClientRect;
     pn.BevelOuter := bvNone;
     img.Align := alClient;
     img.Picture.Bitmap.Assign(bm);
     pn.Parent := Self;
end;
procedure TFmArchivos.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmArchivos.ApplyFilter(const S: string);
var
  I: Integer;
begin
  ListView1.Items.BeginUpdate;
  try
    ListView1.Clear;
    ListaActiva.Clear;
    //SHOWMESSAGE('OKA');
    for I := 0 to ListaCompleta.Count - 1 do
      if (S = '') or (Pos(UpperCase(S), UpperCase(ListaCompleta[i]) )  <> 0 ) then
        ListaActiva.AddObject(ListaCompleta[I], ListaCompleta.Objects[i] );
    ListView1.Items.Count := ListaActiva.Count;
  finally
    ListView1.Items.EndUpdate;
  end;
  StatusBar1.Panels[0].Text :=  'Registros: '+IntToStr(ListView1.Items.Count);
end;


procedure TFmArchivos.d3_ListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Odd(Item.Index) then
    // odd list items have green background
    Sender.Canvas.Brush.Color := clsilver
  else
    // even list items have window colour background
    Sender.Canvas.Brush.Color := clWindow;
  DefaultDraw := true;
end;

procedure TFmArchivos.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmArchivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmArchivos.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.

