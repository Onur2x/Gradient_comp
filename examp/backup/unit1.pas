unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  ExtCtrls, Buttons, butonu, onurbutton, ongrid;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    obuton1: Tobuton;
    obuton2: Tobuton;
    ocheckbox1: Tocheckbox;
    ocheckbox2: Tocheckbox;
    ocheckbox3: Tocheckbox;
    opanel1: Topanel;
    opanel2: Topanel;
    oRadiobutton1: ToRadiobutton;
    oRadiobutton2: ToRadiobutton;
    oRadiobutton3: ToRadiobutton;
    oRadiobutton4: ToRadiobutton;
    oRadiobutton5: ToRadiobutton;
    oRadiobutton6: ToRadiobutton;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ocheckbox1Click(Sender: TObject);
    procedure ONButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RadioButton1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  aa:ToRadiobutton;
  rr:TOnGrid;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  case TRadioButton(sender).Tag of
    1 : ocheckbox1.CaptionDirection:=cup;
    2 : ocheckbox1.CaptionDirection:=cdown;
    3 : ocheckbox1.CaptionDirection:=cleft;
    4 : ocheckbox1.CaptionDirection:=cright;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 { aa:=ToRadiobutton.Create(self);
  with aa do
  begin
   Parent:=Form1;
   left:=65;
   top:=100;
  end;
  rr:=TOnGrid.Create(self);
  with rr do
  begin
   Parent:=Form1;
   left:=265;
   top:=300;
  end;
  }

end;

procedure TForm1.BitBtn1Click(Sender: TObject);

 var
  i:integer;
begin
  for i:=0 to form1.ComponentCount-1 do
  begin
   if (form1.Components[i] is ToRadiobutton) then
   ToRadiobutton(form1.Components[i]).Caption:= inttostr(ToRadiobutton(form1.Components[i]).GroupIndex);
end;
end;

procedure TForm1.ocheckbox1Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to form1.ComponentCount-1 do
  begin
   if (form1.Components[i] is ToRadiobutton) then
   ToRadiobutton(form1.Components[i]).Transparent:= not ToRadiobutton(form1.Components[i]).Transparent;
end;

end;

procedure TForm1.ONButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 // TImage(sender).Picture;
end;

end.

