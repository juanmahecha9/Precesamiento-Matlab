
%mascara gaussiana
clc
clear all
close all
I=imread('lenag.png'); %Imagen original
figure,imshow(I),title('Imagen Original')
I1=imread('RuidoG.png');
I2=imread('RuidoS.png');
I3=imread('RuidoSP.png');
%Filtro gaussiano
M=1/16.*[1 2 1;2 4 2; 1 2 1];

S1=convolucion2d(I1,M);
S2=convolucion2d(I2,M);
S3=convolucion2d(I3,M);

figure,
subplot(1,2,1),imshow(I1),title('Ruido Gaussiano')
subplot(1,2,2),imshow(S1),title('filtro en Imagen ruido Gaussiano')

figure,
subplot(1,2,1),imshow(I2),title('Ruido Speackle')
subplot(1,2,2),imshow(S2),title('filtro en Imagen ruido Speckle')

figure,
subplot(1,2,1),imshow(I2),title('Ruido Sal y pimienta')
subplot(1,2,2),imshow(S2),title('filtro en Imagen ruido Sal y pimienta')
