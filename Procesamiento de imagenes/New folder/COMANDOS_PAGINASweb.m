
%% PAGINA 
%http://es.slideshare.net/lonely113/procesamiento-digital-de-imgenes-con-matlab

% TRATAMIENTO DE IMAGENES
 % http://www2.elo.utfsm.cl/~elo328/pdf1dpp/PDI09_Frecuencia_1dpp.pdf
%% COMANDOS PARA PROCESAR IMAGENES
imagen=imread('nombre.extension');

% EN MATLAB UNA IMAGEN SE ENCUENTRA EN FORMATOS DE COLOR RGB
im_r=imagen(:,:,1); %color rojo
im_g=imagen(:,:,2); %color verde
im_b=imagen(:,:,3); %color azul

%OBTENCION DEL TAMAÑO DE LA IMAGEN
[M,N,P]=SIZE(IM_RGB);

%MOSTRAR IMAGEN
IMSHOW(IMAGEN)

%ESCRITURA DE IMAGENES
IMWRITE(IMAGEN,'NOMBRE.EXTENSION');
