clc
close all
clear all
warning off

%%
pad=('F:\PDI\GUIA 6\Categoria 1'); %direction of the folder that contains the images.
cd(pad)                                   % set the actual path.
imagenes=dir(fullfile(pad,'*.tiff')); % search all files with the .png extensión.
    
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
    Iout=histeq(I);
    Iout1=double(Iout);
    
    Ihb=conv2(Iout1,Mask2);
        
    Hi=HaralickTF(Ihb);
    Hima(i,1:14)=Hi;
end

COVA=cov(Hima);
Hdma=mean(Hima);


%%
pad1=('F:\PDI\GUIA 6\Categoria 2'); %direction of the folder that contains the images.
cd(pad1)                                   % set the actual path.
imagenes1=dir(fullfile(pad1,'*.tiff')); % search all files with the .png extensión.
    
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
    nombre1=imagenes1(i).name;
    II=imread(nombre1);
    IIout=histeq(II);
    IIout1=double(IIout);
    IIhb=conv2(IIout1,Mask2);
        
    Hi1=HaralickTF(IIhb);
    Hima1(i,1:14)=Hi1;
end

COVA1=cov(Hima1);
Hdma1=mean(Hima1);
save('CATEGORIA2.mat','Hdma')


%%
%%
%%
%% MAHALANOBIS
%%
%%
%%


%% Observaciones
pad3=('F:\PDI\GUIA 6\Observacion 1'); %direction of the folder that contains the images.
cd(pad3)                                   % set the actual path.
image1=dir(fullfile(pad3,'*.tiff')); % search all files with the .png extensión.
    
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(image1) %use each IMAGE OF THE COLLECTION.
    nomb1=image1(i).name;
    AA=imread(nomb1);
    AAout=histeq(AA);
    AAout1=double(AAout);
    AAhb=conv2(AAout1,Mask2);
    
    AAha=HaralickTF(AAhb);
    
    % 
    % Begin mahalanobis
    HmM = (AAha-Hdma1'); % Haralick substract mean of class
    HmMT =HmM';
    HmMd= sqrt((HmMT)*(HmM/cov(Hdma1')));
          
    Haralickout1(i,1:14)=AAha;
    Mahalanobis(i,1)=HmMd;
end

figure(1),bar(Mahalanobis),title('Class 1')

% Observacion 1
pad2=('F:\PDI\GUIA 6\Observacion 1'); %direction of the folder that contains the images.
cd(pad2)                                   % set the actual path.
image=dir(fullfile(pad2,'*.tiff')); % search all files with the .png extensión.
    
    A=5;
    Mask=ones(3,3)*(-1/9);
    Mask(2,2)=((9*(A))-1)/9;
    Mask2=Mask;
    Mask2(2,2)=((9*(A+1))-1)/9;
    
for i=1:1:length(image) %use each IMAGE OF THE COLLECTION.
    nomb=image(i).name;
    A=imread(nomb);
    Aout=histeq(A);
    Aout1=double(Aout);
    Ahb=conv2(Aout1,Mask2);
    
    Aha=HaralickTF(Ahb);
    Haralickout(i,1:14)=Aha;
    % 
    % Begin mahalanobis
    HmM1 = (Aha-Hdma'); % Haralick substract mean of class
    HmMT1 =HmM1';
    HmMd1= sqrt((HmMT1)*(HmM1/cov(Hdma')));
          
    Haralickout1(i,1:14)=Aha;
    Mahalanobis1(i,1)=HmMd1;
end
figure(2),bar(Mahalanobis1),title('Class 2')