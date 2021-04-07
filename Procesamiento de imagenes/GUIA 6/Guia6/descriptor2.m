function [Pa]=descriptor2(I)
pad=('E:\PDI\Guia6'); %direction of the folder that contains the images.
cd(pad)  
load('mediabarrado.mat')
for n=1:1:10
X(1,1:14)=Hd;
X(1,1:14)=I(n,1:14);
P=sqrt((sum(X(1,:)-X(2,:)).^2));
Pa(1,n)=P;
end
pad=('E:\PDI\Guia6'); %direction of the folder that contains the images.
cd(pad)  
load('mediamariposeo.mat')
for n=1:1:10
X(1,1:14)=Hdma;
X(2,1:14)=I(n,1:14);
P=sqrt((sum(X(1,:)-X(2,:)).^2));
Pa(2,n)=P;
end
pad=('D:\Daniel\UMB\Octavo\PDI\textUAN\Divididas\Error\Mancha'); %direction of the folder that contains the images.
cd(pad)  
load('mediamancha.mat')
for n=1:1:10
X(1,1:14)=Hdm;
X(2,1:14)=I(n,1:14);
P=sqrt((sum(X(1,:)-X(2,:)).^2));
Pa(3,n)=P;
end
pad=('D:\Daniel\UMB\Octavo\PDI\textUAN\Divididas\Error\Mota Tejida'); %direction of the folder that contains the images.
cd(pad)  
load('mediamota.mat')
for n=1:1:10
X(1,1:14)=Hdmo;
X(2,1:14)=I(n,1:14);
P=sqrt((sum(X(1,:)-X(2,:)).^2));
Pa(4,n)=P;
end
pad=('D:\Daniel\UMB\Octavo\PDI\textUAN\Divididas\Error\Pique'); %direction of the folder that contains the images.
cd(pad)  
load('mediapique.mat')
for n=1:1:10
X(1,1:14)=Hdp;
X(2,1:14)=I(n,1:14);
P=sqrt((sum(X(1,:)-X(2,:)).^2));
Pa(5,n)=P;
end
end