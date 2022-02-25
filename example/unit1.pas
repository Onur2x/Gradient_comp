unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, butonu;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    obuton1: Tobuton;
    obuton2: Tobuton;
    obuton3: Tobuton;
    ocheckbox1: Tocheckbox;
    ocombobox1: Tocombobox;
    oedit1: Toedit;
    oListBox1: ToListBox;
    omemo1: Tomemo;
    Opanel1: TOpanel;
    Opanel2: TOpanel;
    Opanel3: TOpanel;
    OProgressBar1: TOProgressBar;
    oRadiobutton1: ToRadiobutton;
    oScrollBar1: ToScrollBar;
    OTrackBar1: TOTrackBar;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure obuton1Click(Sender: TObject);
    procedure obuton2Click(Sender: TObject);
    procedure Opanel2Click(Sender: TObject);
  private
    procedure moveform(frm: TForm);

  public

  end;

var
  Form1: TForm1;

implementation
 uses Windows;
{$R *.lfm}

{ TForm1 }

procedure TForm1.obuton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Opanel2Click(Sender: TObject);
begin

end;


procedure TForm1.obuton1Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  moveform(self);
end;

procedure TForm1.moveform(frm:TForm);
begin
    ReleaseCapture;
     SendMessage(frm.handle, WM_SYSCOMMAND, $F012, 0);
end;

end.

