function lowpass(I,centro)

[M,N]=size(I);

% if  ((-1)^M) == 1 & ((-1)^N) == 1
%     I=A;
% elseif ((-1)^M) == 1 & ((-1)^N) == -1
%     I = imresize(A,[M,N+1]);
% elseif ((-1)^M) == -1 & ((-1)^N) == 1
%     I = imresize(A,[M+1,N]);
% elseif ((-1)^M) == -1 & ((-1)^N) == -1
%     I = imresize(A,[M+1,N+1]);
% end

%crear objeto
a=round(M/2);
b=round(N/2);
for x=1:M;
    for y=1:N;
        D(x,y)=(centro-sqrt((x-a)^2+(y-b)^2));
    end
end
D=uint8(D);
L=graythresh(D);
C=im2bw(D,L);
C=double(C);

%Fourier Transform
F=fft2(I);%saca la transformada de fourier
Vq=F;
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

figure,
subplot(1,3,1),imshow(I), title('Original Image')
subplot(1,3,2),imshow(F), title('FFT Original Image')
subplot(1,3,3),imshow(uint8(new_mag)), title('FFTSHIFT Original Image')


figure,imshow(C),title('Circle, Low Pass Ideal')
% Se multiplica la transfomada de la imagen por el filtro
% ideal
Fil=b.*C; % Se
%Multiplica elemento a elemento
% SE aplica la DFT inversa
Ifil=ifft2(Fil);
% Se toma el modulo para descartar cualquier residuo de
%tipo complejo
Ifil=abs(Ifil);
Ifil=uint8(Ifil);
figure,
subplot(1,2,1),imshow(Ifil),title('Filtered Image using Low Pass Ideal')
subplot(1,2,2),imshow(I),title('Original Image')



