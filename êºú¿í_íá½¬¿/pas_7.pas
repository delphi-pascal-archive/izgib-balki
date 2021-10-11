unit pas_7;

interface
 uses graphics,classes;
const
flag_pas_7:boolean=true;  //флаг использовани€ паскал€/делфи
Black=0; //черный
Blue=1;  //синий
Green=2; //зеленый
Cyan=3;  //голувой
Red=4;  //красный
Magenta=5;  //фиолетовый
Brown=6; //коричневый
LightGray=7; //—ветло-серый
DarkGray=8; //“емно-серый
LightBlue=9;  //—ветло-синий
LightGreen=10; //—ветло-зеленый
LightCyan=11;  //—ветло-голувой
LightRed=12;  //–озовый
LightMagenta=13;  //—ветло-фиолетовый
Yellow=14; //∆елтый
White=15; //Ѕелый
MaxColors=15;
Cl_delphi:array[0..MaxColors] of Tcolor=
(clblack,clNavy,clgreen,clblue,clred,
 clpurple,clmaroon,clltgray,cldkgray,claqua,
 cllime,claqua,clred,clfuchsia,clYellow,clwhite);
//типы линий
SolidLn=0; //сплошна€
DottedLn=1; //пунктирна€
CenterLn=2; //штрихпунктирна€
DashedLn=3; //штрихова€
UserBitLn=4; //пользовательска€
tl_delphi:array[0..4] of Tpenstyle=
(pssolid,psdot,psDashDot,psDash,psClear);
//толшина линий
NormWidth=1;
ThickDidth=3;
//закраска верхней грани
TopOn=true;
TopOff=false;
//орнамент заполнени€
EmptyFill=0; //заполнение цветом фона
SolidFill=1; //заполнение цветом
LineFill=2; //заполнение -----
LtSlashFill=3; //заполнение ///
SlashFill=4; //заполнение ///
BkSlashFill=5; //заполнение \\\
LtBkSlashFill=6; //заполнение \\\
HatchFill=7; //заполнение клеткой
XHatchFill=8; //заполнение косой клеткой
InterleaveFill=9; //заполнение частой сеткой
WideDotFill=10; //заполнение редкими точками
CloseDotFill=11; //заполнение частыми точками
UserFill=12; //заполнение определ€етс€ пользователем
tf_delphi:array[0..12] of tbrushstyle=(bsclear,bssolid,bshorizontal,
bsbdiagonal,bsbdiagonal,bsFdiagonal,bsfdiagonal,bsCross,bsDiagCross,
bscross,bsclear,bsclear,bsVertical);
type
    arccoordstype = record
    x,y:integer; //центр дуги
    xstart,ystart:integer; //начало дуги
    xend,yend:integer; // онец дуги
   end;

  fillsettingstype=record
   pattern:integer;
   color:integer;
  end;

  PaletteType=record
   Size:byte;
   Colors:array[0..MaxColors] of shortint;
  end;

  LineSettingsType=record
   Linestyle:integer;
   Pattern:integer;
   Thickness:integer;
  end;
  FillPatternType=array[1..8] of Byte;

  var
  obj_image:Tcanvas; //холст
  arccoordinate:arccoordstype;
  Time_min:TDateTime;

  Function process_MSec(b:byte):word;
  procedure delay(t:word);
  procedure _Delay(ms:word);
  procedure circle(x,y,r:integer);
  procedure line(x1,y1,x2,y2:integer);
  procedure linerel(dx,dy:integer);
  procedure arc(x,y,f0,fk,r:integer);
  procedure getarccoords(var arc:arccoordstype);
  procedure setcolor(cl:Tcolor);
  function getcolor:Tcolor;
  procedure getfillsettings(var ts: fillsettingstype);
  procedure setfillstyle(ts1,ts2:variant);
  function getpixel(x,y:integer):Tcolor;
  procedure setlinestyle(ls,pa,th:integer);
  procedure putpixel(x,y:integer; c:Tcolor);
  function getx:integer;
  function gety:integer;
  procedure Bar(x1,y1,x2,y2:integer);
  procedure FloodFill(x,y,B:integer);
  procedure moveto(x1,y1:integer);
  procedure lineto(x2,y2:integer);
  procedure setbkcolor(cl:Tcolor);

implementation
  uses math,windows,controls,sysutils;
//
  function getx:integer;
  begin
   with obj_image do
   result:=penpos.x;
  end;

  function gety:integer;
  begin
   with obj_image do
   result:=penpos.y;
  end;

  procedure putpixel(x,y:integer; c:Tcolor);
  begin
   with obj_image do
   if flag_pas_7  and (c in [0..maxcolors]) then
   pixels[x,y]:=cl_delphi[c]
   else
   pixels[x,y]:=c;
  end;

  procedure setlinestyle(ls,pa,th:integer);
  begin
   with obj_image do
   begin
    pen.Style:= tl_Delphi[ls];
    if th<=1 then pen.Width:=1 else pen.width:=th;
   end;
  end;

  function Color_D_P(c:tcolor):integer;
  var i:byte;
  begin
    result:=0;
    for i:=0 to maxcolors do
     if c=cl_Delphi[i] then
     begin
      result:=i;
      exit;
     end;
  end;

  function getpixel(x,y:integer):Tcolor;
  var i:byte;
  begin
   with obj_image do
   result:=pixels[x,y];
   if flag_pas_7 then
    result:=Color_D_P(result);
  end;

  procedure setbkcolor(cl:Tcolor);
  var R:Trect;
  begin
   with obj_image do
   if flag_pas_7  and (cl in [0..maxcolors]) then
   brush.color:=cl_delphi[cl]
   else
   brush.color:=cl;
   with obj_image do
   begin
    getwindowrect(Handle,R);
//    R.TopLeft:=screenToClient(R.TopLeft);
//    R.BottomRight:=screenToClient(R.BottomRight);
    fillrect(R);
   end;
  end;

  procedure setcolor(cl:Tcolor);
  begin
   with obj_image do
   if flag_pas_7  and (cl in [0..maxcolors]) then
   pen.color:=cl_delphi[cl]
   else
   pen.color:=cl;
  end;

  function getcolor:Tcolor;
   var i:byte;
   begin
    with obj_image do
     result:=pen.color;
   if flag_pas_7 then
    result:=Color_D_P(result);
   end;

  function Brush_D_P(c:tbrushstyle):integer;
  var i:byte;
  begin
    result:=0;
    for i:=0 to 12 do
     if c=tf_Delphi[i] then
     begin
      result:=i;
      exit;
     end;
  end;

   procedure getfillsettings(var ts: fillsettingstype);
   begin
    with obj_image do
    begin
     ts.pattern:=Brush_D_P(brush.style);
     ts.color:=color_D_P(brush.color);
    end;
   end;

   procedure setfillstyle(ts1,ts2:variant);
   begin
    with obj_image do
    if flag_pas_7 and (integer(ts1) in [0..12]) and (integer(ts2) in [0..15]) then
    begin
     brush.style:=tf_Delphi[integer(ts1)];
     brush.color:=cl_Delphi[integer(ts2)];
    end
    else
    begin
     brush.style:=ts1;
     brush.color:=ts2;
    end;
   end;

  procedure circle(x,y,r:integer);
  //рисует окружность
  begin
   with obj_image do
    ellipse(x-r,y-r,x+r,y+r);
  end;

  procedure line(x1,y1,x2,y2:integer);
  //рисует отрезок
  begin
   with obj_image do
    begin
     moveto(x1,y1);
     lineto(x2,y2);
    end;
  end;

  procedure moveto(x1,y1:integer);
  //рисует отрезок
  begin
   with obj_image do
    begin
     moveto(x1,y1);
    end;
  end;

  procedure lineto(x2,y2:integer);
  //рисует отрезок
  begin
   with obj_image do
    begin
     lineto(x2,y2);
    end;
  end;

  procedure linerel(dx,dy:integer);
  //рисует отрезок
  begin
   with obj_image do
     lineto(penpos.x+dx,penpos.y+dy);
  end;

  //рисует дугу
  procedure arc(x,y,f0,fk,r:integer); 
  var x3,y3,x4,y4:integer;
      rr:double;
  begin
   rr:=degtorad(f0);
   x3:=round(x+r*cos(rr));
   y3:=round(y-r*sin(rr));
   rr:=degtorad(fk);
   x4:=round(x+r*cos(rr));
   y4:=round(y-r*sin(rr));
   arccoordinate.x:=x;
   arccoordinate.y:=y;
   with arccoordinate do
    begin
     xstart:=x3;
     ystart:=y3;
     xend:=x4;
     yend:=y4;
    end;
   with obj_image do
    begin
     arc(x-r,y-r,x+r,y+r,x3,y3,x4,y4);
    end;
  end;

  procedure getarccoords(var arc:arccoordstype);
  begin
   with arccoordinate do
    begin
     arc.xstart:=xstart;
     arc.ystart:=ystart;
     arc.xend:=xend;
     arc.yend:=yend;
     arc.x:=x;
     arc.y:=y;
    end;
  end;

 procedure FloodFill(x,y,B:integer);  overload;
 begin
   with obj_image do
     FloodFill(x,y,b,fsborder);
 end;

 procedure Bar(x1,y1,x2,y2:integer);
 begin
  with obj_image do
   fillrect(rect(x1,y1,x2,y2));
 end;
   //перевод времени в милисекунды
  function t_sec(h,m,s,ms:word):longint;
   begin
    t_sec:=((h*60+m)*60+s)*1000+ms;
   end;

//длительность процесса
Function process_MSec(b:byte):word;
 var time0,time1:longint;
     h,m,s,ms,h1:word;
begin
 process_MSec:=0;
 if b<>0 then
  begin
 decodeTime(Time_min,h,m,s,ms);
 time0:=t_sec(h,m,s,ms);
 decodeTime(Time,h1,m,s,ms);
 if h1<h then h1:=h1+24;
 time1:=t_sec(h1,m,s,ms);
 time1:=Time1-Time0;
 case b of
  1:
   process_MSec:=Time1;
  2:
   process_MSec:=round(Time1/1000);
  3:
   process_MSec:=round(Time1/60000);
  4:
   process_MSec:=round(Time1/3600000);
 end;
  end
 else
  Time_Min:=Time;
end;

//задержка на t msec
procedure delay(t:word);
 var time0,time1:longint;
     h,m,s,ms,h1:word;
 begin
 decodeTime(Time,h,m,s,ms);
 time0:=t_sec(h,m,s,ms);
 repeat
 decodeTime(Time,h1,m,s,ms);
 if h1<h then h1:=h1+24;
 time1:=t_sec(h1,m,s,ms);
 until (time1-time0)>=t;
 end;

 procedure _Delay(ms:word);
  var st,at:word;
  begin
   st:=GetTickCount();
   st:=st+ms;
   while true do
    begin
     at:=GetTickCount();
     if at>=st then exit;
    end;
  end;


end.
