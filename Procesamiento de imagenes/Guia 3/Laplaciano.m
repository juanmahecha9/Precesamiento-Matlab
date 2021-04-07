%mascaras laplacianas
%Aplicar los operadores laplacianos sobre las imágenes de las pruebas y mostrar sus resultados.

clc
clear all
close all
I=imread('lenag.png'); %Imagen original
I1=imread('RuidoG.png'); %Imagen Ruido Gaussiano
I2=imread('RuidoS.png'); %Imagen Ruido Speckle
I3=imread('RuidoSP.png');%Imagen Ruido Sal y pimienta

%Mascaras Laplacianas
M1=[0 -1 0;
    -1 4 -1
    0 -1 0];

M2=[-1 -1 -1
    -1 8 -1
    -1 -1 -1];

M3=[-1 2 -1
    2 -4 2
    -1 2 -1];

%Filtrado

F1=convolucion2d(I,M2);
F2=convolucion2d(I1,M2);
F3=convolucion2d(I2,M2);
F4=convolucion2d(I3,M2);

G1=F1;
G2=F2;
G3=F3;
G4=F4;

figure,
subplot(1,2,1),imshow(I),title('Imagen Original')
subplot(1,2,2),imshow(G1),title('Imagen Original Filtro laplaciano')

figure,
subplot(1,2,1),imshow(I1),title('Imagen Ruido Gausiano')
subplot(1,2,2),imshow(G2),title('Imagen Gaussiano Filtro laplaciano')

figure,
subplot(1,2,1),imshow(I2),title('Imagen Ruido Speckle')
subplot(1,2,2),imshow(G3),title('Imagen Speckle Filtro laplaciano')

figure,
subplot(1,2,1),imshow(I3),title('Imagen Ruido sal y pimienta')
subplot(1,2,2),imshow(G4),title('Imagen Sal y pimienta Filtro laplaciano')
