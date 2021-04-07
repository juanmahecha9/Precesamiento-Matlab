clc
close all
clear all

I=imread('14.jpg');
if size(I, 3) == 3
    I = rgb2gray(I);
end
[M N] = size(I);
if  ((-1)^M) == 1 & ((-1)^N) == 1
    I=I;
elseif ((-1)^M) == 1 & ((-1)^N) == -1
    I = imresize(I,[M,N+1]);
elseif ((-1)^M) == -1 & ((-1)^N) == 1
    I = imresize(I,[M+1,N]);
elseif ((-1)^M) == -1 & ((-1)^N) == -1
    I = imresize(I,[M+1,N+1]);
end

figure,imshow(I)

aH=adapthisteq(I);
aH=histeq(aH);
Bttb=Butterworthalto(aH,1);
% figure,imshow(Bttb)
% 
% %crear objeto
% a=round(M/2);
% b=round(N/2);
% for x=1:M;
%     for y=1:N;
%         D(x,y)=(exp((-(sqrt((x-a)^2+(y-b)^2)))/(2*2)));
%     end
% end
% D=uint8(D);
% L=graythresh(D);
% C=im2bw(D,L);
% C=double(~C);
% 
% %Fourier Transform
% F=fft2(I);%saca la transformada de fourier
% Vq=F;
% %Centering the FFT
% b=fftshift(Vq);
% %Magnitude from FFT
% mag=abs(b);
% %dinamical range modification 0-255
% %max vulue of the fft
% maxmag=max(max(mag));
% %minimum value
% minmag=min(min(mag));
% %zero adjust
% mag=mag-minmag;
% % Dynamical range limitation
% c=255/log(maxmag-minmag);
% new_mag=c.*log(1+mag);
% 
% % figure,
% % subplot(1,3,1),imshow(I), title('Original Image')
% % subplot(1,3,2),imshow(F), title('FFT Original Image')
% % subplot(1,3,3),imshow(uint8(new_mag)), title('FFTSHIFT Original Image')
% 
% 
% % figure,imshow(C),title('Circle, High Pass Ideal')
% % Se multiplica la transfomada de la imagen por el filtro
% % ideal
% Fil=b.*c; % Se
% %Multiplica elemento a elemento
% % SE aplica la DFT inversa
% Ifil=ifft2(Fil);
% % Se toma el modulo para descartar cualquier residuo de
% %tipo complejo
% Ifil=abs(Ifil);
Bttb=uint8(Bttb);


[nf,nc]=size(Bttb);


%FFT computing
bt=fft2(Bttb);
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
mi=min(min(result)); %minimo de la imagen
ma=max(max(result)); %maximo de la imagen
I2 = (result-mi)./(ma-mi); 
% figure,imshow(I2)
A=I2;
% Filtro maximo
filtro=ordfilt2(A,9,ones(3,3));
%figure,imshow(filtro)
% median filter
mf= ordfilt2(A,5,ones(3,3));
% figure,imshow(mf)

% MOSTRAR A VER QUE DICEN
% J = filter2(fspecial('sobel'),mf);
% K = mat2gray(J);
% figure, imshow(K.*filtro)

ajus = imadjust(mf,stretchlim(I,[.02 .80]),[]);
s = imadjust(ajus,stretchlim(ajus),[]);
k1 = medfilt2(s, [3, 3], 'symmetric');

g = log(2+double(k1));
g1 = mat2gray(g);
g2 = im2uint8(g1);
g2 = uint8(g2);

fsp = fspecial('gaussian', [3 3] ,0.5);
er = imfilter(g2,fsp);

gh=medfilt2(er,[9 9]);
figure,imshow(gh);