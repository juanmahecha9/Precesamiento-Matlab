%Erosion
clc
clear all
close all

I1=imread('guia3.png');
I=imread('watershed.png');

s=strel('square',3);
E1=imerode(I,s);


%% En imagen otsu
w=[1 1 1;1 1 1;1 1 1]; %Objeto
[W H]=size(I);
for i=1:1:W
    for j=1:1:H
        if I(i,j)==255
            E(i,j)=1;
        else
            E(i,j)=0;
        end
    end
end

% for x=2:1:W-1
%     for y=2:1:H-1
%         %tipo de convolucion en un boundary de 3x3 guardando la informacion
%         %en vectores.
%          a1=[w(1)*I(x-1,y-1) w(2)*I(x-1,y) w(3)*I(x-1,y+1) w(4)*I(x,y-1) w(5)*I(x,y) w(6)*I(x,y+1) w(7)*I(x+1,y-1) w(8)*I(x+1,y) w(9)*I(x+1,y+1)];
%          A1(x,y)=min(a1); %Erosion
%     end
% end
% 
% [f g]=size(A1);
% %multiplicacion punto a punto
% for i=1:1:f
%     for j=1:1:g
%         if A1(i,j)==255
%             G(i,j)=1;
%         else
%             G(i,j)=0;
%         end
%     end
% end
Ier=erosionar(W,H,E);
[f c]=size(Ier);
%multiplicacion punto a punto


for i=1:1:f-1
    for j=1:1:c-1
        D(i,j)=I1(i,j).*Ier(i,j);
    end 
end

figure,
subplot(1,2,1),imshow(I1),title('Imagen en escala de grises')
subplot(1,2,2),imshow(I),title('Binarizacion wahtershed')
figure,
subplot(1,2,1),imshow(Ier),title('Erosion Watershed')
subplot(1,2,2),imshow(E1),title('Erosion por funcion de matlab watershed')
figure,
subplot(1,2,1),imshow(I1),title('Imagen Original en gris')
subplot(1,2,2),imshow(D),title('Multiplicacion punto a punto Watershed')

