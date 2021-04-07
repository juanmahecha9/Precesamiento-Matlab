% ecualizacion adaptiva
% La ecualización adaptativa de histograma (AHE) es una técnica de 
% procesamiento de imágenes por computadora que se utiliza para mejorar 
% el contraste en las imágenes. 

% Inicio de la funcion

function [Y]=adaptiva(I)
if std2(I) <1
Y=ones(size(I,1),size(I,2));
else 
Y=im2bw(I,graythresh(I));
end

% es equivalente a la la funcion adapthisteq 
% dentro de otra guia esta la fincion de equualizacion que es histeq