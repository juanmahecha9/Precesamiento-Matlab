%Programado por: Yelinna Pulliti Carrasco
%en lo posible sin usar funciones de Matlab (asi es mas facil pasarlo a
%otros lenguajes)
%este programa aplica el filtrado de media o promedio
%además de resaltar los bordes
% la función "bordes" realiza la convolición
%http://toyscaos.tripod.com/eam.html

clc
A=imread('casaruidog','bmp');
h=[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];

A=double(A);

x=bordes(A,h);
x=bordes(x,h);

y=A-x;
y=A+y;

figure(1)
subplot(1,3,1)
imshow(uint8(A))
title('original image')
subplot(1,3,2)
imshow(uint8(x))
title('image after mean filtering')
subplot(1,3,3)
imshow(uint8(y))
title('image after sharpening')

