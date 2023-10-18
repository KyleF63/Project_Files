%height
function [h] = calcheight(a,Nx,L)
% a is an array of initial height, amplitude and frequency of sin function
h=[];


    dx=L/Nx;
    for i=1:Nx+1
        x=(i-1)*dx;
        h(i,1)=a(1)+a(2)*sin(2*pi*a(3)*x/L);
    end

    
