function imgLimpia=LimpiarImagen(S)
imshow(S);
%Pasaje de la imagen a blanco y negro
S2 = im2bw(S,0.97);
imshow(S2)
%Se invierten los colores de la imagen
S3=~S2;
imshow(S3)
%Se eliminan los píxeles huérfanos
S4 = bwareaopen(S3,40);
imshow(S4)
%Rellena la imagen
S5 = imfill(S4,'holes'); 
imshow(S5)
imgLimpia=S5;
end

