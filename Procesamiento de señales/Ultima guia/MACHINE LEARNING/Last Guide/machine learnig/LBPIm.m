close all
clear all
clc
I=imread ('masas roiA_1264_1.RIGHT_MLO_1024x1024.png');

% Si la imagen va a color, convertir en escala de grises
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Crear histograma de la imagen
[pixelCount grayLevels] = imhist(I);

% Tamaño de la imagen 
[rows columns] = size(I);


LBP = zeros(size(I));
for row = 2 : rows - 1   
    for col = 2 : columns - 1   
        
        centerPixel = I(row, col);
        
        pixel7=I(row-1, col-1) > centerPixel;  
        pixel6=I(row-1, col) > centerPixel;   
        pixel5=I(row-1, col+1) > centerPixel;  
        pixel4=I(row, col+1) > centerPixel;     
        pixel3=I(row+1, col+1) > centerPixel;    
        pixel2=I(row+1, col) > centerPixel;      
        pixel1=I(row+1, col-1) > centerPixel;     
        pixel0=I(row, col-1) > centerPixel;    
        
        LBP(row, col) = (pixel7 * 2^7 + pixel6 * 2^6 + ...
                         pixel5 * 2^5 + pixel4 * 2^4 + ...
                         pixel3 * 2^3 + pixel2 * 2^2 + ...
                         pixel1 * 2 + pixel0);
    end  
end 
 LBP=uint8(LBP);
 figure,imshow(LBP)
 figure,imshow(I)
