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


% 
% figure(2),
% subplot(1,2,1),imhist(I),title('Used a function'),ylabel('Frecuency')
% subplot(1,2,2),stem(Hi),title('Algorithm'),ylabel('Frecuency')
% Y=max(Hi);
% 
% 
% %Normalizacion entre 0 y 1 , -1 y 1
% Nor1=Hi/Y;
% Nor2=(Nor1*2)-1;
% 
% figure(3),
% subplot(1,2,1),stem(Nor1)
% subplot(1,2,2),stem(Nor2)


%promedio del histograma (miu del vector histograma)
% u=0;
% for i=1:1:length(Hi)
%     u=Hi(i)+u;
% end   
% me=u/length(Hi);

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
% a=(1/(Desvest*sqrt(2*pi)));
% for i=1:1:length(Hi)
%     b=exp(-0.5*((Hi(i)-me)/Desvest).^2);
%     Funden=a*b;
% end


Fd=0;
for i=1:1:H
    for j=1:1:W
        Fd(i,j)=(1/2).*(1+(erf((I(i,j)-mediaA)/(Desvest*sqrt(2)))));
    end
end
figure,imshow(Fd)
Hi=imhist(Fd)
figure,stem(Hi),title('o');


