
clc
clear all
close all 
tic
%Image load
ImageOriginal = imread('cell.tif');
figure(1), imshow(ImageOriginal), title('original image');

%Propery of the image
property=imfinfo('cell.tif');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits

% Copy of the Original Image
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end

k=12;
% Reduce the original gray Resolution  by factor K= 6 and K=12
Image7=((Image/2^B)*(2^k));
figure,
subplot(1,2,1), imshow(Image), title('Copy to Image');
subplot(1,2,2), imshow(Image7), title('Expand the image gray resolution in 12');

toc

