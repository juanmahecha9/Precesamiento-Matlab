%erosion de la imagen binaria
clc
clear all
close all

%I1=imread('guia3.png');
I1=imread('guia3.png');

%figure(1),imshow(I1),title('Original Image')

I=imread('Otsu.png');
figure,imshow(I),title('Binarizacion Otsu')

B=[  1 0 1
     0 0 0
     1 0 1
    ];

ero=imerode(I,B); %Usando la funcion de matlab
figure,imshow(ero),title('Funcion Imerode Matlab')

K=grayerode(I,B);

figure,imshow(K),title('Funcion creada de erosion');

[H W]=size(I);
for i=1:1:H
    for j=1:1:W
        if I(i,j)==255
            G(i,j)=1;
        end
    end
end

%figure,imshow(G),title('Binarizacion de la erosion')

%multiplicacion punto a punto
[H W]=size(I);
for i=1:1:H
    for j=1:1:W
        D(i,j)=I1(i,j).*G(i,j);
    end 
end

D=mediana(D);
figure,imshow(D),title('Multiplicacion punto a punto')

