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
   
    % List out the category values in use.
categories = [0; 1];

% Get the number of vectors belonging to each category.
vecsPerCat = getVecsPerCat(1, 0, categories);

% Compute the fold sizes for each category.
foldSizes = computeFoldSizes(vecsPerCat, 10);

% Randomly sort the vectors in X, then organize them by category.
[X_sorted, y_sorted] = randSortAndGroup(0, 1, categories);

% For each round of cross-validation...
for (roundNumber = 1 : length(imagenes))

% Select the vectors to use for training and cross validation.
[X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted, y_sorted, categories, vecsPerCat, foldSizes, roundNumber);

% Train the classifier on the training set, X_train y_train
% .....................

% Measure the classification accuracy on the validation set.
% .....................

end
    
end

