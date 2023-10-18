L=5;
kappa=20;
Ttop=20;
Tbot=90;
Nx=100;
Ny=100;

a=[3,2,20];
h=calcheight(a, Nx, L);

flux= CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
T=flux(2);