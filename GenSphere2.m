function  [x,y,z,v,t,L]=GenSphere2(radius,ratio,xm,ym,zm,Block,tm)

% build a hollow sphere at xm, ym, zm with radius at a sampling interval ratio 
% for Block and team 

Box=zeros(64,64,64);
Team=zeros(64,64,64);

% build linearized sphere
for ui=[0:ratio/radius:2*pi]
    for vi=[0:ratio/radius:pi]
        xn =xm + round(radius * sin(vi)*cos(ui));
        yn =ym + round(radius * sin(vi)*sin(ui));
        zn =zm + round(radius * cos(vi));
        % clip 
        if (xn>1) & (xn<64) & (yn>1) & (yn<64) & (zn>1) & (zn<64)
            Box(xn,yn,zn)=Block;
            Team(xn,yn,zn)=tm;
        end
        
    end
end

% linearize
[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);
