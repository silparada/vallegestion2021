
unit usuarios_fm;

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
  TFmUsuarios = class(TForm)
    ToolBar1: TToolBar;
    TB_readdb: TToolButton;
    TB_add: TToolButton;
    TB_edit: TToolButton;
    TB_Delete: TToolButton;
    ListView1: TListView;
    Panel2: TPanel;
    Ed_busqueda: TEdit;
    Pn_EditAdd: TPanel;
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
    CV_Activo: TCheckBox;
    Me_Observaciones: TMemo;
    Label6: TLabel;
    Ed_IdUsuario: TEdit;
    Label4: TLabel;
    Ed_nombre: TEdit;
    Label5: TLabel;
    Ed_Password: TEdit;
    Label7: TLabel;
    FDQuery1: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_DeleteClick(Sender: TObject);
    procedure TB_readdbClick(Sender: TObject);
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
  FmUsuarios: TFmUsuarios;

implementation
{$R *.dfm}

uses
  //class
   Usuarios,    eventos,
   main, utilsFunc,rp_utils,importsdll ;

var

  ListaActiva : TStringList;
  ListaCompleta : TStringList;
  bm: TBitmap;
  pn: TPanel;
  img: TImage;
  Editar : Boolean;

procedure TFmUsuarios.Bloqueo;
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
procedure TFmUsuarios.DesBloqueo;
begin
  img.Free;
  pn.Free;
  bm.Free;
end;

procedure TFmUsuarios.ApplyFilter(const S: string);
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


procedure TFmUsuarios.Bc_AceptarClick(Sender: TObject);
var
 Usuario : TUsuario;
begin
  Usuario := TUsuario.create ;

  Usuario.Id := Ed_IdUsuario.Text;
  Usuario.nombre := Ed_Nombre.Text;
  Usuario.Activo :=  CV_Activo.Checked;
  Usuario.Observaciones := Me_Observaciones.Text;

  if EDITAR then
   Begin
    UsuariosEditar(Usuario);
    ListaActiva.Objects[ListView1.ItemIndex] := Usuario;
    EventosAgregar('Editar usuario '+ Ed_IdUsuario.text  );

   End
  else
   Begin
    UsuariosAgregar(Usuario);
    ListaCompleta.AddObject(Usuario.Nombre, Usuario);
    ListaActiva.AddObject(Usuario.Nombre, Usuario);
    ListView1.Items.Count := ListaActiva.Count;
    StatusBar1.Panels[0].text := 'Registros: '+ IntToStr(ListaActiva.Count);
   End;


 Usuario.free;

 screen.Cursor := crDefault;
 Desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmUsuarios.BC_CancelarClick(Sender: TObject);
begin
 desbloqueo;
 Pn_EditAdd.Visible := false;
end;

procedure TFmUsuarios.BC_CancelarPrintClick(Sender: TObject);
begin
 desbloqueo;
 Pn_Imprimir.Visible := false;
end;

procedure TFmUsuarios.BC_AceptarPrintClick(Sender: TObject);
begin

  FDQuery1.close;
  FDQuery1.sql.clear;
  FDQuery1.sql.add('SELECT * FROM usuarios');
  if CV_PrintSoloActivos.Checked then
      FDQuery1.sql.add(' WHERE activo=TRUE');

   FDQuery1.sql.add(' ORDER BY nombre');
  frxReport1.LoadFromFile( AjusteObj.CarpReportes +'\usuarios.fr3')   ;

   FDQuery1.open;
  SetUpReporte(frxReport1,'Usuarios');

 // TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).StartNewPage := CV_PrintPagJuntos.Checked ;

  frxReport1.ShowReport;

  Desbloqueo;
  Pn_imprimir.Visible := false;
end;

procedure TFmUsuarios.d3_ListViewCustomDrawItem(Sender: TCustomListView;
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

procedure TFmUsuarios.Ed_busquedaChange(Sender: TObject);
begin
  ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFmUsuarios.FormCreate(Sender: TObject);
begin

 ListaCompleta := TStringList.create;
 ListaActiva := TStringList.Create;


 TB_readdb.Click;
end;


procedure TFmUsuarios.FormDestroy(Sender: TObject);
begin
  ListaCompleta.Free;
  ListaActiva.Free;
end;



procedure TFmUsuarios.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
   Caption :=  TUsuario(ListaActiva.objects[Item.Index]).Id;
   SubItems.Add( TUsuario(ListaActiva.objects[Item.Index]).nombre );
   //SubItems.Add( TUsuario(ListaActiva.objects[Item.Index]).observaciones);
   end;
end;

procedure TFmUsuarios.ListView1DblClick(Sender: TObject);
begin
 TB_editClick(Sender);
end;

procedure TFmUsuarios.TB_readdbClick(Sender: TObject);
begin
 ListaCompleta.Clear;
 UsuariosLeerListado(ListaCompleta, 'todos');
 Ed_busqueda.Text := '';
 ApplyFilter(Ed_busqueda.Text);
 ListView1.ItemIndex := 0;

end;

procedure TFmUsuarios.TB_PrintClick(Sender: TObject);
begin
   Bloqueo;
   Pn_Imprimir.Visible := true;
   Pn_Imprimir.BringToFront;
end;

procedure TFmUsuarios.TB_addClick(Sender: TObject);
begin
  Editar := false;
  Bloqueo;
  Pn_EditAdd.Visible := true;
  Pn_EditAdd.BringToFront;

  Ed_IdUsuario.Enabled := true;
   Ed_IdUsuario.text := '';
   Ed_nombre.Text := '';
   Ed_password.Text := '';
   Me_Observaciones.clear;

end;

procedure TFmUsuarios.TB_DeleteClick(Sender: TObject);
var
 IdUsuario : String;
begin
 IdUsuario :=  Listview1.items[Listview1.ItemIndex].Caption;

 if DialogoBox('�Confirma borrar el Usuario : '+ Listview1.items[Listview1.ItemIndex].Caption +' ?','Borrar Usuario', 1,1)  then

  IF UsuariosBorrar(IdUsuario) Then
   BEgin
    //ListaActiva.Delete(Listview1.ItemIndex);
    TUSuario(ListaActiva.objects[Listview1.ItemIndex]).Nombre  := '**** BORRADO ******';
    Listview1.items.Count := ListaActiva.Count;
   End;


end;

procedure TFmUsuarios.TB_editClick(Sender: TObject);
var
  Usuario : TUsuario;
  i : integer;
begin
   Editar := true;
   Bloqueo;

   Pn_EditAdd.Visible := true;
   Pn_EditAdd.BringToFront;

   Usuario := TUsuario.create;
   Usuario.Id :=  Listview1.items[Listview1.ItemIndex].Caption;
   UsuariosLeerUsuario(Usuario);

   Ed_IdUsuario.Enabled := false;
   Ed_IdUsuario.text := Usuario.Id;
   Ed_Nombre.Text := Usuario.Nombre;


   If Usuario.activo then CV_Activo.State := cbChecked else  CV_Activo.State := cbUnchecked;
   Me_Observaciones.clear;
      Me_Observaciones.text := Usuario.Observaciones;

   Usuario.free;
end;

end.

