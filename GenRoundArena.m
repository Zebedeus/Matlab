function [x,y,z,v,t,L]=GenRoundArena(radius,ys,tm)
% generate a round team arena for team tm

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% clear a box
Box = zeros(2*radius+1,ys,2*radius);
Team = zeros(2*radius+1,ys,2*radius);

% removable floor
if tm==REDTEAM
    floor = SOLIDRED;
    ropes = FORCEBLUE;
else
    floor = SOLIDBLUE;
    ropes = FORCERED;
end


for a=0:1/(3*radius):2*pi
    for r=0:0.5:radius-2
        xs =1+radius+ round(r*sin(a));
        zs =1+radius+ round(r*cos(a));
        Box(xs,ys,zs)=JUMP;
        Box(xs,1,zs)=SHOCK;
        Team(xs,ys,zs)=NEUTRALTEAM;
        Team(xs,1,zs)=NEUTRALTEAM;
        
        Box(xs,ys-1,zs)=floor;
        Team(xs,ys-1,zs)=tm;
        
    end
end

for a=0:1/(3*radius):2*pi
    for r=radius-1:radius
        xs = 1+radius+round(r*sin(a));
        zs = 1+radius+round(r*cos(a));
        
        Box(xs,1,zs)=LADDER;
        Team(xs,1,zs)=NEUTRALTEAM;
        Box(xs,2,zs)=ropes;
        Team(xs,2,zs)=NEUTRALTEAM;
        
        Box(xs,ys-3,zs)=ropes;
        Team(xs,ys-3,zs)=NEUTRALTEAM;
        Box(xs,ys-2,zs)=ropes;
        Team(xs,ys-2,zs)=NEUTRALTEAM;
     
        Box(xs,ys-1,zs)=LADDER;
        Team(xs,ys-1,zs)=NEUTRALTEAM;
        Box(xs,ys,zs)=LADDER;
        Team(xs,ys,zs)=NEUTRALTEAM;
       
        
    end
end
Box(radius,ys-2,1)=EMPTY;
Box(radius,ys-2,2*radius+1)=EMPTY;
Box(radius,ys-3,1)=EMPTY;
Box(radius,ys-3,2*radius+1)=EMPTY;
Box(radius,ys-2,2)=EMPTY;
Box(radius,ys-2,2*radius)=EMPTY;
Box(radius,ys-3,2)=EMPTY;
Box(radius,ys-3,2*radius)=EMPTY;



% linearize
[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);



