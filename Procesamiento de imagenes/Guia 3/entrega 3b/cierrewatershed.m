%Cierre de la imagen binaria
clc
clear all
close all

%I1=imread('guia3.png');
I1=imread('guia3.png');

%figure(1),imshow(I1),title('Original Image')

I=imread('watershed.png');
figure,imshow(I),title('Binarizacion watershed')

B=[  1 0 1
     0 0 0
     1 0 1
    ];

% ero=imerode(I,B); %Usando la funcion de matlab
% figure,imshow(ero),title('Funcion Imerode Matlab')
%Erosion de la dilatacion es cierre
w=[1 1 1;1 1 1;1 1 1]; %Objeto
[W H]=size(I);
for x=2:1:W-1
    for y=2:1:H-1
        %tipo de convolucion en un boundary de 3x3 guardando la informacion
        %en vectores.
         a1=[w(1)*I(x-1,y-1) w(2)*I(x-1,y) w(3)*I(x-1,y+1) w(4)*I(x,y-1) w(5)*I(x,y) w(6)*I(x,y+1) w(7)*I(x+1,y-1) w(8)*I(x+1,y) w(9)*I(x+1,y+1)];
         A1(x,y)=max(a1); %Erosion
    end
end

[p1,p2]=size(A1);
% w=[1 1 1;1 1 1;1 1 1]; %Objeto
% [W H]=size(I);
% for x=2:1:p1-1
%     for y=2:1:p2-1
%         %tipo de convolucion en un boundary de 3x3 guardando la informacion
%         %en vectores.
%          a2=[w(1)*Ero(x-1,y-1) w(2)*Ero(x-1,y) w(3)*Ero(x-1,y+1) w(4)*Ero(x,y-1) w(5)*Ero(x,y) w(6)*Ero(x,y+1) w(7)*Ero(x+1,y-1) w(8)*Ero(x+1,y) w(9)*Ero(x+1,y+1)];
%          A2(x,y)=min(a2); %Erosion
%     end
% end
for i=1:1:W-1
    for j=1:1:H-1
        if A1(i,j)==255
            Ero(i,j)=1;
        else
            Ero(i,j)=0;
        end
    end
end

AT=erosionar(p1,p2,Ero);
s=strel('square',3);
O=imclose(I,s);

%multiplicacion punto a punto


for i=1:1:p1-1
    for j=1:1:p2-1
        D(i,j)=I1(i,j).*AT(i,j);
    end 
end


figure,
subplot(1,2,1),imshow(Ero),title('Cierre watershed')
subplot(1,2,2),imshow(O),title('Cierre por funcion de matlab watershed')

figure,
subplot(1,2,1),imshow(I1),title('Imagen Original en gris')
subplot(1,2,2),imshow(D),title('Multiplicacion punto a punto watershed')
