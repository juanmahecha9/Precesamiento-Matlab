function [Iout] =fmask(I,Mask)

I=double(I);%convertir imagenen en double
[H,W]=size(I); %Tamanho de la imagen
[f,c]=size(Mask);
M=[]; %Matriz de salida
Iout=0; %Imagen de salida
for i=2:1:H-1 %limite del for
    for j=2:1:W-1 %Limite del for
        M=I(i-1:i+1,j-1:j+1).*Mask(1:f,1:c);        
        Iout(i,j)=sum(sum(M));
    end
end
Iout=uint8(Iout);
end


