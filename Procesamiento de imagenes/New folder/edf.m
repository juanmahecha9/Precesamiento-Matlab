c;
clear all
close all 

%Image load
ImageOriginal = imread('maga-oscura.jpg');
%figure(1), imshow(ImageOriginal), title('original image');
Ir= ImageOriginal(:,:,1);
Ig= ImageOriginal(:,:,2);
Ib= ImageOriginal(:,:,3);
property=imfinfo('cell.tif');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits

figure,
subplot(1,4,1), imshow(ImageOriginal), title('original');
subplot(1,4,2), imshow(Ir), title('R');
subplot(1,4,3), imshow(Ig), title('G');
subplot(1,4,4), imshow(Ib), title('B');

for i=1:1:H
    for j=1:1:W
        I(i,j)=255-Ir(i,j); %negativo de la imagen
    end
end
figure, imshow(I),title ('Negativo');