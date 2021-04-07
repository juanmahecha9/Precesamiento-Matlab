clc
clear all
close all
% 
% C=imread('fft2.png');
% C=rgb2gray(C);

I=imread('magao.png');
I=rgb2gray(I);
figure,imshow(I);

%Crear objeto
[f,c]=size(I);
C=f/1/3;
PasabajosIdeal=zeros(f,c);
for i=1:f 
    for j=1:c
 D=sqrt((i-f/2)^2+(j-c/2)^2);% Se determina la distancia al centro del
 % punto (i,j)
 if D<C
 PasabajosIdeal(i,j)=255;
end
 end
end



%%filtro paso alto
A=graythresh(C); %Umbral
bw=im2bw(C,A); %Binarizacion
bw=double(bw);
figure,imshow(bw);

F=fft2(I);
F1=fftshift(F);
X=abs(F1);


t=atan(imag(F1)./real(F1));

TC=bw.*t;
figure,imshow(1+log(TC)),title('circulo theta')

AXC=bw.*X;
figure,imshow(1+log(AXC)),title('abs X circulo')

XC=bw.*F1;
figure,imshow(XC);

IR=ifft2(XC);
figure,imshow(abs(IR),[]),title('IFFT');

%%filtro paso bajo
A1=graythresh(C); %Umbral
bw1=im2bw(C,A); %Binarizacion
bw1=double(~bw);
figure,imshow(bw1);

F1=fft2(I);
F11=fftshift(F1);
X1=abs(F11);


t1=atan(imag(F11)./real(F11));

TC1=bw1.*t1;
figure,imshow(1+log(TC1)),title('circulo theta')

AXC1=bw1.*X1;
figure,imshow(1+log(AXC1)),title('abs X circulo')

XC1=bw1.*F11;
figure,imshow(XC1);

IR1=ifft2(XC1);
figure,imshow(abs(IR1),[]),title('IFFT');

