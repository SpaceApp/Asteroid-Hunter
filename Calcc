
function dis = distance(ecc,semimajor,peri,meanmotion,now,time,incl,node)


AU = 149597871; %km;

%Earth data
e1=0.01671022;
a1=1.00000011;
peri1=102.94719*pi/180;
n1=1*pi/180;
time1=2451545.0;
incl1=0.00005;
node1= -11.26064*pi/180;

% 
% Semimajor axis (AU)                  1.00000011  
% Orbital eccentricity                 0.01671022   
% Orbital inclination (deg)            0.00005  
% Longitude of ascending node (deg)  -11.26064  
% Longitude of perihelion (deg)      102.94719  
% Mean Longitude (deg)               100.46435
pc = coordinates(ecc,semimajor,peri,meanmotion,now,time,incl,node);
pe = coordinates(e1,a1,peri1,n1,now,time1,incl1,node1);
dis = sqrt((pc(1)-pe(1))^2 +(pc(2)-pe(2))^2 + (pc(3)-pe(3))^2 ) ;
%distancekm = distanceAU * AU;
end

