Program torus;
uses crt;
const nmax=10;
type matr = array [1..nmax, 1..nmax] of integer;
  var a:matr;
  b:matr;
  l,x1,y1,q,x,y,h,z,u,w:integer;

  procedure InputMatr(var a:matr; n,m:integer);
var i,j:integer;
begin
gotoxy(3,2*i + 4);
writeln('Матрица 1:');
for i:=1 to n do
for j:=1 to m do begin
gotoxy(3*j,2*i + 3);
readln(a[i,j]);
end;
end;
procedure InputMatr2(var b:matr; n,m:integer);
var i,j:integer;
begin
gotoxy(m*3+19,4);
writeln('Матрица цвета:');
for i:=1 to n do
for j:=1 to m do begin
gotoxy(m*3+j*3+16,i*2+3);
readln(a[i,j]);
end;
end;
var n,m:integer;
begin
write('введите количество строк: ');
readln (n);
write ('введите кол-во столбцов: ');
readln (m);
writeln;
InputMatr2(b,n,m);
writeln('Введите координату муравья по x');
readln(x1);
writeln('Введите координату муравья по y');
readln(y1);
x:=x1;
y:=y1;
a[x,y]:=1;
writeln('Введите направление взгляда муравья');
readln(z);
h:=0;
u:=n*m;
w:=n*m;
l:=0;
repeat
if a[x,y]=1 then
begin
if b[x,y]=0 then
begin
a[x,y]:=0;
b[x,y]:=1;
u:=u-1;
case z of
1: begin if x=m then begin x:=1; a[x,y]:=1; end else begin x:=x+1; a[x,y]:=1; end; z:=2; end;
2: begin if y=n then begin y:=1; a[x,y]:=1; end else begin y:=y+1; a[x,y]:=1; end; z:=3; end;
3: begin if x=1 then begin x:=m; a[x,y]:=1; end else begin x:=x-1; a[x,y]:=1; end; z:=4; end;
4: begin if y=1 then begin y:=n; a[x,y]:=1; end else begin y:=y-1; a[x,y]:=1; end; z:=1; end;
end;
end
else
begin
a[x,y]:=0;
b[x,y]:=0;
u:=u+1;
case z of
1: begin if x=1 then begin x:=m; a[x,y]:=1; end else begin x:=x-1; a[x,y]:=1; end; z:=4; end;
2: begin if y=1 then begin y:=n; a[x,y]:=1; end else begin y:=y-1; a[x,y]:=1; end; z:=1; end;
3: begin if x=m then begin x:=1; a[x,y]:=1; end else begin x:=x+1; a[x,y]:=1; end; z:=2; end;
4: begin if y=n then begin y:=1; a[x,1]:=1; end else begin y:=y+1; a[x,y]:=1; end; z:=3; end;
end;
end;
end;
h:=h+1;
if u=w then l:=l+1;
until (u=w) and (a[x1,y1]=1);
writeln('Количество ходов равно ',h);
writeln('Количество раз, когда поле становилось белым ',l);
readln;
end.