clc
clear all
close all
I=imread('circulo.png');
I1=imread('triangulo.png');

%transformacion punto a punto

Icirculo=imresize(I,[255 255]); %ajuste de tamanho para imagenes
Itriangulo=imresize(I1,[255 255]);
figure,imshow(Icirculo)
% figure,imshow(Itriangulo)

%fusion de matrices (suma de matrices)
% Ifusianada=Icirculo+Itriangulo;
% figure,imshow(Ifusianada)

%agregar ruido a una imagen
%ruido gausiano
% variable = funcion(Imagen,tipo de ruido, Media,Varianza)
% Ir=imnoise(Icirculo,'gaussian',0,0.5);

%ruido sal y pimienta
% variable = funcion(Imagen,tipo de ruido, Fidelidad de la imagen (0 a 1))
Ir=imnoise(Icirculo,'salt & pepper',0.5);
figure,imshow(Ir)


%boundary
% Ib=conv2(I,W)
% Iif=imfilter(I,W)
Ir=rgb2grey(Ir);
Ir=double(I);
H=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9]; %elimina gaussiano
Iconv=conv2(Ir,H)

figure,imshow(Iconv)