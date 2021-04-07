clc
clear all
close all
warning off
%%
%http://murphylab.web.cmu.edu/publications/boland/boland_node26.html#eqn:cho_g
%http://www.uio.no/studier/emner/matnat/ifi/INF4300/h08/undervisningsmateriale/glcm.pdf
%http://earlglynn.github.io/RNotes/package/EBImage/Haralick-Textural-Features.html
%%

A=imread('textura4.png'); % carga de la imagen
I=uint8(A);
I=rgb2gray(I);

% figure,imshow(I),title('Original Image');
[m n]=size(I);%Size of the image
%%
%matrix of CO-Relation
CC1= graycomatrix(I);
NormalCC=sum(sum(CC1));
CC = CC1./NormalCC;
DD=CC;
[m1 n1]=size(CC);
sizecoOcMat = size(CC);
[col,row] = meshgrid(1:sizecoOcMat(1),1:sizecoOcMat(2));
%%
%Vector of Haralik
Haralick=zeros(14,1);


hi=zeros(1,2^8);
for i=1:m
    for j=1:n
        k=I(i,j);
              hi(k+1)=hi(k+1)+1;
           end;        
      end;
F=hi./(m*n);% funcion de probabilidad
F1=sum(F);



