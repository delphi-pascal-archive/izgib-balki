unit Izgib_b;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    GroupBox5: TGroupBox;
    ComboBox1: TComboBox;
    Image5: TImage;
    Button1: TButton;
    Button2: TButton;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Image6: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox7: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox8: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    StringGrid1: TStringGrid;
    Label9: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
   // procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
   //   const Value: String);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
   // procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
    //  var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Image5DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type Tbalca=record
a,b,c,d:array[1..10] of double;
l,F:double;
M,P,q:array[1..10] of double;
Mz,Qy,y,y1:double;
y0,y10,Qo,Mo:double;
E,Jz,Wz,Sr,Sc:double;
xa,xb:double;
Ra,Rb,Qr,Mr:double;
rasmer:array[1..5] of double;
No:string;
end;

var
  Form1: TForm1;
  balca:Tbalca;
  sech:integer;

implementation

{$R *.DFM}
uses cmgraph,tmmgraph,pas_7,math, Unit2, Unit3, Unit4, Unit5;
const dl=15;
      n=200;
var masl,dx:double;
h2,_mx,_my,typ:integer;
// bm:TbitMap;
//    rec:trect;

procedure _xy;
begin
_mx:=screen.Width-800;
_my:=screen.Height-600;
end;

function xnn(n:integer; x:double):double;
var i:integer;
begin
 if n<0 then begin result:=0; exit; end;
 result:=1;
 if n=0 then exit;
 for i:=1 to n do
  result:=result*x/i;
end;
{
function fun_Q(x:double):double;
 var i:integer;
begin
 with balca do
  begin
   result:=Qo;
   for i:=1 to 10 do
    if (P[i]<>0) and (x>b[i]) then
     result:=result+P[i]
    else break;

   for i:=1 to 10 do
    if (q[i]<>0) then
    begin
    if (x>c[i]) then
     result:=result+q[i]*(x-c[i]);
    if (x>d[i]) then
     result:=result-q[i]*(x-d[i]);
    end
    else break;
  end;
end;

function fun_M(x:double):double;
 var i:integer;
begin
 with balca do
  begin
   result:=Mo+Qo*x;
   for i:=1 to 10 do
    if (M[i]<>0) then
    begin
    if (x>a[i]) then
     result:=result+M[i];
    end
    else break;

   for i:=1 to 10 do
    if (P[i]<>0) then
    begin
     if (x>=b[i]) then
     result:=result+P[i]*xnn(1,x-b[i]);
    end
    else break;

   for i:=1 to 10 do
    if (q[i]<>0) then
    begin
    if (x>=c[i]) then
     result:=result+q[i]*xnn(2,x-c[i]);
    if (x>=d[i]) then
     result:=result-q[i]*xnn(2,x-d[i]);
    end
    else break;
  end;
end;

function fun_y(x:double):double;
 var i:integer;
begin
 with balca do
  begin
   result:=Mo*xnn(2,x)+Qo*xnn(3,x);
   for i:=1 to 10 do
    if (M[i]<>0) and (x>=a[i]) then
     result:=result+M[i]*xnn(2,x-a[i])
    else break;

   for i:=1 to 10 do
    if (P[i]<>0) and (x>b[i]) then
     result:=result+P[i]*xnn(3,x-b[i])
    else break;

   for i:=1 to 10 do
    if (q[i]<>0) then
    begin
    if (x>c[i]) then
     result:=result+q[i]*xnn(4,x-c[i]);
    if (x>d[i]) then
     result:=result-q[i]*xnn(4,x-d[i]);
    end
    else break;
  end;
end;

function fun_y1(x:double):double;
 var i:integer;
begin
 with balca do
  begin
   result:=Mo*xnn(1,x)+Qo*xnn(2,x);
   for i:=1 to 10 do
    if (M[i]<>0) and (x>=a[i]) then
     result:=result+M[i]*xnn(2,x-a[i])
    else break;

   for i:=1 to 10 do
    if (P[i]<>0) and (x>=b[i]) then
     result:=result+P[i]*xnn(2,x-b[i])
    else break;

   for i:=1 to 10 do
    if (q[i]<>0) then
    begin
    if (x>=c[i]) then
     result:=result+q[i]*xnn(3,x-c[i]);
    if (x>=d[i]) then
     result:=result-q[i]*xnn(3,x-d[i]);
    end
    else break;
  end;
end;
 }
function fun_QMy1y(pr:integer; x:double):double;
 //pr=0->Q, pr=1->M, pr=2->y', pr=3->y
 var i:integer;
begin
 with balca do
  begin
   result:=Mo*xnn(pr-1,x)+Qo*xnn(pr,x);

   if pr>0 then
   for i:=1 to 10 do
    if (M[i]<>0) then
    begin
     if (x>a[i]) then
     result:=result+M[i]*xnn(pr-1,x-a[i])
   end
    else break;

   for i:=1 to 10 do
    if (P[i]<>0) then
    begin
    if (x>b[i]) then
     result:=result+P[i]*xnn(pr,x-b[i])
    end
    else break;
   if typ=3 then
   begin
    if x>xa then
    result:=result+Ra*xnn(pr,x-xa);
    if x>xb then
    result:=result+Rb*xnn(pr,x-xb);
   end;
   for i:=1 to 10 do
    if (q[i]<>0) then
    begin
    if (x>c[i]) then
     result:=result+q[i]*xnn(pr+1,x-c[i]);
    if (x>d[i]) then
     result:=result-q[i]*xnn(pr+1,x-d[i]);
    end
    else break;
  end;
end;


procedure utch(image:Timage;h0:integer);
var i,j:integer;
begin
obj_image.pen.Width:=1;
obj_image.pen.Color:=clyellow;
line(dl,h0,dl,image.Height);
for j:=1 to 10 do
if balca.M[j]<>0 then
begin
i:=dl+round(balca.a[j]*masl);
line(i,h0,i,image.Height);
end
else break;
for j:=1 to 10 do
if balca.P[j]<>0 then
begin
i:=dl+round(balca.b[j]*masl);
line(i,h0,i,image.Height);
end
else break;
if typ=3 then
begin
i:=dl+round(balca.xa*masl);
line(i,h0,i,image.Height);
i:=dl+round(balca.xb*masl);
line(i,h0,i,image.Height);
end;
for j:=1 to 10 do
if balca.q[j]<>0 then
begin
i:=dl+round(balca.c[j]*masl);
line(i,h0,i,image.Height);
i:=dl+round(balca.d[j]*masl);
line(i,h0,i,image.Height);
end
else break;
i:=dl+round(balca.l*masl);
line(i,h0,i,image.Height);
if h0<>0 then exit;
obj_image.TextOut(image.Width-10,h2-15,'+');
obj_image.TextOut(image.Width-10,h2,'-');
end;

procedure TForm1.Button1Click(Sender: TObject);
const delta=5;
var i,xc,yc,n_n,j:integer;
    x,r0,r1,r2,r3,r4:double;
    x_c,y_c:array[0..20] of integer;
  //  x_ic,y_ic:array[0..200] of double;
    st:string;
begin
  form2.series1.clear;
  form3.series1.clear;
  form4.series1.clear;
  form2.series2.clear;
  form3.series2.clear;
  form4.series2.clear;
  form2.series3.clear;
  form3.series3.clear;
  form4.series3.clear;
with balca do
begin
 if (typ=3) and (xb<=xa) and (xa>=0) then
 begin
  showmessage('Проверте введенные данные!');
  exit;
 end;
F:=0.01; // площадь сечения
Jz:=0.005;//момент инерции сечения
case typ of
1:
begin
 //Qo=Ro и Mo слева
 Ra:=0;
 Rb:=0;
 Qo:=0;
 Mo:=0;
 for i:=1 to 10 do
  begin
   Qo:=Qo-P[i]-q[i]*(d[i]-c[i]);
   Mo:=Mo-M[i]+P[i]*b[i]+q[i]*(sqr(d[i])-sqr(c[i]))/2;
  end;
  Qr:=Qo;
  Mr:=Mo;
 //прогиб и поворот слева
 y0:=0;
 y10:=0;
end;
2:
begin
 //Qo= и Mo слева
 Ra:=0;
 Rb:=0;
 Qr:=0;
 Mr:=0;
 for i:=1 to 10 do
  begin
   Qr:=Qr-P[i]-q[i]*(d[i]-c[i]);
   Mr:=Mr-M[i]-P[i]*(l-b[i])-q[i]*(d[i]-c[i])*(l-(d[i]+c[i])/2);
  end;
  Qo:=0;
  Mo:=0;
 //прогиб и поворот слева
 y10:=-fun_QMy1y(2,l)/E/Jz;
 y0:=-fun_QMy1y(3,l)/E/Jz-y10*l;
end;
3:
begin
 //Qo=Ro и Mo слева
 Qo:=0;
 Mo:=0;
 Qr:=0;
 Mr:=0;
 for i:=1 to 10 do
  begin
   Qr:=Qr-P[i]-q[i]*(d[i]-c[i]);
   Mr:=Mr-M[i]+P[i]*b[i]+q[i]*(sqr(d[i])-sqr(c[i]))/2;
  end;
 Ra:=(Qr*xb+Mr)/(xb-xa);
 Rb:=-(Qr*xa+Mr)/(xb-xa);
 //прогиб и поворот слева
 x:=-fun_QMy1y(3,xa)/E/Jz;
 y0:=-fun_QMy1y(3,xb)/E/Jz;
 y10:=(y0-x)/(xb-xa);
 y0:=x-xa*y10;
end;
end;//case
end;//with

//балка
groupbox1.Caption:='Схема балки';
dx:=balca.l/n;
masl:=(image1.Width-2*dl)/balca.l;
Obj_image:=image1.canvas;  //область рисования
obj_image.FillRect(rect(0,0,image1.width,image1.height));
//pas_7.setbkcolor(clmenu);
h2:=image1.height div 2;
 utch(image1,h2);
setcolor(clblack);
setlinestyle(0,0,3);
line(dl,h2,image1.width-dl,h2);
setlinestyle(0,0,0);
if typ=3 then
begin
opora(1,dl+round(balca.xb*masl),h2+3,0,clblue);
opora(2,dl+round(balca.xa*masl),h2+3,0,clgreen);
sila(dl+round(balca.xa*masl),h2+20,30,180,clred);
sila(dl+round(balca.xb*masl),h2+20,30,180,clred);
obj_image.TextOut(dl+round(balca.xa*masl)+2,2*h2-10,'Ra');
obj_image.TextOut(dl+round(balca.xb*masl)+2,2*h2-10,'Rb');
end;
if typ=1 then
begin
opora(3,dl,h2,0,clblack);
sila(dl,h2+20,30,180,clred);
obj_image.TextOut(2,2*h2-10,'Ra');
dugstr(-1,dl+10,h2,20,100,240,clred,xc,yc);
obj_image.TextOut(2,h2-35,'Ma');
end;
if typ=2 then
begin
opora(3,dl+round(balca.l*masl),h2,180,clblack);
sila(dl+round(balca.l*masl),h2+20,30,180,clred);
obj_image.TextOut(dl+round(balca.l*masl)+2,2*h2-10,'Ra');
dugstr(-1,dl+round(balca.l*masl)-8,h2,20,-50,70,clred,xc,yc);
obj_image.TextOut(dl+round(balca.l*masl),h2-35,'Ma');
end;
Obj_image.Font.Name:='Times New Roman';
Obj_image.Font.Size:=6;
for j:=1 to 10 do
if balca.P[j]<>0 then
begin
if balca.P[j]>0 then i:=180 else i:=0;
sila(dl+round(balca.b[j]*masl),h2,30,i,clblue);
Obj_image.Font.Color:=clblue;
Obj_image.TextOut(160,10,'P');
end
else break;
for j:=1 to 10 do
if balca.M[j]<>0 then
begin
if balca.M[j]>0 then i:=-1 else i:=1;
moment(18*i,dl+round(balca.a[j]*masl),h2,0,clgreen);
Obj_image.Font.Color:=clgreen;
Obj_image.TextOut(80,10,'M');
end
else break;
for j:=1 to 10 do
if balca.q[j]<>0 then
begin
if balca.q[j]>0 then i:=-1 else i:=1;
nagq(7*i,dl+round(balca.c[j]*masl),h2-2,dl+round(balca.d[j]*masl),h2-2,clmaroon);
Obj_image.Font.Color:=clmaroon;
Obj_image.TextOut(240,10,'q');
end
else break;
{
Obj_image.Font.Color:=clred;
sila(dl,h2-32,30,180,clblack);
Obj_image.TextOut(5,4,'Qo');
moment(-10,dl,h2,0,clblack);
Obj_image.TextOut(25,17,'Mo');
}
if typ<>3 then
 begin
  str(balca.Qr/1000:0:3,st);
  label7.Caption:='Ra='+st+'Кн';
  str(balca.Mr/1000:0:3,st);
  label8.Caption:='Ma='+st+'Кнм';
 end
else
 begin
  str(balca.Ra/1000:0:3,st);
  label7.Caption:='Ra='+st+'Кн';
  str(balca.Rb/1000:0:3,st);
  label8.Caption:='Rb='+st+'Кнм';
 end;
{
Obj_image:=form1.Canvas;
//pas_7.setbkcolor(clYellow);
Obj_image.brush.color:=form1.Color;
setcolor(clred);
mex1s(80,320,50,300,0);
hedww(50,300,120,400);
mex1s(180,320,120,400,0);
}
//Эпюра Q
Obj_image:=image2.canvas;  //область рисования
Obj_image.brush.color:=clwhite;
Obj_image.brush.Style:=bssolid;
obj_image.FillRect(rect(0,0,image1.width,image1.height));
//pas_7.setbkcolor(cllime);
utch(image2,0);
x:=0;
Obj_image.pen.Color:=clblue;
Obj_image.MoveTo(image1.width-dl,h2);
Obj_image.lineTo(dl,h2);
//j:=0;
with balca,Obj_image do
begin
while x-l<=dx/2 do
 begin
 {
  if x>b[1] then r1:=1 else r1:=0;
  if x>c[1] then r2:=x-c[1] else r2:=0;
  if x>d[1] then r3:=x-d[1] else r3:=0;
  Qy:=Qo+P[1]*r1+q[1]*(r2-r3);
 }
 Qy:=fun_QMy1y(0,x);
 // Qy:=fun_Q(x);
//  lineto(dl+round(x*masl),h2-round(0.0012*Qy));
  //график
  form2.series1.addxy(x,Qy,'',clblue);
//  x_ic[j]:=form2.series1.XValue[j];
//  y_ic[j]:=form2.series1.YValue[j];
//  inc(j);
  x:=x+dx;
 end;
  str(form2.Series1.MaxYValue/1000:0:3,st);
  label1.Caption:='Qmax='+st+'Кн';
  str(form2.Series1.MinYValue/1000:0:3,st);
  label2.Caption:='Qmin='+st+'Кн';
  with form2.series1 do
  begin
  if abs(maxYvalue)>abs(minYvalue) then r0:=abs(maxYvalue) else r0:=abs(minYvalue);
  r0:=(h2-4)/r0;
  j:=0;
  for i:=1 to Count-1 do
  begin
   xc:=dl+round(xvalue[i]*masl);
   yc:=h2-round(r0*yvalue[i]);
   inc(j);
   lineto(xc,yc);
   if j=delta then
   begin
    lineto(xc,h2);
    moveto(xc,yc);
    j:=0;
   end;
  end;
  x:=(maxYvalue-minYvalue)/10;
  form2.series2.addxy(-0.5,maxYvalue+x,'',clmenu);
  form2.series3.addxy(l+0.5,minYvalue-x,'',clmenu);
 end;
 lineto(dl+round(l*masl),h2);
 {
 brush.Color:=clblack;
 brush.Style:=bsVertical;
for i:=0 to j-1 do
 begin
  x_ic[i]:=round(x_ic[i]*masl);
  y_ic[i]:=round(y_ic[i]*r0);
 end;
 n_n:=0;
 strich(j-1,x_ic[0],y_ic[0],n_n,x_c,y_c);   //штриховка
 while n_n>=0 do
 begin
 FloodFill(dl+x_c[n_n],h2-y_c[n_n],clblue,fsborder);
 dec(n_n);
 end;
 }
 pen.Color:=clblack;
 MoveTo(image1.width,h2);
 lineTo(0,h2);
// utch(image1);
end;
 //form2.show;

 //Эпюра M
Obj_image:=image3.canvas;  //область рисования
Obj_image.brush.color:=clwhite;
Obj_image.brush.Style:=bssolid;
obj_image.FillRect(rect(0,0,image1.width,image1.height));
//pas_7.setbkcolor(clred);
utch(image3,0);
x:=0;
Obj_image.pen.Color:=clblue;
Obj_image.MoveTo(image1.width-dl,h2);
Obj_image.lineTo(dl,h2);
//j:=0;
with balca,Obj_image do
begin
while x-l<=dx/2 do
 begin
 {
  if x>a[1] then r1:=1 else r1:=0;
  if x>b[1] then r2:=x-b[1] else r2:=0;
  if x>c[1] then r3:=sqr(x-c[1])/2 else r3:=0;
  if x>d[1] then r4:=sqr(x-d[1])/2 else r4:=0;
  Mz:=Mo+Qo*x+M[1]*r1+P[1]*r2+q[1]*(r3-r4);
  }
 Mz:=fun_QMy1y(1,x);
// Mz:=fun_M(x);
//  lineto(dl+round(x*masl),h2-round(0.0004*Mz));
  //график
  form3.series1.addxy(x,Mz,'',clblue);
//  x_ic[j]:=form3.series1.XValue[j];
//  y_ic[j]:=form3.series1.YValue[j];
//  inc(j);
  x:=x+dx;
 end;
  str(form3.Series1.MaxYValue/1000:0:3,st);
  label3.Caption:='Mmax='+st+'Кнм';
  str(form3.Series1.MinYValue/1000:0:3,st);
  label4.Caption:='Mmin='+st+'Кнм';

  with form3.series1 do
  begin
  if abs(maxYvalue)>abs(minYvalue) then r0:=abs(maxYvalue) else r0:=abs(minYvalue);
  r0:=(h2-4)/r0;
  j:=0;
  for i:=1 to Count-1 do
   begin
   xc:=dl+round(xvalue[i]*masl);
   yc:=h2-round(r0*yvalue[i]);
   inc(j);
   lineto(xc,yc);
   if j=delta then
   begin
    lineto(xc,h2);
    moveto(xc,yc);
    j:=0;
   end;
   end;
  x:=(maxYvalue-minYvalue)/10;
  form3.series2.addxy(-0.5,maxYvalue+x,'',clmenu);
  form3.series3.addxy(l+0.5,minYvalue-x,'',clmenu);
 end;
 lineto(dl+round(l*masl),h2);
{
 brush.Color:=clblack;
 brush.Style:=bsVertical;
for i:=0 to j-1 do
 begin
  x_ic[i]:=round(x_ic[i]*masl);
  y_ic[i]:=round(y_ic[i]*r0);
 end;
 n_n:=0;
 strich(j-1,x_ic[0],y_ic[0],n_n,x_c,y_c);   //штриховка
 while n_n>=0 do
 begin
 FloodFill(dl+x_c[n_n],h2-y_c[n_n],clblue,fsborder);
 dec(n_n);
 end;
 }
 pen.Color:=clblack;
 MoveTo(image1.width,h2);
 lineTo(0,h2);
// utch(image2);
end;

//прогиб ,поворот сечения
Obj_image:=image4.canvas;  //область рисования
obj_image.FillRect(rect(0,0,image1.width,image1.height));
//pas_7.setbkcolor(clwhite);
utch(image4,0);
x:=0;
Obj_image.pen.Color:=clblack;
Obj_image.MoveTo(image1.width-dl,h2);
Obj_image.lineTo(dl,h2);

with balca,Obj_image do
if Jz<>0 then
begin
r0:=E*Jz;
pen.Width:=2;
pen.Color:=clblue;
while x-l<=dx/2 do
 begin
 {
  if x>a[1] then r1:=xnn(2,x-a[1]) else r1:=0;
  if x>b[1] then r2:=xnn(3,x-b[1]) else r2:=0;
  if x>c[1] then r3:=xnn(4,x-c[1]) else r3:=0;
  if x>d[1] then r4:=xnn(4,x-d[1]) else r4:=0;
  y:=y0+y10*x+(Mo*xnn(2,x)+Qo*xnn(3,x)+M[1]*r1+P[1]*r2+q[1]*(r3-r4))/r0;
  }
 y:=y0+y10*x+fun_QMy1y(3,x)/r0;//прогиб
 y1:=y10+fun_QMy1y(2,x)/r0; //поворот сечения
 // lineto(dl+round(x*masl),h2-round(15*y));
  //график
  form4.series1.addxy(x,y,'',clblue);
  x:=x+dx;
 end;
  str(form4.Series1.MaxYValue*1000:0:1,st);
  label5.Caption:='бmax='+st+'мм';
  str(form4.Series1.MinYValue*1000:0:1,st);
  label6.Caption:='бmin='+st+'мм';

  with form4.series1 do
  begin
  if abs(maxYvalue)>abs(minYvalue) then r0:=abs(maxYvalue) else r0:=abs(minYvalue);
  r0:=(h2-4)/r0;
  for i:=0 to Count-1 do
   if i=0 then
   moveto(dl+round(xvalue[i]*masl),h2-round(r0*yvalue[i]))
   else
   lineto(dl+round(xvalue[i]*masl),h2-round(r0*yvalue[i]));
  x:=(maxYvalue-minYvalue)/10;
  form4.series2.addxy(-0.5,maxYvalue+x,'',clmenu);
  form4.series2.addxy(l+0.5,minYvalue-x,'',clmenu);
  form4.series3.addxy(0,0,'',clblack);
  form4.series3.addxy(l,0,'',clblack);
 end;
//utch(image3);
end;
end;

procedure ris_sech(typ:integer);
const r=25;
      a=40; b=60;
      h=20;
var x1,y1,rr,rr1,rr2:integer;
begin
with form1 do
begin
Obj_image:=image5.canvas;  //область рисования
Obj_image.brush.color:=clwhite;
Obj_image.brush.Style:=bssolid;
obj_image.FillRect(rect(0,0,image5.width,image5.height));
case typ of
1:
begin
x1:=image5.width div 2;
y1:=image5.height div 2-10;
circle(x1,y1,r);
setfillstyle(4,clred);
pas_7.FloodFill(x1,y1,getcolor);
line(x1-r,y1,x1-r,y1+r+h);
line(x1+r,y1,x1+r,y1+r+h);
ras_line(x1-r,y1+r+h,x1+r,y1+r+h,'d',-15);
end;
2:
begin
x1:=image5.width div 2;
y1:=image5.height div 2-10;
rr:=a div 2;
obj_image.rectangle(x1-rr,y1-rr,x1+rr,y1+rr);
setfillstyle(4,clred);
pas_7.FloodFill(x1,y1,getcolor);
line(x1-rr,y1+rr,x1-rr,y1+rr+h);
line(x1+rr,y1+rr,x1+rr,y1+rr+h);
ras_line(x1-rr,y1+rr+h,x1+rr,y1+rr+h,'b',-15);
end;
3:
begin
x1:=image5.width div 2;
y1:=image5.height div 2-10;
circle(x1,y1,r);
circle(x1,y1,r-8);
setfillstyle(4,clred);
pas_7.FloodFill(x1-r+2,y1,getcolor);
line(x1-r,y1,x1-r,y1+r+h);
line(x1+r,y1,x1+r,y1+r+h);
ras_line(x1-r,y1+r+h,x1+r,y1+r+h,'d',-15);
ras_line(x1-r+8,y1,x1+r-8,y1,'d''',-15);
end;
4:
begin
x1:=image5.width div 2-10;
y1:=image5.height div 2-5;
rr:=a div 2;
rr1:=b div 2;
obj_image.rectangle(x1-rr,y1-rr1,x1+rr,y1+rr1);
setfillstyle(4,clred);
pas_7.FloodFill(x1,y1,getcolor);
line(x1-rr,y1+rr1,x1-rr,y1+rr1+h);
line(x1+rr,y1+rr1,x1+rr,y1+rr1+h);
ras_line(x1-rr,y1+rr1+h-5,x1+rr,y1+rr1+h-5,'b',-15);
line(x1+rr,y1-rr1,x1+rr+h,y1-rr1);
line(x1+rr,y1+rr1,x1+rr+h,y1+rr1);
ras_line(x1+rr+h,y1-rr1,x1+rr+h,y1+rr1,'h',10);
end;
5://короб
begin
x1:=image5.width div 2-10;
y1:=image5.height div 2-5;
rr:=a div 2;
rr1:=b div 2;
rr2:=8;
obj_image.rectangle(x1-rr,y1-rr1,x1+rr,y1+rr1);
obj_image.rectangle(x1-rr+rr2,y1-rr1+rr2,x1+rr-rr2,y1+rr1-rr2);
setfillstyle(4,clred);
pas_7.FloodFill(x1-rr+2,y1,getcolor);
line(x1-rr,y1+rr1,x1-rr,y1+rr1+h);
line(x1+rr,y1+rr1,x1+rr,y1+rr1+h);
ras_line(x1-rr,y1+rr1+h-5,x1+rr,y1+rr1+h-5,'b',-15);
line(x1+rr,y1-rr1,x1+rr+h,y1-rr1);
line(x1+rr,y1+rr1,x1+rr+h,y1+rr1);
ras_line(x1+rr+h,y1-rr1,x1+rr+h,y1+rr1,'h',-5);
ras_line(x1-rr+rr2,y1+5,x1+rr-rr2,y1+5,'b''',-15);
line(x1+rr-rr2,y1-rr1+rr2,x1+rr+5,y1-rr1+rr2);
line(x1+rr-rr2,y1+rr1-rr2,x1+rr+5,y1+rr1-rr2);
ras_line(x1+rr+5,y1-rr1+rr2,x1+rr+5,y1+rr1-rr2,'h''',-3);
end;
6: //двутавр
begin
x1:=image5.width div 2;
y1:=image5.height div 2;
rr:=a div 2;
rr1:=b div 2;
moveto(x1-rr,y1-rr1);
lineto(x1+rr,y1-rr1);
rr2:=4;
lineto(x1+rr-3,y1-rr1+3);
lineto(x1+rr2,y1-rr1+5);
lineto(x1+rr2,y1+rr1-5);
lineto(x1+rr-3,y1+rr1-3);
lineto(x1+rr,y1+rr1);
lineto(x1-rr,y1+rr1);
lineto(x1-rr+3,y1+rr1-3);
lineto(x1-rr2,y1+rr1-5);
lineto(x1-rr2,y1-rr1+5);
lineto(x1-rr+3,y1-rr1+3);
lineto(x1-rr,y1-rr1);
setfillstyle(4,clred);
pas_7.FloodFill(x1,y1,getcolor);
sistcoord(x1,y1,0,30,45,0);
sistcoord1(x1,y1,180,30,45,0);
obj_image.TextOut(x1+34,y1-10,'z');
obj_image.TextOut(x1+5,y1-50,'y');
end;
7:  //швеллер
begin
x1:=image5.width div 2;
y1:=image5.height div 2;
rr:=a div 2;
rr1:=b div 2;
moveto(x1-rr,y1-rr1);
lineto(x1+rr,y1-rr1);
rr2:=x1-rr+7;
lineto(x1+rr-3,y1-rr1+3);
lineto(rr2,y1-rr1+5);
lineto(rr2,y1+rr1-5);
lineto(x1+rr-3,y1+rr1-3);
lineto(x1+rr,y1+rr1);
lineto(x1-rr,y1+rr1);
lineto(x1-rr,y1-rr1);
setfillstyle(4,clred);
pas_7.FloodFill(rr2-2,y1,getcolor);
x1:=x1-8;
sistcoord(x1,y1,0,30,45,0);
sistcoord1(x1,y1,180,30,45,0);
obj_image.TextOut(x1+34,y1-10,'z');
obj_image.TextOut(x1+5,y1-50,'y');
end;
8:  //уголок
begin
x1:=image5.width div 2;
y1:=image5.height div 2;
rr:=(a+5) div 3;
rr1:=2*rr;
rr2:=7;
moveto(x1-rr,y1-rr1);
lineto(x1-rr+rr2,y1-rr1+rr2);
lineto(x1-rr+rr2,y1+rr-11);
lineto(x1-rr+11,y1+rr-rr2);
lineto(x1+rr1-rr2,y1+rr-rr2);
lineto(x1+rr1,y1+rr);
lineto(x1-rr,y1+rr);
lineto(x1-rr,y1-rr1);
setfillstyle(4,clred);
pas_7.FloodFill(x1-rr+2,y1-rr-2,getcolor);
sistcoord(x1,y1,0,30,45,0);
sistcoord1(x1,y1,180,30,45,0);
obj_image.TextOut(x1+34,y1-10,'z');
obj_image.TextOut(x1+5,y1-50,'y');
end;
end;//case
end;//with
end;

procedure TForm1.FormShow(Sender: TObject);
var h2,i,j:integer;
    s:string;
    xc,yc:integer;
begin
image1.Canvas.FillRect(rect(0,0,width,height));
// masx:=0.5; masy:=0.5;
ris_sech(1);
//схема балки
groupbox1.Caption:='Начальные параметры';
Obj_image:=image1.canvas;  //область рисования
//pas_7.setbkcolor(clmenu);
h2:=image1.height div 2;
 with balca do
begin
l:=8;//длина балки
m[1]:=1;
p[1]:=1;
q[1]:=1;
a[1]:=1.3; // M
b[1]:=3.2; // P
c[1]:=4.8;
d[1]:=6.9; // q
end;
masl:=(image1.Width-2*dl)/balca.l;
 utch(image1,h2);

 with balca do
begin
for i:=1 to 10 do
begin
 a[i]:=0;
 b[i]:=0;
 c[i]:=0;
 d[i]:=0;
 M[i]:=0;
 P[i]:=0;
 q[i]:=0;
end;
l:=8;//длина балки
dx:=l/n; //шаг по Х
a[1]:=2; // M
a[2]:=5; // M
b[1]:=4; // P
b[2]:=1; // P
//b[3]:=8; // P
c[1]:=6; d[1]:=8; // q
c[2]:=2; d[2]:=4; // q
M[1]:=-100000;   //момент
M[2]:=100000;   //момент
P[1]:=-20000;   //сила
P[2]:=-20000;   //сила
//P[3]:=20000;   //сила
q[1]:=-10000;    // распределенная нагрузка
q[2]:=10000;    // распределенная нагрузка
F:=0.01; // площадь сечения
Jz:=0.005;//момент инерции сечения
//E:=160E6; //Модуль Юнга
//Qo=Ro и Mo слева
Qo:=0;
Mo:=0;
for i:=1 to 10 do
begin
Qo:=Qo-P[i]-q[i]*(d[i]-c[i]);
Mo:=Mo-M[i]+P[i]*b[i]+q[i]*(sqr(d[i])-sqr(c[i]))/2;
end;
//прогиб и поворот слева
y0:=0;
y10:=0;
for i:=1 to 10 do
begin
 if M[i]<>0 then
  begin
    str(a[i]:0:3,s);
    stringgrid1.cells[i,0]:=s;
    str(M[i]:0:0,s);
    stringgrid1.cells[i,1]:=s;
  end;
 if P[i]<>0 then
  begin
    str(b[i]:0:3,s);
    stringgrid1.cells[i,2]:=s;
    str(P[i]:0:0,s);
    stringgrid1.cells[i,3]:=s;
  end;
 if q[i]<>0 then
  begin
    str(c[i]:0:3,s);
    stringgrid1.cells[i,4]:=s;
    str(d[i]:0:3,s);
    stringgrid1.cells[i,5]:=s;
    str(q[i]:0:0,s);
    stringgrid1.cells[i,6]:=s;
  end;
    str(l:0:3,s);
    edit1.Text:=s;
end;

end;
masl:=(image1.Width-2*dl)/balca.l;

setcolor(clblack);
setlinestyle(0,0,3);
line(dl,h2,image1.width-dl,h2);
setlinestyle(0,0,0);
if typ=1 then
opora(3,dl,h2,0,clblack);
if typ=2 then
opora(3,dl+round(balca.l*masl),h2,180,clblack);
if typ=3 then
begin
opora(2,dl+60,h2+4,0,clblack);
opora(1,dl+200,h2+4,0,clblack);
end;
Obj_image.Font.Name:='Times New Roman';
Obj_image.Font.Size:=6;
sila(125,h2-30,30,180,clblue);
Obj_image.Font.Color:=clblue;
Obj_image.TextOut(130,10,'P');
Obj_image.TextOut(136,13,'i');
line(dl,h2+25,125,h2+25);
Obj_image.TextOut(92,h2+11,'b');
Obj_image.TextOut(98,h2+13,'i');
moment(-18,60,h2,0,clgreen);
Obj_image.Font.Color:=clgreen;
Obj_image.TextOut(60,13,'M');
Obj_image.TextOut(70,16,'i');
line(dl,h2+16,60,h2+16);
Obj_image.TextOut(30,h2+2,'a');
Obj_image.TextOut(35,h2+4,'i');
nagq(-7,180,h2-2,250,h2-2,clmaroon);
Obj_image.Font.Color:=clmaroon;
Obj_image.TextOut(200,10,'q');
Obj_image.TextOut(206,13,'i');
line(dl,h2+35,180,h2+35);
line(dl,h2+45,250,h2+45);
Obj_image.TextOut(150,h2+20,'c');
Obj_image.TextOut(155,h2+23,'i');
Obj_image.TextOut(215,h2+30,'d');
Obj_image.TextOut(221,h2+33,'i');
Obj_image.Font.Color:=clred;
sila(dl,h2-32,30,180,clblack);
Obj_image.TextOut(5,4,'Qo');
//dugstr(1,20,h2,20,0,90,clblack,xc,yc);
moment(-10,dl,h2,0,clblack);
Obj_image.TextOut(25,15,'Mo');
Obj_image.TextOut(1,h2-16,'y');
Obj_image.TextOut(5,h2-12,'o');
Obj_image.TextOut(1,h2-1,'y''');
Obj_image.TextOut(5,h2+4,'o');

end;

procedure TForm1.Image2DblClick(Sender: TObject);
begin
 form2.Show;
end;

procedure TForm1.Image3DblClick(Sender: TObject);
begin
form3.Show;
end;

procedure TForm1.Image4DblClick(Sender: TObject);
begin
form4.Show;
end;

procedure Mex_X(e0,s1,s2:double);
begin
with form1,balca do
begin
  E:=e0;
  panel2.Caption:=inttostr(round(E));
  Sr:=s1;
  Sc:=s2;
  panel5.Caption:=floattostr(Sr);
  panel6.Caption:=floattostr(Sc);
end;  
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
typ:=1;
sech:=1;
edit2.Enabled:=false;
edit3.Enabled:=false;
radiobutton1.Checked:=true;
combobox1.ItemIndex:=0;
combobox2.ItemIndex:=0;
_xy;  //масштаб
Obj_image:=image6.Canvas;
image6.Canvas.Brush.Color:=clmenu;
image6.Canvas.FillRect(rect(0,0,width,height));
opora(3,10,image6.height div 7,0,clred);
setcolor(clred);
line(10,image6.height div 7,80,image6.height div 7);
opora(3,80,image6.height div 2,180,clred);
line(10,image6.height div 2,80,image6.height div 2);
opora(1,70,image6.height-20,0,clred);
opora(2,20,image6.height-20,0,clred);
line(10,image6.height-24 ,80,image6.height-24 );
with image7.Canvas do
begin
 brush.Color:=clmenu;
 font.Name:='Times New Romant';
 TextOut(0,0,'      E МПа      ');
end;
with image8.Canvas do
begin
 brush.Color:=clmenu;
 font.Name:='Times New Romant';
 TextOut(0,0,'   [     ] МПа      ');
 font.Size:=6;
 TextOut(21,3,'p');
 font.Size:=8;
 font.Name:='GreekS';
 TextOut(13,-2,'s');
end;
with image9.Canvas do
begin
 brush.Color:=clmenu;
 font.Name:='Times New Romant';
 TextOut(0,0,'   [     ] МПа      ');
 font.Size:=6;
 TextOut(21,3,'c');
 font.Name:='GreekS';
 font.Size:=8;
 TextOut(13,-2,'s');
end;
with stringgrid1 do
begin
 cells[0,0]:='ai, м';
 cells[0,1]:='Mi, Нм';
 cells[0,2]:='bi, м';
 cells[0,3]:='Pi, Н';
 cells[0,4]:='ci, м';
 cells[0,5]:='di, м';
 cells[0,6]:='qi, Н/м';
end;
Mex_X(2e5,160,160);
balca.E:=2e11;   //сталь
balca.Sr:=160e6;
balca.Sc:=160e6;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
print;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
if radiobutton1.Checked then typ:=1;
formshow(self);
edit2.Enabled:=false;
edit3.Enabled:=false;
button1.Enabled:=true;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
if radiobutton2.Checked then typ:=2;
formshow(self);
edit2.Enabled:=false;
edit3.Enabled:=false;
button1.Enabled:=true;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
if radiobutton3.Checked then typ:=3;
formshow(self);
edit2.Enabled:=true;
edit3.Enabled:=true;
button1.Enabled:=false;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
with balca do
begin
case combobox2.ItemIndex of
0:  //Сталь
 Mex_X(2e5,160,160);
1:  //чугун
 Mex_X(1.2e5,80,150);
2:  //МЕДЬ
 Mex_X(1e5,120,120);
3:  //алюминий
 Mex_X(0.7e5,150,150);
4:  //дерево  вдоль волокон
 Mex_X(0.1e5,8,8);
5:  //текстолит
 Mex_X(0.06e5,40,40);
6:  //бетон
 Mex_X(0.2e5,0.7,9);
end;
E:=E*1e6;
Sr:=Sr*1e6;
Sc:=Sc*1e6;
end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
 '0'..'9','.',#8:exit;
 #13:exit;
 else key:=#0;
 end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
var i:integer;
begin
 val(edit1.text,balca.l,i);
end;

procedure TForm1.Edit2Exit(Sender: TObject);
var i:integer;
begin
 val(edit2.text,balca.xa,i);
 button1.Enabled:=true;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
 '0'..'9','.',#8:exit;
 #13:exit;
 else key:=#0;
 end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
 '0'..'9','.',#8:exit;
 #13:exit;
 else key:=#0;
 end;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
var i:integer;
begin
 val(edit3.text,balca.xb,i);
 button1.Enabled:=true;
end;
{
var col,row:integer;
procedure TForm1.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
//Val(value,[Arow],i);
end;
}
procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
case key of
'0'..'9','.',#8,'-':exit;
#13:begin  exit end;
else begin key:=#0; messageBeep(MB_OK); end;
end;
end;
{
procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
col:=acol;
row:=arow;
end;
}
procedure TForm1.StringGrid1Exit(Sender: TObject);
var i,k,j:integer;
    r:double;
begin
 with balca,stringgrid1 do
 for k:=0 to 6 do
 for i:=1 to 10 do
  begin
  if Cells[i,k]<>'' then
   val(Cells[i,k],r,j)
   else r:=0;
   case k of
    0:a[i]:=r;
    1:M[i]:=r;
    2:b[i]:=r;
    3:P[i]:=r;
    4:c[i]:=r;
    5:d[i]:=r;
    6:q[i]:=r;
   end;
  end; 
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
 sech:=combobox1.ItemIndex+1;
 ris_sech(sech);
end;

procedure TForm1.Image5DblClick(Sender: TObject);
begin
form5.Caption:=trim(combobox1.Items.Strings[sech-1]);
form5.Showmodal;
end;

end.


