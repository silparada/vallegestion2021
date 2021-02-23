
unit ComprobVtaEstados_fm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.WinXCtrls, Vcl.WinXPickers, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, frxClass, frxDBSet,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Vcl.ActnColorMaps, Vcl.ActnMan, Vcl.ColorGrd;


type
  TFmCompVtaEstados = class(TForm)
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
    Ed_IdEstado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Ed_Descripcion: TEdit;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    StatusBar1: TStatusBar;
    TB_Print: TToolButton;
    Pn_Imprimir: TPanel;
    frxReport1: TfrxReport;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    CV_PrintSoloActivos: TCheckBox;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    ColorDialog1: TColorDialog;
    Shape1: TShape;
    Ed_Color: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_DeleteClick(Sender: TObject);
    procedure TB_readdbClick(Sender: TObject);
    procedure TB_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure Ed_busquedaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure d3_ListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure TB_editClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);
    procedure TB_addClick(Sender: TObject);
    procedure BC_AceptarPrintClick(Sender: TObject);
    procedure BC_CancelarPrintClick(Sender: TObject);
    procedure TB_PrintClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
  end;

var
  FmCompVtaEstados: TFmCompVtaEstados;

implementation
{$R *.dfm}

uses
   ComprobVtaEstados ,  main,
   utilsfunc, rp_utils,importsdll;

var
 // BusqIndiceDesde : integer;
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmCompVtaEstados.Bloqueo;
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
procedure TFmCompVtaEstados.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmCompVtaEstados.ApplyFilter(const S: string);
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


procedure TFmCompVtaEstados.Bc_AceptarClick(Sender: TObject);
var
 CompEstado : TComprobVtaEstados ;
begin
  CompEstado := TComprobVtaEstados.create ;
  CompEstado.Descripcion := Ed_Descripcion.Text;
  CompEstado.color :=  Ed_Color.text;
  CompEstado.Codigo := Ed_IdEstado.Text;

  if EDITAR then
   ComprobVtaEstadoEditar(CompEstado)
  else
    ComprobVtaEstadoAgregar(CompEstado);


 CompEstado.free;

 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmCompVtaEstados.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmCompVtaEstados.BC_CancelarPrintClick(Sender: TObject);
begin
 desbloqueo;
 Pn_Imprimir.Visible := false;
end;

procedure TFmCompVtaEstados.BC_AceptarPrintClick(Sender: TObject);
begin

  FDQuery1.close;
  FDQuery1.sql.add('SELECT * FROM rubros');
  if CV_PrintSoloActivos.Checked then
     FDQuery1.sql.add(' WHERE activo=TRUE');

 FDQuery1.sql.add(' ORDER BY descripcion');
  frxReport1.LoadFromFile(  AjusteObj.CarpReportes + '\rubros.fr3')   ;

  FDQuery1.open;
  SetUpReporte(frxReport1,'Rubros');

 // TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_PrintPagJuntos.Checked ;

  frxReport1.ShowReport;

  Desbloqueo;
  Pn_imprimir.Visible := false;
end;

procedure TFmCompVtaEstados.d3_ListViewCustomDrawItem(Sender: TCustomListView;
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

procedure TFmCompVtaEstados.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmCompVtaEstados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmCompVtaEstados.FormCreate(Sender: TObject);
begin

 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;


 TB_readdb.Click;
end;


procedure TFmCompVtaEstados.FormDestroy(Sender: TObject);
begin
  ListaCompleta.Free;
  ListaActiva.Free;
end;



procedure TFmCompVtaEstados.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if SubItem=2 then
    Sender.Canvas.Brush.Color := StringToColor(TComprobVtaEstados(ListaActiva.objects[Item.Index]).color)  else  Sender.Canvas.Brush.Color := clWhite;
  DefaultDraw := true;
end;

procedure TFmCompVtaEstados.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
   Caption :=   TComprobVtaEstados(ListaActiva.objects[Item.Index]).Codigo ;
   SubItems.Add( TComprobVtaEstados(ListaActiva.objects[Item.Index]).descripcion );
  // SubItems.Add( TComprobVtaEstados(ListaActiva.objects[Item.Index]).color);
   end;
end;

procedure TFmCompVtaEstados.ListView1DblClick(Sender: TObject);
begin
 TB_editClick(Sender);
end;

procedure TFmCompVtaEstados.Shape1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ColorDialog1.Execute() then
   begin
    Shape1.Brush.color := ColorDialog1.Color;
    Ed_Color.text :=  ColorToString(ColorDialog1.Color);
   end;
end;

procedure TFmCompVtaEstados.TB_readdbClick(Sender: TObject);
begin
 ListaCompleta.Clear;
 ComprobVtaEstadoLeerListado(ListaCompleta) ;
 ApplyFilter(Ed_busqueda.Text);
 ListView1.ItemIndex := 0;

end;

procedure TFmCompVtaEstados.TB_PrintClick(Sender: TObject);
begin
   Bloqueo;
   Pn_Imprimir.Visible := true;
   Pn_Imprimir.BringToFront;
end;

procedure TFmCompVtaEstados.TB_addClick(Sender: TObject);
begin
  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

   Ed_IdEstado.Enabled := true;
   Ed_IdEstado.text := '';
   Ed_Descripcion.Text := '';
   Ed_Color.TEXT := 'clwhite';

end;

procedure TFmCompVtaEstados.TB_DeleteClick(Sender: TObject);
var
 IdRubro : String;
begin
 IdRubro :=  Listview1.items[Listview1.ItemIndex].Caption;

 if DialogoBox('�Confirma borrar el estado : '+ Listview1.items[Listview1.ItemIndex].Caption +' ?','Borrar Rubro', 1,1)  then
  IF ComprobVtaEstadoBorrar(IdRubro) Then
   BEgin
    ListaActiva.Delete(Listview1.ItemIndex);
    Listview1.items.Count := ListaActiva.Count;
   End;

end;

procedure TFmCompVtaEstados.TB_editClick(Sender: TObject);
var
  ComprobVtaEstado : TComprobVtaEstados;
  i : integer;
begin
   Editar := true;
   Bloqueo;

   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;

   ComprobVtaEstado := TComprobVtaEstados.create;
   ComprobVtaEstado.Codigo :=  Listview1.items[Listview1.ItemIndex].Caption;

   ComprobVtaEstadoLeer(ComprobVtaEstado);

   Ed_IdEstado.Enabled := false;
   Ed_IdEstado.text := ComprobVtaEstado.Codigo;
   Ed_Descripcion.Text := ComprobVtaEstado.Descripcion;
   Ed_Color.text := ComprobVtaEstado.color;
   TRY
     Shape1.Brush.Color :=  StringToColor(ComprobVtaEstado.color);
   except
     Shape1.Brush.Color := clWhite;
   END;
   ComprobVtaEstado.Free;
end;

procedure TFmCompVtaEstados.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.

