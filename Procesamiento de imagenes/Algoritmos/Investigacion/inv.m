clc
clear all
close all

IM=imread('F.png');
subplot(2,2,1);imshow(IM);
%Elemento Estructurante
B=[0 1 0;1 1 1;0 1 0];
%Dilatación 4 veces
IM2=imdilate(IM,B);IM2=imdilate(IM2,B);
IM2=imdilate(IM2,B);IM2=imdilate(IM2,B);
subplot(2,2,2);imshow(IM2);
%Borde
BORDE=double(IM2)-double(IM);
subplot(2,2,3);imshow(BORDE);
%FUNCION DE RELLENO
%Se Busca el primer punto al interior del borde
[nf nc]=size(IM);
f=1;
ff=0,
cc=0;
while f<nf
 c=1;
 while c<nc
 if IM(f,c)==1 % Si encuentra un punto termina los ciclos
 ff=f;
 cc=c;
 f=nf;
 c=nc;
 end;
 c=c+1;
 end;
 f=f+1;
end;
IMc=1-BORDE;%Obtiene imagen complemento
X=zeros(nf,nc);
X(ff,cc)=1;%Imagen con punto de partida
Xold=X;
while (1)
 X=double(dilate(X,B));
 X=X.*IMc;
 subplot(2,2,4);imshow(X);
 pause(0.05)
 if Xold==X, break;end;%Detecta si no hay cambios!
 Xold=X;
end;