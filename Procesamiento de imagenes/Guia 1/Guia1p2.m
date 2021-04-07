clc
clear all
close all 

%Image load
ImageOriginal = imread('rice.png');
ImageB=zeros(257,257);

%Propery of the image
property=imfinfo('rice.png');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits

% Copy of the Original Image
%recorrido punto a punto
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end
figure(1), imshow(Image), title('Copy of original image');

%boundary
for i=1:1:H
    for j=1:1:W
        ImageB(i,j)=Image(i,j);
    end
end
% Para realizar la operacion
ImageB=double(ImageB);
for i=2:2:256
    for j=2:2:256
       %Promedio
        ImageC(i/2,j/2)=(ImageB(i-1,j-1)+ImageB(i-1,j)+ ImageB(i-1,j+1)+ImageB(i,j-1)+ImageB(i,j)+ImageB(i,j+1)+ImageB(i+1,j-1)+ImageB(i+1,j))/8;
        ImageC=uint8(ImageC);
   end
end
figure(2), imshow(ImageC), title('BOUNDARY WINDOW WITH FACTOR REDUCE 2');


%Binarize according to the histogram
%1. Histogram
histImage=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H/2% limit on the reduced matrix in factor 2
    for j=1:1:W/2
        %niveles de gris
        %nivelgris= Image(i,i);
        histImage(ImageC(i,j))=histImage(ImageC(i,j))+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
    end
end
figure(3),
subplot(1,2,1),imhist(ImageC),title('Used a function'),ylabel('Frecuency')
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
        if((Image(i,j))>pos); % apartir del histograma
            Is(i,j)=255;
        else
            Is(i,j)=0;
        end
    end
end
figure(4), imshow(Is),title('BINARIZED IMAGE');

% %Mirror
 %IE=ImageC(end:1:1,end:-1:1); %Busca el final en las filas y columnas y plotea en forma inversa a la imagen

 for i=1:1:H
    for j=1:1:W
        IE(i,H-j+1)=Image(i,j); %reflexion sobre la horizontal
    end
end
 figure(5),
 subplot(1,2,1),imshow(Image),title('Original Image');
 subplot(1,2,2),imshow(IE),title('Mirror');

%bit planes
for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),1)==1
           IBP1 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),2)==1
           IBP2 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),3)==1
           IBP3 (i,j)=255;
       end
   end
end 

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),4)==1
           IBP4 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),5)==1
           IBP5 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),6)==1
           IBP6 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),7)==1
           IBP7 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),8)==1
           IBP8 (i,j)=255;
       end
   end
end

figure(6), 
subplot(2,4,1),imshow(IBP1), title('Bit plane 1')
subplot(2,4,2),imshow(IBP2), title('Bit plane 2')
subplot(2,4,3),imshow(IBP3), title('Bit plane 3')
subplot(2,4,4),imshow(IBP4), title('Bit plane 4')
subplot(2,4,5),imshow(IBP5), title('Bit plane 5')
subplot(2,4,6),imshow(IBP6), title('Bit plane 6')
subplot(2,4,7),imshow(IBP7), title('Bit plane 7')
subplot(2,4,8),imshow(IBP8),title('Bit plane 8')

%Rotation

%Rotacion en 90 grados
Image=im2double(Image); % COnvertir imagen a double
m=H;
n=W;
[x,y] = meshgrid(1:n,1:m); % rejilla heredada de la imagen original
                           % Devuelve las coordenadas 2-D de la cuadrícula basadas
                           %en las coordenadas contenidas en los vectores xey. X es una
                           %matriz donde cada fila es una copia de x, e Y es una matriz donde
                           %cada columna es una copia de y. La rejilla representada por 
                           %las coordenadas X e Y tiene longitud (y) filas y longitud (x) columnas.

theta=pi/2;                           % ángulo de rotación

x0=H/2;y0=W/2;                    % centro de rotación

p=(x-x0).*cos(theta)+(y-y0).*sin(theta)+x0;   % coordenadas transformadas (nueva posición de los pixeles)
q=-(x-x0).*sin(theta)+(y-y0).*cos(theta)+y0;  % coordenadas transformadas (nueva posición de los pixeles)

Ifinal=interp2(x,y,Image,p,q);        % valores de la intensidad interpolada en la nueva posición
                                      % Interpolación de datos en cuadrícula bidimensional en formato meshgrid
                                      % Se denomina interpolación a la obtención de nuevos puntos partiendo del
                                               %conocimiento de un conjunto discreto de puntos.
figure(7),
subplot(1,2,1),imshow(Image), title('Original Image')
subplot(1,2,2), imshow(Ifinal), title('Rotation of Image 90 degrees')

%Rotacion en 47 grados
Image=im2double(Image); % COnvertir imagen a double
m=size(Image,1);
n=size(Image,2);
[x,y] = meshgrid(1:n,1:m); % rejilla heredada de la imagen original

theta=0.820305;                                 % ángulo de rotación
x0=H/2;y0=W/2;  % centro de rotación
p=(x-x0).*cos(theta)+(y-y0).*sin(theta)+x0;   % coordenadas transformadas (nueva posición de los pixeles)
q=-(x-x0).*sin(theta)+(y-y0).*cos(theta)+y0;  % coordenadas transformadas (nueva posición de los pixeles)

Ifinal1=interp2(x,y,Image,p,q);        % valores de la intensidad interpolada en la nueva posición
                                      % Interpolación de datos en cuadrícula bidimensional en formato meshgrid
                                      % Se denomina interpolación a la obtención de nuevos puntos partiendo del
                                               %conocimiento de un conjunto discreto de puntos.
figure(8),
subplot(1,2,1),imshow(Image), title('Original Image')
subplot(1,2,2),imshow(Ifinal1,[]), title('Rotation of Image 47 degrees')

%Rotacion en 75 grados
Image=im2double(Image); % COnvertir imagen a double
m=size(Image,1);
n=size(Image,2);
[x,y] = meshgrid(1:n,1:m); % rejilla heredada de la imagen original


theta=1.309;                                 % ángulo de rotación
x0=H/2;y0=W/2;                     % centro de rotación
p=(x-x0).*cos(theta)+(y-y0).*sin(theta)+x0;   % coordenadas transformadas (nueva posición de los pixeles)
q=-(x-x0).*sin(theta)+(y-y0).*cos(theta)+y0;  % coordenadas transformadas (nueva posición de los pixeles)

Ifinal2=interp2(x,y,Image,p,q);        % valores de la intensidad interpolada en la nueva posición
                                      % Interpolación de datos en cuadrícula bidimensional en formato meshgrid
                                      % Se denomina interpolación a la obtención de nuevos puntos partiendo del
                                               %conocimiento de un conjunto discreto de puntos.
figure(9),
subplot(1,2,1),imshow(Image), title('Original Image')
subplot(1,2,2),imshow(Ifinal2), title('Rotation of Image 75 degrees')

%Rotacion en 137 grados
Image=im2double(Image); % COnvertir imagen a double
m=size(Image,1);
n=size(Image,2);
[x,y] = meshgrid(1:n,1:m); % rejilla heredada de la imagen original


theta=2.3911;                                 % ángulo de rotación
x0=H/2;y0=W/2;                     % centro de rotación
p=(x-x0).*cos(theta)+(y-y0).*sin(theta)+x0;   % coordenadas transformadas (nueva posición de los pixeles)
q=-(x-x0).*sin(theta)+(y-y0).*cos(theta)+y0;  % coordenadas transformadas (nueva posición de los pixeles)

Ifinal3=interp2(x,y,Image,p,q);        % valores de la intensidad interpolada en la nueva posición
                                      % Interpolación de datos en cuadrícula bidimensional en formato meshgrid
                                      % Se denomina interpolación a la obtención de nuevos puntos partiendo del
                                               %conocimiento de un conjunto discreto de puntos.
figure(10),
subplot(1,2,1),imshow(Image), title('Original Image')
subplot(1,2,2),imshow(Ifinal3), title('Rotation of Image 137 degrees')
