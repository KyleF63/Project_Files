%nonlincon for fmincon
%stores the stress in sigma then outputs c(i) to represent
%sigma(i)/uts-1<=0
function [c,ceq]= stresscon(r, L, E, Nelem, force, uts)

Iyy=calcI(r, Nelem);

zmax=transpose(r(Nelem+2:2*(Nelem+1)));



u = CalcBeamDisplacement(L, E, Iyy, force, Nelem);
sigma=CalcBeamStress(L, E, zmax, u, Nelem);

for i=1:Nelem+1

    c(i)=sigma(i)/uts-1;
end
ceq=[];