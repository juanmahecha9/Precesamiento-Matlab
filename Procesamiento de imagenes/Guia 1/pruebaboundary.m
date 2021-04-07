clear all;  
close all; 
clc;
%%

I=imread('Lena.png');
I=rgb2gray(I);
figure,imshow(I)   

   w=size(I,1);     
   h=size(I,2);  

%%

ImageB=double(I);
for i=2:2:h-1
    for j=2:2:w-1
       %Promedio
        ImageC(i/2,j/2)=(ImageB(i-1,j-1)+ImageB(i-1,j)+ ImageB(i-1,j+1)+ImageB(i,j-1)+ImageB(i,j)+ImageB(i,j+1)+ImageB(i+1,j-1)+ImageB(i+1,j))/8;
        ImageC=uint8(ImageC);
   end
end