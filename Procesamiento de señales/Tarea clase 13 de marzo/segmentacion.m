clc
clear all
close all

Ie=imread('lena.png');
I=rgb2gray(Ie);
figure(1),imshow(I)

[H W]=size(I);

histImage=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H% limit on the reduced matrix in factor 2
    for j=1:1:W
        %niveles de gris
        %nivelgris= Image(i,i);
        histImage(I(i,j))=histImage(I(i,j))+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
    end
end
figure(2),
subplot(1,2,1),imhist(I),title('Used a function'),ylabel('Frecuency')
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
        if((I(i,j))>70); % apartir del histograma
            Is(i,j)=255;
        else
            Is(i,j)=0;
        end
    end
end
figure(3), imshow(Is),title('BINARIZED IMAGE');