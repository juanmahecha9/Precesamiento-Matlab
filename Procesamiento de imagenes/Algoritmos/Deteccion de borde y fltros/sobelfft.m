clc
clear all
close all

I=imread('mri.tif');
figure,imshow(I),title('MRI.tif');

IS=dectsobel(I);
figure,imshow(IS),title('SOBEL');

R=fft2(IS);%FFT de sobel
R=fftshift(R);
figure,imshow(1+log(abs(R)),[]),title('sobel en frecuencia ')

X=fft2(I);%FFT de la imagen original
X=fftshift(X);
figure,imshow(1+log(abs(X)),[]),title('Imagen Original en frecuencia ')

S=X.*R;
S1=ifft2(S);
figure,imshow(1+log(abs(S1)),[]),title('IFFT ')

