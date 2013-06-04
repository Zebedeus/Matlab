function [level,team] = GenKleinBottle



EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;

% make empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;

% code from mathworks
Res=20; % increase resolution of the bottle

n = 12;
a = .2;                         % the diameter of the small tube
c = .6;                         % the diameter of the bulb
t1 = pi/4 : pi/(Res*n) : 5*pi/4;      % parameter along the tube
t2 = 5*pi/4 : pi/(Res*n) : 9*pi/4;    % angle around the tube
u  = pi/2 : pi/(Res*n) : 5*pi/2;
[X,Z1] = meshgrid(t1,u);
[Y,Z2] = meshgrid(t2,u);

% The handle
len = sqrt(sin(X).^2 + cos(2*X).^2);
x1 = c*ones(size(X)).*(cos(X).*sin(X) ...
    - 0.5*ones(size(X))+a*sin(Z1).*sin(X)./len);
y1 = a*c*cos(Z1).*ones(size(X));
z1 = ones(size(X)).*cos(X) + a*c*sin(Z1).*cos(2*X)./len;
%handleHndl=surf(x1,y1,z1,X);
%set(handleHndl,'EdgeColor',[.5 .5 .5]);
%hold on;

% The bulb
r = sin(Y) .* cos(Y) - (a + 1/2) * ones(size(Y));
x2 = c * sin(Z2) .* r;
y2 = - c * cos(Z2) .* r;
z2 = ones(size(Y)) .* cos(Y);
%bulbHndl=surf(x2,y2,z2,Y);
%set(bulbHndl,'EdgeColor',[.5 .5 .5])

% colormap(hsv);
% axis vis3d
% view(-37,30);
% axis off
% light('Position',[2 -4 5])
% light
% hold off

% scale the bottle to fit 64 sized infiniminer map
x1=1+round(72*(x1+1)/2);
y1=1+round(72*(y1+1)/2);
z1=6+round(60*(z1+1)/2);
x2=1+round(72*(x2+1)/2);
y2=1+round(72*(y2+1)/2);
z2=1+round(60*(z2+1)/2);

z1=64-z1;
z2=64-z2;

x1=x1(:);
y1=y1(:);
z1=z1(:);
x2=x2(:);
y2=y2(:);
z2=z2(:);



for L=1:length(x1)
    level(x1(L),z1(L),y1(L))=LADDER;
    team(x1(L),z1(L),y1(L))=REDTEAM;
end


for L=1:length(x2)
    level(x2(L),z2(L),y2(L))=LADDER;
    team(x2(L),z2(L),y2(L))=REDTEAM;
end


%[x,y,z,v,t,L]=LinearizeBox(level,team,1);

%plot3(x(find(v>0)),z(find(v>0)),-y(find(v>0)),'.')




