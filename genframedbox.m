function [x,y,z,v,t,L]=genframedbox(Mx,My,Mz,Value,Team)
xs=max(Mx,3);
ys=max(My,4);
zs=max(Mz,3);

% clear a box
Box = zeros(xs,ys,zs);
% gen frame
Box(1:xs,1,1)=Value;
Box(1:xs,1,zs)=Value;
Box(1:xs,ys,1)=Value;
Box(1:xs,ys,zs)=Value;

Box(1,1,1:zs)=Value;
Box(xs,1,1:zs)=Value;
Box(1,ys,1:zs)=Value;
Box(xs,ys,1:zs)=Value;

Box(1,1:ys,1)=Value;
Box(xs,1:ys,1)=Value;
Box(1,1:ys,zs)=Value;
Box(xs,1:ys,zs)=Value;

% linearize
[x,y,z,v,t,L]=LinearizeBox(Box,Team,1);



