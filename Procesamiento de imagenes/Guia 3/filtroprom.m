function S = filtroprom(imagen,tam,const)

%tam es tamaño de la mascara, const es una constante
im=imread(imagen);
imD = double(im);
radio = (tam-1)/2;
matriz = RefMatriz(imD,radio)
[f,c] = size(matriz);
for i=(1+radio):(f-radio)
for j=(1+radio):(c-radio)
max=matriz(i,j)+const;
min=matriz(i,j)-const;
suma=0;
cont=0;
for a=(i-radio):(i+radio)
for b=(j-radio):(j+radio)
if((matriz(a,b)<=max)&&(matriz(a,b)>=min))
suma=suma+matriz(a,b);
cont=cont+1;
end
end
end    
G(i-radio,j-radio)=fix(suma/cont);
end
end           
S=G;
