clc
clear all
close all
warning off

%http://murphylab.web.cmu.edu/publications/boland/boland_node26.html#eqn:cho_g
%http://www.uio.no/studier/emner/matnat/ifi/INF4300/h08/undervisningsmateriale/glcm.pdf
%http://earlglynn.github.io/RNotes/package/EBImage/Haralick-Textural-Features.html


A=imread('textura2.png'); % carga de la imagen
I=uint8(A);
I=rgb2gray(I);

% figure,imshow(I),title('Original Image');
[m n]=size(I);%Size of the image

%matrix of CO-Relation
CC1= graycomatrix(I);
NormalCC=sum(sum(CC1));
CC = CC1./NormalCC;
DD=CC;
[m1 n1]=size(CC);
sizecoOcMat = size(CC);
[col,row] = meshgrid(1:sizecoOcMat(1),1:sizecoOcMat(2));


CCT=CC';

miux=mean(mean(CC));
miuy=mean(mean(CCT));

stdx=std(std(CC));
stdy=std(std(CCT));

CORR1=0;
for i=1:1:m1
    for j=1:1:n1
       IJ=i*j;
       CORR1=((((IJ)*DD(i,j))-(miux*miuy)))/(stdx*stdy);
    end
end
CORR=CORR1;
Haralick(3)=CORR;
