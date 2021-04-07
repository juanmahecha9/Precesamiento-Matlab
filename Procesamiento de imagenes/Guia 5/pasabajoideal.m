clc;
clear all;
close all;



A=imread('magao.png');
A=rgb2gray(A);
A=double(A);
[f,c]=size(A); 

%transformada de Fourier
F = fft2(A);
Vq=F;
%Centering the FFT
b=fftshift(Vq);

%Magnitude from FFT
mag=abs(b);


%dinamical range modification 0-255
%max vulue of the fft
maxmag=max(max(mag));
%minimum value
minmag=min(min(mag));
%zero adjust
mag=mag-minmag;
% Dynamical range limitation
c=255/log(maxmag-minmag);
new_mag=c.*log(1+mag);
U=uint8(new_mag);


%filtro ideal pasabajos
D0=f/2/15;
PasabajosIdeal=zeros(f,c);
for i=1:f
 for j=1:c
 D=sqrt((i-f/2)^2+(j-c/2)^2);% Determino la distancia al centro del
 % punto (i,j)
 if D<D0
 PasabajosIdeal(i,j)=1;
 end
 end
end

%multiplicacion punto a punto
AF=abs((PasabajosIdeal.*F));

figure,
subplot(131),imshow(uint8(A)),title('Original image')
subplot(132),imshow('new_mag'),title('FFT2')
subplot(131),imshow(uint8(AF)),title('filtro')