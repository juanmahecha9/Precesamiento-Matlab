function [I1] =mediana(I)
[H W]=size(I);
I1=I;
for i=2:1:H-1
    for j=2:1:W-1
    I1(i,j)=median(median(sort(I(i-1:i+1,j-1:j+1)))); %sort = ordenar
        %mediana de la mediana ordenada en las vecindades al rededor del
        %pixel central
    end
end

