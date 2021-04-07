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
i=1:2:H; j=1:2:W;
    Image1=Image(i,j);
    
i=1:3:H; j=1:3:W;
    Image2=Image(i,j);

i=1:4:H; j=1:4:W;
    Image3=Image(i,j);


figure(2), imshow(Image), title('Copy to Image');
figure(3), imshow(Image1), title('Reduce Factor K=2');
figure(4), imshow(Image2), title('Reduce Factor K=3');
figure(5), imshow(Image3), title('Reduce Factor K=4');


% Expand of Image
% Primer ciclo for genera un limite entre el el primer valor de la matriz y
% el ultimo del alto de la imagen, el segundo ciclo for genera un limite
% entre el el primer valor al ultimo del ancho, es decir genero un barrido
% por todos los datos de la matriz. los otros dos ciclos for anidados,
% generan un barrido desde el valor inicial de la posicion hasta el factor
% de reduccion, esto ocurre debido a que la matriz es simetrica; la
% exprecion que se usa como comando es explciada como una posicion i & j
% que multiplica al valor  del factor, al cual se adicionan a las posiciones
% que se estabes como K-1, esto asegura que la se tomen los valores de la
% matriz, como por ejemplo a1 a2 a3 ---> a1 a1 a1 a2 a2 a2 a3 a3 a3,
% elimine una fila y columna que se desea, esto para cualquier K se 
% escoja, siempre que la matriz mantenga su simetria.
%cada pixel se vuelven 3 
% Factor K=2

K=2;
for i=1:1:H % Heigth
    for j=1:1:W % Width
        for p=0:1:K-1
            for y=0:1:K-1
                Image4((i*K)-y,(j*K)-p)=Image(i,j); %matriz simetrica
            end
        end
    end
end

K=3;
for i=1:1:H % Heigth
    for j=1:1:W % Width
        for p=0:1:K-1
            for y=0:1:K-1
                Image5((i*K)-y,(j*K)-p)=Image(i,j); %matriz simetrica
            end
        end
    end
end
 
K=4;
for i=1:1:H % Heigth
    for j=1:1:W % Width
        for p=0:1:K-1
            for y=0:1:K-1
                Image6((i*K)-y,(j*K)-p)=Image(i,j); %matriz simetrica
            end
        end
    end
end
 
figure,imshow(Image4), title('Expand Factor K=2');
figure,imshow(Image5), title('Expand Factor K=3');
figure,imshow(Image6), title('Expand Factor K=4');
 
 
% Reduce the original gray Resolution  by factor K= 6 and K=12
Image7=((Image/256)*64);
figure,
subplot(1,2,1), imshow(Image), title('Copy to Image');
subplot(1,2,2), imshow(Image7), title('Reduce the image gray resolution in 6');

Image8=((Image/256)*4096);
figure,
subplot(1,2,1), imshow(Image), title('Copy to Image');
subplot(1,2,2), imshow(Image8,[]), title('Expand the image gray resolution in 12');



