clc
clear all
close all

I=imread('rice.png');
figure,imshow(I)

A=graythresh(I); %Umbral
bw=im2bw(I,A); %Binarizacion
figure,imshow(bw),title('Binarizacion y Otsu con funciones de matlab')

q=mdilate(bw);