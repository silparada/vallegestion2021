unit ComprobVtaImpxTipo_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin;

type
  TFmComprobImpuestos = class(TForm)
    Lv_ImpComp: TListView;
    CB_TipoComp: TComboBox;
    Label13: TLabel;
    ToolBar1: TToolBar;
    TB_Grabar: TToolButton;
    TB_Exit: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure CB_TipoCompChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_GrabarClick(Sender: TObject);
    procedure TB_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmComprobImpuestos: TFmComprobImpuestos;

implementation
{$R *.dfm}
 uses
    ComprobVtaTipos,
    main ;

procedure TFmComprobImpuestos.CB_TipoCompChange(Sender: TObject);
var
 Tabla : TFDquery;
 i : integer;
begin

 Screen.cursor := crHourGlass;
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;

 for I := 0 to Lv_ImpComp.Items.Count - 1 do
    Lv_ImpComp.Items[i].Checked := false;

 for I := 0 to Lv_ImpComp.Items.Count - 1 do
  begin
   Tabla.SQL.clear;
   Tabla.SQL.add('SELECT * FROM comprob_vta_tipos_impuestos WHERE id_tipocomp=' +QuotedStr(CB_TipoComp.text) +' and id_impuesto='+ QuotedStr(Lv_ImpComp.Items[i].Caption) );
   Tabla.open;
   if tabla.RecordCount > 0 then
     Lv_ImpComp.Items[i].Checked := true;
   Tabla.close;
  end;

 Tabla.close;
 Tabla.Destroy;
 Screen.cursor := crDefault;
end;

procedure TFmComprobImpuestos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:= cafree;
end;

procedure TFmComprobImpuestos.FormCreate(Sender: TObject);
var
  Tabla : TFDquery;
 Lista : TStringList;
 i : integer;
begin
 Lista := TStringList.create;
 Lv_ImpComp.Clear;

 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('SELECT * FROM impuestos ORDER BY orden');
 Tabla.open;

 while not Tabla.EOF do
  begin
    with Lv_ImpComp.Items.Add do begin
     Caption := Tabla.FieldByName('id').AsString ;
     SubItems.Add( Tabla.FieldByName('tipo').AsString) ;
     SubItems.Add( Tabla.FieldByName('descripcion').AsString ) ;
    end;
   Tabla.next;
  end;

 Tabla.close;
 Tabla.Destroy;


  Lista.clear;
  CB_TipoComp.Items.Clear;     // ller formatos de impresión
  TiposComprobVtaLeerListado(Lista);
   for i:=0 to Lista.Count-1 do
     CB_TipoComp.Items.Add(Lista[i]);
  Lista.Free;
  //CB_TipoComp.itemindex := 0;
end;

procedure TFmComprobImpuestos.TB_GrabarClick(Sender: TObject);
var
 i: integer;
 Tabla : TFDquery;
begin
 Screen.Cursor := crSQLWait;
 Tabla := TFDquery.Create(Application);
 Tabla.Connection := FmMain.FDConnection1;
 Tabla.SQL.add('DELETE FROM comprob_vta_tipos_impuestos Where Id_tipocomp='+ qUOTEDsTR(CB_TipoComp.text) );
 Tabla.ExecSQL;

 For I := 0 to Lv_ImpComp.Items.Count - 1 do
  begin
   if Lv_ImpComp.Items[i].Checked then
    begin
      Tabla.SQL.Clear;
      Tabla.SQL.add('INSERT INTO comprob_vta_tipos_impuestos(id,Id_tipocomp,id_impuesto) values( ') ;
      Tabla.SQL.add('NULL,'+  QuotedStr(CB_TipoComp.text) +' , '+ QuotedStr(Lv_ImpComp.Items[i].Caption) +')' );
      Tabla.ExecSQL;
    end;
  end;
 Tabla.destroy;
 Screen.Cursor := crdefault;

end;

procedure TFmComprobImpuestos.TB_ExitClick(Sender: TObject);
begin
 close;
end;

end.
