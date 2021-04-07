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

% %Mirror
 %IE=ImageC(end:1:1,end:-1:1); %Busca el final en las filas y columnas y plotea en forma inversa a la imagen

 for i=1:1:H
    for j=1:1:W
        IE(i,H-j+1)=Image(i,j); %reflexion sobre la horizontal
    end
end
 figure(5),
 subplot(1,2,1),imshow(Image),title('Original Image');
 subplot(1,2,2),imshow(IE),title('Mirror');
toc