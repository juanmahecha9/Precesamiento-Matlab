close all
clc
pad=('C:\Users\kimberly\Documents\octavo\PDI\guia6\test_arc_noise');  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensi�n.
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    Ic=imread(nombre); 
    [VCK,x,y]=funcionlbp(Ic);
    gtb=graycomatrix(VCK);
    b(:,i)= haralickTextureFeatures(gtb,1:14);
end
    b=b';
    media=mean(b);
    figure,
    bar(x,y);
    figure,
    imshow(uint8(VCK),[]);