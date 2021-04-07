clc
clear all
close all
a=imread('magao.png');
a=rgb2gray(a);
[nf,nc]=size(a);
%FFT computing
bt=fft2(a);



% mag=abs(bt);
% maxmag=max(max(mag));
% minmag=min(min(mag));
% mag=mag-minmag;
% c=255/log(maxmag-minmag);
% new_mag=c*log(1+mag);
%figure,imshow(bt),title('FFT2')
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
U=uint8(new_mag);




out=abs(ifft2(bt)); 
out=uint8(out);
%figure,imshow(out),title('inverse FFT2')

figure,
subplot(131),imshow(a),title('Original Image');
subplot(132),imshow(U),title('Fourier transform');
subplot(133),imshow(out),title('Inverse Furier transform');