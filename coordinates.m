
function r = point(ecc,semimajor,peri,meanmotion,now,time,incl,node)


 e=ecc ;
 a=semimajor;
 n = meanmotion;

 PP=a*a*a ;
 P=sqrt(PP);
 t=now ;
 timep = peri/n ;
 L=time -timep ;

 w = peri + node;
 M=0;
 while (L >= t)
L = L - P;
M = 2*pi*(abs(mod((t-L),P)))/P ;
end

  
 %E = 1/(1-e)*M - (e/(1-e)^4)*(M^3/(3*2)) + (9*e^2 + e)/((1-e)^7)*(M^5/(5*4*3*2));
 
  K=pi/180.0;
 maxIter=200;
 i=0;
 delta=1*10^(-10);
E=0;
F=0;
m=M;
ec=e;
%// m=2.0*pi*(m-floor(m));
if (ec<0.8) 
    E=m; 
else
    E=180.0;
end
F = E - ec*sin(m) - m;
while ((abs(F)>delta) && (i<maxIter)) 
E = E - F/(1.0-ec*cos(E));
F = E - ec*sin(E) - m;
i = i + 1;
end

 
 phi=(2*atan(sqrt((1 + e)/(1 - e))*tan(0.5*E)));
 r=a*(1-e*e)/(1+e*cos(phi));

 xec = r*(cos(node)*cos(w+phi) - sin(node)*sin(w+phi)*cos(incl));
 yec = r*(sin(node)*cos(w+phi) +cos(node)*sin(w+phi)*cos(incl));
 zec = r*sin(w+phi)*sin(incl);
 r = [xec,yec,zec];
end

% 
% function dis = distance(ecc,semimajor,peri,meanmotion,now,time,incl,node)
% %Earth data
% e1=0.01671022;
% a1=1.00000011;
% peri1=102.94719*pi/180;
% n1=1*pi/180;
% time1=2451545.0;
% incl1=0.00005;
% node1= -11.26064*pi/180;
% AU = 149597871; %km;
% % 
% % Semimajor axis (AU)                  1.00000011  
% % Orbital eccentricity                 0.01671022   
% % Orbital inclination (deg)            0.00005  
% % Longitude of ascending node (deg)  -11.26064  
% % Longitude of perihelion (deg)      102.94719  
% % Mean Longitude (deg)               100.46435
% pc = coordinates(ecc,a,peri,n,now,time,incl,node);
% pe = coordinates(e1,a1,peri1,n1,now,time1,incl1,node1);
% distanceAU = sqrt((pc(1)-pe(1))^2 +(pc(2)-pe(2))^2 + (pc(3)-pe(3))^2 ) ;
% distancekm = distanceAU * AU;
% end
%  
 
 

