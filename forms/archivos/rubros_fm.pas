﻿
unit rubros_fm;

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
  FireDAC.Comp.Client, Data.DB;


type
  TFmRubros = class(TForm)
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
    Ed_IdRubro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Ed_Descripcion: TEdit;
    CV_Activo: TCheckBox;
    Me_Observaciones: TMemo;
    Label3: TLabel;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    TS_SoloActivos: TToggleSwitch;
    StatusBar1: TStatusBar;
    TB_Print: TToolButton;
    Pn_Imprimir: TPanel;
    frxReport1: TfrxReport;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    CV_PrintSoloActivos: TCheckBox;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
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
  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
  end;

var
  FmRubros: TFmRubros;

implementation
{$R *.dfm}

uses
   rubros,  main,    eventos,
   utilsfunc, rp_utils,importsdll;

var
 // BusqIndiceDesde : integer;
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmRubros.Bloqueo;
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
procedure TFmRubros.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmRubros.ApplyFilter(const S: string);
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


procedure TFmRubros.Bc_AceptarClick(Sender: TObject);
var
 Rubro : TRubro;
begin
  Rubro := TRubro.create ;

  Rubro.Id := Ed_IdRubro.Text;
  Rubro.Descripcion := Ed_Descripcion.Text;
  Rubro.Activo :=  CV_Activo.Checked;
  Rubro.Observaciones := Me_Observaciones.Text;

  if EDITAR then
   begin
    RubrosEditar(Rubro);
    ListaActiva.Objects[ListView1.ItemIndex] := Rubro;
    EventosAgregar('Editar rubro '+ Ed_IdRubro.text  );
   end
  else
    begin
     RubrosAgregar(Rubro);
     ListaCompleta.AddObject(Rubro.Descripcion, Rubro);
     ListaActiva.AddObject(Rubro.Descripcion, Rubro);
     ListView1.Items.Count := ListaActiva.Count;
     StatusBar1.Panels[0].text := 'Registros: '+ IntToStr(ListaActiva.Count);
    end;


 Rubro.free;

 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmRubros.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmRubros.BC_CancelarPrintClick(Sender: TObject);
begin
 desbloqueo;
 Pn_Imprimir.Visible := false;
end;

procedure TFmRubros.BC_AceptarPrintClick(Sender: TObject);
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

procedure TFmRubros.d3_ListViewCustomDrawItem(Sender: TCustomListView;
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

procedure TFmRubros.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmRubros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmRubros.FormCreate(Sender: TObject);
begin

 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;


 TB_readdb.Click;
end;


procedure TFmRubros.FormDestroy(Sender: TObject);
begin
  ListaCompleta.Free;
  ListaActiva.Free;
end;



procedure TFmRubros.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
   Caption :=  TRubro(ListaActiva.objects[Item.Index]).Id;
   SubItems.Add( TRubro(ListaActiva.objects[Item.Index]).descripcion );
   SubItems.Add( TRubro(ListaActiva.objects[Item.Index]).observaciones);
   end;
end;

procedure TFmRubros.ListView1DblClick(Sender: TObject);
begin
 TB_editClick(Sender);
end;

procedure TFmRubros.TB_readdbClick(Sender: TObject);
begin
 ListaCompleta.Clear;
  if TS_SoloActivos.State = tssOn then    // solo activos
   RubrosLeerListado(ListaCompleta, 'activo')
 else
   RubrosLeerListado(ListaCompleta, 'todos');
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);
 ListView1.ItemIndex := 0;

end;

procedure TFmRubros.TB_PrintClick(Sender: TObject);
begin
   Bloqueo;
   Pn_Imprimir.Visible := true;
   Pn_Imprimir.BringToFront;
end;

procedure TFmRubros.TB_addClick(Sender: TObject);
begin
  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

  Ed_IdRubro.Enabled := true;
   Ed_IdRubro.text := '';
   Ed_Descripcion.Text := '';
  Me_Observaciones.clear;
end;

procedure TFmRubros.TB_DeleteClick(Sender: TObject);
var
 IdRubro : String;
begin
 IdRubro :=  Listview1.items[Listview1.ItemIndex].Caption;

 if DialogoBox('¿Confirma borrar el rubro : '+ Listview1.items[Listview1.ItemIndex].Caption +' ?','Borrar Rubro', 1,1)  then
  IF RubrosBorrar(IdRubro) Then
   BEgin
    //ListaActiva.Delete(Listview1.ItemIndex);
    trUBRO(ListaActiva.objects[Listview1.ItemIndex]).Descripcion  := '**** BORRADO ******';
    Listview1.items.Count := ListaActiva.Count;
   End;

end;

procedure TFmRubros.TB_editClick(Sender: TObject);
var
  Rubro : TRubro;
  i : integer;
begin
   Editar := true;
   Bloqueo;

   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;

   Rubro := TRubro.create;
   Rubro.Id :=  Listview1.items[Listview1.ItemIndex].Caption;
   RubrosLeerRubro(Rubro);

   Ed_IdRubro.Enabled := false;
   Ed_IdRubro.text := Rubro.Id;
   Ed_Descripcion.Text := Rubro.Descripcion;
   If Rubro.activo then CV_Activo.State := cbChecked else  CV_Activo.State := cbUnchecked;
   Me_Observaciones.clear;
    Me_Observaciones.text := Rubro.Observaciones;

   Rubro.Free;
end;

procedure TFmRubros.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.

