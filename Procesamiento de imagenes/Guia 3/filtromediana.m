clc
clear all
close all
%Lectura de la imagen
I=imread('lenag.png');

I1=imread('RuidoG.png');
I2=imread('RuidoS.png');
I3=imread('RuidoSP.png');


%ENCONTRAR LA MEDIANA
S1=mediana(I1);
S2=mediana(I2);
S3=mediana(I3);


figure(1),
imshow(I),title('Imagen Original')
figure(2),
subplot(1,2,1),imshow(I1),title('Imagen Original R.Gaussiano')
subplot(1,2,2),imshow(S1),title('Imagen filtro mediana')
figure(3),
subplot(1,2,1),imshow(I2),title('Imagen Original R.Speckle')
subplot(1,2,2),imshow(S2),title('Imagen filtro mediana')
figure(4),
subplot(1,2,1),imshow(I3),title('Imagen Original R.Sal t Pimienta')
subplot(1,2,2),imshow(S3),title('Imagen filtro mediana')

