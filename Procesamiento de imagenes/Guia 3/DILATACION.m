%dilatacion de la imagen binaria
clc
clear all
close all

I1=imread('guia3.png');
figure,imshow(I1),title('Original Image')

I=imread('Otsu.png');
figure,imshow(I),title('Binarizacion Otsu')

B=[1 0 1  
   0 0 0 
   1 0 1 ];

dil=imdilate(I,B); %Usando la funcion de matlab
figure,imshow(dil),title('Funcion Imdilate Matlab')

F=convolucion2d(I,B);
[H W]=size(I);
for i=1:1:H
    for j=1:1:W
        if F(i,j)==255
            G(i,j)=1;
        end
    end
end

figure,imshow(G),title('Dilatacion por aplicacion de convolucion')


%multiplicacion punto a punto
[H W]=size(I);
for i=1:1:H
    for j=1:1:W
        D(i,j)=I1(i,j).*G(i,j);
    end 
end

D=mediana(D);
figure,imshow(D),title('Multiplicacion punto a punto')

