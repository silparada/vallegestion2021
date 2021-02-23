unit cheques;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB,  ExtCtrls,
  Mask,  ADODB;
type
  TFmCheques = class(TForm)
    DS_Cheques: TDataSource;
    Gr_Cheques: TDBGrid;
    Panel1: TPanel;
    BC_Agregar: TBitBtn;
    BC_Edit: TBitBtn;
    BC_Borrar: TBitBtn;
    BC_Depositar: TBitBtn;
    BC_Close: TBitBtn;
    Panel2: TPanel;
    GOP_Orden: TRadioGroup;
    GroupBox1: TGroupBox;
    Ed_Numero: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    TaCheques: TADOTable;
    TaChequesIdCheque: TAutoIncField;
    TaChequesNumero: TWideStringField;
    TaChequesBanco: TWideStringField;
    TaChequesFechaEM: TDateTimeField;
    TaChequesFechaAC: TDateTimeField;
    TaChequesImporte: TFloatField;
    TaChequesEstado: TSmallintField;
    TaChequesObservaciones: TWideStringField;
    TaChequesORIGEN: TWideStringField;
    TaChequesDestino: TWideStringField;
    TaChequesNroCta: TWideStringField;
    TaChequesCUIT: TWideStringField;
    TaChequesTitular: TWideStringField;
    procedure BC_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BC_BorrarClick(Sender: TObject);
    procedure Ed_NumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DE_FechaEMKeyPress(Sender: TObject; var Key: Char);
    procedure DE_FechaACKeyPress(Sender: TObject; var Key: Char);
    procedure GOP_OrdenClick(Sender: TObject);
    procedure Gr_ChequesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmCheques: TFmCheques;
implementation
{$R *.DFM}
uses
   //1Dlg_DeposCheque,Dlg_MovimBco,libreria, Dlg_Cheques;
   libreria,main;

procedure TFmCheques.BC_CloseClick(Sender: TObject);
begin
 close;
end;

procedure TFmCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TaCheques.Close;
  action := caFree;
end;

procedure TFmCheques.FormCreate(Sender: TObject);
begin
TaCheques.open;
end;

procedure TFmCheques.BC_BorrarClick(Sender: TObject);
begin
 if not dialogobox('Esta seguro que borra el cheque ?','Borrar',1,1) Then
   exit;
 TaCheques.Delete;
end;

procedure TFmCheques.Ed_NumeroKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  Begin
   GOP_Orden.ItemIndex := 3;
   TaCheques.IndexFieldnames := 'Numero';
   //TaCheques.FindNearest([Ed_Numero.Text]);
  end;
end;

procedure TFmCheques.DE_FechaEMKeyPress(Sender: TObject; var Key: Char);
begin
 iF kEY = #13 then
  Begin
   GOP_Orden.ItemIndex := 1;
   TaCheques.IndexFieldnames := 'FechaEM';
   //TaCheques.FindKey([DE_fechaEM.Date]);
  end;
end;

procedure TFmCheques.DE_FechaACKeyPress(Sender: TObject; var Key: Char);
begin
 iF kEY = #13 then
  Begin
   GOP_Orden.ItemIndex := 2;
   TaCheques.IndexFieldnames := 'FechaAC';
  // TaCheques.FindKey([DE_fechaAC.Date]);
  end;
end;

procedure TFmCheques.GOP_OrdenClick(Sender: TObject);
begin
 Case GOP_Orden.ItemIndex OF
   0 :  TaCheques.IndexFieldnames := 'NroSec';
   1 :  TaCheques.IndexFieldnames := 'FechaEM';
   2 :  TaCheques.IndexFieldnames := 'FechaAC';
   3 :  TaCheques.IndexFieldnames := 'Numero';
 end;
end;

procedure TFmCheques.Gr_ChequesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     //Gr_Cheques.Canvas.brush.color:= clBlack;
     //Gr_Cheques.Canvas.FillRect(Rect);
     if DataCol = 0 then
      begin
       case TaChequesEstado.value of
        0 : Gr_Cheques.Canvas.brush.color := clBlack;
        1 : Gr_Cheques.Canvas.brush.color := clblue;
        2 : Gr_Cheques.Canvas.brush.color := clgreen;
        3 : Gr_Cheques.Canvas.brush.color := clred;
      end;
        Gr_Cheques.Canvas.FillRect(Rect);
      end;
end;

end.
