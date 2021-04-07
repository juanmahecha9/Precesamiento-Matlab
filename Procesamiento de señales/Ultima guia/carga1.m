clear all
close all
clc
pad=('J:\PDI\Ultima guia\MACHINE LEARNING\masas roi');  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    Ib=imread(nombre); 
    [VCK,x,y]=funcionlbp(Ib);
    gtb=graycomatrix(VCK);
    b(:,i)= haralickTextureFeatures(gtb,1:14);
    
    
end
b=b';
media=mean(b);
% figure,
% imshow(VCK,[]);
% figure,
% bar(x,y);