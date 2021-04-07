%High pass Filter basic
clc
clear all
close all
I=imread('lenag.png'); %Imagen original
figure,imshow(I),title('Imagen Original')
%Filtro Highboost
I1=highboost(I);
figure,imshow(I1),title('Filtro Highboost')
%M=[-1 -1 -1;2 2 2;-1 1 1]; %mascara HIGHBOOST
%Filtro paso alto basico
I2=pasoaltob(I);
figure,imshow(I2),title('Filtro paso alto basico')