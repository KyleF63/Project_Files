%storage of force on each node
function [q]=forcev(L, m, Nelem)
q=[];

dx=L/Nelem;


q0=2.5*9.8*m/L;

for i =1:Nelem+1
    x=(i-1)*dx;
    q(i,1)=q0-q0*x/L;
end




