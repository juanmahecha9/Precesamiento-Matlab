clc
clear all
close all


pad=('C:\Users\esteb\Desktop\Guia6(Salo)\test_norm2') 
cd(pad)                                             
imagenes=dir(fullfile(pad,'*.png'));

 
for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    
    nombre=imagenes(i).name;
    I=imread(nombre);
    [X, h]=LBP(nombre);
    A11(:,i)=haralickTextureFeatures1(X,1:14);
        if i==1;
           WW=[h];
        else 
            WW=[WW;h];
        end
        
      
end
A11=A11';
O=ones(81,1);
A=[O A11];



pad1=('C:\Users\esteb\Desktop\Guia6(Salo)\test_arc') 
cd(pad1)                                             
imagenes1=dir(fullfile(pad1,'*.png'));

for j=1:1:length(imagenes1) %use each IMAGE OF THE COLLECTION.
    
    nombre1=imagenes1(j).name;
    I1=imread(nombre1);
    [X1, h1]=LBP(nombre1);
    A1(:,j)=haralickTextureFeatures1(X1,1:14);
        if j==1;
           WW1=[h1];
        else 
            WW1=[WW1;h1];
        end
    
end
A1=A1';
U=zeros(78,1);
B=[U,A1];


VEC=zeros(24,6);
VECTOR=[A;B];

VECT=Barajar(VECTOR);

CVO = cvpartition(VECT(:,1),'KFold',10);
qq=[];
pp=[];

for k = 1:CVO.NumTestSets
    trIdx = CVO.training(k);
    teIdx = CVO.test(k);
    datos_train=VECT(trIdx,:);%Etiquetar
    datos_test=VECT(teIdx,:);%Etiquetar
    Classify= knnclassify(datos_test(:,2:end), datos_train(:,2:end), datos_train(:,1));
    dt=datos_test(:,1);
    qq=[qq;dt];
    pp=[pp;Classify];
    cp=classperf(qq,pp);
end

TablaD=get(cp,'DiagnosticTable')
