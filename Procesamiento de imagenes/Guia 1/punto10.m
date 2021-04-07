clc
clear all
close all 
tic
%Image load
ImageOriginal = imread('rice.png');
ImageB=zeros(257,257);

%Propery of the image
property=imfinfo('rice.png');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits

Imagen4d=zeros([H*2,W*2]);

% Copy of the Original Image
%recorrido punto a punto
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end
figure(1), imshow(Image), title('Copy of original image');


%Rotation
%Rotacion en 90 grados
Image=im2double(Image); % COnvertir imagen a double
m=H;  % datos para la rejilla 
n=W;  % datos para la rejilla
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

for 
    
end
 
figure(7),
subplot(1,2,1),imshow(Image), title('Original Image')
subplot(1,2,2),hold on ,imshow(Ifinal), title('Rotation of Image 90 degrees') ,hold off
