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

%Binarize according to the histogram
%1. Histogram
histImage=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H/2% limit on the reduced matrix in factor 2
    for j=1:1:W/2
        %niveles de gris
        %nivelgris= Image(i,i);
        histImage(ImageC(i,j))=histImage(ImageC(i,j))+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
    end
end
figure(3),
subplot(1,2,1),imhist(ImageC),title('Used a function'),ylabel('Frecuency')
subplot(1,2,2),stem(histImage),title('Algorithm'),ylabel('Frecuency')
Y=max(histImage);
%encontar punto maximo.
for i=1:1:H
    if histImage(i) == Y
        pos=i;    
    end
end
%2.Binarizacion
for i=1:1:W; 
    for j=1:1:H
        if((Image(i,j))>pos); % apartir del histograma
            Is(i,j)=255;
        else
            Is(i,j)=0;
        end
    end
end
figure(4), imshow(Is),title('BINARIZED IMAGE');
toc