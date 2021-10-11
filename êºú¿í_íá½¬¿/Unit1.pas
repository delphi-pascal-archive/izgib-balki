unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
uses pas_7;
procedure TForm1.Button1Click(Sender: TObject);
begin
obj_image:=image1.Canvas;
with obj_image,image1 do
begin
 brush.Color:=cllime;
 fillrect(rect(0,0,width,height));
 setcolor(clblack);
 setlinestyle(0,0,1);
 circle(width div 2,height div 2,100);
 setfillstyle(bsdiagcross,clred);
 pas_7.floodfill(width div 2+1,height div 2+1,clblack);
 putpixel(width div 2,height div 2,clred);
 pas_7.arc(200,200,-90,-30,50);
 pas_7.arc(100,100,0,180,50);
 //setcolor(4);
 with arccoordinate do
 begin
 line(xstart,ystart,xend,yend);
 linerel(-30,10);
 //obj_image.lineto(xstart,ystart);
 end;
 setarcdirection
 pas_7.arc(200,100,0,180,50);
 pas_7.floodfill(100,90,clblack);
end;
end;

end.
