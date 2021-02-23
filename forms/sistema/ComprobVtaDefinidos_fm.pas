unit ComprobVtaDefinidos_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin;

type
  TFmConfigComprobDefinidos = class(TForm)
    ToolBar1: TToolBar;
    TBRead: TToolButton;
    TBadd: TToolButton;
    TBedit: TToolButton;
    TBdelete: TToolButton;
    TBExit: TToolButton;
    Lv_ComprobDef: TListView;
    Pn_EditAdd: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Ed_CompDefNroAct: TEdit;
    CB_PtoVta: TComboBox;
    CB_TipoComprob: TComboBox;
    CB_CompDefTipoNumer : TComboBox;
    CB_CompDefFormato_impres: TComboBox;
    CB_CompDefImpresora: TComboBox;
    CB_CompDefFormato_pdf: TComboBox;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBaddClick(Sender: TObject);
    procedure TBdeleteClick(Sender: TObject);
    procedure TBeditClick(Sender: TObject);
    procedure TBReadClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);

  private
    { Private declarations }
    procedure DESBloqueo;
    procedure Bloqueo;

  public
    { Public declarations }
  end;



var
  FmConfigComprobDefinidos: TFmConfigComprobDefinidos;


implementation
 {$R *.dfm}
uses
   COmprobVtaDefinidos, COmprobVtaTipos,ComprobVtaPtosVta,
   UtilsFunc,importsdll, main,PRINTERS;

var
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmConfigComprobDefinidos.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmConfigComprobDefinidos.Bloqueo;
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
procedure TFmConfigComprobDefinidos.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;

procedure TFmConfigComprobDefinidos.TBaddClick(Sender: TObject);
begin
  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

    CB_PtoVta.text := '';
    CB_TipoComprob.text := '';
    CB_CompDefTipoNumer.ItemIndex  := 0;
    Ed_CompDefNroAct.Text := '0';
    CB_CompDefFormato_impres.ItemIndex := 0;
    CB_CompDefFormato_pdf.ItemIndex := 0;
    CB_CompDefImpresora.ItemIndex :=0;
    //CB_PtoVta.setfocus;

end;

procedure TFmConfigComprobDefinidos.TBdeleteClick(Sender: TObject);
begin
  if dialogoBox('�Seguro borra el comprobante definido?','Comprobantes definidos',1,1) then
     ComprobDef_DeleteDb( Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].caption );
end;

procedure TFmConfigComprobDefinidos.TBeditClick(Sender: TObject);
begin
  Editar := TRUE;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;
  //CB_CompDefPtoVta.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].Caption;
  CB_PtoVta.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[0];
  CB_TipoComprob.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[1];
  CB_CompDefTipoNumer.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[2];
  Ed_CompDefNroAct.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[3];
  CB_CompDefFormato_impres.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[4];
  CB_CompDefFormato_pdf.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[5];
  CB_CompDefImpresora.text := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].SubItems[6];

end;

procedure TFmConfigComprobDefinidos.TBExitClick(Sender: TObject);
begin
 close;
end;

procedure TFmConfigComprobDefinidos.TBReadClick(Sender: TObject);
var
 Lista : TStringList;
 i : integer;
begin
      Lista := TStringList.Create;
     ComprobDef_LeerListado(Lista);
     Lv_ComprobDef.Clear;
      for i:=0 to Lista.Count-1 do
       with Lv_ComprobDef.Items.Add do begin
        Caption := Lista[i];
        SubItems.Add( TComprobDef(Lista.objects[i]).PtoVta);
        SubItems.Add( TComprobDef(Lista.objects[i]).TipoComprob);
        SubItems.Add( TComprobDef(Lista.objects[i]).TipoNumer);
        SubItems.Add( TComprobDef(Lista.objects[i]).NroActual);
        SubItems.Add( TComprobDef(Lista.objects[i]).Formato_Impres);
        SubItems.Add( TComprobDef(Lista.objects[i]).Formato_PDF);
        SubItems.Add( TComprobDef(Lista.objects[i]).Impresora);
       end;
     if Lv_ComprobDef.Items.Count >  0 Then
       Lv_ComprobDef.ItemIndex := 0;
     Lista.clear;
{     CB_CompDefFormato_impres.Items.Clear;     // ller formatos de impresi�n
     CB_CompDefFormato_pdf.Items.Clear;
     ReadDb_LstFormaTOSImpres(Lista);
     for i:=0 to Lista.Count-1 do
      Begin
       CB_CompDefFormato_impres.Items.Add(Lista[i]);
       CB_CompDefFormato_pdf.Items.Add(Lista[i]);
      End; }
        StatusBar1.Panels[0].Text :=  'Registros: '+IntToStr(Lv_ComprobDef.Items.Count);
 Lista.Free;

end;

procedure TFmConfigComprobDefinidos.FormCreate(Sender: TObject);
var
 Lista : TStringList;
 i : integer;
begin
 Lista := TStringList.Create;

 Lista.Clear;
 TiposComprobVtaLeerListado(Lista);
  CB_TipoComprob.ITEMS.Assign(Lista);
  CB_CompDefTipoNumer.Items.Assign(Lista);
  CB_CompDefTipoNumer.Items.Insert(0,'PROPIA');
 Lista.Clear;
 PuntosVta_LeerListado(Lista);
  CB_PtoVta.Items.Assign(Lista);
  CB_CompDefImpresora.Items := PRINTER.Printers;

  CB_CompDefFormato_impres.items :=  ArchivosCarpeta(AjusteObj.CarpReportes+'\comprobantes', '*.fr3', False, False);
  CB_CompDefFormato_pdf.Items := ArchivosCarpeta(AjusteObj.CarpReportes+'\comprobantes', '*.fr3', False, False);

end;

procedure TFmConfigComprobDefinidos.FormShow(Sender: TObject);
begin
 TBReadClick(Sender);
end;

procedure TFmConfigComprobDefinidos.Bc_AceptarClick(Sender: TObject);
var
 TipoComprob : TComprobVtaTipos;
 PuntoVta : TPuntoVta;
 ComprobDef : TComprobDef;
begin


     ComprobDef := TComprobDef.create;
     ComprobDef.id := Lv_ComprobDef.Items[Lv_ComprobDef.ItemIndex].Caption;;
     ComprobDef.PtoVta := CB_PtoVta.text;
     ComprobDef.TipoComprob := CB_TipoComprob.text;
     ComprobDef.TipoNumer := CB_CompDefTipoNumer.text;
     ComprobDef.NroActual := Ed_CompDefNroAct.text;
     ComprobDef.Formato_impres := CB_CompDefFormato_impres.text;
     ComprobDef.Formato_pdf := CB_CompDefFormato_pdf.text;
     ComprobDef.Impresora := CB_CompDefImpresora.text;

     If EDITAR then
       ComprobDef_UpdateDb(ComprobDef) else
     ComprobDef_InsertDb(ComprobDef);
     ComprobDef.Free;
   Lv_ComprobDef.Clear;
   TBReadClick(Sender);

   DESBloqueo;
   Pn_EditAdd.Visible := FALSE;

end;

procedure TFmConfigComprobDefinidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree;
end;

end.
