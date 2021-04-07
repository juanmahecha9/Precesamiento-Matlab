clc
close all
clear all
warning off
%% Todas las Imagenes 
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
        % Caracteristica de tamaño
    img_bn=im2bw(Io,graythresh(Io));
    tam=bwarea(img_bn);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicas=HaralickTF(LBP,2,m1,m2,m3,m4,m5,m6,m7,m8,tam);
        
     sinet=0;
    for indicador=1:1:23
        sinet(indicador)=caracteristicas(indicador+1);
    end
    sinetiqueta=sinet;
    
    Vector(i,1:24)=caracteristicas; % Vector que contiene el punto 1 y 2
    Vectorsine(i,1:23)=  sinetiqueta;
   
    
end
%%%%%%%%
%%
%%
%%%%%%%



padx=('J:\PDI\Ultima guia\MACHINE LEARNING\imagenes'); %direction of the folder that contains the images.
cd(padx)                                   % set the actual path.
imagenesx=dir(fullfile(padx,'*.png')); % search all files with the .png extensión.
     
for i=1:1:(12) %use each IMAGE OF THE COLLECTION.
    
    nombrex=imagenesx(i).name;
    Ix=imread(nombrex);
       
    Iox = prepro(Ix);
    [LBPx,mx]=LBPfunction(Iox);
    mx1=mx(1);
    mx2=mx(2);
    mx3=mx(3);
    mx4=mx(4);
    mx5=mx(5);
    mx6=mx(6);
    mx7=mx(7);
    mx8=mx(8);
        % Caracteristica de tamaño
    img_bnx=im2bw(Iox,graythresh(Iox));
    tamx=bwarea(img_bnx);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx=HaralickTF(LBPx,2,mx1,mx2,mx3,mx4,mx5,mx6,mx7,mx8,tamx);
        
     sinetx=0;
    for indicador=1:1:23
        sinetx(indicador)=caracteristicasx(indicador+1);
    end
    sinetiquetax=sinetx;
    
    Vectorx(i,1:24)=caracteristicasx; % Vector que contiene el punto 1 y 2
    Vectorsinex(i,1:23)=  sinetiquetax;
   
    
end
prom1=mean(Vectorsinex);

for i=12:1:24 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom2=mean(Vectorsinex1);

for i=24:1:36 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom3=mean(Vectorsinex1);

for i=36:1:48 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom4=mean(Vectorsinex1);

for i=48:1:60 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom5=mean(Vectorsinex1);
for i=60:1:72 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom6=mean(Vectorsinex1);

for i=72:1:84 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom7=mean(Vectorsinex1);

for i=84:1:96 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom8=mean(Vectorsinex1);

for i=96:1:108 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom9=mean(Vectorsinex1);

for i=108:1:120 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom10=mean(Vectorsinex1);
for i=120:1:131 %use each IMAGE OF THE COLLECTION.
    
    nombrex1=imagenesx(i).name;
    Ix1=imread(nombrex1);
       
    Iox1 = prepro(Ix1);
    [LBPx1,mx1]=LBPfunction(Iox1);
    mx11=mx1(1);
    mx12=mx1(2);
    mx13=mx1(3);
    mx14=mx1(4);
    mx15=mx1(5);
    mx16=mx1(6);
    mx17=mx1(7);
    mx18=mx1(8);
    
    % Caracteristica de tamaño
    img_bnx1=im2bw(Iox1,graythresh(Iox1));
    tamx1=bwarea(img_bnx1);
% la funcion asiga los valores como: 
% etiqueta, area,8 lbp,14 de haralick
    caracteristicasx1=HaralickTF(LBPx1,2,mx11,mx12,mx13,mx14,mx15,mx16,mx17,mx18,tamx1);
        
     sinetx1=0;
    for indicador=1:1:23
        sinetx1(indicador)=caracteristicasx1(indicador+1);
    end
    sinetiquetax1=sinetx1;
    
    Vectorx1(i,1:24)=caracteristicasx1; % Vector que contiene el punto 1 y 2
    Vectorsinex1(i,1:23)=  sinetiquetax1;
    
                  
end
prom11=mean(Vectorsinex1);

    
    entrenamiento(1,1:23)=prom1;
    entrenamiento(2,1:23)=prom2;
    entrenamiento(3,1:23)=prom3;
    entrenamiento(4,1:23)=prom4;
    entrenamiento(5,1:23)=prom5;
    entrenamiento(6,1:23)=prom6;
    entrenamiento(7,1:23)=prom7;
    entrenamiento(8,1:23)=prom8;
    entrenamiento(9,1:23)=prom9;
    entrenamiento(10,1:23)=prom10;
    entrenamiento(11,1:23)=prom11;





