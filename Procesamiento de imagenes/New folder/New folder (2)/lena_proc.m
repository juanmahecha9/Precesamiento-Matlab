%Programado por: Yelinna Pulliti Carrasco
%en lo posible sin usar funciones de Matlab (asi es mas facil pasarlo a
%otros lenguajes)
%este programa aplica el filtrado de mediana
% la función "bordes" realiza la convolición
%http://toyscaos.tripod.com/eam.html 

clc;
clear all;

A=imread('lena2','bmp');
A=double(A);
[f c]=size(A);
temp=0;
H=zeros(1,9);

for i=1:3:f
    for j=1:3:c
    n=1;
        
        for k=0:2
            for l=0:2
                
                if i+k>f || j+l>c
                    break;
                else
            H(n)=A(i+k,j+l);
            n=n+1;
                end;
                
            end;
        end;
        
        %%%%%
        
        for k=1:8
            for l=k+1:9
              if H(k)<H(l)
              temp=H(k);
              H(k)=H(l);
              H(l)=temp;
              end;
            end;
        end;
        %%%%%
        
        for k=0:2
            for l=0:2
                
                if i+k>f || j+l>c
                    break;
                else
                A(i+k,j+l)=H(5);            
                end;
                
            end;
        end;
        
        %%%%%
                               
    end;
end;

%aplicando filtrado de media (promediado)

h=[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
A3=bordes(A,h);

A2=imread('lena2','bmp');

figure(1)
subplot(1,3,1)
imshow(A2)
title('original image')
subplot(1,3,2)
imshow(uint8(A))
title('image after median filtering')
subplot(1,3,3)
imshow(uint8(A3))
title('image after median and mean filtering')
