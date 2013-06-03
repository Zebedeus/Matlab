function [x,y,z,v,t,L]=LinearizeBox(Box,Team,c)
% linearize a box shaped object for both blocktypes and team, and compress
% (remove empty values) if necesary.

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

[xs,ys,zs]=size(Box);

% linearize
L=xs*ys*zs;
x=zeros(1,L);
y=zeros(1,L);
z=zeros(1,L);
v=zeros(1,L);
t=zeros(1,L);

i=1;
for xi=1:xs
    for yi=1:ys
        for zi=1:zs
            if c==1
                if Box(xi,yi,zi)>EMPTY
                    x(i) = xi;      
                    y(i) = yi;  
                    z(i) = zi;
                    v(i)=Box(xi,yi,zi);
                    t(i)=Team(xi,yi,zi);
                    i=i+1;
                end
            else
                x(i) = xi;      
                y(i) = yi;  
                z(i) = zi;
                v(i)=Box(xi,yi,zi);
                t(i)=Team(xi,yi,zi);
                i=i+1;
            end
        end
    end
end


