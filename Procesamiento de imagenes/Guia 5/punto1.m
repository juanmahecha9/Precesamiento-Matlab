clc;
clear all;
close all;
% artificial image
%creacion de la imagen, entre mas grande sea el numero mas corrida estara
%la cruz en el cuadrad0
a=imread('magao.png');
a=rgb2gray(a);
[nf,nc]=size(a);


%FFT computing
bt=fft2(a);
out=abs(ifft2(bt)); 
Vq=bt;
%Centering the FFT
b=fftshift(Vq);

%Magnitude from FFT
mag=abs(b);


%dinamical range modification 0-255
%max vulue of the fft
maxmag=max(max(mag));
%minimum value
minmag=min(min(mag));
%zero adjust
mag=mag-minmag;
% Dynamical range limitation
c=255/log(maxmag-minmag);
new_mag=c.*log(1+mag);


result=(ifft2(bt));
% % 2D plot
% subplot(1,2,1);
% imshow(uint8(a)),title('Input image');
% xlabel('C. spatial Y'),ylabel('C. spatial X'), colorbar;
% subplot(1,2,2);
% imshow(uint8(new_mag)), title('Magnitud Transformada');
% xlabel('C. Frequential'),ylabel('C. Frequential '), colorbar;
% % 3D plot
% %original image

figure,imshow(result)
