%Programado por: Yelinna Pulliti Carrasco
%en lo posible sin usar funciones de Matlab (asi es mas facil pasarlo a
%otros lenguajes)
%este programa aplica el filtrado de mediana, media y 
% el resaltado de bordes
% adem�s de la ecualizaci�n del histograma (realizado por la funci�n
% "ecuhistogram")
% la funci�n "bordes" realiza la convolici�n
%http://toyscaos.tripod.com/eam.html
clc
clear all
close all

A=imread('mamografia.png');

x=ecuhistogram(A);

