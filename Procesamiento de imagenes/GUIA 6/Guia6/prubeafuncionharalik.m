clear all
clc
close all
warning off


I=imread('coins.png'); % carga de la imagen
% I=rgb2gray(I);

[ F ] = haralick( I );