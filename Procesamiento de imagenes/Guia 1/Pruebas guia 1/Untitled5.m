clc
clear all
close all 

%Image load
ImageOriginal = imread('cell.tif');
figure(1), imshow(ImageOriginal), title('original image');

%Propery of the image
property=imfinfo('cell.tif');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits
ImageOriginal=rgb2gray(ImageOriginal);
% Copy of the Original Image
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end

K=2;

i=1:1:H; % Heigth
 j=1:1:W; % Width
 p=0:1:K-1;
 y=0:1:K-1;
              Image4((i*K)-y,(j*K)-p)=Image(i,j); %matriz simetrica
    
