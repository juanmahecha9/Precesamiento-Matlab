clear all;
close all;
clc;
% use a thresholded image as input (binary image)
I1 = imread('mri.tif');       % read image
subplot(2,3,1),imshow(I1),title('Original Image');

% object in the image is represented by white colour
% background is represented by black colour
I = 255 - I1;                % Invert the image
subplot(2,3,2),imshow(I),title('Inverted Image');

SE = strel('square',3);     % generate the structuring element

E = imerode(I,SE);          % Perform Erosion Operation
subplot(2,3,3),imshow(E),title('Eroded Image');

D = imdilate(I,SE);          % Perform Dilation Operation
subplot(2,3,4),imshow(D),title('Dilated Image');

O = imopen(I,SE);          % Perform Opening Operation
subplot(2,3,5),imshow(O),title('Opened Image');

C = imclose(I,SE);          % Perform Closing Operation
subplot(2,3,6),imshow(C),title('Closed Image');