clear all;  
close all; 
clc;
%%

I=imread('coins.png');

figure,imshow(I) 

BP_Im = LBP(I, 8);
figure,imshow(BP_Im,[]) 

figure,plot(imhist(BP_Im))
