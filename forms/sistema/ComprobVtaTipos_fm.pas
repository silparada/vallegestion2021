unit ComprobVtaTipos_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin;

type
  TFmConfTiposComprob = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    TBadd: TToolButton;
    TBedit: TToolButton;
    TBdelete: TToolButton;
    TBExit: TToolButton;
    Pn_EditAdd: TPanel;
    Label10: TLabel;
    Label44: TLabel;
    Label41: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    Ed_ComprobVtaId: TEdit;
    Ed_ComprobVtaDescrip: TEdit;
    Cb_ComprobVtaTipoDebCred: TComboBox;
    CB_ComprobVtaStock: TComboBox;
    Cb_ComprobVtaIVA: TComboBox;
    Ed_ComprobVtaCodAfip: TEdit;
    Ed_ComprobVtaLetra: TEdit;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Ed_busqueda: TEdit;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    ListView1: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBaddClick(Sender: TObject);
    procedure TBdeleteClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure TB_readdbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBeditClick(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure Ed_busquedaChange(Sender: TObject);

  private
    { Private declarations }
    procedure DesBloqueo;
    procedure Bloqueo;
    procedure ApplyFilter(const S: string);

  public
    { Public declarations }
  end;

var
  FmConfTiposComprob: TFmConfTiposComprob;

implementation
 {$R *.dfm}
uses
 //class
  ComprobVtaTipos,
  UtilsFunc,importsdll, main, PRINTERS;
var
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmConfTiposComprob.Bc_AceptarClick(Sender: TObject);
var
  Comprob_Vta_Tipo : TComprobVtaTipos;
Begin
  Comprob_Vta_Tipo := TComprobVtaTipos.create;

  Comprob_Vta_Tipo.Id_tipocompr :=  Ed_ComprobVtaId.text ;
  Comprob_Vta_Tipo.descripcion := Ed_ComprobVtaDescrip.text;
  Comprob_Vta_Tipo.Tipo_Debcred  := Cb_ComprobVtaTipoDebCred.text;
  Comprob_Vta_Tipo.Tipo_Stock := Cb_ComprobVtaStock.text;
  Comprob_Vta_Tipo.Incl_IVA := Cb_ComprobVtaIVA.text;
  Comprob_Vta_Tipo.letra := Ed_ComprobVtaLetra.text;
  Comprob_Vta_Tipo.Cod_Afip := Ed_ComprobVtaCodAfip.Text;

  if EDITAR then
   TiposComprobVta_UpdateDb(Comprob_Vta_Tipo)
  else
   TiposComprobVta_InsertDb(Comprob_Vta_Tipo);

 Comprob_Vta_Tipo.free;

 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;

end;

procedure TFmConfTiposComprob.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmConfTiposComprob.Bloqueo;
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
procedure TFmConfTiposComprob.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmConfTiposComprob.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmConfTiposComprob.ApplyFilter(const S: string);
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


procedure TFmConfTiposComprob.TBaddClick(Sender: TObject);
begin

  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

  Ed_ComprobVtaId.Enabled := true;

  Ed_ComprobVtaId.text      := '';
  Ed_ComprobVtaDescrip.text := '';
  Cb_ComprobVtaTipoDebCred.ItemIndex  := 0;
  Cb_ComprobVtaStock.ItemIndex := 0;
  Cb_ComprobVtaIVA.ItemIndex :=0;
  Ed_ComprobVtaLetra.text := '';
  Ed_ComprobVtaCodAfip.text := '';

end;

procedure TFmConfTiposComprob.TBdeleteClick(Sender: TObject);
begin
  if dialogoBox('�Seguro borra el tipo de comprobante?','Tipo de Comprobantes',1,1) then
     TiposComprobVta_DeleteDb( ListView1.Items[ListView1.ItemIndex].caption );


end;

procedure TFmConfTiposComprob.TBeditClick(Sender: TObject);
var
  Comprob_Vta_Tipo : TComprobVtaTipos;
begin
   Editar := true;
   Bloqueo;

   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;

   Comprob_Vta_Tipo := TComprobVtaTipos.create;
   Comprob_Vta_Tipo.Id_tipocompr :=  Listview1.items[Listview1.ItemIndex].Caption;
   TiposComprobVtaLeerComprob(Comprob_Vta_Tipo);

  Ed_ComprobVtaId.Enabled := false;

  Ed_ComprobVtaId.text  :=  Comprob_Vta_Tipo.Id_tipocompr ;
  Ed_ComprobVtaDescrip.text  :=  Comprob_Vta_Tipo.descripcion;
  Cb_ComprobVtaTipoDebCred.text  :=  Comprob_Vta_Tipo.Tipo_Debcred ;
  Cb_ComprobVtaStock.text :=   Comprob_Vta_Tipo.Tipo_Stock;
  Cb_ComprobVtaIVA.text :=  Comprob_Vta_Tipo.Incl_IVA;
  Ed_ComprobVtaLetra.text :=  Comprob_Vta_Tipo.letra;
  Ed_ComprobVtaCodAfip.Text :=  Comprob_Vta_Tipo.Cod_Afip;

  Comprob_Vta_Tipo.free;
end;

procedure TFmConfTiposComprob.TBExitClick(Sender: TObject);
begin
 close;
end;

procedure TFmConfTiposComprob.TB_readdbClick(Sender: TObject);
begin

 ListaCompleta.Clear;
 TiposComprobVtaLeerListado(ListaCompleta);
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);
 ListView1.ItemIndex := 0;

end;

procedure TFmConfTiposComprob.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree;
end;

procedure TFmConfTiposComprob.FormCreate(Sender: TObject);
begin

 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;


 TB_readdb.Click;
end;

procedure TFmConfTiposComprob.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
     Caption :=  TComprobVtaTipos(ListaActiva.objects[Item.Index]).Id_tipocompr;
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).descripcion );
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).Tipo_Debcred );
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).Tipo_Stock );
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).Incl_IVA );
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).letra );
     SubItems.Add( TComprobVtaTipos(ListaActiva.objects[Item.Index]).Cod_Afip );
   end;
end;

end.
