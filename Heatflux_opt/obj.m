%objective
function [f] = obj(a,L,Nx,Ny, kappa, Ttop, Tbot)

h=calcheight(a,Nx,L);

[flux,T,dTdx,xy] = CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);

f=1/flux;
end