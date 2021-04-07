a=imread('855.jpeg');
%help zeros
figure(1)
imshow(a); %Primer comando para mostrar imagenes
figure(2)
image(a);  %Segundo comando para mostar imagenes
           %SIZE = Filas, COLUMNAS , (CANALES)
           %       (Y)     (X) EN LA IMAGEN  
    
ar=a(:,:,1);%asiganar algunos elementos de la matriz
            %color rojo
ag=a(:,:,2);%asiganar algunos elementos de la matriz
            %color verde
ab=a(:,:,3);%asiganar algunos elementos de la matriz
            %color azul
%Nota, la suma de los nuevos vectores o matrices, da el total de
    %bytes de la imagen original.
    
   
           

