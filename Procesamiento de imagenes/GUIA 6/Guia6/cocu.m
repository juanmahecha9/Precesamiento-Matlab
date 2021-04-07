clc
clear all
close all
warning off


A=imread('1.1.02.tiff'); % carga de la imagen
I=uint8(A);

figure,imshow(I),title('Original Image');
[m n]=size(I);
%co-occurrence matrix
% 
 glcms = graycomatrix(I);
[x] = haralickTextureFeatures(glcms,1:14);



