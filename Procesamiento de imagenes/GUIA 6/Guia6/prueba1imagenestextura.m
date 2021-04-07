clc
clear all
close all
warning off



clc
close all
clear all
clc
pad=('E:\PDI\Guia6\textura')  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.

for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    
    nombre=imagenes(i).name;
    I=imread(nombre);
    I=uint8(I);
    
  Haralick=HaralickTF(I);  
    
end


%funcion Haralick
% Haralick=HaralickTF();