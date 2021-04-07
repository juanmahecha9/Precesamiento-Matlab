clc
clear all
close all
I=imread('cameraman.tif');
figure,imshow(I);
figure,imhist(I);
figure,imhist(I-40);

%segmentar (Mascara)
figure,imshow(I<75)
