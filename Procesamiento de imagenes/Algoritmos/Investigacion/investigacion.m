clc
clear all
close all

%Imagen original
I=imread('97.png');
figure,imshow(I),title('Imagen Original');

%Filtro de la imagen
If=medfilt2(I,[7 7]);
figure,imshow(I),title('Imagen Filtrada');

%Sobel
Is=dectsobel(If);
figure,imshow(Is),title('sobel');

%Erosion
s=strel('square',6);
ero=imclose(Is,s);
figure,imshow(ero),title('Erosion');

%Binarizacion
A=graythresh(ero);
Ib=im2bw(ero,A);
figure,imshow(Ib),title('Binarizacion');

%Multiplicacion punto a punto
Ib=double(Ib);
I=double(I);
Im=I.*Ib;
Im=uint8(Im);
figure,imshow(Im),title('Complemento de la imagen')

%Segmentacion
Ic=not(Ib);
I2=bwlabel(Ib,4);
N=max(max(I2));

Ip=medfilt2(I2,[20 20]);
figure,imshow(Ip),title('Filtro')
imwrite(Ip,'F.png');


[A1 A2 A3 A4]=dwt2(I,'bior3.7');

