L=5;
kappa=20;
Ttop=20;
Tbot=90;
Nx=100;
Ny=100;

%setup the inequality matrix and vectors for fmincon, determine parameters
%a1 and a2
Aineq=zeros(2,3);
bineq=zeros(2,1);
Aineq(1,1)=-1;
Aineq(2,1)=1;
Aineq(1,2)=1;
Aineq(2,2)=1;
bineq(2,1)=5;
bineq(1,1)=-1;



fun = @(a) obj(a,L,Nx,Ny, kappa, Ttop, Tbot);
a0=[2,1,5];
options=optimset('Display','iter','plotfcns','optimplotfirstorderopt');
[a,fval]= fmincon(fun,a0,Aineq,bineq,[],[],[1,-2,0],[5,2,],[],options);

set(gca, 'YScale', 'log');


h=calcheight(a,Nx,L);



%determine the parameter a3
fc=0;
farr=[];
for k=1:20

    hf=calcheight([a(1),a(2),k],Nx,L);
    
    
    fa=CalcFlux(L, hf, Nx, Ny, kappa, Ttop, Tbot);
    
    farr(k)=fa;

    if fa>fc
        h=hf;
        kf=k;
        fc=fa;
    end
   
    wf=k*2*pi/L;
    

end



hold on

flux= CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);

%shows graph of height function
dx=L/Nx;
for i=1:Nx+1
    h(i,2)=dx*(i-1);
end
figure(3);
plot(h(:,2),h(:,1));

%shows graph of flux with relation to a3
figure(4);
plot(1:20,farr);


