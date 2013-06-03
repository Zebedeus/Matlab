function removelava(FileName)
% load a world from file, and replaces the lava with empty blocks

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;


[level team]=LoadWorld(FileName


for x=1:64
    for y=1:64
        for z=1:64
            if level(x,y,z)==LAVA
                level(x,y,z)=EMPTY;
            end
        end
    end
end
                

SaveWorld(['no-lava-' FileName],level,team)





