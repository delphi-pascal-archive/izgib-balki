unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, StdCtrls;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}
uses izgib_b;

procedure del(n:byte);
begin
with form5 do
begin
 label7.visible:=true;
 label8.visible:=true;
 Edit4.visible:=true;
 label5.visible:=true;
 label6.visible:=true;
 Edit3.visible:=true;
 label3.visible:=true;
 label4.visible:=true;
 Edit2.visible:=true;
 if n=0 then exit;
 label7.visible:=false;
 label8.visible:=false;
 Edit4.visible:=false;
 if n=1 then exit;
 label5.visible:=false;
 label6.visible:=false;
 Edit3.visible:=false;
 if n=2 then exit;
 label3.visible:=false;
 label4.visible:=false;
 Edit2.visible:=false;
end;
end;

procedure TForm5.FormShow(Sender: TObject);
var fil:system.text;
    i:integer;
    s:string[3];
    r1,r2,r3:double;
begin
if sech in [6,7,8] then
begin
panel2.Visible:=false;
with stringgrid1 do
begin
 Visible:=true;
 cells[0,0]:='        N';
 cells[1,0]:='      Wz';
 cells[2,0]:='      Jz';
 cells[3,0]:='        F';
end;
end
else
begin
stringgrid1.Visible:=false;
panel2.Visible:=true;
end;
case sech of
1:
 begin
  panel1.Caption:='Задайте диаметр круга';
  label1.Caption:='d=';
  del(3);
 end;
2:
 begin
  panel1.Caption:='Задайте сторону квадрата';
  label1.Caption:='b=';
  del(3);
 end;
3:
 begin
  panel1.Caption:='Задайте размеры кольца';
  label1.Caption:='d=';
  label3.Caption:='d''=';
  del(2);
 end;
4:
 begin
  panel1.Caption:='Задайте стороны прямоугольника';
  label1.Caption:='b=';
  label3.Caption:='h=';
  del(2);
 end;
5:
 begin
  panel1.Caption:='Задайте размеры короба';
  label1.Caption:='b=';
  label3.Caption:='h=';
  label5.Caption:='b''=';
  label7.Caption:='h''=';
  del(0);
 end;
6:
 begin
  panel1.Caption:='Выберите двутавр ГОСТ 10016-39';
  system.assign(fil,'dwutawr.dat');
  reset(fil);
  readln(fil);
  i:=0;
  while not eof(fil) do
   begin
    inc(i);
    readln(fil,s,r1,r2,r3);
    stringgrid1.Cells[0,i]:=s;
    stringgrid1.Cells[1,i]:=floattostr(r1);
    stringgrid1.Cells[2,i]:=floattostr(r2);
    stringgrid1.Cells[3,i]:=floattostr(r3);
   end;
 system.close(fil);
 end;
7:
 begin
  panel1.Caption:='Выберите швеллер ГОСТ 10017-39';
  system.assign(fil,'sweller.dat');
  reset(fil);
  readln(fil);
  i:=0;
  while not eof(fil) do
   begin
    inc(i);
    readln(fil,s,r1,r2,r3);
    stringgrid1.Cells[0,i]:=s;
    stringgrid1.Cells[1,i]:=floattostr(r1);
    stringgrid1.Cells[2,i]:=floattostr(r2);
    stringgrid1.Cells[3,i]:=floattostr(r3);
   end;
 system.close(fil);
 end;
8:panel1.Caption:='Выберите уголок ГОСТ 10014-39';
end;//case
end;

procedure geo;
var s:string;
begin
with form5,balca do
 begin
  if rasmer[1]<>0 then
  case sech of
  1:
  begin
   F:=pi*sqr(rasmer[1])/4;
   Jz:=pi*sqr(sqr(rasmer[1]))/32;
   Wz:=2*Jz/rasmer[1];
   str(F:0:9,s);
   label10.Caption:=s;
   str(Jz:0:9,s);
   label14.Caption:=s;
   str(Wz:0:9,s);
   label18.Caption:=s;
  end;
  2:
  begin
   F:=sqr(rasmer[1]);
   Jz:=sqr(sqr(rasmer[1]))/12;
   Wz:=2*Jz/rasmer[1];
   str(F:0:9,s);
   label10.Caption:=s;
   str(Jz:0:9,s);
   label14.Caption:=s;
   str(Wz:0:9,s);
   label18.Caption:=s;
  end;
  3:
  begin
   F:=pi*(sqr(rasmer[1]-sqr(rasmer[2])))/4;
   Jz:=pi*(sqr(sqr(rasmer[1]))-sqr(sqr(rasmer[1])))/32;
   Wz:=2*Jz/rasmer[1];
   str(F:0:9,s);
   label10.Caption:=s;
   str(Jz:0:9,s);
   label14.Caption:=s;
   str(Wz:0:9,s);
   label18.Caption:=s;
  end;
  4:
  if rasmer[2]<>0 then
  begin
   F:=rasmer[1]*rasmer[2];
   Jz:=rasmer[1]*sqr(rasmer[2])*rasmer[2]/12;
   Wz:=2*Jz/rasmer[2];
   str(F:0:9,s);
   label10.Caption:=s;
   str(Jz:0:9,s);
   label14.Caption:=s;
   str(Wz:0:9,s);
   label18.Caption:=s;
  end;
  5:
  if rasmer[2]<>0 then
  begin
   F:=rasmer[1]*rasmer[2]-rasmer[3]*rasmer[4];
   Jz:=(rasmer[1]*sqr(rasmer[2])*rasmer[2]-rasmer[3]*sqr(rasmer[4])*rasmer[4])/12;
   Wz:=2*Jz/rasmer[2];
   str(F:0:9,s);
   label10.Caption:=s;
   str(Jz:0:9,s);
   label14.Caption:=s;
   str(Wz:0:9,s);
   label18.Caption:=s;
  end;
  end;//case
 end;
end;

procedure TForm5.Edit4KeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
case key of
'0'..'9','.',#8:exit;
#13:
 begin
  val(edit4.text,balca.rasmer[4],i);
  geo;
 end;
else key:=#0;
end;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
case key of
'0'..'9','.',#8:exit;
#13:
 begin
  val(edit1.text,balca.rasmer[1],i);
  geo;
 end;
else key:=#0;
end;
end;

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
case key of
'0'..'9','.',#8:exit;
#13:
 begin
  val(edit2.text,balca.rasmer[2],i);
  geo;
 end;
else key:=#0;
end;
end;

procedure TForm5.Edit3KeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
case key of
'0'..'9','.',#8:exit;
#13:
 begin
  val(edit3.text,balca.rasmer[3],i);
  geo;
 end;
else key:=#0;
end;
end;
procedure TForm5.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
with balca,stringgrid1 do
 begin
  No:=trim(Cells[0,Arow]);
  Wz:=strtofloat(Cells[1,Arow])*1e-6;
  Jz:=strtofloat(Cells[2,Arow])*1e-8;
  F:=strtofloat(Cells[3,Arow])*1e-4;
 end;
end;

procedure TForm5.StringGrid1DblClick(Sender: TObject);
var s:string;
begin
s:='Выбран ';
case sech of
6: s:=s+'двутавр N ';
7: s:=s+'швеллер N ';
8: s:=s+'уголок  N ';
end;
showmessage(pchar(s+balca.No+'  Wz='+floattostr(balca.Wz)+'  Jz='+floattostr(balca.Jz)));
end;

end.
