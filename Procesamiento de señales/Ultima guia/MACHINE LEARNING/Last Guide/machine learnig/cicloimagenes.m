clc
close all
clear all
warning off


%% Imagenes Normales

pad=('F:\PDI\Last Guide\machine learnig\Data set\masas roi'); %direction of the folder that contains the images.
cd(pad)                                   % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensi?n.
     
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
       
    Io = prepro(I);
    
    % Caracteristica de tama?o
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

% 
% %% Imagenes Con Masas
% 
% pad1=('F:\PDI\Last Guide\machine learnig\Data set\masas roi'); %direction of the folder that contains the images.
% cd(pad1)                                   % set the actual path.
% imagenes1=dir(fullfile(pad1,'*.png')); % search all files with the .png extensi?n.
%      
% for j=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
%     nombre1=imagenes1(j).name;
%     I1=imread(nombre1);
%     
%     Io1=adapthisteq(I1);
%     
%     [LBP1,m1] = LBP1(Io1);
%     figure(j),
%     
%     Hima1=HaralickTF(LBP1,1);5
%     Haralick1(j,1:15)=Hima1;
%    
%     subplot(131),imshow(Io1);
%     subplot(132),imshow(LBP1);
%     subplot(133),bar(m1);
% end
% 
