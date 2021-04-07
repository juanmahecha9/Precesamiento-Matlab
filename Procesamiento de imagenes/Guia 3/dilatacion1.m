clc 
close all
clear all
I=imread('hestain.png');
IG=rgb2gray(I);
Id=double(IG);
[col,fil]=size(Id);

%%metodo de otsu distribucion de la probabilidad
for i=1:256;
    Dp(i)=0;
end
for i=1:col*fil
    Dp(Id(i)+1)=Dp(Id(i)+1)+1;
end
Dp=Dp/(col*fil);

for i=1:256
    o(i)=0;
end
o(1)=Dp(1);
for i=1:256
    m(i)=0;
end
for i=2:256
    o(i)=o(i-1)+Dp(i);
    m(i)=m(i-1)+(i-1)*Dp(i);
end

sB2m=0;
sB2=0;
mut=m(256);
uO=0;

for t=1:256
    o1=o(t);
    o2=1-o1;
    if o1~=0 & o2~=0
        m1=m(t)/o1;
        m2=(mut-m(t))/o2;
        
        sB2=o1*(m1-mut)^2+o2*(m2-mut)^2;
        if sB2>sB2m
            sB2m=sB2;
            uO=t-1;
        end
    end
end

imf= Id>uO;

%%imagen dilatada
[n,m]=size(imf);
dilatada=zeros(size(imf));
for i=2:n-1
for j=2:m-1
 dilatada(i,j)=imf(i,j);
 if (imf(i,j)==0 & (imf(i,j-1)==1 | imf(i-1,j)==1 || imf(i,j+1)==1 | imf(i+1,j)==1))
 dilatada(i,j)=1;
 end
end 
end
figure(1);subplot(1,2,1),imshow(imf), title ('OTSU methoda');
figure(1);subplot(1,2,2),imshow(dilatada), title ('dilate operation OTSU');
