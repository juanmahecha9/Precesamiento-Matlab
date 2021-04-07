clc
clear all
close all
% figure,imshow(I),title('Original Image');
I=imread('normal (2).png');
[m n]=size(I);

CC1= graycomatrix(I);
NormalCC=sum(sum(CC1));
CC = CC1./NormalCC;
DD=CC;
[m1 n1]=size(CC);
Lim=(2*m1);
sizecoOcMat = size(CC);

ASM=0; %acumulator
I=double(I);
for i=1:1:m1
    for j=1:1:n1
        ASM=((CC(i,j).^2)+ASM);
    end
end
www=ASM;