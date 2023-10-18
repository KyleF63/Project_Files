%objective function
function [f]=obj(r,Nelem,L,E,force)
%set up Volume of shape from outer radius 
Vout=0;
for i = 1:Nelem
    
    %divide each section into 50 subsections
    %dV=pi*routx^2*dx is the volume of each subsection, 
    
    for j= 1:50

        x=L*j/(Nelem*50);
        dx=L/(Nelem*50);
        %the slope of each section to find r at each subsection node
        slope=((r(i+1+Nelem+1)-r(i+1+Nelem))/(L/Nelem));
        %r at each subsection node
        routx=slope*x+r(i+1+Nelem);

        %routxsq=slope^2*x^2+2*slope*x*r(i+1+Nelem)+(r(i+1+Nelem))^2;
        %experimental code 

        Vout=Vout+pi*routx^2*dx;

        %Vout=Vout+pi*(1/3*slope^2*x^3+slope*x^2*r(i+1+Nelem)+x*(r(i+1+Nelem))^2);
        %experimental code
    end
end

%similar to Vout
Vin=0;
for i = 1:Nelem
    %dV=pi*rinx^2*dx
    for j= 1:50

        x=L*j/(Nelem*50);
        dx=L/(Nelem*50);
        slope=((r(i+1)-r(i))/(L/Nelem));
        rinx=slope*x+r(i);
        %rinxsq=slope^2*x^2+2*slope*x*r(i)+(r(i))^2;
        Vin=Vin+pi*rinx^2*dx;
        %Vin=Vin+pi*(1/3*slope^2*x^3+slope*x^2*r(i)+x*(r(i))^2);
    end
end


%gives the volume of each half of the spar
f=Vout-Vin;
