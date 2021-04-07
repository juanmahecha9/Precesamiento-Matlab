
%%
%http://murphylab.web.cmu.edu/publications/boland/boland_node26.html#eqn:cho_g
%http://www.uio.no/studier/emner/matnat/ifi/INF4300/h08/undervisningsmateriale/glcm.pdf
%http://earlglynn.github.io/RNotes/package/EBImage/Haralick-Textural-Features.html
%%
function Haralick=HaralickTF(I,A,mm1,mm2,mm3,mm4,mm5,mm6,mm7,mm8,area)

% figure,imshow(I),title('Original Image');
[m n]=size(I);%Size of the image
%%
%matrix of CO-Relation
CC1= graycomatrix(I);
NormalCC=sum(sum(CC1));
CC = CC1./NormalCC;
DD=CC;
[m1 n1]=size(CC);
Lim=(2*m1);
sizecoOcMat = size(CC);
[col,row] = meshgrid(1:sizecoOcMat(1),1:sizecoOcMat(2));
%%
%Vector of Haralik
Haralick=zeros(1,24);
%%
%the 14 Haralick Texture Features
%%

Haralick(1)=A;
Haralick(2)=area;
% barras del lbp
Haralick(3)=mm1;
Haralick(4)=mm2;
Haralick(5)=mm3;
Haralick(6)=mm4;
Haralick(7)=mm5;
Haralick(8)=mm6;
Haralick(9)=mm7;
Haralick(10)=mm8;
% 1. Angular second moment or Energy 
% www=0; %acumulator
% I=double(I);
% for i=1:1:m1
%     for j=1:1:n1
%         www=((CC(i,j).^2)+www);
%     end
% end

ASM=sum( DD(:).^2 );
Haralick(11)=ASM;

%%
%2. Contrast
matrix = ( abs(row - col).^2 ) .* DD;
            CORR = sum( matrix(:) );

Haralick(13)=CORR;

%%
%% correlacion

%Forma 2
CCT=CC';

miux=mean(mean(CC));
miuy=mean(mean(CCT));

stdx=std(std(CC));
stdy=std(std(CCT));

CORR1=0;
for i=1:1:m1
    for j=1:1:n1
       IJ=i*j;
       CORR1=((((0.5)*DD(i,j))-(miux*miuy)))/(stdx*stdy);
    end
end
CORR=CORR1;
Haralick(13)=CORR;

% 4. Sum of square: VARIANZA
miu1=mean(mean(DD'));
V=0;
VAR=0;
for i=1:m1
    for j=1:n1
         V=(i-miu1).^2;
         VAR=VAR+(V.*DD(i,j));
    end
end
Haralick(14)=VAR;

%%
% 5. Inverse different moment (Homogeneity)
IDM=0;
for i=1:1:m1
    for j=1:1:n1
      ID1=(1+(row(i,j)-col(i,j)).^2);
      ID2=DD(i,j)./ID1;
      IDM=IDM+ID2;
    end
end
Haralick(15)=IDM;

%%
% 6. Sum average
%P(x+y)
PXY=zeros(15,1);
for k=2:1:Lim
    for i=1:m1
        for j=1:n1
            if (i+j)==k            
                PXY(k-1)=DD(i,j)+PXY(k-1);
            end
        end
    end
end

SAV=0;
for i=2:1:16
    SAV=(i*PXY(i-1))+SAV;
end
Haralick(16)=SAV;
%%
% 7. Sum Variance [sva]
PXY=zeros(15,1);
for k=2:1:16
    for i=1:m1
        for j=1:n1
            if (i+j)==k
                PXY(k-1)=DD(i,j)+PXY(k-1);
            end
        end
    end
end
Lim=(2*m1);

SVA=0;
for i=2:1:Lim
    SVA=(((i).^2)*(PXY(i-1)))+SVA;
end
Haralick(17)=SVA;

%%
% 8. Sum Entropy [sen]
SEN1=0;
for i=2:Lim-1
    SEN1=SEN1+(PXY(i-1).*log2((PXY(i))+0.000000000001));
end
SEN=-(SEN1/2);
Haralick(18)=SEN;

%%
% 9. Entropy
del=0.0000000000001;
ENTRO=0;
for i=1:m1
    for j=1:n1
        ENTRO=(DD(i,j).*log2(DD(i,j)+del))+ ENTRO;
    end
end
Haralick(19)=abs(ENTRO);

%%
% 10. Difference of variance DVA
PXYm=zeros(15,1);
for k=1:1:15
    for i=1:m1
        for j=1:n1
            if abs((i-j))==k
                PXYm(k)=DD(i,j)+PXYm(k);
            end
        end
    end
end

DVA=var(PXYm.*10);
Haralick(20)=DVA;


%%
% 11. Difference entropy DEN

DEN=0;
for i=2:1:Lim
    PIX1=(PXYm(i-1));
    DEN1=log2(PXYm(i-1)+0.0000001);
    DEN=DEN+(PIX1*DEN1);
end
DEN=-DEN;
Haralick(21)=DEN;
            
%%
%12.  Information Measures of Correlation I.
% DD=double(DD);
% px=0;
% for i=1:m1
%     for j=1:n1
%         px(j)=DD(i,j);
%     end
% end
px= sum(DD,2); %SUMA DE LAS FILAS

HX=0;
for i=1:m1
    G=px(i);
    X=log(0.00001+G);
    HX(i)=G*X;
end

% py=0;
% for i=1:m1
%     for j=1:n1
%         py(i)=DD(i,j);
%     end
% end
py = sum(DD); %SUMA DE LAS COLUMNAS
HY=0;
for i=1:m1
    G1=px(i);
    X1=log(0.00001+G1);
    HY(i)=G1*X1;
end



HXY1=0;
for i=1:m1
    for j=1:n1
        F1=DD(i,j);
        L=log((px(i)*py(j))+0.000000001);
        HXY1(i,j)=(F1*L);
    end
end
HXY1=-sum(sum(HXY1));

HXY2=0;
for i=1:m1
    for j=1:n1
        F2=DD(i,j);
        L1=log((px(i)*py(j))+0.1);
        HXY2=(px(i)*py(j)*F1*L)+HXY2;
    end
end
HXY2=-HXY2;
IMC1=0;
f12=(ENTRO)-HXY1;
f112=max([HX HY]);
IMC1=sum((f12/f112));

IMC1=sum((f12/f112));
if IMC1== Inf
    IMC1=1;
end
Haralick(22)=1-0.5*DEN;
%%
%13.  Information Measures of Correlation II.
IMC2=0;
f13=(-2)*(HXY2-abs(ENTRO));
f113=1-exp(f13);
IMC2=abs(f113).^(1/2);
Haralick(23)=IMC2/(m1*n1);


%%
%14. Maximal Correlation Coefficient
PT=0;
MCC=0;
for i=1:1:m1
    for j=1:1:n1
        MCC(i)=((DD(i,j))*DD(j,i))./(px(i).*py(j));
    end
end
MCC1=max(MCC);
Haralick(24)=MCC1;
        
