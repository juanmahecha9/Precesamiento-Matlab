clc
close all
clear all
warning off


%% Imagenes Normales

pad=('J:\PDI\Ultima guia\MACHINE LEARNING\masas roi'); %direction of the folder that contains the images.
cd(pad)                                   % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.
     
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    I=imread(nombre);
       
    Io = prepro(I);
    [LBP,m]=LBPfunction(Io);
    m1=m(1);
    m2=m(2);
    m3=m(3);
    m4=m(4);
    m5=m(5);
    m6=m(6);
    m7=m(7);
    m8=m(8);
    figure(i),
    subplot(131),imshow(I),title('Original image');
    subplot(132),imshow(LBP,[]),title('LBP image');
    subplot(133),bar(m),title('LBP 8');
    set(gcf,'Name','Imagen MASAS') 
    % Caracteristica de tamaño
    img_bn=im2bw(Io,graythresh(Io));
    tam=bwarea(img_bn);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicas=HaralickTF(LBP,0,m1,m2,m3,m4,m5,m6,m7,m8,tam);
    
     sinet=0;
    for indicador=1:1:23
        sinet(indicador)=caracteristicas(indicador+1);
    end
    sinetiqueta=sinet;
    
    Vector(i,1:24)=caracteristicas; % Vector que contiene el punto 1 y 2
    Vectorsine(i,1:23)=  sinetiqueta;
end
masasprom=mean(Vector);
masasprimsine=mean(Vectorsine);



pad1=('J:\PDI\Ultima guia\MACHINE LEARNING\normal roi'); %direction of the folder that contains the images.
cd(pad1)                                   % set the actual path.
imagenes1=dir(fullfile(pad1,'*.png')); % search all files with the .png extensión.

for j=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
    nombre1=imagenes1(j).name;
    I1=imread(nombre1);
       
    Io1 = prepro(I1);
    [LBP1,m1]=LBPfunction(Io1);
    m11=m1(1);
    m21=m1(2);
    m31=m1(3);
    m41=m1(4);
    m51=m1(5);
    m61=m1(6);
    m71=m1(7);
    m81=m1(8);
    figure(j),
    subplot(131),imshow(I1),title('Original image');
    subplot(132),imshow(LBP1,[]),title('LBP image');
    subplot(133),bar(m1),title('LBP 8');
    set(gcf,'Name','Imagen NORMAL') 
    % Caracteristica de tamaño
    img_bn1=im2bw(Io1,graythresh(Io1));
    tam1=bwarea(img_bn1);
% la funcion asiga los valores como: 
% etiqueta, area,etiqueta,14 de haralick
    caracteristicas1=HaralickTF(LBP1,1,m11,m21,m31,m41,m51,m61,m71,m81,tam1);
   
    %quitar etiqueta
    sinet1=0;
    for indicador1=1:1:23
        sinet1(indicador1)= caracteristicas1(indicador1+1);
    end
    sinetiqueta1=sinet1;
    Vector1(j,1:24)=caracteristicas1;
    Vectorsine1(j,1:23)=sinetiqueta1;
    
    
end


