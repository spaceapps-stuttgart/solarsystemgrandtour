clear all;

% data of the planets, from sun outwards
r_position= [58 108 150 228 779 1432 2884 4509 5966]* 10^9; %  [meter]
goaroundtime = [7.6 19.4 31.6 59.4 374.6 935 2672 5223 7817]* 10^6; %  [second]
phi = [280 180 210 180 45 210 0 330 280]/180*pi; % on the 21th April 2012 [rad]

omega = 2*pi./goaroundtime; % in [1/s]

[n m] = size(phi);

%% 
% plot the positions of the planets and the sun
plot(r_position.*cos(phi),r_position.*sin(phi),'.b',0,0,'+r');
    
hold on;

% to plot some circles around the planets
angle = 0:.01:2*pi+.1;
xy = [cos(angle)' sin(angle)'];

for k=1:m
   
    plot(r_position(k)*xy(:,1),r_position(k)*xy(:,2));
    
end

axis equal

for k=1:10:200
    
    plot(r_position.*cos(phi + omega*k),r_position.*sin(phi + omega*k),'+b');
    
    pause(.1);
    
end

%%

%plot some ellipses around a starting planet

planet_start = 3;
planet_end = 5;

plot(0,0,'+r');
hold on;

plot(r_position(planet_start).*cos(phi(planet_start)),r_position(planet_start).*sin(phi(planet_start)),'.b');
plot(r_position(planet_end).*cos(phi(planet_end)),r_position(planet_end).*sin(phi(planet_end)),'.b');
plot(r_position(7).*cos(phi(7)),r_position(7).*sin(phi(7)),'.b');

estart = (r_position(planet_end) - r_position(planet_start))/(r_position(planet_end) + r_position(planet_start));
    
 
    kk=0:.1:2*pi+.1;
    
%     r = r_position(planet_start)./(1-k).*(1-k^2)./(1 + k.*cos(kk));
    a = (r_position(planet_start)+r_position(planet_end))/2;
    %e = r_position(planet_start);
    %b = ((1 - estart^2)*a^2)^.5;
    
    rend = r_position(planet_end);
    
    mu = 1;
    
    for p=1:20
        
          %plot_ellipse(kk, r_position(planet_start),r_position(planet_end));
        
        e = (rend - r_position(planet_start))/(rend + r_position(planet_start));
        a = (r_position(planet_start)+rend)/2;
        b = ((1 - e^2)*a^2)^.5;
        
        angle = acos(a*(1-e^2)/r_position(planet_end) -1)
        v = (1.3*10^20*(2/r_position(planet_end) - 1/a))^.5
        
        
        
        plot( a.* cos(kk)*cos(phi(planet_start)) - b*sin(kk)*sin(phi(planet_start))  - cos(phi(planet_start))*(a-r_position(planet_start)) , ... %
              a.* cos(kk)*sin(phi(planet_start)) + b.*sin(kk)*cos(phi(planet_start)) - sin(phi(planet_start))*(a-r_position(planet_start)),'b');   
        rend = rend + 10^11;
        

        plot_ellipse(kk, r_position(planet_end), r_position(7));
        
    end
    


angle = 0:.01:2*pi+.1;
xy = [cos(angle)' sin(angle)'];

for k=3:2:7
   
    plot(r_position(k)*xy(:,1),r_position(k)*xy(:,2),'r');
    
end

axis equal

