%funciones estadisticas sobre el histograma de la imagen

clc 
clear all
close all

%%
%asignacion de la imagen en una variable
IO=imread('mri.tif');

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
figure(1),imshow(IO),title('Original Image')

%%
%HISTOGRAMA
Hi=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H % limit on the reduced matrix in factor 1
    for j=1:1:W
       Hi(I(i,j)+1)=Hi(I(i,j)+1)+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
                                      %Buscar los pixeles en valor 0 
    end
end
figure(2),
subplot(1,2,1),imhist(I),title('Used a function'),ylabel('Frecuency')
subplot(1,2,2),stem(Hi),title('Algorithm'),ylabel('Frecuency')
Y=max(Hi);
% promedio del histograma
u=0;
for i=1:1:length(Hi)
    u=Hi(i)+u;
end   
me=u/length(Hi); %media del vector (miu)

%%
%desviacion estandar del histrograma
V=0; 
for i=1:1:length(Hi)
      V=((Hi(i)-me).^2)+V; %sumatoria de datos
end
Va=V/(length(Hi)-1); %Varianza de matriz (sigma^2)

