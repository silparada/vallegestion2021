unit ComprobvtaAdd_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ADODB, ExtCtrls, ToolWin, Menus,
  ImgList,

{  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Mask, DB,  Buttons,
  Grids, Printers, ComCtrls, CategoryButtons, Contnrs,WideStrings,
  ImgList, ToolWin,}

  Contnrs,WideStrings, System.ImageList;

type
  TFmComprobVta_add = class(TForm)
    PnValores: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    Ed_MedioImporte: TLabeledEdit;
    Ed_MedioDescrip: TLabeledEdit;
    CB_MedioTipo: TComboBox;
    Ed_IdCliente: TEdit;
    Label12: TLabel;
    Ed_Nombre: TEdit;
    CB_TipoComprob: TComboBox;
    Label11: TLabel;
    Label2: TLabel;
    CB_PtoVta: TComboBox;
    Ed_NroFac: TEdit;
    Label4: TLabel;
    Ed_Fecha: TDateTimePicker;
    Label3: TLabel;
    Label9: TLabel;
    Ed_FechaVto: TDateTimePicker;
    Ed_VendedorId: TEdit;
    CB_Vendedor: TComboBox;
    Label7: TLabel;
    GOP_CondVta: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label5: TLabel;
    LV_Items: TListView;
    BC_DelItem: TBitBtn;
    Ed_Precio: TEdit;
    Ed_TasaIVA: TEdit;
    Ed_Cantidad: TEdit;
    Ed_Descrip: TEdit;
    Ed_IdArticulo: TEdit;
    Ed_Descuento: TEdit;
    BC_ActualizarItem: TBitBtn;
    Ed_CodIVA: TEdit;
    BC_DelAllValor: TBitBtn;
    TabSheet2: TTabSheet;
    Label14: TLabel;
    LV_Valores: TListView;
    Ed_TotalValores: TEdit;
    BC_AgregarValor: TButton;
    BC_BorarValores: TButton;
    TabSheet3: TTabSheet;
    LV_Impuestos: TListView;
    Label13: TLabel;
    Ed_Observaciones: TEdit;
    Ed_Importe: TEdit;
    Label15: TLabel;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    Label6: TLabel;
    CB_FmPagos: TComboBox;
    Lb_etiqueta: TLabel;
    BC_EfectivoTotal: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GOP_CondVtaClick(Sender: TObject);
    procedure CB_VendedorChange(Sender: TObject);
    procedure BC_DelItemClick(Sender: TObject);
    procedure Ed_NroSucChange(Sender: TObject);
    procedure CB_PtoVtaSelect(Sender: TObject);
    procedure BC_AgregarValorClick(Sender: TObject);

    procedure CalValores;
    procedure Ed_IdArticuloKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_CantidadKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_PrecioKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_DescuentoKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_DescripKeyPress(Sender: TObject; var Key: Char);
    procedure LV_ItemsDblClick(Sender: TObject);
    procedure BC_ActualizarItemClick(Sender: TObject);
    procedure Ed_PrecioExit(Sender: TObject);
    procedure CB_FmPagosChange(Sender: TObject);
    procedure BC_DelAllValorClick(Sender: TObject);
    procedure CB_TipoComprobSelect(Sender: TObject);
    procedure NuevoCoprobante;
    procedure Ed_TotalValoresChange(Sender: TObject);
    procedure BC_BorarValoresClick(Sender: TObject);
    procedure BC_AceptarPrintClick(Sender: TObject);
    procedure BC_CancelarPrintClick(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);
    procedure BC_EfectivoTotalClick(Sender: TObject);
  private
    { Private declarations }
    PROCEDURE CargarImpuesto;
  public
    { Public declarations }
    procedure CalcularImporte;
    procedure CalcularTotales;
    procedure ActNumeracion;
    procedure Bloqueo;
    procedure DesBloqueo;
  end;
//var
//  FmComprobVta : TFmComprobVta_add;

implementation
{$R *.DFM}
uses
  //class
  eventos, vendedores,
  comprobvta,articulos,clientes,ciudades, movimVta,
  ComprobVtaTipos,ComprobVtaPtosVta, ComprobVtaImpxTipo_fm,
  ComprobVtaImpuestos, ComprobVtaDefinidos,

  itemsvta,formaspago,fondos,
  //form
  Main,utilsFunc, importsdll,

  IniFiles , Clientebuscar, ArticuloBuscar,  printcomprob
;

var
  ciudad : TCiudad;
  Cliente : TCliente;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmComprobVta_add.Bloqueo;
begin
  //FmClientes
 // BorderStyle := bsSingle;
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
procedure TFmComprobVta_add.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
end;
procedure TFmComprobVta_add.ActNumeracion;
var
 Numero, Etiqueta :String;
  i:integer;
begin
  i :=  Cb_TipoComprob.Items.IndexOf(Cb_TipoComprob.text);
  Cb_TipoComprob.ItemIndex := i;
  //sdfdssdf
  LeerNroComp(CB_PtoVta.text, TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).id_tipocompr , Numero );
  Ed_NroFac.Text := Numero;
  Lb_etiqueta.Caption :=  TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).letra ;
  CargarImpuesto;
end;

procedure TFmComprobVta_add.NuevoCoprobante;
var i: integer;
Begin
  LV_Items.Clear;
  LV_Valores.clear;
  for i:= 0 To LV_Impuestos.Items.Count-1 do
    begin
     LV_Impuestos.Items[i].SubItems[2] := FloatToStrF(0, FFFixed,18,2);
     LV_Impuestos.Items[i].SubItems[4] := FloatToStrF(0, FFFixed,18,2);
    LV_Impuestos.Items[i].SubItems[5] := FloatToStrF(0, FFFixed,18,2);
    end;
  //SumarItems;
  CalcularTotales;
  Ed_idCliente.setFocus;
end;


procedure TFmComprobVta_add.CalValores;
var
 i : integer;
 TotalValores : Real;
begin
 TotalValores := 0;
  for i := 0 to LV_Valores.Items.Count - 1 do
   TotalValores := TotalValores + StrToFloat(LV_Valores.Items[i].SubItems[1]);
   Ed_TotalValores.text :=  FloatToStrF(TotalValores,ffFixed,18,2);
end;

procedure TFmComprobVta_add.Bc_AceptarClick(Sender: TObject);
var
 Factura : TComprobante;
 Item : TItemFact;
 Fondo : TFondo;
 //Comprob_Impuesto : TComprob_Impuesto;
 i:integer;
 DebCred : CHAR;
 TotalValores : Double;
begin
  if not DIalogoBox('�Confima la emisi�n del comprobante '+ Cb_TipoComprob.text +' N� '+ Cb_PtoVta.Text+'-'+Ed_NroFac.text+ ' ?','Comprobantes de venta',1,1) then
    exit;

  //if Ed_Importe.Text Ed_TotalValores.text then


  Factura := TComprobante.Create;
  Factura.PtoVta := Cb_PtoVta.text;
  Factura.Numero := Ed_nroFac.Text;

  Factura.TipoComprob := CB_TipoComprob.text ;
  Factura.Fecha := Ed_Fecha.Date;
  Factura.FechaVto := ed_FechaVto.date;

  Factura.TipoCompAfip :=   TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Cod_Afip;

  Factura.IdCliente := StrToInt(Ed_IdCliente.Text);
  Factura.nombre := Ed_Nombre.Text;

  if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Debcred = 'DEBITO'  then
    Factura.DebCred := 'D' else Factura.DebCred := 'C';

  Factura.IdFormaPago := TFormaPAgo(CB_FmPagos.Items.Objects[CB_FmPagos.ItemIndex]).Id;
  Factura.IdVendedor := StrToInt(Ed_VendedorId.Text);
  for i := 0 to LV_Impuestos.Items.Count - 1 do
   Begin
    // IVA
    if LV_Impuestos.Items[i].caption = 'IVA1' then
     Begin
      Factura.Iva1_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.iva1_neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;
    if LV_Impuestos.Items[i].caption = 'IVA2' then
     Begin
      Factura.Iva2_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.iva2_neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;
    if LV_Impuestos.Items[i].caption = 'IVA3' then
     Begin
      Factura.Iva3_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.iva3_neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;
    if LV_Impuestos.Items[i].caption = 'EXEN' then
      Factura.Exen_neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
    if LV_Impuestos.Items[i].caption = 'NOGR' then
      Factura.NoGr_neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
    // Otros impuestos
    if LV_Impuestos.Items[i].caption = 'IMP1' then
     Begin
      Factura.Imp1_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.Imp1_Neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;
    if LV_Impuestos.Items[i].caption = 'IMP2' then
     Begin
      Factura.Imp2_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.Imp2_Neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;
    if LV_Impuestos.Items[i].caption = 'IMP3' then
     Begin
      Factura.Imp3_importe :=  StrToFloat(LV_Impuestos.Items[i].subItems[4] );
      Factura.Imp3_Neto :=  StrToFloat(LV_Impuestos.Items[i].subItems[2] );
     End;


    End;
 // Factura.Subtotal  := StrToFloat(Ed_subTotal.TEXT);
 // Factura.Descuento := StrToFloat(CE_Descuento.TEXT);
  Factura.Importe   := StrToFloat(Ed_Importe.TEXT);
  case GOP_CondVta.ItemIndex of
    0: Begin Factura.CondVta := 0; Factura.Saldo := 0 end;
    1: Begin Factura.CondVta := 1; Factura.Saldo := Factura.Importe  end;
  end;

  TotalValores := StrToFloat(Ed_TotalValores.text);


 if NOT (TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Debcred = 'NO APLICA')  then
  if (Factura.Importe <> TotalValores) and (factura.CondVta = 0) then
    begin
      Mensaje('El comprobante es de contado y el importe no coincide con los valores entregados.','Error',3);
      exit;
    end;


  Factura.ListaItems := TObjectList.Create;
  for i := 0 to LV_Items.Items.Count - 1 do
   begin
    Item := TItemFact.create;
    Item.IdItem := LV_Items.Items[i].caption;
    Item.Descripcion := LV_Items.Items[i].SubItems[0] ;
    Item.Precio := StrToFloat( LV_Items.Items[i].SubItems[1] );
    Item.Cantidad := StrToFloat( LV_Items.Items[i].SubItems[2]) ;
    Item.Descuento := StrToFloat( LV_Items.Items[i].SubItems[3]) ;
    Item.Importe := StrToFloat(LV_Items.Items[i].SubItems[4] );
    Item.TasaIva :=  LV_Items.Items[i].SubItems[5] ;
    Factura.ListaItems.Add(Item);
   end;


   if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Stock = 'RESTA'  then
      Factura.TipoStock := 'S';  // SALIDA
   if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Stock = 'SUMA'  then
      Factura.TipoStock := 'E';  // ENTRADA
   if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Stock = 'NO APLICA'  then
      Factura.TipoStock := 'N';  // NO APLICA

   Factura.Observaciones := Ed_Observaciones.text;

   ComprobVtaAgregar(Factura);   // dentro de este proc se graban Items , movimprod y se descuenta stock

   if NOT (TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Debcred = 'NO APLICA')  then
      ComprobVtaAgregarMovim(Factura) ; // solo se graba debito y credito en MovimVta

   EventosAgregar('Emisi�n Compr.Vta. ' +Factura.TipoComprob +' '+Factura.PtoVta+' '+Factura.Numero );

  //grabar valores
  Fondo := TFondo.Create;
  for i := 0 to LV_Valores.Items.Count - 1 do
   Begin
      Fondo.Fecha :=  Ed_Fecha.Date;
     // Fondo.Tipo := 'Cobro Factura'; // LV_Valores.Items.Item[i].Caption;
      Fondo.Descripcion := 'Pago fact. vta. - ' + LV_Valores.Items.Item[i].Caption+' - '+LV_Valores.Items.Item[i].SubItems[0];
      Fondo.Comprobante := Cb_TipoComprob.Text +' '+ CB_PtoVta.text+'-'+Ed_NrofAC.text;;
      Fondo.Importe := StrToFloat(LV_Valores.Items.Item[i].SubItems[1]);
      Fondo.Observaciones := '';
      Fondo.IdComprobante := Factura.Id;
      Fondo.IngEgr := 'I';
      FondosAgregar( Fondo );
     End;
   Fondo.Free;

   screen.Cursor := crdefault;

// NE_NroFac.Text := IntToStr(StrToInt(NE_NroFac.Text) + 1);
   GuardarNroComp( CB_PtoVta.text, TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).id_tipocompr , Ed_NroFac.Text );

   ActNumeracion;

   If TPuntoVta(CB_PtoVta.items.Objects[CB_PtoVta.itemIndex]).Tipo_Facturacion = 'EMISI�N FISCAL' Then //fe O coNTROLADOR
      RunApp(AjusteObj.SoftImpFiscalPath);
   If TPuntoVta(CB_PtoVta.items.Objects[CB_PtoVta.itemIndex]).Tipo_Facturacion = 'FACTURA ELECTRONICA' Then //fe O coNTROLADOR
     RunApp(AjusteObj.SoftFactElectPath);

   If TPuntoVta(CB_PtoVta.items.Objects[CB_PtoVta.itemIndex]).Tipo_Facturacion = 'PRE-IMPRESO' Then
       FmPrintComprob.ImprimirComprobVta(Factura.Id);
   //If TPuntoVta(CB_PtoVta.items.Objects[CB_PtoVta.itemIndex]).Tipo_Facturacion = 'MANUAL' Then
   Factura.free;
   close;
end;

procedure TFmComprobVta_add.BC_AceptarPrintClick(Sender: TObject);
var
 Item : TListItem;
begin
    Item := LV_Valores.items.Add;
   //    LV_Item.Data := ListaCUotas.Objects[i];
    Item.Caption := CB_MedioTipo.text;
    Item.SubItems.add( Ed_MedioDescrip.text );
    Item.SubItems.Add( Ed_MedioImporte.text  );
  PnValores.visible := false;
  DesBloqueo;

  CalValores;

end;

procedure TFmComprobVta_add.BC_ActualizarItemClick(Sender: TObject);
begin
   LV_Items.Items[LV_Items.ItemIndex].caption  :=  Ed_IdArticulo.text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[0] := Ed_Descrip.text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[1]  := Ed_Precio.text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[2] := Ed_Cantidad.text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[3] := Ed_Descuento.text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[5] :=  Ed_TasaIva.Text;
   LV_Items.Items[LV_Items.ItemIndex].SubItems[6] :=  Ed_CodIva.Text;
    Ed_IdArticulo.text:='0';
    Ed_Descrip.Text:='';
    Ed_PRECIO.Text:='';
    Ed_Cantidad.Text:='1';
    Ed_Descuento.Text:='0';
    Ed_TasaIva.text:='0';
    Ed_CodIva.text:='IVA1';
    Ed_IdArticulo.SetFocus;
//    SumarItems;
    CalcularImporte;
    CalcularTotales;
    BC_ActualizarItem.Enabled := false;
end;

PROCEDURE TFmComprobVta_add.CargarImpuesto;
var
 Lista: TStringList;
 i : integer;
 LV_Item : TListItem;
begin
  Lista := TStringList.create;
//  ReadDb_LstComprobImpuestos(CB_TipoComprob.text,Lista);
  Lista.Assign(LstImpuestos);
  LV_Impuestos.clear;

  For I := 0 to Lista.Count - 1 do
   If TImpuesto(Lista.Objects[i]).TipoComprob = CB_TipoComprob.text then   // craga solo los de este tipo de comprob.
   begin
    LV_Item := LV_Impuestos.items.Add;
    LV_Item.Data := Lista.Objects[i];
    LV_Item.Caption := TImpuesto(Lista.Objects[i]).id_impuesto;
    LV_Item.SubItems.Add( TImpuesto(Lista.Objects[i]).tipo );
    LV_Item.SubItems.Add( TImpuesto(Lista.Objects[i]).descripcion );
    LV_Item.SubItems.Add( FloatToStrF(0, ffFixed,18,2) ); //neto
    LV_Item.SubItems.Add( FloatToStrF(TImpuesto(Lista.Objects[i]).tasa, ffFixed,18,2) );//tasa
    LV_Item.SubItems.Add( FloatToStrF(0, ffFixed,18,2) ); //  iva
    LV_Item.SubItems.Add( FloatToStrF(0, ffFixed,18,2) ); // importe (neto+iva)
    LV_Item.SubItems.Add( TImpuesto(Lista.Objects[i]).aplica ); // neto o importe
   end;

end;

procedure TFmComprobVta_add.CalcularImporte;
var
 i : integer;
 Importe : Real;
begin
   for i := 0 to LV_Items.Items.Count - 1 do
    begin
     Importe :=  StrToFloat(LV_Items.Items[i].SubItems[1]) * StrToFloat(LV_Items.Items[i].SubItems[2]) ; // precio x cant
     Importe :=  Importe - (Importe * StrToFloat(LV_Items.Items[i].SubItems[3]) /100);  //restar  desceunto
     LV_Items.Items[i].SubItems[4] := FloatToStrF(Importe, fffixed,18,3);
    end;
end;

procedure TFmComprobVta_add.Ed_CantidadKeyPress(Sender: TObject; var Key: Char);
begin
 if KEY = #13 then begin  Key := #0; Ed_Descuento.SetFocus; exit; end;
 if not  (key in [#8,'0'..'9', FormatSettings.DecimalSeparator ]) then
    Key := #0;
end;

procedure TFmComprobVta_add.Ed_DescripKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13  then
   bEGIN
     Key := #0;
     Ed_Precio.SetFocus;
   end;
end;

procedure TFmComprobVta_add.Ed_DescuentoKeyPress(Sender: TObject; var Key: Char);
var
 LI : TListItem;
begin

   if KEY = #13 then
   begin
    LI := LV_Items.items.Add;
    LI.Caption   :=  Ed_IdArticulo.text;
    LI.SubItems.Add( Ed_Descrip.Text );
    LI.SubItems.Add( Ed_Precio.text );
    LI.SubItems.Add( Ed_Cantidad.Text);
    LI.SubItems.Add( Ed_Descuento.Text);
    LI.SubItems.Add( FloatToStrF(0, fffixed,18,3) ); //importe
    LI.SubItems.Add( Ed_TasaIva.text);
    Li.SubItems.Add( Ed_CodIva.text );
    Ed_IdArticulo.text:='0';
    Ed_Descrip.Text:='';
    Ed_PRECIO.Text:='';
    Ed_Cantidad.Text:='1';
    Ed_Descuento.Text:='0';
    Ed_TasaIva.text:='21';
    Ed_CodIva.text:='IVA1';
    Ed_IdArticulo.SetFocus;
    CalcularImporte;//SumarItems;
    CalcularTotales;
    Key := #0;
    exit;
   end;

  if not (key in [#8,'0'..'9',FormatSettings.DecimalSeparator ]) then
      Key := #0;
end;

Procedure TFmComprobVta_add.Ed_IdArticuloKeyPress(Sender: TObject; var Key: Char);
var
 Articulo : TArticulo;
 IdArticulo : String;
 PorcDesc: rEAL;
 //TasaIVA  : Double;
Begin
  Articulo := TArticulo.create;
  Articulo.IdArticulo := Ed_IdArticulo.text;
  If Key = #13 then
   Begin
    if FindArticuloId(Articulo) then
     begin
      Ed_Descrip.Text := Articulo.Descripcion;
      Ed_IdArticulo.Text := Articulo.IdArticulo;
      Ed_Precio.Text := FloatToStrF(Articulo.Precio, fffixed,18,3);
      //ReadDb_Cliente_RubroDesc( Articulo.Idrubro, Cliente.Id, PorcDesc); // Funcion booleana, si no hay desc viene cero en PorcDesc
      PorcDesc :=0;
      Ed_Descuento.text := FloatToStrF(PorcDesc, fffixed,18,3);
      //Ed_Precio.Text := FloatToStrF( StrToFloat(Ed_Precio.Text) - StrToFloat(Ed_Precio.Text) * PorcDesc/100 , FFFixed, 18,3 );

      Ed_CodIVA.text := Articulo.CodIva;
      LeerTasaIva( Articulo.CodIva , Articulo.TasaIva );
      Ed_TasaIVA.text := FloatToStrF(Articulo.TasaIVA, fffixed,18,2);
      if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Incl_IVA = 'SIN IVA' then
         Ed_Precio.Text := FloatToStrF( STRtOfLOAT(Ed_Precio.text) /  (1+ Articulo.Tasaiva/100) , ffFixed, 18,3);

      Ed_Descrip.setfocus;
     end else
     begin  // no se encontro id ,mostrar lista
       //IdArticulo :=  Ed_IdArticulo.text;
       If ShowArticuloList(Articulo) then   // busqueda en formulario
        begin
            Ed_Descrip.Text := Articulo.Descripcion;
            Ed_IdArticulo.Text := Articulo.IdArticulo;
            Ed_Precio.Text := FloatToStrF(Articulo.Precio, fffixed,18,3);
           // ReadDb_Cliente_RubroDesc( Articulo.Idrubro, Cliente.Id, PorcDesc); // Funcion booleana, si no hay desc viene ce,,2)ro en PorcDesc
            PorcDesc := 0;
            Ed_Descuento.text := FloatToStrF(PorcDesc, fffixed,18,3);
            //Ed_Precio.Text := FloatToStrF( StrToFloat(Ed_Precio.Text) - StrToFloat(Ed_Precio.Text) * PorcDesc/100 , FFFixed, 18,3 );

          Ed_CodIVA.text := Articulo.CodIva;
          LeerTasaIva( Articulo.CodIva , Articulo.TasaIva );
          Ed_TasaIVA.text := FloatToStrF(Articulo.TasaIVA, fffixed,18,2);
           if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Incl_IVA = 'SIN IVA' then
             Ed_Precio.Text := FloatToStrF( STRtOfLOAT(Ed_Precio.text) /  (1+ Articulo.Tasaiva/100) , ffFixed, 18,3);
        end;
        Ed_IdArticulo.SetFocus;
     end;
     Key := #0;
   End;
    Articulo.Free;

end;

procedure TFmComprobVta_add.Ed_NroSucChange(Sender: TObject);
begin
 ActNumeracion;
end;

procedure TFmComprobVta_add.CB_PtoVtaSelect(Sender: TObject);
begin
  ActNumeracion;
end;

procedure TFmComprobVta_add.Ed_PrecioExit(Sender: TObject);
var
 precio : Double;
begin
 If tryStrToFloat(Ed_precio.text, precio)   then
    Ed_precio.text := FloatTOStrF( precio, ffFixed, 18, 3);
end;

procedure TFmComprobVta_add.Ed_PrecioKeyPress(Sender: TObject; var Key: Char);
begin
 if KEY = #13 then begin  Key := #0; Ed_Cantidad.SetFocus; exit; end;
 if not  (key in [#8,'-', '0'..'9',FormatSettings.DecimalSeparator ]) then
      Key := #0;
end;

procedure TFmComprobVta_add.Ed_TotalValoresChange(Sender: TObject);
begin
  if Ed_Importe.Text <> ed_TotalValores.Text then
   begin
     Ed_Importe.Font.Color := clred;
     ed_TotalValores.Font.Color := clred;
   end else
   begin
     Ed_Importe.Font.Color := clblack;
     ed_TotalValores.Font.Color := clblack;
   end
end;

procedure TFmComprobVta_add.FormCreate(Sender: TObject);
var
 I : INTEGER;
begin
 Cliente := Tcliente.Create;
 Cliente.Id := 0;

 Ed_IdCliente.Text := '0';
 Ed_Fecha.date := Now;
 Ed_FechaVto.date := Now;
 CB_FmPagos.items.Assign(LstFormasdePago);
 CB_FmPagos.itemIndex:=0;

 CB_Vendedor.items.Assign(LstVendedores);
 Ed_VendedorId.text := AjusteObj.VendedorId;
 for I := 0 to CB_Vendedor.items.Count - 1 do
    If TVEndedor(CB_Vendedor.items.Objects[i]).IDVendedor =  StrToInt(Ed_VendedorId.text) then
      begin
        CB_Vendedor.ItemIndex  := i;
        break;
      end;

 CB_PtoVta.Items.Assign(LstPuntosVta);
 For i:=0 to  CB_PtoVta.Items.Count-1 do
  if TPuntoVta(CB_PtoVta.Items.Objects[i]).id_ptovta = AjusteObj.PtoVtaDefecto then
   begin
    CB_PtoVta.ItemIndex := i;
    Break;
   end;

  Cb_TipoComprob.ITEMS.Assign(LstTipoComprbvta);
  Cb_TipoComprob.ItemIndex := 0; // POR SI NO HAY COMP DEF PARA EL BOTON
  Lv_items.Clear; // porque da error el LV cuando esta vacio
  LV_Valores.Clear; //idem
  Lv_Impuestos.Clear;
end;


procedure TFmComprobVta_add.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente.Free;
  Action := caFree;
end;

procedure TFmComprobVta_add.BC_AgregarValorClick(Sender: TObject);
begin
  Bloqueo;
  PnValores.top := 20; PnValores.Left := 20;
  PnValores.visible := true;
  PnValores.BringToFront;
  CB_MedioTipo.ItemIndex := 0;
  Ed_MedioDescrip.text := '';
  Ed_MedioImporte.text := Ed_Importe.text; //FloatToStrF(0, ffFixed,18,2);
end;

procedure TFmComprobVta_add.BC_DelAllValorClick(Sender: TObject);
begin
  Lv_Items.clear;
  //sumarItems;
end;

procedure TFmComprobVta_add.BC_DelItemClick(Sender: TObject);
begin
 if lv_ITEMS.ItemIndex >= 0  then
  begin
   LV_Items.Items.Delete( LV_Items.ItemIndex );
   //sumarItems;
   CalcularTotales;
  end;
end;

procedure TFmComprobVta_add.BC_EfectivoTotalClick(Sender: TObject);
begin
   with LV_Valores.Items.Add do
   begin
    Caption := 'Efectivo';
    SubItems.add('Efectivo');
    SubItems.add( Ed_Importe.text );
   end;
   CalValores;
end;

procedure TFmComprobVta_add.BC_BorarValoresClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=LV_Valores.items.Count-1  downto 0 do
    if  LV_Valores.Items[i].Checked then
      LV_Valores.Items[I].Delete;
  CalValores;
end;

procedure TFmComprobVta_add.BC_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TFmComprobVta_add.BC_CancelarPrintClick(Sender: TObject);
begin
  PnValores.visible := false;
  DesBloqueo;
end;

procedure TFmComprobVta_add.CalcularTotales;
var
i,j: integer;
Neto,Importe : Real;
CodIVA  : String;
Tasa : Real;
begin

 For i:=0 TO LV_Impuestos.ITEMS.COUNT - 1 do // calcula los importes de iva de los art�culos
   begin
    if  LV_Impuestos.ITEMS[i].SubItems[0] = 'IVA' then   // Solo agrupa los precios que tienen alguna de las tasas de iva definidas en LV_totales
     begin
      CodIVA := LV_Impuestos.items[i].Caption; // CODIGO DE LA TASA ACTUAL DEL IVA
      importe := 0;
      Tasa :=   StrToFloat(LV_Impuestos.ITEMS[i].SubItems[3]); // tasa actual
      For j:=0 TO LV_Items.ITEMS.COUNT - 1 do // Recorre los items y suma los precios de los que tienen la TasaActual
       if LV_Items.Items[j].SubItems[6] = CodIVA then   // columna oculta en items
         importe := importe + StrToFloat(LV_Items.Items[j].SubItems[4]);
       if TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Incl_IVA = 'SIN IVA' then
        Begin
         LV_Impuestos.ITEMS[i].SubItems[2] := FloatToStrF( importe , ffFixed,18,3); // neto
         LV_Impuestos.ITEMS[i].SubItems[4] := FloatToStrF( importe*Tasa/100 , ffFixed,18,3); // importe iva
         LV_Impuestos.ITEMS[i].SubItems[5] := FloatToStrF( importe + StrToFloat(LV_Impuestos.ITEMS[i].SubItems[4]) ,fffixed,18,2); //neto+importe iva
        End
        else
        begin
         LV_Impuestos.ITEMS[i].SubItems[2] := FloatToStrF( importe/(1+Tasa/100)  , ffFixed,18,3); // neto
         LV_Impuestos.ITEMS[i].SubItems[4] := FloatToStrF( importe - (importe/(1+Tasa/100) ) , ffFixed,18,3); // importe iva
         LV_Impuestos.ITEMS[i].SubItems[5] := FloatToStrF( importe ,fffixed,18,2); //neto+importe iva
        End;
     end;
    end;

 For i:=0 TO LV_Impuestos.ITEMS.COUNT - 1 do // calcula los otros impuestos
   begin
    if  LV_Impuestos.ITEMS[i].SubItems[0] = 'IMPUESTO' then // Aplica el impuesto descuento a todo lo que no es IVA
     begin
      Tasa := StrToFloat(LV_Impuestos.ITEMS[i].SubItems[3]); //  TASA del impuesto
      Neto := 0;
      for j:= 0 to i-1 do // suma todos los importes anteriores
        if LV_Impuestos.ITEMS[j].SubItems[6] = 'NETO' then
          Neto := Neto + StrToFloat(LV_Impuestos.ITEMS[j].SubItems[2])//neto
         else
          Neto := Neto + StrToFloat(LV_Impuestos.ITEMS[j].SubItems[5]);//importe
      LV_Impuestos.ITEMS[i].SubItems[2] := FloatToStrF( Neto, ffFixed,18,2);
      LV_Impuestos.ITEMS[i].SubItems[4] := FloatToStrF( Neto*Tasa/100 , ffFixed,18,3);
      LV_Impuestos.ITEMS[i].SubItems[5] :=  FloatToStrF( Neto*Tasa/100 , ffFixed,18,3); //FloatToStrF( Neto + StrToFloat(LV_Impuestos.ITEMS[i].SubItems[4]) ,fffixed,18,2);
     end;
    end;

Importe := 0;
 For i:=0 TO LV_Impuestos.ITEMS.COUNT - 1 do
    Importe := Importe + StrToFloat(LV_Impuestos.ITEMS[i].SubItems[5]);
 Ed_importe.Text := FloatToStrF(Importe,ffFixed,18,2);

end;

procedure TFmComprobVta_add.CB_FmPagosChange(Sender: TObject);
begin
  GOP_CondVtaClick(Sender);
end;

procedure TFmComprobVta_add.CB_TipoComprobSelect(Sender: TObject);
begin
  CargarImpuesto;
  ActNumeracion;
  GOP_CondVta.visible := not   (TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Debcred = 'NO APLICA');
  PageControl1.Pages[1].TabVisible := not   (TComprobVtaTipos(CB_TipoComprob.items.Objects[CB_TipoComprob.itemIndex]).Tipo_Debcred = 'NO APLICA');
end;

procedure TFmComprobVta_add.CB_VendedorChange(Sender: TObject);
begin
   Ed_VendedorId.Text := IntTOStr( TVendedor( CB_Vendedor.Items.Objects[CB_Vendedor.ItemIndex]).IdVendedor );
end;

procedure TFmComprobVta_add.GOP_CondVtaClick(Sender: TObject);
begin
 if GOP_CondVta.ItemIndex = 1 then
   Ed_FechaVto.date := Now +  TFormaPAgo(CB_FmPagos.items.Objects[ CB_FmPagos.itemIndex]).DiasVto else
     Ed_FechaVto.date := Now;
 PageControl1.Pages[1].TabVisible := GOP_CondVta.ItemIndex = 0;
end;

procedure TFmComprobVta_add.LV_ItemsDblClick(Sender: TObject);
begin
  Ed_IdArticulo.text := LV_Items.Items[LV_Items.ItemIndex].caption ;
  Ed_Descrip.text := LV_Items.Items[LV_Items.ItemIndex].SubItems[0] ;
  Ed_Precio.text :=  LV_Items.Items[LV_Items.ItemIndex].SubItems[1] ;
  Ed_Cantidad.text :=  LV_Items.Items[LV_Items.ItemIndex].SubItems[2] ;
  Ed_Descuento.text :=  LV_Items.Items[LV_Items.ItemIndex].SubItems[3] ;
  Ed_Tasaiva.Text := LV_Items.Items[LV_Items.ItemIndex].SubItems[5] ;
  Ed_Codiva.Text := LV_Items.Items[LV_Items.ItemIndex].SubItems[6] ;
//Ed_Importe.text.Importe := ListView1.Items[ListView1.ItemIndex].SubItems[5] ;
  BC_Actualizaritem.Enabled := true;
end;

end.


