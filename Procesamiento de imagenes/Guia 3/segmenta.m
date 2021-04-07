clc
clear all
close all


%Imagen a color
I1=imread('hestain.png');
%figure,imshow(I1),title('Imagen original RGB')

%escala de grises
Io=rgb2gray(I1);
%figure,imshow(Io),title('Imagen en escala de grises')

%Ecualizado
I = adapthisteq(Io);

RGB = label2rgb(I);
C = bwconncomp(I);