clc
clear all
close all
% Imagen ejemplo liftingbody.png
%Punto 2 Generacion de ruido con la funcion imnoise
I=imread('lenag.png');


%Ruido Gaussiano
IRG = imnoise(I,'gaussian',0,0.05);
%Ruido Sal y pimienta
IRSP=imnoise(I,'salt & pepper',0.05);
%ruido Moteado
IRS=imnoise(I,'speckle',0.05);

figure,
subplot(1,4,1),imshow(I),title('Imagen original')
subplot(1,4,2),imshow(IRG),title('Ruido Gaussiano')
subplot(1,4,3),imshow(IRSP),title('Ruido Sal y pimienta')
subplot(1,4,4),imshow(IRS),title('Ruido Speckle')


%Guardar imagenes
imwrite(IRG,'RuidoG.png');
imwrite(IRSP,'RuidoSP.png');
imwrite(IRS,'RuidoS.png');