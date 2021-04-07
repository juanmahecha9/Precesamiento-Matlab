function procesamiento()
%Se carga la imagen
S=imread('im.png');
imshow(S);

%Se convierte la imagen a escala de grises
S1=rgb2gray(S);
imshow(S1);

%Se convierte la imagen a blanco y negro
%Se muestran los resultados para diferentes tolerancias
S2 = im2bw(S,0.9);
imshow(S2)

S2 = im2bw(S,0.5);
imshow(S2)

S2 = im2bw(S,0.2);
imshow(S2)


%Se invierten los colores de la imagen
S3=~S2;
imshow(S3)
%Se eliminan los píxeles huérfanos
%Se muestran los resultados para diferentes tolerancias
S4 = bwareaopen(S3,10);
imshow(S4)
S4 = bwareaopen(S3,200);
imshow(S4)
S4 = bwareaopen(S3,1000);
imshow(S4)
end