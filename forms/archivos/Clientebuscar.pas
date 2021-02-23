unit Clientebuscar;

interface

uses SysUtils,WinTypes,WinProcs,Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, DB,  ExtCtrls, Grids, DBGrids, dialogs, ComCtrls, ADODB,

  clientes
  ;

type
  TFmFindCliente = class(TForm)
    BC_Aceptar: TBitBtn;
    BC_Ca: TBitBtn;
    Ed_busqueda: TEdit;
    ListView1: TListView;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure Ed_busquedaChange(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    procedure ApplyFilter(const S: string);
    { Public declarations }
    //Function Obtener_Cliente (var Cliente : TCliente): boolean;
  end;

var
  FmFindCliente: TFmFindCliente;

 Function ShowClientesList (var Cliente : TCliente): boolean; export;

implementation
{$R *.DFM}
uses main,Contnrs;

var ListaCompleta,ListaActiva : TStringList;


{Function FindClienteId(var Cliente : TCliente): boolean;
var
 Tabla : TADOQuery;
begin
  Tabla := TADOQuery.Create(Application);
  Tabla.Connection := FmMain.ADOConnection1;
  Tabla.SQL.Clear;
  Tabla.SQL.ADD('SELECT * FROM clientes  Where IdCliente='+IntToStr(Cliente.Id));
  Tabla.open;
 Result := false;
 if Tabla.RecordCount > 0 then
  begin
    Cliente.Id := Tabla.FieldByName('IdCliente').AsInteger ;
    Cliente.Tratamiento := Tabla.FieldByName('Tratamiento').AsString ;
    Cliente.Nombre := Tabla.FieldByName('Nombre').AsString ;
    Cliente.Direccion :=  Tabla.FieldByName('Direccion').AsString;
    Cliente.CodposTal :=  Tabla.FieldByName('CodPostal').AsString;
    Cliente.Telefono :=  Tabla.FieldByName('Telefono').AsString;
    Cliente.Fax :=  Tabla.FieldByName('fax').AsString;
    Cliente.email := Tabla.FieldByName('email').AsString;
    Cliente.TipoDoc :=  Tabla.FieldByName('TipoDoc').AsString;
    Cliente.NroDoc :=  Tabla.FieldByName('NroDoc').AsString;
    Cliente.HabCtaCte := Tabla.FieldByName('HabCtaCte').AsBoolean;
    Cliente.CategImpos := Tabla.FieldByName('CategImpos').AsString;
    Cliente.UltimaVta := Tabla.FieldByName('UltimaVta').AsDateTime;
    Cliente.UltimaPago := Tabla.FieldByName('UltimoPago').AsDateTime;
    Cliente.FormaPago  := Tabla.FieldByName('FormaPago').AsString ;
    Cliente.DiasVto := Tabla.FieldByName('DiasVto').AsInteger ;
    Cliente.showObs := Tabla.FieldByName('ShowObs').AsBoolean;
    Cliente.Comprobxemail := Tabla.FieldByName('Comprobxemail').AsBoolean;
    Cliente.Contacto1 := Tabla.FieldByName('Contacto1').AsString;
    Cliente.TelCont1 := Tabla.FieldByName('TelCont1').AsString;
    Cliente.Contacto2 := Tabla.FieldByName('Contacto2').AsString;
    Cliente.TelCont2 := Tabla.FieldByName('TelCont2').AsString;
    Cliente.LimiteCredito := Tabla.FieldByName('LimiteCredito').AsFloat;
    Cliente.Observaciones := Tabla.FieldByName('Observaciones').AsString;
    Result := true;
  end;
 Tabla.close;
 Tabla.Destroy;

End; }

Function ShowClientesList(var Cliente : TCliente): boolean;
begin
  Result := false;
  FmFindCliente := TFmFindCliente.Create(Application);
  if FmFindCliente.ShowModal = mrOK then
   begin
    Cliente := TCliente( ListaActiva.Objects[ FmFindCliente.ListView1.ItemIndex]);
    Result := true;
   end;

end;

procedure TFmFindCliente.DBGrid1DblClick(Sender: TObject);
begin
  FmFindCliente.ModalResult := mrok;
end;

procedure TFmFindCliente.ApplyFilter(const S: string);
var
  I: Integer;
begin
  ListView1.Items.BeginUpdate;
  try
    ListView1.Clear;
    ListaActiva.Clear;
    for I := 0 to ListaCompleta.Count - 1 do
      if (S = '') or (Pos(UpperCase(S), UpperCase(ListaCompleta[i]) )  <> 0 ) then
        ListaActiva.AddObject(ListaCompleta[I], ListaCompleta.Objects[i] );
    ListView1.Items.Count := ListaActiva.Count;
  finally
    ListView1.Items.EndUpdate;
  end;
  //StatusBar1.Panels[0].Text :=  'Registros: '+IntToStr(ListView1.Items.Count);
end;


procedure TFmFindCliente.Ed_busquedaChange(Sender: TObject);
begin
 ApplyFilter((Sender as TEdit).Text);
end;

procedure TFmFindCliente.FormCreate(Sender: TObject);
var
 i:integer;
// Cliente : TCliente;
begin
  ListaCompleta := TStringList.create;
  ListaActiva := TStringList.Create;
  ListaCompleta.Clear;
  ClientesLeerListado(ListaCompleta, 'activo');

  Ed_busqueda.Text := '';
  ApplyFilter(Ed_busqueda.Text);
  ListView1.ItemIndex := 0;
end;

procedure TFmFindCliente.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = VK_down  then
  if ListView1.ItemIndex < ListView1.Items.Count-1  then
    ListView1.ItemIndex := ListView1.ItemIndex +1;
 if key = VK_up then
   if ListView1.ItemIndex > 0 then
    ListView1.ItemIndex := ListView1.ItemIndex -1;

{ if key = VK_return  then
   BC_Aceptar.Click;  }
end;

procedure TFmFindCliente.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
 if Sender.Items[item.index].Selected then
    Sender.Canvas.Brush.Color := clBlue;
end;

procedure TFmFindCliente.ListView1Data(Sender: TObject; Item: TListItem);
begin
  with Item do
   begin
   Caption := IntToStr( TCliente(ListaActiva.objects[Item.Index]).Id );
   SubItems.Add( TCliente(ListaActiva.objects[Item.Index]).Nombre );
   { SubItems.Add( TCliente(Lista.objects[Item.Index]).Direccion);
    SubItems.Add( TCliente(Lista.objects[Item.Index]).telefono);
    SubItems.Add( TCliente(Lista.objects[Item.Index]).Codpostal);
    SubItems.Add( TCliente(Lista.objects[Item.Index]).ciudad);}
   end;
end;

end.

