program gen;
uses crt;
var i,j,n,miny,mc,ic,jc:integer;
    a:array[1..10,1..10]of integer;
begin

//generování min(9)

  writeln('zadej velikost: ');
  readln(n);
  miny:=round((n*n)/5);
  mc:=miny;
  writeln('miny: ',miny);

  for i:=1 to n do
  for j:=1 to n do
    a[i,j]:=0;
    
  repeat
  begin
    i:=random(n)+1;
    j:=random(n)+1;
    if a[i,j]=0 then
      begin
        a[i,j]:=9;
        mc:=mc-1;
      end;
  end;
  until mc=0;

  for i:=1 to n do
  begin
    writeln();
    for j:=1 to n do
      write(a[i,j],' ');
  end;

//zjištění min v okolí

  writeln();

  for i:=1 to n do
    for j:=1 to n do
      begin
        if a[i,j]<>9 then
          for ic:=i to i+2 do
            for jc:=j to j+2 do
              if (ic-1<>0) and (jc-1<>0) and (ic-1<=n) and (jc-1<=n) then
                if a[ic-1,jc-1]=9 then
                  a[i,j]:=a[i,j]+1;
      end;

  for i:=1 to n do
  begin
    writeln();
    for j:=1 to n do
      write(a[i,j],' ');
  end;

end.
