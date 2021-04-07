

%%
%Histograma de la imagen
Hi=zeros(1,H); % vector fila inicializado en ceros
for i=1:1:H% limit on the reduced matrix in factor 2
    for j=1:1:W
       Hi(I(i,j)+1)=Hi(I(i,j)+1)+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
                                      %Buscar los pixeles en valor 0 
    end
end

figure(2),
subplot(1,2,1),imhist(I),title('Used a function'),ylabel('Frecuency')
subplot(1,2,2),stem(Hi),title('Algorithm'),ylabel('Frecuency')
Y=max(Hi);
