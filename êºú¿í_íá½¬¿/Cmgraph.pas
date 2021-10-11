  unit cmgraph;
  interface
  const ropor:integer=3;
  procedure opora(n,x0,y0,alf,co:integer);
  procedure sila(x0,y0,f,alf,cf:integer);
   procedure moment(m,x0,y0,alf,cm:integer);
   procedure nagq(q,x0,y0,x1,y1,cq:integer);
   procedure circles(x0,y0,r,co,cf:integer);
 //  procedure strich(const xi,yi:array of double; var n:integer; var xc,yc:array of double);
   procedure strich(k:integer; var xi,yi:array of double; var n:integer; var xc,yc:array of integer);
 function Opr_Fi(lamb:double):double;

  implementation
  uses tmmgraph,math,pas_7;
  procedure proxy(f,a:double; var x,y:integer);
   {Пpоекции на оси х и у}
   var r:double;
   begin
    r:=degtorad(a);
    x:=round(f*cos(r));
    y:=-round(f*sin(r));
   end;
   procedure circles(x0,y0,r,co,cf:integer);
   {Рисует закpашенную окpужность}
    var cr,sc:integer;
     begin
      sc:=getcolor;
      cr:=(cf+co) div 2;
      setcolor(cr);
      circle(x0,y0,r);
      setfillstyle(1,cf);
      floodfill(x0,y0,cr);
      setcolor(co);
      circle(x0,y0,r);
      setcolor(sc);
    end;
    
  procedure opora(n,x0,y0,alf,co:integer);
   {Рисует опоpы 1,-1-подвижная, 2,-2-неподвижная, 3-Заделка}
   const l:integer=10; h=12; del=5;
   var sc,a,x,y,x1,y1,x2,y2,dx,dy,i,r0,r1:integer;
       d:double;
   begin
    if n<0 then l:=l+2;
    sc:=getcolor;
    setcolor(co);
    if n=0 then
     begin
      circles(x0,y0,ropor,co,cfona);
      setcolor(sc);
      exit;
     end;
    a:=alf+270;
    if (n=2) or (n=1) or (n=-2) then
     begin
      circle(x0,y0,ropor);
      proxy(ropor,a-45,x,y);
      moveto(x+x0,y+y0);
      proxy(l,a-45,x1,y1);
      linerel(x1,y1);
      x1:=getx; y1:=gety;
      x2:=x1; y2:=y1;
      proxy(ropor,a+45,x,y);
      moveto(x+x0,y+y0);
      proxy(l,a+45,x,y);
      linerel(x,y);
      x:=getx; y:=gety;
      lineto(x1,y1);
      if n=1 then
       begin
        proxy(2*ropor+2,a,dx,dy);
        x1:=x1+dx; y1:=y1+dy;
        x:=x+dx; y:=y+dy;
        line(x,y,x1,y1);
        r0:=(x1-x) div 4;
        r1:=(y1-y) div 4;
        circle(x+r0-dx div 2,y+r1-dy div 2,ropor);
        circle(x1-r0-dx div 2,y1-r1-dy div 2,ropor);
       end;
      end
      else
       begin
       if abs(n)=3 then
       begin
        proxy(h,90+alf,x,y);
        moveto(x0,y0);
        linerel(x,y); x1:=getx; y1:=gety;
        moveto(x0,y0);
        linerel(-x,-y); x:=getx; y:=gety;
       end;
       if n=-1 then
        begin
      circle(x0,y0,ropor);
      proxy(ropor,a,x,y);
      moveto(x+x0,y+y0);
      proxy(round(l/sqrt(2)),a,x1,y1);
      linerel(x1,y1);
      x2:=getx; y2:=gety;
      proxy(l+ropor,a-45,x1,y1);
      x1:=x0+x1; y1:=y0+y1;
      proxy(l+ropor,a+45,x,y);
      x:=x0+x; y:=y0+y;
      line(x1,y1,x,y);
        end;
       end;
       d:=hypot(x1-x,y1-y)/del;
       x1:=round((x1-x)/d);
       y1:=round((y1-y)/d);
       proxy(8,alf+225,r0,r1);
       i:=-1;
       repeat
       i:=i+1;
          if i>round(d)  then begin dx:=x1; dy:=y1 end
           else begin dx:=x+i*x1; dy:=y+i*y1 end;
         moveto(dx,dy);
         linerel(r0,r1);
        until (dx=x1) and (dy=y1);
      if (n=-1) or (n=-2) then circles(x2,y2,ropor,co,cfona);
      if n=-2 then circles(x,y,ropor,co,cfona);
       setcolor(sc);
     end;
  procedure sila(x0,y0,f,alf,cf:integer);
  {pисует силу сходящую в точку}
   var x,y:integer;
   begin
    proxy(f,90+alf,x,y);
    sistcoord(x0+x,y0+y,270+alf,f,0,cf);
   end;
   procedure moment(m,x0,y0,alf,cm:integer);
   {Рисует момент m<0-по часовой, m>0-пpотив часовой стpелки}
    const d:integer=13; f=16;
    var sc,x,y,x1,y1,n:integer;
     begin
      if abs(m)>d then d:=abs(m);
      if m<0 then n:=0 else n:=1;
      sc:=getcolor;
      setcolor(cm);
      proxy(d,90+alf,x,y);
      moveto(x0,y0);
      linerel(x,y); x1:=getx; y1:=gety;
      sistcoord(x1,y1,alf+n*180,f,0,cm);
      moveto(x0,y0);
      linerel(-x,-y); x1:=getx; y1:=gety;
      sistcoord(x1,y1,alf+(n+1)*180,f,0,cm);
     setcolor(sc);
   end;

   procedure nagq(q,x0,y0,x1,y1,cq:integer);
   {Рисует pаспpеделенную нагpузку}
    const del=8;
     var a:double;
         d,sc,dx,dy,dx1,dy1,i,h:integer;
      begin
       if abs(q)<18 then h:=18 else h:=abs(q);
       a:=arctan2(y1-y0,x1-x0);
       dx1:=round(h*sin(a));
       dy1:=round(h*cos(a));
       d:=round(hypot(x1-x0,y1-y0)/del);
       sc:=getcolor;
       setcolor(cq);
       moveto(x0,y0);
       linerel(dx1,-dy1);
       linerel(x1-x0,y1-y0);
       lineto(x1,y1);
       lineto(x0,y0);
       dx1:=(x1-x0) div d;
       dy1:=(y1-y0) div d;
        i:=-1;
        repeat
        i:=i+1;
        if i>d then begin dx:=x1; dy:=y1 end
           else begin dx:=x0+i*dx1; dy:=y0+i*dy1 end;
        if q>0 then sila(dx,dy,h,round(-a*180/pi),cq)
            else sistcoord(dx,dy,round(-a*180/pi+90),h,0,cq);
        until (dx=x1) and (dy=y1);
        setcolor(sc);
    end;

 //фы  °ЄЁшїютъш ¤я■Ё
  procedure strich(k:integer; var xi,yi:array of double; var n:integer; var xc,yc:array of integer);
  var i,s,fl:integer;
      s1,s2:double;
  begin
   fl:=0;
   n:=-1;
    s1:=0;
    s2:=0;
    s:=0;
 for i:=0 to k do
   begin
    if abs(yi[i])<1.0e-7 then continue;
    if yi[i]>=0 then
     begin
      if fl<0 then
       begin
        inc(n);
        xc[n]:=round(s1/s2);
        yc[n]:=round(s2/2/s);
       end;
      if fl<=0 then
       begin
        fl:=1;
        s1:=0;
        s2:=0;
        s:=0;
       end;
     end;
    if yi[i]<0 then
     begin
      if fl>0 then
       begin
        inc(n);
        xc[n]:=round(s1/s2);
        yc[n]:=round(s2/2/s);
       end;
      if fl>=0 then
       begin
        fl:=-11;
        s1:=0;
        s2:=0;
        s:=0;
       end;
     end;
     s1:=s1+xi[i]*yi[i];
     s2:=s2+yi[i];
     s:=s+1;
   end;//i
        inc(n);
        xc[n]:=round(s1/s2);
        yc[n]:=round(s2/2/s);
  end;
 function Opr_Fi(lamb:double):double;
 const Fit:array[0..20] of double=(1.0,0.99,0.96,0.94,0.92,0.89,0.86,0.81,
       0.75,0.69,0.6,0.52,0.45,0.4,0.36,0.32,0.29,0.26,0.23,0.21,0.19);
 var i,j:integer;
 begin
  if lamb<=0 then begin result:=1; exit; end;
  if lamb>=200 then begin result:=0.19; exit; end;
  for i:=1 to 20 do
   begin
    j:=10*i;
    if lamb=j then begin result:=Fit[i]; exit; end;
    if (lamb>10*(i-1)) and (lamb<j) then
     begin
      result:=Fit[i-1]+(lamb-10*(i-1))/10*(Fit[i]-Fit[i-1]);
      exit;
     end;
   end;
 end;
  end.