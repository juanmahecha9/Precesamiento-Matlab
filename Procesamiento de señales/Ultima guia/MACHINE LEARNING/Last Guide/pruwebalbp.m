clear all;  
close all; 
clc;
%%

I=imread('Lena.png');
I=rgb2gray(I);
figure,imshow(I)   


%%
I=double(I);%convertir imagenen en double

[H,W]=size(I); %Tamanho de la imagen
Iout=0; %Imagen de salida

for i=2:1:H-1 %limite del for
    for j=2:1:W-1 %Limite del for
        
        Iout(i+1,j+1)=sum(sum(I(i-1:i+1,j-1:j+1)));
       
            if Iout(k)>I(i,j)
                I1=1;
            else
                I1=0;
          
        end
    end
end
I1=uint8(I1);

figure,imshow(I1)
