clc 
clear all
close all

%asignacion de la imagen en una variable
IO=imread('mri.tif');
figure(1),imshow(IO),title('Original Image')

%Extraer Informacion de la imagen
P=imfinfo('mri.tif');
W=P.Width; % Width
H=P.Height; % Heigth
B=P.BitDepth; % Bits

% Imagen para trabajar
for i=1:1:H
    for j=1:1:W
        I(i,j)=IO(i,j);
    end
end

%Histograma de la imagen
%(Probabilidad)
Hi=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H% limit on the reduced matrix in factor 2
    for j=1:1:W
       Hi(I(i,j)+1)=Hi(I(i,j)+1)+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
                                      %Buscar los pixeles en valor 0 
    end
end

for i=1:length(Hi)
    l(i)=Hi(i)/(W*H);
end

plot(l)