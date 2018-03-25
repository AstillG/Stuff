program minesweeper;
uses crt;
var i,j,ic,jc, //counters
    n,   //array size
    miny,//number of mines
    mc:  //mines counter
    integer;
    a,   //game board
    v:   //visibility of cells 0-hidden, 1-clicked, 2-flag
    array[1..20,1..20]of integer;
    win,loss:boolean;  //game result
    cf:string[1]; //action type c-click, f-flag

procedure frontend();  //showing game board
begin
for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
          if v[i,j]=0 then
            write('# ')   //hidden
          else
            if v[i,j]=1 then
              write(a[i,j],' ') //shoen
            else
              write('f ');      //flag
      end;
end;

begin

//mines generation(9)
  clrscr;
  writeln('Enter size: ');
  readln(n);
  miny:=round((n*n)/5); //number of mines
  mc:=miny;
  for i:=1 to n do
  for j:=1 to n do
    begin
      a[i,j]:=0;  //putting zero's everywhere
      v[i,j]:=0;
    end;
  writeln('Remaining mines: ',miny);

  frontend();

  writeln();
  writeln('click: ');
  write('x: ');
  readln(ic);
  write('y: ');
  readln(jc);
  v[jc,ic]:=1; //original click cannot be mine
  repeat //cyckle for mines generation
  begin
    i:=random(n)+1;//get random coordinates
    j:=random(n)+1;
    if (a[i,j]=0) and (v[i,j]=0) then //only put them in empty cell
      begin
        a[i,j]:=9;
        mc:=mc-1;
      end;
  end;
  until mc=0;

//counting mines around cells

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

  win:=false;
  loss:=false;
  mc:=miny;

  writeln();

  repeat
  begin
    clrscr;
    writeln('Remaining mines: ',mc);
//cheatsheet
{
  for i:=1 to n do
      begin
        writeln();
        for j:=1 to n do
            write(a[i,j],' ');
      end;
}

    frontend();

      writeln();
      write('click or flag(c/f): '); //getting action
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
      if (cf='c') and (a[jc,ic]=9) then //clicked on mine- end game
        loss:=true
      else
          if cf='c' then
            v[jc,ic]:=1 //if clicked set visibility to show
          else
            v[jc,ic]:=2; //flag
     mc:=miny;
     for i:=1 to n do    //checks if all mines are flag-ed
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
