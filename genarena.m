function [x,y,z,v,t,L]=GenArena(xs,ys,zs,tm)
% generate a team arena

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% clear a box
Box = zeros(xs,64,zs);
Team = zeros(xs,64,zs);

% gen neutral ladder frame
Box(1:xs,1,1)=LADDER;
Box(1:xs,1,zs)=LADDER;
Box(1:xs,ys,1)=LADDER;
Box(1:xs,ys,zs)=LADDER;

Team(1:xs,1,1)=NEUTRALTEAM;
Team(1:xs,1,zs)=NEUTRALTEAM;
Team(1:xs,ys,1)=NEUTRALTEAM;
Team(1:xs,ys,zs)=NEUTRALTEAM;

Box(1,1,1:zs)=LADDER;
Box(xs,1,1:zs)=LADDER;
Box(1,ys,1:zs)=LADDER;
Box(xs,ys,1:zs)=LADDER;

Team(1,1,1:zs)=NEUTRALTEAM;
Team(xs,1,1:zs)=NEUTRALTEAM;
Team(1,ys,1:zs)=NEUTRALTEAM;
Team(xs,ys,1:zs)=NEUTRALTEAM;

Box(1,1:ys,1)=LADDER;
Box(xs,1:ys,1)=LADDER;
Box(1,1:ys,zs)=LADDER;
Box(xs,1:ys,zs)=LADDER;

Team(1,1:ys,1)=NEUTRALTEAM;
Team(xs,1:ys,1)=NEUTRALTEAM;
Team(1,1:ys,zs)=NEUTRALTEAM;
Team(xs,1:ys,zs)=NEUTRALTEAM;

% make neutral jump floor and shock ceiling
Box(2:xs-1,ys,2:zs-1)=JUMP;
Box(2:xs-1,1,2:zs-1)=SHOCK;
Team(2:xs-1,ys,2:zs-1)=NEUTRALTEAM;
Team(2:xs-1,1,2:zs-1)=NEUTRALTEAM;

% removable floor & ropes
if tm==REDTEAM
    floor = SOLIDRED;
    ropes = FORCEBLUE;
else
    floor = SOLIDBLUE;
    ropes = FORCERED;
end


Box(2:xs-1,ys-1,2:zs-1)=floor;
Team(2:xs-1,ys-1,2:zs-1)=tm;

for i=[2 3 (ys-2)]
    Box(2:xs-1,ys-i,1)=ropes;
    Team(2:xs-1,ys-i,1)=NEUTRALTEAM;
    Box(2:xs-1,ys-i,zs)=ropes;
    Team(2:xs-1,ys-i,zs)=NEUTRALTEAM;
    Box(1,ys-i,2:zs-1)=ropes;
    Team(1,ys-i,2:zs-1)=NEUTRALTEAM;
    Box(xs,ys-i,2:zs-1)=ropes;
    Team(xs,ys-i,2:zs-1)=NEUTRALTEAM;
end
% make doors
for i=[2 3 ]
    Box(2,ys-i,1)=EMPTY;
    Team(2,ys-i,1)=NEUTRALTEAM;
    Box(xs-1,ys-i,zs)=EMPTY;
    Team(xs-1,ys-i,zs)=NEUTRALTEAM;
end

% make ladders
Box(2,ys:64,1)=LADDER;
Team(2,ys:64,1)=NEUTRALTEAM;
Box(xs-1,ys:64,zs)=LADDER;
Team(xs-1,ys:64,zs)=NEUTRALTEAM;


% linearize
[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);



