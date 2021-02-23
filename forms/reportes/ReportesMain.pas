unit ReportesMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPanels,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFmReportesVta = class(TForm)
    StackPanel1: TStackPanel;
    Bc_RepCodBarras: TButton;
    Panel1: TPanel;
    Button1: TButton;
    BC_Comprobvta: TButton;
    Bc_CtaCte: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Bc_RepCodBarrasClick(Sender: TObject);
    procedure BC_ComprobvtaClick(Sender: TObject);
    procedure Bc_CtaCteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fKillParent: TWinControl;
    { Private declarations }
    procedure Liberar;

  public
    destructor Destroy; override;
    { Public declarations }

  end;

var
  FmReportesVta: TFmReportesVta;

implementation
{$R *.dfm}
uses
  main,rp_codigosbarra,rp_listaprecio,rp_comprobVta, rp_ctaCte;

procedure TFmReportesVta.Liberar;
var i:integer;
Begin
 for I := 0to Panel1.ControlCount-1 do
   Panel1.Controls[i].Free;
End;

procedure TFmReportesVta.Bc_RepCodBarrasClick(Sender: TObject);
begin
   Liberar;
  Fm_INFPrecios := TFm_INFPrecios.creaTE(Panel1);
  Fm_INFPrecios.Parent := Panel1;

end;

procedure TFmReportesVta.Button1Click(Sender: TObject);
begin
  Liberar;
  Fm_RpCodBarra := TFm_RpCodBarra.creaTE(Panel1);
  Fm_RpCodBarra.Parent := Panel1;
end;

procedure TFmReportesVta.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if (Parent is TTabsheet)  and (Owner <> Parent) then
  begin
    ShowMessage( Parent.Name  );
    Hide;
    fKillParent := Parent;
    Parent := nil;

  end;
  action := caFree;
end;

destructor TFmReportesVta.Destroy;
begin
  if assigned(fKillParent) and not (csDestroying in fKillParent.ComponentState) then
    fKillParent.Free;
  inherited;
end;

procedure TFmReportesVta.BC_ComprobvtaClick(Sender: TObject);
begin
  Liberar;
  FmRp_CompVta := TFmRp_CompVta.creaTE(Panel1);
  FmRp_CompVta.Parent := Panel1;
end;

procedure TFmReportesVta.Bc_CtaCteClick(Sender: TObject);
begin
  Liberar;
  Fm_RpCtaCte := TFm_RpCtaCte.creaTE(Panel1);
  Fm_RpCtaCte.Parent := Panel1;
end;

end.
