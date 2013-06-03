function [level,team]=LoadWorld(FileName)
% loads a world from file and stores the world in the cubes level and team
EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% start with an empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;

fid=fopen(FileName,'rt');
% matlab loads all lines and will put the results in an one dim array
% (64*64*64*2)
A=fscanf(fid,'%d , %d\n');
fclose(fid);

% fill the world with block types and team codes
idx=1;
for xi=1:64
    for yi=1:64
        for zi=1:64 
            level(xi,65-yi,zi)=A(idx);
            idx=idx+1;
            team(xi,65-yi,zi)=A(idx);
            idx=idx+1;
        end
    end
end