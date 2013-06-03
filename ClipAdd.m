function [level,team]=ClipAdd(level,team,x,y,z,v,t,L)

% add an object to the level

for j=1:L
    if (x(j)>1) & (x(j)<64) & (y(j)>1) & (y(j)<64) & (z(j)>1) & (z(j)<64)

        level(x(j),y(j),z(j)) = v(j);
        team(x(j),y(j),z(j)) = t(j); 
    end
end