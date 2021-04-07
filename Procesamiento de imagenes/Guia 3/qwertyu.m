clc
clear all
close all

I=imread('guia3.png');
[W H]=size(I);
% figure, subplot(1,2,1),imshow(I)
%         subplot(1,2,2),mesh(I)
%         
% L=[1 1 1
%    1 -8 1
%    1 1 1];
% lap=convolucion2d(double(I),L);
% figure, subplot(1,2,1),imshow(lap)
%         subplot(1,2,2),mesh(lap)
%         
% 
% Q=strel('disk',3);
% di=imdilate(lap,Q);
% figure, subplot(1,2,1),imshow(di)
%         subplot(1,2,2),mesh(di)
%         
% M=medfilt2(di);
% figure, subplot(1,2,1),imshow(M)
%         subplot(1,2,2),mesh(M)
% 
% figure, subplot(1,2,1),imshow(G)
%         subplot(1,2,2),mesh(G)
% 
%         
%        

%Sobel
Hy=fspecial('sobel')
figure,imshow(G)

% 
% R=watershed(I);
% R=uint8(R);
% figure,imshow(R)
