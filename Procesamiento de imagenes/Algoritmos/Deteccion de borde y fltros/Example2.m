clc
clear all
close all

I=imread('cameraman.tif');
figure,imshow(I);
info=imfinfo('cameraman.tif');
H=info.Height;
W=info.Width;
bit=info.BitDepth;

x=0:1:255;
x=x;
m=1;
b=(-2).^bit;
Is=I*0;

Y=1000.*exp(-x*(1/300));
figure,plot(Y)
Lut=[x:Y];


for i=1:1:W
    for j=1:1:H
        [s pos]=find(x==I(i,j));
        Is(i,j)=Y(pos);
    end
end

figure,imshow(Is)