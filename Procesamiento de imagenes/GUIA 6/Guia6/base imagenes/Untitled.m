clc
close all
clear all
clc
pad=('D:\dataset_distorsion\normal')  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.

for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    
    nombre=imagenes(i).name;
    I=imread(nombre);
    Iout=histeq(I);
    Imshow(Iout,[])
end
