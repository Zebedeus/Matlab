% generate maze
% level build up
%1 XXXXX
%2 TTTTT
%3 TTTTT
%4 WWWWW
%5 MAZE
%6 LLLLL
%7 LLLLL
%4 WWWWW
%5 MAZE
%6 LLLLL
%7 LLLLL

FILENAME='maze.lvl'

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;

BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;


WALLTHR=2/7;;
FLOORTHR=1/15;
TOPTHR=1/20;

% make solid cube
level=zeros(64,64,64)+ STEEL;
team=zeros(64,64,64)+  NEUTRALTEAM;



% place intermediate ladder floors
for x=1:64
    for y=2:4:64
        for z=1:64
            level(x,y,z)=LADDER;
            level(x,y+1,z)=LADDER;
        end
    end
end

% make the floor windows
for x=1:64
    for y=4:4:61
        for z=1:64
            level(x,y,z)=EMPTY;
           % team(x,y,z)=BLUETEAM;
        end
    end
end

% pierce floors
for x=4:2:61
    for y=4:4:61-4
        for z=4:2:61
            r=rand;
            if r < FLOORTHR 
                level(x,y+2,z)=0;
                level(x,y+3,z)=0;
                level(x-1,y+1,z)=ROAD;
                level(x+1,y+1,z)=ROAD;
                level(x,y+1,z-1)=ROAD;
                level(x,y+1,z+1)=ROAD;
                if y < 64-6 
                    level(x,y+4,z)=EMPTY;
                    level(x,y+5,z)=EMPTY;
                    level(x,y+6,z)=ROAD;
                    
                end
            end
        end
    end
end



% remove walls randomly
for x=4:2:61
    for y=4:4:61
        for z=4:2:61
            r=rand;
            if r < WALLTHR
                level(x-1,y,z)=0;
                level(x-1,y+1,z)=0;
            end
            r=rand;
            if rand < WALLTHR
                level(x+1,y,z)=0;
                level(x+1,y+1,z)=0;
            end
            r=rand;
            if r < WALLTHR
                level(x,y,z+1)=0;
                level(x,y+1,z+1)=0;
            end
            r=rand;
            if r < WALLTHR
                level(x,y,z+1)=0;
                level(x,y+1,z+1)=0;
            end
        end
    end
end


% conditionally remove  crossings
for x=4:2:61
    for y=4:4:61
        for z=4:2:61
            if (level(x-1,y+1,z)==0)|(level(x+1,y+1,z)==0)|(level(x,y+1,z-1)==0)|(level(x,y+1,z+1)==0)
                level(x,y,z)=0;
                level(x,y+1,z)=0;             
            end
        end
    end
end


% cleanup stray blocks
for x=4:61
    for y=4:1:61
        for z=4:61
            if (level(x-1,y,z)==0)&(level(x+1,y,z)==0)&(level(x,y,z-1)==0)&(level(x,y,z+1)==0&...
                    level(x-1,y,z-1)==0)&(level(x+1,y,z+1)==0)&(level(x-1,y,z+1)==0)&(level(x+1,y,z-1)==0)
                level(x,y,z)=0;
                   
            end
        end
    end
end

% pierce top
for x=4:2:61
    for y=2
        for z=4:2:61
            r=rand;
            if r < TOPTHR 
                r=rand;
                if r < 0.5
                    level(x,y,z)=FORCERED;
                    level(x,y+1,z)=FORCERED;
                    level(x,y+4,z)=ROAD;
                else
                    level(x,y,z)=FORCEBLUE;
                    level(x,y+1,z)=FORCEBLUE;
                    level(x,y+4,z)=ROAD;
                end
            end
        end
    end
end

% make diamond bottom

for x=4:61
    for y=62
        for z=4:61
            level(x,y-1,z)=EMPTY;
            level(x,y,z)=DIAMOND;
            level(x,y+1,z)=STEEL;
        end
    end
end


SaveWorld(FILENAME,level,team)


