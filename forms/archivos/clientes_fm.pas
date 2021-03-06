
unit clientes_fm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Datasnap.Provider, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.WinXCtrls, Vcl.WinXPickers, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, frxClass, frxDBSet,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;


type
  TFmClientes = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    TB_add: TToolButton;
    TB_edit: TToolButton;
    TB_Delete: TToolButton;
    ListView1: TListView;
    Panel2: TPanel;
    Ed_busqueda: TEdit;
    Pn_EditAdd: TPanel;
    Ed_IdCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Ed_Nombre: TEdit;
    Label16: TLabel;
    Ed_categImpos: TEdit;
    Cb_CategImpos: TComboBox;
    Ed_NroDoc: TEdit;
    Label11: TLabel;
    CB_TipoDoc: TComboBox;
    Label12: TLabel;
    CB_ListaCiudades: TComboBox;
    Label9: TLabel;
    Label8: TLabel;
    Ed_CodPostal: TEdit;
    Ed_Direccion: TEdit;
    Label6: TLabel;
    Ed_Telefono: TEdit;
    Label4: TLabel;
    Ed_email: TEdit;
    Label13: TLabel;
    Ed_Contacto1: TEdit;
    Label15: TLabel;
    Ed_Contacto2: TEdit;
    Label14: TLabel;
    Label20: TLabel;
    Ed_TelCont2: TEdit;
    Label10: TLabel;
    Ed_TelCont1: TEdit;
    Ed_FormaPago: TEdit;
    Cb_FormaPAgo: TComboBox;
    Label18: TLabel;
    Label21: TLabel;
    Ed_LimiteCredito: TEdit;
    CV_Activo: TCheckBox;
    CB_HabCtaCte: TCheckBox;
    Me_Observaciones: TMemo;
    Label3: TLabel;
    lb_FechaAlta: TLabel;
    lb_UltAct: TLabel;
    lb_UltimoPago: TLabel;
    lb_UltimaVta: TLabel;
    Bc_Aceptar: TBitBtn;
    BC_Cancelar: TBitBtn;
    TS_SoloActivos: TToggleSwitch;
    ToolButton1: TToolButton;
    StatusBar1: TStatusBar;
    TB_Print: TToolButton;
    CB_ShowObs: TCheckBox;
    ToolButton3: TToolButton;
    Pn_Imprimir: TPanel;
    GOP_TipoReporte: TRadioGroup;
    BC_AceptarPrint: TBitBtn;
    BC_CancelarPrint: TBitBtn;
    CV_PrintSoloActivos: TCheckBox;
    CV_PrintPagJuntos: TCheckBox;
    Label5: TLabel;
    FDQuery1: TFDQuery;
    ToolButton2: TToolButton;
    CB_TipoComprob: TComboBox;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    frxReport1: TfrxReport;
    Ds_Clientes: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_DeleteClick(Sender: TObject);
    procedure TB_readdbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure Ed_busquedaChange(Sender: TObject);
    procedure CB_ListaCiudadesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Cb_CategImposChange(Sender: TObject);
    procedure Cb_FormaPAgoChange(Sender: TObject);
    procedure d3_ListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Bc_AceptarClick(Sender: TObject);
    procedure TB_editClick(Sender: TObject);
    procedure BC_CancelarClick(Sender: TObject);
    procedure TB_addClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure BC_AceptarPrintClick(Sender: TObject);
    procedure BC_CancelarPrintClick(Sender: TObject);
    procedure TB_PrintClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyFilter(const S: string);
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
  end;

var
  FmClientes: TFmClientes;

implementation
{$R *.dfm}

uses
 //class
 clientes, ciudades,formaspago,categImpositiva,   ClipBrd,  ShellApi,
 main,rp_utils,UtilsFunc, importsdll,  eventos,
 clientesCtaCte_fm, ComprobvtaAdd_fm, recibovta_fm,
  ajustes;

var
 // BusqIndiceDesde : integer;
  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmClientes.Bloqueo;
begin
  //FmClientes
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
procedure TFmClientes.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
end;

procedure TFmClientes.ApplyFilter(const S: string);
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


procedure TFmClientes.Bc_AceptarClick(Sender: TObject);
var
 Cliente : TCliente;
begin
  Cliente := TCliente.create ;

  Cliente.Id := StrToInt(Ed_IdCliente.text);
  Cliente.Nombre := Ed_Nombre.text;
  Cliente.Direccion := Ed_Direccion.text;
  Cliente.CodPostal := Ed_CodPostal.text;
  Cliente.Telefono := Ed_telefono.text;
  cliente.email := Ed_email.text;
  Cliente.TipoDoc :=  Copy(CB_TipoDoc.text,  Pos('(', CB_TipoDoc.text)+1, 2) ;
  Cliente.NroDoc := Ed_NroDoc.text;
  Cliente.CategImpos := TCategImpos(  Cb_CategImpos.items.OBJECTs[Cb_CategImpos.ItemIndex]).idcategoria;
  Cliente.HabCtaCte :=  CB_HabCtaCte.Checked;
  Cliente.FormaPago := Ed_FormaPago.text;
  Cliente.ShowObs := CB_ShowObs.Checked;
  Cliente.Activo := CV_Activo.Checked;
  Cliente.Contacto1 := Ed_Contacto1.text;
  Cliente.TelCont1 := Ed_TelCont1.text;
  Cliente.Contacto2 := Ed_Contacto2.text;
  Cliente.TelCont2 := Ed_TelCont2.text;
  Cliente.limiteCredito := StrToFloat(Ed_LimiteCredito.text);
  Cliente.Observaciones := Me_Observaciones.Text;

  if EDITAR then
   Begin
    ClienteEditar(Cliente);
    ListaActiva.Objects[ListView1.ItemIndex] := Cliente;
    EventosAgregar('Editar cliente '+ Ed_IdCliente.text  );

   End
  else
   Begin
    ClienteAgregar(Cliente);
    ListaCompleta.AddObject(Cliente.Nombre, Cliente);
    ListaActiva.AddObject(Cliente.Nombre, Cliente);
    ListView1.Items.Count := ListaActiva.Count;
    StatusBar1.Panels[0].text := 'Registros: '+ IntToStr(ListaActiva.Count);
   End;


 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmClientes.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmClientes.BC_CancelarPrintClick(Sender: TObject);
begin
 desbloqueo;
 Pn_Imprimir.Visible := false;
end;

procedure TFmClientes.BC_AceptarPrintClick(Sender: TObject);
begin

  FDQuery1.close;
  FDQuery1.sql.Clear;
  FDQuery1.SQL.add('SELECT ciudades.Nombre As CiudNombre, ciudades.CodPostal,ciudades.Provincia, clientes.*  ');
  FDQuery1.SQL.add(' FROM clientes JOIN ciudades ON clientes.CodPostal=ciudades.CodPostal ');
  if CV_PrintSoloActivos.Checked then
  FDQuery1.SQL.add(' WHERE activo=TRUE');


  if GOP_TipoReporte.ItemIndex = 0 then
   Begin
    FDQuery1.SQL.add(' ORDER BY clientes.Nombre');
    frxReport1.LoadFromFile( AjusteObj.CarpReportes+'\clientes.fr3')
   End
    else
   Begin
    FDQuery1.SQL.add(' ORDER BY CiudNombre, Clientes.Nombre');
    frxReport1.LoadFromFile(AjusteObj.CarpReportes+'\clientesxciudad.fr3');
    TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_PrintPagJuntos.Checked ;

   End;
  FDQuery1.open;

  SetUpReporte(frxReport1,'Clientes');
  frxReport1.ShowReport;
  Desbloqueo;
  Pn_imprimir.Visible := false;
end;

procedure TFmClientes.Cb_CategImposChange(Sender: TObject);
begin
  Ed_CategImpos.text := TCategImpos(CB_CategImpos.items.objects[CB_CategImpos.ItemIndex]).IdCategoria;
end;

procedure TFmClientes.Cb_FormaPAgoChange(Sender: TObject);
begin
  Ed_FormaPAgo.text := TFormaPAgo(CB_FormaPAgo.items.objects[CB_FormaPAgo.ItemIndex]).Id;
end;

procedure TFmClientes.CB_ListaCiudadesChange(Sender: TObject);
begin
  Ed_CodPostal.text := TCiudad(CB_ListaCiudades.items.objects[CB_ListaCiudades.ItemIndex]).CodPostal;
end;

procedure TFmClientes.d3_ListViewCustomDrawItem(Sender: TCustomListView;
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

procedure TFmClientes.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmClientes.FormCreate(Sender: TObject);
var
  ListaAux : TStringList;
  i: Integer;

begin

 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;

 ListaAux := TStringList.Create;
 CiudadesLeerListado(ListaAux);
 for i := 0 to ListaAux.Count -1 do
   CB_ListaCiudades.items.AddObject( TCiudad(ListaAux.OBJECTs[i]).Nombre , ListaAux.OBJECTs[i] );

 ListaAux.Clear;
 ReadDb_LstCategImpos(ListaAux);
 for i := 0 to ListaAux.Count -1 do
   CB_CategImpos.items.AddObject( TCategImpos(ListaAux.OBJECTs[i]).Descripcion , ListaAux.OBJECTs[i] );

 ListaAux.Clear;
 FormaPagoLeerListado(ListaAux,'activo');
 for i := 0 to ListaAux.Count -1 do
   CB_FormaPago.items.AddObject( TFormaPago(ListaAux.OBJECTs[i]).Descripcion , ListaAux.OBJECTs[i] );

 CB_FormaPago.items.Assign(LstFormasdePago);

 //ListaAux.Free;

 Cb_TipoComprob.ITEMS.Assign(LstTipoComprbvta);
 Cb_TipoComprob.Text := 'Emitir comprobante';

 TB_readdb.Click;
end;


procedure TFmClientes.FormDestroy(Sender: TObject);
begin
  ListaCompleta.Free;
  ListaActiva.Free;
end;



procedure TFmClientes.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
   Caption := IntToStr( TCliente(ListaActiva.objects[Item.Index]).Id);
   SubItems.Add( TCliente(ListaActiva.objects[Item.Index]).Nombre );
   SubItems.Add( TCliente(ListaActiva.objects[Item.Index]).Direccion);
   SubItems.Add( TCliente(ListaActiva.objects[Item.Index]).telefono);
   SubItems.Add( TCliente(ListaActiva.objects[Item.Index]).Codpostal);

   end;
end;

procedure TFmClientes.ListView1DblClick(Sender: TObject);
begin
  TB_editClick(Sender);
end;

procedure TFmClientes.TB_readdbClick(Sender: TObject);
begin
 ListaCompleta.Clear;
  if TS_SoloActivos.State = tssOn then    // solo activos
   ClientesLeerListado(ListaCompleta, 'activo')
 else
   ClientesLeerListado(ListaCompleta, 'todos');
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);
 ListView1.ItemIndex := 0;
end;

procedure TFmClientes.ToolButton1Click(Sender: TObject);
begin
  FmCtaCteClientes := TFmCtaCteClientes.create(Application);
  FmCtaCteClientes.Lb_idCliente.Caption := ListView1.Items[ListView1.ItemIndex].caption;
  FmCtaCteClientes.Lb_NombreClie.Caption := ListView1.items[ListView1.ItemIndex].SubItems[0];
  FmCtaCteClientes.TB_readdbClick(sender);
  FmCtaCteClientes.showmodal;
end;

procedure TFmClientes.ToolButton2Click(Sender: TObject);
var
 FmComprobVta1 : TFmComprobVta_add;
 FmReciboVta : TFmReciboVta;
begin

    If CB_TipoComprob.text = 'RECIBO' THEN
     BEGIN
      FmReciboVta := TFmReciboVta.create(Application);
      FmReciboVta.Caption := CB_TipoComprob.text;
      FmReciboVta.ActNumeracion;
      FmReciboVta.Ed_IdCliente.text := ListView1.Items[ListView1.itemIndex].Caption;
      FmReciboVta.Ed_Nombre.text := ListView1.Items[ListView1.itemIndex].SubItems[0];
      FmReciboVta.showModal;
     END else
     bEGIN
      FmComprobVta1 := TFmComprobVta_add.create(Application);
      FmComprobVta1.Caption := CB_TipoComprob.text;
      FmComprobVta1.CB_TipoComprob.text  := CB_TipoComprob.text;
      FmComprobVta1.ActNumeracion;
      FmComprobVta1.Ed_IdCliente.text := ListView1.Items[ListView1.itemIndex].Caption;
      FmComprobVta1.Ed_Nombre.text := ListView1.Items[ListView1.itemIndex].SubItems[0];
      FmComprobVta1.CB_TipoComprobSelect(Sender);
      FmComprobVta1.showModal;
     end;




end;

procedure TFmClientes.ToolButton5Click(Sender: TObject);
var
  sl: TStringlist;
 i, k: integer;
 s: string;
  item: TListItem;
 begin
    sl:= TStringlist.Create;
    try
      For i := 0 To ListView1.items.count-1 Do Begin
        item := ListView1.Items[i];
        S:= item.Caption;
        For k := 0 To item.SubItems.Count-1 Do
          S:= S + #9 + item.Subitems[k];
        sl.Add( S );
      End; { For }
      Clipboard.AsText := sl.Text;
    finally
      sl.free
    end;

end;

procedure TFmClientes.ToolButton6Click(Sender: TObject);
begin
  RunApp(AjusteObj.SoftPadronAfip);
end;

procedure TFmClientes.ToolButton7Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink :=  'https://api.whatsapp.com/send?phone='+ TCliente(ListaActiva.objects[ListView1.ItemIndex]).telefono;
  ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),  nil, nil, SW_SHOW);
end;

procedure TFmClientes.TB_PrintClick(Sender: TObject);
begin
   Bloqueo;
   Pn_Imprimir.Visible := true;
   Pn_Imprimir.BringToFront;
end;

procedure TFmClientes.TB_addClick(Sender: TObject);
begin
  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;
  Pn_EditAdd.TOP:= 30;
  Pn_EditAdd.LEFT := 30;

  Ed_IdCliente.ReadOnly := false;
   Ed_IdCliente.Text := IntToStr( UltimoID('clientes')+1) ;

  Ed_Nombre.text := '';
  Ed_Direccion.text := '';
  Ed_CodPostal.text := '';
  //CIUDADES;
  CB_ListaCiudades.ItemIndex := -1;
  Ed_telefono.text := '';
  Ed_email.text := '';
  // TIPO DE DOCUMENTO
  CB_TipoDoc.Text := '';

  Ed_NroDoc.text := '';
  Ed_categImpos.Text :=  '';
  //CATEGORIA IMPOSITIVA;
  Cb_CategImpos.ItemIndex := -1;
  //FORMA DE PAGO;
  Ed_FormaPago.text := '';
  CB_FormaPago.ItemIndex := -1;
  CB_HabCtaCte.State := cbUnchecked;
  CB_ShowObs.State := cbUnchecked;
  CV_Activo.State := cbChecked;
  Ed_Contacto1.text := '';
  Ed_TelCont1.text  := '';
  Ed_Contacto2.text := '';
  Ed_TelCont2.text  := '';
  Ed_LimiteCredito.text := FloatToStrF(0, ffFixed,18,2);
  Me_Observaciones.clear;
end;

procedure TFmClientes.TB_DeleteClick(Sender: TObject);
var
 IdCliente : Integer;
begin
 IdCliente :=  StrToInt( Listview1.items[Listview1.ItemIndex].Caption);
 if IdCliente = 0 then begin
   Mensaje('No se puede borrar este cliente.','Borrar Cliente',3);
   Exit;
 end;

 if DialogoBox('�Confirma borrar el cliente: '+ Listview1.items[Listview1.ItemIndex].Caption +' ?','Borrar Cliente', 1,1)  then
  IF ClienteBorrar(IdCliente) Then
   BEgin
   // ListaActiva.Delete(Listview1.ItemIndex);
    TCliente(ListaActiva.objects[Listview1.ItemIndex]).Nombre  := '**** BORRADO ******';
    Listview1.items.Count := ListaActiva.Count;
   End;

end;

procedure TFmClientes.TB_editClick(Sender: TObject);
var
  Cliente : TCliente;
  i : integer;
begin
   Editar := true;
   Bloqueo;
   Pn_EditAdd.TOP:= 30;
   Pn_EditAdd.LEFT := 30;
   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;

   Cliente := TCliente.create;
   Cliente.Id := StrToInt( Listview1.items[Listview1.ItemIndex].Caption);
   ClientesLeerCliente(Cliente);

   Ed_IdCliente.text := IntToStr(Cliente.Id);
   Ed_IdCliente.ReadOnly := true;
   Ed_Nombre.text := Cliente.Nombre;
   Ed_Direccion.text := Cliente.Direccion;
   Ed_CodPostal.text := Cliente.CodPostal;
   //CIUDADES;
   CB_ListaCiudades.ItemIndex := -1;
   For i:=0 to  CB_ListaCiudades.Items.Count-1 do
    if TCiudad(CB_ListaCiudades.Items.Objects[i]).CodPostal = Ed_CodPostal.text then
     begin
       CB_ListaCiudades.ItemIndex := i;
       Break;
     end;
   Ed_telefono.text := Cliente.telefono;
   Ed_email.text := Cliente.email;
    // TIPO DE DOCUMENTO
    For i:=0 to  CB_TipoDoc.Items.Count-1 do
     if Pos(Cliente.TipoDoc, CB_TipoDoc.Items[i] )=1 then
        CB_TipoDoc.ItemIndex := i;

   Ed_NroDoc.text := Cliente.NroDoc;
   Ed_categImpos.Text :=  Cliente.CategImpos;
   //CATEGORIA IMPOSITIVA;
   Cb_CategImpos.ItemIndex := -1;
   For i:=0 to  Cb_CategImpos.Items.Count-1 do
    if TcategImpos(CB_categImpos.Items.Objects[i]).idcategoria = Ed_categImpos.text then
     begin
       CB_categImpos.ItemIndex := i;
       Break;
     end;
    //FORMA DE PAGO;
   Ed_FormaPago.text := Cliente.FormaPago;
   CB_FormaPago.ItemIndex := -1;
   For i:=0 to  CB_FormaPago.Items.Count-1 do
    if TFormaPago(CB_FormaPago.Items.Objects[i]).Id = Ed_FormaPago.text then
     begin
       CB_FormaPago.ItemIndex := i;
       Break;
     end;
   If Cliente.HabCtaCte then CB_HabCtaCte.State := cbChecked else  CB_HabCtaCte.State := cbUnchecked;
   if Cliente.UltimaVta > 0 then
     lb_UltimaVta.caption := '�ltima vta.: '+ FormatDateTime('dd/mm/yyyy' , Cliente.UltimaVta) else lb_UltimaVta.caption := '�ltima vta.:' ;
   if Cliente.UltimaPago > 0 then
    lb_UltimoPago.caption := '�ltima vta.: '+ FormatDateTime('dd/mm/yyyy' , Cliente.UltimaPago) else lb_UltimoPago.caption := '�ltima vta.:' ;
   //GOP_ListaPrecios.ItemIndex := TCliente(Lista.Objects[Item.Index]).ListaPrec-1;

   If Cliente.ShowObs then CB_ShowObs.State := cbChecked else  CB_ShowObs.State := cbUnchecked;
   If Cliente.activo then CV_Activo.State := cbChecked else  CV_Activo.State := cbUnchecked;
    Ed_Contacto1.text :=  Cliente.Contacto1;
   Ed_TelCont1.text  := Cliente.TelCont1;
   Ed_Contacto2.text := Cliente.Contacto2;
   Ed_TelCont2.text  := Cliente.TelCont2;
   Ed_LimiteCredito.text := FloatToStrF(Cliente.LimiteCredito, ffFixed,18,2);
   if Cliente.UltimaAct > 0 then
    lb_UltAct.caption := '�ltima act.: '+ FormatDateTime('dd/mm/yyyy' , Cliente.UltimaAct) else lb_UltAct.caption := '�ltima act.:' ;
   if Cliente.FechaAlta > 0 then
    lb_FechaAlta.caption := '�ltima alta: '+ FormatDateTime('dd/mm/yyyy' ,Cliente.FechaAlta) else lb_FechaAlta.caption := 'Fecha alta:' ;
   Me_Observaciones.clear;
    Me_Observaciones.text := Cliente.Observaciones;


   Cliente.Free;
end;

end.

