clc
close all
clear all

I(1:50,1:50)=0;
I(1:50,20:30,1)=210;
I(1:50,24:30,2)=105;
I(1:50,24:30,3)=30;

I=uint8(I);

imshow(I);