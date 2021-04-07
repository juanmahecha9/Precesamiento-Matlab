clc
clear all
close all

I=imread('pout.tif');
figure,imshow(I),title('Original')
figure,imhist(I)
%Manipulacion del Histrogrma
Ih=I-72;
figure,imshow(Ih),title('Corrida a la derecha')
figure,imhist(Ih),('mejora del Histograma')

%histeq imagen original
I1= histeq(I); %distribuye cualquier distribucion y lo ajusta de 0 a 2^bit de la imagen
figure, imshow(I1)
figure, imhist(I1)

%histeq imagen desplazada del histograma
I2= histeq(Ih);
figure, imshow(I2)
figure, imhist(I2)
