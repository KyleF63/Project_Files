function [f , dfdx2 ] = dfunc ( x1 , x2 )
 v1 = x1 .^2;
 dv1dx2 = 0 ;
 v2 = x2 .* sin ( v1 ) ;
 dv2dx2 = sin(v1)+ x2.*cos(v1)*dv1dx2;
 f = v1 + v2 ;
 dfdx2 = dv1dx2 + dv2dx2 ;
end