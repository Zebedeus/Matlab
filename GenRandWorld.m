

FILENAME='rand.lvl'

EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;

BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;


WALLTHR=2/7;;
FLOORTHR=1/15;
TOPTHR=1/20;

% make solid cube
level=zeros(64,64,64)+ EMPTY;
team=zeros(64,64,64)+  NEUTRALTEAM;


x=32;
y=32;
z=32;

for i=1:10*64^3
    r=randperm(6); %-x +x -y +y -z +z
   
    for j=1:6
        n=0;
        if r(j)==1
            xn=x-1;
            if xn==1
                xn=x;
            end
            yn=y;
            zn=z;
            if (level(xn-1,yn,zn)==0) & (level(xn,yn-1,zn)==0) & (level(xn,yn+1,zn)==0) & (level(xn,yn,zn-1)==0) & (level(xn,yn,zn+1)==0)
                n=1;
                break
            end
            xn=x;
        end
        if r(j)==2
            xn=x+1;
            if xn==64
                xn=x;
            end
            yn=y;
            zn=z;
            if (level(xn+1,yn,zn)==0) & (level(xn,yn-1,zn)==0) & (level(xn,yn+1,zn)==0) & (level(xn,yn,zn-1)==0) & (level(xn,yn,zn+1)==0)
                n=1;
                break
            end
            xn=x;
        end
        if r(j)==3
            yn=y-1;
            if yn==1
                yn=y;
            end
            xn=x;
            zn=z;
            if (level(xn-1,yn,zn)==0) & (level(xn+1,yn,zn)==0) & (level(xn,yn-1,zn)==0) & (level(xn,yn,zn-1)==0) & (level(xn,yn,zn+1)==0)
                n=1;
                break
            end
            yn=y;
        end
        if r(j)==4
            yn=y+1;
            if yn==64
                yn=y;
            end
            xn=x;
            zn=z;
            if (level(xn-1,yn,zn)==0) & (level(xn+1,yn,zn)==0)  & (level(xn,yn+1,zn)==0) & (level(xn,yn,zn-1)==0) & (level(xn,yn,zn+1)==0)
                n=1;
                break
            end
            yn=y;
        end
        if r(j)==5
            zn=z-1;
            if zn==1
                zn=z;
            end
            xn=x;
            yn=y;
            if (level(xn-1,yn,zn)==0) & (level(xn+1,yn,zn)==0) & (level(xn,yn-1,zn)==0) & (level(xn,yn+1,zn)==0) & (level(xn,yn,zn-1)==0) 
                n=1;
                break
            end
            zn=z;
        end
        if r(j)==6
            zn=z+1;
            if zn==64
                zn=z;
            end
            xn=x;
            yn=y;
            if (level(xn-1,yn,zn)==0) & (level(xn+1,yn,zn)==0) & (level(xn,yn-1,zn)==0) & (level(xn,yn+1,zn)==0) &  (level(xn,yn,zn+1)==0)
                n=1;
                break
            end
            zn=z;
        end
        
    end
    if n==1;
        x=xn;
        y=yn;
        z=zn;
         level(x,y,z) = LADDER;
    end
    
    
    
    if (j==6) & (n==0)
        r=randperm(62)+1;
        x=r(1);
                r=randperm(62)+1;
        y=r(1);
                r=randperm(62)+1;
        z=r(1);
    end
   
end



SaveWorld(FILENAME,level,team);



