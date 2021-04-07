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
Hi=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H% limit on the reduced matrix in factor 2
    for j=1:1:W
       Hi(I(i,j)+1)=Hi(I(i,j)+1)+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
                                      %Buscar los pixeles en valor 0 
    end
end

%%
%promedio de los datos de la matriz
f=0;
mediaA=0; %media aritmetica
I=double(I);
for i=1:1:H
    for j=1:1:W
        f=(I(i,j)+f);
    end
end
mediaA=f/(H*W); %Miu

%%
%desviacion estandar y varianza
V=0; 
I=double(I);
for i=1:1:H
    for j=1:1:W
       V=((I(i,j)-mediaA).^2)+V; %sumatoria de datos
    end
end
Varianza=V/((W*H)-1); %Varianza de matriz (sigma^2)
Desvest=sqrt(Varianza); % Desviacion estandar (sigma)


%promedio del histograma (miu del vector histograma)
u=0;
for i=1:1:length(Hi)
    u=Hi(i)+u;
end   
me=u/length(Hi);

%%
%promedio de los datos de la matriz
f=0;
mediaA=0; %media aritmetica
I=double(I);
for i=1:1:H
    for j=1:1:W
        f=(I(i,j)+f);
    end
end
mediaA=f/(H*W); %Miu
%%
%desviacion estandar y varianza
V=0; 
I=double(I);
for i=1:1:H
    for j=1:1:W
       V=((I(i,j)-mediaA).^2)+V; %sumatoria de datos
    end
end
Varianza=V/((W*H)-1); %Varianza de matriz (sigma^2)
Desvest=sqrt(Varianza); % Desviacion estandar (sigma)
%%
%funcion de densidad
a=(1/(Desvest*sqrt(2*pi)));
for i=1:1:length(Hi)
    b=exp(-0.5*((Hi(i)-me)/Desvest).^2);
    Funden=a*b;
end

%%
%normalizar la imagen
%Para estandarizar (normalizar de 0 a 1)una funcion se genera que z=(X-media)/sigma
I=double(I);
for i=1:1:H
    for j=1:1:W
            Z(i,j)=((I(i,j)-mediaA)/Desvest);
    end
end
Z=uint8(Z);
figure,imshow(Z)
