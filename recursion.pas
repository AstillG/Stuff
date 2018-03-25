program recursionfor;
uses crt;
var a,v:array[1..20,1..20]of integer;
    i,j,miny,mc,n,ic,jc:integer;

procedure flush(c,z: integer; );
var r,t,rr,tt:integer;
begin
        if a[c,z] = 0 then //vůbec nevykoná pokud neklikne na nulu
          for r:=c to r+2 do //je to podobný algoritmus jako při vypočítávání počtu min v okolí hledá podle malé matice
            for t:=z to t+2 do
              if (r-1<>0) and (t-1<>0) and (r-1<=n) and (t-1<=n) then  //ošetření pro okraje
                if (a[r-1,t-1]=0) and (v[r-1,t-1]=0) then
                  begin
                    v[r-1,t-1]:=1;
                    rr:=r-1;       //nešlo mi to dát přímo do souřadnic
                    tt:=t-1;
                    flush(rr,tt);  //zavolá samo sebe
                  end
                else
                  v[r-1,t-1]:=1;
end;

begin
  clrscr;
  writeln('Enter size: ');
  readln(n);
  miny:=round((n*n)/5);
  mc:=miny;
  for i:=1 to n do
  for j:=1 to n do
  begin
      a[i,j]:=0;
      v[i,j]:=0;
  end;
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

//po sem je to zkopírovaná generace min z minesweeper

  writeln('x: ');
  readln(ic);
  writeln('y: ');
  readln(jc);
  flush(jc,ic); //zavolá se souřadnicemi na které se zadají

   for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
            write(v[i,j],' ');
      end;

end.
