clc
clear all
close all
warning off
% Carga de la imagen
grayImage = imread('Lena.png');

% Si la imagen va a color, convertir en escala de grises
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end

% Crear histograma de la imagen
[pixelCount grayLevels] = imhist(grayImage);

% Tamaño de la imagen 
[rows columns] = size(grayImage);

% Mostrar la imagen original en escala de grises.
subplot(2, 2, 1);
imshow(grayImage),title('Imagen Original');

% Mostrar histograma imagen original
subplot(2, 2, 2); 
bar(pixelCount),title('Histograma original'),xlim([0 grayLevels(end)]); % Escala x eje manualmente.


LBP = zeros(size(grayImage));
for row = 2 : rows - 1   
    for col = 2 : columns - 1   
        
        centerPixel = grayImage(row, col);
        pixel7=grayImage(row-1, col-1) > centerPixel;  
        pixel6=grayImage(row-1, col) > centerPixel;   
        pixel5=grayImage(row-1, col+1) > centerPixel;  
        pixel4=grayImage(row, col+1) > centerPixel;     
        pixel3=grayImage(row+1, col+1) > centerPixel;    
        pixel2=grayImage(row+1, col) > centerPixel;      
        pixel1=grayImage(row+1, col-1) > centerPixel;     
        pixel0=grayImage(row, col-1) > centerPixel;       
        LBP(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
    end  
end 

subplot(2,2,3);
imshow(LBP,[]),title('LBP');
subplot(2,2,4);
[pixelCounts, GLs] = imhist(uint8(LBP));
bar(pixelCounts),xlim([0 GLs(end)]);
%title('Histogram of Local Binary Pattern', 'FontSize', fontSize);