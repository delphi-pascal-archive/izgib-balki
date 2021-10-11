program PIzgib_b;



{%File 'demopas.dpr'}

uses
  Forms,
  Izgib_b in 'Izgib_b.pas' {Form1},
  cmgraph in 'Cmgraph.pas',
  tmmgraph in 'Tmmgraph.pas',
  pas_7 in 'pas_7.pas',
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
