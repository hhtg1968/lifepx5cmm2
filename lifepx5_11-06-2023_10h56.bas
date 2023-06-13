rem to do/ think:
rem
rem use pixel command with array for whole line?!
rem - perhaps not possible on picomitevga?!
rem
dim string k$,v$=mm.device$
if v$="Colour Maximite 2" then mode 7
if v$="PicoMiteVGA" then mode 2
option explicit
Cls
Colour rgb(magenta)
Print"LIFEpx5 v5.0.3 for "v$
Print
print"converted from my version for the amstrad cpc 464"
print
print"from 1985!"
print
Colour rgb(white)
Print"(c) hhtg. 11-06-2023  10h56"
print"no, it is open source!"
Print
Print"press a key to start or wait 10s"
print
print"during runtime:"
print
print"press h or ? for help"
print"press o to see params"
print"press n to show recent number of lifeforms" 

dim z(321,2)
dim integer n,mx=320,my=240,sw,gruen,blau,rot,lila,weiss,dx,dy,s,j,x,y,o,u,l,r,t,cx,cy,jj
dim float grw=0.3,grw2=0.999,gww=0.9,ggw=0.6,waw=0.7,waw2=0.999,wow,scw=0.1,sww=0.1,pow=0.8,wgw=0.2
dim float ggw1=0.93
dim integer maxx=800, maxy=600
do
loop until inkey$=""
timer=0
do
if inkey$<>"" then exit do
loop until timer>10000
pixel 0,0,rgb(yellow):sw=pixel(0,0)
pixel 0,0,rgb(green):gruen=pixel(0,0)
pixel 0,0,rgb(blue):blau=pixel(0,0)
pixel 0,0,rgb(red):rot=pixel(0,0)
pixel 0,0,rgb(magenta):lila=pixel(0,0)
pixel 0,0,rgb(white):weiss=pixel(0,0)
cls rgb(yellow)
dx=mx
dy=my
s=dx*dy
For n=0 To Sqr(s)
  Pixel 2+(dx-6)*Rnd,2+(dy-4)*Rnd,rgb(green)
Next n
For n=0 To Sqr(s)/4
  Pixel 2+(dx-6)*Rnd,2+(dy-4)*Rnd),rgb(blue)
Next n
i_schaf
i_wolf
j=1

again:
Line 0,0,dx-1,0,,rgb(blue)
Line 0,0,0,dy-1,,rgb(blue)
Line 0,dy-1,dx-1,dy-1,,rgb(blue)
Line dx-1,dy-1,dx-1,0,,rgb(blue)
For y=1 To dy-2
  For x=1 To dx-2
    o=Pixel(x,y+1)
    u=Pixel(x,y-1)
    r=Pixel(x+1,y)
    l=Pixel(x-1,y)
    t=Pixel(x,y)
    select case t
    case sw
      If (o=gruen Or u=gruen Or r=gruen Or l=gruen) and rnd>grw Then
        t=rgb(green)
      elseif (o=blau or u=blau or r=blau or l=blau) and rnd>waw then
        t=rgb(blue)
      elseIf (o=lila Or u=lila Or r=lila Or l=lila) And Rnd>pow Then
        t=rgb(magenta)
      elseif rnd>grw2 then
        t=rgb(green)
      endif
    case blau
      If (o=gruen Or u=gruen Or r=gruen Or l=gruen) And Rnd>gww Then t=rgb(green)
      if rnd>waw2 then t=rgb(green)
    case gruen
      If (o=weiss Or u=weiss Or r=weiss Or l=weiss) and rnd>scw Then
        t=rgb(white)
      elseif (o=lila or u=lila or r=lila or l=lila) and rnd>ggw then
        t=rgb(magenta)
      endif
    case weiss
      t=sw
      if o=gruen or u=gruen or r=gruen or l=gruen then t=rgb(white)
      If (o=rot Or u=rot Or r=rot Or l=rot) and rnd>sww Then t=rgb(red)
    case rot
      t=sw
    case lila
      If o=blau Or u=blau Or r=blau Or l=blau Then If Rnd>wgw Then t=rgb(blue)
      If o=gruen Or u=gruen Or r=gruen Or l=gruen Then If Rnd>ggw1 Then t=rgb(green)
    end select
    draw:
    z(x,y Mod 3)=t
  Next x
  k$=Inkey$
  If k$="" Then GoTo nxt
  if k$="A" then cls sw
  If k$="r" Then Run
  if k$="n" then count
  If k$="q" Then Mode 1:End
  If k$="c" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(blue)
  If k$="C" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(blue),rgb(blue)
  If k$="k" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,sw
  If k$="K" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,sw,sw
  If k$="g" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(green)
  If k$="G" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(green),rgb(green)
  If k$="p" Then r=Rnd*dy/4:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(magenta)
  If k$="P" Then r=Rnd*dy/8:cx=r+Rnd*dy/2:cy=r+Rnd*dy/2:Circle cx,cy,r,,,rgb(magenta),rgb(magenta)
  If k$="w" Then i_wolf
  If k$="s" Then i_schaf
  If k$="x" Then For n=0 To 127:Pixel 2+(dx-4)*Rnd,2+(dy-4)*Rnd,rgb(magenta):Next n
  If k$="W" Then For n=0 To 127:Pixel 2+(dx-4)*Rnd,2+(dy-4)*Rnd,rgb(blue):Next n
  If k$="S" Then
    if y>2 then For x=1 To dx-2:Pixel x,y-2,z(x,(1+y Mod 3) Mod 3):Next x
    save image "lifepx4.bmp",1,1,dx-2,dy-2
    endif
  If k$="L" Then Load bmp "lifepx4.bmp",1,1
  if k$="o" then params
  If k$="h" Or k$="?" Then hilfe
  nxt:
  if y>2 then
    line 1,y-1,mx-2,y-1,,rgb(orange)
    For x=1 To dx-2:Pixel x,y-2,z(x,(1+y Mod 3) Mod 3):Next x
  endif
Next y
For x=1 To dx-2:Pixel x,y-2,z(x,(1+y Mod 3) Mod 3):Next x
inc y
For x=1 To dx-2:Pixel x,y-2,z(x,(1+y Mod 3) Mod 3):Next x
print@(2,231)str$(j);
inc j
jj=len(str$(j))*6+1
line 1,230,jj,230,,0
line jj,230,jj,239,,0
line 1,230,1,239,,0
GoTo again

sub params
cachescr
cls
print"parameters/ probabilities:"
print
colour rgb(yellow)
print"in desert:"
print"random creation of grass:"(1-grw2)*100" %"
print"growth of grass"(1-grw)*100" %"
print"growth of poison"(1-pow)*100" %"
colour rgb(blue)
print"in water:"
print"growth of grass"(1-gww)*100" %"
print"creation of grass"(1-waw2)*100" %"
colour rgb(green)
print"on grass:"
print"growth of sheeps:"(1-scw)*100" %"
print"growth of poison:"(1-ggw)*100" %"
colour rgb(white)
print"at the sheeps:"
print"growth of wolfes:"(1-sww)*100" %"
colour rgb(magenta)
print"in the poison:"
print"growth of water"(1-wgw)*100" %"
print"growth of grass"(1-ggw1)*100" %"
print
colour rgb(white)
print"press a key..."
waitkey
popscr
end sub

Sub hilfe
cachescr
Cls
Print"keys:"
print"A - atomic bomb!"
print"n - count the lifeforms"
Print"r - run           q - quit"
Print"c - circle water  C - filled"
Print"k - circle clean  K - filled"
Print"g - circle grass  G - filled"
Print"p - circle poison P - filled"
Print"w - insert wolfs  s - insert sheeps"
Print"W - rain/water    x - poisened rain!"
Print"L - load landscape  S - save"
print"    file: lifepx4.png"
print
print"o - show and change parameters"
Print
Print"h or ? - this help page"
Print
colour rgb(yellow)
print". desert ";
Colour rgb(green)
Print". grass ";
Colour rgb(blue)
Print". water ";
Colour rgb(white)
Print". sheep ";
Colour rgb(red)
Print". wolfe ";
Colour rgb(magenta)
Print". poison"
Colour rgb(white)
Print
Print"year: ";j;"  calculations: ";(j-1)*s+y*(dx-2)
Print
Print"press a key..."
waitkey
popscr
End Sub

Sub i_wolf
Local x,y,a
For n=0 To Sqr(s)/8
  a=0
  Do
    x=2+(dx-6)*Rnd
    y=2+(dy-4)*Rnd
    o=Pixel(x,y+1)
    u=Pixel(x,y-1)
    r=Pixel(x+1,y)
    l=Pixel(x-1,y)
    a=a+1
  Loop Until o=weiss Or u=weiss Or r=weiss Or l=weiss Or a>1023
  Pixel x,y,rgb(red)
Next n
End Sub

Sub i_schaf
Local x,y,a
For n=0 To Sqr(s)/4
  a=0
  Do
    x=2+(dx-6)*Rnd
    y=2+(dy-4)*Rnd
    o=Pixel(x,y+1)
    u=Pixel(x,y-1)
    r=Pixel(x+1,y)
    l=Pixel(x-1,y)
    a=a+1
  Loop Until o=gruen Or u=gruen Or r=gruen Or l=gruen Or a>1023
  Pixel x,y,rgb(white)
  Pixel x+1,y,rgb(white)
  Pixel x,y+1,rgb(white)
Next n
End Sub

sub waitkey
do
loop until inkey$<>""
end sub

sub count
local x,y,t,zn=0,zg=0,zwa=0,zs=0,zw=0,zp=0,za=0
for y=1 to dy-1
  for x=1 to dx-1
    t=pixel(x,y)
    select case t
    case sw
      inc zn
    case gruen
      inc zg
    case blau
      inc zwa
    case weiss
      inc zs
    case rot
      inc zw
    case lila
      inc zp
    case else
      inc za
    end select
  next x
next y
cachescr
cls
colour rgb(white)
print"statistics in pixels:"
print
colour rgb(yellow)
print"desert: "zn
print
colour rgb(green)
print"grass:  "zg
print
colour rgb(blue)
print"water:  "zwa
print
colour rgb(white)
print"sheeps: "zs
print
colour rgb(red)
print"wolfes: "zw
print
colour rgb(magenta)
print"poison: "zp
print
colour rgb(white)
print"press a key ..."
waitkey
popscr
end sub

sub cachescr
if v$="Colour Maximite 2" then blit read 1,0,0,dx,dy
if v$="PicoMiteVGA" then framebuffer copy N,F
end sub

sub popscr
if v$="Colour Maximite 2" then blit write 1,0,0
if v$="PicoMiteVGA" then framebuffer write N
end sub
