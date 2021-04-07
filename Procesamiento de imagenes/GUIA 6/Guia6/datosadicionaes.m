%Valor medio de brillo
v=0;
CC=double(CC);
for i=1:1:m1
    for j=1:1:n1
        v=CC(i,j)+v;
    end
end
vm=v/(m*n);


%promedio de los datos de la matriz
f=0;
Prom=0; %media aritmetica
CC=double(CC);
for i=1:1:m1
    for j=1:1:n1
        f=(CC(i,j)+f);
    end
end
Prom=f/(m*n); %Miu

%desviacion estandar y varianza
V=0; 
CC=double(CC);
for i=1:1:m1
    for j=1:1:n1
       V=((CC(i,j)-Prom).^2)+V; %sumatoria de datos
    end
end
Varianza=V/((m*n)-1); %Varianza de matriz (sigma^2)
Desvest=sqrt(Varianza); % Desviacion estandar (sigma)


% Funcion densidad de borde
Sob=dectsobel(I);
ot=otsu(Sob);
FDB=Binarizacion(Sob,ot);