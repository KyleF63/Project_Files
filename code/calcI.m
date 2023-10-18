%funtion to calculate the moment of area

function Iyy= calcI(r, Nelem)
%takes in r and gives the I at each node
Iyy=[];
for i=1:(1+Nelem)
    Iyy(i,1)= pi/4*(r(i+1+Nelem)^4-r(i)^4);
    if Iyy(i,1)<0
        Iyy(i,1)=-Iyy(i,1);
    end

end
   