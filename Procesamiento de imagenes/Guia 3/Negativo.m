function y=Negativo(imD)

[f,c]=size(imD);

for i=1:f
for j=1:c
nuevaI(i,j)=255-imD(i,j);
end
end
y=nuevaI;