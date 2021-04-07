clc
close all
clear all
warning off


%% Imagenes Normales

pad=('C:\Users\juanm\Desktop\MACHINE LEARNING\masas roi'); %direction of the folder that contains the images.
cd(pad)                                   % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.
     
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
       
    Io = prepro(I);
    figure(i),
    
    % Caracteristica de tamaño
    img_bn=im2bw(Iou,graythresh(Io));
    A=bwarea(img_bn);
  
    Sali(i)=A;
%     [LBP,H] = LBP1(Io);
%     figure(i),
%     
%     Hima=HaralickTF(LBP,0);
%     Haralick(i,1:15)=Hima;
%    
%     subplot(131),imshow(Io);
%     subplot(132),imshow(LBP,[]);
%     subplot(133),bar(H);
    
    
end
