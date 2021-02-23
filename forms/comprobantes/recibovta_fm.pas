unit recibovta_fm;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Mask, DB, Buttons,
  Grids, Printers, ComCtrls, CategoryButtons, Contnrs,WideStrings,
  ImgList, ToolWin, System.ImageList ;

type
  TFmReciboVta = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Ed_NroFac: TEdit;
    Ed_Fecha: TDateTimePicker;
    Label4: TLabel;
    CB_PtoVta: TComboBox;
    Label11: TLabel;
    BC_ConsulComprob: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LV_Comprob: TListView;
    LV_Valores: TListView;
    Ed_DeudaTotal: TEdit;
    Ed_TotalIMputado: TEdit;
    lb_TipoComprob: TLabel;
    Label5: TLabel;
    Ed_Observ: TEdit;
    Label13: TLabel;
    BC_DelItem: TBitBtn;
    BC_SaldarSelect: TBitBtn;
    Label8: TLabel;
    Ed_TotalValores: TEdit;
    BitBtn1: TBitBtn;
    Ed_Imputar: TEdit;
    BC_SelectAll: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Ed_DeudaSelecc: TEdit;
    Ed_VendedorId: TEdit;
    Lb_etiqueta: TLabel;
    ImgList_Valores: TImageList;
    Label12: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    GOP_CondVta: TRadioGroup;
    Ed_IdCliente: TEdit;
    CB_FmPagos: TComboBox;
    Ed_Nombre: TEdit;
    CB_Vendedor: TComboBox;
    PnValores: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    Ed_MedioImporte: TLabeledEdit;
    Ed_MedioDescrip: TLabeledEdit;
    CB_MedioTipo: TComboBox;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    BC_EfectivoTotal: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB_VendedorChange(Sender: TObject);
    procedure BC_DelItemClick(Sender: TObject);
    procedure Ed_NroSucChange(Sender: TObject);
    procedure CB_PtoVtaSelect(Sender: TObject);
    procedure BC_ConsulComprobClick(Sender: TObject);
    procedure BC_SaldarSelectClick(Sender: TObject);
    procedure BC_BorarValoresClick(Sender: TObject);
    procedure BC_SelectAllClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure LV_ComprobMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ed_TotalIMputadoChange(Sender: TObject);
    procedure Bc_AgregarValorClick(Sender: TObject);
    procedure BC_CancelarPrintClick(Sender: TObject);
    procedure BC_AceptarPrintClick(Sender: TObject);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);
    procedure BC_EfectivoTotalClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalTotalAdeudado;
    procedure CalValores;
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
    procedure ActNumeracion;
  end;
var
  FmReciboVta : TFmReciboVta;

implementation
{$R *.DFM}
uses
  //class
  comprobvta,clientes,ClienteBuscar,vendedores,itemsvta,fondos,movimVta,
  cOMPROBvTAPtosVta,ComprobVtaDefinidos,
  //units
  Main,IniFiles,UtilsFunc,importsdll,
  PrintComprob;
var
 Cliente : TCliente;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmReciboVta.Bloqueo;
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
procedure TFmReciboVta.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
end;


procedure TFmReciboVta.ActNumeracion;
var
 Numero, Etiqueta :String;
begin
  LeerNroComp(CB_PtoVta.text, lb_TipoComprob.caption , Numero );
  Ed_NroFac.Text := Numero;
  Lb_etiqueta.Caption :=  'RE' ;
end;



procedure TFmReciboVta.BitBtn1Click(Sender: TObject);
var
 Imputado,SaldoAct,SaldoNue : double;
begin
 Imputado := StrToFloat(Ed_Imputar.text);
 if lv_Comprob.ItemIndex >= 0  then
  begin
   SaldoAct := StrToFloat(lv_Comprob.Items[lv_Comprob.ItemIndex].SubItems[3]);
   if Imputado > SaldoAct then
    begin
     mensaje('La imputaci�n es mayor que el saldo.','Imputar',3);
     exit;
    end;
   lv_Comprob.Items[lv_Comprob.ItemIndex].SubItems[4] := Ed_Imputar.text;
   SaldoNue := SaldoAct - Imputado;
   lv_Comprob.Items[lv_Comprob.ItemIndex].SubItems[5] := FloatToStrF(SaldoNue, fffixed,18,2);
   CalTotalAdeudado;
  end;
end;

procedure TFmReciboVta.BC_SelectAllClick(Sender: TObject);
var
  i: integer;
begin
   for i := 0 to LV_Comprob.Items.Count - 1 do
    LV_Comprob.Items[i].Checked := true;
end;

procedure TFmReciboVta.Bc_AceptarClick(Sender: TObject);
var
 Factura : TComprobante;
 Item : TItemFact;
 i:integer;
 DebCred : CHAR;
 TotalImputado,SaldoNuevo : double;
 Fondo : TFondo;
 Aplicacion : TAplicacion;
begin

  if not DIalogoBox('�Confima la emisi�n del comprobante RECIBO N� '+ Cb_PtoVta.Text+'-'+Ed_NroFac.text+ ' ?','Reciobos de venta',1,1) then
   exit;

  if not(Ed_TotalIMputado.text = Ed_TotalValores.text) then
   begin
     Mensaje('El importe impotado no coinc�de con los valores entregados','Recibo',3 );
     exit;
   end;

  Factura := TComprobante.Create;
  Factura.PtoVta := Cb_PtoVta.text;
  Factura.Numero := Ed_nroFac.Text;
  Factura.TipoComprob := 'RECIBO';
  Factura.Fecha := Ed_Fecha.Date;
  Factura.IdCliente := StrToInt(Ed_IdCliente.Text);
  Factura.Nombre := Ed_Nombre.Text;


 //Factura.CategImpos := Cb_Categoria.ItemIndex;
  Factura.IdVendedor := StrToInt(Ed_VendedorId.Text);

  Factura.Fondos := StrToFloat(Ed_TotalValores.TEXT);  // valores
  Factura.Importe := StrToFloat(Ed_TotalImputado.TEXT);
  Factura.DebCred := 'C';
  Factura.Saldo := 0;
  Factura.ListaItems := nil;

  Screen.Cursor := crHourGlass;
  Factura.TipoStock := 'N'; //no aplica
  ComprobVtaAgregar(Factura);   // vuelve con IdComprobante ya cargado


  // grabar imputaciones
  Aplicacion := TAplicacion.create;
  for i := 0 to LV_Comprob.Items.Count - 1 do
   if  LV_Comprob.Items[i].Checked then
    Begin
     TotalImputado :=  StrToFloat(LV_Comprob.Items[i].SubItems[4]);
     SaldoNuevo  :=  StrToFloat(LV_Comprob.Items[i].SubItems[5]);
     if TOtalImputado > 0 then
      begin
        Factura.Importe :=  TotalImputado;
//        Factura.Saldo :=  0;
        Factura.observaciones := 'Imputado a '+LV_Comprob.Items[i].SubItems[1];
         ComprobVtaAgregarMovim(Factura) ;
         Aplicacion.Comprobante := LV_Comprob.Items[i].SubItems[1];
         Aplicacion.ImporteOrig := StrToFloat(LV_Comprob.Items[i].SubItems[2]);
         Aplicacion.SaldoAct :=  StrToFloat(LV_Comprob.Items[i].SubItems[3]);
         Aplicacion.Aplicado :=  StrToFloat(LV_Comprob.Items[i].SubItems[4]);
         Aplicacion.SaldoNue :=  StrToFloat(LV_Comprob.Items[i].SubItems[5]);
         //Aplicacion.IdComprobante:=  StrToInt(LV_Comprob.Items[i].caption);
         Aplicacion.IdComprobante:=  Factura.Id; // Id recibo
        ComprobVtaGrabarAplicaciones(Aplicacion) ;
        ActualizarSaldo( LV_Comprob.Items[i].caption , SaldoNuevo);
       End;
    End;
  Aplicacion.free;
  // grabar valores
  Fondo := TFondo.Create;
  for i := 0 to LV_Valores.Items.Count - 1 do
   Begin
      Fondo.Fecha :=  Ed_Fecha.Date;
     // Fondo.Tipo := 'Cobro recibo'; //LV_Valores.Items.Item[i].Caption;
      Fondo.Descripcion := 'Cobro recibo - '+ LV_Valores.Items.Item[i].Caption +' - '+LV_Valores.Items.Item[i].SubItems[0];
      Fondo.Comprobante := 'RECIBO '+ Cb_PtoVta.text+' '+Ed_NrofAC.text;;
      Fondo.Importe := StrToFloat(LV_Valores.Items.Item[i].SubItems[1]);
      Fondo.Observaciones := '';
      Fondo.IdComprobante := Factura.Id;
      Fondo.IngEgr := 'I';
      FondosAgregar( Fondo );
     End;
   Fondo.Free;
   screen.Cursor := crdefault;



   FmPrintComprob.ImprimirRecibo(Factura.Id);

   Factura.free;
   GuardarNroComp( CB_PtoVta.text, 'RECIBO' , Ed_NroFac.Text );
   ActNumeracion;
   FmMain.StatusBarMain.Panels[0].Text := 'Recibo grabado!! - '+ CB_PtoVta.Text+' '+ Ed_NroFac.text ;

   close

end;

procedure TFmReciboVta.BC_AceptarPrintClick(Sender: TObject);
var
 Item : TListItem;
begin
   Item := LV_Valores.items.Add;
// LV_Item.Data := ListaCUotas.Objects[i];
   Item.Caption := CB_MedioTipo.text;
   Item.SubItems.add( Ed_MedioDescrip.text );
   Item.SubItems.Add( Ed_MedioImporte.text  );
   PnValores.visible := false;
   DesBloqueo;

  CalValores;

end;

procedure TFmReciboVta.Bc_AgregarValorClick(Sender: TObject);
begin
  Bloqueo;
  PnValores.top := 20; PnValores.Left := 20;
  PnValores.visible := true;
  PnValores.BringToFront;
  CB_MedioTipo.ItemIndex := 0;
  Ed_MedioDescrip.text := '';
  Ed_MedioImporte.text := Ed_TotalIMputado.text; //FloatToStrF(0, ffFixed,18,2);
end;

procedure TFmReciboVta.BC_BorarValoresClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=LV_Valores.items.Count-1  downto 0 do
    if  LV_Valores.Items[i].Checked then
      LV_Valores.Items[I].Delete;
  CalValores;
end;

procedure TFmReciboVta.BC_CancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFmReciboVta.BC_CancelarPrintClick(Sender: TObject);
begin
  PnValores.visible := false;
  DesBloqueo;
end;

procedure TFmReciboVta.BC_ConsulComprobClick(Sender: TObject);
var
 Lista : TStringList;
 i : integer;
begin
  Lista := TStringList.create;
  ReadDb_ComprobAdeudados( Ed_IdCliente.text, Lista );

  Lv_Comprob.Clear;
  for i:=0 to Lista.Count - 1 do
   Begin
    with Lv_Comprob.Items.Add do begin
     Caption:= IntToStr(TMovimVta(Lista.Objects[i]).IdMovimiento);
     SubItems.Add(  TMovimVta( Lista.Objects[i]).Fecha );
     SubItems.Add(  TMovimVta(Lista.Objects[i]).Comprobante );
     SubItems.Add(  FloatToStrF(TMovimVta(Lista.Objects[i]).Importe, fffixed,18,2) );
     SubItems.Add(  FloatToStrF(TMovimVta(Lista.Objects[i]).Saldo, fffixed,18,2) );
     SubItems.Add(  FloatToStrF(0, fffixed,18,2) );
     SubItems.Add(  FloatToStrF(0, fffixed,18,2) );
    end;
   End;
  Lista.Free;
  CalTotalAdeudado;
end;

procedure TFmReciboVta.CalTotalAdeudado;
var
 i : integer;
 DeudaTotal,DeudaSelecc,TotalImputado : double;
begin
 DeudaTotal := 0;DeudaSelecc:=0;TotalImputado:=0;
  for i := 0 to LV_Comprob.Items.Count - 1 do
   begin
    if  LV_Comprob.Items[i].Checked then
     DeudaSelecc := DeudaSelecc + StrToFloat(LV_Comprob.Items[i].SubItems[3]);
    DeudaTotal := DeudaTotal + StrToFloat(LV_Comprob.Items[i].SubItems[3]);
    TotalImputado := TotalImputado + StrToFloat(LV_Comprob.Items[i].SubItems[4]);
   end;

   Ed_DeudaTotal.text :=  FloatToStrF(DeudaTotal,fffixed,18,2);
   Ed_DeudaSelecc.text :=  FloatToStrF(DeudaSelecc,fffixed,18,2);
   Ed_TotalImputado.text :=  FloatToStrF(TotalImputado,fffixed,18,2);
 End;


procedure TFmReciboVta.CalValores;
var
 i : integer;
 TotalValores : Real;
begin
 TotalValores := 0;
  for i := 0 to LV_Valores.Items.Count - 1 do
   TotalValores := TotalValores + StrToFloat(LV_Valores.Items[i].SubItems[1]);
   Ed_TotalValores.text :=  FloatToStrF(TotalValores,ffFixed,18,2);
End;

procedure TFmReciboVta.Ed_NroSucChange(Sender: TObject);
begin
 ActNumeracion;
end;

procedure TFmReciboVta.CB_PtoVtaSelect(Sender: TObject);
begin
  ActNumeracion;
end;

procedure TFmReciboVta.Ed_TotalIMputadoChange(Sender: TObject);
begin
  if Ed_TotalImputado.Text <> ed_TotalValores.Text then
   begin
     Ed_TotalImputado.Font.Color := clred;
     ed_TotalValores.Font.Color := clred;
   end else
   begin
     Ed_TotalImputado.Font.Color := clblack;
     ed_TotalValores.Font.Color := clblack;
   end
end;

procedure TFmReciboVta.FormCreate(Sender: TObject);
VAR
 i: integer;

begin
 Cliente := Tcliente.Create;
 Cliente.Id := 0;
 Ed_IdCliente.Text := '0';
 Ed_Fecha.date := Now;

 LV_Valores.Clear;
 LV_Comprob.clear;
  CB_Vendedor.items.Assign(LstVendedores);
 Ed_VendedorId.text := ajusteObj.VendedorID;
 for I := 0 to CB_Vendedor.items.Count - 1 do
     if TVendedor(CB_Vendedor.items.Objects[i]).IDVendedor =  StrToInt(Ed_VendedorId.text) then
      begin
        CB_Vendedor.ItemIndex  := i;
        break;
      end;
 CB_PtoVta.Items.Assign(LstPuntosVta);
 For i:=0 to  CB_PtoVta.Items.Count-1 do
  if TPuntoVta(CB_PtoVta.Items.Objects[i]).id_ptovta = ajusteObj.PtoVtaDefecto then
   begin
    CB_PtoVta.ItemIndex := i;
    Break;
   end;
  ActNumeracion;
end;


procedure TFmReciboVta.LV_ComprobMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
  // Did we hit a checkbox? If so, make sure the item it
  // represents is selected.
  Item := LV_Comprob.GetItemAt(X, Y);
  if Item <> nil then
    if LV_Comprob.Selected <> Item then
      LV_Comprob.Selected := Item;
 CalTotalAdeudado;
end;

procedure TFmReciboVta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmReciboVta.BC_DelItemClick(Sender: TObject);
begin
 if lv_Comprob.ItemIndex >= 0  then
  begin
   lv_Comprob.Items.Delete( lv_Comprob.ItemIndex );
   CalTotalAdeudado;
  end;
end;

procedure TFmReciboVta.BC_EfectivoTotalClick(Sender: TObject);
begin
   with LV_Valores.Items.Add do
   begin
    Caption := 'Efectivo';
    SubItems.add('Efectivo');
    SubItems.add( Ed_TotalIMputado.text );
   end;
   CalValores;
end;

procedure TFmReciboVta.BC_SaldarSelectClick(Sender: TObject);
var
 TOtalaImputar,Saldo : double;
 i:integer;
begin

   TOtalAImputar := StrToFloat(Ed_Imputar.text);
   for i := 0 to LV_Comprob.Items.Count - 1 do
   if  LV_Comprob.Items[i].Checked then
    Begin
     Saldo :=  StrToFloat(LV_Comprob.Items[i].SubItems[3]);
     if TOtalAImputar > Saldo then
      begin
        TOtalAImputar := TOtalAImputar - Saldo;
        LV_Comprob.Items[i].SubItems[5] := '0' + FormatSettings.DecimalSeparator +'00'; //nuevo saldo
        LV_Comprob.Items[i].SubItems[4] := FloatToStr(Saldo); // aplicado
      end else
       Begin
        LV_Comprob.Items[i].SubItems[5] := FloatToStrF(Saldo - TOtalAImputar, fffixed,18,2);
        LV_Comprob.Items[i].SubItems[4] := FloatToStr(TOtalAImputar);
        TOtalAImputar := 0;
       End;
    End;
    CalTotalAdeudado;
end;

procedure TFmReciboVta.CB_VendedorChange(Sender: TObject);
begin
   Ed_VendedorId.Text := IntTOStr( TVendedor( CB_Vendedor.Items.Objects[CB_Vendedor.ItemIndex]).IdVendedor );
end;

end.


