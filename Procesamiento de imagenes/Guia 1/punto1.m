clc
clear all
close all 

%Image load
ImageOriginal = imread('cell.tif');
figure(1), imshow(ImageOriginal), title('original image');

%Propery of the image
property=imfinfo('cell.tif');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits
tic
% Copy of the Original Image
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end

% First point Reduccion of Image resolution in factor k=1,k=2,k=3
% Se generan dos limites con un bucle for, tomando como limite las
% dimensiones de la imagen, despues la expresion a manejar es tomar los
% datos de i y dividirlos en el factor que se desea, se aproximan al entero
% y por ultimo se igualan a la imagen original en la posicion i,j de los
% limites
% 
% % for i=1:2:H
% %     for j=1:2:W
% %         Image1(uint8(i/2),uint8(j/2))=Image(i,j);
% %     end
% % end
% 
% Image1=Image(1:2:end,1:2:end,1:2:end);
% 
% Image2=Image(1:3:end,1:3:end,1:3:end);
% 
% Image3=Image(1:4:end,1:4:end,1:4:end);

%tomar el contador con saltos de la las columnas y filas, es decir omitir
%las que van en cada factor.
K=2;
i=1:K:H; j=1:K:W;
    Image1=Image(i,j);
    
K=3;
i=1:K:H; j=1:K:W;
    Image2=Image1(i,j);

 K=4;
i=1:K:H; j=1:K:W;
    Image3=Image2(i,j);


figure(2), imshow(Image), title('Copy to Image');
figure(3), imshow(Image1), title('Reduce Factor K=2');
figure(4), imshow(Image2), title('Reduce Factor K=3');
figure(5), imshow(Image3), title('Reduce Factor K=4');
toc