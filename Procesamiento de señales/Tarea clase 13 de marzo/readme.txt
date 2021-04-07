clc
clear all
close all

Ie=imread('lena.png');
I=rgb2gray(Ie);

figure,
imshow(I<140),title('Segmentar por histograma');
%Ruido Gaussiano
IRG = imnoise(I,'gaussian',0.003,0.01);
%Ruido Sal y pimienta
IRSP=imnoise(I,'salt & pepper',0.1);
%ruido Speckle
IRM=imnoise(I,'speckle',0.2);

%Guardar imagenes
imwrite(IRG,'RuidoG.png');
imwrite(IRSP,'RuidoSP.png');
imwrite(IRSP,'RuidoM.png');

%Filtrado
%1.Mascara Gaussiana
M1=[1 1 1;1 1 1;1 1 1]./9;
F1=convolucion2d(IRG,M1);
F2=convolucion2d(F1,M1);
F3=convolucion2d(F2,M1);
F4=convolucion2d(F3,M1);
F5=convolucion2d(F4,M1););
F5=uint8(F5);

%2. Mascara sal y pimienta
M2=[1 1 1;1 1 1;1 1 1]./9;
G1=convolucion2d(IRSP,M2);
G2=convolucion2d(G1,M2);
G3=convolucion2d(G2,M2);
G4=convolucion2d(G3,M2);
G5=convolucion2d(G4,M2);
G5=uint8(G5);
%Mascara speckle
M3=[1 1 1;1 1 1;1 1 1]./9;
S1=convolucion2d(IRSP,M2);
S2=convolucion2d(S1,M2);
S3=convolucion2d(S2,M2);
S4=convolucion2d(S3,M2);
S5=convolucion2d(S4,M2);
S5=uint8(S5);

figure,
subplot(2,4,1),imshow(I),title('Imagen original de lena');
subplot(2,4,2),imshow(IRM),title('Ruido Speckle')
subplot(2,4,3),imshow(IRG),title('Ruido Gaussiano')
subplot(2,4,4),imshow(IRSP),title('Ruido Sal y pimienta')
subplot(2,4,6),imshow(S5),title('Filtro speckle')
subplot(2,4,7),imshow(F5),title('filtro gaussiano')
subplot(2,4,8),imshow(G5),title('filtro sal y pimienta')

[H W]=size(I)
for i=1:1:H-1
    for j=1:1:W-1
        I1(i,j)=I(i+1,j+1)-I(i,j); %filtro pasa altos (detector de alta frecuencia)
    end
end
figure,imshow(I1)


%Segmentacion
% B=strel('disk',5);
% E=imdilate(I,B);
%  [W H]=size(I);
% [counts,x]=imhist(I);
% maxcounts = max(counts); 
% h = bar(x,counts); 
% set(h,'FaceColor',[102/255,153/255,102/255],'EdgeColor',[102/255,153/255,102/255]); 
% title 'Histograma Original';
% for i=1:1:H
%      for j=1:1:W
%          if I(i,j)>=50 && I(i,j)<=135
%              I(i,j)==0;
%          end
%      end
% end
%  
% figure,
% imshow(I)