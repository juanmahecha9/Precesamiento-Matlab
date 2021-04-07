clc
clear all
close all

%Coordenadas del foco (a,b)
a=150;
b=150;
%Construcción imagen MxN
M=300; N=300;
for x=1:M;
 for y=1:N;
I(x,y)=(255-sqrt((x-a)^2+(y-b)^2));
 end
end
I=uint8(I);
L=graythresh(I)
C=im2bw(I,L);

figure, imshow(C)
