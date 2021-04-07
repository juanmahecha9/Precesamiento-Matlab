%dilatacion
clc
clear all
close all

I1=imread('guia3.png');
I=imread('watershed.png');

s=strel('square',3);
E=imdilate(I,s);



w=[1 1 1;1 1 1;1 1 1]; %Objeto
[W H]=size(I);
for x=2:1:W-1
    for y=2:1:H-1
        %tipo de convolucion en un boundary de 3x3 guardando la informacion
        %en vectores.
         a1=[w(1)*I(x-1,y-1) w(2)*I(x-1,y) w(3)*I(x-1,y+1) w(4)*I(x,y-1) w(5)*I(x,y) w(6)*I(x,y+1) w(7)*I(x+1,y-1) w(8)*I(x+1,y) w(9)*I(x+1,y+1)];
         A1(x,y)=max(a1); %Dilation%
    end
end

[f,g]=size(A1);
%multiplicacion punto a punto
for i=1:1:f
    for j=1:1:g
        if A1(i,j)==255
            G(i,j)=1;
        end
    end
end

for i=1:1:f
    for j=1:1:g
        D(i,j)=I1(i,j).*G(i,j);
    end 
end

figure,
subplot(1,2,1),imshow(I1),title('Imagen en escala de grises')
subplot(1,2,2),imshow(I),title('Binarizacion watershed')
figure,
subplot(1,2,1),imshow(A1),title('Dilatacion a partir de la convolucion watershed')
subplot(1,2,2),imshow(E),title('Dilatacion por funcion de matlab watershed')
figure,
subplot(1,2,1),imshow(I1),title('Imagen Original en gris watershed')
subplot(1,2,2),imshow(D),title('Multiplicacion punto a punto watershed')

