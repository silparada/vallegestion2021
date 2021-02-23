unit ComprobVtaImp_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ADODB, Mask, DBCtrls,
  ComCtrls, ToolWin;

type
  TFmImpuestos = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    TB_add: TToolButton;
    TB_edit: TToolButton;
    TB_Delete: TToolButton;
    Pn_EditAdd: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ListView1: TListView;
    Ed_IdImPUESTO: TEdit;
    TB_Exit: TToolButton;
    Ed_tasa: TEdit;
    Label4: TLabel;
    Ed_Descripcion: TEdit;
    Label3: TLabel;
    Ed_Orden: TEdit;
    CB_Aplica: TComboBox;
    Label6: TLabel;
    Ed_CodAfip: TEdit;
    Label7: TLabel;
    CB_Tipo: TComboBox;
    Label8: TLabel;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_DeleteClick(Sender: TObject);
    procedure TB_readdbClick(Sender: TObject);
    procedure TB_editClick(Sender: TObject);
    procedure TB_ExitClick(Sender: TObject);
    procedure TB_addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure BC_CancelarClick(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Bloqueo;
    procedure desBloqueo;
  public
    { Public declarations }
  end;

var
  FmImpuestos: TFmImpuestos;   // Los

implementation
{$R *.dfm}
uses
 //class
 ComprobVtaImpuestos,
 main,utilsFunc,importsdll;

var
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmImpuestos.Bc_AceptarClick(Sender: TObject);
var
 Impuesto : TImpuesto;
begin
  Impuesto := TImpuesto.create ;
  Impuesto.Id_Impuesto:= Ed_IdImpuesto.text;
  Impuesto.Descripcion := Ed_descripcion.text;

  Impuesto.tipo := CB_Tipo.Text;
  Impuesto.tasa :=  StrToFloat(Ed_tasa.Text);
  Impuesto.Orden:= StrToInt(Ed_orden.text);
  Impuesto.aplica := cb_aplica.Text;
  Impuesto.CodAfip := ed_codAfip.Text;


  ListaCompleta.Objects[ListView1.ItemIndex].Free;
  ListaCompleta.Objects[ListView1.ItemIndex] :=  Impuesto; // actualiza LISTA Y por ende el LV para no tener que reconsultar LISTA
  if noT Editar then
    Impuesto_InsertDb(Impuesto)
   else
     Impuesto_UpdateDb(Impuesto);  // EDITANDO
  TB_readdbClick(sender);


 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;

end;

procedure TFmImpuestos.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure tFmImpuestos.Bloqueo;
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
procedure tFmImpuestos.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;


procedure TFmImpuestos.TB_addClick(Sender: TObject);
begin
   Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

 Ed_idImpuesto.Enabled := true;
 Ed_idImpuesto.text := '';
 Ed_descripcion.text := '';
 Ed_tasa.text := '';
 Ed_CodAfip.text := '';
 Ed_Orden.text := '1';

end;

procedure TFmImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmImpuestos.FormCreate(Sender: TObject);
begin
  ListaCompleta := TStringList.create;
end;

procedure TFmImpuestos.ListView1Data(Sender: TObject; Item: TListItem);
begin
   with Item do
   begin
    Caption := TImpuesto(ListaCompleta.objects[Item.Index]).Id_Impuesto;
    SubItems.Add( TImpuesto(ListaCompleta.objects[Item.Index]).descripcion );
    SubItems.Add( TImpuesto(ListaCompleta.objects[Item.Index]).Tipo );
    SubItems.Add( FloatToStrF(TImpuesto(ListaCompleta.objects[Item.Index]).Tasa, ffFixed,18,2) );
    SubItems.Add(  IntToStr(TImpuesto(ListaCompleta.objects[Item.Index]).orden));
    SubItems.Add( TImpuesto(ListaCompleta.objects[Item.Index]).aplica );
    SubItems.Add( TImpuesto(ListaCompleta.objects[Item.Index]).CodAfip );
   end;
end;

procedure TFmImpuestos.TB_readdbClick(Sender: TObject);
begin
  ListaCompleta.clear;
  Impuestos_LeerListado(ListaCompleta);
  ListView1.clear;
  ListView1.items.count := ListaCompleta.count;
  ListView1.ItemIndex := 0;
end;

procedure TFmImpuestos.TB_editClick(Sender: TObject);
var
 Impuesto : TImpuesto;
begin
   Editar := true;
   Bloqueo;

   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;


 Ed_idImpuesto.Enabled := false;
 Impuesto := TImpuesto(ListaCompleta.Objects[ ListView1.ItemIndex]);
 Ed_idimpuesto.text := Impuesto.Id_Impuesto;
 Ed_descripcion.text := Impuesto.Descripcion;
 CB_Tipo.text := Impuesto.Tipo;
 Ed_tasa.text := FloatToStrF(Impuesto.Tasa, FfFixed,18,2);
 Ed_Orden.text := IntToStr(Impuesto.Orden);
 CB_Aplica.text := Impuesto.APlica;
 Ed_CodAfip.Text := Impuesto.CodAfip;

end;

procedure TFmImpuestos.TB_DeleteClick(Sender: TObject);
begin

  if dialogoBox('¿Seguro borra el impuesto?','Impuestos',1,1) then
   Begin
     //PuntosVta_DeleteDb( LV_PuntosVta.Items[LV_PuntosVta.ItemIndex].caption );
     //TBReadClick(Sender);
   End;
end;

procedure TFmImpuestos.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.
