clc
close all
clear all
warning off


%% Imagenes Normales

pad=('J:\PDI\Ultima guia\MACHINE LEARNING\imagenes'); %direction of the folder that contains the images.
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
%     figure(i),
    AA = cvpartition(length(imagenes),'kfold',15);
%     subplot(131),imshow(I),title('Original image');
%     subplot(132),imshow(LBP,[]),title('LBP image');
%     subplot(133),bar(m),title('LBP 8');
%     set(gcf,'Name','Imagen MASAS') 
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