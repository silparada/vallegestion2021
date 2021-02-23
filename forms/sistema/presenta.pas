unit Presenta;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, pngimage,ShellAPI, Vcl.ComCtrls;

type
  TSplashForm = class(TForm)
    Label2: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

procedure TSplashForm.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action :=caFree;
end;

procedure TSplashForm.Label1Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink := Label1.caption;
  ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),
   nil, nil, SW_SHOW);

end;

procedure TSplashForm.Label1MouseEnter(Sender: TObject);
begin
   TLabel(Sender).Cursor := crHandPoint;
end;

procedure TSplashForm.Label1MouseLeave(Sender: TObject);
begin
 TLabel(Sender).Cursor := crDefault;
end;

end.
