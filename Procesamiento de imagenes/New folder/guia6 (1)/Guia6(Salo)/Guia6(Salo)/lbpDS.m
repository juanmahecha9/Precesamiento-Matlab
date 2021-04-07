clc
close all
clear all
clc
pad=('D:\Usuario de Melissa\Desktop\CM28\UMB\UMB8\PDI\Guia6\test_arc\ciego')  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.

for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    
    nombre=imagenes(i).name;
    I=imread(nombre);
    IO=lbpM(I);
    glcm=graycomatrix(IO);
    K(:,i)=haralickTextureFeatures(glcm,1:14);
    
end
K1=K';
O=ones(24,1);
a=[O K1];


% figure, imshow(I,[])
% figure, imshow(IO,[])
% figure, [x,y]=imhist(uint8(IO));
% bar (y,x);

pad=('D:\Usuario de Melissa\Desktop\CM28\UMB\UMB8\PDI\Guia6\test_norm2')  %direction of the folder that contains the images.
cd(pad)                                              % set the actual path.
imagenes=dir(fullfile(pad,'*.png')); % search all files with the .png extensión.

for i=1:1:length(imagenes) %use each IMAGE OF THE COLLECTION.
    
    nombre=imagenes(i).name;
    I=imread(nombre);
    IO=lbpM(I);
    glcm=graycomatrix(IO);
    Q(:,i)=haralickTextureFeatures(glcm,1:14);
    
end
Q1=Q';
O1=zeros(57,1);
b=[O1 Q1];

V=[a
    b];
V1=Barajar(V);

CVO = cvpartition(V1(:,1),'KFold',10);
Y=[];
Z=[];

for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    datos_train=V1(trIdx,:);%Etiquetar
    datos_test=V1(teIdx,:);%Etiquetar
    Class= knnclassify(datos_test(:,2:size(datos_test,2)), datos_train(:,2:size(datos_train,2)), datos_train(:,1));
    X=datos_test(:,1);
    Y=[Y;X];
    Z=[Z;Class];
    W=classperf(Y,Z);
end

XX=get(W,'DiagnosticTable')