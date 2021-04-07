clear all
close all
clc
pad=('C:\Users\juan\Documents\kimberly pdi\guia6 (1)\guia6 (1)\guia6\test_arc');  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    Ib=imread(nombre); 
    [LBP,VCK]=funcionLBP1(Ib);
    b(:,i)= haralickTextureFeatures(LBP,1:14);
    
end
b=b';
cero=ones(78,1);
result=[cero,b];

%%


pad1=('C:\Users\juan\Documents\kimberly pdi\guia6 (1)\guia6 (1)\guia6\test_norm2');  %direction of the folder that contains the images.
cd(pad1)                                              % set the actual path.
imagenes1=dir(fullfile(pad1,'*.png')); % search all files with the .png extensión.
for j=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
    nombre1=imagenes1(j).name;
    Id=imread(nombre1); 
    [LBP1,VCK1]=funcionLBP1(Id);
    b1(:,j)= haralickTextureFeatures(LBP1,1:14);
end
b1=b1';
uno1=zeros(81,1);
result1=[uno1 b1];


%%

L=[result;result1];
Pa=barajar(L);

CVO = cvpartition(Pa(:,1),'KFold',10);
Y=[];
Z=[];

for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    datos_train=Pa(trIdx,:);%Etiquetar
    datos_test=Pa(teIdx,:);%Etiquetar
    Class= knnclassify(datos_test(:,2:size(datos_test,2)), datos_train(:,2:size(datos_train,2)), datos_train(:,1));
    X=datos_test(:,1);
    Y=[Y;X];
    Z=[Z;Class];
    W=classperf(Y,Z);
end

XX=get(W,'DiagnosticTable');
figure,
imshow(LBP,[]);