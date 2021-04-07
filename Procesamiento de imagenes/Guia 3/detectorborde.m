
clc
clear all
close all
I=imread('lenag.png'); %Imagen original
[H W]=size(I);

%%
%Filtro roberts:
%por ciclo For
% for i=1:1:H-1
%     for j=1:1:W-1
%         I1(i,j)=I(i+1,j+1)-I(i,j); %filtro pasa altos (detector de alta frecuencia)
%     end
% end
% figure,
% subplot(1,2,1),imshow(I)
% subplot(1,2,2),imshow(I1)

%Por mascara
% Gradiente Horizontal o fila
R1=[0 0 0
    0 0 1
    0 -1 0]; 
%Gradiente Vertical o columna
R2=[-1 0 0
    0 1 0
    0 0 0];

R3=convolucion2d(I,R1);
R3=double(R3);
R4=convolucion2d(I,R2);
R4=double(R4);

for i=1:1:H
    for j=1:1:W
        RO(i,j)=sqrt((R3(i,j).^2)+(R4(i,j).^2));
    end
end
RO=uint8(RO);
figure,
subplot(1,2,1),imshow(I),title('Imagen Original')
subplot(1,2,2),imshow(RO),title('Imagen Robert')

%%
%Prewitt
% Gradiente Horizontal o fila
P1=[-1 0 1
    -1 0 1
    -1 0 1]; 
%Gradiente Vertical o columna
P2=[-1 -1 -1
    0 0 0
    1 1 1];

P3=convolucion2d(I,P1);
P3=double(P3);
P4=convolucion2d(I,P2);
P4=double(P4);

for i=1:1:H
    for j=1:1:W
        PO(i,j)=sqrt((P3(i,j).^2)+(P4(i,j).^2));
    end
end
PO=uint8(PO);
figure,
subplot(1,2,1),imshow(I),title('Imagen Original')
subplot(1,2,2),imshow(PO),title('Imagen Prewitt')

%%
%Sobel
% Gradiente Horizontal o fila
S1=[-1 0 1
    -2 0 2
    -1 0 1]; 
%Gradiente Vertical o columna
S2=[-1 -2 -1
    0 0 0
    1 2 1];

S3=convolucion2d(I,S1);
S3=double(S3);
S4=convolucion2d(I,S2);
S4=double(S4);

for i=1:1:H
    for j=1:1:W
        SO(i,j)=sqrt((S3(i,j).^2)+(S4(i,j).^2));
    end
end
SO=uint8(SO);
figure,
subplot(1,2,1),imshow(I),title('Imagen Original')
subplot(1,2,2),imshow(SO),title('Imagen Sobel')
