function [  ] = plot_ellipse( kk, rstart, rrend )

        for pp=1:20
            e = (rrend - rstart)/(rrend + rstart);
            a = (rstart+rrend)/2;
            b = ((1 - e^2)*a^2)^.5;

%             angle = acos(a*(1-e^2)/rrend -1);
%             v = (1.3*10^20*(2/rrend - 1/a))^.5;

            %plot( a.* cos(kk)+(a-rstart),  b.* sin(kk),'b');   
            plot( a.* cos(kk)*cos(rstart) - b*sin(kk)*sin(rstart)  + cos(rstart)*(a-rstart) , ... %
                  a.* cos(kk)*sin(rstart) + b.*sin(kk)*cos(rstart) + sin(rstart)*(a-rstart),'b');   

          
            rrend = rrend + 10^11;            
        end

end

