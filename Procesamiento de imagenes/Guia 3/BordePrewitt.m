function P = BordePrewitt(Im)
imD = double(Im);
radio=1;
%el operador de Prewitt usa mascarilla de 3x3=>radio=1
matriz = RefMatriz(imD,radio);
[f,c] = size(matriz);
for i=1+radio:(f-radio)
for j=1+radio:(c-radio)
sumfil=(matriz(i+radio,j-radio)+matriz(i+radio,j)+matriz(i+radio,j+radio))-(matriz(i-radio,j-radio)+matriz(i-radio,j)+matriz(i-radio,j+radio));
sumcol=(matriz(i-radio,j+radio)+matriz(i,j+radio)+matriz(i+radio,j+radio))-(matriz(i-radio,j-radio)+matriz(i,j-radio)+matriz(i+radio,j-radio));
G(i-radio,j-radio)=fix(sumfil+sumcol);
end
end
N=Negativo(G);
P=N;
