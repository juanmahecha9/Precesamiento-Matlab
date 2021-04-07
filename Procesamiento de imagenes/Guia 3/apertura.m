%apertura de la imagen binaria
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

% ero=imerode(I,B); %Usando la funcion de matlab
% figure,imshow(ero),title('Funcion Imerode Matlab')
%DILATACION DE LA EROSION ES APERTURA
w=[1 1 1;1 1 1;1 1 1]; %Objeto

% for x=2:1:W-1
%     for y=2:1:H-1
%         %tipo de convolucion en un boundary de 3x3 guardando la informacion
%         %en vectores.
%          a1=[w(1)*I(x-1,y-1) w(2)*I(x-1,y) w(3)*I(x-1,y+1) w(4)*I(x,y-1) w(5)*I(x,y) w(6)*I(x,y+1) w(7)*I(x+1,y-1) w(8)*I(x+1,y) w(9)*I(x+1,y+1)];
%          A1(x,y)=min(a1); %Erosion
%     end
% end
[W H]=size(I);
for i=1:1:W
    for j=1:1:H
        if I(i,j)==255
            E(i,j)=1;
        else
            E(i,j)=0;
        end
    end
end
Ero=erosionar(W,H,E);
A1=Ero;
[p1,p2]=size(A1);
w=[1 1 1;1 1 1;1 1 1]; %Objeto
[W H]=size(I);
for x=2:1:p1-1
    for y=2:1:p2-1
        %tipo de convolucion en un boundary de 3x3 guardando la informacion
        %en vectores.
         a2=[w(1)*Ero(x-1,y-1) w(2)*Ero(x-1,y) w(3)*Ero(x-1,y+1) w(4)*Ero(x,y-1) w(5)*Ero(x,y) w(6)*Ero(x,y+1) w(7)*Ero(x+1,y-1) w(8)*Ero(x+1,y) w(9)*Ero(x+1,y+1)];
         A2(x,y)=max(a2); %Erosion
    end
end

s=strel('square',3);
O=imopen(I,s);

[f,g]=size(A2);
%multiplicacion punto a punto


for i=1:1:f-1
    for j=1:1:g-1
        D(i,j)=I1(i,j).*A2(i,j);
    end 
end


figure,
subplot(1,2,1),imshow(A2),title('Apertura a partir de la convolucion')
subplot(1,2,2),imshow(O),title('Apertura por funcion de matlab')

figure,
subplot(1,2,1),imshow(I1),title('Imagen Original en gris')
subplot(1,2,2),imshow(D),title('Multiplicacion punto a punto')