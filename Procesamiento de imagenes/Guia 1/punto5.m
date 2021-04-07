clc
clear all
close all 
tic
%Image load
ImageOriginal = imread('rice.png');
ImageB=zeros(257,257);

%Propery of the image
property=imfinfo('rice.png');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits

% Copy of the Original Image
%recorrido punto a punto
for i=1:1:H
    
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end
figure(1), imshow(Image), title('Copy of original image');

%boundary
for i=1:1:H
    for j=1:1:W
        ImageB(i,j)=Image(i,j);
    end
end
% Para realizar la operacion
ImageB=double(ImageB);
for i=2:2:256
    for j=2:2:256
       %Promedio
        ImageC(i/2,j/2)=(ImageB(i-1,j-1)+ImageB(i-1,j)+ ImageB(i-1,j+1)+ImageB(i,j-1)+ImageB(i,j)+ImageB(i,j+1)+ImageB(i+1,j-1)+ImageB(i+1,j))/8;
        ImageC=uint8(ImageC);
   end
end
figure(2), imshow(ImageC), title('BOUNDARY WINDOW WITH FACTOR REDUCE 2');

toc