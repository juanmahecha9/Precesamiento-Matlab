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
for i=1:1:H % Heigth
    if mod(i,2)==0
        for j=1:1:W % Width
            if mod(j,2)==0
                Image1((i/2),(j/2))=Image(i,j);
            end
        end
    end
end


% i=1:1:H;
% j=1:1:W;
% Image1((i/2),(j/2))=Image(i,j);

% Factor 3
for i=1:1:H % Heigth
    if mod(i,3)==0
        for j=1:1:W % Width
            if mod(j,3)==0
                Image2((i/3),(j/3))=Image(i,j);
            end
        end
    end
end

% i=1:1:H;
% j=1:1:W;
% Image2((i/3),(j/3))=Image(i,j);

% Factor 4
for i=1:1:H % Heigth
    if mod(i,4)==0
        for j=1:1:W % Width
            if mod(j,4)==0
                Image3((i/4),(j/4))=Image(i,j);
            end
        end
    end
end

% i=1:1:H;
% j=1:1:W;
% Image3((i/4),(j/4))=Image(i,j);

figure,
subplot(1,4,1), imshow(Image), title('Copy to Image');
subplot(1,4,2), imshow(Image1), title('Reduce for 2');
subplot(1,4,3), imshow(Image2), title('Reduce for 3');
subplot(1,4,4), imshow(Image3), title('Reduce for 4');


% EXPAND THE IMAGE SPATIAL RESOLUTION BY FACTOR OF 2,3 AND 4
% Factor K=2
i=1:1:H ; j=1:1:W;
        
        Image4((i*2),(j*2))=Image(i,j);
        Image4(((i*2)-1),((j*2)-1))=Image(i,j);
        Image4(((i*2)-1),(j*2))=Image(i,j);
        Image4((i*2),((j*2)-1))=Image(i,j);
Image4=uint8(Image4);










% 
% figure,
% subplot(1,4,1), imshow(Image), title('Copy to Image');
% subplot(1,4,2), imshow(Image4), title('Expand for 2');
% subplot(1,4,3), imshow(Image5), title('Expand for 3');
% subplot(1,4,4), imshow(Image6), title('Expand for 4');

