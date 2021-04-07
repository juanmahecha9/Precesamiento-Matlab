% EJEMPLOS DE PROCESAMIENTO DE IMAGENES

%funcion para leer una imagen 
 f = imread ('maga-oscura.jpg');
 
 cmap = rgb2hsv(f);
 G = f(:,:,2);
 Y = gamma(cmap);
imshow(Y)

 
 
 
% %sACAR COMPONENTES EN COLORES 
% Im_R = f(:,:,1);
% Im_G = f(:,:,2);
% Im_B = f(:,:,3);
% 
% %M = número de filas, N = número de columnas
% [M,N] = size (f);
% 
% %Muestra la imagen f en pantalla donde G especifica el rango de intensidades. Si
% %omitimos G, se muestra la imagen con 256 niveles de gris por defecto.
% figure,
% imshow(Im_R);
% 
% %Transforamcion gamma, valores en intencidad de la imagen
% figure,
%g=imadjust(f,[0,1],[1,0]);
