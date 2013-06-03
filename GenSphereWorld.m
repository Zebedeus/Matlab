function GenSphereWorld
% generate world

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

FILENAME='Sphere.lvl'

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draw beams
%%%%%%%%%%%%%%%%%%%%%%%%%%%
level(1:64,33,33)=LADDER;
level(1:64,33,32)=LADDER;
level(1:64,32,33)=LADDER;
level(1:64,32,32)=LADDER;

level(33,1:64,33)=LADDER;
level(33,1:64,32)=LADDER;
level(32,1:64,33)=LADDER;
level(32,1:64,32)=LADDER;

level(33,33,1:64)=LADDER;
level(32,33,1:64)=LADDER;
level(33,32,1:64)=LADDER;
level(32,32,1:64)=LADDER;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draw sphere
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=[2]
    
    
    radius = [15];
    r=randperm(length(radius));
    radius(r(1))
    xm=32;
    ym=32;
    zm=32;
    [xm ym zm]
    [x,y,z,v,t,L]=GenSphere2(radius(r(1)),1,xm,ym,zm,LADDER,REDTEAM);
    
    
    
    % add to level
    [level,team]=ClipAdd(level,team,x,y,z,v,t,L);
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% make concave ceiling
%%%%%%%%%%%%%%%%%%%%%%%%%%%
radius=203;
midx=32;
midy=-194;
midz=32;
ratio=1;

[x,y,z,v,t,L]=GenSphere(radius,ratio,SHOCK,NEUTRALTEAM);

x = x+midx;
y = y+midy;
z = z+midz;

% add to level
[level,team]=ClipAdd(level,team,x,y,z,v,t,L);


radius=135;
midx=32;
midy=200-64;
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

[x,y,z,v,t,L]=GenSphere(radius,ratio,FORCERED,NEUTRALTEAM);

x = x+midx;
y = y+midy;
z = z+midz;

% add to level
[level,team]=ClipAdd(level,team,x,y,z,v,t,L);





%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draw  round arena
%%%%%%%%%%%%%%%%%%%%%%%%%%%



% r=10;
% ys=7;
% 
% if rand < 0.5
%     t = BLUETEAM;
% else
%     t=REDTEAM;
% end
% 
% [x,y,z,v,t,L]=GenRoundArena(r,ys,t);
% 
% % move arena to middle position
% x=x+32-r;
% y=y+64-2-ys;
% z=z+32-r;
% 
% % add to level
% [level,team]=ClipAdd(level,team,x,y,z,v,t,L);

r1=30;
r2=30;

xm=32;
ym=32;
zm=32;


for a=[0:20:360]
    
    [x,y,z,v,t,L]=GenRing(r1,r2,a/180*pi,xm,ym,zm,LADDER,REDTEAM);
    
    % add to level
    [level,team]=ClipAdd(level,team,x,y,z,v,t,L);
    
end

% put in a floor
for x=1:64
    for z=1:64
        level(x,63,z)=LADDER;
    end
end

%y
[x,y,z,v,t,L]=LinearizeBox(level,team,1);

plot3(x(find(v>0)),z(find(v>0)),-y(find(v>0)),'.')


SaveWorld(FILENAME,level,team);







