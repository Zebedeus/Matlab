function [x,y,z,v,t,L]=ExtractChunkFromFile(FileName,xr,yr,zr)

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;



[Box,Team]=LoadWorld(FileName);

% clip ranges
Box=Box(xr,yr,zr);
Team=Team(xr,yr,zr);

size(Box)

[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);



%coords y=47:40
% z=29:35
% x=49:54