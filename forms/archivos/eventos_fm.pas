
unit eventos_fm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Datasnap.Provider, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.WinXCtrls, Vcl.WinXPickers, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;


type
  TFmEventos = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    ListView1: TListView;
    TB_Exit: TToolButton;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    ToolButton2: TToolButton;
    Pn_Imprimir: TPanel;
    frxReport1: TfrxReport;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    Ed_Fecha: TDateTimePicker;
    Ed_busqueda: TEdit;
    StringDS: TfrxUserDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_readdbClick(Sender: TObject);
    procedure TB_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure Ed_busquedaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure d3_ListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure BC_AceptarPrintClick(Sender: TObject);
    procedure BC_CancelarPrintClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure StringDSGetValue(const VarName: string; var Value: Variant);

  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
  end;

var
  FmEventos: TFmEventos;

implementation
{$R *.dfm}

uses eventos, main, UtilsFunc, rp_utils,importsdll ;

var
 // BusqIndiceDesde : integer;
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmEventos.Bloqueo;
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
procedure TFmEventos.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmEventos.ApplyFilter(const S: string);
var
  I: Integer;
begin
  ListView1.Items.BeginUpdate;
  try
    ListView1.Clear;
    ListaActiva.Clear;
    //SHOWMESSAGE('OKA');
    for I := 0 to ListaCompleta.Count - 1 do
      if (S = '') or (Pos(UpperCase(S), UpperCase( TEvento(ListaCompleta.Objects[i]).Descripcion  ) )  <> 0 ) then
        ListaActiva.AddObject(ListaCompleta[I], ListaCompleta.Objects[i] );
    ListView1.Items.Count := ListaActiva.Count;
  finally
    ListView1.Items.EndUpdate;
  end;
  StatusBar1.Panels[0].Text :=  'Registros: '+IntToStr(ListView1.Items.Count);
end;


procedure TFmEventos.BC_CancelarPrintClick(Sender: TObject);
begin
 desbloqueo;
 Pn_Imprimir.Visible := false;
end;

procedure TFmEventos.BC_AceptarPrintClick(Sender: TObject);
begin

  StringDS.RangeEnd := reCount;
  StringDS.RangeEndCount := ListView1.Items.Count;


  SetUpReporte(frxReport1,'Eventos');
  frxReport1.ShowReport;

  Desbloqueo;
  Pn_imprimir.Visible := false;
end;

procedure TFmEventos.d3_ListViewCustomDrawItem(Sender: TCustomListView;
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

procedure TFmEventos.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmEventos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmEventos.FormCreate(Sender: TObject);
begin
 Ed_Fecha.Date := now;
 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;


 TB_readdb.Click;
end;


procedure TFmEventos.FormDestroy(Sender: TObject);
begin
  ListaCompleta.Free;
  ListaActiva.Free;
end;



procedure TFmEventos.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
    Caption :=  IntToStr(TEvento(ListaActiva.objects[Item.Index]).id);
    SubItems.Add( FormatDateTime( 'dd-mm-yyyy  hh:mm',  TEvento(ListaActiva.objects[Item.Index]).fecha) );
    SubItems.Add( TEvento(ListaActiva.objects[Item.Index]).idUsuario );
    SubItems.Add( TEvento(ListaActiva.objects[Item.Index]).descripcion );
   //SubItems.Add( TUsuario(ListaActiva.objects[Item.Index]).observaciones);
   end;
end;

procedure TFmEventos.StringDSGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'IdEvento') = 0 then
    Value := ListView1.Items[StringDS.RecNo].Caption;
   if CompareText(VarName, 'Fecha') = 0 then
    Value := ListView1.Items[StringDS.RecNo].SubItems[0];
   if CompareText(VarName, 'IdUsuario') = 0 then
    Value := ListView1.Items[StringDS.RecNo].SubItems[1];
   if CompareText(VarName, 'Descripcion') = 0 then
    Value := ListView1.Items[StringDS.RecNo].SubItems[2];

end;

procedure TFmEventos.TB_readdbClick(Sender: TObject);
begin
 EventosLeerListado(ListaCompleta, Ed_Fecha.Date);
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);
 if ListView1.Items.Count > 0  then
   ListView1.ItemIndex := 0;

end;

procedure TFmEventos.ToolButton2Click(Sender: TObject);
begin
   Bloqueo;
   Pn_Imprimir.Visible := true;
   Pn_Imprimir.BringToFront;
end;

procedure TFmEventos.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.

