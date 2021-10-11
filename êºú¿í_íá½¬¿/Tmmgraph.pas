{$n+,e+,f+,o+}
unit tmmgraph;
 interface
 uses graphics,pas_7;
   const
        tmmo1:integer=18; tmmo2:integer=10; tmmd:integer=6; tmmc:integer=16;
        angl_str:integer=15;
 var masx,masy:double;
  stetic,xrrr,yrrr,cfona,x000,y000,rcap,apol,hpol:integer;
  xtraect,ytraect,xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4:integer;
  cwpolz,rej:byte;
 procedure kpect(x0,y0,cwet:integer);
 procedure traect(x,y:integer; ct:tcolor);
 procedure wphed(res,r:integer; xi,yi,l,nu:double; cr:Tcolor);
 procedure lll(x,y,l,d,a:integer);
 procedure dugstr(i,x0,y0,r,f0,fk:integer; cd:tcolor; var xc,yc:integer);
 procedure sistcoord(x0,y0,f,l1,l2:integer; co:tcolor);
 procedure sistcoord1(x0,y0,f,l1,l2:integer; co:tcolor);
 procedure arczac(res,x0,y0,f0,fk,r1,r2,cl,cs:integer);
 procedure cylac(x0,y0,r,l,r1,f,cc:integer);
 procedure dxdy(x0,y0,x1,y1,rc:integer; var dx,dy:integer);
 procedure pram(x1,y1,a,b:integer; ksi:double; tz,cz:integer);
  procedure prujina(n,t,x1,y1,x2,y2,cw:integer);
    procedure dempfer(t,x1,y1,x2,y2,cw:integer);
 procedure napr(x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean);
    procedure polzun(alf:double; x0,y0,a,h:integer);
     procedure ris4w(xa,ya,xd,yd,a,alf,c,gam:double);
 procedure risg1(xm,ym,xn,yn,li,fi:double);
  procedure risg1u(x1,y1,x2,y2,x3,y3:integer);
     procedure rism1(xo,yo,xa,ya:double; tet:integer);
     procedure rism1u(x0,y0,x1,y1,tet:integer);
      procedure risg2(xm,ym,xf,yf,psi,li,fi2,xn2:double);
  procedure risg3(xm,ym,xn,yn,mt,fk,lk,l:double);
    procedure prxy(l,a:integer; var x,y:integer);
  procedure mex1(xi,yi,xj,yj:integer);
  procedure mex0(xi,yi,xj,yj:integer);
   procedure mex1s(xi,yi,xj,yj,alf:integer);
   procedure hedww(xi,yi,xj,yj:integer);
  procedure polz(xi,yi,alf:integer);
     procedure hedwp(xi,yi,xj,yj,alf:integer);
     procedure hedpp(xi,yi,xj,yj,alf,bet:integer);
     procedure mex2(xi,yi,xj,yj,alf:integer);
      procedure mex2s(xi,yi,xj,yj,alf:integer);

     function xint(x:double):integer;
    function yint(y:double):integer;
    procedure rcze1(x0,y0,cw:integer; a,alf,bet,l:double);
    procedure rczi1(x0,y0,cw:integer; a,alf,bet,l,b:double);
  procedure corito(x0,y0,cw,cz:integer; a,b,alf:double);
  procedure corito1(x0,y0,cw,cz:integer; a,b,c,alf:double);
    procedure strix(x0,y0,cw,cz:integer; a,b,alf:double);
  procedure oporaz(x0,y0,cw,cz:integer; a,b,c,d,alf:double);
  procedure wodilo(x0,y0,cw:integer; a,b,c,alf:double);
     procedure zaccol(x0,y0,cw,cz,r,dr,a1,a2:integer);

    procedure djeims1(x0,y0,cw,cz1,z1,z2:integer; a,m:double);
    procedure djeims2(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
    procedure djeims3(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     procedure djeims4(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
 procedure ras_line(x1,y1,x2,y2:integer; st:string; dn:integer);
     
 implementation
 uses math;
  procedure traect(x,y:integer; ct:tcolor);
 {ЁшёєхЄ ЄЁрхъЄюЁш■ Єюўъш}
 var j:Tcolor;
 begin
 with obj_image do
  begin
  j:=Pen.Color;
  pen.color:=ct;

  if stetic=0 then
   begin stetic:=1; xtraect:=x;  ytraect:=y; exit end;
  line(xtraect,ytraect,x,y);
  xtraect:=x;  ytraect:=y;
  pen.color:=j;
  end;
 end;

 procedure wphed(res,r:integer; xi,yi,l,nu:double; cr:tcolor);
 {Рисует вpащательную паpу и звено}
 var j:Tcolor;
     x1,y1,x,y,dx,dy:double;
    begin
     dx:=r*cos(nu);
     dy:=r*sin(nu);
 with Obj_Image do
   begin
     j:=pen.color;
     pen.color:=cr;
     x:=xrrr+xi*masx;
     y:=yrrr-yi*masy;
     circle(round(x),round(y),r);
     x1:=x+l*cos(nu)*masx;
     y1:=y-l*sin(nu)*masy;
     xrrr:=round(x1);
     yrrr:=round(y1);
     if res=1 then
      line(round(x+dx),round(y-dy),xrrr,yrrr);
     if res=0 then
      line(round(x+dx),round(y-dy),round(x1-dx),round(y1+dy));
     pen.color:=j;
    end;
    end;

  procedure lll(x,y,l,d,a:integer);
  {ЁшёєхЄ ёЄЁхыъє}
  var r0:real;
      i:integer;
   begin
 with obj_image do
   begin
    for i:=-1 to 1 do
     if i<>0 then
     begin
      r0:=degtorad(d+i*a);
      line(x,y,x-round(l*cos(r0)),y+round(l*sin(r0)));
     end;
    end;
    end;

 procedure ras_line(x1,y1,x2,y2:integer; st:string; dn:integer);
 var xc,yc,l:integer;
     a,b,r:double;
 begin
 line(x1,y1,x2,y2);
 xc:=(x1+x2) div 2;
 yc:=(y1+y2) div 2;
 a:=arctan2(y2-y1,x2-x1);
 l:=round(radtodeg(-a));
 lll(x1,y1,8,l+180,15);
 lll(x2,y2,8,l,15);
 xc:=xc-round(3*cos(a));
 yc:=yc-round(3*sin(a));
 r:=hypot(xc-x1,yc-y1);
 b:=arctan2(dn,r);
 r:=hypot(dn,r);
 xc:=x1+round(r*cos(a+b));
 yc:=y1+round(r*sin(a+b));
 obj_Image.TextOut(xc,yc,st);
 end;

  procedure dugstr(i,x0,y0,r,f0,fk:integer; cd:tcolor; var xc,yc:integer);
  {ЁшёєхЄ фєуютє■ ёЄЁхыъє i=1 тыхтю,i=-1 тяЁртю, i=0 фтющэр }
  const
   dl=-6;
   var j:Tcolor;
   arcot:arccoordstype;
   r1:real;
   alf:integer;
  begin
   alf:=angl_str;
   r1:=degtorad(f0+fk/2);
   xc:=x0+round(r*cos(r1));
   yc:=y0-round(r*sin(r1));
   with obj_image do
   begin
   j:=pen.color;
   pen.color:=cd;
   pas_7.arc(x0,y0,f0,fk,r);
   getarccoords(arcot);
   with arcot do
    begin
     if i>=0 then lll(xend,yend,dl,fk-90,alf);
     if i<=0 then lll(xstart,ystart,dl,f0+90,alf);
    end;
    pen.color:=j;
   end;
  end;

  procedure arczac(res,x0,y0,f0,fk,r1,r2,cl,cs:integer);
  {Рисует закрашенную часть кольца}
  var i,j:integer;
      a1,a2:arccoordstype;
      ts:fillsettingstype;
   begin
    j:=getcolor;
    getfillsettings(ts);
    for i:=r1 to r2 do
     begin
      if (i=r1) or (i=r2) then
      begin setcolor(cl); pas_7.arc(x0,y0,f0,fk,i) end
      else if res=0 then begin setcolor(cs);  pas_7.arc(x0,y0,f0,fk,i); end;
      if i=r1 then getarccoords(a1);
      if i=r2 then getarccoords(a2);
     end;
     setcolor(cl);
     line(a1.xstart,a1.ystart,a2.xstart,a2.ystart);
     line(a1.xend,a1.yend,a2.xend,a2.yend);
     if res<>0 then
      begin
       setfillstyle(tbrushstyle(1),cs);
   with obj_image do
       floodfill(x0+round((r1+r2)*cos((f0+fk)*pi/360)/2),y0+round((r1+r2)*sin((f0+fk)*pi/360)/2),cl,fsborder);
      end;
     setcolor(j);
     setfillstyle(ts.pattern,ts.color)
   end;

  procedure sistcoord(x0,y0,f,l1,l2:integer; co:tcolor);
   {Рисует систему координат}
   var i,x1,y1:integer;
       s,c:real;
     begin
     c:=degtorad(f);
   with obj_image do
   begin
     i:=pen.color;
     s:=sin(c);
     c:=cos(c);
     pen.color:=co;
     if l1<>0 then
     begin
     x1:=x0+round(l1*c);
     y1:=y0-round(l1*s);
     line(x0,y0,x1,y1);
     lll(x1,y1,8,f,angl_str);
     end;
     if l2<>0 then
     begin
     x1:=x0-round(l2*s);
     y1:=y0-round(l2*c);
     line(x0,y0,x1,y1);
     lll(x1,y1,8,f+90,angl_str);
     end;
      setcolor(i)
  end;
    end;
  procedure sistcoord1(x0,y0,f,l1,l2:integer; co:tcolor);
   {Рисует систему координат}
   var i,x1,y1:integer;
       s,c:real;
     begin
     c:=degtorad(f);
   with obj_image do
   begin
     i:=pen.color;
     s:=sin(c);
     c:=cos(c);
     pen.color:=co;
     if l1<>0 then
     begin
     x1:=x0+round(l1*c);
     y1:=y0-round(l1*s);
     line(x0,y0,x1,y1);
//     lll(x1,y1,8,f,angl_str);
     end;
     if l2<>0 then
     begin
     x1:=x0-round(l2*s);
     y1:=y0-round(l2*c);
     line(x0,y0,x1,y1);
//     lll(x1,y1,8,f+90,angl_str);
     end;
      setcolor(i)
  end;
    end;

     procedure cylac(x0,y0,r,l,r1,f,cc:integer);
     {Рисует кулак}
     var i,j:integer;
         a1,a2:arccoordstype;
         rr:double;
      begin
        i:=getcolor;
        setcolor(cc);
        j:=round(radtodeg(arccos((r-r1)/l)));
        pas_7.arc(x0,y0,f+j,360+f-j,r);
        getarccoords(a1);
        rr:=degtorad(f);
        pas_7.arc(x0+round(l*cos(rr)),y0-round(l*sin(rr)),360+f-j,f+j,r1);
        getarccoords(a2);
        line(a1.xend,a1.yend,a2.xstart,a2.ystart);
        line(a1.xstart,a1.ystart,a2.xend,a2.yend);
        setcolor(j);
     end;

     procedure dxdy(x0,y0,x1,y1,rc:integer; var dx,dy:integer);
      var dr:double;
       begin
        dr:=hypot((x0-x1)/10,(y0-y1)/10)*10;
        dx:=round((X1-X0)/dr*rc);
        dy:=round((y1-y0)/dr*rc);
       end;
 procedure prujina(n,t,x1,y1,x2,y2,cw:integer);
 {pисует пpужину в зависимости от сжатия}
  var r1,r2,dr,dl,alf,bet:real;
      sc,i:integer;
   begin
    dr:=10*hypot((x1-x2)/10.0,(y1-y2)/10.0)/n;
    sc:=getcolor;
    alf:=arctan2(y2-y1,x2-x1);
    if dr<0.0000001 then dr:=0.0000001;
    bet:=arctan(t/dr);
    dl:=hypot(dr,t);
    setcolor(cw);
   with obj_image do
   begin
    moveto(x1,y1);
    for i:=0 to n do
     begin
      if (i=0) or (i=n) then r1:=dl/2 else r1:=dl;
      if odd(i) then r2:=-bet else r2:=bet;
      linerel(round(r1*cos(alf+r2)),round(r1*sin(alf+r2)));
    end;
    lineto(x2,y2);
    end;
    setcolor(sc);
   end;

   procedure dempfer(t,x1,y1,x2,y2,cw:integer);
   {pисует демpфеp в движении}
   var
    sc,x,y:integer;
    dr,alf,s,c:real;
   begin
    sc:=getcolor;
    setcolor(cw);
    alf:=arctan2(y2-y1,x2-x1);
    dr:=5*hypot((x2-x1)/10,(y2-y1)/10)-2;
    s:=sin(alf); c:=cos(alf);
   with obj_image do
   begin
    moveto(x1,y1);
    linerel(round(dr*c),round(dr*s));
    linerel(round(-t/2*s),round(t/2*c));
    linerel(round(t*s),round(-t*c));
    moveto(x2,y2);
    linerel(-round(dr*c),-round(dr*s));
    x:=penpos.x; y:=penpos.y;
    linerel(round(-(t/2+2)*s),round(-(t/2+2)*c));
    linerel(-round(4*c),-round(4*s));
    moveto(x,y);
    linerel(round((t/2+2)*s),round(-(t/2+2)*c));
    linerel(-round(4*c),-round(4*s));
    end;
    setcolor(sc)
   end;

    procedure pram(x1,y1,a,b:integer; ksi:double; tz,cz:integer);
     var
      x2,y2,x3,y3,x4,y4,sc,x,y:integer;
     begin
      x2:=x1+round(a*cos(ksi));
      y2:=y1-round(a*sin(ksi));
      x3:=x1+round(b*cos(ksi+1.5*pi));
      y3:=y1-round(b*sin(ksi+1.5*pi));
      x4:=x2+x3-x1;
      y4:=y2+y3-y1;
      x:=(x1+x2+x3+x4) div 4;
      y:=(y1+y2+y3+y4) div 4;
      sc:=getpixel(x,y);
   with obj_image do
    begin
      moveto(x1,y1);
      lineto(x2,y2);
      lineto(x4,y4);
      lineto(x3,y3);
      lineto(x1,y1);
    end;
      setfillstyle(Tbrushstyle(tz),cz);
        with obj_image do
         floodfill(x,y,getcolor,fsborder);
    end;

    procedure napr(x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean);
     var i,dx,dy,dx1,dy1,x1,y1,x2,y2,x,y:integer;
         s,c:double;
     begin
      x:=x000+round(masx*x0);
      y:=y000-round(masy*y0);
      c:=cos(ksi);
      s:=sin(ksi);
      x1:=x+round(l1*c);
      y1:=y-round(l1*s);
      x2:=x1+round(l2*c);
      y2:=y1-round(l2*s);
      dx:=round(10*cos(ksi+pi/4));
      dy:=round(10*sin(ksi+pi/4));
      dxdy(x,y,x2,y2,5,dx1,dy1);
   with obj_image do
      for i:=1 to dl div 5 do
       begin
        if zl1 then moveto(x1+(i-1)*dx1,y1+(i-1)*dy1)
               else moveto(x2-(i-1)*dx1,y2-(i-1)*dy1);
         linerel(dx,dy);
       end;
         line(x1,y1,x2,y2);
    end;

    procedure polzun(alf:double; x0,y0,a,h:integer);
      var sc,x1,y1,dx2,dy2,dx1,dy1:integer;
       begin
        x1:=round(x0-a*cos(alf)+h*sin(alf));
        y1:=round(y0+(h*cos(alf)+a*sin(alf)));
       dx2:=round(2*a*cos(alf));
        dy2:=-round(2*a*sin(alf));
         dx1:=-round(2*h*sin(alf));
        dy1:=-round(2*h*cos(alf));
        sc:=getcolor;
        setcolor(cfona);
        setlinestyle(0,0,3);
        line(x0-dx2 div 2,y0-dy2 div 2,x0+dx2 div 2,y0+dy2 div 2);
        setlinestyle(0,0,1);
        setcolor(sc);
   with obj_image do
        moveto(x1,y1);
        linerel(dx2,dy2);
        linerel(dx1,dy1);
        linerel(-dx2,-dy2);
        linerel(-dx1,-dy1);
    {    setfillstyle(1,cf);
        floodfill(x0,y0,getcolor);}
      end;

 procedure rism1(xo,yo,xa,ya:double; tet:integer);
     const alfa=40;
     var
      r:double;
      dx,dy,x0,y0,x1,y1,x2,y2,x3,y3:integer;
       begin
        x0:=x000+round(xo*masx);
        y0:=y000-round(yo*masy);
        circle(x0,y0,rcap);
        if (xo<>xa) or (yo<>ya) then
         begin
          x1:=x000+round(masx*xa);
          y1:=y000-round(masy*ya);
          dxdy(x0,y0,x1,y1,rcap,dx,dy);
          line(x0+dx,y0+dy,x1-dx,y1-dy);
         end;
         r:=degtorad(tet-alfa);
         x2:=x0+round(3*rcap*cos(r));
         y2:=y0-round(3*rcap*sin(r));
         r:=degtorad(tet+alfa);
         x3:=x0+round(3*rcap*cos(r));
         y3:=y0-round(3*rcap*sin(r));
          dxdy(x0,y0,x2,y2,rcap,dx,dy);
          line(x0+dx,y0+dy,x2,y2);
          dxdy(x0,y0,x3,y3,rcap,dx,dy);
          line(x0+dx,y0+dy,x3,y3);
          setlinestyle(0,0,3);
          line(x2,y2,x3,y3);
          setlinestyle(0,0,1);
        end;

    procedure rism1u(x0,y0,x1,y1,tet:integer);
     const alfa=40;
     var
      r:double;
      dx,dy,x2,y2,x3,y3:integer;
       begin
        circle(x0,y0,rcap);
        if x1>0 then
         begin
          dxdy(x0,y0,x1,y1,rcap,dx,dy);
          line(x0+dx,y0+dy,x1-dx,y1-dy);
         end;
         r:=degtorad(tet-alfa);
         x2:=x0+round(3*rcap*cos(r));
         y2:=y0-round(3*rcap*sin(r));
         r:=degtorad(tet+alfa);
         x3:=x0+round(3*rcap*cos(r));
         y3:=y0-round(3*rcap*sin(r));
          dxdy(x0,y0,x2,y2,rcap,dx,dy);
          line(x0+dx,y0+dy,x2,y2);
          dxdy(x0,y0,x3,y3,rcap,dx,dy);
          line(x0+dx,y0+dy,x3,y3);
          setlinestyle(0,0,3);
          line(x2,y2,x3,y3);
          setlinestyle(0,0,1);
        end;

    procedure risg1(xm,ym,xn,yn,li,fi:double);
     var dx,dy,x1,y1,x2,y2,x3,y3:integer;
     begin
      x1:=x000+round(masx*xm);
      y1:=y000-round(masy*ym);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(li*masx*cos(fi));
      y2:=y1-round(li*masy*sin(fi));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
      x3:=x000+round(masx*xn);
      y3:=y000-round(masy*yn);
      xx3:=x3; yy3:=y3;
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
     end;
    procedure ris4w(xa,ya,xd,yd,a,alf,c,gam:double);
     var dx,dy,x1,y1,x2,y2,x3,y3,x4,y4:integer;
     begin
      x1:=x000+round(masx*xa);
      y1:=y000-round(masy*ya);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(a*masx*cos(alf));
      y2:=y1-round(a*masy*sin(alf));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
      x3:=x000+round(masx*(xd+c*cos(gam)));
      y3:=y000-round(masy*(yd+c*sin(gam)));
      xx3:=x3; yy3:=y3;
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
      x4:=x000+round(masx*xd);
      y4:=y000-round(masy*yd);
      xx4:=x4; yy4:=y4;
       dxdy(x3,y3,x4,y4,rcap,dx,dy);
      line(x3+dx,y3+dy,x4-dx,y4-dy);
      circle(x4,y4,rcap);
     end;
      procedure risg1u(x1,y1,x2,y2,x3,y3:integer);
     var dx,dy:integer;
     begin
      circle(x1,y1,rcap);
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
       if x3>0 then
       begin
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
      end;
     end;
    procedure risg2(xm,ym,xf,yf,psi,li,fi2,xn2:double);
     var dx,dy,x1,y1,x2,y2,x3,y3:integer;
         s,c,xn,yn:double;
     begin
      x1:=x000+round(masx*xm);
      y1:=y000-round(masy*ym);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(li*masx*cos(fi2+psi));
      y2:=y1-round(li*masy*sin(fi2+psi));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      s:=sin(psi); c:=cos(psi);
      xn:=xf*s*s+(xn2-yf*s)*c;
      yn:=yf*c*c+(xn2-xf*c)*s;
      x3:=x000+round(masx*xn);
      y3:=y000-round(masy*yn);
      xx3:=x3; yy3:=y3;
      polzun(psi,x3,y3,apol,hpol);
       line(x1+dx,y1+dy,x2-dx,y2-dy);
       if (abs(x2-x3)>1) or (abs(y2-y3)>1) then
       begin
       dxdy(x2,y2,x3,y3,hpol,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      end;
           circle(x2,y2,rcap);
     end;
    procedure risg2u(x1,y1,x2,y2,x3,y3:integer; psi:double);
     var dx,dy:integer;
     begin
      circle(x1,y1,rcap);
      polzun(psi,x3,y3,apol,hpol);
       dxdy(x1,y1,x2,y2,rcap,dx,dy);
       line(x1+dx,y1+dy,x2-dx,y2-dy);
       if (x2<>x3) or (y2<>y3) then
       begin
       dxdy(x2,y2,x3,y3,hpol,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      end;
      circle(x2,y2,rcap);
     end;

    procedure risg3(xm,ym,xn,yn,mt,fk,lk,l:double);
     var x1,y1,x2,y2,x3,y3,x4,y4,dx,dy:integer;
         r:double;
      begin
       x1:=x000+round(masx*xm);
       y1:=y000-round(masy*ym);
       if mt>=0 then r:=pi/2 else r:=3*pi/2;
       x2:=x1+round(mt*masx*cos(fk+r));
       y2:=y1-round(mt*masy*sin(fk+r));
       x3:=x000+round(masx*xn);
       y3:=y000-round(masy*yn);
       x4:=x2+round(l*masx*cos(fk));
       y4:=y2-round(l*masy*sin(fk));
       if mt<>0 then
        begin
         dxdy(x1,y1,x2,y2,rcap,dx,dy);
         line(x1+dx,y1+dy,x2,y2);
         dxdy(x2,y2,x3,y3,apol,dx,dy);
         line(x2,y2,x3-dx,y3-dy);
        end
        else
         begin
          dxdy(x1,y1,x3,y3,apol,dx,dy);
          circle(x1,y1,rcap);
          line(x1+round(dx*rcap/apol),y1+round(dy*rcap/apol),x3-dx,y3-dy);
         end;
         line(x3+dx,y3+dy,x4,y4);
         polzun(fk,x3,y3,apol,hpol);
         circle(x3,y3,rcap);
    end;
{-------------------------------------------------------------------}
  procedure prxy(l,a:integer; var x,y:integer);
   var r:double;
   begin
    r:=degtorad(a);
    x:=round(l*cos(r));
    y:=-round(l*sin(r));
   end;
{-------------------------------------------------------------------}
  procedure dx_dy(rrr,xi,yi,xj,yj:integer; var dx,dy:integer);
   var d:double;
       r1,r2:integer;
    begin
     r1:=xj-xi;
     r2:=yj-yi;
     d:=hypot(r1,r2);
       if round(d)<=rrr then
      begin dx:=0; dy:=0 end
      else
       begin
       dx:=round(r1*rrr/d); dy:=round(r2*rrr/d);
       end
    end;
{-------------------------------------------------------------------}
    procedure kpect(x0,y0,cwet:integer);
     var i:integer;
      begin
       for i:=-2 to 2 do
       putpixel(x0+i,y0,cwet);
       for i:=-2 to 2 do
       putpixel(x0,y0+i,cwet);
      end;
{-------------------------------------------------------------------}
  procedure mex0(xi,yi,xj,yj:integer);
   var dx,dy:integer;
    begin
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      line(xi+dx,yi+dy,xj-dx,yj-dy);
    end;

{-------------------------------------------------------------------}
  procedure mex1(xi,yi,xj,yj:integer);
   var dx,dy:integer;
    begin
      circle(xi,yi,rcap);
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      line(xi+dx,yi+dy,xj-dx,yj-dy);
    end;
{-------------------------------------------------------------------}
   procedure mex1s(xi,yi,xj,yj,alf:integer);
    var x,y,x1,y1:integer;
     begin
      mex1(xi,yi,xj,yj);
      prxy(rcap,alf-45,x,y);
   with obj_image do
   begin
      moveto(x+xi,yi+y);
      prxy(2*rcap,alf-45,x1,y1);
      linerel(x1,y1);
      x1:=getx; y1:=gety;
      prxy(rcap,alf+45,x,y);
      moveto(x+xi,yi+y);
      prxy(2*rcap,alf+45,x,y);
      linerel(x,y);
      setlinestyle(0,0,3);
      lineto(x1,y1);
      setlinestyle(0,0,1);
     end;
     end;
{-------------------------------------------------------------------}
   procedure hedww(xi,yi,xj,yj:integer);
   var dx,dy:integer;
    begin
    circle(xi,yi,rcap);
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      begin line(xi+dx,yi+dy,xj-dx,yj-dy);
      circle(xj,yj,rcap);
      end;
     end;
  procedure polz(xi,yi,alf:integer);
   var
    r,r1:real;
    c,dx1,dy1,dx2,dy2:integer;
    x,y:array[1..4] of integer;
    procedure p4;
     var i:byte;
     begin
   with obj_image do
    begin
      moveto(x[1],y[1]);
      for i:=2 to 4 do
       lineto(x[i],y[i]);
      lineto(x[1],y[1]);
    end;
     end;
    begin
     r:=degtorad(alf);
     r1:=cos(r);
     r:=sin(r);
     x[1]:=xi-round((apol*r1-hpol*r)/2);
     y[1]:=yi+round((apol*r+hpol*r1)/2);
     prxy(apol,alf,dx1,dy1);
     prxy(hpol,alf+90,dx2,dy2);
     x[2]:=x[1]+dx1;
     y[2]:=y[1]+round(dy1);
     x[3]:=x[2]+dx2;
     y[3]:=y[2]+round(dy2);
     x[4]:=x[1]+dx2;
     y[4]:=y[1]+round(dy2);
     c:=getcolor;
     setcolor(0);
     p4;
     setfillstyle(tbrushstyle(0),cwpolz);
   with obj_image do
     floodfill(xi,yi,0,fsborder);
      setcolor(c);
     p4;
     setfillstyle(tbrushstyle(1),cwpolz);
   with obj_image do
     floodfill(xi,yi,c,fsborder);
   end;
     procedure hedwp(xi,yi,xj,yj,alf:integer);
      var dx,dy:integer;
      begin
       if rej<>0 then circle(xi,yi,rcap);
       dx_dy(rcap,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi+dx,yi+dy,xj,yj);
         if alf>=0 then polz(xj,yj,alf);
        end;
       end;
{-------------------------------------------------------------------}
     procedure hedpp(xi,yi,xj,yj,alf,bet:integer);
      var dx,dy:integer;
      begin
       if rej<>0 then polz(xi,yi,alf);
       dx_dy(hpol div 2,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi,yi,xj,yj);
         polz(xi,yi,alf);
         if bet>=0 then polz(xj,yj,bet);
        end;
       end;
{--------------------------------------------------------------------}
     procedure mex2(xi,yi,xj,yj,alf:integer);
      var dx,dy:integer;
      begin
       if rej<>0 then polz(xi,yi,alf);
       dx_dy(rcap,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi,yi,xj-dx,yj-dy);
         polz(xi,yi,alf);
        end;
       end;
{-------------------------------------------------------------------}
      procedure mex2s(xi,yi,xj,yj,alf:integer);
      var dx,dy,dx1,dy1,i,x1,y1:integer;
       begin
        prxy(2*apol,alf,dx,dy);
        x1:=xi-dx; y1:=yi-dy;
        line(x1,y1,xi+dx,yi+dy);
        prxy(6,alf+45,dx1,dy1);
      with obj_image do
        for i:=0 to 5 do
        begin
         moveto(x1+round(2*dx/apol)*i,y1+round(2*dy/apol)*i);
         linerel(-dx1,-dy1);
        end;
        mex2(xi,yi,xj,yj,alf);
       end;
{---------------------------------------------------------------------}

   function xint(x:double):integer;
    begin
     xint:=x000+round(x*masx);
     end;
   function yint(y:double):integer;
    begin
     yint:=y000-round(y*masy);
     end;
{-------------------------------------------------------------------}
    procedure rcze1(x0,y0,cw:integer; a,alf,bet,l:double);
     var r,rx,ry,dx,dy,rx1,ry1:double;
         i,x1,y1,x,y,cx,cy,cc:integer;
      begin
       x1:=x000; y1:=y000; cc:=getcolor;
       x000:=x0; y000:=y0; setcolor(cw);
       r:=alf*pi/180; ry:=cos(r); rx:=sin(r);
       dx:=abs(a)*rx; dy:=abs(a)*ry;
       if a>0 then
        begin cx:=0; cy:=0 end
        else
         begin
          cx:=round(l*rx/2);
          cy:=round(l*ry/2)
         end;
        i:=1; r:=4/masx;
        while i>=-1 do
         begin
          x:=xint(i*dx); y:=yint(i*dy);
          line(x0+i*cx,y0-i*cy,x,y);
          rx1:=(alf+i*bet)*pi/180; ry1:=cos(rx1); rx1:=sin(rx1);
          line(x,y,xint(i*dx-r*ry1),yint(i*dy+r*rx1));
          line(x,y,xint(i*dx+r*ry1),yint(i*dy-r*rx1));
          i:=i-2;
         end;
        if a>0 then line(x0,y0,xint(-l*ry),yint(l*rx));
         x000:=x1; y000:=y1; setcolor(cc);
    end;
{-------------------------------------------------------------------}
    procedure rczi1(x0,y0,cw:integer; a,alf,bet,l,b:double);
     const r0=6; c=12;
     var r,rx,ry,dx,dy,a1,r1,al,rx1,ry1:double;
         i,x1,y1,x2,y2,cx,cy,cc,xx,yy,an,xs,ys:integer;
         coo:arccoordstype;
      begin
       x1:=x000; y1:=y000; cc:=getcolor;
       x000:=x0; y000:=y0; setcolor(cw);
       r:=alf*pi/180; ry:=cos(r); rx:=sin(r);
       a1:=abs(a);
       dx:=(a1+(c-r0)/masx)*rx; dy:=(a1+(c-r0)/masx)*ry;
       if a>0 then
        begin cx:=0; cy:=0 end
        else
         begin
          cx:=round(l*rx/2);
          cy:=round(l*ry/2)
         end;
        i:=1; r:=4;
        while i>=-1 do
         begin
          x2:=xint(i*dx); y2:=yint(i*dy);
          line(x0+i*cx,y0-i*cy,x2,y2);
          al:=(3-i)*45-alf;
          if al<0 then al:=al+360;
          an:=round(al);
          pas_7.arc(x2+round(r0*ry),y2+round(r0*rx),an,an+90,r0);
          getarccoords(coo);
          with coo do
           begin
            r1:=b/masx-2*r0;
            xx:=round(r1*ry);
            yy:=round(r1*rx);
            if i>0 then begin xs:=xstart; ys:=ystart end
                  else begin xs:=xend; ys:=yend end;
            line(xs,ys,xs+xx,ys+yy);
            an:=an-i*90;
            if an<0 then an:=an+360;
            pas_7.arc(x+xx,y+yy,an,an+90,r0);
            getarccoords(coo);
            if i>0 then begin xs:=xstart; ys:=ystart end
                  else begin xs:=xend; ys:=yend end;
            xx:=xs-i*round((c-r0)*rx);
            yy:=ys+i*round((c-r0)*ry);
            line(xs,ys,xx,yy);
           end;
          rx1:=degtorad(alf+i*bet); ry1:=cos(rx1); rx1:=sin(rx1);
          line(xx,yy,xx-round(r*ry1),yy+round(r*rx1));
          line(xx,yy,xx+round(r*ry1),yy-round(r*rx1));
          i:=i-2;
         end;
        if a>0 then line(x0,y0,xint(-l*ry),yint(l*rx));
         x000:=x1; y000:=y1; setcolor(cc);
    end;
{-------------------------------------------------------------------}
  procedure corito(x0,y0,cw,cz:integer; a,b,alf:double);
   var rx,ry,r1,r2:double;
       x,y,x1,y1,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x1:=getx; y1:=gety;
   with obj_image do
     begin
      moveto(x0,y0);
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      if cz<0 then moveto(xint(-b*ry),yint(b*rx))
              else lineto(xint(-b*ry),yint(b*rx));
      lineto(x0,y0); moveto(x1,y1);
     end;
      if cz>=0 then
       begin
        setfillstyle(tbrushstyle(12),cz);
       // setfillpattern(stiltype,cz);
        x1:=xint(r1/2); y1:=yint(r2/2);
        setcolor(getpixel(x1,y1));
        floodfill(x1,y1,cw);
        line(xint(r1),yint(r2),xint(-b*ry),yint(b*rx));
       end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}
  procedure corito1(x0,y0,cw,cz:integer; a,b,c,alf:double);
   var rx,ry,r1,r2,r3,r4,r5,r6,r:double;
       x,y,x1,y1,x2,y2,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x2:=getx; y2:=gety;
      with obj_image do
      begin
      moveto(x0,y0);
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      r:=a-abs(b);
      r3:=r1-r*rx; r4:=r2-r*ry;
      lineto(xint(r3),yint(r4));
       x1:=xint(r3/2); y1:=yint(r4/2);
       r:=abs(b);
      r5:=-c*ry+r*rx; r6:=c*rx+r*ry;
       lineto(xint(r5),yint(r6));
      lineto(xint(-c*ry),yint(c*rx));
      lineto(x0,y0);
        setfillstyle(12,cz);
       // setfillpattern(stiltype,cz);
        setcolor(getpixel(x1,y1));
        pas_7.floodfill(x1,y1,cw);
      moveto(xint(r1),yint(r2));
      lineto(xint(r3),yint(r4));
       lineto(xint(r5),yint(r6));
      lineto(xint(-c*ry),yint(c*rx));
       moveto(x2,y2);
      end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}

  procedure strix(x0,y0,cw,cz:integer; a,b,alf:double);
   var rx,ry,r1,r2:double;
       x,y,x1,y1,cc,i,x2,y2:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x1:=getx; y1:=gety;
   with obj_image do
    begin
      moveto(x0,y0);
      for i:=0 to 1 do
      begin
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      lineto(xint(-b*ry),yint(b*rx));
      lineto(x0,y0);
      if i=0 then
       begin
        setfillstyle(12,cz);
        //setfillpattern(stiltype,cz);
        x2:=xint(r1/2); y2:=yint(r2/2);
        setcolor(getpixel(x2,y2));
        pas_7.floodfill(x2,y2,cw);
       end;
      end;
        moveto(x1,y1);
    end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}

  procedure oporaz(x0,y0,cw,cz:integer; a,b,c,d,alf:double);
   var i:byte;
       dx,dy,cc:integer;
       d1,rx,ry:double;
    begin
     ry:=degtorad(alf);
     rx:=cos(ry); ry:=sin(ry);
     d1:=abs(d);
     cc:=getcolor; setcolor(cw);
     dx:=round(d1*ry/2); dy:=round(d1*rx/2);
     if b=c then
      begin
       corito(x0-dx,y0-dy,cw,cz,a,b,alf);
       corito(x0+dx,y0+dy,cw,cz,a,-b,alf);
     end
     else
      begin
       corito1(x0-dx,y0-dy,cw,cz,a,b,c,alf);
       corito1(x0+dx,y0+dy,cw,cz,a,-b,-c,alf);
      end;
     if d<0 then
      for i:=0 to 1 do
        begin
         if i=0 then
          begin
           dx:=x0-round(3*rx); dy:=y0+round(3*ry);
          end
         else
          begin
           dx:=x0+round((3+a)*rx); dy:=y0-round((3+a)*ry);
          end;
         line(dx,dy,dx-round(4*ry),dy-round(4*rx));
         line(dx,dy,dx+round(4*ry),dy+round(4*rx));
        end;
        setcolor(cc);
    end;
 {--------------------------------------------------------------------}
  procedure wodilo(x0,y0,cw:integer; a,b,c,alf:double);
   var rx,ry:double;
       x,y,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      line(x0,y0,xint(a*ry),yint(a*rx));
      line(x0,y0,xint(b*rx),yint(-b*ry));
      if c<>0 then line(xint(a*ry),yint(a*rx),xint(a*ry-c*rx),yint(a*rx+c*ry));
      x000:=x; y000:=y; setcolor(cc);
    end;
 {-----------------------------------------------------------------------}
    procedure djeims1(x0,y0,cw,cz1,z1,z2:integer; a,m:double);
     const o1=18; o2=10;
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+2*z2;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.2*m*z3);
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,-m*z2/2,a,0,8);
      oporaz(x0-tmmo2 div 2,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-(h div 2)*i,y0,cw,r,-(h div 2+tmmo1+6)*i,-((h+tmmo2) div 2+4)*i,a);
      oporaz(x0-i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
 {------------------------------------------------------------------------}
    procedure djeims2(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+z2+z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*z3);
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-2*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-h*i,y0,cw,r-tmmd div 2,-(2*h+tmmo1+6)*i,0,a);
      oporaz(x0-3*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-3*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
 {------------------------------------------------------------------------}
    procedure djeims3(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+z2-z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*(z3+2*z21));
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-2*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-h*i,y0,cw,r-tmmd div 2,-(h+tmmo1+6)*i,0,a);
      oporaz(x0-2*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rcze1(x0-2*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd);
     end;
 {------------------------------------------------------------------------}
    procedure djeims4(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1-z2+z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*z3);
      cz:=abs(cz1);
      rz:=z1-z2;
      r:=m*rz/2;
      rz:=round(r);
      rczi1(x0,y0,cw,m*z1/2,a+(1+i)*90,0,15+tmmo1,h);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0-i*h,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-3*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-2*i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-2*h*i,y0,cw,r-tmmd div 2,-(2*h+tmmo1+6)*i,0,a);
      oporaz(x0-4*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-4*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
     procedure zaccol(x0,y0,cw,cz,r,dr,a1,a2:integer);
      var r1,r2:arccoordstype;
          x,y,i,cc:integer;
          c:double;
       begin
        cc:=getcolor; setcolor(cw);
        for i:=0 to 1 do
         begin
          arc(x0,y0,a1,a2,r);
          getarccoords(r1);
           arc(x0,y0,a1,a2,r+dr);
          getarccoords(r2);
          line(r1.xstart,r1.ystart,r2.xstart,r2.ystart);
           line(r1.xend,r1.yend,r2.xend,r2.yend);
           if i=0 then
            begin
             c:=(a1+a2)*pi/360;
             x:=x0+round((r+dr/2)*cos(c));
             y:=y0-round((r+dr/2)*sin(c));
             setfillstyle(12,cz);
        //     setfillpattern(stiltype,cz);
                       setcolor(getpixel(x,y));
             floodfill(x,y,cw);
          end;
         end;
        setcolor(cc);
    end;
 {------------------------------------------------------------------------}

    begin
    stetic:=0;
    rcap:=4;
    apol:=20;
    hpol:=14;
    cwpolz:=0;
   // stiltype:=stiltype1;
end.