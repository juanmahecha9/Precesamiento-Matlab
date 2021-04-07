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

Image=ImageOriginal;

%First point Reduccion of Image resolution in factor k=1,k=2,k=3

% Factor 2
% K=2;
% for i=1:1:H % Heigth
%     for j=1:1:W % Width
%         for p=0:1:K-1
%             for y=0:1:K-1
%                 Image1((i*K)-y,(j*K)-p)=Image(i,j); matriz simetrica
%             end
%         end
%     end
% end

% figure(2), imshow(Image1), title('Copy of Image');


% for i=1:1:H
%     for j=1:1:W
%         Image1(uint8(i/2),uint8(j/2))=Image(i,j);
%     end
% end
  
% for i=1:1:H
%     for j=1:1:W
%         Image2(j,i)=Image(i,j); %reflexion con la diagonal
%     end
% end

% for i=1:1:H
%     for j=1:1:W
%         Image2(H-i+1,j)=Image(i,j); %reflexion sobre la horizontal
%     end
% % end
% for i=1:1:H
%     for j=1:1:W
%         Image2(i,W-j+1)=Image(i,j); %reflexion con la vertical
%     end
% end
% 
% for i=1:1:H
%     for j=1:1:W
%         Image2(i,j)=255-Image(i,j); %negativo de la imagen
%     end
% end

% 
for i=1:1:H-1
    for j=1:1:W-1
        Image2(i,j)=Image(i+1,j+1)-Image(i,j); %filtro pasa altos (detector de alta frecuencia)
    end
end

figure(3), imshow(Image2), title('Copy of Image');
