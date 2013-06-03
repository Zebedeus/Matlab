function  [x,y,z,v,t,L]=GenRing(r1,r2,a,xm,ym,zm,Block,tm)

% generate a ring with center yx, xm, zm, angle a and radius r1 up to r2 
% with block type Block for team tm.

Box=zeros(64,64,64);
Team=zeros(64,64,64);

% build ring
for r=r1:0.1:r2
    for ui=[a]
        for vi=[0:0.1/r:2*pi]
            xn =xm + round(r * sin(vi)*cos(ui));
            yn =ym + round(r * sin(vi)*sin(ui));
            zn =zm + round(r * cos(vi));
            
            % clip 
            if (xn>1) & (xn<64) & (yn>1) & (yn<64) & (zn>1) & (zn<64)
                Box(xn,yn,zn)=Block;
                Team(xn,yn,zn)=tm;
            end
            
        end
    end
end

% linearize
[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);
