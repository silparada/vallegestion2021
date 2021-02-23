unit main;

interface

uses Windows,Data.DB, Data.Win.ADODB, System.ImageList, Vcl.ImgList, Vcl.Controls,vcl.forms,
  Vcl.Menus, System.Classes, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ToolWin
 ,SysUtils ,Vcl.Graphics

  ,comprobVta, Vcl.WinXCtrls, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  dialogs ,usuarios  ,ajustes, Vcl.ButtonGroup;



type
  TFmMain = class(TForm)
    StatusBarMain: TStatusBar;
    Tb_Opciones: TToolBar;
    ToolButton19: TToolButton;
    ToolButton35: TToolButton;
    RelativePanel1: TRelativePanel;
    PageControlMain: TPageControl;
    TS_Inicio: TTabSheet;
    BC_CerrarTab: TButton;
    PnLogin: TPanel;
    Label1: TLabel;
    Ed_UsuarioId: TLabeledEdit;
    Ed_UsuarioPass: TLabeledEdit;
    BC_Login: TButton;
    BC_CancelLogin: TButton;
    ImageCollection1: TImageCollection;
    VImg_48: TVirtualImageList;
    VImg_24: TVirtualImageList;
    SplitView2: TSplitView;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    Label2: TLabel;
    RE_SysMsg: TRichEdit;
    Panel1: TPanel;
    Img_Logo: TImage;
    Menu_Comprobantes: TPopupMenu;
    ToolButton8: TToolButton;
    Pn_CambiarPass: TPanel;
    Label3: TLabel;
    Ed_PassActual: TLabeledEdit;
    Ed_PassNuevo1: TLabeledEdit;
    BC_AceptarCambPAss: TButton;
    BC_CancelarCambPAss: TButton;
    Ed_PassNuevo2: TLabeledEdit;
    Pn_Usuario: TPanel;
    lb_UserNombre: TLabel;
    TB_Main: TToolBar;
    TB_CompVta1: TToolButton;
    TB_CompVta2: TToolButton;
    TB_CompVta3: TToolButton;
    TB_CompVta4: TToolButton;
    ToolButton5: TToolButton;
    Tb_LstComprob: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton27: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton18: TToolButton;
    TB_EmisionFiscal: TToolButton;
    ToolButton29: TToolButton;
    ToolButton7: TToolButton;
    ToolButton17: TToolButton;
    ToolButton4: TToolButton;
    Button1: TButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Menu_Usuario: TPopupMenu;
    MenuLogInOut: TMenuItem;
    MenuCambPass: TMenuItem;
    MenuEventos: TMenuItem;
    PnTop: TPanel;
    Image1: TImage;
    FDConnection1: TFDConnection;
    lb_Servidor: TLabel;
    Lb_BAseDatos: TLabel;
    ToolButton12: TToolButton;
    ButtonGroup1: TButtonGroup;
    procedure ShowFmArticulosExecute(Sender: TObject);
    procedure ShowFmComprobVta1Execute(Sender: TObject);
    procedure ShowFmRubrosExecute(Sender: TObject);
    procedure SHowFmClientesExecute(Sender: TObject);
    procedure ShowFmRecibosVtaExecute(Sender: TObject);
    procedure ShowUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CerrarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure ShowHint(Sender: TObject);
    procedure ShowFmCondVtaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowFmCajaExecute(Sender: TObject);
    procedure ShowLstCompVtaExecute(Sender: TObject);
    procedure ShowFmGrVentasExecute(Sender: TObject);
    procedure ShowFmEventosExecute(Sender: TObject);
    procedure Lb_AccesoRap1Click(Sender: TObject);
    procedure Lb_AccesoRap1MouseEnter(Sender: TObject);
    procedure Lb_AccesoRap1MouseLeave(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Lb_AccesoRap3Click(Sender: TObject);
    procedure Lb_AccesoRap2Click(Sender: TObject);
    procedure ShowFmComprobVta2Execute(Sender: TObject);
    procedure TB_CompVta3Click(Sender: TObject);
    procedure CrearCompVtaFromMenu(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure BC_CerrarTabClick(Sender: TObject);
    procedure BC_LoginClick(Sender: TObject);
    procedure BC_CancelLoginClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure TB_CompVta4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure BC_AceptarCambPAssClick(Sender: TObject);
    procedure BC_CancelarCambPAssClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure TB_EmisionFiscalClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure MenuLogInOutClick(Sender: TObject);
    procedure MenuCambPassClick(Sender: TObject);
    procedure MenuEventosClick(Sender: TObject);
    procedure ToolButton35Click(Sender: TObject);
    procedure Tb_LstComprobClick(Sender: TObject);
    procedure ButtonGroup1Items0Click(Sender: TObject);
  private
    { Private declarations }
     // FmCtaCteClientes: TFmCtaCteClientes;

//    Function EstaCreadoComprobVta(NombreClase,TipoComprob : string) : boolean;
    procedure Bloqueo;
    procedure DesBloqueo;
  public
    { Public declarations }
     Function EstaCreado(Caption : string) : boolean;
    var
     ConexionDB : Boolean;
  end;

var
  FmMain: TFmMain;
  Usuario : TUsuario;
  LstFormasdePago,LstTipoComprbvta,LstPuntosVta,LstImpuestos ,LstVendedores,  LstEstados : TStringList;
  AjusteObj : TAjuste;

implementation
uses
{$R *.dfm}
 //class
  eventos,vendedores, formasPago,COmprobVtaPtosvta,COmprobVtaTipos, COmprobVtaImpxTipos, ComprobVtaEstados,
 //forms

 Articulos_fm, ComprobVta_Fm, Clientes_fm, ciudades_fm,rubros_fm, usuarios_fm,   Presenta,
 ComprobvtaAdd_fm,  DashBoard,
 Vcl.Themes,

 UtilsFunc,
 Ajustes_fm,
 FormasPago_fm, eventos_fm,
 vendedores_fm,
 recibovta_fm,
 fondos_fm,
 gr_ventas,

 ReportesMain,   importsdll,
 ShellApi, main_procesos

 ;

var
  fondo: TBitmap;
  pn: TPanel;
  img: TImage;


procedure TFmMain.Bloqueo;
begin
  BorderStyle := bsnone;
  fondo := GetFormImage;
  FadeBitmap(fondo);
  pn := TPanel.Create(nil);
  img := TImage.Create(nil);
  img.Parent := pn;
     pn.BoundsRect := ClientRect;
     pn.BevelOuter := bvNone;
     img.Align := alClient;
     img.Picture.Bitmap.Assign(fondo);
     pn.Parent := Self;


end;
procedure TFmMain.ButtonGroup1Items0Click(Sender: TObject);
begin
   RunApp(AjusteObj.AccRap1Link);
end;

procedure TFmMain.DesBloqueo;
begin
  BorderStyle := bssizeable;
  img.Free;
  pn.Free;
  fondo.Free;
end;

procedure TFmMain.ShowFmEventosExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Eventos') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmEventos := TFmEventos.Create(tabSheet);
  FmEventos.Caption := 'Eventos';
  FmEventos.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmEventos.Caption;
  FmEventos.show;

end;

//******* Accion para Items (Menu Ppal) comprobantes de venta ****//
procedure TFmMain.CrearCompVtaFromMenu(Sender: TObject);
var
  TipoComprob : String;
  TabSheet : TtabSheet;
  FmComprobVta1 : TFmComprobVta_add;
Begin
  TipoComprob := Copy(TMenuItem(Sender).Caption, 2, length(TMenuItem(Sender).Caption));
  TipoComprob :=  TMenuItem(Sender).Caption;

  if EstaCreado(TipoComprob) then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmComprobVta1 := TFmComprobVta_add.Create(tabSheet);
  FmComprobVta1.Caption := TipoComprob;
  FmComprobVta1.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := TipoComprob;
  FmComprobVta1.show;
  FmComprobVta1.CB_TipoComprob.text  := TipoComprob;
  FmComprobVta1.ActNumeracion;
End;

procedure TFmMain.CerrarExecute(Sender: TObject);
begin
 close;
end;

Function TFmMain.EstaCreado(Caption : string) : boolean;
var
  I: Integer;
begin
  result := false;
  BC_CerrarTab.Visible := PageControlMain.PageCount>0;
  for i:= 0 to PageControlMain.PageCount-1 do
   Begin
     if PageControlMain.Pages[i].Caption = caption then
      begin
       PageControlMain.ActivePage := PageControlMain.Pages[i];
       result := true;
      end;
   End;


end;
procedure TFmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ajusteObj.free;
  Usuario.Free;
  FmMain.FDConnection1.Close;
  EventosAgregar('Salida del sistema.');
  Application.Terminate;
end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
  ajusteObj := TAjuste.Create;
  AjusteObj.logo := TPicture.Create;
  AjustesLeerIni(ajusteObj);
 // PageControlMain.Pages[0].Free;

  if FileExists(ajusteObj.LogoPath) then
   Img_Logo.Picture.LoadFromFile(ajusteObj.LogoPath);
 { readlicencia(ajusteObj);
   FmMain.Caption := 'VALLE GESTIÓN - Lic. '+ ajusteObj.EmpNombre;}
  Usuario := TUsuario.create;
  Usuario.nivel := 0;
  Application.OnHint := ShowHint;
  TStyleManager.SetStyle(ajusteObj.EstiloInterfaz);
 // SplashScreen.Hide;
 // SplashScreen.Free;
end;

procedure TFmMain.ShowHint(Sender: TObject);
begin
 FmMain.StatusBarMain.Panels[0].Text :=  Application.Hint;
end;

procedure TFmMain.FormShow(Sender: TObject);
var
 oParams: TStrings;
 i : integer;
 ItemMenu : TMenuItem;
begin
{ Lb_AccesoRap1.Caption := ajusteObj.AccRap1Texto;
  Lb_AccesoRap2.Caption := ajusteObj.AccRap2Texto;
  Lb_AccesoRap3.Caption := ajusteObj.AccRap3Texto;   }

  TB_Main.Buttons[0].Caption := ajusteObj.ToolMainB1Titulo;
  TB_Main.Buttons[1].Caption := ajusteObj.ToolMainB2Titulo;
  TB_Main.Buttons[2].Caption := ajusteObj.ToolMainB3Titulo;
  TB_Main.Buttons[3].Caption := ajusteObj.ToolMainB4Titulo;

  SplitView2.Opened := false;

  oParams := TStringList.Create;
  oParams.Add('Server='+ AjusteObj.Servidor);
  oParams.Add('Database='+ AjusteObj.baseDatos);
  oParams.Add('OSAuthent=Yes');
  oParams.Add('User_Name='+ AjusteObj.Usuario);
  oParams.Add('Password='+AjusteObj.Password);
{
  oParams.Add('Server=vallesoft.com.ar');
  oParams.Add('Database=spsi_recaudaciones');
  oParams.Add('OSAuthent=Yes');
  oParams.Add('User_Name=spsi_silvio');
  oParams.Add('Password=Nico1942$');     }

  try
    FDManager.ConnectionDefs.Clear;
    FDManager.AddConnectionDef('MySQL_Connection', 'MySQL', oParams);
    FDConnection1.ConnectionDefName := 'MySQL_Connection';
    FDConnection1.Connected := True;
    Caption := Caption +' - '+ AjusteObj.EmpNombre;
  except
 // FmAjustes := FmAjustes.create(Application);
 // FmAjustes.ShowModal;
    exit;
  end;

  lb_BAseDatos.caption := 'BASE DATOS: '+ AjusteObj.baseDatos;
  lb_Servidor.Caption :=  'SERVIDOR  : '+AjusteObj.Servidor;

  Ed_UsuarioId.text := 'sparada';
  Ed_UsuarioPass.text := '1942304';

   LstFormasdePago := TStringList.Create;
    FormaPagoLeerListado(LstFormasdePago,'activo');
   LstTipoComprbvta := TStringList.Create;
    TiposComprobVtaLeerListado(LstTipoComprbvta);
   LstPuntosVta := TStringList.Create;
    PuntosVta_LeerListado(LstPuntosVta);
   LstImpuestos := TStringList.Create;
    ReadDb_LstComprobImpuestos(LstImpuestos);
   LstVendedores := TStringList.Create;
    VendedoresLeerListado(LstVendedores,'activo');

   LstEstados := TStringList.create;
    ComprobVtaEstadoLeerListado(LstEstados);

  for i:=0 to LstTipoComprbvta.Count-1 do
   Begin
    ItemMenu := TMenuItem.create( Menu_Comprobantes.Items );
    ItemMenu.OnClick := CrearCompVtaFromMenu;
    ItemMenu.Caption := LstTipoComprbVta[i];
    Menu_Comprobantes.Items.Add(ItemMenu); // Menu boton de barra
   end;


  Menu_Usuario.Items[0].OnClick(sender) ;


end;

procedure TFmMain.Image2DblClick(Sender: TObject);
begin
 Pn_CambiarPass.visible := true;

end;

procedure TFmMain.Lb_AccesoRap1Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink :=ajusteObj.AccRap1Link;
 // ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),  nil, nil, SW_SHOW);
  ShellExecute(0, 'open', PChar(MyLink), nil, nil, SW_SHOWNORMAL);
end;

procedure TFmMain.Lb_AccesoRap1MouseEnter(Sender: TObject);
begin
  TLabel(Sender).Cursor := crHandPoint;
end;

procedure TFmMain.Lb_AccesoRap1MouseLeave(Sender: TObject);
begin
  TLabel(Sender).Cursor := crDefault;
end;

procedure TFmMain.Lb_AccesoRap2Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink := ajusteObj.AccRap2Link;
  ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),  nil, nil, SW_NORMAL);
end;


procedure TFmMain.Panel1Click(Sender: TObject);
begin
 if SplitView2.Opened then
   SplitView2.Close else SplitView2.Open;
end;


procedure TFmMain.ShowFmRecibosVtaExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Recibos') then Exit;
  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmReciboVta := TFmReciboVta.Create(tabSheet);
  FmReciboVta.Caption := 'Recibos';
  FmReciboVta.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmReciboVta.Caption;
  FmReciboVta.show;


end;

procedure TFmMain.ShowLstCompVtaExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Comp.Venta') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmListaComprobVta := TFmListaComprobVta.Create(tabSheet);
  FmListaComprobVta.Caption := 'Comp.Venta';
  FmListaComprobVta.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmListaComprobVta.Caption;
  FmListaComprobVta.show;


end;

procedure TFmMain.ShowFmGrVentasExecute(Sender: TObject);
begin
 if not EstaCreado('TFm_GRVentas') then
  Fm_GRVentas := TFm_GRVentas.create(application);
end;

procedure TFmMain.ShowFmArticulosExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Articulos') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmArticulos := TFmArticulos.Create(tabSheet);
  FmArticulos.Caption := 'Articulos';
  FmArticulos.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmArticulos.Caption;
  FmArticulos.show;

end;

procedure TFmMain.ShowFmCajaExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Fondos') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmFondos := TFmFondos.Create(tabSheet);
  FmFondos.Caption := 'Fondos';
  FmFondos.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmFondos.Caption;
  FmFondos.show;
end;

procedure TFmMain.SHowFmClientesExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin
  if EstaCreado('Clientes') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmClientes := TFmClientes.Create(tabSheet);
  FmClientes.Caption := 'Clientes';
  FmClientes.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmClientes.Caption;
  FmClientes.show;


end;

procedure TFmMain.ShowFmCondVtaExecute(Sender: TObject);
begin
  if not EstaCreado('TFmFormasPago') then
   FmFormasPago := TFmFormasPago.create(application);
end;

procedure TFmMain.ShowFmComprobVta1Execute(Sender: TObject);
var
 TabSheet : TtabSheet;
 FmComprobVta1 : TFmComprobVta_add;
begin

   if EstaCreado(AjusteObj.ToolMainB1Comprob) then
     exit;

    tabSheet := TTabSheet.Create(PageControlMain);
    tabSheet.PageControl := PageControlMain;

    FmComprobVta1 := TFmComprobVta_add.Create(tabSheet);
    FmComprobVta1.Caption := AjusteObj.ToolMainB1Comprob;;
    FmComprobVta1.Parent := tabSheet;
    PageControlMain.ActivePage := tabSheet;
    tabSheet.Caption := FmComprobVta1.Caption;
    FmComprobVta1.show;
    FmComprobVta1.CB_TipoComprob.text  := AjusteObj.ToolMainB1Comprob;
    FmComprobVta1.ActNumeracion;
   {if EstaCreado('Clientes') then
     if FmClientes.ListView1.ItemIndex >0 then
       Begin
         FmComprobVta1.Ed_IdCliente.text := FmClientes.ListView1.Items[FmClientes.ListView1.ItemIndex].caption;
         FmComprobVta1.Ed_Nombre.text := FmClientes.ListView1.Items[FmClientes.ListView1.ItemIndex].SubItems[0];
       End;}
end;

procedure TFmMain.ShowFmComprobVta2Execute(Sender: TObject);
var
 TabSheet : TtabSheet;
 FmComprobVta2 : TFmComprobVta_add;
begin

  if EstaCreado(AjusteObj.ToolMainB2Comprob) then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmComprobVta2 := TFmComprobVta_add.Create(tabSheet);
  FmComprobVta2.Caption := AjusteObj.ToolMainB2Comprob;
  FmComprobVta2.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmComprobVta2.Caption;
  FmComprobVta2.show;
  FmComprobVta2.CB_TipoComprob.text  := AjusteObj.ToolMainB2Comprob;
  FmComprobVta2.ActNumeracion;

end;

procedure TFmMain.ShowFmRubrosExecute(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Rubros') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmRubros := TFmRubros.Create(tabSheet);
  FmRubros.Caption := 'Rubros';
  FmRubros.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmRubros.Caption;
  FmRubros.show;

end;

procedure TFmMain.ShowUsuariosExecute(Sender: TObject);
 var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Rubros') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmRubros := TFmRubros.Create(tabSheet);
  FmRubros.Caption := 'Rubros';
  FmRubros.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmRubros.Caption;
  FmRubros.show;
end;

procedure TFmMain.BC_AceptarCambPAssClick(Sender: TObject);
begin


  if not( Ed_PassNuevo1.text = Ed_PassNuevo2.text) Then
     begin
       mensaje('El nuevo password y la confirmación no coinciden.','Seguridad',1);
       exit;
     end;

   CambiarPassword(Usuario.id ,Ed_PassNuevo1.text,Ed_PassActual.text );
   Pn_CambiarPass.Visible := false;
end;

procedure TFmMain.BC_CancelarCambPAssClick(Sender: TObject);
begin
  Pn_CambiarPass.Visible := false;
  DesBloqueo;
end;

procedure TFmMain.BC_CancelLoginClick(Sender: TObject);
begin
  Close;
end;

procedure TFmMain.BC_CerrarTabClick(Sender: TObject);
begin
   PageControlMain.ActivePage.free;
   BC_CerrarTab.Visible := PageControlMain.PageCount>0;
end;

procedure TFmMain.BC_LoginClick(Sender: TObject);
begin
  Usuario.id:= Ed_UsuarioId.text;
  Usuario.password := Ed_UsuarioPass.text;
 // Usuario.SuperAdmin := False;
  if UsuarioLogin(Usuario) Then
    begin
      UsuariosLeerUsuario(Usuario);
      lb_UserNombre.Caption := Usuario.ID;
      Menu_Usuario.Items[0].Caption := 'Salida del sistema';
      PnLogin.Visible := false;
      DesBloqueo;
      EventosAgregar('Ingreso al sistema');
    end else
        begin
          Mensaje('Usuario o password no válidos!!','Acceso',3);
        end;
end;

procedure TFmMain.SpeedButton2Click(Sender: TObject);
begin
  MonthCalendar1.Visible := not(MonthCalendar1.visible);
end;

procedure TFmMain.ToolButton10Click(Sender: TObject);
begin
  TB_Main.Visible := true;
  Tb_Opciones.visible:= false;
end;

procedure TFmMain.ToolButton11Click(Sender: TObject);
begin
  TB_Main.Visible := false;
  Tb_Opciones.visible:= true;
  Tb_Opciones.Parent := PnTop;
  Tb_Opciones.Align := TAlign.alClient;
end;

procedure TFmMain.TB_EmisionFiscalClick(Sender: TObject);
begin
   RunApp(AjusteObj.SoftImpFiscalPath);
end;

procedure TFmMain.Tb_LstComprobClick(Sender: TObject);
begin
 Menu_Comprobantes.Popup( 1,1);
end;

procedure TFmMain.ToolButton17Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Vendedores') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmVendedores := TFmVendedores.Create(tabSheet);
  FmVendedores.Caption := 'Vendedores';
  FmVendedores.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmVendedores.Caption;
  FmVendedores.show;

end;

procedure TFmMain.ToolButton18Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

{  if EstaCreado('Ajustes') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmAjustes := TFmAjustes.Create(tabSheet);
  FmAjustes.Caption := 'Ajustes';
  FmAjustes.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmAjustes.Caption;
  FmAjustes.show;                       }
  FmAjustes := TFmAjustes.Create(Application);
  FmAjustes.Caption := 'Ajustes';
  FmAjustes.showModal;


end;

procedure TFmMain.ToolButton2Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Reportes') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmReportesVta := TFmReportesVta.Create(tabSheet);
  FmReportesVta.Caption := 'Reportes';
  FmReportesVta.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmReportesVta.Caption;
  FmReportesVta.show;
end;

procedure TFmMain.ToolButton35Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Usuarios') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmUsuarios := TFmUsuarios.Create(tabSheet);
  FmUsuarios.Caption := 'Usuarios';
  FmUsuarios.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmUsuarios.Caption;
  FmUsuarios.show;


end;

procedure TFmMain.ToolButton4Click(Sender: TObject);
begin
   close;
end;

procedure TFmMain.ToolButton6Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Gráficos') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  Fm_GRVentas := TFm_GRVentas.Create(tabSheet);
  Fm_GRVentas.Caption := 'Gráficos';
  Fm_GRVentas.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := Fm_GRVentas.Caption;
  Fm_GRVentas.show;

end;

procedure TFmMain.ToolButton7Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('T.Control') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmDashboard  := TFmDashboard.Create(tabSheet);
  FmDashboard.Caption := 'T.Control';
  FmDashboard.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmDashboard.Caption;
  FmDashboard.show;


end;

procedure TFmMain.ToolButton8Click(Sender: TObject);
var
 TabSheet : TtabSheet;
begin

  if EstaCreado('Procesos') then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmMainProcesos := TFmMainProcesos.Create(tabSheet);
  FmMainProcesos.Caption := 'Procesos';
  FmMainProcesos.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmMainProcesos.Caption;
  FmMainProcesos.show;


end;

procedure TFmMain.TB_CompVta3Click(Sender: TObject);
var
 TabSheet : TtabSheet;
 FmComprobVta3 : TFmComprobVta_add;
begin

  if EstaCreado(AjusteObj.ToolMainB3Comprob) then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

 FmComprobVta3 := TFmComprobVta_add.Create(tabSheet);
  FmComprobVta3.Caption := AjusteObj.ToolMainB3Comprob;
  FmComprobVta3.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmComprobVta3.Caption;
  FmComprobVta3.show;
  FmComprobVta3.CB_TipoComprob.text  := AjusteObj.ToolMainB3Comprob;
  FmComprobVta3.ActNumeracion;

end;

procedure TFmMain.TB_CompVta4Click(Sender: TObject);
var
 TabSheet : TtabSheet;
 FmComprobVta4 : TFmComprobVta_add;
begin

  if EstaCreado(ajusteObj.ToolMainB4Comprob) then Exit;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmComprobVta4 := TFmComprobVta_add.Create(tabSheet);
  FmComprobVta4.Caption := ajusteObj.ToolMainB4Comprob;
  FmComprobVta4.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmComprobVta4.Caption;
  FmComprobVta4.show;
  FmComprobVta4.CB_TipoComprob.text  := ajusteObj.ToolMainB4Comprob;
  FmComprobVta4.ActNumeracion;

end;

procedure TFmMain.Lb_AccesoRap3Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink :=  ajusteObj.AccRap3Link;
  ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),    nil, nil, SW_SHOW);

end;

procedure TFmMain.MenuCambPassClick(Sender: TObject);
begin
   Bloqueo;
   Pn_CambiarPass.Visible := true;
   Pn_CambiarPass.BringToFront;
   Ed_PassActual.text := '';
   Ed_PassNuevo1.text := '';
   Ed_PassNuevo2.Text := '';
   Ed_PassActual.SetFocus;
end;

procedure TFmMain.MenuEventosClick(Sender: TObject);
var
 tabSheet : TtabSheet;
 i : integer;
begin
  for i:= 0 to PageControlMain.PageCount-1 do
   Begin
     if PageControlMain.Pages[i].Caption = 'Eventos' then
      begin
       PageControlMain.ActivePage := PageControlMain.Pages[i];
       exit;
      end;
   End;

  tabSheet := TTabSheet.Create(PageControlMain);
  tabSheet.PageControl := PageControlMain;

  FmEventos := tFmEventos.Create(tabSheet);
  FmEventos.Parent := tabSheet;
  PageControlMain.ActivePage := tabSheet;
  tabSheet.Caption := FmEventos.Caption;
  FmEventos.show;

  Button1.Visible := PageControlMain.PageCount>0;

end;

procedure TFmMain.MenuLogInOutClick(Sender: TObject);
var
  i:integer;
begin
   Usuario.id := '';
   Usuario.nombre := '';
// Usuario.SuperAdmin := false;
   Usuario.sector := '';
    //Activo : Boolean;
   lb_UserNombre.Caption := 'Usuario';

  if Menu_Usuario.Items[0].Caption = 'Salida del sistema' then
   for i:=PageControlMain.PageCount-1 downto 0 do
    PageControlMain.Pages[i].free;

   Bloqueo;
   PnLogin.Visible := true;
   PnLogin.BringToFront;
   Ed_UsuarioId.SetFocus;

end;

end.
