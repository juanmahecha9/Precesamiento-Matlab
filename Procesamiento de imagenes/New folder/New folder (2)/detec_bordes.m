%Programado por: Yelinna Pulliti Carrasco
%en lo posible sin usar funciones de Matlab (asi es mas facil pasarlo a
%otros lenguajes)
%este programa aplica los filtros usados para detectar bordes
% la función "bordes" realiza la convolición
%http://toyscaos.tripod.com/eam.html

tic
A=imread('car3','bmp'); 
A=double(A);

%Kayyali
%h1=[-6 0 6; 0 0 0; 6 0 -6]; %NESW
%h2=[6 0 -6; 0 0 0 ; -6 0 6]; %SENW

%ya no me acuerdo qué filtro era éste
 h1=[ 0    -2     0;
      2     0    -2;
      2     2     0];

Y=bordes(h1,A);
%Y1=bordes(h2,A);
%Y=(uint8(Y)+uint8(Y1))/2;
%Y=Y1+Y2;

w=1/9;

%mean filter
h1=[w w w; w w w; w w w];
Y1=bordes(h1,Y);

[f c]= size(Y);

Y1=Y1(1:f,1:c);

Y=Y-Y1;
Y=1.3*Y;
Y=uint8(Y);

figure(1)
subplot(1,2,1)
imshow(uint8(A))
title('original Image')
subplot(1,2,2)
imshow(Y)
title('Edge Detection and Sharpening')

toc