function world6
% generate world

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + REDTEAM;


[x,y,z,v,t,L]=ExtractChunkFromFile('platforms_save2.lvl',[49:54],[40:47],[29:35]);

xm=max(x);
ym=max(y);
zm=max(z);


for yo=1:max([ym])+2:64
    
    level(1:64,min([yo+ym 64]) ,1:64)=LADDER;
    xstart = randperm(12)-6;
    for xo=xstart(1):max([xm zm])+1:64
        zstart = randperm(12)-6;
        for zo=zstart(1):max([xm zm])+1:64  
   
            r=randperm(4);
            
            
            if r(1)==1              
                [level,team]=ClipAdd(level,team,xo+(x-round(xm/2)),yo+y,zo+(z-round(zm/2)),v,t,L);
            end
            if r(1)==2
                
                [level,team]=ClipAdd(level,team,zo+(z-round(zm/2)),yo+y,xo+(x-round(xm/2)),v,t,L);
            end
            
            if r(1)==3
                
                [level,team]=ClipAdd(level,team,xo-(x-round(xm/2)),yo+y,zo-(z-round(zm/2)),v,t,L);
            end
            if r(1)==4
                
                [level,team]=ClipAdd(level,team,zo-(z-round(zm/2)),yo+y,xo-(x-round(xm/2)),v,t,L);
            end
            
           
        end
    end
end


% linearize the cube
% and preview for convenience 
[x,y,z,v,t,L]=LinearizeBox(level,team,1);
plot3(x(find(v>0)),z(find(v>0)),-y(find(v>0)),'.')

SaveWorld('world.lvl',level,team)
