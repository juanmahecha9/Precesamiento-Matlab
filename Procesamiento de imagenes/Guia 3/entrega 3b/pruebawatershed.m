%Watershed transform
clc
clear all
close all

%Imagen a color
I1=imread('hestain.png');
figure,imshow(I1),title('Imagen original RGB');

%escala de grises
I=rgb2gray(I1);
figure,imshow(I),title('Imagen en escala de grises');

%Mejora del contraste
[H W]=size(I);
x=1:1:(255);
Isalida1=I*0;
Y=10.*(exp(x.*(1/80)));
Lut=[x;Y];
for i=1:1:H
    for j=1:1:W
        [s1, pos]=find(x==I(i,j));
        Isalida1(i,j)=Y(pos);
    end
end
Io=Isalida1;
figure,imshow(Io),title('Imagen con mejora de contraste');
Io=medfilt2(Io,[7,7]);
%Filtro de mediana
Fi=medfilt2(Io, [3 3]);
figure,imshow(Fi),title('Imagen con filtro de media');

%Laplaciano
M=[1 1 1
   1 -8 1
   1 1 1];
lap=conv2(Fi,M);
lap=medfilt2(lap,[4 4]);
figure,imshow(lap),title('Imagen laplaciana');

%Boundary
for i=2:1:H-1; 
    for j=2:1:W-1;

b=[lap(i-1,j-1) lap(i-1,j) lap(i-1,j+1) lap(i,j-1) lap(i,j) lap(i,j+1) lap(i+1,j-1) lap(i+1,j) lap(i+1,j+1)];
b=double(b);
m=(min(b));
b1=(std(b))+m+1;
 
for k=1:1:9; 
    if b(k)<b1
        b(k)=0;
    else
        b(k)=1;
    end
end 

I3(i-1,j-1)=b(1);
I3(i-1,j)=b(2);
I3(i-1,j+1)=b(3);
I3(i,j-1)=b(4);
I3(i,j)=b(5);
I3(i,j+1)=b(6);
I3(i+1,j-1)=b(7);
I3(i+1,j)=b(8);
I3(i+1,j+1)=b(9);

    end 
end 

I3=medfilt2(I3, [5 5]);
figure,imshow(I3),title('Imagen despues del boundary');
imwrite(I3,'watershed.png');

[f,g]=size(I3);
for i=1:1:f
    for j=1:1:g
        D(i,j)=I(i,j).*I3(i,j);
    end 
end


figure,imshow(D),title('multiplicacion punto a punto');

