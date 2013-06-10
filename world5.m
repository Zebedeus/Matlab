function world5
% generate world

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;


[x,y,z,v,t,L]=ExtractChunkFromFile('platforms_save2.lvl',[49:54],[40:47],[29:35]);

xm=max(x);
ym=max(y);
zm=max(z);

ar=[0 45 90 135  180 270]/180*pi;

for i=1:100
    r=randperm(64);
    xo=r(1);
    r=randperm(64);
    yo=r(1);
    r=randperm(64);
    zo=r(1);
    
    %     r = sqrt(x.^2 + z.^2);
    %     a = atan2(z,x);
    %     
    %     ri = randperm(4);
    %   
    %     
    %     
    %    
    %     x=floor(r.*cos(a+ar(ri(1))));
    %     z=floor(r.*sin(a+ar(ri(1))));
    %     
    
    r=randperm(4);
    
    if r(1)==1
        
        [level,team]=ClipAdd(level,team,xo+x,yo+y,zo+z,v,t,L);
    end
    if r(1)==2
        
        [level,team]=ClipAdd(level,team,zo+z,yo+y,xo+x,v,t,L);
    end
    
    if r(1)==3
        
        [level,team]=ClipAdd(level,team,xo-x,yo+y,zo-z,v,t,L);
    end
    if r(1)==4
        
        [level,team]=ClipAdd(level,team,zo-z,yo+y,xo-x,v,t,L);
    end
    
end

% linearize the cube
% and preview for convenience 
[x,y,z,v,t,L]=LinearizeBox(level,team,1);
plot3(x(find(v>0)),z(find(v>0)),-y(find(v>0)),'.')

SaveWorld('world.lvl',level,team)
