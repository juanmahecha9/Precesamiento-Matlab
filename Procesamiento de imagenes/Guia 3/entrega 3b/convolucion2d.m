function [Iout] =convolucion2d(I,Mask)
I=double(I);%convertir imagenen en double
[H,W]=size(I); %Tamanho de la imagen
[f,c]=size(Mask);
Iout=0; %Imagen de salida
for i=2:1:H-1 %limite del for
    for j=2:1:W-1 %Limite del for
        Iout(i+1,j+1)=sum(sum(I(i-1:i+1,j-1:j+1).*Mask(1:f,1:c)));
    end
end
Iout=uint8(Iout);
end


