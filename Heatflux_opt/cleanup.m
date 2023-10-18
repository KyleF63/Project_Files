%This is for general cleanup and testing

L=5;
kappa=20;
Ttop=20;
Tbot=90;
Nx0=500;
Ny0=500;

a=[3,2,20];
h=calcheight(a, Nx0, L);

flux= CalcFlux(L, h, Nx0, Ny0, kappa, Ttop, Tbot);

fluxarr=[];
for j=1:10
   Nx=j*Nx0;
   Ny=j*Nx0;
   h=calcheight(a, Nx, L);
   fluxarr(j)=CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
end

%shows plot of flux with relation to Nx/Ny
figure(5);
plot(1:10,fluxarr);

dx=L/Nx0;
for i=1:Nx0+1
    h(i,2)=dx*(i-1);
end

%shows graph of height
figure(3);
plot(h(:,2),h(:,1));


