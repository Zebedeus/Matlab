function GenArenaWorld
% generate world

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

FILENAME='Arena.lvl'

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% make concave ceiling
%%%%%%%%%%%%%%%%%%%%%%%%%%%
radius=200;
midx=32;
midy=-195;
midz=32;
ratio=1;

[x,y,z,v,t,L]=GenSphere(radius,ratio,SHOCK,NEUTRALTEAM);

x = x+midx;
y = y+midy;
z = z+midz;

% add to level
[level,team]=ClipAdd(level,team,x,y,z,v,t,L);



% make small spherical cutout
radius=15;
midx=32;
midy=0;
midz=32;
ratio=1;

[x,y,z,v,t,L]=GenSphere(radius,ratio,EMPTY,NEUTRALTEAM);

x = x+midx;
y = y+midy;
z = z+midz;

% add to level
[level,team]=ClipAdd(level,team,x,y,z,v,t,L);



%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draw random box arenas
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:7
    
    % random sizes
    r=1+round(rand*10);
    xs=r+round(rand*10);
    ys=7;
    zs=r+round(rand*10);
    
    if rand < 0.5
        t = BLUETEAM;
    else
        t=REDTEAM;
    end
    
    [x,y,z,v,t,L]=GenArena(xs,ys,zs,t);
    
    % move arena to random position
    x=x+round(rand*(64-xs));
    y=y+i*7;
    z=z+round(rand*(64-xs));
    
    % add to level
    [level,team]=ClipAdd(level,team,x,y,z,v,t,L);
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draw random round arenas
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:7
    
    % random sizes
    r=1+round(rand*10);
    ys=7;
   
    if rand < 0.5
        t = BLUETEAM;
    else
        t=REDTEAM;
    end
    
    [x,y,z,v,t,L]=GenRoundArena(r,ys,t);
    
    % move arena to random position
    x=x+round(rand*(64-r*2));
    y=y+i*7;
    z=z+round(rand*(64-r*2));
    
    % add to level
    [level,team]=ClipAdd(level,team,x,y,z,v,t,L);
    
end



% put in a floor
for x=1:64
    for z=1:64
        level(x,63,z)=LADDER;
    end
end

%
[x,y,z,v,t,L]=LinearizeBox(level,team,1);

%plot3(x(find(v>0)),z(find(v>0)),-y(find(v>0)),'.')


SaveWorld(FILENAME,level,team);







