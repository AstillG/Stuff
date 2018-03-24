program gen;
uses crt;
var i,j,n,miny,mc,ic,jc:integer;
    a,v:array[1..10,1..10]of integer;
    win,loss:boolean;
    cf:string[1];
begin

  clrscr;
  writeln('zadej velikost: ');
  readln(n);
  miny:=round((n*n)/5);
  mc:=miny;
  for i:=1 to n do
  for j:=1 to n do
    begin
      a[i,j]:=0;
      v[i,j]:=0;
    end;
  writeln('miny: ',miny);
  for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
          if v[i,j]=0 then
            write('# ')
          else
            write(a[i,j],' ');
      end;
  writeln();
  writeln('click: ');
  write('x: ');
  readln(ic);
  write('y: ');
  readln(jc);
  v[jc,ic]:=1;

  repeat
  begin
    i:=random(n)+1;
    j:=random(n)+1;
    if (a[i,j]=0) and (v[i,j]=0)then
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

  win:=false;
  loss:=false;
  mc:=miny;

  writeln();

  repeat
  begin
    clrscr;
    writeln('Zbývá min: ',mc);

//cheatsheet-delete{}
{
  for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
            write(a[i,j],' ');
      end;
}

    for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
          if v[i,j]=0 then
            write('# ')
          else
            if v[i,j]=1 then
              write(a[i,j],' ')
            else
              write('f ');
      end;

      writeln();
      write('click or flag(c/f): ');
      readln(cf);
      if cf='c' then
        writeln('click: ');
      if cf='f' then
        writeln('flag: ');
      if (cf='c') or (cf='f') then
      begin
        write('x: ');
        readln(ic);
        write('y: ');
        readln(jc);
      end;
      if (cf='c') and (a[jc,ic]=9) then
        loss:=true
      else
        if cf='c' then
          v[jc,ic]:=1
        else
          v[jc,ic]:=2;
     mc:=miny;
     for i:=1 to n do
       for j:=1 to n do
           if (a[i,j]=9) and (v[i,j]=2) then
             mc:=mc-1;
     if mc=0 then
       win:=true;
  end;
  until (win=true) or (loss=true);
  if loss=true then writeln('You lost');
  if win=true then writeln('You win');
end.
