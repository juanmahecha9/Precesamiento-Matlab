clc
close all
clear all
warning off

pad=('E:\PDI\Guia6'); %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.tiff')); % search all files with the .png extensi�n.
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
    Iout=histeq(I);
    Iout2=double(Iout);
    Ihb=conv2(Iout2,Mask2);
    Co=graycomatrix(double(abs(Ihb)));
    Hi=haralickTextureFeatures(Co,1:14);
    Hip(i,1:14)=Hi;
end
Hdp=mean(Hip);
save('mediapique.mat','Hip','Hdp')