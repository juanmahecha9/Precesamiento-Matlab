clc
clear all
close all

% I1=imread('97.png');
% figure(1),imshow(I1),title('Imagene original RGB')
% 
% Io=rgb2gray(I1); %Plano 1 de la imagen
% Io=medfilt2(Io,[7,7]);
% imwrite(Io,'guia3.png') %Guardar plano 1

I=imread('97.png');
figure(2),imshow(I),title('Imagen en escala de grises')

A=graythresh(I); %Umbral
bw=im2bw(I,A); %Binarizacion
figure(3),imshow(~bw),title('Binarizacion y Otsu con funciones de matlab')

figure(4),
L=otsu(I);
K=Binarizacion(I,L);
imshow(K),title('Binarizacion con otsu ')

figure(5),
s=double(K);
z=medfilt2(s,[7,7]);
imshow(z),title('Binarizacion con otsu filtrada')
imwrite(z,'Otsu.png');

