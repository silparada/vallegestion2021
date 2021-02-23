unit ComprobVtaPtosVta_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin;

type
  TFmConfPuntosVta = class(TForm)
    ToolBar1: TToolBar;
    TBRead: TToolButton;
    TBadd: TToolButton;
    TBedit: TToolButton;
    TBdelete: TToolButton;
    TBExit: TToolButton;
    LV_puntosVta: TListView;
    Pn_EditAdd: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Ed_PtoVtaId: TEdit;
    Ed_PtoVtaDesc: TEdit;
    CB_PtoVtaTipoFac: TComboBox;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBaddClick(Sender: TObject);
    procedure TBdeleteClick(Sender: TObject);
    procedure TBeditClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure TBReadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);

  private
    { Private declarations }
    procedure Bloqueo;
    procedure DesBloqueo;

  public
    { Public declarations }
  end;

var
  FmConfPuntosVta: TFmConfPuntosVta;

implementation
 {$R *.dfm}
uses
  //class
  ComprobVtaPtosVta, ComprobVtaTipos,ComprobVtaDefinidos,
  UtilsFunc,importsdll,main,PRINTERS;

var
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;
procedure TFmConfPuntosVta.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmConfPuntosVta.Bloqueo;
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
procedure TFmConfPuntosVta.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
  BorderStyle := bsSizeable;
end;


procedure TFmConfPuntosVta.TBaddClick(Sender: TObject);
begin

  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

   Ed_PtoVtaId.enabled := true;
   Ed_PtoVtaId.text      := '';
   Ed_PtoVtaDesc.text := '';
   Cb_PtoVtaTipoFac.ItemIndex  := 0;
   Ed_PtoVtaId.setfocus;
end;

procedure TFmConfPuntosVta.TBdeleteClick(Sender: TObject);
begin
  if dialogoBox('�Seguro borra el Punto de Venta?','Puntos de Venta',1,1) then
   Begin
     PuntosVta_DeleteDb( LV_PuntosVta.Items[LV_PuntosVta.ItemIndex].caption );
     TBReadClick(Sender);
   End;
end;

procedure TFmConfPuntosVta.TBeditClick(Sender: TObject);
begin
  EDITAR  := TRUE;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

  Ed_PtoVtaId.enabled := false;
  Ed_PtoVtaId.text := LV_PuntosVta.Items[LV_PuntosVta.ItemIndex].Caption;
  Ed_PtoVtaDesc.text := LV_PuntosVta.Items[LV_PuntosVta.ItemIndex].SubItems[0];
  Cb_PtoVtaTipoFac.text  := LV_PuntosVta.Items[LV_PuntosVta.ItemIndex].SubItems[1];

end;

procedure TFmConfPuntosVta.TBExitClick(Sender: TObject);
begin
 close;
end;

procedure TFmConfPuntosVta.TBReadClick(Sender: TObject);
var
 Lista : TStringList;
 i : integer;
begin

 Lista := TStringList.create;

     PuntosVta_LeerListado(Lista);
     LV_PuntosVta.Clear;
     for i:=0 to Lista.Count-1 do
       with LV_PuntosVta.Items.Add do begin
        Caption := Lista[i];
        SubItems.Add( TPuntoVta(Lista.objects[i]).descripcion);
        SubItems.Add( TPuntoVta(Lista.objects[i]).Tipo_Facturacion);
       end;
     if LV_Puntosvta.Items.Count >  0 Then
       LV_Puntosvta.ItemIndex := 0;

     StatusBar1.Panels[0].Text :=  'Registros: '+IntToStr(LV_PuntosVta.Items.Count);
 Lista.Free;

end;

procedure TFmConfPuntosVta.FormCreate(Sender: TObject);
begin
 LV_puntosVta.clear;
end;

procedure TFmConfPuntosVta.FormShow(Sender: TObject);
begin
 TBReadClick(Sender);
end;

procedure TFmConfPuntosVta.Bc_AceptarClick(Sender: TObject);
var
 TipoComprob : TComprobVtaTipos;
 PuntoVta : TPuntoVta;
 ComprobDef : TComprobDef;
begin
     if  Ed_PtoVtaId.text ='' then
     begin
      Mensaje('El campo Id no puede ser nulo','Error',3);
      exit;
     end;
     PuntoVta := TPuntoVta.create;
     PuntoVta.id_ptovta := Ed_PtoVtaId.text;
     PuntoVta.descripcion := Ed_PtoVtaDesc.text;
     PuntoVta.Tipo_Facturacion := Cb_PtoVtaTipoFac.text;
     If not EDITAR then
       PuntosVta_InsertDb(PuntoVta) else
       PuntosVta_UpdateDb(PuntoVta);
     PuntoVta.Free;
     LV_PuntosVta.Clear;
     TBReadClick(Sender);

     Desbloqueo;
     Pn_EditAdd.Visible := false;

end;

procedure TFmConfPuntosVta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree;
end;

end.
