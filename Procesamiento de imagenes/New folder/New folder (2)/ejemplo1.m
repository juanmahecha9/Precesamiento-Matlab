%Programado por: Yelinna Pulliti Carrasco
%en lo posible sin usar funciones de Matlab (asi es mas facil pasarlo a
%otros lenguajes)
%este programa aplica el filtrado de mediana, media y 
% el resaltado de bordes
% además de la ecualización del histograma (realizado por la función
% "ecuhistogram")
% la función "bordes" realiza la convolición
%http://toyscaos.tripod.com/eam.html
clc
clear all
close all

A=imread('mamografia.png');

x=ecuhistogram(A);

