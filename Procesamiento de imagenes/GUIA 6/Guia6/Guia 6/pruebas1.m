clc
close all
clear all

pad=('D:\Daniel\UMB\Octavo\PDI\textUAN\Divididas\Error\Barrado'); %direction of the folder that contains the images.
% cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.jpg')); % search all files with the .png extensión.
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
    Iout=histeq(rgb2gray(I));
    Iout2=double(Iout);
    Ihb=conv2(Iout2,Mask2);
    Co=graycomatrix(double(abs(Ihb)));
    Hi=haralickTextureFeatures(Co,1:14);
    Hia(i,1:14)=Hi;
end
Hd=mean(Hia);
save('mediabarrado.mat','Hia','Hd')
% figure, imshow(uint8(I))
% figure, imshow(uint8(Iout2))
% figure, imshow(abs(Ihb),[])
