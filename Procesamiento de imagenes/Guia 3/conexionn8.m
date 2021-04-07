%Conexion n8
clc
clear all
close all

I=imread('Otsu.png');
figure,imshow(I),title('Imagen binarizada por Otsu')


[H W]=size(I);
for i=1:1:H
    for j=1:1:W
        if I(i,j)==255
            G(i,j)=1;
        end
    end
end



for i=1:1:H
    for j=1:1:W
        if 
            G(i,j)=1;
        end
    end
end
