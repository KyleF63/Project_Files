%optimization
% conditions
E= 70000000000;
L=7.5;
m=500;
Nelem=20;
uts=600000000;
p=1600;

%force at each node
force=forcev(L,m,Nelem);

%Aineq for fmincon to get rin-rout<=-0.0025
A=zeros(Nelem+1,2*(Nelem+1));
for i=1:Nelem+1
    A(i,i)=1;
    A(i,Nelem+1+i)=-1;
end
%set r0 where inner radius is 0.03 and outer is 0.04
r0=[];
for i=1:(Nelem+1)
    r0(i)=0.03;
end

for i=1:Nelem +1
    r0(Nelem+1+i)=0.04;
end

b=[];
for i=1:(Nelem+1)
    b(i)=-0.0025;
end



fun = @(r) obj(r,Nelem,L,E,force);

%sets the upper and lower bounds of radii
ub=[];
for i=1:(Nelem+1)
    ub(i)=0.0475;
end

for i=1:Nelem +1
    ub(Nelem+1+i)=0.05;
end

lb=[];
for i=1:(Nelem+1)
    lb(i)=0.01;
end

for i=1:Nelem +1
    lb(Nelem+1+i)=0.0125;
end



options=optimset('Display','iter','plotfcns','optimplotfirstorderopt');

%the stress constraint
nonlcon=@(r) stresscon(r, L, E, Nelem, force, uts);

%fmincon
[r,fval]= fmincon(fun,r0,A,b,[],[],lb,ub,nonlcon,options);

hold on

figure(1);

%calculate I, zmax, u, and sigma for personal testing, does not affect
%optimization
I=calcI(r,Nelem);

zmax=transpose(r(Nelem+2:2*(Nelem+1)));

u = CalcBeamDisplacement(L, E, I, force, Nelem);
sigma=CalcBeamStress(L, E, zmax, u, Nelem);

figure(2);
% plot the vertical displacement
x = [0:L/Nelem:L];
plot(x,u(1:2:2*(Nelem+1)),'ks-'); 
xlabel('distance along wing')
ylabel('vertical displacement of spar')

% plot the stresses
figure(3);

[sigma] = CalcBeamStress(L, E, zmax, u, Nelem);
plot(x,sigma,'ks-')
xlabel('distance along wing')
ylabel('magnitude of normal stress')

%calculates the total weight
weight= 2*fval*p;

figure(4);
%plots the radii to give an idea of the shape
plot(x,r(1:Nelem+1),x,r(Nelem+2:2*(Nelem+1)),x,0)