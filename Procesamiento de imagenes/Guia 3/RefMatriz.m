function M = RefMatriz(imagen,radio)
imD = double(imagen);
imaux = imD;
M = imD;
[f,c] = size(imagen);
%primero reflejamos las filas superiores
for i=1 : radio
    F  = imaux(i,:);
    M  = [F;M];%le agrego una fila mas 
end
%reflejamos las filas inferiores
cont = 0;
i = f;
while cont<radio %iremos retrocediendo
    F = imaux(i,:);
    M = [M;F];
    cont = cont+1;
    i = i-1;
end
imaux = M; %ahora actualizamos la matriz auxiliar
%ahora reflejamos las columnas 
for i=1 : radio
    C = imaux(:,i);
    M = [C M];
end
cont = 0;
i = c;
while cont<radio
    C = imaux(:,i);
    M = [M C];
    cont = cont+1;
    i = i-1;
end 