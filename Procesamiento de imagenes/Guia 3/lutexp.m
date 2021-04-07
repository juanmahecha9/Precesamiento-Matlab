function Io=lutexp(I)
[H W]=size(I);
%modifico contraste-----
%exp
V=2^256;
x=0:1:(V);
Isalida1=I*0;

Y=30.*(exp(x.*(1/100)));
Lut=[x;Y];
for i=1:1:H
    for j=1:1:W
        [s1, pos]=find(x==I(i,j));
        Isalida1(i,j)=Y(pos);
    end
end
Io=Isalida1;