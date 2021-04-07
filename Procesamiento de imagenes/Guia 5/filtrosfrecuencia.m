clc
clear all
close all
I=imread('mri.tif');
Info=imfinfo('mri.tif');
%extraer el ancho
Iw=Info.Width;
%extraer el alto
Ih=Info.Height;

%filtro pasa bajos
G=fft2(I);%saca la transformada de fourier
%figure, imshow(abs(G),[]), title('Transformada sin centrar')
G1=fftshift(G);%shift centra la transformada
%figure,imshow(abs(G1),[]), title('Transformada centrada')
theta=atan(imag(G1)/real(G1));
C=imread('circulo.png');
C=rgb2gray(C);
C=double(C>128);
C=double(C);
%figure, imshow(C)
p=theta.*C; %angulo
s=(abs(G1)).*C; %magnitud
t=G1.*C;%frecuencia
%figure, imshow(1+log(p))
%figure,imshow(1+log(s))
%figure,imshow(t)

IR=ifft2(t);
%figure, imshow(abs(IR),[])%equivalente a hacer un filtro gaussiano en el dominio del espacio

%filtro pasa altos
In=not(C);
In=double(In);
%figure, imshow(In)
a=theta.*In;
m=(abs(G1)).*In;
f=G1.*In;

IR1=ifft2(f);
%figure, imshow(abs(IR1),[]), title ('pasa altos')
































%1. construir sobel
%2. transformada R=fft2(sobel)
%3. redimensionar R[alto,ancho] alto=alto imagen(original) ancho=ancho
%imagen(imagen original)
%4. X=fft2(imagen original)
%5. x=fftshift(x) y fftshift(R)
%6. visualizar x y r
%7. s=x*r
%8.s=ifft(s)
%9. visualizar s

Imx=[-1 -2 -1; 0 0 0; 1 2 1];
Imy=[-1 0 1; -2 0 2; -1 0 1];
Ix=filtro(Ih,Iw,I,Imx);
Iy=filtro(Ih,Iw,I,Imy);
i=1:1:(Ih+1);j=1:1:(Iw+1);
sobel(i,j)=sqrt((Ix(i,j).^2)+(Iy(i,j).^2));

tr=fft2(sobel);
tr=resizem(tr,128,128);
