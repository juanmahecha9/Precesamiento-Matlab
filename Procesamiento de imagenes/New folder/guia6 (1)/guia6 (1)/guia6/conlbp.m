clear all
close all
clc
pad=('C:\Users\juan\Documents\kimberly pdi\guia6 (1)\guia6 (1)\guia6\test_arc');  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.

for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    nombre=imagenes(i).name;
    Ib=imread(nombre); 
    [LBP,y]=funcionLBP1(Ib);
       
        if i==1;
           a=[y];
        else 
           a=[a;y];
        end
    
end

cero=ones(78,1);
result=[cero,a];




pad1=('C:\Users\juan\Documents\kimberly pdi\guia6 (1)\guia6 (1)\guia6\test_norm2');  %direction of the folder that contains the images.
cd(pad1)                                              % set the actual path.
imagenes1=dir(fullfile(pad1,'*.png')); % search all files with the .png extensión.
for j=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
    nombre1=imagenes1(j).name;
    Id=imread(nombre1);
    [LBP,y1]=funcionLBP1(Id);
    
        if j==1;
           a1=[y1];
        else 
                a1=[a1;y1];
        end
end

uno1=zeros(81,1);
result1=[uno1 a1];


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

pase=[1;2;4;8;16;32;64;128];
figure,
bar(pase,y1);
figure,
imshow(LBP,[]);