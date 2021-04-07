close all
clear all
clc

IM=imread('97.png');
U=IM;
Y=imread('F.png');
co=colormap('jet');

%imshow(IM);
%Elemento Estructurante
B=[0 1 0;1 1 1;0 1 0];
%Dilatación
IM2=imdilate(IM,B);
%Borde
BORDE=double(IM2)-double(IM);
%subplot(2,2,2);imshow(BORDE);
%Dilatación
IM2=imdilate(IM2,B);
%Borde
BORDE=double(IM2)-double(IM);
%subplot(2,2,3);imshow(BORDE);
%Dilatación
IM2=imdilate(IM2,B);
%Borde
BORDE=double(IM2)-double(IM);
%subplot(2,2,4);imshow(BORDE);


figure(1),
IM=double(IM);
IM2=double(IM2);
BORDE=double(BORDE);
Re=BORDE-IM;
b=[1 0 1
   1 0 1
   1 0 1];
resul=imdilate(Re,b);
R1=medfilt2(resul,[1 3]);
R2=imerode(R1,b);
subplot(1,2,1),imshow(U);
subplot(1,2,2),imshow(R2,co);
