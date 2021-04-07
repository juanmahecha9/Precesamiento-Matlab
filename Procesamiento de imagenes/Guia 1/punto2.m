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
 toc